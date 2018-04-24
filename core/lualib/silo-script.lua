require("mod-gui")
require("util")

function migrate_from_scenario()
  if not global.satellite_sent then return end
  for k, force in pairs (game.forces) do
    local count = global.satellite_sent[force.name]
    if count then
      force.set_item_launched("satellite", count)
      force.rockets_launched = count
    end
  end
  for k, player in pairs (game.players) do
    if player.gui.left.rocket_score then
      player.gui.left.rocket_score.destroy()
    end
    get_sprite_button(player)
  end
end

function migrate(old_version, new_version)
  if not migrations then return end
  log("Running silo script migration: "..old_version.." -> "..new_version)
  repeat
    if migrations[old_version] then
      migrations[old_version]()
    end
    old_version = old_version + 1
  until old_version >= new_version
end

function gui_update(player)
  local gui = mod_gui.get_frame_flow(player).silo_gui_frame
  if not gui then return end
  gui.clear()
  local items = game.item_prototypes
  local launched = player.force.items_launched
  local any = false
  for k, v in pairs (launched) do
    any = true
    break
  end
  if any then
    local item_table = gui.add{
      type = "table",
      name = "silo_gui_table",
      column_count = 2
    }
    item_table.style.left_padding = 12
    item_table.style.horizontal_spacing = 8
    item_table.style.vertical_spacing = 0
    item_table.style.column_alignments[2] = "right"
    local label = item_table.add{type = "label", caption = {"gui-silo-script.sent-label"}, style = "caption_label"}
    label.style.font = "default-bold"
    label.style.bottom_padding = 4
    item_table.add{type = "label"}
    for k, tracked in pairs (get_tracked_items()) do
      local item = items[tracked]
      local count = launched[tracked]
      if item and count then
        local label = item_table.add{type = "label", caption = {"", item.localised_name, {"colon"}}}
        label.style.font = "default-semibold"
        item_table.add{type = "label", caption = util.format_number(count)}
      end
    end
  else
    gui.add{type = "label", caption = {"gui-silo-script.no-sent-items"}}
  end
end

function update_players(players)
  local players = players or game.players
  for k, player in pairs (players) do
    gui_update(player)
  end
end

function toggle_frame(player)
  local gui = mod_gui.get_frame_flow(player)
  local frame = gui.silo_gui_frame

  if frame then
    frame.destroy()
    return
  end

  frame = gui.add{
    type = "frame",
    name = "silo_gui_frame",
    direction = "vertical",
    caption = {"gui-silo-script.frame-caption"},
    style = mod_gui.frame_style
  }
  frame.style.title_bottom_padding = 0
  gui_update(player)
end

migrations = {
  [1] = function ()
    log("Executing silo script migration - Mod gui from left to top")
    for k, player in pairs (game.players) do
      local gui = player.gui.left
      if gui.mod_gui_flow then
        gui.mod_gui_flow.destroy()
      end
      get_sprite_button(player)
      gui_update(player)
    end
  end
}

get_sprite_button = function(player)
  local button_flow = mod_gui.get_button_flow(player)
  local button = button_flow.silo_gui_sprite_button
  if not button then
    button = button_flow.add
    {
      type = "sprite-button",
      name = "silo_gui_sprite_button",
      sprite = "item/rocket-silo",
      style = mod_gui.button_style,
      tooltip = {"gui-silo-script.button-tooltip"}
    }
    local any = false
    local sent = player.force.items_launched
    for k, tracked_item in pairs (get_tracked_items()) do
      if sent[tracked_item] then
        any = true
        break
      end
    end
    button.style.visible = any
  end
  return button
end

function get_tracked_items()
  if not global.silo_script then return {} end
  if not global.silo_script.tracked_items then 
    global.silo_script.tracked_items = silo_script.tracked_items
  end

  local list = global.silo_script.tracked_items
  if not list then return end
  local items = game.item_prototypes
  for k, name in pairs (list) do
    if not items[name] then
      log("Removed \""..name.."\" from tracked items, as it is not a valid item.")
      table.remove(list, k)
    end
  end

  return list
end

silo_script = {}
silo_script.version = 2
silo_script.tracked_items = {"satellite"}

silo_script.on_rocket_launched = function(event)
  local rocket = event.rocket
  if not rocket then return end
  local force = rocket.force
  local any_tracked = false
  for k, tracked_item in pairs (get_tracked_items()) do
    if rocket.get_item_count(tracked_item) > 0 then
      any_tracked = true
      break
    end
  end
  if event.rocket.get_item_count("satellite") > 0 then
    if force.get_item_launched("satellite") == event.rocket.get_item_count("satellite") then
      for k, player in pairs (force.players) do
        get_sprite_button(player).style.visible = true
        toggle_frame(player)
      end
      if global.silo_script.finish_on_launch then
        game.set_game_state{game_finished = true, player_won = true, can_continue = true}
      end
    end
  elseif global.silo_script.show_launched_without_satellite and not any_tracked then
    if (#game.players <= 1) then
      game.show_message_dialog{text = {"gui-silo-script.rocket-launched-without-satellite"}}
    else
      force.print({"gui-silo-script.rocket-launched-without-satellite"})
    end
  end
  if any_tracked then
    update_players(force.players)
  end
end

silo_script.on_player_created = function(event)
  local player = game.players[event.player_index]
  if not (player and player.valid) then return end
  get_sprite_button(player)
end

silo_script.on_gui_click = function(event)
  local gui = event.element
  local player = game.players[event.player_index]
  if not (player and player.valid and gui and gui.valid) then return end
  if gui.name == "silo_gui_sprite_button" then
    toggle_frame(player)
    return
  end
end

silo_script.add_remote_interface = function()
  remote.add_interface("silo_script",
  {
    set_show_launched_without_satellite = function(value)
      if type(value) ~= "boolean" then error("Ordered to set 'show_launched_without_satellite' to non-boolean value.") end
      global.silo_script.show_launched_without_satellite = value
    end,
    set_finish_on_launch = function(value)
      if type(value) ~= "boolean" then error("Ordered to set 'finish_on_launch' to non-boolean value.") end
      global.silo_script.finish_on_launch = value
    end,
    get_tracked_items = function()
      return get_tracked_items()
    end,
    add_tracked_item = function(item_name)
      if type(item_name) ~= "string" then error("Value for 'add_tracked_item' must be a string") end
      if not game.item_prototypes[item_name] then error("Item to add is not a valid item: "..item_name) end
      table.insert(get_tracked_items(), item_name)
      update_players()
    end,
    remove_tracked_item = function(item_name)
      if type(item_name) ~= "string" then error("Value for 'remove_tracked_item' must be a string") end
      for k, name in pairs (get_tracked_items()) do
        if name == item_name then
          table.remove(get_tracked_items(), k)
          break
        end
      end
      update_players()
    end
  })

end

silo_script.add_commands = function()
  commands.add_command("toggle-rockets-sent-gui", "toggle-rockets-sent-command-help", function()
    local player = game.player
    local button = get_sprite_button(player)
    local set_to = not button.style.visible
    button.style.visible = set_to
    local frame = mod_gui.get_frame_flow(player).silo_gui_frame
    if frame and set_to == false then
      frame.destroy()
    end
    if not frame and set_to then
      toggle_frame(player)
    end
  end)
end

silo_script.on_configuration_changed = function(event)
  if not global.silo_script then
    silo_script.on_init()
    migrate_from_scenario()
  end
  if global.silo_script.version ~= silo_script.version then
    migrate(global.silo_script.version, silo_script.version)
  end
  update_players()
end

silo_script.on_init = function()
  if global.silo_script ~= nil then return end
  global.silo_script = {}
  global.silo_script.version = silo_script.version
  global.silo_script.tracked_items = silo_script.tracked_items
  global.silo_script.show_launched_without_satellite = true
  global.silo_script.finish_on_launch = true
end

return silo_script

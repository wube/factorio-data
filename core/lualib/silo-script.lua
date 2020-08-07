local mod_gui = require("mod-gui")
local util = require("util")

local script_version = 3

local default_tracked_items = function()
  return
  {
    satellite = true
  }
end

local script_data =
{
  version = script_version,
  tracked_items = default_tracked_items(),
  finished = {}
}

local script_migrations =
{
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
  end,
  [2] = function ()
    log("Executing 0.17 GUI update")
    for k, player in pairs (game.players) do
      get_sprite_button(player).destroy()
      get_sprite_button(player)
    end
  end
}

function migrate(old_version, new_version)
  log("Running silo script migration: "..old_version.." -> "..new_version)
  repeat
    if script_migrations[old_version] then
      script_migrations[old_version]()
    end
    old_version = old_version + 1
  until old_version >= new_version
  script_data.version = new_version
end

function gui_update(player)

  local gui = mod_gui.get_frame_flow(player).silo_gui_frame
  if not gui then return end

  gui.clear()

  local inner = gui.add{type = "frame", style = "inside_shallow_frame", direction = "vertical"}
  inner.style.horizontally_stretchable = true

  local items = game.item_prototypes
  local launched = player.force.items_launched

  if not next(launched) then
    local label = inner.add{type = "label", caption = {"gui-silo-script.no-sent-items"}}
    label.style.padding = {4, 4, 0, 4}
    return
  end

  local item_table = inner.add
  {
    type = "table",
    name = "silo_gui_table",
    style = "bordered_table",
    column_count = 3
  }

  for name, bool in pairs (get_tracked_items()) do
    local item = items[name]
    local count = launched[name]

    if item and count then
      local sprite = item_table.add{type = "sprite-button", sprite = "item/"..name, style = "transparent_slot"}
      --Height of the label is 20. Lets not make the whole GUI bigger just to show more icon.
      sprite.style.height = 20
      sprite.style.width = 20
      item_table.add{type = "label", caption = item.localised_name, style = "bold_label"}
      local count_flow = item_table.add{type = "flow"}
      local pusher = count_flow.add{type = "empty-widget"}
      pusher.style.horizontally_stretchable = true
      count_flow.add{type = "label", caption = util.format_number(count)}
    end

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

  frame = gui.add
  {
    type = "frame",
    name = "silo_gui_frame",
    direction = "vertical",
    caption = {"gui-silo-script.frame-caption"},
    style = mod_gui.frame_style
  }
  frame.style.use_header_filler = false

  gui_update(player)
end

get_sprite_button = function(player)
  local button_flow = mod_gui.get_button_flow(player)
  local button = button_flow.silo_gui_sprite_button
  if not button then
    local item = game.item_prototypes["rocket-silo"]
    if item then
      button = button_flow.add
      {
        type = "sprite-button",
        name = "silo_gui_sprite_button",
        sprite = "item/rocket-silo",
        style = mod_gui.button_style,
        tooltip = {"gui-silo-script.button-tooltip"}
      }
    else
      button = button_flow.add
      {
        type = "button",
        name = "silo_gui_sprite_button",
        caption = {"gui-silo-script.frame-caption"},
        style = mod_gui.button_style,
        tooltip = {"gui-silo-script.button-tooltip"}
      }
    end
    local any = false
    local sent = player.force.items_launched
    for name, bool in pairs (get_tracked_items()) do
      if sent[name] then
        any = true
        break
      end
    end
    button.visible = any
  end
  return button
end

function get_tracked_items()

  local list = script_data.tracked_items or default_tracked_items()
  local items = game.item_prototypes
  local map = {}
  for k, v in pairs (list) do
    local key, name
    if type(k) == "string" then
      key = k
      name = k
    elseif type(k) == "number" then
      key = k
      name = v
    end
    if not items[name] then
      log("Removed \""..name.."\" from tracked items, as it is not a valid item.")
      list[key] = nil
    else
      map[name] = true
    end
  end
  script_data.tracked_items = map
  return map
end

local on_rocket_launched = function(event)
  local rocket = event.rocket
  if not (rocket and rocket.valid) then return end
  local force = rocket.force

  local any_tracked = false
  local first = true
  local tracked_map = get_tracked_items()
  local inventory = rocket.get_inventory(defines.inventory.rocket)

  for name, count in pairs (inventory.get_contents()) do
    if tracked_map[name] then
      any_tracked = true
      if force.get_item_launched(name) ~= count then
        first = false
        break
      end
    end
  end

  if any_tracked then
    if first then
      for k, player in pairs (force.players) do
        get_sprite_button(player).visible = true
        toggle_frame(player)
      end
    else
      update_players(force.players)
    end
  end

  if global.no_victory then return end

  script_data.finished = script_data.finished or {}
  if script_data.finished[force.name] then
    --They have already finished, nothing else to do.
    return
  end

  if force.rockets_launched > 1 then
    --They finished before, lets just check if we should turn on the research queue for them...
    script_data.finished[force.name] = true
    if game.difficulty_settings.research_queue_setting == "after-victory" then
      force.research_queue_enabled = true
    end
    return
  end

  game.set_game_state{game_finished = true, player_won = true, can_continue = true, victorious_force = force}

end

local on_player_created = function(event)
  local player = game.players[event.player_index]
  if not (player and player.valid) then return end
  get_sprite_button(player)
end

local on_gui_click = function(event)
  local gui = event.element
  local player = game.players[event.player_index]
  if not (player and player.valid and gui and gui.valid) then return end
  if gui.name == "silo_gui_sprite_button" then
    toggle_frame(player)
    return
  end
end

silo_script = {}

silo_script.events =
{
  [defines.events.on_gui_click] = on_gui_click,
  [defines.events.on_player_created] = on_player_created,
  [defines.events.on_rocket_launched] = on_rocket_launched
}

silo_script.on_gui_click = on_gui_click
silo_script.on_player_created = on_player_created
silo_script.on_rocket_launched = on_rocket_launched

silo_script.add_remote_interface = function()
  remote.add_interface("silo_script",
  {
    get_tracked_items = function()
      return get_tracked_items()
    end,
    add_tracked_item = function(item_name)
      if type(item_name) ~= "string" then error("Value for 'add_tracked_item' must be a string") end
      if not game.item_prototypes[item_name] then error("Item to add is not a valid item: "..item_name) end
      get_tracked_items()[item_name] = true
      update_players()
    end,
    remove_tracked_item = function(item_name)
      if type(item_name) ~= "string" then error("Value for 'remove_tracked_item' must be a string") end
      get_tracked_items()[item_name] = nil
      update_players()
    end,
    update_players = function(players)
      update_players(players)
    end,
    set_no_victory = function(bool)
      if type(bool) ~= "boolean" then error("Value for 'set_no_victory' must be a boolean") end
      global.no_victory = bool
    end
  })

end

silo_script.add_commands = function()
  commands.add_command("toggle-rockets-sent-gui", {"gui-silo-script.toggle-rockets-sent-command-help"}, function()
    local player = game.player
    local button = get_sprite_button(player)
    local set_to = not button.visible
    button.visible = set_to
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
  if script_data.version ~= script_version then
    migrate(script_data.version, script_version)
  end
  update_players()
end

silo_script.on_init = function()
  global.silo_script = global.silo_script or script_data
end

silo_script.on_load = function()
  script_data = global.silo_script or script_data
end

silo_script.on_event = function(event)
  local action = silo_script.events[event.name]
  return action and action(event)
end

silo_script.get_events = function()
  return silo_script.events
end

return silo_script

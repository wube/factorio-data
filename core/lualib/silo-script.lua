require("mod-gui")
silo_script = {}
silo_script.version = 1
silo_script.tracked_items = {"satellite"}

function silo_script.migrate(old_version, new_version)
  if not silo_script.migrations then return end
  repeat
    if silo_script.migrations[old_version] then
      silo_script.migrations[old_version]()
    end
    old_version = old_version + 0.1
  until old_version >= new_version
end

function silo_script.on_rocket_launched(event)
  local force = event.rocket.force
  if event.rocket.get_item_count("satellite") > 0 then
    if global.silo_script.finish_on_launch and force.get_item_launched("satellite") == 1 then
      game.set_game_state{game_finished=true, player_won=true, can_continue=true}
    end
  elseif global.silo_script.show_launched_without_satellite then
    if (#game.players <= 1) then
      game.show_message_dialog{text = {"gui-silo-script.rocket-launched-without-satellite"}}
    else
      force.print({"gui-silo-script.rocket-launched-without-satellite"})
    end
  end
  for k, player in pairs (force.players) do
    silo_script.gui_update(player)
  end
end

function silo_script.add_remote_interface()
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
      return global.silo_script.tracked_items
    end,
    add_tracked_item = function(item_name)
      if type(item_name) ~= "string" then error("Value for 'add_tracked_item' must be a string") end
      if not game.item_prototypes[item_name] then error("Item to add is not a valid item") end
      table.insert(global.silo_script.tracked_items, item_name)
    end,
    remove_tracked_item = function(item_name)
      if type(item_name) ~= "string" then error("Value for 'remove_tracked_item' must be a string") end
      for k, name in pairs (global.silo_script.tracked_items) do
        if name == item_name then
          table.remove(global.silo_script.tracked_items, k)
          break
        end
      end
    end,
    update_gui = function(player)
      if player then
        silo_script.gui_update(player)
      else
        for k, player in pairs (game.players) do
          silo_script.gui_update(player)
        end
      end
    end,
    get_silo_gui_frame = function(player)
      if player then
        local gui = mod_gui.get_frame_flow(player)
        return gui.silo_gui_frame
      else
        local array = {}
        local count = 1
        for k, player in pairs (game.players) do
          local gui = mod_gui.get_frame_flow(player)
          array[count] = gui.silo_gui_frame
          count = count + 1
        end
        return array
      end
    end,
    reset_silo_gui_frame = function(player)
      local reset = function(player)
        local gui = mod_gui.get_frame_flow(player)
        if gui.silo_gui_frame then
          gui.silo_gui_frame.destroy()
        end
        silo_script.gui_init(player)
      end
      if player then
        reset(player)
      else
        for k, player in pairs (game.players) do
          reset(player)
        end
      end
    end
  })
end

function silo_script.on_configuration_changed(event)
  if not global.silo_script then
    silo_script.init() 
    silo_script.migrate_from_scenario()
  end
  if global.silo_script.version ~= silo_script.version then
    silo_script.migrate(global.silo_script.version, silo_script.version)
  end
end

function silo_script.init()
  if global.silo_script ~= nil then return end
  global.silo_script = {}
  global.silo_script.version = silo_script.version
  global.silo_script.tracked_items = silo_script.tracked_items
  global.silo_script.show_launched_without_satellite = true
  global.silo_script.finish_on_launch = true
end

function silo_script.migrate_from_scenario()
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
    silo_script.gui_init(player)
  end
end


function silo_script.gui_init(player)
  local button_flow = mod_gui.get_button_flow(player)
  if not button_flow.silo_gui_sprite_button then
    local button = button_flow.add
    {
      type = "sprite-button",
      name = "silo_gui_sprite_button",
      sprite = "item/rocket-silo",
      style = mod_gui.button_style,
      tooltip = {"gui-silo-script.button-tooltip"}
    }
  end
  local frame_flow = mod_gui.get_frame_flow(player)
  if not frame_flow.silo_gui_frame then
    local frame = frame_flow.add
    {
      type = "frame",
      name = "silo_gui_frame",
      direction = "vertical",
      caption = {"gui-silo-script.frame-caption"},
      style = mod_gui.frame_style
    }
    frame.style.visible = false
    frame.add
    {
      type = "label",
      name = "silo_gui_frame_sent_label",
      caption = {"gui-silo-script.sent-label"},
      style = "caption_label_style"
    }
    local item_table = frame.add
    {
      type = "table",
      name = "silo_gui_frame_sent_table",
      colspan = 1
    }
    item_table.style.left_padding = 12
  end
  silo_script.gui_update(player)
end

function silo_script.gui_update(player)
  if not player then error("Silo script gui update must have a argument") end
  if not player.valid then error("Silo script gui update player not valid") end
  local gui = mod_gui.get_frame_flow(player).silo_gui_frame
  if not gui then 
    silo_script.gui_init(player)
    gui = mod_gui.get_frame_flow(player).silo_gui_frame
  end
  local item_table = gui.silo_gui_frame_sent_table
  if not item_table then error("Silo sent item table not present - Some other script may have deleted it") end
  local show = false
  local items = game.item_prototypes
  for k, tracked in pairs (global.silo_script.tracked_items) do
    local item_show = false
    if not items[tracked] then error("Silo script tracked item \""..tracked.."\" is not a valid item") return end
    local count = player.force.get_item_launched(tracked)
    local label = item_table["silo_script_label_"..tracked]
    if not label then 
      label = item_table.add
      {
        type = "label",
        name = "silo_script_label_"..tracked
      }
    end
    label.caption = {"gui-silo-script.sent-item", items[tracked].localised_name, count}
    if count > 0 then
      item_show = true
      show = true
    end
    label.style.visible = item_show
  end
  local button = mod_gui.get_button_flow(player).silo_gui_sprite_button
  if not button then error("Silo script button not present during update") end
  button.style.visible = show
  gui.style.visible = show
end

function silo_script.on_gui_click(event)
  local gui = event.element
  local player = game.players[event.player_index]
  if not gui.valid then return end
  if gui.name == "silo_gui_sprite_button" then
    mod_gui.get_frame_flow(player).silo_gui_frame.style.visible = not mod_gui.get_frame_flow(player).silo_gui_frame.style.visible
    return
  end
end


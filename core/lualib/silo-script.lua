local mod_gui = require("mod-gui")

local script_data =
{
  finished = {},
  removed_old_gui = true
}

local remove_old_frame = function(player)
  local gui = mod_gui.get_frame_flow(player)
  local frame = gui.silo_gui_frame
  if frame then frame.destroy() end
end

local remove_old_button = function(player)
  local button_flow = mod_gui.get_button_flow(player)
  local button = button_flow.silo_gui_sprite_button
  if button then button.destroy() end
end

local remove_old_gui = function()
  for k, player in pairs (game.players) do
    remove_old_frame(player)
    remove_old_button(player)
  end
end

local on_rocket_launched = function(event)
  if global.no_victory then return end

  local rocket = event.rocket
  if not (rocket and rocket.valid) then return end

  local force = rocket.force

  if script_data.finished[force.name] then
    return
  end

  script_data.finished[force.name] = true

  game.set_game_state
  {
    game_finished = true,
    player_won = true,
    can_continue = true,
    victorious_force = force
  }

end

local add_remote_interface = function()
  if not remote.interfaces["silo_script"] then
    remote.add_interface("silo_script",
    {
      set_no_victory = function(bool)
        if type(bool) ~= "boolean" then error("Value for 'set_no_victory' must be a boolean") end
        global.no_victory = bool
      end
    })
  end
end
add_remote_interface()

local silo_script = {}

silo_script.events =
{
  [defines.events.on_rocket_launched] = on_rocket_launched
}

silo_script.on_configuration_changed = function()
  if not script_data.removed_old_gui then
    script_data.removed_old_gui = true
    script_data.tracked_items = nil
    remove_old_gui()
    log("Remove the old silo script GUI")
  end
  script_data.finished = script_data.finished or {}
end

silo_script.on_init = function()
  global.silo_script = global.silo_script or script_data
end

silo_script.on_load = function()
  script_data = global.silo_script or script_data
end

silo_script.get_events = function()
  return silo_script.events
end

silo_script.add_remote_interface = function()
  add_remote_interface()
end

return silo_script

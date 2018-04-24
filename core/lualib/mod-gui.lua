mod_gui = {}
mod_gui.button_style = "mod_gui_button_style"
mod_gui.frame_style = "inner_frame_in_outer_frame_style"

--[[

Hello script explorer, if you are looking to upgrade your mod to use the mod gui, its pretty simple.

Typically you will have something like:
player.gui.left.add{...}

All you will need to do, is change it to:
mod_gui.get_frame_flow(player).add{...}

And for buttons its just the same:
mod_gui.get_button_flow(player).add{...}

It should be as simple as find and replace.

Any other questions please feel free to ask on the modding help forum.

]]

function mod_gui.make_flow(gui)

  local mod_flow = gui.mod_gui_flow
  if not mod_flow then
    mod_flow = gui.add{type = "flow", name = "mod_gui_flow", direction = "vertical", style = "slot_table_spacing_flow_style"}
  end
  
  local button_flow = mod_flow.mod_gui_button_flow
  if not button_flow then
    button_flow = mod_flow.add{type = "flow", name = "mod_gui_button_flow", direction = "horizontal", style = "slot_table_spacing_flow_style"}
  end
  button_flow.style.left_padding = 4
  button_flow.style.top_padding = 4
  
  local frame_flow = mod_gui_frame_flow
  if not frame_flow then
    frame_flow = mod_flow.add{type = "flow", name = "mod_gui_frame_flow", direction = "horizontal", style = "slot_table_spacing_flow_style"}
  end
  frame_flow.style.left_padding = 4
  
  return mod_flow
end

function mod_gui.get_button_flow(player)
  local gui = player.gui.left
  if not gui.mod_gui_flow then
    return mod_gui.make_flow(gui).mod_gui_button_flow
  end
  return gui.mod_gui_flow.mod_gui_button_flow
end

function mod_gui.get_frame_flow(player)
  local gui = player.gui.left
  if not gui.mod_gui_flow then
    return mod_gui.make_flow(gui).mod_gui_frame_flow
  end
  return gui.mod_gui_flow.mod_gui_frame_flow
end

return mod_gui

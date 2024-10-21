local pvariables = require("__space-age__/prototypes/planet/general/general-variables")

local general_functions = {}
general_functions.make_rocket_part = function(name, graphicid, layer, animated, frameslist)
  return
  {
    type = "single-graphic",
    name = name,
    render_layer = layer,
    relative_to = "pod",
    rotates_with_pod = false,
    shift_rotates_with_pod = false,
    is_passenger_only = true,
    clip_with_hatches = false,
    animation_driven_by_curve = animated,
    start_time = pvariables.impostor_start_tick,
    graphic = { type = "pod-catalogue", catalogue_id = graphicid },
    frames = frameslist
  }
end

general_functions.make_pod_overlay = function(name, graphicid, order, t_start, t_end, animated, frameslist)
  return
  {
    type = "single-graphic",
    name = name,
    render_layer = "air-object",
    secondary_draw_order = order,
    relative_to = "pod",
    rotates_with_pod = true,
    shift_rotates_with_pod = true,
    is_passenger_only = false,
    clip_with_hatches = true,
    animation_driven_by_curve = animated,
    start_time = t_start,
    end_time = t_end,
    graphic = { type = "pod-catalogue", catalogue_id = graphicid },
    frames = frameslist
  }
end


general_functions.make_private_pod_overlay = function(name, graphicid, order, t_start, t_end, animated, frameslist)
  return
  {
    type = "single-graphic",
    name = name,
    render_layer = "air-object",
    secondary_draw_order = order,
    relative_to = "pod",
    rotates_with_pod = true,
    shift_rotates_with_pod = true,
    is_passenger_only = true,
    clip_with_hatches = true,
    animation_driven_by_curve = animated,
    start_time = t_start,
    end_time = t_end,
    graphic = { type = "pod-catalogue", catalogue_id = graphicid },
    frames = frameslist
  }
end

general_functions.make_pod_animation = function(name, graphicid, t_start, t_end, frameslist)
  return
  {
    type = "pod-animation",
    name = name,
    start_time = t_start,
    end_time = t_end,
    graphic = { type = "pod-catalogue", catalogue_id = graphicid },
    frames = frameslist
  }
end

general_functions.jet_burst = function(jet_start, jet_time, gfx_start, gfx_loop)
  return
  {
  general_functions.make_pod_overlay("podjet", gfx_start, -1, jet_start, jet_start+10, true,
  {
    { timestamp = jet_start, frame = 0 },
    { timestamp = jet_start+10, frame = 9 }
  }),
  general_functions.make_pod_overlay("podjet", gfx_loop, -1, jet_start+10, jet_start+10+jet_time, false, {}),
  general_functions.make_pod_overlay("podjet", gfx_start, -1, jet_start+10+jet_time, jet_start+20+jet_time, true,
  {
    { timestamp = jet_start+10+jet_time, frame = 9 },
    { timestamp = jet_start+20+jet_time, frame = 0 }
  })
  }
end

general_functions.conc2 = function(t1,t2)
  local temp = {}
  for i=1,#t1 do
    temp[i] = util.table.deepcopy(t1[i])
  end
  for i=1,#t2 do
    temp[#temp+1] = util.table.deepcopy(t2[i])
  end
return temp
end
general_functions.conc3 = function(t1,t2,t3)
  local temp = {}
  temp = general_functions.conc2(general_functions.conc2(t1,t2),t3)
return temp
end
general_functions.conc4 = function(t1,t2,t3,t4)
  local temp = {}
  temp = general_functions.conc2(general_functions.conc2(t1,t2),general_functions.conc2(t3,t4))
  return temp
end

return general_functions;

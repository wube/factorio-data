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

general_functions.vectoring_single = function(vct1, layering, puff_start, reps, rot, dir)

  -- dir == 'R' mirrors plume, 'D' causes two opposite plumes to draw
  
  rot = math.min(math.max(rot, -1),1)
  if rot < 0 then rot = 1+rot end

  local z_adj = -0.7
  local shift = 0

  if rot < 0.5 then rot_mirrored = 0.25 + (0.25-rot)
  else rot_mirrored = 0.75 + (0.75-rot) end

  if dir == 'R' then rot = rot_mirrored end

  local result = {}

  local lngth = 20
  local offset = 2
  local rand_range = {-4,4}

  local function draw_vct(rot_l)
    local anim_start = puff_start
    local off_table = {}
    for i = 1, reps do
      off_table[i] = math.random(rand_range[1], rand_range[2])
    end
    for i=1, reps do
        table.insert(result,
            general_functions.make_pod_overlay("smoke_puff", vct1, layering, anim_start, anim_start+lngth+off_table[i], true,
            {
              { timestamp = anim_start, frame = 0 , rotation = rot_l, shift = {0,z_adj}},
              { timestamp = anim_start+lngth+off_table[i], frame = 19 }
            })
                    )
        anim_start = anim_start + lngth + offset + 2 * off_table[i]
    end
  end

  draw_vct(rot)
  if dir == 'D' then 
    puff_start = puff_start + 2
    draw_vct(rot_mirrored) 
  end

return result
end

general_functions.vectoring_wander = function(vct1, puff_start, reps, rot, wander_start, wander_time, wander_offset, wander_distance, z_adj)
  
  local layering = 1

  local result = {}

  local lngth = 13
  local offset = 2

  local rand_range_offset = {-2,2}
  local rand_range_pause = {-4,4}

  local anim_start = puff_start

  local offset_table = {}
  local pause_table = {}
  
  for i = 1, reps do
    offset_table[i] = math.random(rand_range_offset[1], rand_range_offset[2])
  end

  for i = 1, reps do
    pause_table[i] = math.random(rand_range_pause[1], rand_range_pause[2])
  end

  local function draw_vct()
    for i=1, reps do
        table.insert(result,
            general_functions.make_pod_overlay("smoke_puff", vct1, layering, anim_start, anim_start+lngth+offset_table[i], true,
            {
              { timestamp = 0, rotation = rot},

              { timestamp = puff_start+wander_start-1, shift = {wander_offset,z_adj}, shift_rate=0},
              { timestamp = puff_start+wander_start, shift = {wander_offset,z_adj}},
              { timestamp = puff_start+wander_start+wander_time, shift = {wander_offset+wander_distance,z_adj}},
              { timestamp = puff_start+wander_start+wander_time+1, shift = {wander_offset+wander_distance,z_adj}, shift_rate=1},

              { timestamp = anim_start, frame = 0},
              { timestamp = anim_start+lngth+offset_table[i], frame = 19}
            })
                    )
        anim_start = anim_start + lngth + offset + offset_table[i] + pause_table[i]
    end
  end

  draw_vct()
  
  layering = -1
  wander_offset = -wander_offset
  wander_distance = -wander_distance
  rot = rot + 0.5
  anim_start = puff_start

  for i = 1, reps do
    offset_table[i] = math.random(rand_range_offset[1], rand_range_offset[2])
  end

  for i = 1, reps do
    pause_table[i] = math.random(rand_range_pause[1], rand_range_pause[2])
  end

  draw_vct()

return result
end

general_functions.generate_lightning = function(start_frame, end_frame)

  local result = {}

  local phases = {
    { count_range = {2, 4}, delay_range = {1, 3},  strength_range = {30, 50}, pause_range = {5, 10} },
    { count_range = {1, 2}, delay_range = {1, 2},  strength_range = {85, 100}, pause_range = {2, 4} },
    { count_range = {1, 4}, delay_range = {1, 3},  strength_range = {25, 45}, pause_range = {10, 15} },
  }

  while start_frame<end_frame do

    for _,phase in ipairs(phases) do
    
      local count    = math.random(phase.count_range[1], phase.count_range[2])
      local delay    = math.random(phase.delay_range[1], phase.delay_range[2])
      local strength = math.random(phase.strength_range[1], phase.strength_range[2])/100
      local pause    = math.random(phase.pause_range[1], phase.pause_range[2])

      for i=1, count do

        table.insert(result, {timestamp = start_frame, opacity = 0})
        start_frame = start_frame + delay + math.random(0,3)
        table.insert(result, {timestamp = start_frame, opacity = strength * (math.random(75,100)/100)})
        start_frame = start_frame + delay + math.random(0,3)
        table.insert(result, {timestamp = start_frame, opacity = 0})
        start_frame = start_frame + delay + math.random(0,3)

      end

      start_frame = start_frame + pause

    end

  end
return result
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

general_functions.concN = function(...)
  local tables = {...}
  local count = #tables

  if count == 0 then
    return {}
  elseif count == 1 then
    return util.table.deepcopy(tables[1])
  end

  local result = util.table.deepcopy(tables[1])

  for i = 2, count do
    result = general_functions.conc2(result, tables[i])
  end

  return result
end

return general_functions;

require ("__base__.prototypes.entity.pipecovers")
--This is a placeholder file, a rescaled version of the old miner graphic.
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local animation_speed = 0.5
local drilling_frames = 180
local transition_frames = 50
local drill_sequence =
{
   1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6,
   7, 7, 8, 8, 9, 9,10,10,11,11,12,12,

  13,14,15,16,17,18,19,20,21,22,23,24,
  13,14,15,16,17,18,19,20,21,22,23,24,
  13,14,15,16,17,18,19,20,21,22,23,24,
  13,14,15,16,17,18,19,20,21,22,23,24,
  13,14,15,16,17,18,19,20,21,22,23,24,
  13,14,15,16,17,18,19,20,21,22,23,24,
  13,14,15,16,17,18,19,20,21,22,23,24,
  13,14,15,16,17,18,19,20,21,22,23,24,
  13,14,15,16,17,18,19,20,21,22,23,24,
  13,14,15,16,17,18,19,20,21,22,23,24,
  13,14,15,16,17,18,19,20,21,22,23,24,

  25,25,26,26,27,27,28,28,29,29,30,30,
  31,31,32,32,33,33,34,34,35,35,36,36,
}

local support_sequence =
{
   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
   1, 1, 1, 1, 2, 2, 3, 3, 4, 4, 6, 6,

   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,

   1, 2, 3, 4, 5, 6, 1, 1, 1, 1, 1, 1,
   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
}

local top_sequence =
{
  18,17,16,15,14,13,13,12,11,10, 9, 9,
   9,10,11,10,10, 9, 9, 8, 8, 7, 7, 6,

   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,
   1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6,

   6, 6, 7, 7, 8, 8, 9, 9,10,10,11,11,
  12,12,13,13,14,14,15,15,16,16,17,17,
}

local nozzle_frame_sequence = {}
for i = 1, drilling_frames ,1 do
  nozzle_frame_sequence[i] = top_sequence[i]
end
for i = 1, transition_frames ,1 do
  if i%2 == 0 then
    nozzle_frame_sequence[drilling_frames+i] = 19
  else
    nozzle_frame_sequence[drilling_frames+i] = 18
  end
end


local function waypoints_stops(min, max)
  local function lerp(fac)
    return {fac * max[1] + (1-fac) * min[1], fac * max[2] + (1-fac) * min[2]}
  end
  return
  {
    lerp(0.50),
    lerp(1.00),
    lerp(0.25),
    lerp(0.75),
    lerp(0.12),
    lerp(0.62),
    lerp(0.37),
    lerp(0.87),
    lerp(0.00)
  }
end

local function bmd_sprite_load(file_name, table)
  local direction_long = ""
  if string.sub(file_name, 1, 2) == "N-" then direction_long = "North/" end
  if string.sub(file_name, 1, 2) == "E-" then direction_long = "East/" end
  if string.sub(file_name, 1, 2) == "S-" then direction_long = "South/" end
  if string.sub(file_name, 1, 2) == "W-" then direction_long = "West/" end

  if not table then
    table = {}
  else
    table.animation_speed = table.animation_speed or animation_speed
  end

  table.priority = "high"
  table.scale = 0.5
  table.filename = "__space-age__/graphics/entity/big-mining-drill/" ..
  direction_long .. "big-mining-drill-" .. file_name
  return util.sprite_load(table.filename  ,table)
end


local function fluids(with_fluid)
  if with_fluid == false then return nil end
  return
  {
    always_draw = true,
    north_animation = bmd_sprite_load("N-pipe-connections",{}),
    east_animation = bmd_sprite_load("E-pipe-connections",{}),
    south_animation = bmd_sprite_load("S-pipe-connections",{}),
    west_animation = bmd_sprite_load("W-pipe-connections",{}),
  }
end

local function fluids_front(with_fluid)
  if with_fluid == false then return nil end
  return
  {
    always_draw = true,
    north_animation =
    {
      layers =
      {
        bmd_sprite_load("N-pipe-connections-front",{}),
        bmd_sprite_load("N-pipe-connections-shadow", {draw_as_shadow = true})
      }
    },
    east_animation =
    {
      layers =
      {
        bmd_sprite_load("E-pipe-connections-front",{}),
        bmd_sprite_load("E-pipe-connections-shadow", {draw_as_shadow = true})
      }
    },
    south_animation =
    {
      layers =
      {
        bmd_sprite_load("S-pipe-connections-front",{}),
        bmd_sprite_load("S-pipe-connections-shadow", {draw_as_shadow = true})
      }
    },
    west_animation =
    {
      layers =
      {
        bmd_sprite_load("W-pipe-connections-front",{}),
        bmd_sprite_load("W-pipe-connections-shadow", {draw_as_shadow = true})
      }
    }
  }
end

local function graphical_set(with_fluid)
  return
  {
    drilling_vertical_movement_duration = 15 / animation_speed,
    shift_animation_waypoint_stop_duration = drilling_frames / animation_speed,
    shift_animation_transition_duration = transition_frames / animation_speed,
    animation_progress = 1,
    status_colors = electric_mining_drill_status_colors(),
    circuit_connector_layer = "object",
    circuit_connector_secondary_draw_order = { north = 40, east = 40, south = 40, west = 40 },

    animation =
    {
      north =
      {
        layers =
        {
          bmd_sprite_load("N-still", { dice = 2 }),
          bmd_sprite_load("N-still-shadow", {draw_as_shadow = true, dice = 2 }),
        }
      },
      east =
      {
        layers =
        {
          bmd_sprite_load("E-still", { dice_y = 2 }),
          bmd_sprite_load("E-still-shadow", {draw_as_shadow = true, dice = 2 }),
        }
      },
      south =
      {
        layers =
        {
          bmd_sprite_load("S-still", { dice_x = 2 }),
          bmd_sprite_load("S-still-shadow", {draw_as_shadow = true, dice = 2 }),
        }
      },
      west =
      {
        layers =
        {
          bmd_sprite_load("W-still", { dice_y = 2 }),
          bmd_sprite_load("W-still-shadow", {draw_as_shadow = true, dice = 2 }),
        }
      },
    },
    shift_animation_waypoints =
    {
      north = waypoints_stops({0, -0.3},{0, 0.9}),
      east =  waypoints_stops({-0.85, 0},{0.2, 0}),
      south = waypoints_stops({0, -0.9},{0, 0.3}),
      west =  waypoints_stops({-0.2, 0},{0.85, 0})
    },

    working_visualisations =
    {
      -- scortchmark
      {
        always_draw = true,
        mining_drill_scorch_mark = true,
        scorch_mark_fade_in_frames = 30,
        scorch_mark_fade_out_duration = 300,
        scorch_mark_lifetime = 600,
        animation = bmd_sprite_load("drill-scorchmark", {}),
        north_position = { 0, 0.15},
        east_position = { 0, 0 },
        south_position = { 0, 0.15},
        west_position = { 0, 0 }
      },
      -- drill animation
      {
        name = "drill-animation",
        animated_shift = true,
        always_draw = true,
        animation ={
          layers =
          {
            bmd_sprite_load("drill",
            {
              frame_sequence = drill_sequence,
              frame_count = 36,
            }),
            bmd_sprite_load("drill-shadow",
            {
              frame_sequence = drill_sequence,
              frame_count = 36,
              draw_as_shadow = true,
            })
          }
        },
        north_position = { 0, 0.15},
        east_position = { 0, 0 },
        south_position = { 0, 0.15},
        west_position = { 0, 0 }
      },

      -- dust animation
      {
        --constant_speed = true,
        synced_fadeout = true,
        align_to_waypoint = true,
        --apply_tint = "resource-color",
        animation = bmd_sprite_load("drill-dust", {frame_count = 24}),
        north_position = { 0, 0.15},
        east_position = { 0, 0 },
        south_position = { 0, 0.15},
        west_position = { 0, 0 }
      },
      -- dust animation
      {
        --constant_speed = true,
        synced_fadeout = true,
        align_to_waypoint = true,
        apply_tint = "resource-color",
        animation = bmd_sprite_load("drill-dust-tint", {frame_count = 24}),
        north_position = { 0, 0.15},
        east_position = { 0, 0 },
        south_position = { 0, 0.15},
        west_position = { 0, 0 }
      },

      {
        always_draw = true,
        north_animation = bmd_sprite_load("N-still", { dice = 2 }),
        east_animation = bmd_sprite_load("E-still-reel", {}),
        south_animation = bmd_sprite_load("S-still", { dice_x = 2 }),
        west_animation = bmd_sprite_load("W-still-reel", {}),
      },

      -- wheels transition
      {
        animated_shift = true,
        always_draw = true,
        enabled_in_animated_shift_during_waypoint_stop = false,
        enabled_in_animated_shift_during_transition = true,
        frame_based_on_shift_animation_progress = true,

        north_animation = bmd_sprite_load("N-wheels", {animation_speed = 0.2, frame_count = 3, dice_x = 2 }),
        east_animation = bmd_sprite_load("E-wheels", {animation_speed = 0.2, frame_count = 3, dice_y = 2 }),
        south_animation = bmd_sprite_load("S-wheels", {animation_speed = 0.2, frame_count = 3, dice_x = 2 }),
        west_animation = bmd_sprite_load("W-wheels", {animation_speed = 0.2, frame_count = 3, dice_y = 2 }),
      },

      -- wheels waypoint stop
      {
        animated_shift = true,
        always_draw = true,
        enabled_in_animated_shift_during_waypoint_stop = true,
        enabled_in_animated_shift_during_transition = false,
        frame_based_on_shift_animation_progress = true,

        north_animation = bmd_sprite_load("N-wheels", {animation_speed = 0.2, frame_count = 3, dice_x = 2 }),
        east_animation = bmd_sprite_load("E-wheels", {animation_speed = 0.2, frame_count = 3, dice_y = 2 }),
        south_animation = bmd_sprite_load("S-wheels", {animation_speed = 0.2, frame_count = 3, dice_x = 2 }),
        west_animation = bmd_sprite_load("W-wheels", {animation_speed = 0.2, frame_count = 3, dice_y = 2 }),
      },

      -- output
      {
        animated_shift = false,
        always_draw = true,

        north_animation= bmd_sprite_load("N-output", {frame_count = 5}),
        east_animation = bmd_sprite_load("E-output", {frame_count = 5}),
        south_animation = bmd_sprite_load("S-output", {frame_count = 5}),
        west_animation = bmd_sprite_load("W-output", {frame_count = 5}),
      },

      fluids(with_fluid),

      -- drill support animation
      {
        animated_shift = true,
        always_draw = true,
        north_animation = { layers =
        {
          bmd_sprite_load("N-support",
          {
            frame_sequence = support_sequence,
            frame_count = 6,
            dice_x = 3,
          }),
          bmd_sprite_load("N-support-shadow",
          {
            draw_as_shadow = true,
            repeat_count = drilling_frames,
            frame_count = 1,
          })
        }},
        east_animation = { layers =
        {
          bmd_sprite_load("E-support",
          {
            frame_sequence = support_sequence,
            frame_count = 6,
          }),
          bmd_sprite_load("E-support-shadow",
          {
            draw_as_shadow = true,
            repeat_count = drilling_frames,
            frame_count = 1,
          })
        }},
        south_animation = { layers =
        {
          bmd_sprite_load("S-support",
          {
            frame_sequence = support_sequence,
            frame_count = 6,
            dice_x = 3,
          }),
          bmd_sprite_load("S-support-shadow",
          {
            draw_as_shadow = true,
            repeat_count = drilling_frames,
            frame_count = 1,
          })
        }},
        west_animation = { layers =
        {
          bmd_sprite_load("W-support",
          {
            frame_sequence = support_sequence,
            frame_count = 6,
          }),
          bmd_sprite_load("W-support-shadow",
          {
            draw_as_shadow = true,
            repeat_count = drilling_frames,
            frame_count = 1,
          })
        }},
      },

      -- front frame
      {
        always_draw = true,
        north_animation = bmd_sprite_load("N-still-front",{ dice = 2 }),
        east_animation = bmd_sprite_load("E-still-front",{ dice = 2 }),
        south_animation = bmd_sprite_load("S-still-front",{ dice = 2 }),
        west_animation = bmd_sprite_load("W-still-front",{ dice = 2 }),
      },

      -- output-particles
      {
        synced_fadeout = true,
        apply_tint = "resource-color",
        always_draw = true,
        north_animation = bmd_sprite_load("N-output-particles", {frame_count = 24}),
        east_animation = bmd_sprite_load("E-output-particles", {frame_count = 24}),
        south_animation = bmd_sprite_load("S-output-particles", {frame_count = 24}),
        west_animation = bmd_sprite_load("W-output-particles", {frame_count = 24}),
      },

      fluids_front(with_fluid),

      -- LEDs
      {
        apply_tint = "status",
        always_draw = true,
        north_animation = bmd_sprite_load("N-lamp", { blend_mode = "additive", draw_as_glow = true }),
        east_animation = bmd_sprite_load("E-lamp", { blend_mode = "additive", draw_as_glow = true }),
        south_animation = bmd_sprite_load("S-lamp", { blend_mode = "additive", draw_as_glow = true }),
        west_animation = bmd_sprite_load("W-lamp", { blend_mode = "additive", draw_as_glow = true })
      },

      -- drill top nozzle animation
      {
        always_draw = true,
        north_animation = bmd_sprite_load("N-top-nozzle",
        {
          frame_sequence = nozzle_frame_sequence,
          frame_count = 19,
        }),
        east_animation = bmd_sprite_load("E-top-nozzle",
        {
          frame_sequence = nozzle_frame_sequence,
          frame_count = 19,
        }),
        south_animation = bmd_sprite_load("S-top-nozzle",
        {
          frame_sequence = nozzle_frame_sequence,
          frame_count = 19,
        }),
        west_animation = bmd_sprite_load("W-top-nozzle",
        {
          frame_sequence = nozzle_frame_sequence,
          frame_count = 19,
        }),
      },
          -- drill top animation
      {
        animated_shift = true,
        always_draw = true,
        north_animation = { layers =
        {
          bmd_sprite_load("N-top",
          {
            frame_sequence = top_sequence,
            frame_count = 18,
          }),
          bmd_sprite_load("N-top-shadow",
          {
            frame_sequence = top_sequence,
            frame_count = 18,
            draw_as_shadow = true
          })
        }},
        east_animation = { layers =
        {
          bmd_sprite_load("E-top",
          {
            frame_sequence = top_sequence,
            frame_count = 18,
          }),
          bmd_sprite_load("E-top-shadow",
          {
            frame_sequence = top_sequence,
            frame_count = 18,
            draw_as_shadow = true
          })
        }},
        south_animation = { layers =
        {
          bmd_sprite_load("S-top",
          {
            frame_sequence = top_sequence,
            frame_count = 18,
          }),
          bmd_sprite_load("S-top-shadow",
          {
            frame_sequence = top_sequence,
            frame_count = 18,
            draw_as_shadow = true
          })
        }},
        west_animation = { layers =
        {
          bmd_sprite_load("W-top",
          {
            frame_sequence = top_sequence,
            frame_count = 18,
          }),
          bmd_sprite_load("W-top-shadow",
          {
            frame_sequence = top_sequence,
            frame_count = 18,
            draw_as_shadow = true
          })
        }}
      },

        -- LEDs glow
      {
        always_draw = true,
        apply_tint = "status",
        light = { intensity = 0.25, size = 4.0, minimum_darkness = 0.00 },
        north_position = {-1.0, -2.65},
        east_position =  { 2.1, -1.20},
        south_position = {-1.0,  0.32},
        west_position =  {-2.1, -1.20}
      }
    }
  }
end


data:extend(
{
  {
    type = "mining-drill",
    name = "big-mining-drill",
    icon = "__space-age__/graphics/icons/big-mining-drill.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.3, result = "big-mining-drill"},
    max_health = 300,
    resource_categories = {"basic-solid", "hard-solid"},
    corpse = "big-mining-drill-remnants",
    dying_explosion = "big-mining-drill-explosion",
    collision_box = {{ -2.35, -2.35}, {2.35, 2.35}},
    selection_box = {{ -2.5, -2.5}, {2.5, 2.5}},
    drawing_box_vertical_extension = 1,
    damaged_trigger_effect = hit_effects.entity(),
    heating_energy = "200kW",
    resource_drain_rate_percent = 50,
    drops_full_belt_stacks = true,
    input_fluid_box =
    {
      pipe_picture = assembler2pipepictures(),
      pipe_covers = pipecoverspictures(),
      volume = 200,
      pipe_connections =
      {
        { direction = defines.direction.west, position = {-2, -1} },
        { direction = defines.direction.east, position = {2, -1} },
        { direction = defines.direction.south, position = {1, 2} },
        { direction = defines.direction.south, position = {-1, 2} }
      }
    },
    working_sound =
    {
      main_sounds =
      {
        sound = {filename = "__space-age__/sound/entity/big-mining-drill/big-mining-drill-working-loop.ogg", volume = 0.3},
        fade_in_ticks = 4,
        fade_out_ticks = 30
      },
      sound_accents =
      {
        {
          sound = {filename = "__space-age__/sound/entity/big-mining-drill/big-mining-drill-start.ogg", volume = 0.75},
          play_for_working_visualisation = "drill-animation",
          frame = 8,
          audible_distance_modifier = 0.3
        }
      },
      max_sounds_per_type = 1
    },
    moving_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/big-mining-drill/big-mining-drill-moving-loop.ogg", volume = 0.6,
        aggregation = {max_count = 2, remove = true, count_already_playing = true},
        audible_distance_modifier = 0.5
      },
      stopped_sound = {filename = "__space-age__/sound/entity/big-mining-drill/big-mining-drill-moving-stop.ogg", volume = 0.4},
      minimal_sound_duration_for_stopped_sound = 33, -- at least third of the movement duration (which is drilling_frames / animation_speed)
      fade_ticks = 2
    },
    drilling_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/big-mining-drill/big-mining-drill-loop.ogg", volume = 0.7,
        aggregation = {max_count = 2, remove = true, count_already_playing = true}
      },
      fade_ticks = 10
    },
    drilling_sound_animation_start_frame = 12,
    drilling_sound_animation_end_frame = 156,
    open_sound = sounds.drill_open,
    close_sound = sounds.drill_close,

    graphics_set = graphical_set(false),
    wet_mining_graphics_set = graphical_set(true),
    integration_patch =
    {
      north = bmd_sprite_load("N-integration", nil),
      east = bmd_sprite_load("E-integration", nil),
      south = bmd_sprite_load("S-integration", nil),
      west = bmd_sprite_load("W-integration", nil),
    },
    perceived_performance = { maximum = 30.0 },

    mining_speed = 2.5,
    energy_source =
    {
      type = "electric",
      emissions_per_minute = { pollution = 40 },
      usage_priority = "secondary-input"
    },
    energy_usage = "300kW",
    resource_searching_radius = 6.49,
    vector_to_place_result = {0, -2.85},
    module_slots = 4,
    radius_visualisation_picture =
    {
      filename = "__space-age__/graphics/entity/big-mining-drill/big-mining-drill-radius-visualization.png",
      width = 10,
      height = 10
    },
    monitor_visualization_tint = {r=78, g=173, b=255},
    fast_replaceable_group = "big-mining-drill",
    circuit_connector = table.deepcopy(circuit_connector_definitions["big-mining-drill"]),
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "corpse",
    name = "big-mining-drill-remnants",
    hidden = true,
    icon = "__space-age__/graphics/icons/big-mining-drill.png",
    icon_size = 64,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "extraction-machine-remnants",
    order = "a-a-a",
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (4,
    util.sprite_load("__space-age__/graphics/entity/big-mining-drill/remnants/big-mining-drill-remnants",
    {
      scale = 0.5,
      direction_count = 1
    })
    )
  },
})


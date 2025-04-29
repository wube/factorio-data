require ("__base__.prototypes.entity.pipecovers")

local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

electric_drill_animation_speed = 0.4
electric_drill_animation_sequence =
{
  1, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
  21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1
}

electric_drill_animation_shadow_sequence =
{
  1, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
  21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
  21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
  21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
  21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
  21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
  21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
  21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
  21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
  21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
  21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
  21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
  21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
  21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
  21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
  21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
  21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1
}

function electric_mining_drill_smoke()
  return
  {
    priority = "high",
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-smoke.png",
    line_length = 6,
    width = 48,
    height = 72,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    shift = util.by_pixel(0, 3),
    scale = 0.5
  }
end

function electric_mining_drill_smoke_front()
  return
  {
    priority = "high",
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-smoke-front.png",
    line_length = 6,
    width = 148,
    height = 132,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    shift = util.by_pixel(-3, 9),
    scale = 0.5
  }
end

function electric_mining_drill_animation()
  return
  {
    priority = "high",
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill.png",
    line_length = 6,
    width = 162,
    height = 156,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_sequence,
    shift = util.by_pixel(1, -11),
    scale = 0.5
  }
end

function electric_mining_drill_shadow_animation()
  return
  {
    priority = "high",
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-shadow.png",
    line_length = 7,
    width = 218,
    height = 56,
    frame_count = 21,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_shadow_sequence,
    draw_as_shadow = true,
    shift = util.by_pixel(21, 5),
    scale = 0.5
  }
end

function electric_mining_drill_horizontal_animation()
  return
  {
    priority = "high",
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-horizontal.png",
    line_length = 6,
    width = 80,
    height = 160,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_sequence,
    shift = util.by_pixel(2, -12),
    scale = 0.5
  }
end

function electric_mining_drill_horizontal_front_animation()
  return
  {
    priority = "high",
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-horizontal-front.png",
    line_length = 6,
    width = 66,
    height = 154,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_sequence,
    shift = util.by_pixel(-3, 3),
    scale = 0.5
  }
end

function electric_mining_drill_horizontal_shadow_animation()
  return
  {
    priority = "high",
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-horizontal-shadow.png",
    line_length = 7,
    width = 180,
    height = 164,
    frame_count = 21,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_shadow_sequence,
    draw_as_shadow = true,
    shift = util.by_pixel(33, 1),
    scale = 0.5
  }
end

function electric_mining_drill_status_colors()
  return
  {
    -- If no_power, idle, no_minable_resources, disabled, insufficient_input or full_output is used, always_draw of corresponding layer must be set to true to draw it in those states.

    no_power = {0, 0, 0, 0},                  -- If no_power is not specified or is nil, it defaults to clear color {0,0,0,0}

    idle = {1, 0, 0, 1},                      -- If idle is not specified or is nil, it defaults to white.
    no_minable_resources = {1, 0, 0, 1},      -- If no_minable_resources, disabled, insufficient_input or full_output are not specified or are nil, they default to idle color.
    insufficient_input = {1, 0, 0, 1},
    full_output = {1, 1, 0, 1},
    disabled = {1, 1, 0, 1},

    working = {0, 1, 0, 1},                   -- If working is not specified or is nil, it defaults to white.
    low_power = {1, 1, 0, 1},                 -- If low_power is not specified or is nil, it defaults to working color.
  }
end

function electric_mining_drill_status_leds_working_visualisation()
  local led_blend_mode = nil -- "additive"
  local led_tint = {1, 1, 1}
  return
  {
    apply_tint = "status",
    always_draw = true,
    north_animation =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-light.png",
      width = 32,
      height = 32,
      blend_mode = led_blend_mode,
      tint = led_tint,
      draw_as_glow = true,
      shift = util.by_pixel(26, -48),
      scale = 0.5
    },
    east_animation =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-light.png",
      width = 32,
      height = 34,
      blend_mode = led_blend_mode,
      tint = led_tint,
      draw_as_glow = true,
      shift = util.by_pixel(38, -32),
      scale = 0.5
    },
    south_animation =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-light.png",
      width = 38,
      height = 46,
      blend_mode = led_blend_mode,
      tint = led_tint,
      draw_as_glow = true,
      shift = util.by_pixel(26, 26),
      scale = 0.5
    },
    west_animation =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-light.png",
      width = 32,
      height = 34,
      blend_mode = led_blend_mode,
      tint = led_tint,
      draw_as_glow = true,
      shift = util.by_pixel(-39, -32),
      scale = 0.5
    }
  }
end

function electric_mining_drill_add_light_offsets(t)
  t.north_position = {0.8, -1.5}
  t.east_position =  {1.2, -1}
  t.south_position = {0.8,  0.8}
  t.west_position =  {-1.2, -1}
  return t
end

local electric_mining_drill_primary_light =
  electric_mining_drill_add_light_offsets(
  {
    light = {intensity = 1, size = 3, color={1, 1, 1}, minimum_darkness = 0.1}
  })

local electric_mining_drill_secondary_light =
  electric_mining_drill_add_light_offsets(
  {
    always_draw = true,
    apply_tint = "status",
    light = {intensity = 0.2, size = 2, color={1, 1, 1}, minimum_darkness = 0.1}
  })

data:extend(
{
  {
    type = "mining-drill",
    name = "electric-mining-drill",
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.3, result = "electric-mining-drill"},
    max_health = 300,
    resource_categories = {"basic-solid"},
    corpse = "electric-mining-drill-remnants",
    dying_explosion = "electric-mining-drill-explosion",
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    input_fluid_box =
    {
      pipe_picture = assembler2pipepictures(),
      pipe_covers = pipecoverspictures(),
      volume = 200,
      pipe_connections =
      {
        { direction = defines.direction.west, position = {-1, 0}},
        { direction = defines.direction.east, position = {1, 0}},
        { direction = defines.direction.south, position = {0, 1}}
      }
    },
    working_sound =
    {
      sound = {filename = "__base__/sound/electric-mining-drill.ogg", volume = 1.0, advanced_volume_control = {attenuation = "exponential"}},
      max_sounds_per_prototype = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    open_sound = sounds.drill_open,
    close_sound = sounds.drill_close,

    graphics_set =
    {
      drilling_vertical_movement_duration = 10 / electric_drill_animation_speed,
      animation_progress = 1,

      status_colors = electric_mining_drill_status_colors(),

      circuit_connector_layer = "object",
      circuit_connector_secondary_draw_order = {north = 14, east = 30, south = 30, west = 30},

      animation =
      {
        north =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N.png",
              line_length = 1,
              width = 190,
              height = 208,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(0, -4),
              repeat_count = 5,
              scale = 0.5
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-output.png",
              line_length = 5,
              width = 60,
              height = 66,
              frame_count = 5,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(-3, -44),
              scale = 0.5
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-shadow.png",
              line_length = 1,
              width = 212,
              height = 204,
              animation_speed = electric_drill_animation_speed,
              draw_as_shadow = true,
              shift = util.by_pixel(6, -3),
              repeat_count = 5,
              scale = 0.5
            }
          }
        },
        east =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E.png",
              line_length = 1,
              width = 192,
              height = 188,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(0, -4),
              repeat_count = 5,
              scale = 0.5
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-output.png",
              line_length = 5,
              width = 50,
              height = 74,
              frame_count = 5,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(30, -8),
              scale = 0.5
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-shadow.png",
              line_length = 1,
              width = 222,
              height = 182,
              animation_speed = electric_drill_animation_speed,
              draw_as_shadow = true,
              shift = util.by_pixel(10, 2),
              repeat_count = 5,
              scale = 0.5
            }
          }
        },
        south =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S.png",
              line_length = 1,
              width = 184,
              height = 192,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(0, -1),
              repeat_count = 5,
              scale = 0.5
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-shadow.png",
              line_length = 1,
              width = 212,
              height = 204,
              animation_speed = electric_drill_animation_speed,
              draw_as_shadow = true,
              shift = util.by_pixel(6, 2),
              repeat_count = 5,
              scale = 0.5
            }
          }
        },
        west =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W.png",
              line_length = 1,
              width = 192,
              height = 188,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(0, -4),
              repeat_count = 5,
              scale = 0.5
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-output.png",
              line_length = 5,
              width = 50,
              height = 60,
              frame_count = 5,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(-31, -13),
              scale = 0.5
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-shadow.png",
              line_length = 1,
              width = 200,
              height = 182,
              animation_speed = electric_drill_animation_speed,
              draw_as_shadow = true,
              shift = util.by_pixel(-5, 2),
              repeat_count = 5,
              scale = 0.5
            }
          }
        }
      },

      shift_animation_waypoints =
      {
        -- Movement should be between 0.25-0.4 distance
        -- Bounds -0.5 - 0.6
        north = {{0, 0}, {0, -0.3}, {0, 0.1}, {0, 0.5}, {0, 0.2}, {0, -0.1}, {0, -0.5}, {0, -0.15}, {0, 0.25}, {0, 0.6}, {0, 0.3}},
        -- Bounds -1 - 0
        east = {{0, 0}, {-0.4, 0}, {-0.1, 0}, {-0.5, 0}, {-0.75, 0}, {-1, 0}, {-0.65, 0}, {-0.3, 0}, {-0.9, 0}, {-0.6, 0}, {-0.3, 0}},
        -- Bounds -1 - 0
        south = {{0, 0}, {0, -0.4}, {0, -0.1}, {0, -0.5}, {0, -0.75}, {0, -1}, {0, -0.65}, {0, -0.3}, {0, -0.9}, {0, -0.6}, {0, -0.3}},
        -- Bounds 0 - 1
        west = {{0, 0}, {0.4, 0}, {0.1, 0}, {0.5, 0}, {0.75, 0}, {1, 0}, {0.65, 0}, {0.3, 0}, {0.9, 0}, {0.6, 0}, {0.3, 0}}
      },

      shift_animation_waypoint_stop_duration = 195 / electric_drill_animation_speed,
      shift_animation_transition_duration = 30 / electric_drill_animation_speed,

      working_visualisations =
      {
        -- dust animation 1
        {
          constant_speed = true,
          synced_fadeout = true,
          align_to_waypoint = true,
          apply_tint = "resource-color",
          animation = electric_mining_drill_smoke(),
          north_position = {0, 0.25},
          east_position = {0, 0},
          south_position = {0, 0.25},
          west_position = {0, 0}
        },

        -- dust animation directional 1
        {
          constant_speed = true,
          fadeout = true,
          apply_tint = "resource-color",
          north_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-smoke.png",
                line_length = 5,
                width = 42,
                height = 58,
                frame_count = 10,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-1, -44),
                scale = 0.5
              }
            }
          },
          east_animation = nil,
          south_animation = nil,
          west_animation = nil
        },

        -- drill back animation
        {
          animated_shift = true,
          always_draw = true,
          north_animation =
          {
            layers =
            {
              electric_mining_drill_animation(),
              electric_mining_drill_shadow_animation()
            }
          },
          east_animation =
          {
            layers =
            {
              electric_mining_drill_horizontal_animation(),
              electric_mining_drill_horizontal_shadow_animation()
            }
          },
          south_animation =
          {
            layers =
            {
              electric_mining_drill_animation(),
              electric_mining_drill_shadow_animation()
            }
          },
          west_animation =
          {
            layers =
            {
              electric_mining_drill_horizontal_animation(),
              electric_mining_drill_horizontal_shadow_animation()
            }
          }
        },

        -- dust animation 2
        {
          constant_speed = true,
          synced_fadeout = true,
          align_to_waypoint = true,
          apply_tint = "resource-color",
          animation = electric_mining_drill_smoke_front(),
          north_position = {0, 0.25},
          east_position = {0, 0},
          south_position = {0, 0.25},
          west_position = {0, 0}
        },

        -- dust animation directional 2
        {
          constant_speed = true,
          fadeout = true,
          apply_tint = "resource-color",
          north_animation = nil,
          east_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-smoke.png",
                line_length = 5,
                width = 46,
                height = 56,
                frame_count = 10,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(24, -12),
                scale = 0.5
              }
            }
          },
          south_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-smoke.png",
                line_length = 5,
                width = 48,
                height = 36,
                frame_count = 10,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-2, 20),
                scale = 0.5
              }
            }
          },
          west_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-smoke.png",
                line_length = 5,
                width = 46,
                height = 54,
                frame_count = 10,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-25, -11),
                scale = 0.5
              }
            }
          }
        },

        -- drill front animation
        {
          animated_shift = true,
          always_draw = true,
          --north_animation = util.empty_sprite(),
          east_animation = electric_mining_drill_horizontal_front_animation(),
          --south_animation = util.empty_sprite(),
          west_animation = electric_mining_drill_horizontal_front_animation()
        },

        -- front frame
        {
          always_draw = true,
          north_animation = nil,
          east_animation =
          {
            priority = "high",
            filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-front.png",
            line_length = 1,
            width = 136,
            height = 148,
            animation_speed = electric_drill_animation_speed,
            shift = util.by_pixel(21, 10),
            scale = 0.5
          },
          south_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-output.png",
                line_length = 5,
                width = 84,
                height = 56,
                frame_count = 5,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-1, 34),
                scale = 0.5
              },
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-front.png",
                line_length = 1,
                width = 190,
                height = 104,
                animation_speed = electric_drill_animation_speed,
                repeat_count = 5,
                shift = util.by_pixel(0, 27),
                scale = 0.5
              }
            }
          },
          west_animation =
          {
            priority = "high",
            filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-front.png",
            line_length = 1,
            width = 134,
            height = 140,
            animation_speed = electric_drill_animation_speed,
            shift = util.by_pixel(-22, 12),
            scale = 0.5
          }
        },

        -- LEDs
        electric_mining_drill_status_leds_working_visualisation(),

        -- light
        --electric_mining_drill_primary_light,
        electric_mining_drill_secondary_light
      }
    },

    wet_mining_graphics_set =
    {
      drilling_vertical_movement_duration = 10 / electric_drill_animation_speed,
      animation_progress = 1,

      status_colors = electric_mining_drill_status_colors(),

      circuit_connector_layer = "object",
      circuit_connector_secondary_draw_order = {north = 14, east = 48, south = 48, west = 48},

      animation =
      {
        north =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-wet.png",
              line_length = 1,
              width = 190,
              height = 198,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(0, -7),
              repeat_count = 5,
              scale = 0.5
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-output.png",
              line_length = 5,
              width = 60,
              height = 66,
              frame_count = 5,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(-3, -44),
              scale = 0.5
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-wet-shadow.png",
              line_length = 1,
              width = 248,
              height = 222,
              animation_speed = electric_drill_animation_speed,
              draw_as_shadow = true,
              shift = util.by_pixel(12, 1),
              repeat_count = 5,
              scale = 0.5
            }
          }
        },
        west =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet.png",
              line_length = 1,
              width = 194,
              height = 208,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(1, -9),
              repeat_count = 5,
              scale = 0.5
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-output.png",
              line_length = 5,
              width = 50,
              height = 60,
              frame_count = 5,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(-31, -13),
              scale = 0.5
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-shadow.png",
              line_length = 1,
              width = 260,
              height = 202,
              animation_speed = electric_drill_animation_speed,
              draw_as_shadow = true,
              shift = util.by_pixel(9, 6),
              repeat_count = 5,
              scale = 0.5
            }
          }
        },
        south =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet.png",
              line_length = 1,
              width = 192,
              height = 210,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(1, -5.5),
              repeat_count = 5,
              scale = 0.5
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-shadow.png",
              line_length = 1,
              width = 248,
              height = 192,
              animation_speed = electric_drill_animation_speed,
              draw_as_shadow = true,
              shift = util.by_pixel(12, 5),
              repeat_count = 5,
              scale = 0.5
            }
          }
        },
        east =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet.png",
              line_length = 1,
              width = 194,
              height = 208,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(-2, -9),
              repeat_count = 5,
              scale = 0.5
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-output.png",
              line_length = 5,
              width = 50,
              height = 74,
              frame_count = 5,
              animation_speed = electric_drill_animation_speed,
              shift = util.by_pixel(30, -8),
              scale = 0.5
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-shadow.png",
              line_length = 1,
              width = 226,
              height = 202,
              animation_speed = electric_drill_animation_speed,
              draw_as_shadow = true,
              shift = util.by_pixel(9, 5),
              repeat_count = 5,
              scale = 0.5
            }
          }
        }
      },

      shift_animation_waypoints =
      {
        -- Movement should be between 0.25-0.4 distance
        -- Bounds -0.5 - 0.2
        north = {{0, 0}, {0, -0.4}, {0, -0.1}, {0, 0.2}},
        -- Bounds -0.3 - 0
        east = {{0, 0}, {-0.3, 0}, {0, 0}, {-0.25, 0}},
        -- Bounds -0.7 - 0
        south = {{0, 0}, {0, -0.4}, {0, -0.7}, {0, -0.3}},
        -- Bounds 0 - 0.3
        west = {{0, 0}, {0.3, 0}, {0, 0}, {0.25, 0}}
      },

      shift_animation_waypoint_stop_duration = 195 / electric_drill_animation_speed,
      shift_animation_transition_duration = 30 / electric_drill_animation_speed,

      working_visualisations =
      {
        -- dust animation 1
        {
          constant_speed = true,
          synced_fadeout = true,
          align_to_waypoint = true,
          apply_tint = "resource-color",
          animation = electric_mining_drill_smoke(),
          north_position = {0, 0.25},
          east_position = {0, 0},
          south_position = {0, 0.25},
          west_position = {0, 0}
        },

        -- dust animation directional 1
        {
          constant_speed = true,
          fadeout = true,
          apply_tint = "resource-color",
          north_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-smoke.png",
                line_length = 5,
                width = 42,
                height = 58,
                frame_count = 10,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-1, -44),
                scale = 0.5
              }
            }
          },
          east_animation = nil,
          south_animation = nil,
          west_animation = nil
        },

        -- drill back animation
        {
          animated_shift = true,
          always_draw = true,
          north_animation =
          {
            layers =
            {
              electric_mining_drill_animation(),
              electric_mining_drill_shadow_animation()
            }
          },
          east_animation =
          {
            layers =
            {
              electric_mining_drill_horizontal_animation(),
              electric_mining_drill_horizontal_shadow_animation()
            }
          },
          south_animation =
          {
            layers =
            {
              electric_mining_drill_animation(),
              electric_mining_drill_shadow_animation()
            }
          },
          west_animation =
          {
            layers =
            {
              electric_mining_drill_horizontal_animation(),
              electric_mining_drill_horizontal_shadow_animation()
            }
          }
        },

        -- dust animation 2
        {
          constant_speed = true,
          synced_fadeout = true,
          align_to_waypoint = true,
          apply_tint = "resource-color",
          animation = electric_mining_drill_smoke_front()
        },

        -- dust animation directional 2
        {
          constant_speed = true,
          fadeout = true,
          apply_tint = "resource-color",
          north_animation = nil,
          east_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-smoke.png",
                line_length = 5,
                width = 46,
                height = 56,
                frame_count = 10,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(24, -12),
                scale = 0.5
              }
            }
          },
          south_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-smoke.png",
                line_length = 5,
                width = 48,
                height = 36,
                frame_count = 10,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-2, 20),
                scale = 0.5
              }
            }
          },
          west_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-smoke.png",
                line_length = 5,
                width = 46,
                height = 54,
                frame_count = 10,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-25, -11),
                scale = 0.5
              }
            }
          }
        },

        -- fluid window background (bottom)
        {
          -- render_layer = "lower-object-above-shadow",
          secondary_draw_order = -49,
          always_draw = true,
          north_animation = nil,
          east_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-window-background.png",
                line_length = 1,
                width = 22,
                height = 14,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(0, -52),
                scale = 0.5
              }
            }
          },
          south_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-window-background.png",
                line_length = 1,
                width = 30,
                height = 20,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-2, -43),
                scale = 0.5
              }
            }
          },
          west_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-window-background.png",
                line_length = 1,
                width = 22,
                height = 14,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(0, -52),
                scale = 0.5
              }
            }
          }
        },

        -- fluid base (bottom)
        {
          always_draw = true,
          -- render_layer = "lower-object-above-shadow",
          secondary_draw_order = -48,
          apply_tint = "input-fluid-base-color",
          north_animation = nil,
          east_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-fluid-background.png",
                line_length = 1,
                width = 22,
                height = 14,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(0, -52),
                scale = 0.5
              }
            }
          },
          south_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-fluid-background.png",
                line_length = 1,
                width = 28,
                height = 18,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-2, -43),
                scale = 0.5
              }
            }
          },
          west_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-fluid-background.png",
                line_length = 1,
                width = 22,
                height = 14,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(0, -52),
                scale = 0.5
              }
            }
          }
        },

        -- fluid flow (bottom)
        {
          --render_layer = "lower-object-above-shadow",
          secondary_draw_order = -47,
          always_draw = true,
          apply_tint = "input-fluid-flow-color",
          north_animation = nil,
          east_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-fluid-flow.png",
                line_length = 1,
                width = 24,
                height = 14,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(0, -52),
                scale = 0.5
              }
            }
          },
          south_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-fluid-flow.png",
                line_length = 1,
                width = 26,
                height = 16,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-2, -42),
                scale = 0.5
              }
            }
          },
          west_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-fluid-flow.png",
                line_length = 1,
                width = 24,
                height = 14,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(0, -52),
                scale = 0.5
              }
            }
          }
        },

        -- drill front animation
        {
          animated_shift = true,
          always_draw = true,
          --north_animation = util.empty_sprite(),
          east_animation = electric_mining_drill_horizontal_front_animation(),
          --south_animation = util.empty_sprite(),
          west_animation = electric_mining_drill_horizontal_front_animation()
        },

        -- fluid window background (front)
        {
          always_draw = true,
          north_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-wet-window-background.png",
                line_length = 1,
                width = 172,
                height = 90,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(0, 9),
                scale = 0.5
              }
            }
          },
          west_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-window-background-front.png",
                line_length = 1,
                width = 80,
                height = 106,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(14, 10),
                scale = 0.5
              }
            }
          },
          south_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-window-background-front.png",
                line_length = 1,
                width = 172,
                height = 22,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(0, -7),
                scale = 0.5
              }
            }
          },
          east_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-window-background-front.png",
                line_length = 1,
                width = 82,
                height = 110,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-15, 9),
                scale = 0.5
              }
            }
          }
        },

        -- fluid base (front)
        {
          always_draw = true,
          apply_tint = "input-fluid-base-color",
          north_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-wet-fluid-background.png",
                line_length = 1,
                width = 178,
                height = 94,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(0, 9),
                scale = 0.5
              }
            }
          },
          west_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-fluid-background-front.png",
                line_length = 1,
                width = 80,
                height = 102,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(14, 11),
                scale = 0.5
              }
            }
          },
          south_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-fluid-background-front.png",
                line_length = 1,
                width = 178,
                height = 28,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(0, -7),
                scale = 0.5
              }
            }
          },
          east_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-fluid-background-front.png",
                line_length = 1,
                width = 82,
                height = 106,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-15, 10),
                scale = 0.5
              }
            }
          }
        },

        -- fluid flow (front)
        {
          always_draw = true,
          apply_tint = "input-fluid-flow-color",
          north_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-wet-fluid-flow.png",
                line_length = 1,
                width = 172,
                height = 88,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(0, 10),
                scale = 0.5
              }
            }
          },
          west_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-fluid-flow-front.png",
                line_length = 1,
                width = 78,
                height = 102,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(14, 11),
                scale = 0.5
              }
            }
          },
          south_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-fluid-flow-front.png",
                line_length = 1,
                width = 172,
                height = 22,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(0, -8),
                scale = 0.5
              }
            }
          },
          east_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-fluid-flow-front.png",
                line_length = 1,
                width = 78,
                height = 106,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-14, 10),
                scale = 0.5
              }
            }
          }
        },

        -- front frame (wet)
        {
          always_draw = true,
          north_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-wet-front.png",
                line_length = 1,
                width = 200,
                height = 130,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(0, 16),
                scale = 0.5
              }
            }
          },
          west_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-front.png",
                line_length = 1,
                width = 208,
                height = 144,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-4, 12),
                scale = 0.5
              }
            }
          },
          south_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-output.png",
                line_length = 5,
                width = 84,
                height = 56,
                frame_count = 5,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(-1, 34),
                scale = 0.5
              },
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-front.png",
                line_length = 1,
                width = 192,
                height = 140,
                animation_speed = electric_drill_animation_speed,
                repeat_count = 5,
                shift = util.by_pixel(0, 18),
                scale = 0.5
              }
            }
          },
          east_animation =
          {
            layers =
            {
              {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-front.png",
                line_length = 1,
                width = 208,
                height = 148,
                animation_speed = electric_drill_animation_speed,
                shift = util.by_pixel(3, 11),
                scale = 0.5
              }
            }
          }
        },

        -- LEDs
        electric_mining_drill_status_leds_working_visualisation(),

        -- light
        --electric_mining_drill_primary_light,
        electric_mining_drill_secondary_light
      }
    },

    perceived_performance = {maximum = 30.0},

    integration_patch =
    {
      north =
      {
        priority = "high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-integration.png",
        width = 216,
        height = 218,
        shift = util.by_pixel(-1, 1),
        scale = 0.5
      },
      east =
      {
        priority = "high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-integration.png",
        width = 236,
        height = 214,
        shift = util.by_pixel(3, 2),
        scale = 0.5
      },
      south =
      {
        priority = "high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-integration.png",
        width = 214,
        height = 230,
        shift = util.by_pixel(0, 3),
        scale = 0.5
      },
      west =
      {
        priority = "high",
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-integration.png",
        width = 234,
        height = 214,
        shift = util.by_pixel(-4, 1),
        scale = 0.5
      }
    },

    mining_speed = 0.5,
    energy_source =
    {
      type = "electric",
      emissions_per_minute = { pollution = 10 },
      usage_priority = "secondary-input"
    },
    energy_usage = "90kW",
    resource_searching_radius = 2.49,
    vector_to_place_result = {0, -1.85},
    module_slots = 3,
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
      width = 10,
      height = 10
    },
    monitor_visualization_tint = {78, 173, 255},
    fast_replaceable_group = "mining-drill",

    circuit_connector = circuit_connector_definitions["electric-mining-drill"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "mining-drill",
    name = "burner-mining-drill",
    icon = "__base__/graphics/icons/burner-mining-drill.png",
    flags = {"placeable-neutral", "player-creation"},
    resource_categories = {"basic-solid"},
    minable = {mining_time = 0.3, result = "burner-mining-drill"},
    max_health = 150,
    corpse = "burner-mining-drill-remnants",
    dying_explosion = "burner-mining-drill-explosion",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    mining_speed = 0.25,
    working_sound =
    {
      sound = sound_variations("__base__/sound/burner-mining-drill", 2, 0.6, volume_multiplier("tips-and-tricks", 0.8)),
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    open_sound = sounds.drill_open,
    close_sound = sounds.drill_close,
    allowed_effects = {}, -- no beacon effects on the burner drill
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = { pollution = 12 },
      light_flicker = {color = {0,0,0}},
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 3
        }
      }
    },
    energy_usage = "150kW",
    graphics_set =
    {
      animation =
      {
        north =
        {
          layers =
          {
            {
              priority = "high",
              width = 173,
              height = 188,
              line_length = 4,
              shift = util.by_pixel(2.75, 0.5),
              filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-N.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              scale = 0.5
            },
            {
              priority = "high",
              width = 217,
              height = 150,
              line_length = 4,
              shift = util.by_pixel(23.75, -1),
              filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-N-shadow.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        },
        east =
        {
          layers =
          {
            {
              priority = "high",
              width = 185,
              height = 168,
              line_length = 4,
              shift = util.by_pixel(2.75, 1),
              filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-E.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              scale = 0.5
            },
            {
              priority = "high",
              width = 185,
              height = 128,
              line_length = 4,
              shift = util.by_pixel(13.75, 0.5),
              filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-E-shadow.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        },
        south =
        {
          layers =
          {
            {
              priority = "high",
              width = 174,
              height = 174,
              line_length = 4,
              shift = util.by_pixel(0.5, -0.5),
              filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-S.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              scale = 0.5
            },
            {
              priority = "high",
              width = 174,
              height = 137,
              line_length = 4,
              shift = util.by_pixel(11, 2.75),
              filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-S-shadow.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        },
        west =
        {
          layers =
          {
            {
              priority = "high",
              width = 180,
              height = 176,
              line_length = 4,
              shift = util.by_pixel(-1.5, 0),
              filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-W.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              scale = 0.5
            },
            {
              priority = "high",
              width = 176,
              height = 130,
              line_length = 4,
              shift = util.by_pixel(7.5, 1),
              filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-W-shadow.png",
              frame_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      }
    },
    monitor_visualization_tint = {78, 173, 255},
    resource_searching_radius = 0.99,
    vector_to_place_result = {-0.5, -1.3},
    fast_replaceable_group = "mining-drill",

    circuit_connector = circuit_connector_definitions["burner-mining-drill"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  }
}
)

data:extend(
{
  {
    type = "mining-drill",
    name = "pumpjack",
    icon = "__base__/graphics/icons/pumpjack.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "pumpjack"},
    resource_categories = {"basic-fluid"},
    max_health = 200,
    corpse = "pumpjack-remnants",
    dying_explosion = "pumpjack-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1,
    energy_source =
    {
      type = "electric",
      emissions_per_minute = { pollution = 10 },
      usage_priority = "secondary-input"
    },
    output_fluid_box =
    {
      volume = 1000,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {
          direction = defines.direction.north,
          positions = {{1, -1}, {1, -1}, {-1, 1}, {-1, 1}},
          flow_direction = "output"
        }
      }
    },
    energy_usage = "90kW",
    mining_speed = 1,
    resource_searching_radius = 0.49,
    vector_to_place_result = {0, 0},
    module_slots = 2,
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
      width = 12,
      height = 12
    },
    monitor_visualization_tint = {78, 173, 255},
    base_render_layer = "object",
    base_picture =
    {
      sheets =
      {
        {
          filename = "__base__/graphics/entity/pumpjack/pumpjack-base.png",
          priority = "extra-high",
          width = 261,
          height = 273,
          shift = util.by_pixel(-2.25, -4.75),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/pumpjack/pumpjack-base-shadow.png",
          width = 220,
          height = 220,
          scale = 0.5,
          draw_as_shadow = true,
          shift = util.by_pixel(6, 0.5)
        }
      }
    },
    graphics_set =
    {
      animation =
      {
        north =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__base__/graphics/entity/pumpjack/pumpjack-horsehead.png",
              animation_speed = 0.5,
              scale = 0.5,
              line_length = 8,
              width = 206,
              height = 202,
              frame_count = 40,
              shift = util.by_pixel(-4, -24)
            },
            {
              priority = "high",
              filename = "__base__/graphics/entity/pumpjack/pumpjack-horsehead-shadow.png",
              animation_speed = 0.5,
              draw_as_shadow = true,
              line_length = 8,
              width = 309,
              height = 82,
              frame_count = 40,
              scale = 0.5,
              shift = util.by_pixel(17.75, 14.5)
            }
          }
        }
      }
    },
    open_sound = {filename = "__base__/sound/open-close/pumpjack-open.ogg", volume = 0.5},
    close_sound = {filename = "__base__/sound/open-close/pumpjack-close.ogg", volume = 0.5},
    working_sound =
    {
      sound = {filename = "__base__/sound/pumpjack.ogg", volume = 0.7, audible_distance_modifier = 0.6},
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 10
    },
    fast_replaceable_group = "pumpjack",

    circuit_connector = circuit_connector_definitions["pumpjack"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  }
}
)

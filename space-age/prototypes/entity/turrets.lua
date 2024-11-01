require("circuit-connector-sprites")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

local util = require('util')

local rocket_turret_shift = -20
local tesla_turret_shift = -26

function rocket_turret_rising(inputs)
  return
{
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-rising",
        {
          priority = "medium",
          direction_count = 4,
          shift = util.by_pixel( 0.0, 0.0+rocket_turret_shift),
          scale = 0.5,
          frame_count = 18,
          line_length = 18,
          run_mode = inputs.run_mode or "forward",
        }),
        util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-rising-glow",
        {
          priority = "medium",
          direction_count = 4,
          shift = util.by_pixel( 0.0, 0.0+rocket_turret_shift),
          scale = 0.5,
          frame_count = 18,
          line_length = 18,
          run_mode = inputs.run_mode or "forward",
          blend_mode = "additive",
          draw_as_light = true,
        }),
        util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-rising-mask",
        {
          flags = {"mask"},
          direction_count = 4,
          shift = util.by_pixel( 0.0, 0.0+rocket_turret_shift),
          scale = 0.5,
          frame_count = 18,
          line_length = 18,
          apply_runtime_tint = true,
          run_mode = inputs.run_mode or "forward",
        }),
        util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-rising-shadow",
        {
          direction_count = 4,
          shift = util.by_pixel( 0.0, 0.0+rocket_turret_shift),
          scale = 0.5,
          frame_count = 18,
          line_length = 18,
          draw_as_shadow = true,
          run_mode = inputs.run_mode or "forward",
        })
      }
}
end

function rocket_turret_attack(inputs)
  return
{
  layers =
  {
    util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-shooting",
    {
      slice = 1,
      direction_count = 64,
      shift = util.by_pixel( 0.0, 0.0+rocket_turret_shift),
      scale = 0.5
    }),
    util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-shooting-glow",
    {
      slice = 1,
      direction_count = 64,
      shift = util.by_pixel( 0.0, 0.0+rocket_turret_shift),
      scale = 0.5,
      draw_as_light = true,
      blend_mode = "additive"
    }),
    util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-shooting-mask",
    {
      flags = {"mask"},
      apply_runtime_tint = true,
      slice = 1,
      direction_count = 64,
      shift = util.by_pixel( 0.0, 0.0+rocket_turret_shift),
      scale = 0.5
    }),
    util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-shooting-shadow",
    {
      draw_as_shadow = true,
      slice = 1,
      direction_count = 64,
      shift = util.by_pixel( 0.0, 0.0+rocket_turret_shift),
      scale = 0.5
    })
  }
}
end

function tesla_turret_rising(inputs)
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-rising",
      {
        priority = "medium",
        direction_count = 4,
        shift = util.by_pixel(0,0+tesla_turret_shift),
        scale = 0.5,
        frame_count = 16,
        line_length = 16,
        run_mode = inputs.run_mode or "forward",
      }),
      util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-rising-mask",
      {
        flags = {"mask"},
        apply_runtime_tint = true,
        priority = "medium",
        direction_count = 4,
        shift = util.by_pixel( 0, 0+tesla_turret_shift),
        scale = 0.5,
        frame_count = 16,
        line_length = 16,
        run_mode = inputs.run_mode or "forward",
      }),
      util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-rising-emit",
      {
        priority = "medium",
        direction_count = 4,
        shift = util.by_pixel(0,0+tesla_turret_shift),
        scale = 0.5,
        draw_as_glow = true,
        blend_mode = "additive",
        frame_count = 16,
        line_length = 16,
        run_mode = inputs.run_mode or "forward",
      }),
      util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-rising-shadow",
      {
        draw_as_shadow = true,
        priority = "medium",
        direction_count = 4,
        shift = util.by_pixel(96,0+tesla_turret_shift),
        scale = 0.5,
        frame_count = 16,
        line_length = 16,
        run_mode = inputs.run_mode or "forward",
      }),
    }
  }
  end


function tesla_turret_ready(inputs)
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking",
      {
        direction_count = 64,
        frame_count = 1,
        repeat_count = 30,
        shift = util.by_pixel(0,0+tesla_turret_shift),
        scale = 0.5
      }),
      util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking-mask",
      {
        flags = {"mask"},
        apply_runtime_tint = true,
        direction_count = 64,
        frame_count = 1,
        repeat_count = 30,
        shift = util.by_pixel( 0, 0+tesla_turret_shift),
        scale = 0.5
      }),
      util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking-emit",
      {
        direction_count = 64,
        frame_count = 1,
        repeat_count = 30,
        shift = util.by_pixel(0,0+tesla_turret_shift),
        scale = 0.5,
        draw_as_glow = true,
        blend_mode = "additive"
      }),
      util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking-shadow",
      {
        draw_as_shadow = true,
        direction_count = 64,
        frame_count = 1,
        repeat_count = 30,
        shift = util.by_pixel(96,0+tesla_turret_shift),
        scale = 0.5
      }),
    }
  }
  end

  function tesla_turret_cooldown(inputs)
    return
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking",
        {
          direction_count = 64,
          frame_count = 1,
          repeat_count = 30,
          shift = util.by_pixel(0,0+tesla_turret_shift),
          scale = 0.5
        }),
        util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking-mask",
        {
          flags = {"mask"},
          apply_runtime_tint = true,
          direction_count = 64,
          frame_count = 1,
          repeat_count = 30,
          shift = util.by_pixel( 0, 0+tesla_turret_shift),
          scale = 0.5
        }),
        util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking-emit",
        {
          direction_count = 64,
          frame_count = 1,
          repeat_count = 30,
          shift = util.by_pixel(0,0+tesla_turret_shift),
          scale = 0.5,
          draw_as_glow = true,
          blend_mode = "additive"
        }),
        util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking-facelight",
        {
          direction_count = 64,
          frame_count = 1,
          repeat_count = 30,
          shift = util.by_pixel(0,0+tesla_turret_shift),
          scale = 0.5,
          draw_as_glow = true,
          blend_mode = "additive"
        }),
        util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking-shadow",
        {
          draw_as_shadow = true,
          direction_count = 64,
          frame_count = 1,
          repeat_count = 30,
          shift = util.by_pixel(96,0+tesla_turret_shift),
          scale = 0.5
        }),
        util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-sfx-active",
        {
          direction_count = 1,
          duplicate_first_direction = true,
          frame_count = 30,
          shift = util.by_pixel(0,0+tesla_turret_shift),
          scale = 0.5,
          animation_speed = 0.5,
          draw_as_glow = true,
          blend_mode = "additive"
        }),
      }
    }
    end

  function tesla_turret_LED(inputs)
    return
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-LED",
        {
          direction_count = 1,
          duplicate_first_direction = true,
          shift = util.by_pixel(0,0+tesla_turret_shift),
          draw_as_glow = true,
          blend_mode = "additive",
          scale = 0.5,
          frame_count = 5
        }),
      }
    }
  end

data:extend(
{
  {
    type = "ammo-turret",
    name = "railgun-turret",
    icon = "__space-age__/graphics/icons/railgun-turret.png",
    flags = {"placeable-player", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.5, result = "railgun-turret"},
    fast_replaceable_group = "ammo-turret",
    max_health = 4000,
    corpse = "railgun-turret-remnants",
    dying_explosion = "gun-turret-explosion",
    collision_box = {{-1.41, -1.9 }, {1.41, 2.1}},
    selection_box = {{-1.5, -2.5 }, {1.5, 2.5}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = "10MJ",
      input_flow_limit = "10MW",
      usage_priority = "primary-input"
    },
    energy_per_shot = "10MJ",
    tile_height = 5,
    turret_base_has_direction = true,
    allow_turning_when_starting_attack = true,
    prepare_with_no_ammo = false,
    damaged_trigger_effect = hit_effects.entity(),
    heating_energy = "50kW",
    rotation_speed = 0.005,
    preparing_speed = 0.04,
    preparing_sound = space_age_sounds.railgun_turret_activate,
    folding_sound = space_age_sounds.railgun_turret_deactivate,
    rotating_sound = space_age_sounds.railgun_turret_rotate,
    automated_ammo_count = 10,
    inventory_size = 1,
    folding_speed = 0.04,
    attacking_speed = 0.35,
    starting_attack_speed = 0.02,
    ending_attack_speed = 0.05,
    alert_when_attacking = true,
    circuit_connector = circuit_connector_definitions["railgun-turret"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    open_sound = {filename = "__base__/sound/open-close/turret-open.ogg", volume = 0.6},
    close_sound = {filename = "__base__/sound/open-close/turret-close.ogg", volume = 0.6},
    graphics_set =
    {
      base_visualisation =
      {
        animation = require("__space-age__.prototypes.entity.railgun-turret-pictures").base_picture
      }
    },
    preparing_animation = require("__space-age__.prototypes.entity.railgun-turret-pictures").neutral_animation,
    prepared_animation = require("__space-age__.prototypes.entity.railgun-turret-pictures").aiming_animation,
    starting_attack_animation = require("__space-age__.prototypes.entity.railgun-turret-pictures").warmup_animation,
    attacking_animation = require("__space-age__.prototypes.entity.railgun-turret-pictures").shooting_animation,
    ending_attack_animation = require("__space-age__.prototypes.entity.railgun-turret-pictures").cooldown_animation,
    folding_animation = require("__space-age__.prototypes.entity.railgun-turret-pictures").neutral_animation,
    folded_animation = require("__space-age__.prototypes.entity.railgun-turret-pictures").neutral_animation,
    resource_indicator_animation = require("__space-age__.prototypes.entity.railgun-turret-pictures").resource_indicator_animation,
    special_effect =
    {
      type = "mask-by-circle",
      center =
      {
        default = {0, 0},
        south = {0.06, -0.65},
        south_east = {0.33, -1.06},
        south_west = {-0.27, -0.87},
        north = {-0.06, -1.22},
        north_east = {0.22, -1.51},
        north_west = {-0.22, -1.34},
        west = {-0.33, -1.1},
        east = {0.45, -1.17}
      },
      min_radius = 0,
      max_radius = 2.25,
      falloff = 0.25,
      attacking_min_radius = 0,  -- negative values mask out inside of the circle (positive values mask out outside)
      attacking_max_radius = -2.25,
      attacking_falloff = 0.75,
    },

    attack_parameters =
    {
      type = "projectile",
      ammo_category = "railgun",
      health_penalty = -1,
      cooldown = 120,
      projectile_creation_distance = 3.6,
      projectile_center = {0, 0},
      apply_projection_to_projectile_creation_position = false,
      shell_particle =
      {
        name = "railgun-shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0},
        creation_distance = -6,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      min_range = 3.5,
      range = 40,
      turn_range = 0.20,
      sound = space_age_sounds.railgun_turret_gunshot
    },

    call_for_help_radius = 40,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/gun-turret/gun-turret-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 32,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "ammo-turret",
    name = "rocket-turret",
    icon = "__space-age__/graphics/icons/rocket-turret.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "rocket-turret"},
    fast_replaceable_group = "ammo-turret",
    max_health = 400,
    corpse = "rocket-turret-remnants",
    dying_explosion = "gun-turret-explosion",
    collision_box = {{-1.2, -1.2 }, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5 }, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    heating_energy = "50kW",
    rotation_speed = 0.005,
    preparing_speed = 0.08,
    preparing_sound =
    {
      variations = sound_variations("__space-age__/sound/entity/rocket-turret/rocket-turret-activate", 2, 0.4),
      aggregation = {max_count = 2, remove = true, count_already_playing = true},
    },
    folding_sound =
    {
      variations = sound_variations("__space-age__/sound/entity/rocket-turret/rocket-turret-deactivate", 2, 0.5),
      aggregation = {max_count = 2, remove = true, count_already_playing = true},
    },
    rotating_sound =
    {
      sound =
      {
        variations = {filename = "__space-age__/sound/entity/rocket-turret/rocket-turret-rotation-loop.ogg", volume = 0.15},
        aggregation = {max_count = 2, remove = true, count_already_playing = true},
      },
      stopped_sound =
      {
        variations = {filename = "__space-age__/sound/entity/rocket-turret/rocket-turret-rotation-stop.ogg", volume = 0.5},
        aggregation = {max_count = 1, remove = true, count_already_playing = true},
      },
      minimal_change_per_tick = 0.001,
      minimal_sound_duration_for_stopped_sound = 10
    },
    folding_speed = 0.08,
    inventory_size = 1,
    automated_ammo_count = 10,
    attacking_speed = 0.5,
    alert_when_attacking = true,
    circuit_connector = circuit_connector_definitions["rocket-turret"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    open_sound = {filename = "__base__/sound/open-close/turret-open.ogg", volume = 0.6},
    close_sound = {filename = "__base__/sound/open-close/turret-close.ogg", volume = 0.6},
    folded_animation = rocket_turret_rising({}),
    preparing_animation = rocket_turret_rising({}),
    prepared_animation = rocket_turret_attack({}),
    attacking_animation = rocket_turret_attack({}),
    folding_animation = rocket_turret_rising({run_mode = "backward"}),
    graphics_set =
    {
      base_visualisation =
      {
        animation =
        {
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-base",
		    		              {
		    		                priority = "high",
                            frame_count = 1,
		    		                scale = 0.5,
		    		                shift = util.by_pixel( 0.0, 0.0+rocket_turret_shift),
		    		              }),
            util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-base-mask",
		    		              {
		    		                flags = {"mask", "low-object"},
                            frame_count = 1,
                            apply_runtime_tint = true,
		    		                scale = 0.5,
		    		                shift = util.by_pixel( 0.0, 0.0+rocket_turret_shift),
		    		              }),
            util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-base-shadow",
		    		              {
		    		                frame_count = 1,
                            scale = 0.5,
		    		                shift = util.by_pixel( 0.0, 0.0+rocket_turret_shift),
                            draw_as_shadow = true,
		    		              }),

          }
        }
      }
    },

    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 120,
      projectile_creation_distance = 1,
      projectile_center = {0, 0},
      min_range = 15,
      range = 36,
      sound =
      {
        variations = sound_variations("__space-age__/sound/ammo/rocket-turret-launcher", 7, 0.7, volume_multiplier("main-menu", 1.8)),
        aggregation = { max_count = 4, remove = true, count_already_playing = true },
      },
      projectile_creation_offsets =
      {
        util.by_pixel(34, 25 - 32),
        util.by_pixel(-34, 25 - 32),
        util.by_pixel(31, 30 - 32),
        util.by_pixel(-31, 30 - 32),
        util.by_pixel(27, 35 - 32),
        util.by_pixel(-27, 35 - 32),
        -- 32 px is the rocket projectile height, so we need to subtract it from the y offset
      }
    },

    call_for_help_radius = 40,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/gun-turret/gun-turret-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 32,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "electric-turret",
    name = "tesla-turret",
    icon = "__space-age__/graphics/icons/tesla-turret.png",
    flags = {"placeable-player", "placeable-enemy", "player-creation"},
    minable = {mining_time = 0.5, result = "tesla-turret"},
    fast_replaceable_group = "tesla-turret",
    max_health = 1000,
    collision_box = {{-1.7, -1.7 }, {1.7, 1.7}},
    selection_box = {{-2, -2 }, {2, 2}},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true, is_object=true, is_lower_object=true}},
    damaged_trigger_effect = hit_effects.entity(),
    start_attacking_only_when_can_shoot = true,
    rotation_speed = 0.005,
    preparing_speed = 0.1,
    folding_speed = 0.1,
    ending_attack_speed = 1 / (30 + 1), -- Must be clocked to the beam duration so the face light turns off at the right time
    circuit_connector = circuit_connector_definitions["tesla-turret"], -- TODO: generate points for tesla-turret
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity/tesla-turret/tesla-turret-base.ogg", volume = 0.3},
      use_doppler_shift = false,
      fade_in_ticks = 4,
      fade_out_ticks = 20,
    },
    preparing_sound = space_age_sounds.tesla_turret_activate,
    folding_sound = space_age_sounds.tesla_turret_deactivate,
    rotating_sound = space_age_sounds.tesla_turret_rotate,
    corpse = "tesla-turret-remnants",
    dying_explosion = "laser-turret-explosion",
    energy_source =
    {
      type = "electric",
      buffer_capacity = "15MJ",
      input_flow_limit = "7MW",
      drain = "1MW",
      usage_priority = "primary-input"
    },
    folded_animation = tesla_turret_rising({}),
    preparing_animation = tesla_turret_rising({}),
    prepared_animation = tesla_turret_ready({}),
    ending_attack_animation = tesla_turret_cooldown({}),
    folding_animation = tesla_turret_rising({run_mode = "backward"}),
    energy_glow_animation = laser_turret_shooting_glow(),
    resource_indicator_animation = tesla_turret_LED(),
    glow_light_intensity = 0.5, -- defaults to 0
    graphics_set =
    {
      base_visualisation =
      {
        {
          animation =
          {
            layers =
            {
              util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-base",
                     {
                        frame_count = 1,
                        repeat_count=30,
                        shift = util.by_pixel(0, 0+tesla_turret_shift),
                        scale = 0.5,
                        animation_speed = 0.5
                     }),
              util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-base-mask",
                     {
                        flags = {"mask"},
                        apply_runtime_tint = true,
                        frame_count = 1,
                        repeat_count=30,
                        shift = util.by_pixel(0, 0+tesla_turret_shift),
                        scale = 0.5
                     }),
              util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-base-shadow",
                     {
                        frame_count = 1,
                        repeat_count=30,
                        draw_as_shadow = true,
                        shift = util.by_pixel(32, 0+tesla_turret_shift),
                        scale = 0.5
                     }),
              util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-base-emit",
                     {
                        frame_count = 1,
                        repeat_count=30,
                        shift = util.by_pixel(0, 0+tesla_turret_shift),
                        scale = 0.5,
                        draw_as_glow = true,
                        blend_mode = "additive"
                     }),
            }
          }
        },
        {
          enabled_states = { "folded", "preparing", "rotate-for-folding", "folding" },
          draw_when_no_energy = false,
          draw_when_frozen = false,
          animation =
          {
            layers =
            {
              util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-sfx-idle-2",
                      {
                        frame_count = 50,
                        repeat_count = 4,
                        shift = util.by_pixel(0, 0+tesla_turret_shift),
                        scale = 0.5,
                        animation_speed = 0.33,
                        draw_as_glow = true,
                        blend_mode = "additive"
                      }),
              util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-sfx-idle-1",
                      {
                        frame_count = 40,
                        repeat_count = 5,
                        shift = util.by_pixel(0, 0+tesla_turret_shift),
                        scale = 0.5,
                        animation_speed = 0.33,
                        draw_as_glow = true,
                        blend_mode = "additive"
                      }),
            },
          }
        },
        {
          enabled_states = { "prepared", "starting-attack", "attacking", "ending-attack" },
          draw_when_no_energy = false,
          draw_when_frozen = false,
          animation  =
          {
            layers =
            {
              util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-sfx-passive",
              {
                 frame_count = 30,
                 shift = util.by_pixel(0, 0+tesla_turret_shift),
                 scale = 0.5,
                 animation_speed = 0.5,
                 draw_as_glow = true,
                 blend_mode = "additive"
              })
            }
          }
        }
      }
    },

    attack_parameters =
    {
      type = "beam",
      cooldown = 120,
      range = 30,
      range_mode = "center-to-bounding-box",
      fire_penalty = 0.9,
      source_direction_count = 64,
      source_offset = {0, -0.55},
      ammo_category = "tesla",
      ammo_type =
      {
        energy_consumption = "12MJ",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              -- Chain effect must go first in case the beam kills the target
              {
                type = "nested-result",
                action =
                {
                  type = "direct",
                  action_delivery =
                  {
                    type = "chain",
                    chain = "chain-tesla-turret-chain",
                  }
                }
              },
              {
                type = "nested-result",
                action =
                {
                  type = "direct",
                  action_delivery =
                  {
                    type = "beam",
                    beam = "chain-tesla-turret-beam-start",
                    max_length = 40,
                    duration = 30,
                    add_to_shooter = false,
                    destroy_with_source_or_target = false,
                    source_offset = {0, -2.6}
                  }
                }
              }
            }
          }
        }
      }
    },

    call_for_help_radius = 40,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/laser-turret/laser-turret-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 32,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "sticker",
    name = "tesla-turret-stun",
    flags = {"not-on-map"},
    hidden = true,
    duration_in_ticks = 30,
    target_movement_modifier = 0.05,
    vehicle_speed_modifier = 0.25
  },
  {
    type = "sticker",
    name = "tesla-turret-slow",
    flags = {"not-on-map"},
    hidden = true,
    duration_in_ticks = 120,
    target_movement_modifier = 0.5,
    vehicle_speed_modifier = 0.75
  }
})

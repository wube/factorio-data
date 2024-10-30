local explosion_animations = require("__space-age__.prototypes.entity.explosion-animations")
local smoke_animations = require("__base__.prototypes.entity.smoke-animations")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

data:extend
{
  {
    type = "lightning",
    name = "lightning",
    icon = "__space-age__/graphics/icons/lightning.png",
    subgroup = "obstacles",
    factoriopedia_simulation = simulations.factoriopedia_lightning,
    damage = 100,
    energy = "1000MJ",
    time_to_damage = 8,
    effect_duration = 36,
    source_offset = {0, -25},
    source_variance = {30, 6},
    sound =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/explosions/lightning-effect", 5, 0.25, 0.8),
      advanced_volume_control =
      {
        fades = {fade_in = {curve_type = "S-curve", from = {control = 0.3, volume_percentage = 50.0}, to = {2.5, 100.0 }}},
      },
      aggregation = {max_count = 3, remove = true, count_already_playing = true},
      audible_distance_modifier = 1.5
    },
    attracted_volume_modifier = 0.4,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "camera-effect",
          duration = 20,
          ease_in_duration = 10,
          ease_out_duration = 7,
          delay = 0,
          strength = 0.75,
          full_strength_max_distance = 10,
          max_distance = 70
        }
      }
    },
    strike_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "fulgora-stone-particle-big",
            offset_deviation = {{-0.8984, -0.5}, {0.8984, 0.5}},
            initial_height = 0.3,
            initial_vertical_speed = 0.03,
            initial_vertical_speed_deviation = 0.15,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "fulgora-stone-particle-medium",
            offset_deviation = {{-0.8984, -0.5}, {0.8984, 0.5}},
            initial_height = 0.5,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.15,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "fulgora-stone-particle-small",
            offset_deviation = {{-0.8984, -0.5}, {0.8984, 0.5}},
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "big-rock-stone-particle-tiny",
            offset_deviation = {{-0.8984, -0.5}, {0.8984, 0.5}},
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            only_when_visible = true
          },
          {
            type = "create-trivial-smoke",
            smoke_name = "fire-smoke-without-glow",
            offsets = {{0, -0.5}},
            offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
            speed = {0, -0.5},
            initial_height = 0.5,
            speed_from_center = 0.008,
            speed_from_center_deviation = 0.015
          }
        }
      }
    },
    graphics_set =
    {
      relative_cloud_fork_length = 0.30,
      cloud_fork_orientation_variance = 0.2,
      cloud_detail_level = 4,
      bolt_detail_level = 5,
      bolt_half_width = 0.04,
      bolt_midpoint_variance = 0.05,
      max_bolt_offset = 0.25,
      max_fork_probability = 1,
      fork_intensity_multiplier = 0.5,
      min_ground_streamer_distance = 2,
      max_ground_streamer_distance = 4,
      ground_streamer_variance = 4,
      shader_configuration =
      {
        {color = {0.0, 0.6, 1, 0.8}, distortion =  0.20, thickness = 0.20, power = 0.25},
        {color = {0.0, 0.6, 1, 1.0}, distortion =  0.40, thickness = 1.00, power = 0.25},
        {color = {0.2, 0.6, 1, 1.0}, distortion =  0.55, thickness = 1.00, power = 0.25},
        {color = {0.7, 0.6, 1, 0.6}, distortion =  0.70, thickness = 0.75, power = 0.25},
        {color = {0.4, 0.2, 1, 0.3}, distortion =  1.00, thickness = 0.50, power = 0.10},
        {color = {0.0, 0.2, 1, 0.0}, distortion = 20.00, thickness = 0.50, power = 0.01}
      },
      cloud_background = util.sprite_load("__space-age__/graphics/entity/lightning/lightning-cloud",
                                          {
                                            draw_as_glow = true,
                                            scale = 1,
                                            frame_count = 4,
                                            tint = {0.5, 0.5, 0.5, 0.5}
                                          }),
      explosion =
      {
        util.sprite_load("__space-age__/graphics/entity/lightning/lightning-explosion",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
        }),
        util.sprite_load("__space-age__/graphics/entity/lightning/lightning-explosion-2",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         })
      },
      attractor_hit_animation = util.sprite_load("__space-age__/graphics/entity/lightning/lightning-attractor-hit-anim",{
        draw_as_glow = true,
        scale = 1,
        frame_count = 36
      }),
      ground_streamers =
      {
        util.sprite_load("__space-age__/graphics/entity/lightning/lightning-streamer-1",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__space-age__/graphics/entity/lightning/lightning-streamer-2",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__space-age__/graphics/entity/lightning/lightning-streamer-3",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__space-age__/graphics/entity/lightning/lightning-streamer-4",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__space-age__/graphics/entity/lightning/lightning-streamer-5",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__space-age__/graphics/entity/lightning/lightning-streamer-6",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__space-age__/graphics/entity/lightning/lightning-streamer-7",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__space-age__/graphics/entity/lightning/lightning-streamer-8",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
      },
      light = {intensity = 5.0, size = 50, color = {0.1, 0.15, 1}}
    }
  },

  {
    type = "explosion",
    name = "space-platform-foundation-explosion",
    icon = "__space-age__/graphics/icons/space-platform-foundation.png",
    flags = {"not-on-map"},
    hidden = true,
    animations = explosion_animations.small_explosion(),
    sound =
    {
      variations = sound_variations("__space-age__/sound/explosions/space-platform-explosion", 7, 0.45, volume_multiplier("main-menu", 0.55)),
      aggregation = {max_count = 3, remove = true, count_already_playing = true}
    },
  },
  {
    type = "explosion",
    name = "stack-inserter-explosion",
    icon = "__space-age__/graphics/icons/stack-inserter.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "inserter-explosions",
    order = "c-h-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "bulk-inserter-metal-particle-medium",
            offset_deviation = { { -0.5, -0.4922 }, { 0.5, 0.4922 } },
            initial_height = 0.3,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.058,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "bulk-inserter-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.4,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "turbo-transport-belt-explosion",
    icon = "__space-age__/graphics/icons/turbo-transport-belt.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "belt-explosions",
    order = "b-c-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 1,
            particle_name = "turbo-transport-belt-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.09,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "turbo-transport-belt-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "transport-belt-wooden-splinter-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.016,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "turbo-transport-belt-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.32,
            initial_vertical_speed = 0.041,
            initial_vertical_speed_deviation = 0.042,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "turbo-underground-belt-explosion",
    icon = "__space-age__/graphics/icons/turbo-underground-belt.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "belt-explosions",
    order = "b-f-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "express-underground-belt-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.081,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "turbo-underground-belt-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.43,
            initial_vertical_speed = 0.087,
            initial_vertical_speed_deviation = 0.048,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "turbo-underground-belt-metal-particle-medium-green",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.042,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "turbo-splitter-explosion",
    icon = "__space-age__/graphics/icons/turbo-splitter.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "belt-explosions",
    order = "b-i-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 13,
            particle_name = "turbo-splitter-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.047,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "express-splitter-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.049,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "express-splitter-long-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.5977 }, { 0.6953, 0.5977 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.072,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "turbo-splitter-metal-particle-big",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "express-splitter-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.029,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "railgun-beam",
    localised_name = {"entity-name.railgun-beam"},
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    rotate = true,
    beam = true,
    animations =
    {
      {
        filename = "__space-age__/graphics/entity/railgun-turret/railgun-beam.png",
        priority = "extra-high",
        width = 64,
        height = 440,
        frame_count = 16,
        animation_speed = 1,
        draw_as_glow = true,
        blend_mode = "additive"
      }
    },
    light = {intensity = 2, size = 20, color = {r = 0.55, g = 0.9, b = 0.9}},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1
  },
  {
    type = "explosion",
    name = "foundry-explosion",
    icon = "__space-age__/graphics/icons/foundry.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "smelting-machine-explosions",
    order = "d[foundry]",
    height = 0,
    animations = explosion_animations.big_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.7, 1.0),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 10,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-big",
            offsets =
            {
              { 0.7734, -0.6484 },
              { -0.7266, 0.5859 }
            },
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.8,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 38,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-medium",
            offsets = { { 0, 0 }  },
            offset_deviation = { { -0.9805, -0.8867 }, { 0.9805, 0.8867 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.07,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            probability = 1,
            particle_name = "foundry-metal-particle-big",
            offsets =
            {
              { -1.492, -1.453 },
              { 1.555, -1.469 },
              { 1.477, 1.469 },
              { -0.6172, 0.3281 }
            },
            offset_deviation = { { -0.9961, -0.5938 }, { 0.9961, 0.5938 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.075,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 35,
            probability = 1,
            particle_name = "foundry-metal-particle-medium",
            offsets =
            {
              { -0.02344, -0.8984 }
            },
            offset_deviation = { { -0.5, -0.2969 }, { 0.5, 0.2969 } },
            initial_height = 0.7,
            initial_height_deviation = 0.15,
            initial_vertical_speed = 0.166,
            initial_vertical_speed_deviation = 0.047,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.005
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "foundry-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
        }
      }
    }
  },
  {
    type = "explosion",
    name = "agricultural-tower-explosion",
    icon = "__space-age__/graphics/icons/agricultural-tower.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "agriculture-explosions",
    order = "a[agricultural-tower]",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.7, 1.0),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 5,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "assembling-machine-3-metal-particle-big",
            offsets = {
              { 0.7734, -0.6484 },
              { -0.7266, 0.5859 }
            },
            offset_deviation = {
              left_top = { -0.6875, -0.6875 },
              right_bottom = { 0.6875, 0.6875 }
            },
            tile_collision_mask = nil,
            initial_height = 0.8,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 38,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-medium",
            offsets = { { 0, 0 }  },
            offset_deviation = { { -0.9805, -0.8867 }, { 0.9805, 0.8867 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.07,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 5,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "oil-refinery-metal-particle-medium",
            offsets = {
              { 0.5234, 0.08594 }
            },
            offset_deviation = {
              left_top = { -0.9805, -0.8828 },
              right_bottom = { 0.9805, 0.8828 }
            },
            tile_collision_mask = nil,
            initial_height = 1.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 129,
            repeat_count_deviation = 52,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "lab-glass-particle-small",
            offsets = {
              { -0.5703, 0.4063 }
            },
            offset_deviation = {
              left_top = { -0.5, -0.5938 },
              right_bottom = { 0.5, 0.5938 }
            },
            tile_collision_mask = nil,
            initial_height = 1.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.075,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.067,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 45,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "assembling-machine-3-metal-particle-medium",
            offsets = {
              { 0.4219, 0.08594 }
            },
            offset_deviation = {
              left_top = { -0.5, -0.2969 },
              right_bottom = { 0.5, 0.2969 }
            },
            tile_collision_mask = nil,
            initial_height = 3,
            initial_height_deviation = 3,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.07,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.005,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 20,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "selector-combinator-metal-particle-small",
            offsets = {
              { 0.3047, 0.1484 }
            },
            offset_deviation = {
              left_top = { -0.5, -0.5 },
              right_bottom = { 0.5, 0.5 }
            },
            tile_collision_mask = nil,
            initial_height = 2.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "biochamber-explosion",
    icon = "__space-age__/graphics/icons/biochamber.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "agriculture-explosions",
    order = "b[biochamber]",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.6, 0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 5,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "assembling-machine-3-metal-particle-big",
            offsets = {
              { 0.7734, -0.6484 },
              { -0.7266, 0.5859 }
            },
            offset_deviation = {
              left_top = { -0.6875, -0.6875 },
              right_bottom = { 0.6875, 0.6875 }
            },
            tile_collision_mask = nil,
            initial_height = 0.8,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 200,
            repeat_count_deviation = 100,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "lab-glass-particle-small",
            offsets = {
              { -0.5, 0.0 }
            },
            offset_deviation = {
              left_top = {-0.5, -0.5},
              right_bottom = {0.5, 0.5}
            },
            tile_collision_mask = nil,
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.075,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.07,
            speed_from_center_deviation = 0.03,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 45,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "assembling-machine-3-metal-particle-medium",
            offsets = {
              { 0.4219, 0.08594 }
            },
            offset_deviation = {
              left_top = { -0.5, -0.2969 },
              right_bottom = { 0.5, 0.2969 }
            },
            tile_collision_mask = nil,
            initial_height = 1.1,
            initial_height_deviation = 3,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.07,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.005,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 20,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "selector-combinator-metal-particle-small",
            offsets = {
              { 0.3047, 0.1484 }
            },
            offset_deviation = {
              left_top = { -0.5, -0.5 },
              right_bottom = { 0.5, 0.5 }
            },
            tile_collision_mask = nil,
            initial_height = 1.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "electromagnetic-plant-explosion",
    icon = "__space-age__/graphics/icons/electromagnetic-plant.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "production-machine-explosions",
    order = "g[electromagnetic-plant]",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.6, 0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 10,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-big",
            offsets =
            {
              { -0.0, -0.0 }
            },
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.8,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 38,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-medium",
            offsets = { { 0, 0 }  },
            offset_deviation = { { -0.9805, -0.8867 }, { 0.9805, 0.8867 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.07,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 5,
            probability = 1,
            particle_name = "electromagnetic-plant-metal-particle-big",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.2,
            initial_vertical_speed = 0.075,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            probability = 1,
            particle_name = "electromagnetic-plant-metal-particle-medium",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0.7,
            initial_height_deviation = 0.15,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.047,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.005
          },
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "electromagnetic-plant-metal-particle-small",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
        }
      }
    }
  },
  {
    type = "explosion",
    name = "cryogenic-plant-explosion",
    icon = "__space-age__/graphics/icons/cryogenic-plant.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "production-machine-explosions",
    order = "i[cryogenic-plant]",
    height = 0,
    animations = explosion_animations.big_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.7, 1.0),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 15,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-big",
            offsets = { { 0, 0 }  },
            offset_deviation = { { -1.9805, -1.8867 }, { 1.9805, 1.8867 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.07,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            probability = 1,
            particle_name = "cryogenic-plant-metal-particle-big",
            offset_deviation = { { -2.0, -2.0 }, { 2.0, 2.0 } },
            initial_height = 0.3,
            initial_height_deviation = 0.2,
            initial_vertical_speed = 0.075,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            probability = 1,
            particle_name = "cryogenic-plant-metal-particle-medium",
            offset_deviation = { { -2.0, -2.0 }, { 2.0, 2.0 } },
            initial_height = 0.4,
            initial_height_deviation = 0.15,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.047,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.005
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "cryogenic-plant-metal-particle-small",
            offset_deviation = { { -2.0, -2.0 }, { 2.0, 2.0 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
        }
      }
    }
  },
  {
    type = "explosion",
    name = "fusion-reactor-explosion",
    icon = "__space-age__/graphics/icons/fusion-reactor.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-explosions",
    order = "g[fusion-energy]-a[reactor]",
    height = 0,
    animations = explosion_animations.big_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.7, 1.0),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-big",
            offsets = { { 0, 0 }  },
            offset_deviation = { { -1.9805, -1.8867 }, { 1.9805, 1.8867 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.138,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.09,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            probability = 1,
            particle_name = "fusion-reactor-metal-particle-big",
            offset_deviation = { { -2.5, -2.5 }, { 2.5, 2.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.2,
            initial_vertical_speed = 0.095,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 35,
            probability = 1,
            particle_name = "fusion-reactor-metal-particle-medium",
            offset_deviation = { { -2.5, -2.5 }, { 2.5, 2.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.15,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.047,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.005
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "fusion-reactor-metal-particle-small",
            offset_deviation = { { -2.5, -2.5 }, { 2.5, 2.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          },
        }
      }
    }
  },
  {
    type = "explosion",
    name = "fusion-generator-explosion",
    icon = "__space-age__/graphics/icons/fusion-generator.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-explosions",
    order = "g[fusion-energy]-a[generator]",
    height = 0,
    animations = explosion_animations.big_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.6, 0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 15,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-big",
            offsets = { { 0, 0 }  },
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.07,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            probability = 1,
            particle_name = "fusion-reactor-metal-particle-big",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.2,
            initial_vertical_speed = 0.075,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 22,
            probability = 1,
            particle_name = "fusion-reactor-metal-particle-medium",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.15,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.047,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.005
          },
          {
            type = "create-particle",
            repeat_count = 22,
            particle_name = "fusion-reactor-metal-particle-small",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
        }
      }
    }
  },
  {
    type = "explosion",
    name = "big-mining-drill-explosion",
    icon = "__space-age__/graphics/icons/big-mining-drill.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "extraction-machine-explosions",
    order = "b-b-b[big-mining-drill]",
    height = 0,
    animations = explosion_animations.big_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.7, 1.0),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 5,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-big",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0.6,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 38,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-medium",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.07,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            probability = 1,
            particle_name = "foundry-metal-particle-big",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0.8,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.075,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "foundry-metal-particle-small",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
        }
      }
    }
  },
  {
    type = "explosion",
    name = "heating-tower-explosion",
    icon = "__space-age__/graphics/icons/heating-tower.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "environmental-protection-explosions",
    order = "c[heating-tower]",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 13,
            probability = 1,
            particle_name = "heating-tower-particle-big",
            offsets = { { 0, 0 }  },
            offset_deviation = {
              left_top = { -0.9805, -0.9805 },
              right_bottom = { 0.9805, 0.9805 }
            },
            initial_height = 0.2,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.058,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "oil-refinery-metal-particle-medium",
            offsets = {
              { 0, 0}
            },
            offset_deviation = {
              left_top = { -0.9805, -0.9805 },
              right_bottom = { 0.9805, 0.9805 }
            },
            tile_collision_mask = nil,
            initial_height = 0.5,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.058,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 14,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "heating-tower-particle-medium",
            offset_deviation = {
              left_top = { -0.5, -0.5 },
              right_bottom = { 0.5, 0.5 }
            },
            tile_collision_mask = nil,
            initial_height = 1.1,
            initial_height_deviation = 0.7,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.07,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.005,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 10,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "metal-particle-small",

            offset_deviation = {
              left_top = { -0.5, -0.5 },
              right_bottom = { 0.5, 0.5 }
            },
            tile_collision_mask = nil,
            initial_height = 1.0,
            initial_height_deviation = 0.2,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "captive-spawner-explosion-1",
    icon = "__space-age__/graphics/icons/captive-biter-spawner.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "agriculture-explosions",
    order = "d[captive-spawner]",
    height = 0.5,
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    animations = util.sprite_load("__space-age__/graphics/entity/captive-spawner/captive-explosion-1",
    {
      animation_speed = 0.3,
      scale = 0.5,
      frame_count = 8,
      priority = "high"
    }),
    sound = sounds.small_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 5,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "blood-particle",
            offsets = {
              { 0.02344, -0.6016 }
            },
            offset_deviation = {
              left_top = { -0.5, -0.5 },
              right_bottom = { 0.5, 0.5 }
            },
            initial_height = 0.2,
            initial_height_deviation = 0.05,
            initial_vertical_speed = 0.062,
            initial_vertical_speed_deviation = 0.01,
            speed_from_center = 0.1,
            speed_from_center_deviation = 0.047,
            frame_speed = 1,
            frame_speed_deviation = 0,
            tail_length = 25,
            tail_length_deviation = 0,
            tail_width = 1,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 5,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "blood-particle-carpet",
            offsets = {
              { 0, -0.3594 }
            },
            offset_deviation = {
              left_top = { -1, -1 },
              right_bottom = { 1, 1 }
            },
            initial_height = 0.1,
            initial_height_deviation = 0.05,
            initial_vertical_speed = 0.09,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0,
            frame_speed = 1,
            frame_speed_deviation = 0,
            tail_length = 21,
            tail_length_deviation = 3,
            tail_width = 1,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 6,
            repeat_count_deviation = 1,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "blood-particle-carpet",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -1, -1 },
              right_bottom = { 1, 1 }
            },
            initial_height = 0.1,
            initial_height_deviation = 0.01,
            initial_vertical_speed = 0.018,
            initial_vertical_speed_deviation = 0.005,
            speed_from_center = 0.19,
            speed_from_center_deviation = 0.041,
            frame_speed = 1,
            frame_speed_deviation = 0,
            tail_length = 11,
            tail_length_deviation = 7,
            tail_width = 1,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 30,
            repeat_count_deviation = 5,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "internal-fluids-particle",
            offsets = {
              { 0.0, -0.3125 }
            },
            offset_deviation = {
              left_top = { -1, -1 },
              right_bottom = { 1, 1 }
            },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.055,
            initial_vertical_speed_deviation = 0.003,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.042,
            frame_speed = 1,
            frame_speed_deviation = 0,
            tail_length = 10,
            tail_length_deviation = 12,
            tail_width = 1,
            rotate_offsets = false
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "captive-spawner-explosion-2",
    icon = "__space-age__/graphics/icons/captive-biter-spawner.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "agriculture-explosions",
    order = "d[captive-spawner]",
    height = 0.5,
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1,
    animations = util.sprite_load("__space-age__/graphics/entity/captive-spawner/captive-explosion-2",
    {
      animation_speed = 0.3,
      scale = 0.5,
      frame_count = 8,
      priority = "high"
    }),
    sound = sounds.small_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 32,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "oil-refinery-metal-particle-big",
            offset_deviation = {
              left_top = { -2.3805, -2.3805 },
              right_bottom = { 2.3805, 2.3805 }
            },
            tile_collision_mask = nil,
            initial_height = 0.5,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.058,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 22,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "oil-refinery-metal-particle-medium",
            offset_deviation = {
              left_top = { -2.3805, -2.3805 },
              right_bottom = { 2.3805, 2.3805 }
            },
            tile_collision_mask = nil,
            initial_height = 0.5,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 4,
            repeat_count_deviation = 2,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "acid-particle",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -1, -1 },
              right_bottom = { 1, 1 }
            },
            initial_height = 2.6,
            initial_height_deviation = 0.11,
            initial_vertical_speed = 0.053,
            initial_vertical_speed_deviation = 0.005,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.038,
            frame_speed = 1,
            frame_speed_deviation = 0,
            tail_length = 30,
            tail_length_deviation = 7,
            tail_width = 1,
            rotate_offsets = false
          },
        }
      }
    }
  },
  {
    type = "explosion",
    name = "biolab-explosion",
    icon = "__space-age__/graphics/icons/biolab.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "agriculture-explosions",
    order = "b[biolab]",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 25,
            probability = 1,
            particle_name = "biolab-metal-particle-big",
            offset_deviation = { { -2.0, -2.0 }, { 2.0, 2.0 } },
            initial_height = 0.3,
            initial_height_deviation = 0.2,
            initial_vertical_speed = 0.075,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            probability = 1,
            particle_name = "biolab-metal-particle-medium",
            offset_deviation = { { -2.0, -2.0 }, { 2.0, 2.0 } },
            initial_height = 0.4,
            initial_height_deviation = 0.15,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.047,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.005
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "biolab-metal-particle-small",
            offset_deviation = { { -2.0, -2.0 }, { 2.0, 2.0 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 7,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "blood-particle",
            offsets = {
              { 0.02344, -0.6016 }
            },
            offset_deviation = {
              left_top = { -0.5, -0.5 },
              right_bottom = { 0.5, 0.5 }
            },
            initial_height = 0.2,
            initial_height_deviation = 0.05,
            initial_vertical_speed = 0.062,
            initial_vertical_speed_deviation = 0.01,
            speed_from_center = 0.1,
            speed_from_center_deviation = 0.047,
            frame_speed = 1,
            frame_speed_deviation = 0,
            tail_length = 25,
            tail_length_deviation = 0,
            tail_width = 1,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 11,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "blood-particle-carpet",
            offsets = {
              { 0, -0.3594 }
            },
            offset_deviation = {
              left_top = { -1, -1 },
              right_bottom = { 1, 1 }
            },
            initial_height = 0.1,
            initial_height_deviation = 0.05,
            initial_vertical_speed = 0.09,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0,
            frame_speed = 1,
            frame_speed_deviation = 0,
            tail_length = 21,
            tail_length_deviation = 3,
            tail_width = 1,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 13,
            repeat_count_deviation = 1,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "blood-particle-carpet",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -1, -1 },
              right_bottom = { 1, 1 }
            },
            initial_height = 0.1,
            initial_height_deviation = 0.01,
            initial_vertical_speed = 0.018,
            initial_vertical_speed_deviation = 0.005,
            speed_from_center = 0.19,
            speed_from_center_deviation = 0.041,
            frame_speed = 1,
            frame_speed_deviation = 0,
            tail_length = 11,
            tail_length_deviation = 7,
            tail_width = 1,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 20,
            repeat_count_deviation = 5,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "internal-fluids-particle",
            offsets = {
              { 0.0, -0.3125 }
            },
            offset_deviation = {
              left_top = { -1, -1 },
              right_bottom = { 1, 1 }
            },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.055,
            initial_vertical_speed_deviation = 0.003,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.042,
            frame_speed = 1,
            frame_speed_deviation = 0,
            tail_length = 10,
            tail_length_deviation = 12,
            tail_width = 1,
            rotate_offsets = false
          },

          {
            type = "create-particle",
            repeat_count = 4,
            repeat_count_deviation = 2,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "guts-entrails-particle-small-medium",
            offsets = {
              { 0.0, -0.3281 }
            },
            offset_deviation = {
              left_top = { -0.5, -0.5 },
              right_bottom = { 0.5, 0.5 }
            },
            initial_height = 1,
            initial_height_deviation = 0.52,
            initial_vertical_speed = 0.078,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.07,
            speed_from_center_deviation = 0,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 4,
            repeat_count_deviation = 2,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "guts-entrails-particle-big",
            offsets = {
              { -0.01563, -0.3438 }
            },
            offset_deviation = {
              left_top = { -0.5, -0.5 },
              right_bottom = { 0.5, 0.5 }
            },
            initial_height = 1,
            initial_height_deviation = 0.52,
            initial_vertical_speed = 0.078,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.07,
            speed_from_center_deviation = 0,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "play-sound",
            sound = sounds.spawner_gore
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "capture-robot-explosion",
    icon = "__space-age__/graphics/icons/capture-bot.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "capsule-explosions",
    order = "c-d-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 32,
            particle_name = "laser-turret-metal-particle-big",
            offset_deviation = { { -0.75, -0.75 }, { 0.75, 0.75 } },
            initial_height = 2.0,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 40,
            particle_name = "laser-turret-metal-particle-medium",
            offset_deviation = { { -0.75, -0.75 }, { 0.75, 0.75 } },
            initial_height = 2.0,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "laser-turret-metal-particle-small",
            offset_deviation = { { -0.75, -0.75 }, { 0.75, 0.75 } },
            initial_height = 1.8,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.11,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.75, -0.75 }, { 0.75, 0.75 } },
            initial_height = 1.8,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.11,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },
  -------------------------------------------------------------------------------
  --CARBONIC-asteroid-explosions
  -------------------------------------------------------------------------------
   --carbonic-chunk
  {
    type = "explosion",
    name = "carbonic-asteroid-explosion-1",
    icon = "__space-age__/graphics/icons/carbonic-asteroid-chunk.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_chunk({tint = {0.533, 0.506, 0.545, 1}}),
    sound = space_age_sounds.asteroid_collision_carbonic_small,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 6,
            probability = 1,
            smoke_name = "asteroid-smoke-carbonic-chunk",
            offset_deviation = { { -0.1, -0.1 }, { 0.1, 0.1 } },
            initial_height = -0.2,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "carbonic-asteroid-chunk-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "carbonic-asteroid-chunk-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.036,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.046
          },
        }
      }
    }
  },
  --carbonic-small
  {
    type = "explosion",
    name = "carbonic-asteroid-explosion-2",
    icon = "__space-age__/graphics/icons/small-carbonic-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_small({tint = {0.533, 0.506, 0.545, 1}}),
    sound = space_age_sounds.asteroid_damage_carbonic_small,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 15,
            smoke_name = "asteroid-smoke-carbonic-small",
            offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
            initial_height = 0,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.04
          },
          {
            type = "create-particle",
            repeat_count = 8,
            particle_name = "carbonic-asteroid-particle-small",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "carbonic-asteroid-particle-medium",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "carbonic-asteroid-particle-big",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "carbonic-asteroid-particle-top-small",
            offset_deviation = { { -0.25, -0.25 }, { 0.25, 0.25 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 1,
            particle_name = "carbonic-asteroid-particle-top-big",
            offset_deviation = { { -0.15, -0.15 }, { 0.15, 0.15 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
  --carbonic-medium
  {
    type = "explosion",
    name = "carbonic-asteroid-explosion-3",
    icon = "__space-age__/graphics/icons/medium-carbonic-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_medium({tint = {0.533, 0.506, 0.545, 1}}),
    sound = space_age_sounds.asteroid_damage_carbonic_medium,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 25,
            smoke_name = "asteroid-smoke-carbonic-medium",
            offset_deviation = { { -0.8, -0.8 }, { 0.8, 0.8 } },
            initial_height = 0,
            speed_from_center = 0.011,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "carbonic-asteroid-particle-small",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.07,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 8,
            particle_name = "carbonic-asteroid-particle-medium",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.07,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "carbonic-asteroid-particle-big",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.07,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "carbonic-asteroid-particle-top-small",
            offset_deviation = { { -0.45, -0.45 }, { 0.45, 0.45 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "carbonic-asteroid-particle-top-big",
            offset_deviation = { { -0.3, -0.3 }, { 0.3, 0.3 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
  --carbonic-big
  {
    type = "explosion",
    name = "carbonic-asteroid-explosion-4",
    icon = "__space-age__/graphics/icons/big-carbonic-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_big({tint = {0.533, 0.506, 0.545, 1}}),
    sound = space_age_sounds.asteroid_damage_carbonic_big,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 50,
            smoke_name = "asteroid-smoke-carbonic-big",
            offset_deviation = { { -1.3, -1.3 }, { 1.3, 1.3 } },
            initial_height = 0,
            speed_from_center = 0.014,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-trivial-smoke",
            repeat_count = 20,
            smoke_name = "asteroid-smoke-carbonic-big",
            offset_deviation = { { 2.3, -1.3 }, { -1.3, -2.3 } },
            initial_height = 0,
            speed_from_center = 0.013,
            speed_from_center_deviation = 0.04
          },
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "carbonic-asteroid-particle-small",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.1,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "carbonic-asteroid-particle-medium",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.1,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 6,
            particle_name = "carbonic-asteroid-particle-big",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.1,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 6,
            particle_name = "carbonic-asteroid-particle-top-small",
            offset_deviation = { { -1.2, -1.2 }, { 1.2, 1.2 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "carbonic-asteroid-particle-top-big",
            offset_deviation = { { -0.8, -0.8 }, { 0.8, 0.8 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
  --carbonic-huge
  {
    type = "explosion",
    name = "carbonic-asteroid-explosion-5",
    icon = "__space-age__/graphics/icons/huge-carbonic-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_huge({tint = {0.533, 0.506, 0.545, 1}}),
    sound = space_age_sounds.asteroid_damage_carbonic_huge,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 120,
            smoke_name = "asteroid-smoke-carbonic-huge",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            speed_from_center = 0.018,
            speed_from_center_deviation = 0.06
          },
          {
            type = "create-trivial-smoke",
            repeat_count = 60,
            smoke_name = "asteroid-smoke-carbonic-big",
            offset_deviation = { { 2, 2 }, { 4, -2 } },
            initial_height = 0,
            speed_from_center = 0.012,
            speed_from_center_deviation = 0.04
          },
          {
            type = "create-particle",
            repeat_count = 48,
            particle_name = "carbonic-asteroid-particle-small",
            offset_deviation = { { -5.5, -5.5 }, { 5.5, 5.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.2,
            tail_length = 2,
            tail_width = 3,
            tail_length_deviation = 4,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 34,
            particle_name = "carbonic-asteroid-particle-medium",
            offset_deviation = { { -5.5, -5.5 }, { 5.5, 5.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.2,
            tail_length = 2,
            tail_width = 3,
            tail_length_deviation = 4,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "carbonic-asteroid-particle-big",
            offset_deviation = { { -5.5, -5.5 }, { 5.5, 5.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.2,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "carbonic-asteroid-particle-top-small",
            offset_deviation = { { -3.1, -3.1 }, { 3.1, 3.1 } },
            initial_height = 0.6,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "carbonic-asteroid-particle-top-big",
            offset_deviation = {{ -2.1, -2.1 }, { 2.1, 2.1 }},
            initial_height = 0.6,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "carbonic-asteroid-particle-top-huge",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0.6,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
  -------------------------------------------------------------------------------
  --METALLIC-asteroid-explosionss
  -------------------------------------------------------------------------------
  --metallic-chunk
  {
    type = "explosion",
    name = "metallic-asteroid-explosion-1",
    icon = "__space-age__/graphics/icons/metallic-asteroid-chunk.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_chunk({tint = {0.6118, 0.4980, 0.4745, 1}}),
    sound = space_age_sounds.asteroid_collision_metallic_small,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 6,
            probability = 1,
            smoke_name = "asteroid-smoke-metallic-chunk",
            offset_deviation = { { -0.1, -0.1 }, { 0.1, 0.1 } },
            initial_height = -0.2,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "metallic-asteroid-chunk-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "metallic-asteroid-chunk-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.036,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.046
          },
        }
      }
    }
  },
   --metallic-small
  {
    type = "explosion",
    name = "metallic-asteroid-explosion-2",
    icon = "__space-age__/graphics/icons/small-metallic-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_small({tint = {0.6118, 0.4980, 0.4745, 1}}),
    sound = space_age_sounds.asteroid_damage_metallic_small,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 15,
            smoke_name = "asteroid-smoke-metallic-small",
            offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
            initial_height = 0,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.04
          },
          {
            type = "create-particle",
            repeat_count = 8,
            particle_name = "metallic-asteroid-particle-small",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "metallic-asteroid-particle-medium",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "metallic-asteroid-particle-big",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "metallic-asteroid-particle-top-small",
            offset_deviation = { { -0.25, -0.25 }, { 0.25, 0.25 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 1,
            particle_name = "metallic-asteroid-particle-top-big",
            offset_deviation = { { -0.15, -0.15 }, { 0.15, 0.15 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
  --metallic-medium
  {
    type = "explosion",
    name = "metallic-asteroid-explosion-3",
    icon = "__space-age__/graphics/icons/medium-metallic-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_medium({tint = {0.6118, 0.4980, 0.4745, 1}}),
    sound = space_age_sounds.asteroid_damage_metallic_medium,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 25,
            smoke_name = "asteroid-smoke-metallic-medium",
            offset_deviation = { { -0.8, -0.8 }, { 0.8, 0.8 } },
            initial_height = 0,
            speed_from_center = 0.011,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "metallic-asteroid-particle-small",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.07,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 8,
            particle_name = "metallic-asteroid-particle-medium",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.07,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "metallic-asteroid-particle-big",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.07,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "metallic-asteroid-particle-top-small",
            offset_deviation = { { -0.45, -0.45 }, { 0.45, 0.45 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "metallic-asteroid-particle-top-big",
            offset_deviation = { { -0.3, -0.3 }, { 0.3, 0.3 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
  --metallic-big
  {
    type = "explosion",
    name = "metallic-asteroid-explosion-4",
    icon = "__space-age__/graphics/icons/big-metallic-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_big({tint = {0.6118, 0.4980, 0.4745, 1}}),
    sound = space_age_sounds.asteroid_damage_metallic_big,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 50,
            smoke_name = "asteroid-smoke-metallic-big",
            offset_deviation = { { -1.3, -1.3 }, { 1.3, 1.3 } },
            initial_height = 0,
            speed_from_center = 0.014,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-trivial-smoke",
            repeat_count = 20,
            smoke_name = "asteroid-smoke-metallic-big",
            offset_deviation = { { 2.3, -1.3 }, { -1.3, -2.3 } },
            initial_height = 0,
            speed_from_center = 0.013,
            speed_from_center_deviation = 0.04
          },
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "metallic-asteroid-particle-small",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.1,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "metallic-asteroid-particle-medium",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.1,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 6,
            particle_name = "metallic-asteroid-particle-big",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.1,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 6,
            particle_name = "metallic-asteroid-particle-top-small",
            offset_deviation = { { -1.2, -1.2 }, { 1.2, 1.2 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "metallic-asteroid-particle-top-big",
            offset_deviation = { { -0.8, -0.8 }, { 0.8, 0.8 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
  --metallic-huge
  {
    type = "explosion",
    name = "metallic-asteroid-explosion-5",
    icon = "__space-age__/graphics/icons/huge-metallic-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_huge({tint = {0.6118, 0.4980, 0.4745, 1}}),
    sound = space_age_sounds.asteroid_damage_metallic_huge,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 120,
            smoke_name = "asteroid-smoke-metallic-huge",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            speed_from_center = 0.018,
            speed_from_center_deviation = 0.06
          },
          {
            type = "create-trivial-smoke",
            repeat_count = 60,
            smoke_name = "asteroid-smoke-metallic-big",
            offset_deviation = { { 2, 2 }, { 4, -2 } },
            initial_height = 0,
            speed_from_center = 0.012,
            speed_from_center_deviation = 0.04
          },
          {
            type = "create-particle",
            repeat_count = 48,
            particle_name = "metallic-asteroid-particle-small",
            offset_deviation = { { -5.5, -5.5 }, { 5.5, 5.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.2,
            tail_length = 2,
            tail_width = 3,
            tail_length_deviation = 4,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 34,
            particle_name = "metallic-asteroid-particle-medium",
            offset_deviation = { { -5.5, -5.5 }, { 5.5, 5.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.2,
            tail_length = 2,
            tail_width = 3,
            tail_length_deviation = 4,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "metallic-asteroid-particle-big",
            offset_deviation = { { -5.5, -5.5 }, { 5.5, 5.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.2,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "metallic-asteroid-particle-top-small",
            offset_deviation = { { -3.1, -3.1 }, { 3.1, 3.1 } },
            initial_height = 0.6,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "metallic-asteroid-particle-top-big",
            offset_deviation = {{ -2.1, -2.1 }, { 2.1, 2.1 }},
            initial_height = 0.6,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "metallic-asteroid-particle-top-huge",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0.6,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
  -------------------------------------------------------------------------------
  --OXIDE-asteroid-explosions
  -------------------------------------------------------------------------------
  --oxide-chunk
  {
    type = "explosion",
    name = "oxide-asteroid-explosion-1",
    icon = "__space-age__/graphics/icons/oxide-asteroid-chunk.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_chunk({tint = {0.4941, 0.7098, 0.7373, 1}}),
    sound = space_age_sounds.asteroid_collision_oxide_small,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 6,
            probability = 1,
            smoke_name = "asteroid-smoke-oxide-chunk",
            offset_deviation = { { -0.1, -0.1 }, { 0.1, 0.1 } },
            initial_height = -0.2,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "oxide-asteroid-chunk-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "oxide-asteroid-chunk-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.036,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.046
          },
        }
      }
    }
  },
  --oxide-small
  {
    type = "explosion",
    name = "oxide-asteroid-explosion-2",
    icon = "__space-age__/graphics/icons/small-oxide-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_small({tint = {0.4941, 0.7098, 0.7373, 1}}),
    sound = space_age_sounds.asteroid_damage_oxide_small,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 15,
            smoke_name = "asteroid-smoke-oxide-small",
            offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
            initial_height = 0,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.04
          },
          {
            type = "create-particle",
            repeat_count = 8,
            particle_name = "oxide-asteroid-particle-small",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "oxide-asteroid-particle-medium",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "oxide-asteroid-particle-big",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "oxide-asteroid-particle-top-small",
            offset_deviation = { { -0.25, -0.25 }, { 0.25, 0.25 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 1,
            particle_name = "oxide-asteroid-particle-top-big",
            offset_deviation = { { -0.15, -0.15 }, { 0.15, 0.15 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "play-sound",
            sound = space_age_sounds.asteroid_collision_oxide_small
          }
        }
      }
    }
  },
  --oxide-medium
  {
    type = "explosion",
    name = "oxide-asteroid-explosion-3",
    icon = "__space-age__/graphics/icons/medium-oxide-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_medium({tint = {0.4941, 0.7098, 0.7373, 1}}),
    sound = space_age_sounds.asteroid_damage_oxide_medium,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 25,
            smoke_name = "asteroid-smoke-oxide-medium",
            offset_deviation = { { -0.8, -0.8 }, { 0.8, 0.8 } },
            initial_height = 0,
            speed_from_center = 0.011,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "oxide-asteroid-particle-small",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.07,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 8,
            particle_name = "oxide-asteroid-particle-medium",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.07,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "oxide-asteroid-particle-big",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.07,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "oxide-asteroid-particle-top-small",
            offset_deviation = { { -0.45, -0.45 }, { 0.45, 0.45 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "oxide-asteroid-particle-top-big",
            offset_deviation = { { -0.3, -0.3 }, { 0.3, 0.3 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
  --oxide-big
  {
    type = "explosion",
    name = "oxide-asteroid-explosion-4",
    icon = "__space-age__/graphics/icons/big-oxide-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_big({tint = {0.4941, 0.7098, 0.7373, 1}}),
    sound = space_age_sounds.asteroid_damage_oxide_big,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 50,
            smoke_name = "asteroid-smoke-oxide-big",
            offset_deviation = { { -1.3, -1.3 }, { 1.3, 1.3 } },
            initial_height = 0,
            speed_from_center = 0.014,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-trivial-smoke",
            repeat_count = 20,
            smoke_name = "asteroid-smoke-oxide-big",
            offset_deviation = { { 2.3, -1.3 }, { -1.3, -2.3 } },
            initial_height = 0,
            speed_from_center = 0.013,
            speed_from_center_deviation = 0.04
          },
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "oxide-asteroid-particle-small",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.1,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "oxide-asteroid-particle-medium",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.1,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 6,
            particle_name = "oxide-asteroid-particle-big",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.1,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 6,
            particle_name = "oxide-asteroid-particle-top-small",
            offset_deviation = { { -1.2, -1.2 }, { 1.2, 1.2 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "oxide-asteroid-particle-top-big",
            offset_deviation = { { -0.8, -0.8 }, { 0.8, 0.8 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
  --oxide-huge
  {
    type = "explosion",
    name = "oxide-asteroid-explosion-5",
    icon = "__space-age__/graphics/icons/huge-oxide-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_huge({tint = {0.4941, 0.7098, 0.7373, 1}}),
    sound = space_age_sounds.asteroid_damage_oxide_huge,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 120,
            smoke_name = "asteroid-smoke-oxide-huge",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            speed_from_center = 0.018,
            speed_from_center_deviation = 0.06
          },
          {
            type = "create-trivial-smoke",
            repeat_count = 60,
            smoke_name = "asteroid-smoke-oxide-big",
            offset_deviation = { { 2, 2 }, { 4, -2 } },
            initial_height = 0,
            speed_from_center = 0.012,
            speed_from_center_deviation = 0.04
          },
          {
            type = "create-particle",
            repeat_count = 48,
            particle_name = "oxide-asteroid-particle-small",
            offset_deviation = { { -5.5, -5.5 }, { 5.5, 5.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.2,
            tail_length = 2,
            tail_width = 3,
            tail_length_deviation = 4,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 34,
            particle_name = "oxide-asteroid-particle-medium",
            offset_deviation = { { -5.5, -5.5 }, { 5.5, 5.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.2,
            tail_length = 2,
            tail_width = 3,
            tail_length_deviation = 4,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "oxide-asteroid-particle-big",
            offset_deviation = { { -5.5, -5.5 }, { 5.5, 5.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.2,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "oxide-asteroid-particle-top-small",
            offset_deviation = { { -3.1, -3.1 }, { 3.1, 3.1 } },
            initial_height = 0.6,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "oxide-asteroid-particle-top-big",
            offset_deviation = {{ -2.1, -2.1 }, { 2.1, 2.1 }},
            initial_height = 0.6,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "oxide-asteroid-particle-top-huge",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0.6,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
  -------------------------------------------------------------------------------
  --promethium-asteroid-explosions
  -------------------------------------------------------------------------------
  --promethium-chunk
  {
    type = "explosion",
    name = "promethium-asteroid-explosion-1",
    icon = "__space-age__/graphics/icons/promethium-asteroid-chunk.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_chunk({tint = {0.8549, 0.5, 0.5, 1}}),
    sound = space_age_sounds.asteroid_collision_interstellar_small,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 6,
            probability = 1,
            smoke_name = "asteroid-smoke-promethium-chunk",
            offset_deviation = { { -0.1, -0.1 }, { 0.1, 0.1 } },
            initial_height = -0.2,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "promethium-asteroid-chunk-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "promethium-asteroid-chunk-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.036,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.046
          },
        }
      }
    }
  },
  --promethium-small
  {
    type = "explosion",
    name = "promethium-asteroid-explosion-2",
    icon = "__space-age__/graphics/icons/small-promethium-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_small({tint = {0.8549, 0.5, 0.5, 1}}),
    sound = space_age_sounds.asteroid_damage_interstellar_small,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 15,
            smoke_name = "asteroid-smoke-promethium-small",
            offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
            initial_height = 0,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.04
          },
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "promethium-asteroid-particle-small",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "promethium-asteroid-particle-medium",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "promethium-asteroid-particle-big",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "promethium-asteroid-particle-top-small",
            offset_deviation = { { -0.25, -0.25 }, { 0.25, 0.25 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 1,
            particle_name = "promethium-asteroid-particle-top-big",
            offset_deviation = { { -0.15, -0.15 }, { 0.15, 0.15 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "play-sound",
            sound = space_age_sounds.asteroid_collision_interstellar_small
          }
        }
      }
    }
  },
  --promethium-medium
  {
    type = "explosion",
    name = "promethium-asteroid-explosion-3",
    icon = "__space-age__/graphics/icons/medium-promethium-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_medium({tint = {0.8549, 0.5, 0.5, 1}}),
    sound = space_age_sounds.asteroid_damage_interstellar_medium,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 25,
            smoke_name = "asteroid-smoke-promethium-medium",
            offset_deviation = { { -0.8, -0.8 }, { 0.8, 0.8 } },
            initial_height = 0,
            speed_from_center = 0.011,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "promethium-asteroid-particle-small",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.07,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 8,
            particle_name = "promethium-asteroid-particle-medium",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.07,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "promethium-asteroid-particle-big",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.07,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "promethium-asteroid-particle-top-small",
            offset_deviation = { { -0.45, -0.45 }, { 0.45, 0.45 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "promethium-asteroid-particle-top-big",
            offset_deviation = { { -0.3, -0.3 }, { 0.3, 0.3 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
  --promethium-big
  {
    type = "explosion",
    name = "promethium-asteroid-explosion-4",
    icon = "__space-age__/graphics/icons/big-promethium-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_big({tint = {0.8549, 0.5, 0.5, 1}}),
    sound = space_age_sounds.asteroid_damage_interstellar_big,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 50,
            smoke_name = "asteroid-smoke-promethium-big",
            offset_deviation = { { -1.3, -1.3 }, { 1.3, 1.3 } },
            initial_height = 0,
            speed_from_center = 0.014,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-trivial-smoke",
            repeat_count = 20,
            smoke_name = "asteroid-smoke-promethium-big",
            offset_deviation = { { 2.3, -1.3 }, { -1.3, -2.3 } },
            initial_height = 0,
            speed_from_center = 0.013,
            speed_from_center_deviation = 0.04
          },
          {
            type = "create-particle",
            repeat_count = 40,
            particle_name = "promethium-asteroid-particle-small",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.1,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "promethium-asteroid-particle-medium",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.1,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 6,
            particle_name = "promethium-asteroid-particle-big",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.1,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 6,
            particle_name = "promethium-asteroid-particle-top-small",
            offset_deviation = { { -1.2, -1.2 }, { 1.2, 1.2 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "promethium-asteroid-particle-top-big",
            offset_deviation = { { -0.8, -0.8 }, { 0.8, 0.8 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
  --promethium-huge
  {
    type = "explosion",
    name = "promethium-asteroid-explosion-5",
    icon = "__space-age__/graphics/icons/huge-promethium-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_huge({tint = {0.8549, 0.5, 0.5, 1}}),
    sound = space_age_sounds.asteroid_damage_interstellar_huge,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 120,
            smoke_name = "asteroid-smoke-promethium-huge",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            speed_from_center = 0.018,
            speed_from_center_deviation = 0.06
          },
          {
            type = "create-trivial-smoke",
            repeat_count = 60,
            smoke_name = "asteroid-smoke-promethium-big",
            offset_deviation = { { 2, 2 }, { 4, -2 } },
            initial_height = 0,
            speed_from_center = 0.012,
            speed_from_center_deviation = 0.04
          },
          {
            type = "create-particle",
            repeat_count = 100,
            particle_name = "promethium-asteroid-particle-small",
            offset_deviation = { { -5.5, -5.5 }, { 5.5, 5.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.2,
            tail_length = 2,
            tail_width = 3,
            tail_length_deviation = 4,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 34,
            particle_name = "promethium-asteroid-particle-medium",
            offset_deviation = { { -5.5, -5.5 }, { 5.5, 5.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.2,
            tail_length = 2,
            tail_width = 3,
            tail_length_deviation = 4,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "promethium-asteroid-particle-big",
            offset_deviation = { { -5.5, -5.5 }, { 5.5, 5.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.2,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "promethium-asteroid-particle-top-small",
            offset_deviation = { { -3.1, -3.1 }, { 3.1, 3.1 } },
            initial_height = 0.6,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "promethium-asteroid-particle-top-big",
            offset_deviation = {{ -2.1, -2.1 }, { 2.1, 2.1 }},
            initial_height = 0.6,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "promethium-asteroid-particle-top-huge",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0.6,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
}

local gleba_blood_icon =
{
  {
    icon = "__base__/graphics/icons/fluid/light-oil.png",
    tint = {1,0.8,0.4,1}
  }
}

data:extend
{
  {
    type = "explosion",
    name = "gleba-enemy-damaged-explosion",
    icons =
    {
      {
        icon = "__space-age__/graphics/icons/medium-wriggler.png",
        tint = {1,0.5,0.5,1}
      }
    },
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "hit-effects",
    order = "a-a-a",
    height = 0.3,
    animations =
    {
      util.empty_sprite()
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "gleba-blood-fountain-hit-spray",
            repeat_count = 1
          },
        }
      }
    }
  },
  {
    type = "explosion",
    name = "gleba-blood-explosion-small",
    localised_name = {"entity-name.gleba-blood-explosion-small"},
    icons = gleba_blood_icon,
    order = "d-a",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "fluid-explosions",
    animations = util.empty_sprite(),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "create-entity",
          entity_name = "gleba-blood-fountain",
          repeat_count = 20,
          offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}}
        }
      }
    }
  },

  {
    type = "explosion",
    name = "gleba-blood-explosion-big",
    localised_name = {"entity-name.gleba-blood-explosion-big"},
    icons = gleba_blood_icon,
    order = "d-b",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "fluid-explosions",
    animations = util.empty_sprite(),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 150,
            particle_name = "gleba-blood-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.05,
            initial_vertical_speed = -0.01,
            initial_vertical_speed_deviation = 0.02,
            offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}}
          },
          {
            type = "create-entity",
            entity_name = "gleba-blood-fountain",
            repeat_count = 35,
            offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}}
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "gleba-blood-explosion-huge",
    localised_name = {"entity-name.gleba-blood-explosion-huge"},
    flags = {"not-on-map"},
    hidden = true,
    icons = gleba_blood_icon,
    order = "d-d",
    subgroup = "fluid-explosions",
    animations = util.empty_sprite(),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 150,
            particle_name = "gleba-blood-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.05,
            initial_vertical_speed = -0.01,
            initial_vertical_speed_deviation = 0.02,
            offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}}
          },
          {
            type = "create-entity",
            entity_name = "gleba-blood-fountain-big",
            repeat_count = 35,
            offset_deviation = {{-1.6, -1.6}, {1.6, 1.6}}
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "vulcanus-cliff-collapse",
    localised_name = {"entity-name.vulcanus-cliff-collapse"},
    icons =
    {
      {icon = "__base__/graphics/icons/explosion.png"},
      {icon = "__space-age__/graphics/icons/huge-volcanic-rock.png"}
    },
    order = "a-a-c",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = util.empty_sprite(),
    smoke = "smoke-explosion-particle",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "vulcanus-stone-particle-big",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "vulcanus-stone-particle-medium",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "vulcanus-stone-particle-small",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 50,
            particle_name = "big-rock-stone-particle-tiny",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-trivial-smoke",
            repeat_count = 20,
            smoke_name = "demolisher-mining-smoke",
            initial_height = 0,
            speed_from_center = 0.03,
            offset_deviation = {{-1.75, -1.7}, {1.75, 1.75}},
          },
        }
      }
    }
  },
}

data:extend
{
  {
    type = "particle-source",
    flags = {"not-on-map"},
    hidden = true,
    name = "gleba-blood-fountain",
    icons = gleba_blood_icon,
    order = "e-b",
    subgroup = "particles",
    particle = "gleba-blood-particle",
    time_to_live = 10,
    time_to_live_deviation = 5,
    time_before_start = 0.75,
    time_before_start_deviation = 1.5,
    height = 0.4,
    height_deviation = 0.1,
    vertical_speed = 0.05,
    vertical_speed_deviation = 0.03,
    horizontal_speed = 0.025,
    horizontal_speed_deviation = 0.025
  },

  {
    type = "particle-source",
    name = "gleba-blood-fountain-big",
    icons = gleba_blood_icon,
    flags = {"not-on-map"},
    hidden = true,
    order = "e-c",
    subgroup = "particles",
    particle = "gleba-blood-particle",
    time_to_live = 30,
    time_to_live_deviation = 5,
    time_before_start = 2.5,
    time_before_start_deviation = 5,
    height = 0.4,
    height_deviation = 0.1,
    vertical_speed = 0.15,
    vertical_speed_deviation = 0.05,
    horizontal_speed = 0.04,
    horizontal_speed_deviation = 0.04
  },

  {
    type = "particle-source",
    name = "gleba-blood-fountain-hit-spray",
    flags = {"not-on-map"},
    hidden = true,
    icons = gleba_blood_icon,
    order = "e-a",
    subgroup = "particles",
    particle = "gleba-blood-particle",
    time_to_live = 10,
    time_to_live_deviation = 5,
    time_before_start = 0,
    time_before_start_deviation = 0,
    height = 0.3,
    height_deviation = 0.1,
    vertical_speed = 0.02,
    vertical_speed_deviation = 0.08,
    horizontal_speed = 0.07,
    horizontal_speed_deviation = 0.04
  }
}


data:extend{
  {
    type = "explosion",
    name = "aquilo-tiles-inner-explosion",
    icon = "__space-age__/graphics/icons/ice.png",
    order = "a-a-c",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = util.empty_sprite(),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "set-tile",
            tile_name = "snow-lumpy",
            radius = 1.5,
            apply_projection = false,
            tile_collision_mask = { layers={ground_tile=true, resource=true} }
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "aquilo-tiles-outer-explosion",
    icon = "__space-age__/graphics/icons/ice.png",
    order = "a-a-c",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = util.empty_sprite(),
    created_effect =
    {
      type = "cluster",
      cluster_count = 7,
      distance = 2,
      distance_deviation = 4,
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "set-tile",
            tile_name = "snow-patchy",
            radius = 1,
            apply_projection = true,
            tile_collision_mask = { layers={ground_tile=true, resource=true} }
          },
          {
            type = "set-tile",
            tile_name = "ice-rough",
            radius = 2,
            apply_projection = true,
            tile_collision_mask = { layers={ground_tile=true, resource=true} }
          }
        }
      }
    }
  }
}

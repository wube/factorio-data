require ("prototypes.entity.rail-pictures")

local hit_effects = require ("prototypes.entity.hit-effects")
local sounds = require("prototypes.entity.sounds")

rail_pictures = function()
  return rail_pictures_internal
  {
    {"metals", "metals", mipmap = true},
    {"backplates", "backplates", mipmap = true},
    {"ties", "ties", variations = 3},
    {"stone_path", "stone-path", variations = 3},
    {"stone_path_background", "stone-path-background", variations = 3},
    {"segment_visualisation_middle", "segment-visualisation-middle"},
    {"segment_visualisation_ending_front", "segment-visualisation-ending-1"},
    {"segment_visualisation_ending_back", "segment-visualisation-ending-2"},
    {"segment_visualisation_continuing_front", "segment-visualisation-continuing-1"},
    {"segment_visualisation_continuing_back", "segment-visualisation-continuing-2"}
  }
end

standard_train_wheels =
{
  priority = "very-low",
  width = 115,
  height = 115,
  direction_count = 256,
  filenames =
  {
    "__base__/graphics/entity/diesel-locomotive/train-wheels-01.png",
    "__base__/graphics/entity/diesel-locomotive/train-wheels-02.png"
  },
  line_length = 8,
  lines_per_file = 16,
  hr_version =
  {
    priority = "very-low",
    width = 229,
    height = 227,
    direction_count = 256,
    filenames =
    {
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-1.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-2.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-3.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-4.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-5.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-6.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-7.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-8.png"
    },
    line_length = 4,
    lines_per_file = 8,
    --shift = {0.015625, -0.453125}, original shifting from spritesheeter (likely needs doubling or halving)
    scale = 0.5
  }
}

data:extend(
{

  {
    type = "straight-rail",
    name = "straight-rail",
    icon = "__base__/graphics/icons/rail.png",
    collision_box = {{-1, -1}, {1, 1}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.2, result = "rail"},
    max_health = 100,
    corpse = "straight-rail-remnants",
    dying_explosion = "rail-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 100
      },
      {
        type = "acid",
        percent = 80
      }
    },
    -- collision box is hardcoded for rails as they need to be different for different orientations (diagonal or straight) and to
    -- avoid unexpected changes in the way rail blocks are merged
    selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
    damaged_trigger_effect = hit_effects.wall(),
    pictures = rail_pictures(),
    walking_sound = sounds.rails
  },
  {
    type = "curved-rail",
    name = "curved-rail",
    icon = "__base__/graphics/icons/curved-rail.png",
    collision_box = {{-2, -2}, {2, 2}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.2, result = "rail", count = 4},
    max_health = 200,
    corpse = "curved-rail-remnants",
    dying_explosion =
    {
      {
        name = "rail-explosion",
        offset = {0.9, 2.2}
      },
      {
        name = "rail-explosion"
      },
      {
        name = "rail-explosion",
        offset = {-1.2, -2}
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      },
      {
        type = "acid",
        percent = 80
      }
    },
    -- collision box is hardcoded for rails as to avoid unexpected changes in the way rail blocks are merged
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    damaged_trigger_effect = hit_effects.wall(),
    pictures = rail_pictures(),
    placeable_by = {item = "rail", count = 4},
    walking_sound = sounds.rails
  },

  {
    type = "locomotive",
    name = "locomotive",
    icon = "__base__/graphics/icons/locomotive.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 0.5, result = "locomotive"},
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    max_health = 1000,
    corpse = "locomotive-remnants",
    dying_explosion = "locomotive-explosion",
    collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
    selection_box = {{-1, -3}, {1, 3}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box = {{-1, -4}, {1, 3}},
    alert_icon_shift = util.by_pixel(0, -24),
    weight = 2000,
    max_speed = 1.2,
    max_power = "600kW",
    reversing_power_modifier = 0.6,
    braking_force = 10,
    friction_force = 0.50,
    vertical_selection_shift = -0.5,
    air_resistance = 0.0075, -- this is a percentage of current speed that will be subtracted
    connection_distance = 3,
    joint_distance = 4,
    energy_per_hit_point = 5,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 50
      },
      {
        type = "physical",
        decrease = 15,
        percent = 30
      },
      {
        type = "impact",
        decrease = 50,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 30
      },
      {
        type = "acid",
        decrease = 3,
        percent = 20
      }
    },
    burner =
    {
      fuel_category = "chemical",
      effectivity = 1,
      fuel_inventory_size = 3,
      smoke =
      {
        {
          name = "train-smoke",
          deviation = {0.3, 0.3},
          frequency = 100,
          position = {0, 0},
          starting_frame = 0,
          starting_frame_deviation = 60,
          height = 2,
          height_deviation = 0.5,
          starting_vertical_speed = 0.2,
          starting_vertical_speed_deviation = 0.1
        }
      }
    },
    front_light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {-0.6, -16},
        size = 2,
        intensity = 0.6,
        color = {r = 1.0, g = 0.9, b = 0.9}
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.6, -16},
        size = 2,
        intensity = 0.6,
        color = {r = 1.0, g = 0.9, b = 0.9}
      }
    },
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
    pictures =
    {
      layers =
      {
        {
          dice = 4,
          priority = "very-low",
          width = 238,
          height = 230,
          direction_count = 256,
          allow_low_quality_rotation = true,
          filenames =
          {
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-01.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-02.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-03.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-04.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-05.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-06.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-07.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-08.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0.0, -0.5},
          hr_version =
          {
            priority = "very-low",
            dice = 4,
            width = 474,
            height = 458,
            direction_count = 256,
            allow_low_quality_rotation = true,
            filenames =
            {
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-1.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-2.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-3.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-4.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-5.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-6.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-7.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-8.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-9.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-10.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-11.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-12.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-13.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-14.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-15.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-16.png"
            },
            line_length = 4,
            lines_per_file = 4,
            shift = {0.0, -0.5},
            scale = 0.5
            }
        },
        {
          priority = "very-low",
          flags = { "mask" },
          dice = 4,
          width = 236,
          height = 228,
          direction_count = 256,
          allow_low_quality_rotation = true,
          filenames =
          {
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-01.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-02.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-03.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-04.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-05.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-06.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-07.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-08.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0.0, -0.5},
          apply_runtime_tint = true,
          hr_version =
            {
              priority = "very-low",
              flags = { "mask" },
              dice = 4,
              width = 472,
              height = 456,
              direction_count = 256,
              allow_low_quality_rotation = true,
              filenames =
              {
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-1.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-2.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-3.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-4.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-5.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-6.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-7.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-8.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-9.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-10.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-11.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-12.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-13.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-14.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-15.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-16.png"
              },
              line_length = 4,
              lines_per_file = 4,
              shift = {0.0, -0.5},
              apply_runtime_tint = true,
              scale = 0.5
            }
        },
        {
          priority = "very-low",
          dice = 4,
          flags = { "shadow" },
          width = 253,
          height = 212,
          direction_count = 256,
          draw_as_shadow = true,
          allow_low_quality_rotation = true,
          filenames =
          {
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-01.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-02.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-03.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-04.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-05.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-06.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-07.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-08.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {1, 0.3}
        }
      }
    },
    front_light_pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          blend_mode = "additive",
          draw_as_light = true,
          width = 230,
          height = 212,
          direction_count = 256,
          allow_low_quality_rotation = true,
          filenames =
          {
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-light-front-01.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-light-front-02.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-light-front-03.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-light-front-04.png",
          },
          line_length = 8,
          lines_per_file = 8,
          shift = util.by_pixel(0, -26),
          hr_version =
          {
            priority = "very-low",
            blend_mode = "additive",
            draw_as_light = true,
            width = 458,
            height = 420,
            direction_count = 256,
            allow_low_quality_rotation = true,
            filenames =
            {
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-light-front-01.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-light-front-02.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-light-front-03.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-light-front-04.png",
            },
            line_length = 8,
            lines_per_file = 8,
            shift = util.by_pixel(0, -25),
            scale = 0.5
          }
        },
        {
          priority = "very-low",
          blend_mode = "additive",
          draw_as_light = true,
          width = 124,
          height = 108,
          direction_count = 256,
          allow_low_quality_rotation = true,
          filenames =
          {
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-light-top-01.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-light-top-02.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-light-top-03.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-light-top-04.png",
          },
          line_length = 8,
          lines_per_file = 8,
          shift = util.by_pixel(2, -42),
          hr_version =
          {
            priority = "very-low",
            blend_mode = "additive",
            draw_as_light = true,
            width = 258,
            height = 220,
            direction_count = 256,
            allow_low_quality_rotation = true,
            filenames =
            {
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-light-top-01.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-light-top-02.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-light-top-03.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-light-top-04.png",
            },
            line_length = 8,
            lines_per_file = 8,
            shift = util.by_pixel(-1, -41),
            scale = 0.5
          }
        }
      }
    },
    minimap_representation =
    {
      filename = "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    selected_minimap_representation =
    {
      filename = "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-selected-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    wheels = standard_train_wheels,
    stop_trigger =
    {
      -- left side
      {
        type = "create-trivial-smoke",
        repeat_count = 125,
        smoke_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the left
        speed = {-0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
      },
      -- right side
      {
        type = "create-trivial-smoke",
        repeat_count = 125,
        smoke_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the right
        speed = {0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
      },
      {
        type = "play-sound",
        sound = sounds.train_brakes
      },
      {
        type = "play-sound",
        sound = sounds.train_brake_screech
      }
    },
    drive_over_tie_trigger = drive_over_tie(),
    tie_distance = 50,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-engine.ogg",
        volume = 0.35
      },
      deactivate_sound =
      {
        filename = "__base__/sound/train-engine-stop.ogg",
        volume = 0
      },
      match_speed_to_activity = true,
      max_sounds_per_type = 2,
      -- use_doppler_shift = false
    },
    open_sound = { filename = "__base__/sound/train-door-open.ogg", volume=0.5 },
    close_sound = { filename = "__base__/sound/train-door-close.ogg", volume = 0.4 },
    sound_minimum_speed = 0.5,
    sound_scaling_ratio = 0.35,
    water_reflection = locomotive_reflection()
  },

  {
    type = "cargo-wagon",
    name = "cargo-wagon",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    inventory_size = 40,
    minable = {mining_time = 0.5, result = "cargo-wagon"},
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    max_health = 600,
    corpse = "cargo-wagon-remnants",
    dying_explosion = "cargo-wagon-explosion",
    collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
    selection_box = {{-1, -2.703125}, {1, 3.296875}},
    damaged_trigger_effect = hit_effects.entity(),
    vertical_selection_shift = -0.796875,
    weight = 1000,
    max_speed = 1.5,
    braking_force = 3,
    friction_force = 0.50,
    air_resistance = 0.01,
    connection_distance = 3,
    joint_distance = 4,
    energy_per_hit_point = 5,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 50
      },
      {
        type = "physical",
        decrease = 15,
        percent = 30
      },
      {
        type = "impact",
        decrease = 50,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 30
      },
      {
        type = "acid",
        decrease = 3,
        percent = 20
      }
    },
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
    pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          dice = 4,
          width = 222,
          height = 205,
          back_equals_front = true,
          direction_count = 128,
          allow_low_quality_rotation = true,
          filenames =
          {
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-1.png",
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-2.png",
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-3.png",
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-4.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0, -0.796875},
          hr_version =
          {
            priority = "very-low",
            dice = 4,
            width = 442,
            height = 407,
            back_equals_front = true,
            direction_count = 128,
            allow_low_quality_rotation = true,
            filenames =
            {
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-1.png",
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-2.png",
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-3.png",
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-4.png"
            },
            line_length = 4,
            lines_per_file = 8,
            shift = util.by_pixel(0, -25.25),
            scale = 0.5
          }
        },
        {
          flags = { "mask" },
          priority = "very-low",
          dice = 4,
          width = 196,
          height = 174,
          direction_count = 128,
          allow_low_quality_rotation = true,
          back_equals_front = true,
          apply_runtime_tint = true,
          shift = {0, -1.125},
          filenames =
          {
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-mask-1.png",
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-mask-2.png",
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-mask-3.png"
          },
          line_length = 4,
          lines_per_file = 11,
          hr_version =
          {
            flags = { "mask" },
            priority = "very-low",
            dice = 4,
            width = 406,
            height = 371,
            direction_count = 128,
            allow_low_quality_rotation = true,
            back_equals_front = true,
            apply_runtime_tint = true,
            shift = util.by_pixel(-0.5, -30.25),
            filenames =
            {
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-mask-1.png",
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-mask-2.png",
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-mask-3.png"
            },
            line_length = 4,
            lines_per_file = 11,
            scale = 0.5
          }
        },
        {
          flags = { "shadow" },
          priority = "very-low",
          dice = 4,
          width = 246,
          height = 201,
          back_equals_front = true,
          draw_as_shadow = true,
          direction_count = 128,
          allow_low_quality_rotation = true,
          filenames =
          {
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-shadow-1.png",
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-shadow-2.png",
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-shadow-3.png",
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-shadow-4.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0.8, -0.078125},
          hr_version =
          {
            flags = { "shadow" },
            priority = "very-low",
            dice = 4,
            width = 490,
            height = 401,
            back_equals_front = true,
            draw_as_shadow = true,
            direction_count = 128,
            allow_low_quality_rotation = true,
            filenames =
            {
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-shadow-1.png",
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-shadow-2.png",
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-shadow-3.png",
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-shadow-4.png"
            },
            line_length = 4,
            lines_per_file = 8,
            shift = util.by_pixel(32, -2.25),
            scale = 0.5
          }
        }
      }
    },
    horizontal_doors =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-horizontal-end.png",
          line_length = 1,
          width = 220,
          height = 33,
          frame_count = 8,
          shift = {0, -0.921875},
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-horizontal-end.png",
            line_length = 1,
            width = 438,
            height = 63,
            frame_count = 8,
            shift = util.by_pixel(0, -29.25),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-horizontal-side.png",
          line_length = 1,
          width = 186,
          height = 38,
          frame_count = 8,
          shift = {0, -0.78125},
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-horizontal-side.png",
            line_length = 1,
            width = 368,
            height = 76,
            frame_count = 8,
            shift = util.by_pixel(0, -24.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-horizontal-side-mask.png",
          width = 182,
          height = 35,
          line_length = 1,
          frame_count = 8,
          shift = {0, -0.828125},
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-horizontal-side-mask.png",
            width = 320,
            height = 69,
            line_length = 1,
            frame_count = 8,
            shift = util.by_pixel(0, -26.25),
            apply_runtime_tint = true,
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-horizontal-top.png",
          line_length = 1,
          width = 184,
          height = 28,
          frame_count = 8,
          shift = {0.015625, -1.125},
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-horizontal-top.png",
            line_length = 1,
            width = 369,
            height = 54,
            frame_count = 8,
            shift = util.by_pixel(0.75, -35.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-horizontal-top-mask.png",
          width = 185,
          height = 23,
          frame_count = 8,
          line_length = 1,
          shift = {0.015625, -1.17188},
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-horizontal-top-mask.png",
            width = 369,
            height = 45,
            frame_count = 8,
            line_length = 1,
            shift = util.by_pixel(0.75, -37.75),
            apply_runtime_tint = true,
            scale = 0.5
          }
        }
      }
    },
    vertical_doors =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-vertical-end.png",
          line_length = 8,
          width = 30,
          height = 23,
          frame_count = 8,
          shift = util.by_pixel(0, 62.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-vertical-end.png",
            line_length = 8,
            width = 58,
            height = 44,
            frame_count = 8,
            shift = util.by_pixel(0, 62.5),-- 241),--62.5+178.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-vertical-side.png",
          line_length = 8,
          width = 67,
          height = 169,
          frame_count = 8,
          shift = {0.015625, -1.01563},
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-vertical-side.png",
            line_length = 8,
            width = 127,
            height = 337,
            frame_count = 8,
            shift = util.by_pixel(0.25, -32.75),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-vertical-side-mask.png",
          line_length = 8,
          width = 56,
          height = 163,
          frame_count = 8,
          shift = {0, -1.10938},
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-vertical-side-mask.png",
            line_length = 8,
            width = 112,
            height = 326,
            frame_count = 8,
            shift = util.by_pixel(0, -35.5),
            apply_runtime_tint = true,
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-vertical-top.png",
          line_length = 8,
          width = 32,
          height = 168,
          frame_count = 8,
          shift = {0, -1.125},
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-vertical-top.png",
            line_length = 8,
            width = 64,
            height = 337,
            frame_count = 8,
            shift = util.by_pixel(0, -35.75),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-vertical-top-mask.png",
          line_length = 8,
          width = 32,
          height = 166,
          frame_count = 8,
          shift = {0, -1.15625},
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-vertical-top-mask.png",
            line_length = 8,
            width = 64,
            height = 332,
            frame_count = 8,
            shift = util.by_pixel(0, -37),
            apply_runtime_tint = true,
            scale = 0.5
          }
        }
      }
    },
    minimap_representation =
    {
      filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    selected_minimap_representation =
    {
      filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-selected-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    wheels = standard_train_wheels,
    drive_over_tie_trigger = drive_over_tie(),
    tie_distance = 50,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-wheels.ogg",
        volume = 0.3
      },
      match_volume_to_activity = true
    },
    crash_trigger = crash_trigger(),
    open_sound = sounds.cargo_wagon_open,
    close_sound = sounds.cargo_wagon_close,
    sound_minimum_speed = 1,
    vehicle_impact_sound = sounds.generic_impact,
    water_reflection = locomotive_reflection()
  },

  {
    type = "fluid-wagon",
    name = "fluid-wagon",
    icon = "__base__/graphics/icons/fluid-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 0.5, result = "fluid-wagon"},
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    max_health = 600,
    capacity = 25000,
    corpse = "fluid-wagon-remnants",
    dying_explosion = "fluid-wagon-explosion",
    collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
    selection_box = {{-1, -2.703125}, {1, 3.296875}},
    damaged_trigger_effect = hit_effects.entity(),
    vertical_selection_shift = -0.796875,
    weight = 1000,
    max_speed = 1.5,
    braking_force = 3,
    friction_force = 0.50,
    air_resistance = 0.01,
    connection_distance = 3,
    joint_distance = 4,
    energy_per_hit_point = 6,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 50
      },
      {
        type = "physical",
        decrease = 15,
        percent = 30
      },
      {
        type = "impact",
        decrease = 50,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 30
      },
      {
        type = "acid",
        decrease = 3,
        percent = 20
      }
    },
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
    pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          dice = 4,
          width = 208,
          height = 210,
          back_equals_front = true,
          direction_count = 128,
          allow_low_quality_rotation = true,
          filenames =
          {
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-1.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-2.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-3.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-4.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0 + 0.013, -1 + 0.077},
          hr_version =
          {
            priority = "very-low",
            dice = 4,
            width = 416,
            height = 419,
            back_equals_front = true,
            direction_count = 128,
            allow_low_quality_rotation = true,
            filenames =
            {
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-1.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-2.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-3.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-4.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-5.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-6.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-7.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-8.png"
            },
            line_length = 4,
            lines_per_file = 4,
            shift = {0 + 0.013, -1 + 0.077},
            scale = 0.5
          }
        },
        {
          flags = { "shadow" },
          priority = "very-low",
          dice = 4,
          width = 251,
          height = 188,
          back_equals_front = true,
          draw_as_shadow = true,
          direction_count = 128,
          allow_low_quality_rotation = true,
          filenames =
          {
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-shadow-1.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-shadow-2.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-shadow-3.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-shadow-4.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0.875 + 0.013, 0.3125 + 0.077},
          hr_version =
          {
            flags = { "shadow" },
            priority = "very-low",
            dice = 4,
            width = 501,
            height = 375,
            back_equals_front = true,
            draw_as_shadow = true,
            direction_count = 128,
            allow_low_quality_rotation = true,
            filenames =
            {
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-1.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-2.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-3.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-4.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-5.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-6.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-7.png"
            },
            line_length = 4,
            lines_per_file = 5,
            shift = {0.875 + 0.013, 0.3125 + 0.077},
            scale = 0.5
          }
        }
      }
    },
    minimap_representation =
    {
      filename = "__base__/graphics/entity/fluid-wagon/fluid-wagon-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    selected_minimap_representation =
    {
      filename = "__base__/graphics/entity/fluid-wagon/fluid-wagon-selected-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    wheels = standard_train_wheels,
    drive_over_tie_trigger = drive_over_tie(),
    tie_distance = 50,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-wheels.ogg",
        volume = 0.3
      },
      match_volume_to_activity = true
    },
    crash_trigger = crash_trigger(),
    sound_minimum_speed = 0.1,
    vehicle_impact_sound = sounds.generic_impact,
    water_reflection = locomotive_reflection()
  },
  {
    type = "artillery-wagon",
    name = "artillery-wagon",
    icon = "__base__/graphics/icons/artillery-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    inventory_size = 1,
    ammo_stack_limit = 100,
    minable = {mining_time = 0.5, result = "artillery-wagon"},
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    max_health = 600,
    corpse = "artillery-wagon-remnants",
    dying_explosion = "artillery-wagon-explosion",
    collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
    selection_box = {{-1, -2.703125}, {1, 3.296875}},
    damaged_trigger_effect = hit_effects.entity(),
    vertical_selection_shift = -0.796875,
    weight = 4000,
    max_speed = 1.5,
    braking_force = 3,
    friction_force = 0.50,
    air_resistance = 0.015,
    connection_distance = 3,
    joint_distance = 4,
    energy_per_hit_point = 2,
    gun = "artillery-wagon-cannon",
    turret_rotation_speed = 0.001,
    turn_after_shooting_cooldown = 60,
    cannon_parking_frame_count = 8,
    cannon_parking_speed = 0.25,
    manual_range_modifier = 2.5,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 50
      },
      {
        type = "physical",
        decrease = 15,
        percent = 30
      },
      {
        type = "impact",
        decrease = 50,
        percent = 50
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 30
      },
      {
        type = "acid",
        decrease = 3,
        percent = 20
      }
    },
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
    pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          width = 238,
          height = 206,
          direction_count = 256,
          allow_low_quality_rotation = true,
          line_length = 4,
          lines_per_file = 4,
          shift = util.by_pixel(0, -27),
          dice = 4,
          filenames =
          {
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-1.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-2.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-3.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-4.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-5.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-6.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-7.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-8.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-9.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-10.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-11.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-12.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-13.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-14.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-15.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-16.png"
          },
          hr_version =
          {
            priority = "very-low",
            width = 476,
            height = 410,
            direction_count = 256,
            allow_low_quality_rotation = true,
            line_length = 4,
            lines_per_file = 4,
            shift = util.by_pixel(0.5, -27.5),
            scale = 0.5,
            dice = 4,
            filenames =
            {
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-1.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-2.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-3.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-4.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-5.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-6.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-7.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-8.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-9.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-10.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-11.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-12.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-13.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-14.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-15.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-16.png"
            }
          }
        },
        {
          priority = "very-low",
          dice = 4,
          width = 300,
          height = 240,
          direction_count = 256,
          allow_low_quality_rotation = true,
          line_length = 4,
          lines_per_file = 4,
          shift = util.by_pixel(37, 6),
          draw_as_shadow = true,
          filenames =
          {
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-1.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-2.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-3.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-4.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-5.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-6.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-7.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-8.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-9.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-10.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-11.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-12.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-13.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-14.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-15.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-16.png"
          },
          hr_version =
          {
            priority = "very-low",
            dice = 4,
            width = 598,
            height = 480,
            direction_count = 256,
            allow_low_quality_rotation = true,
            line_length = 4,
            lines_per_file = 4,
            shift = util.by_pixel(36.5, 6.5),--v
            scale = 0.5,
            draw_as_shadow = true,
            filenames =
            {
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-1.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-2.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-3.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-4.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-5.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-6.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-7.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-8.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-9.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-10.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-11.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-12.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-13.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-14.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-15.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-16.png"
            }
          }
        }
      }
    },
    cannon_barrel_pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          width = 266,
          height = 192,
          direction_count = 256,
          line_length = 4,
          lines_per_file = 4,
          shift = util.by_pixel(0, -56),
          filenames =
          {
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-1.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-2.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-3.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-4.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-5.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-6.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-7.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-8.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-9.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-10.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-11.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-12.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-13.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-14.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-15.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-16.png"
          },
          hr_version =
          {
            priority = "very-low",
            width = 530,
            height = 384,
            direction_count = 256,
            line_length = 4,
            lines_per_file = 4,
            shift = util.by_pixel(0, -56),
            scale = 0.5,
            filenames =
            {
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-1.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-2.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-3.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-4.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-5.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-6.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-7.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-8.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-9.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-10.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-11.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-12.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-13.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-14.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-15.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-16.png"
            }
          }
        },
        {
          priority = "very-low",
          width = 454,
          height = 314,
          direction_count = 256,
          line_length = 4,
          lines_per_file = 4,
          shift = util.by_pixel(-3+58, 8+46),
          draw_as_shadow = true,
          filenames =
          {
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-1.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-2.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-3.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-4.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-5.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-6.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-7.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-8.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-9.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-10.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-11.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-12.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-13.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-14.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-15.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-16.png"
          },
          hr_version =
          {
            priority = "very-low",
            width = 906,
            height = 626,
            direction_count = 256,
            line_length = 4,
            lines_per_file = 4,
            shift = util.by_pixel(-3.5+58, 7.5+46),
            scale = 0.5,
            draw_as_shadow = true,
            filenames =
            {
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-1.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-2.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-3.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-4.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-5.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-6.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-7.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-8.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-9.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-10.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-11.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-12.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-13.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-14.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-15.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-16.png"
            }
          }
        }
      }
    },
    cannon_base_pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          width = 180,
          height = 136,
          direction_count = 256,
          line_length = 4,
          lines_per_file = 4,
          shift = util.by_pixel(0, -40),
          filenames =
          {
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-1.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-2.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-3.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-4.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-5.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-6.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-7.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-8.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-9.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-10.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-11.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-12.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-13.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-14.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-15.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-16.png"
          },
          hr_version =
          {
            priority = "very-low",
            width = 358,
            height = 270,
            direction_count = 256,
            line_length = 4,
            lines_per_file = 4,
            shift = util.by_pixel(0, -40.5),
            scale = 0.5,
            filenames =
            {
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-1.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-2.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-3.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-4.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-5.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-6.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-7.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-8.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-9.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-10.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-11.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-12.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-13.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-14.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-15.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-16.png"
            }
          }
        },
        {
          priority = "very-low",
          width = 238,
          height = 170,
          direction_count = 256,
          line_length = 4,
          lines_per_file = 4,
          shift = util.by_pixel(54+58, -1+46),
          draw_as_shadow = true,
          filenames =
          {
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-1.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-2.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-3.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-4.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-5.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-6.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-7.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-8.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-9.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-10.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-11.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-12.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-13.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-14.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-15.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-16.png"
          },
          hr_version =
          {
            priority = "very-low",
            width = 476,
            height = 340,
            direction_count = 256,
            line_length = 4,
            lines_per_file = 4,
            shift = util.by_pixel(54.5+58, -1+46),
            scale = 0.5,
            draw_as_shadow = true,
            filenames =
            {
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-1.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-2.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-3.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-4.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-5.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-6.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-7.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-8.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-9.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-10.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-11.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-12.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-13.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-14.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-15.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-16.png"
            }
          }
        }
      }
    },
    cannon_base_shiftings =
    {
      util.by_pixel(0.0, 19.5),
      util.by_pixel(-1.5, 19.0),
      util.by_pixel(-3.5, 19.0),
      util.by_pixel(-5.5, 18.5),
      util.by_pixel(-7.5, 18.5),
      util.by_pixel(-9.0, 18.0),
      util.by_pixel(-11.0, 17.5),
      util.by_pixel(-13.0, 17.5),
      util.by_pixel(-15.0, 17.0),
      util.by_pixel(-16.5, 16.5),
      util.by_pixel(-18.5, 16.0),
      util.by_pixel(-20.5, 15.5),
      util.by_pixel(-22.0, 15.0),
      util.by_pixel(-24.0, 14.5),
      util.by_pixel(-25.5, 14.0),
      util.by_pixel(-27.5, 13.0),
      util.by_pixel(-29.0, 12.5),
      util.by_pixel(-30.5, 12.0),
      util.by_pixel(-32.0, 11.0),
      util.by_pixel(-34.0, 10.5),
      util.by_pixel(-35.5, 9.5),
      util.by_pixel(-37.0, 9.0),
      util.by_pixel(-38.5, 8.0),
      util.by_pixel(-40.0, 7.5),
      util.by_pixel(-41.5, 6.5),
      util.by_pixel(-42.5, 5.5),
      util.by_pixel(-44.0, 4.5),
      util.by_pixel(-45.5, 4.0),
      util.by_pixel(-46.5, 3.0),
      util.by_pixel(-48.0, 2.0),
      util.by_pixel(-49.0, 1.0),
      util.by_pixel(-50.5, 0.0),
      util.by_pixel(-51.5, -0.5),
      util.by_pixel(-52.5, -1.5),
      util.by_pixel(-53.5, -2.5),
      util.by_pixel(-54.5, -3.5),
      util.by_pixel(-55.5, -5.0),
      util.by_pixel(-56.5, -6.0),
      util.by_pixel(-57.5, -7.0),
      util.by_pixel(-58.0, -8.0),
      util.by_pixel(-59.0, -9.0),
      util.by_pixel(-60.0, -10.5),
      util.by_pixel(-60.5, -11.5),
      util.by_pixel(-61.0, -12.5),
      util.by_pixel(-62.0, -13.5),
      util.by_pixel(-62.5, -15.0),
      util.by_pixel(-63.0, -16.0),
      util.by_pixel(-63.5, -17.0),
      util.by_pixel(-64.0, -18.5),
      util.by_pixel(-64.5, -19.5),
      util.by_pixel(-65.0, -21.0),
      util.by_pixel(-65.0, -22.0),
      util.by_pixel(-65.5, -23.0),
      util.by_pixel(-65.5, -24.5),
      util.by_pixel(-66.0, -25.5),
      util.by_pixel(-66.0, -26.5),
      util.by_pixel(-66.0, -28.0),
      util.by_pixel(-66.5, -29.0),
      util.by_pixel(-66.5, -30.0),
      util.by_pixel(-66.5, -31.5),
      util.by_pixel(-66.5, -32.5),
      util.by_pixel(-66.0, -34.0),
      util.by_pixel(-66.0, -35.0),
      util.by_pixel(-66.0, -36.0),
      util.by_pixel(-65.5, -37.0),
      util.by_pixel(-66.0, -38.5),
      util.by_pixel(-66.0, -39.5),
      util.by_pixel(-66.5, -40.5),
      util.by_pixel(-66.5, -42.0),
      util.by_pixel(-66.5, -43.0),
      util.by_pixel(-66.5, -44.0),
      util.by_pixel(-66.5, -45.5),
      util.by_pixel(-66.5, -46.5),
      util.by_pixel(-66.5, -48.0),
      util.by_pixel(-66.0, -49.0),
      util.by_pixel(-66.0, -50.0),
      util.by_pixel(-65.5, -51.5),
      util.by_pixel(-65.5, -52.5),
      util.by_pixel(-65.0, -53.5),
      util.by_pixel(-64.5, -55.0),
      util.by_pixel(-64.5, -56.0),
      util.by_pixel(-64.0, -57.5),
      util.by_pixel(-63.5, -58.5),
      util.by_pixel(-63.0, -59.5),
      util.by_pixel(-62.5, -61.0),
      util.by_pixel(-61.5, -62.0),
      util.by_pixel(-61.0, -63.0),
      util.by_pixel(-60.5, -64.0),
      util.by_pixel(-59.5, -65.5),
      util.by_pixel(-59.0, -66.5),
      util.by_pixel(-58.0, -67.5),
      util.by_pixel(-57.0, -68.5),
      util.by_pixel(-56.0, -70.0),
      util.by_pixel(-55.0, -71.0),
      util.by_pixel(-54.0, -72.0),
      util.by_pixel(-53.0, -73.0),
      util.by_pixel(-52.0, -74.0),
      util.by_pixel(-51.0, -75.0),
      util.by_pixel(-50.0, -76.0),
      util.by_pixel(-48.5, -77.0),
      util.by_pixel(-47.5, -78.0),
      util.by_pixel(-46.0, -79.0),
      util.by_pixel(-45.0, -80.0),
      util.by_pixel(-43.5, -81.0),
      util.by_pixel(-42.0, -81.5),
      util.by_pixel(-40.5, -82.5),
      util.by_pixel(-39.5, -83.5),
      util.by_pixel(-38.0, -84.0),
      util.by_pixel(-36.5, -85.0),
      util.by_pixel(-34.5, -85.5),
      util.by_pixel(-33.0, -86.5),
      util.by_pixel(-31.5, -87.0),
      util.by_pixel(-30.0, -88.0),
      util.by_pixel(-28.5, -88.5),
      util.by_pixel(-26.5, -89.0),
      util.by_pixel(-25.0, -90.0),
      util.by_pixel(-23.0, -90.5),
      util.by_pixel(-21.5, -91.0),
      util.by_pixel(-19.5, -91.5),
      util.by_pixel(-17.5, -92.0),
      util.by_pixel(-16.0, -92.5),
      util.by_pixel(-14.0, -93.0),
      util.by_pixel(-12.0, -93.0),
      util.by_pixel(-10.5, -93.5),
      util.by_pixel(-8.5, -94.0),
      util.by_pixel(-6.5, -94.0),
      util.by_pixel(-4.5, -94.5),
      util.by_pixel(-2.5, -94.5),
      util.by_pixel(-0.5, -95.0),
      util.by_pixel(1.0, -95.0),
      util.by_pixel(3.0, -94.5),
      util.by_pixel(5.0, -94.5),
      util.by_pixel(7.0, -94.0),
      util.by_pixel(8.5, -94.0),
      util.by_pixel(10.5, -93.5),
      util.by_pixel(12.5, -93.0),
      util.by_pixel(14.5, -92.5),
      util.by_pixel(16.5, -92.5),
      util.by_pixel(18.0, -92.0),
      util.by_pixel(20.0, -91.5),
      util.by_pixel(21.5, -91.0),
      util.by_pixel(23.5, -90.5),
      util.by_pixel(25.0, -89.5),
      util.by_pixel(27.0, -89.0),
      util.by_pixel(28.5, -88.5),
      util.by_pixel(30.5, -88.0),
      util.by_pixel(32.0, -87.0),
      util.by_pixel(33.5, -86.5),
      util.by_pixel(35.0, -85.5),
      util.by_pixel(36.5, -85.0),
      util.by_pixel(38.0, -84.0),
      util.by_pixel(39.5, -83.5),
      util.by_pixel(41.0, -82.5),
      util.by_pixel(42.5, -81.5),
      util.by_pixel(44.0, -80.5),
      util.by_pixel(45.0, -80.0),
      util.by_pixel(46.5, -79.0),
      util.by_pixel(47.5, -78.0),
      util.by_pixel(49.0, -77.0),
      util.by_pixel(50.0, -76.0),
      util.by_pixel(51.5, -75.0),
      util.by_pixel(52.5, -74.0),
      util.by_pixel(53.5, -73.0),
      util.by_pixel(54.5, -72.0),
      util.by_pixel(55.5, -71.0),
      util.by_pixel(56.5, -70.0),
      util.by_pixel(57.5, -68.5),
      util.by_pixel(58.5, -67.5),
      util.by_pixel(59.0, -66.5),
      util.by_pixel(60.0, -65.5),
      util.by_pixel(60.5, -64.0),
      util.by_pixel(61.5, -63.0),
      util.by_pixel(62.0, -62.0),
      util.by_pixel(62.5, -61.0),
      util.by_pixel(63.0, -59.5),
      util.by_pixel(63.5, -58.5),
      util.by_pixel(64.0, -57.5),
      util.by_pixel(64.5, -56.0),
      util.by_pixel(65.0, -55.0),
      util.by_pixel(65.5, -53.5),
      util.by_pixel(65.5, -52.5),
      util.by_pixel(66.0, -51.5),
      util.by_pixel(66.5, -50.0),
      util.by_pixel(66.5, -49.0),
      util.by_pixel(66.5, -48.0),
      util.by_pixel(66.5, -46.5),
      util.by_pixel(67.0, -45.5),
      util.by_pixel(67.0, -44.0),
      util.by_pixel(67.0, -43.0),
      util.by_pixel(66.5, -42.0),
      util.by_pixel(66.5, -40.5),
      util.by_pixel(66.5, -39.5),
      util.by_pixel(66.5, -38.5),
      util.by_pixel(66.5, -37.5),
      util.by_pixel(66.5, -36.0),
      util.by_pixel(67.0, -35.0),
      util.by_pixel(67.0, -34.0),
      util.by_pixel(67.0, -32.5),
      util.by_pixel(67.0, -31.5),
      util.by_pixel(67.0, -30.5),
      util.by_pixel(67.0, -29.0),
      util.by_pixel(67.0, -28.0),
      util.by_pixel(67.0, -26.5),
      util.by_pixel(66.5, -25.5),
      util.by_pixel(66.5, -24.5),
      util.by_pixel(66.0, -23.0),
      util.by_pixel(66.0, -22.0),
      util.by_pixel(65.5, -20.5),
      util.by_pixel(65.0, -19.5),
      util.by_pixel(65.0, -18.5),
      util.by_pixel(64.5, -17.0),
      util.by_pixel(64.0, -16.0),
      util.by_pixel(63.0, -15.0),
      util.by_pixel(62.5, -13.5),
      util.by_pixel(62.0, -12.5),
      util.by_pixel(61.5, -11.5),
      util.by_pixel(60.5, -10.0),
      util.by_pixel(60.0, -9.0),
      util.by_pixel(59.0, -8.0),
      util.by_pixel(58.0, -7.0),
      util.by_pixel(57.5, -6.0),
      util.by_pixel(56.5, -4.5),
      util.by_pixel(55.5, -3.5),
      util.by_pixel(54.5, -2.5),
      util.by_pixel(53.5, -1.5),
      util.by_pixel(52.0, -0.5),
      util.by_pixel(51.0, 0.0),
      util.by_pixel(50.0, 1.0),
      util.by_pixel(48.5, 2.0),
      util.by_pixel(47.5, 3.0),
      util.by_pixel(46.0, 4.0),
      util.by_pixel(45.0, 5.0),
      util.by_pixel(43.5, 5.5),
      util.by_pixel(42.0, 6.5),
      util.by_pixel(40.5, 7.5),
      util.by_pixel(39.0, 8.0),
      util.by_pixel(37.5, 9.0),
      util.by_pixel(36.0, 10.0),
      util.by_pixel(34.5, 10.5),
      util.by_pixel(33.0, 11.5),
      util.by_pixel(31.5, 12.0),
      util.by_pixel(29.5, 12.5),
      util.by_pixel(28.0, 13.5),
      util.by_pixel(26.5, 14.0),
      util.by_pixel(24.5, 14.5),
      util.by_pixel(23.0, 15.0),
      util.by_pixel(21.0, 15.5),
      util.by_pixel(19.0, 16.0),
      util.by_pixel(17.5, 16.5),
      util.by_pixel(15.5, 17.0),
      util.by_pixel(13.5, 17.5),
      util.by_pixel(11.5, 18.0),
      util.by_pixel(10.0, 18.0),
      util.by_pixel(8.0, 18.5),
      util.by_pixel(6.0, 19.0),
      util.by_pixel(4.0, 19.0)
    },
    cannon_barrel_recoil_shiftings =
    {
      {x =-0.000, y =0.040, z =-0.000},
      {x =-0.789, y =0.037, z =-0.351},
      {x =-1.578, y =0.035, z =-0.702},
      {x =-2.367, y =0.033, z =-1.054},
      {x =-3.155, y =0.031, z =-1.405},
      {x =-3.944, y =0.028, z =-1.756},
      {x =-3.931, y =0.028, z =-1.750},
      {x =-3.901, y =0.028, z =-1.737},
      {x =-3.854, y =0.029, z =-1.716},
      {x =-3.790, y =0.029, z =-1.688},
      {x =-3.711, y =0.029, z =-1.652},
      {x =-3.617, y =0.029, z =-1.610},
      {x =-3.508, y =0.030, z =-1.562},
      {x =-3.385, y =0.030, z =-1.507},
      {x =-3.249, y =0.030, z =-1.447},
      {x =-3.102, y =0.031, z =-1.381},
      {x =-2.944, y =0.031, z =-1.311},
      {x =-2.776, y =0.032, z =-1.236},
      {x =-2.599, y =0.032, z =-1.157},
      {x =-2.416, y =0.033, z =-1.076},
      {x =-2.226, y =0.033, z =-0.991},
      {x =-2.032, y =0.034, z =-0.905},
      {x =-1.835, y =0.034, z =-0.817},
      {x =-1.635, y =0.035, z =-0.728},
      {x =-1.436, y =0.035, z =-0.639},
      {x =-1.238, y =0.036, z =-0.551},
      {x =-1.042, y =0.037, z =-0.464},
      {x =-0.851, y =0.037, z =-0.379},
      {x =-0.665, y =0.038, z =-0.296},
      {x =-0.485, y =0.038, z =-0.216},
      {x =-0.314, y =0.039, z =-0.140},
      {x =-0.152, y =0.039, z =-0.068}
    },
    cannon_barrel_light_direction = {0.5976251, 0.0242053, -0.8014102},
    cannon_barrel_recoil_shiftings_load_correction_matrix =
    {
      { 0,    0.25,   0 },
      {-0.25,    0,   0 },
      { 0,       0,   0.25 }
    },
    minimap_representation =
    {
      filename = "__base__/graphics/entity/artillery-wagon/artillery-wagon-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    selected_minimap_representation =
    {
      filename = "__base__/graphics/entity/artillery-wagon/artillery-wagon-selected-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    wheels = standard_train_wheels,
    drive_over_tie_trigger = drive_over_tie(),
    tie_distance = 50,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-wheels.ogg",
        volume = 0.3
      },
      match_volume_to_activity = true
    },
    crash_trigger = crash_trigger(),
    open_sound = sounds.artillery_open,
    close_sound = sounds.artillery_close,
    rotating_sound = { sound = { filename = "__base__/sound/fight/artillery-rotation-loop.ogg", volume = 0.2 }},
    rotating_stopped_sound = { filename = "__base__/sound/fight/artillery-rotation-stop.ogg" },
    sound_minimum_speed = 0.1,
    vehicle_impact_sound = sounds.generic_impact,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/artillery-wagon/artillery-wagon-reflection.png",
        priority = "extra-high",
        width = 32,
        height = 52,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5
      },
      rotate = true,
      orientation_to_variation = false
    }
  }
}
)

require ("prototypes.entity.rail-pictures")

local hit_effects = require ("prototypes.entity.hit-effects")
local sounds = require("prototypes.entity.sounds")
local tile_sounds = require("prototypes.tile.tile-sounds")
local simulations = require("__base__.prototypes.factoriopedia-simulations")

local drive_over_tie = function()
  return
  {
    type = "play-sound",
    sound =
    {
      category = "environment",
      variations = sound_variations("__base__/sound/train-tie",
                                    6,
                                    0.4,
                                    {
                                      volume_multiplier("main-menu", 2.4),
                                      volume_multiplier("driving", 1.3)
                                    })
    }
  }
end

local rolling_stock_back_light = function()
  return
  {
    {
      minimum_darkness = 0.3,
      color = {1, 0.1, 0.05, 0},
      shift = {-0.6, 3.5},
      size = 2,
      intensity = 0.6,
      add_perspective = true
    },
    {
      minimum_darkness = 0.3,
      color = {1, 0.1, 0.05, 0},
      shift = {0.6, 3.5},
      size = 2,
      intensity = 0.6,
      add_perspective = true
    }
  }
end

local rolling_stock_stand_by_light = function()
  return
  {
    {
      minimum_darkness = 0.3,
      color = {0.05, 0.2, 1, 0},
      shift = {-0.6, -3.5},
      size = 2,
      intensity = 0.5,
      add_perspective = true
    },
    {
      minimum_darkness = 0.3,
      color = {0.05, 0.2, 1, 0},
      shift = {0.6, -3.5},
      size = 2,
      intensity = 0.5,
      add_perspective = true
    }
  }
end

curved_rail_ending_shifts = function()
  local px = 1.0/64
  return
    {
      {-px, 0}, {0, px},
      {px, 0}, {0, px},
      {0, -px}, {-px, 0},
      {0, px}, {-px, 0},
      {px, 0}, {0, -px},
      {-px, 0}, {0, -px},
      {0, px}, {px, 0},
      {0, -px}, {px, 0}
    }
end

rail_8shifts_vector = function(dx, dy)
  return
    {
      {  dx,  dy },
      { -dx,  dy },
      { -dy,  dx },
      { -dy, -dx },
      { -dx, -dy },
      {  dx, -dy },
      {  dy, -dx },
      {  dy,  dx }
    }
end

local standard_train_wheels =
{
  rotated = util.sprite_load("__base__/graphics/entity/train-wheel/train-wheel",
    {
      priority = "very-low",
      direction_count = 256,
      scale = 0.5,
      shift = util.by_pixel(0, 8),
      usage = "train"
    }
  )
}

local locomotive_reflection = function()
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/locomotive/reflection/locomotive-reflection.png",
      priority = "extra-high",
      width = 20,
      height = 52,
      shift = util.by_pixel(0, 40),
      variation_count = 1,
      scale = 5
    },
    rotate = true,
    orientation_to_variation = false
  }
end

data:extend(
{
  {
    type = "legacy-straight-rail",
    name = "legacy-straight-rail",
    order = "c[legacy-rail]-a[legacy-straight-rail]",
    deconstruction_alternative = "straight-rail",
    icon = "__base__/graphics/icons/legacy-rail.png",
    collision_box = {{-1, -1}, {1, 1}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    hidden = true,
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    fast_replaceable_group = "",
    minable = {mining_time = 0.2, result = "rail"},
    max_health = 100,
    corpse = "legacy-straight-rail-remnants",
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
    pictures = legacy_rail_pictures("legacy_straight_rail"),
    placeable_by = {item = "rail", count = 1},
    walking_sound = tile_sounds.walking.rails,
    deconstruction_marker_positions =
    {
      { 0.0, 0.0 }, -- North
      { 0.5, -0.5 }, -- NorthEast (diagonal)
      { 0.0, 0.0 }, -- East
      { 0.5, 0.5 }, -- SouthEast (diagonal)
      { -0.5, 0.5 }, -- SouthWest (diagonal)
      { -0.5, -0.5 } -- NorthWest (diagonal)
    }
  },
  {
    type = "legacy-curved-rail",
    name = "legacy-curved-rail",
    order = "c[legacy-rail]-b[legacy-curved-rail]",
    deconstruction_alternative = "straight-rail",
    icon = "__base__/graphics/icons/legacy-curved-rail.png",
    collision_box = {{-2, -2}, {2, 2}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    hidden = true,
    fast_replaceable_group = "",
    minable = {mining_time = 0.2, result = "rail", count = 4},
    max_health = 200,
    corpse = "legacy-curved-rail-remnants",
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
    pictures = legacy_rail_pictures("legacy_curved_rail"),
    ending_shifts = curved_rail_ending_shifts(),
    placeable_by = {item = "rail", count = 4},
    walking_sound = tile_sounds.walking.rails
  },
  {
    type = "straight-rail",
    name = "straight-rail",
    order = "a[ground-rail]-a[straight-rail]",
    icon = "__base__/graphics/icons/rail.png",
    collision_box = {{-1, -1}, {1, 1}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.2, result = "rail", count = 1},
    max_health = 200,
    corpse = "straight-rail-remnants",
    dying_explosion =
    {
      name = "rail-explosion"
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
    pictures = new_rail_pictures("straight"),
    placeable_by = {item = "rail", count = 1},
    walking_sound = tile_sounds.walking.rails,
    extra_planner_goal_penalty = -4,
    factoriopedia_alternative = "straight-rail"
  },
  {
    type = "half-diagonal-rail",
    name = "half-diagonal-rail",
    order = "a[ground-rail]-b[half-diagonal-rail]",
    deconstruction_alternative = "straight-rail",
    icon = "__base__/graphics/icons/half-diagonal-rail.png",
    collision_box = {{-0.75, -2.236}, {0.75, 2.236}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    tile_height = 2,
    extra_planner_goal_penalty = -4,
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.2, result = "rail", count = 2},
    max_health = 200,
    corpse = "half-diagonal-rail-remnants",
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
    pictures = new_rail_pictures("half-diagonal"),
    placeable_by = {item = "rail", count = 2},
    walking_sound = tile_sounds.walking.rails,
    extra_planner_penalty = 0,
    factoriopedia_alternative = "straight-rail"
  },
  {
    type = "curved-rail-a",
    name = "curved-rail-a",
    order = "a[ground-rail]-c[curved-rail-a]",
    deconstruction_alternative = "straight-rail",
    icon = "__base__/graphics/icons/curved-rail.png",
    collision_box = {{-0.75, -2.516}, {0.75, 2.516}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.2, result = "rail", count = 3},
    max_health = 200,
    corpse = "curved-rail-a-remnants",
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
    pictures = new_rail_pictures("curved-a"),
    placeable_by = {item = "rail", count = 3},
    walking_sound = tile_sounds.walking.rails,
    extra_planner_penalty = 0.5,
    deconstruction_marker_positions = rail_8shifts_vector(-0.248, -0.533),
    factoriopedia_alternative = "straight-rail"
  },
  {
    type = "curved-rail-b",
    name = "curved-rail-b",
    order = "a[ground-rail]-d[curved-rail-b]",
    deconstruction_alternative = "straight-rail",
    icon = "__base__/graphics/icons/curved-rail-b.png",
    collision_box = {{-0.75, -2.441}, {0.75, 2.441}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.2, result = "rail", count = 3},
    max_health = 200,
    corpse = "curved-rail-b-remnants",
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
    pictures = new_rail_pictures("curved-b"),
    placeable_by = {item = "rail", count = 3},
    walking_sound = tile_sounds.walking.rails,
    extra_planner_penalty = 0.5,
    deconstruction_marker_positions = rail_8shifts_vector(-0.309, -0.155),
    factoriopedia_alternative = "straight-rail"
  },
  {
    type = "rail-ramp",
    name = "dummy-rail-ramp",
    localised_name = "dummy",
    hidden = true,
    icons =
    {
      {icon = "__base__/graphics/icons/curved-rail.png"},
      {icon = "__core__/graphics/icons/unknown.png"}
    },
    collision_box = {{-1.8, -7.8}, {1.8, 7.8}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    pictures = dummy_rails_ramp_pictures(),
    forced_fence_segment_count = 2,
    walking_sound = tile_sounds.walking.rails,
    extra_planner_penalty = 0.5,
    support_range = 9
  },
  {
    type = "elevated-straight-rail",
    name = "dummy-elevated-straight-rail",
    hidden = true,
    icons =
    {
      {icon = "__base__/graphics/icons/curved-rail.png"},
      {icon = "__core__/graphics/icons/unknown.png"}
    },
    localised_name = "dummy",
    collision_box = {{-1, -1}, {1, 1}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    -- collision box is hardcoded for rails as to avoid unexpected changes in the way rail blocks are merged
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    pictures = elevated_rail_pictures("straight")
  },
  {
    type = "elevated-half-diagonal-rail",
    name = "dummy-elevated-half-diagonal-rail",
    hidden = true,
    icons =
    {
      {icon = "__base__/graphics/icons/curved-rail.png"},
      {icon = "__core__/graphics/icons/unknown.png"}
    },
    localised_name = "dummy",
    collision_box = {{-0.75, -2.236}, {0.75, 2.236}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    tile_height = 2,
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    pictures = elevated_rail_pictures("half-diagonal")
  },
  {
    type = "elevated-curved-rail-a",
    name = "dummy-elevated-curved-rail-a",
    hidden = true,
    icons =
    {
      {icon = "__base__/graphics/icons/curved-rail.png"},
      {icon = "__core__/graphics/icons/unknown.png"}
    },
    localised_name = "dummy",
    collision_box = {{-0.75, -2.516}, {0.75, 2.516}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    damaged_trigger_effect = hit_effects.wall(),
    pictures = elevated_rail_pictures("curved-a")
  },
  {
    type = "elevated-curved-rail-b",
    name = "dummy-elevated-curved-rail-b",
    hidden = true,
    icons =
    {
      {icon = "__base__/graphics/icons/curved-rail.png"},
      {icon = "__core__/graphics/icons/unknown.png"}
    },
    localised_name = "dummy",
    collision_box = {{-0.75, -2.441}, {0.75, 2.441}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    pictures = elevated_rail_pictures("curved-b")
  },
  {
    type = "rail-support",
    name = "dummy-rail-support",
    localised_name = "dummy",
    hidden = true,
    icons =
    {
      {icon = "__base__/graphics/icons/curved-rail.png"},
      {icon = "__core__/graphics/icons/unknown.png"}
    },
    flags = {"placeable-neutral", "player-creation", "building-direction-16-way", "filter-directions"},
    max_health = 1000,
    collision_box = {{-1.8, -0.8}, {1.8, 0.8}},
    selection_box = {{-1.9, -0.9}, {1.9, 0.9}},
    graphics_set = { structure = util.empty_animation() }
  },
  {
    type = "locomotive",
    name = "locomotive",
    icon = "__base__/graphics/icons/locomotive.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 0.5, result = "locomotive"},
    mined_sound = sounds.deconstruct_large(0.8),
    max_health = 1000,
    deliver_category = "vehicle",
    corpse = "locomotive-remnants",
    dying_explosion = "locomotive-explosion",
    factoriopedia_simulation = simulations.factoriopedia_locomotive,
    collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
    selection_box = {{-1, -3}, {1, 3}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1,
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
    icons_positioning =
    {
      {inventory_index = defines.inventory.fuel, shift = {0, 0.3}, max_icons_per_row = 3},
    },
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
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
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
    color = {r = 0.92, g = 0.07, b = 0, a = 1},
    default_copy_color_from_train_stop = true,
    pictures =
    {
      rotated =
      {
        layers =
        {
          util.sprite_load("__base__/graphics/entity/locomotive/locomotive",
            {
              dice = 4,
              priority = "very-low",
              allow_low_quality_rotation = true,
              direction_count = 256,
              scale = 0.5,
              usage = "train"
            }
          ),
          util.sprite_load("__base__/graphics/entity/locomotive/locomotive-mask",
            {
              dice = 4,
              priority = "very-low",
              flags = { "mask" },
              apply_runtime_tint = true,
              tint_as_overlay = true,
              allow_low_quality_rotation = true,
              direction_count = 256,
              scale = 0.5,
              usage = "train"
            }
          ),
          util.sprite_load("__base__/graphics/entity/locomotive/locomotive-shadow",
            {
              dice = 4,
              priority = "very-low",
              flags = { "shadow" },
              draw_as_shadow = true,
              allow_low_quality_rotation = true,
              direction_count = 256,
              scale = 0.5,
              usage = "train"
            }
          )
        }
      },
    },
    front_light_pictures =
    {
      rotated =
      {
        layers =
        {
          util.sprite_load("__base__/graphics/entity/locomotive/locomotive-lights",
            {
              dice = 4,
              priority = "very-low",
              blend_mode = "additive",
              draw_as_light = true,
              allow_low_quality_rotation = true,
              direction_count = 256,
              scale = 0.5
            }
          )
        }
      },
    },
    minimap_representation =
    {
      filename = "__base__/graphics/entity/locomotive/minimap-representation/locomotive-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    selected_minimap_representation =
    {
      filename = "__base__/graphics/entity/locomotive/minimap-representation/locomotive-selected-minimap-representation.png",
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
    drive_over_tie_trigger_minimal_speed = 0.5,
    tie_distance = 50,
    impact_category = "metal-large",
    working_sound =
    {
      main_sounds =
      {
        {
          sound =
          {
            filename = "__base__/sound/train-engine-driving.ogg",
            volume = 0.7,
            modifiers =
            {
              volume_multiplier("main-menu", 1.8),
              volume_multiplier("driving", 0.7),
              volume_multiplier("tips-and-tricks", 0.8),
              volume_multiplier("elevation", 0.5)
            },
          },
          match_volume_to_activity = true,
          activity_to_volume_modifiers =
          {
            multiplier = 1.5,
            offset = 1.0,
          },
          match_speed_to_activity = true,
          activity_to_speed_modifiers =
          {
            multiplier = 0.6,
            minimum = 1.0,
            maximum = 1.15,
            offset = 0.2,
          }
        },
        {
          sound =
          {
            filename = "__base__/sound/train-engine.ogg",
            volume = 0.35,
            modifiers =
            {
              volume_multiplier("main-menu", 1.8),
              volume_multiplier("driving", 0.9),
              volume_multiplier("tips-and-tricks", 0.8)
            },
          },
          match_volume_to_activity = true,
          activity_to_volume_modifiers =
          {
            multiplier = 1.75,
            offset = 1.7,
            inverted = true
          },
        },
        {
          sound =
          {
            filename = "__base__/sound/train-wheels.ogg",
            volume = 1.0,
            modifiers =
            {
              volume_multiplier("main-menu", 2.0),
              volume_multiplier("driving", 0.35),
              volume_multiplier("elevation", 0.5)
            },
          },
          match_volume_to_activity = true,
          activity_to_volume_modifiers =
          {
            multiplier = 1.5,
            maximum = 1.0,
            offset = 1.1,
          },
          match_speed_to_activity = true,
          activity_to_speed_modifiers =
          {
            multiplier = 0.6,
            minimum = 1.0,
            maximum = 1.2,
            offset = 0.2,
          },
        },
      },
      max_sounds_per_prototype = 2,
      activate_sound = { filename = "__base__/sound/train-engine-start.ogg", volume = 0.35 },
      deactivate_sound = { filename = "__base__/sound/train-engine-stop.ogg", volume = 0.35 },
    },
    open_sound = { filename = "__base__/sound/train-door-open.ogg", volume=0.5 },
    close_sound = { filename = "__base__/sound/train-door-close.ogg", volume = 0.4 },
    water_reflection = locomotive_reflection(),
    allow_remote_driving = true
  },

  {
    type = "cargo-wagon",
    name = "cargo-wagon",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    inventory_size = 40,
    minable = {mining_time = 0.5, result = "cargo-wagon"},
    mined_sound = sounds.deconstruct_large(0.8),
    max_health = 600,
    deliver_category = "vehicle",
    corpse = "cargo-wagon-remnants",
    dying_explosion = "cargo-wagon-explosion",
    factoriopedia_simulation = simulations.factoriopedia_cargo_wagon,
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
    color = {r = 0.43, g = 0.23, b = 0, a = 1},
    pictures =
    {
      rotated =
      {
        layers =
        {
          util.sprite_load("__base__/graphics/entity/cargo-wagon/cargo-wagon",
            {
              dice = 4,
              priority = "very-low",
              allow_low_quality_rotation = true,
              back_equals_front = true,
              direction_count = 128,
              scale = 0.5,
              usage = "train"
            }
          ),
          util.sprite_load("__base__/graphics/entity/cargo-wagon/cargo-wagon-mask",
            {
              dice = 4,
              priority = "very-low",
              allow_low_quality_rotation = true,
              back_equals_front = true,
              flags = { "mask" },
              apply_runtime_tint = true,
              tint_as_overlay = true,
              direction_count = 128,
              scale = 0.5,
              usage = "train"
            }
          ),
          util.sprite_load("__base__/graphics/entity/cargo-wagon/cargo-wagon-shadow",
            {
              dice = 4,
              priority = "very-low",
              allow_low_quality_rotation = true,
              back_equals_front = true,
              draw_as_shadow = true,
              direction_count = 128,
              scale = 0.5,
              usage = "train"
            }
          )
        }
      }
    },
    horizontal_doors =
    {
      layers =
      {
        util.sprite_load("__base__/graphics/entity/cargo-wagon/cargo-wagon-door-horizontal",
          {
            frame_count = 8,
            scale = 0.5,
            usage = "train"
          }
        ),
        util.sprite_load("__base__/graphics/entity/cargo-wagon/cargo-wagon-door-horizontal-mask",
          {
            apply_runtime_tint = true,
            tint_as_overlay = true,
            flags = { "mask" },
            frame_count = 8,
            scale = 0.5,
            usage = "train"
          }
        )
      }
    },
    vertical_doors =
    {
      layers =
      {
        util.sprite_load("__base__/graphics/entity/cargo-wagon/cargo-wagon-door-vertical",
          {
            frame_count = 8,
            scale = 0.5,
            usage = "train"
          }
        ),
        util.sprite_load("__base__/graphics/entity/cargo-wagon/cargo-wagon-door-vertical-mask",
          {
            apply_runtime_tint = true,
            tint_as_overlay = true,
            flags = { "mask" },
            frame_count = 8,
            scale = 0.5,
            usage = "train"
          }
        )
      }
    },
    minimap_representation =
    {
      filename = "__base__/graphics/entity/cargo-wagon/minimap-representation/cargo-wagon-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    selected_minimap_representation =
    {
      filename = "__base__/graphics/entity/cargo-wagon/minimap-representation/cargo-wagon-selected-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    wheels = standard_train_wheels,
    drive_over_tie_trigger = drive_over_tie(),
    drive_over_tie_trigger_minimal_speed = 0.5,
    tie_distance = 50,
    working_sound = sounds.train_wagon_wheels,
    crash_trigger = crash_trigger(),
    open_sound = sounds.cargo_wagon_open,
    close_sound = sounds.cargo_wagon_close,
    impact_category = "metal-large",
    water_reflection = locomotive_reflection(),
    door_opening_sound =
    {
      sound =
      {
        filename = "__base__/sound/cargo-wagon/cargo-wagon-opening-loop.ogg",
        volume = 0.3,
        aggregation = {max_count = 1, remove = true, count_already_playing = true}
      },
      stopped_sound =
      {
        filename = "__base__/sound/cargo-wagon/cargo-wagon-opened.ogg",
        volume = 0.25,
        aggregation = {max_count = 1, remove = true, count_already_playing = true}
      }
    },
    door_closing_sound =
    {
      sound =
      {
        filename = "__base__/sound/cargo-wagon/cargo-wagon-closing-loop.ogg",
        volume = 0.3,
        aggregation = {max_count = 1, remove = true, count_already_playing = true}
      },
      stopped_sound =
      {
        filename = "__base__/sound/cargo-wagon/cargo-wagon-closed.ogg",
        volume = 0.3,
        aggregation = {max_count = 1, remove = true, count_already_playing = true}
      }
    }
  },

  {
    type = "fluid-wagon",
    name = "fluid-wagon",
    icon = "__base__/graphics/icons/fluid-wagon.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 0.5, result = "fluid-wagon"},
    mined_sound = sounds.deconstruct_large(0.8),
    max_health = 600,
    capacity = 50000,
    deliver_category = "vehicle",
    corpse = "fluid-wagon-remnants",
    dying_explosion = "fluid-wagon-explosion",
    factoriopedia_simulation = simulations.factoriopedia_fluid_wagon,
    collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
    selection_box = {{-1, -2.703125}, {1, 3.296875}},
    damaged_trigger_effect = hit_effects.entity(),
    vertical_selection_shift = -0.796875,
    icon_draw_specification = {scale = 1.25, shift = {0, -1}},
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
      rotated =
      {
        layers =
        {
          util.sprite_load("__base__/graphics/entity/fluid-wagon/fluid-wagon",
            {
              dice = 4,
              priority = "very-low",
              allow_low_quality_rotation = true,
              back_equals_front = true,
              direction_count = 128,
              scale = 0.5,
              usage = "train"
            }
          ),
          util.sprite_load("__base__/graphics/entity/fluid-wagon/fluid-wagon-shadow",
            {
              dice = 4,
              priority = "very-low",
              allow_low_quality_rotation = true,
              back_equals_front = true,
              draw_as_shadow = true,
              direction_count = 128,
              scale = 0.5,
              usage = "train"
            }
          )
        }
      }
    },
    minimap_representation =
    {
      filename = "__base__/graphics/entity/fluid-wagon/minimap-representation/fluid-wagon-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    selected_minimap_representation =
    {
      filename = "__base__/graphics/entity/fluid-wagon/minimap-representation/fluid-wagon-selected-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    wheels = standard_train_wheels,
    drive_over_tie_trigger = drive_over_tie(),
    drive_over_tie_trigger_minimal_speed = 0.5,
    tie_distance = 50,
    working_sound = sounds.train_wagon_wheels,
    crash_trigger = crash_trigger(),
    impact_category = "metal-large",
    water_reflection = locomotive_reflection()
  },
  {
    type = "artillery-wagon",
    name = "artillery-wagon",
    icon = "__base__/graphics/icons/artillery-wagon.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    inventory_size = 1,
    ammo_stack_limit = 100,
    minable = {mining_time = 0.5, result = "artillery-wagon"},
    mined_sound = sounds.deconstruct_large(0.8),
    max_health = 600,
    deliver_category = "vehicle",
    corpse = "artillery-wagon-remnants",
    dying_explosion = "artillery-wagon-explosion",
    factoriopedia_simulation = simulations.factoriopedia_artillery_wagon,
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
    icon_draw_specification = {scale = 0.7, shift = {0, -0.5}},
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
      rotated =
      {
        layers =
        {
          util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-base",
            {
              dice = 4,
              priority = "very-low",
              allow_low_quality_rotation = true,
              direction_count = 256,
              scale = 0.5,
              usage = "train"
            }
          ),
          util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow",
            {
              dice = 4,
              priority = "very-low",
              allow_low_quality_rotation = true,
              draw_as_shadow = true,
              direction_count = 256,
              scale = 0.5,
              usage = "train"
            }
          )
        }
      }
    },
    cannon_barrel_pictures =
    {
      rotated =
      {
        layers =
        {
          util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel",
            {
              priority = "very-low",
              allow_low_quality_rotation = true,
              direction_count = 256,
              scale = 0.5,
              usage = "train"
            }
          ),
          util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow",
            {
              priority = "very-low",
              allow_low_quality_rotation = true,
              draw_as_shadow = true,
              direction_count = 256,
              scale = 0.5,
              usage = "train"
            }
          )
        }
      }
    },
    cannon_base_pictures =
    {
      rotated =
      {
        layers =
        {
          util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base",
            {
              priority = "very-low",
              allow_low_quality_rotation = true,
              direction_count = 256,
              scale = 0.5,
              usage = "train"
            }
          ),
          util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow",
            {
              priority = "very-low",
              allow_low_quality_rotation = true,
              draw_as_shadow = true,
              direction_count = 256,
              scale = 0.5,
              usage = "train"
            }
          )
        }
      }
    },
    cannon_base_height = 1.672049,
    cannon_base_shift_when_vertical = -2.5357685,
    cannon_base_shift_when_horizontal = -2.0702245,

    cannon_barrel_recoil_shiftings =
    { -- East-North-Up (when cannon is facing North)
      {  0.0100, -0.0000, -0.0000 },
      {  0.0093, -0.1973, -0.0878 },
      {  0.0088, -0.3945, -0.1755 },
      {  0.0083, -0.5918, -0.2635 },
      {  0.0078, -0.7888, -0.3513 },
      {  0.0070, -0.9860, -0.4390 },
      {  0.0070, -0.9828, -0.4375 },
      {  0.0070, -0.9753, -0.4343 },
      {  0.0073, -0.9635, -0.4290 },
      {  0.0073, -0.9475, -0.4220 },
      {  0.0073, -0.9278, -0.4130 },
      {  0.0073, -0.9043, -0.4025 },
      {  0.0075, -0.8770, -0.3905 },
      {  0.0075, -0.8463, -0.3768 },
      {  0.0075, -0.8123, -0.3618 },
      {  0.0078, -0.7755, -0.3453 },
      {  0.0078, -0.7360, -0.3278 },
      {  0.0080, -0.6940, -0.3090 },
      {  0.0080, -0.6498, -0.2893 },
      {  0.0083, -0.6040, -0.2690 },
      {  0.0083, -0.5565, -0.2478 },
      {  0.0085, -0.5080, -0.2263 },
      {  0.0085, -0.4588, -0.2043 },
      {  0.0088, -0.4088, -0.1820 },
      {  0.0088, -0.3590, -0.1598 },
      {  0.0090, -0.3095, -0.1378 },
      {  0.0093, -0.2605, -0.1160 },
      {  0.0093, -0.2128, -0.0948 },
      {  0.0095, -0.1663, -0.0740 },
      {  0.0095, -0.1213, -0.0540 },
      {  0.0098, -0.0785, -0.0350 },
      {  0.0098, -0.0380, -0.0170 },
    },
    cannon_barrel_light_direction = {0.5976251, -0.0242053, -0.8014102}, -- ENU

    minimap_representation =
    {
      filename = "__base__/graphics/entity/artillery-wagon/minimap-representation/artillery-wagon-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    selected_minimap_representation =
    {
      filename = "__base__/graphics/entity/artillery-wagon/minimap-representation/artillery-wagon-selected-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    wheels = standard_train_wheels,
    drive_over_tie_trigger = drive_over_tie(),
    drive_over_tie_trigger_minimal_speed = 0.5,
    tie_distance = 50,
    working_sound = sounds.train_wagon_wheels,
    crash_trigger = crash_trigger(),
    open_sound = sounds.artillery_open,
    close_sound = sounds.artillery_close,
    rotating_sound =
    {
      sound = {filename = "__base__/sound/fight/artillery-rotation-loop.ogg", volume = 0.2},
      stopped_sound = {filename = "__base__/sound/fight/artillery-rotation-stop.ogg"}
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/artillery-wagon/reflection/artillery-wagon-reflection.png",
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
  },
  {
    type = "train-stop",
    name = "train-stop",
    icon = "__base__/graphics/icons/train-stop.png",
    flags = {"placeable-neutral", "player-creation", "filter-directions"},
    fast_replaceable_group = "train-stop",
    minable = {mining_time = 0.2, result = "train-stop"},
    max_health = 250,
    corpse = "train-stop-remnants",
    dying_explosion = "train-stop-explosion",
    factoriopedia_simulation = simulations.factoriopedia_train_stop,
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.9, -0.9}, {0.9, 0.9}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_boxes =
    {
      north = {{-3,-2.5}, {0.8, 1.25}},
      east = {{-1.75, -4.25},{1.625, 0.5}},
      south = {{-0.8125, -3.625},{2.75, 0.4375}},
      west = {{-1.75, -1.6875},{2.0625, 2.75}}
    },
    tile_width = 2,
    tile_height = 2,
    animation_ticks_per_frame = 20,
    rail_overlay_animations = make_4way_animation_from_spritesheet(
    {
      filename = "__base__/graphics/entity/train-stop/train-stop-ground.png",
      width = 386,
      height = 377,
      direction_count = 4,
      shift = util.by_pixel(0, -0.75),
      scale = 0.5
    }),

    animations = make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-bottom.png",
        width = 140,
        height = 291,
        direction_count = 4,
        shift = util.by_pixel(-0.5, -26.75),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-shadow.png",
        width = 526,
        height = 370,
        shift = util.by_pixel( 41.5, 11.0),
        direction_count = 4,
        draw_as_shadow = true,
        scale = 0.5
      }
    }}),

    top_animations = make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-top.png",
        width = 312,
        height = 306,
        direction_count = 4,
        shift = util.by_pixel( 0.5, -50.5),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-top-mask.png",
        width = 306,
        height = 294,
        direction_count = 4,
        apply_runtime_tint = true,
        tint_as_overlay = true,
        shift = util.by_pixel( 0.5, -48.5),
        scale = 0.5
      }
    }}),

    light1 =
    {
      light = {intensity = 0.2, size = 2},
      picture =
      {
        north =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-north-light-1.png",
          draw_as_glow = true,
          width = 17,
          height = 9,
          shift = util.by_pixel(-70.75, -44.25),
          scale = 0.5
        },
        west =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-east-light-1.png",
          draw_as_glow = true,
          width = 6,
          height = 16,
          shift = util.by_pixel(34.5, 19.5),
          scale = 0.5
        },
        south =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-south-light-1.png",
          draw_as_glow = true,
          width = 16,
          height = 4,
          shift = util.by_pixel(70, -95),
          scale = 0.5
        },
        east =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-west-light-1.png",
          draw_as_glow = true,
          width = 6,
          height = 16,
          shift = util.by_pixel(-30.5, -112),
          scale = 0.5
        }
      },
      red_picture =
      {
        north =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-north-red-light-1.png",
          draw_as_glow = true,
          width = 17,
          height = 9,
          shift = util.by_pixel(-70.75, -44.25),
          scale = 0.5
        },
        west =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-east-red-light-1.png",
          draw_as_glow = true,
          width = 6,
          height = 16,
          shift = util.by_pixel(34.5, 19.5),
          scale = 0.5
        },
        south =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-south-red-light-1.png",
          draw_as_glow = true,
          width = 16,
          height = 4,
          shift = util.by_pixel(70, -95),
          scale = 0.5
        },
        east =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-west-red-light-1.png",
          draw_as_glow = true,
          width = 6,
          height = 16,
          shift = util.by_pixel(-30.5, -112),
          scale = 0.5
        }
      }
    },

    light2 =
    {
      light = {intensity = 0.2, size = 2},
      picture =
      {
        north =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-north-light-2.png",
          draw_as_glow = true,
          width = 16,
          height = 9,
          shift = util.by_pixel(-57.5, -43.75),
          scale = 0.5
        },
        west =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-east-light-2.png",
          draw_as_glow = true,
          width = 6,
          height = 16,
          shift = util.by_pixel(34.5, 10),
          scale = 0.5
        },
        south =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-south-light-2.png",
          draw_as_glow = true,
          width = 16,
          height = 5,
          shift = util.by_pixel(57, -94.75),
          scale = 0.5
        },
        east =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-west-light-2.png",
          draw_as_glow = true,
          width = 7,
          height = 15,
          shift = util.by_pixel(-30.75, -102.75),
          scale = 0.5
        }
      },
      red_picture =
      {
        north =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-north-red-light-2.png",
          draw_as_glow = true,
          width = 16,
          height = 9,
          shift = util.by_pixel(-57.5, -43.75),
          scale = 0.5
        },
        west =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-east-red-light-2.png",
          draw_as_glow = true,
          width = 6,
          height = 16,
          shift = util.by_pixel(34.5, 10),
          scale = 0.5
        },
        south =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-south-red-light-2.png",
          draw_as_glow = true,
          width = 16,
          height = 5,
          shift = util.by_pixel(57, -94.75),
          scale = 0.5
        },
        east =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-west-red-light-2.png",
          draw_as_glow = true,
          width = 7,
          height = 15,
          shift = util.by_pixel(-30.75, -102.75),
          scale = 0.5
        }
      }
    },
    impact_category = "metal",
    color={0.95, 0, 0, 1},
    open_sound = {filename = "__base__/sound/open-close/train-stop-open.ogg", volume = 0.6},
    close_sound = {filename = "__base__/sound/open-close/train-stop-close.ogg", volume = 0.5},
    working_sound = {filename = "__base__/sound/train-stop.ogg", volume = 0.7, audible_distance_modifier = 0.2},

    circuit_connector = circuit_connector_definitions["train-station"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_train_stopped_signal = {type = "virtual", name = "signal-T"},
    default_trains_count_signal = {type = "virtual", name = "signal-C"},
    default_trains_limit_signal = {type = "virtual", name = "signal-L"},
    default_priority_signal = {type = "virtual", name = "signal-P"}
  },
  {
    type = "rail-signal",
    name = "rail-signal",
    icon = "__base__/graphics/icons/rail-signal.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-16-way", "filter-directions"},
    fast_replaceable_group = "rail-signal",
    minable = {mining_time = 0.1, result = "rail-signal"},
    max_health = 100,
    corpse = "rail-signal-remnants",
    dying_explosion = "rail-signal-explosion",
    factoriopedia_simulation = simulations.factoriopedia_rail_signal,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.45, -0.65}, {0.45, 0.65}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.rail_signal_open,
    close_sound = sounds.rail_signal_close,
    ground_picture_set = require("graphics.entity.rail-signal.rail-signal-ground"),
    elevated_picture_set = require("graphics.entity.rail-signal.rail-signal-ground"),
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_red_output_signal = {type = "virtual", name = "signal-red"},
    default_orange_output_signal = {type = "virtual", name = "signal-yellow"},
    default_green_output_signal = {type = "virtual", name = "signal-green"}
  },
  {
    type = "rail-chain-signal",
    name = "rail-chain-signal",
    icon = "__base__/graphics/icons/rail-chain-signal.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-16-way", "filter-directions"},
    fast_replaceable_group = "rail-signal",
    minable = {mining_time = 0.1, result = "rail-chain-signal"},
    max_health = 100,
    corpse = "rail-chain-signal-remnants",
    dying_explosion = "rail-chain-signal-explosion",
    factoriopedia_simulation = simulations.factoriopedia_rail_chain_signal,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.rail_signal_open,
    close_sound = sounds.rail_signal_close,
    ground_picture_set = require("graphics.entity.rail-chain-signal.rail-chain-signal-ground"),
    elevated_picture_set = require("graphics.entity.rail-chain-signal.rail-chain-signal-ground"),
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_red_output_signal = {type = "virtual", name = "signal-red"},
    default_orange_output_signal = {type = "virtual", name = "signal-yellow"},
    default_green_output_signal = {type = "virtual", name = "signal-green"},
    default_blue_output_signal = {type = "virtual", name = "signal-blue"}
  }
}
)

local infinity_cargo_wagon = table.deepcopy(data.raw["cargo-wagon"]["cargo-wagon"])
infinity_cargo_wagon.type = "infinity-cargo-wagon"
infinity_cargo_wagon.name = "infinity-cargo-wagon"
infinity_cargo_wagon.icon = nil
infinity_cargo_wagon.icons = {{icon = "__base__/graphics/icons/cargo-wagon.png", tint = {r = 0.5, g = 0.5, b = 1}}}
infinity_cargo_wagon.gui_mode = "admins"
infinity_cargo_wagon.minable = {mining_time = 0.1, result = "infinity-cargo-wagon"}
util.recursive_tint(infinity_cargo_wagon, {r = 0.5, g = 0.5, b = 1})
data:extend({infinity_cargo_wagon})


pipepictures = function()
  return {
    straight_vertical =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    straight_vertical_window =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-window.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    straight_horizontal_window =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal-window.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    straight_horizontal =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    corner_up_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-up-right.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    corner_up_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-up-left.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    corner_down_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-down-right.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    corner_down_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-down-left.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    t_up =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-up.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    t_down =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-down.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    t_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-right.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    t_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-left.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    cross =
    {
      filename = "__base__/graphics/entity/pipe/pipe-cross.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    ending_up =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-up.png",
      priority = "extra-high",
      width = 32,
      height = 32
      },
    ending_down =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-down.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    ending_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-right.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    ending_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-left.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    water_flow =
    {
      filename = "__base__/graphics/entity/pipe/water-flow.png",
      priority = "extra-high",
      width = 128,
      height = 20
    },
    water_flow_background =
    {
      filename = "__base__/graphics/entity/pipe/water-flow-background.png",
      priority = "extra-high",
      width = 32,
      height = 20
    }
  }
end

data:extend(
{
  {
    type = "player",
    name = "player",
    icon = "__base__/graphics/icons/player.png",
    flags = {"pushable", "placeable-player", "placeable-off-grid"},
    max_health = 100,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.2, -0.2}, {0.2, 0.2}},
    crafting_categories = {"crafting"},
    running_speed = 0.15,
    distance_per_frame = 0.13,
    maximum_corner_sliding_distance = 0.7,
    eat =
    {
      {
        filename = "__base__/sound/eat.wav",
        volume = 1
      }
    },
    heartbeat =
    {
      {
        filename = "__base__/sound/heartbeat.ogg",
        volume = 1.5
      }
    },
    idle_animation =
    {
      priority = "medium",
      frame_width = 48,
      frame_height = 66,
      direction_count = 5,
      stripes =
      {
        {
          filename = "__base__/graphics/entity/player/character-idle-1.png",
          frame_count = 40
        },
        {
          filename = "__base__/graphics/entity/player/character-idle-2.png",
          frame_count = 40
        },
        {
          filename = "__base__/graphics/entity/player/character-idle-3.png",
          frame_count = 40
        }
      },
      shift = {0, -0.6}
    },
    idle_frames_per_tick = 1,
    idle_with_gun_animation =
    {
      priority = "medium",
      frame_width = 48,
      frame_height = 66,
      direction_count = 5,
      stripes =
      {
        {
          filename = "__base__/graphics/entity/player/character-idle-with-gun-1.png",
          frame_count = 40
        },
        {
          filename = "__base__/graphics/entity/player/character-idle-with-gun-2.png",
          frame_count = 40
        },
        {
          filename = "__base__/graphics/entity/player/character-idle-with-gun-3.png",
          frame_count = 40
        }
      },
      shift = {0, -0.6}
    },
    idle_with_gun_frames_per_tick = 1,
    light = {intensity = 0.4, size = 25},
    mine_with_hands_frames_per_tick = 1,
    mine_with_tool_frames_per_tick = 1,
    mining_speed = 0.01,
    mining_with_hands_animation =
    {
      priority = "medium",
      frame_width = 48,
      frame_height = 66,
      direction_count = 5,
      stripes =
      {
        {
          filename = "__base__/graphics/entity/player/character-mine-with-hands-1.png",
          frame_count = 40
        },
        {
          filename = "__base__/graphics/entity/player/character-mine-with-hands-2.png",
          frame_count = 40
        }
      },
      shift = {0, -0.6}
    },
    mining_with_hands_particles_animation_positions = {29, 63},
    mining_with_tool_animation =
    {
      priority = "medium",
      frame_width = 64,
      frame_height = 88,
      direction_count = 5,
      stripes =
      {
        {
          filename = "__base__/graphics/entity/player/character-mine-with-tool-1.png",
          frame_count = 24
        },
        {
          filename = "__base__/graphics/entity/player/character-mine-with-tool-2.png",
          frame_count = 24
        }
      },
      shift = {0, -0.6}
    },
    mining_with_tool_particles_animation_positions = {28},
    running_aim =
    {
      filename = "__base__/graphics/entity/player/character-clothes-run-aim.png",
      priority = "medium",
      frame_width = 58,
      frame_height = 72,
      frame_count = 30,
      direction_count = 18,
      shift = {0, -0.6}
    },
    running_animation =
    {
      filename = "__base__/graphics/entity/player/character-clothes-run.png",
      priority = "medium",
      frame_width = 48,
      frame_height = 66,
      frame_count = 30,
      direction_count = 5,
      shift = {0, -0.6}
    },
    running_mask_animation =
   {
      filename = "__base__/graphics/entity/player/character-clothes-run-mask.png",
      priority = "medium",
      frame_width = 48,
      frame_height = 66,
      frame_count = 30,
      direction_count = 5,
      shift = {0, -0.6}
    }
  },
  {
    type = "tree",
    name = "dry-tree",
    icon = "__base__/graphics/icons/dry-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    minable = {
      mining_particle = "wooden-particle",
      mining_time = 1,
      result = "raw-wood"
    },
    max_health = 10,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.6, -1.5}, {0.5, 0.4}},
    pictures =
    {
      {
        filename = "__base__/graphics/entity/tree/tree-a01.png",
        priority = "extra-high",
        width = 84,
        height = 64,
        shift = {0.7, -0.7}
      },
      {
        filename = "__base__/graphics/entity/tree/tree-a02.png",
        priority = "extra-high",
        width = 96,
        height = 85,
        shift = {0.9, -0.6}
      },
      {
        filename = "__base__/graphics/entity/tree/tree-a03.png",
        priority = "extra-high",
        width = 88,
        height = 84,
        shift = {0, -0.7}
      },
      {
        filename = "__base__/graphics/entity/tree/tree-a04.png",
        priority = "extra-high",
        width = 85,
        height = 82,
        shift = {0.7, -0.6}
      },
      {
        filename = "__base__/graphics/entity/tree/tree-a05.png",
        priority = "extra-high",
        width = 95,
        height = 81,
        shift = {0.2, -0.8}
      },
      {
        filename = "__base__/graphics/entity/tree/tree-a06.png",
        priority = "extra-high",
        width = 91,
        height = 68,
        shift = {0, -0.6}
      },
      {
        filename = "__base__/graphics/entity/tree/tree-a07.png",
        priority = "extra-high",
        width = 92,
        height = 78,
        shift = {0.5, -0.8}
      },
      {
        filename = "__base__/graphics/entity/tree/tree-a08.png",
        priority = "extra-high",
        width = 105,
        height = 94,
        shift = {0.5, -0.8}
      }
    },
    autoplace = {
      -- autoplace controls which entities are generated on a new map

      -- sharpness == 0 means that sum of peak influences is equal to the probability,
      -- sharpness == 1 means that sum of influences < 0.5 has probability 0, and >0.5 has probability 1
      sharpness = 0.2,

      -- List of optimal conditions for placing the enitty
      -- Each peak can specify a number of dimensions and a noise, both are summed together.
      -- If there is only a single peak, it may be included directly in the autoplace block
      -- (see dry tree or fish)
      peaks = {
        {
          -- Dry trees at places without water

          noise_layer = "dry-trees", -- Name of the layer, must be defined before use
          noise_influence = 0.11, -- Scale of the noise outputs.
          noise_persistence = 0.9,

          influence = 0.11, -- Influence of perfect conditions and penalty for bad conditions

          -- There can be a number of dimensions controling the placement.
          -- Dimensions each contain a name of a control variable: "starting_area_weight",
          -- "roughness", "elevation","water", "temperature",
          -- Unspecified dimensions don't add any influence.
          water_optimal = 0.05, -- Optimal value of the control variable
          water_range = 0.0, -- Width of perfect conditions for the control variable
          water_max_range = 0.2 -- Width of the interpolation range. Values further from the
                                -- optimum produce maximal negative influence.
        },
        {
          -- Dry trees in between the regular trees
          noise_layer = "trees",
          noise_influence = 0.2,
          noise_persistence = 0.5,

          influence = 0.15,
          water_optimal = 0.2,
          water_range = 0.1,
          water_max_range = 0.2
        }
      }
    }
  },
  {
    type = "tree",
    name = "big-tree",
    icon = "__base__/graphics/icons/big-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    minable =
    {
      count = 5,
      mining_particle = "wooden-particle",
      mining_time = 2,
      result = "raw-wood"
    },
    max_health = 10,
    collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selection_box = {{-0.8, -2.2}, {0.8, 0.8}},
    drawing_box = {{-0.8, -2.8}, {0.8, 0.8}},
    pictures =
    {
      {
        filename = "__base__/graphics/entity/big-tree/big-tree-01.png",
        priority = "extra-high",
        width = 155,
        height = 118,
        shift = {1.1, -1}
      },
      {
        filename = "__base__/graphics/entity/big-tree/big-tree-02.png",
        priority = "extra-high",
        width = 144,
        height = 169,
        shift = {1.2, -0.8}
      },
      {
        filename = "__base__/graphics/entity/big-tree/big-tree-03.png",
        priority = "extra-high",
        width = 151,
        height = 131,
        shift = {0.8, -0.7}
      },
      {
        filename = "__base__/graphics/entity/big-tree/big-tree-04.png",
        priority = "extra-high",
        width = 167,
        height = 131,
        shift = {2, -1}
      },
      {
        filename = "__base__/graphics/entity/big-tree/big-tree-05.png",
        priority = "extra-high",
        width = 156,
        height = 154,
        shift = {1.5, -1.7}
      },
      {
        filename = "__base__/graphics/entity/big-tree/big-tree-06.png",
        priority = "extra-high",
        width = 113,
        height = 111,
        shift = {0.7, -0.9}
      },
      {
        filename = "__base__/graphics/entity/big-tree/big-tree-07.png",
        priority = "extra-high",
        width = 116,
        height = 125,
        shift = {1, -0.7}
      },
      {
        filename = "__base__/graphics/entity/big-tree/big-tree-08.png",
        priority = "extra-high",
        width = 162,
        height = 129,
        shift = {1.4, -1.3}
      },
      {
        filename = "__base__/graphics/entity/big-tree/big-tree-09.png",
        priority = "extra-high",
        width = 156,
        height = 164,
        shift = {1.7, -1.1}
      },
      {
        filename = "__base__/graphics/entity/big-tree/big-tree-10.png",
        priority = "extra-high",
        width = 196,
        height = 129,
        shift = {1.1, -1.1}
      },
      {
        filename = "__base__/graphics/entity/big-tree/big-tree-11.png",
        priority = "extra-high",
        width = 196,
        height = 129,
        shift = {1.3, -1.4}
      },
      {
        filename = "__base__/graphics/entity/big-tree/big-tree-12.png",
        priority = "extra-high",
        width = 175,
        height = 164,
        shift = {1.6, -1.2}
      }
    },
    autoplace =
    {
      sharpness = 0.5,

      noise_layer = "trees",
      noise_influence = 0.9,
      noise_persistence = 0.5,

      influence = 0.4,
      water_optimal = 0.2,
      water_range = 0.1,
      water_max_range = 0.2
    }
  },
  {
    type = "furnace",
    name = "stone-furnace",
    icon = "__base__/graphics/icons/stone-furnace.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "stone-furnace"},
    max_health = 20,
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    smelting_categories = {"smelting"},
    result_inventory_size = 1,
    smelting_energy_consumption = 3,
    smelting_speed = 0.5,
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      effectivity = 1,
      fuel_inventory_size = 1,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 0.5,
          position = {0, -2.3}
        }
      }
    },
    drawing_scale = 1,
    on_animation =
    {
      filename = "__base__/graphics/entity/stone-furnace/stone-furnace.png",
      priority = "extra-high",
      frame_width = 81,
      frame_height = 64,
      frame_count = 1,
      shift = {0.5, 0.05 }
    },
    off_animation =
    {
      filename = "__base__/graphics/entity/stone-furnace/stone-furnace.png",
      priority = "extra-high",
      frame_width = 81,
      frame_height = 64,
      frame_count = 1,
      shift = {0.5, 0.05 }
    },
    fire_animation =
    {
      filename = "__base__/graphics/entity/stone-furnace/stone-furnace-fire.png",
      priority = "extra-high",
      frame_width = 23,
      frame_height = 27,
      frame_count = 12,
      shift = { 0.078125, 0.5234375}
    },
    fast_replaceable_group = "furnace"
  },
  {
    type = "transport-belt",
    name = "basic-transport-belt",
    icon = "__base__/graphics/icons/basic-transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = "basic-transport-belt"},
    max_health = 10,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 64,
    animations =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      direction_count = 12
    },
    fast_replaceable_group = "transport-belt",
    speed = 0.03125
  },
  {
    type = "fish",
    name = "fish",
    icon = "__base__/graphics/icons/fish.png",
    flags = {"placeable-neutral"},
    minable = {mining_time = 1, result = "fish"},
    max_health = 5,
    collision_box = {{-0.4, -0.2}, {0.4, 0.2}},
    selection_box = {{-0.5, -0.3}, {0.5, 0.3}},
    pictures =
    {
      {
        filename = "__base__/graphics/entity/fish/fish-1.png",
        priority = "extra-high",
        width = 22,
        height = 36
      },
      {
        filename = "__base__/graphics/entity/fish/fish-2.png",
        priority = "extra-high",
        width = 32,
        height = 32
      }
    },
    autoplace = {
      influence = 0.01
    }
  },
  {
    type = "boiler",
    name = "boiler",
    icon = "__base__/graphics/icons/boiler.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "boiler"},
    max_health = 20,
    fast_replaceable_group = "pipe",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    energy_consumption = 6.5,
    burner =
    {
      effectivity = 0.5,
      fuel_inventory_size = 1,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 1
        }
      }
    },
    max_liquid_amount = 10,
    structure =
    {
      left =
      {
        filename = "__base__/graphics/entity/boiler/boiler-left.png",
        priority = "extra-high",
        width = 51,
        height = 51,
        shift = {0.15, 0}
      },
      down =
      {
        filename = "__base__/graphics/entity/boiler/boiler-down.png",
        priority = "extra-high",
        width = 51,
        height = 51,
        shift = {0.05, 0}
      },
      left_down =
      {
        filename = "__base__/graphics/entity/boiler/boiler-left-down.png",
        priority = "extra-high",
        width = 51,
        height = 51,
        shift = {0, -0.02}
      },
      right_down =
      {
        filename = "__base__/graphics/entity/boiler/boiler-right-down.png",
        priority = "extra-high",
        width = 51,
        height = 51
      },
      left_up =
      {
        filename = "__base__/graphics/entity/boiler/boiler-left-up.png",
        priority = "extra-high",
        width = 51,
        height = 51,
        shift = {0.05, 0}
      },
      right_up =
      {
        filename = "__base__/graphics/entity/boiler/boiler-right-up.png",
        priority = "extra-high",
        width = 51,
        height = 51,
        shift = {0.15, 0}
      },
      t_down =
      {
        filename = "__base__/graphics/entity/boiler/boiler-t-down.png",
        priority = "extra-high",
        width = 51,
        height = 51,
        shift = {0, 0}
      },
      t_up =
      {
        filename = "__base__/graphics/entity/boiler/boiler-t-up.png",
        priority = "extra-high",
        width = 51,
        height = 51,
        shift = {0, 0}
      }
    },
    fire =
    {
      left =
      {
        filename = "__base__/graphics/entity/boiler/boiler-fire-down.png",
        priority = "extra-high",
        frame_width = 16,
        frame_height = 14,
        frame_count = 12,
        shift = {0, 0.23}
      },
      down =
      {
        filename = "__base__/graphics/entity/boiler/boiler-fire-left.png",
        priority = "extra-high",
        frame_width = 12,
        frame_height = 13,
        frame_count = 12,
        shift = {-0.42, 0.05}
      },
      left_down =
      {
        filename = "__base__/graphics/entity/boiler/boiler-fire-right.png",
        priority = "extra-high",
        frame_width = 10,
        frame_height = 14,
        frame_count = 12,
        shift = {0.25, -0.05}
      },
      right_down =
      {
        filename = "__base__/graphics/entity/boiler/boiler-fire-left.png",
        priority = "extra-high",
        frame_width = 12,
        frame_height = 13,
        frame_count = 12,
        shift = {-0.4, 0.15}
      },
      left_up =
      {
        filename = "__base__/graphics/entity/boiler/boiler-fire-down.png",
        priority = "extra-high",
        frame_width = 16,
        frame_height = 14,
        frame_count = 12,
        shift = {0, 0.23}
      },
      right_up =
      {
        filename = "__base__/graphics/entity/boiler/boiler-fire-down.png",
        priority = "extra-high",
        frame_width = 16,
        frame_height = 14,
        frame_count = 12,
        shift = {0, 0.23}
      },
      t_up =
      {
        filename = "__base__/graphics/entity/boiler/boiler-fire-down.png",
        priority = "extra-high",
        frame_width = 16,
        frame_height = 14,
        frame_count = 12,
        shift = {0, 0.23}
      }
    },
    burning_cooldown = 20,
    -- these are the pipe pictures - boiler is a pipe as well
    pictures = pipepictures()
  },
  {
    type = "container",
    name = "wooden-chest",
    icon = "__base__/graphics/icons/wooden-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "wooden-chest"},
    max_health = 20,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    fast_replaceable_group = "container",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    inventory_size = 16,
    picture =
    {
      filename = "__base__/graphics/entity/wooden-chest/wooden-chest.png",
      priority = "extra-high",
      width = 46,
      height = 33,
      shift = {0.3, 0}
    }
  },
  {
    type = "corpse",
    name = "creeper-corpse",
    animation =
    {
      filename = "__base__/graphics/entity/creeper-corpse/creeper-corpse.png",
      frame_width = 87,
      frame_height = 96,
      frame_count = 15,
      direction_count = 9,
      shift = {0.140625, -0.734375}
    },
  },
  {
    type = "electric-pole",
    name = "small-electric-pole",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "small-electric-pole"},
    max_health = 35,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    drawing_box = {{-0.5, -2.3}, {0.5, 0.5}},
    maximum_wire_distance = 7.5,
    supply_area_distance = 2.5,
    pictures =
    {
      filename = "__base__/graphics/entity/small-electric-pole/small-electric-pole.png",
      priority = "extra-high",
      frame_width = 123,
      frame_height = 124,
      axially_symetric = false,
      direction_count = 4,
      shift = {1.4, -1.1}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {2.7, 0},
          green = {2.3, 0},
          red = {3.1, 0}
        },
        wire =
        {
          copper = {0, -2.7},
          green = {-0.4,-2.7},
          red = {0.4,-2.7}
        }
      },
      {
        shadow =
        {
          copper = {2.7, -0.05},
          green = {2.2, -0.35},
          red = {3, 0.3}
        },
        wire =
        {
          copper = {0, -2.7},
          green = {-0.3, -2.9},
          red = {0.2, -2.6}
        }
      },
      {
        shadow =
        {
          copper = {2.7, 0.06},
          green = {2.55, -0.3},
          red = {2.5, 0.55}
        },
        wire =
        {
          copper = {0, -2.7},
          green = {0, -2.95},
          red = {0, -2.5}
        }
      },
      {
        shadow =
        {
          copper = {2.55, 0.2},
          green = {2.85, -0.15},
          red = {2, 0.45}
        },
        wire =
        {
          copper = {0, -2.7},
          green = {0.3, -2.9},
          red = {-0.3, -2.5}
        }
      }
    },
    copper_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/copper-wire.png",
      width = 224,
      height = 46
    },
    green_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/green-wire.png",
      width = 224,
      height = 46
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12
    },
    red_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/red-wire.png",
      width = 224,
      height = 46
    },
    wire_shadow_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/wire-shadow.png",
      width = 224,
      height = 46
    }
  },
  {
    type = "unit",
    name = "creeper",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid"},
    max_health = 15,
    collision_box = {{-0.2, -0.4}, {0.2, 0}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    damage = 6,
    attack_cooldown = 0.35,
    movement_speed = 0.15,
    distance_per_frame = 0.1,
    regenerate_rate = 0.01,
    attack_animation =
    {
      filename = "__base__/graphics/entity/creeper/creeper-attack.png",
      priority = "high",
      frame_width = 63,
      frame_height = 96,
      frame_count = 15,
      direction_count = 9,
      shift = {0.421875, -0.53125}
    },
    corpse = "creeper-corpse",
    dying_sound =
    {
      {
        filename = "__base__/sound/creeper-death-1.wav",
        volume = 0.7
      },
      {
        filename = "__base__/sound/creeper-death-2.wav",
        volume = 0.7
      },
      {
        filename = "__base__/sound/creeper-death-3.wav",
        volume = 0.7
      },
      {
        filename = "__base__/sound/creeper-death-4.wav",
        volume = 0.7
      }
    },
    run_animation =
    {
      filename = "__base__/graphics/entity/creeper/creeper-run.png",
      priority = "high",
      frame_width = 48,
      frame_height = 68,
      frame_count = 30,
      direction_count = 9,
      shift = {0, -0.75}
    }
  },
  {
    type = "unit-spawner",
    name = "creeper-spawner",
    icon = "__base__/graphics/icons/creeper-spawner.png",
    flags = {"placeable-player", "placeable-enemy"},
    minable = {mining_time = 1, result = "creeper-spawner"},
    max_health = 150,
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    count_of_units_around = 7,
    dying_explosion = "huge-explosion",
    loot =
    {
      {
        count_max = 10,
        count_min = 2,
        item = "alien-artifact",
        probability = 1
      }
    },
    maximum_count_of_owned_units = 15,
    picture = {
      filename = "__base__/graphics/entity/creeper-spawner/creeper-spawner.png",
      priority = "high",
      width = 87,
      height = 101
    },
    result_unit = "creeper",
    spawning_cooldown = 180,
    spawning_radius = 10,
    spawning_spacing = 3
  },
  {
    type = "explosion",
    name = "explosion",
    animation_speed = 3,
    animations =
    {
      {
        filename = "__base__/graphics/entity/explosion/explosion-1.png",
        priority = "extra-high",
        frame_width = 64,
        frame_height = 59,
        frame_count = 16
      },
      {
        filename = "__base__/graphics/entity/explosion/explosion-2.png",
        priority = "extra-high",
        frame_width = 64,
        frame_height = 57,
        frame_count = 16
      },
      {
        filename = "__base__/graphics/entity/explosion/explosion-3.png",
        priority = "extra-high",
        frame_width = 64,
        frame_height = 49,
        frame_count = 16
      },
      {
        filename = "__base__/graphics/entity/explosion/explosion-4.png",
        priority = "extra-high",
        frame_width = 64,
        frame_height = 51,
        frame_count = 16
      }
    },
    light = {intensity = 1, size = 20},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound =
    {
      {
        filename = "__base__/sound/explosion1.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/explosion2.wav",
        volume = 0.8
      }
    }
  },
  {
    type = "explosion",
    name = "explosion-gunshot",
    animation_speed = 3,
    animations =
    {
      {
        filename = "__base__/graphics/entity/explosion-gunshot/explosion-gunshot.png",
        priority = "extra-high",
        frame_width = 30,
        frame_height = 30,
        frame_count = 5
      }
    },
    light = {intensity = 1, size = 10},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1
  },
  {
    type = "explosion",
    name = "huge-explosion",
    animation_speed = 5,
    animations =
    {
      {
        filename = "__base__/graphics/entity/huge-explosion/huge-explosion.png",
        priority = "extra-high",
        frame_width = 111,
        frame_height = 131,
        frame_count = 24,
        line_length = 5
      }
    },
    light = {intensity = 1, size = 50},
    smoke = "smoke",
    smoke_count = 20,
    smoke_slow_down_factor = 1,
    sound =
    {
      {
        filename = "__base__/sound/huge-explosion.wav",
        volume = 1.25
      }
    }
  },
  {
    type = "generator",
    name = "steam-engine",
    icon = "__base__/graphics/icons/steam-engine.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "steam-engine"},
    max_health = 150,
    collision_box = {{-1.4, -2.4}, {1.4, 2.4}},
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    energy_source =
    {
      type = "electric",
      output_priority = "secondary"
    },
    horizontal_animation =
    {
      filename = "__base__/graphics/entity/steam-engine/steam-engine-horizontal.png",
      priority = "high",
      frame_width = 219,
      frame_height = 150,
      frame_count = 32,
      line_length = 8,
      shift = {1.1, -0.3}
    },
    vertical_animation =
    {
      filename = "__base__/graphics/entity/steam-engine/steam-engine-vertical.png",
      priority = "high",
      frame_width = 180,
      frame_height = 222,
      frame_count = 32,
      line_length = 8,
      shift = {1.2, 1}
    },
    pipes_horizontal =
    {
      filename = "__base__/graphics/entity/steam-engine/pipes-horizontal.png",
      priority = "high",
      width = 160,
      height = 32,
      shift = {0, 0}
    },
    pipes_vertical =
    {
      filename = "__base__/graphics/entity/steam-engine/pipes-vertical.png",
      priority = "high",
      width = 36,
      height = 160,
      shift = {0.1, 0}
    },
    smoke =
    {
      {
        name = "smoke",
        north_position = {0, -2.2},
        east_position = {-1.1, -2.6},
        deviation = {0.2, 0.2},
        frequency = 1,
        offset = 0.33
      },
      {
        name = "smoke",
        north_position = {0, -1.1},
        east_position = {0, -2.6},
        deviation = {0.2, 0.2},
        frequency = 1,
        offset = 0.66
      },
      {
        name = "smoke",
        north_position = {0, 0},
        east_position = {1.1, -2.6},
        deviation = {0.2, 0.2},
        frequency = 1,
        offset = 0.99
      }
    }
  },
  {
    type = "pump",
    name = "pump",
    icon = "__base__/graphics/icons/pump.png",
    flags = {"placeable-neutral", "player-creation", "filter-directions"},
    minable = {mining_time = 1, result = "pump"},
    max_health = 20,
    collision_box = {{-0.6, -0.3}, {0.6, 0.3}},
    selection_box = {{-1, -0.49}, {1, 1.49}},
    tile_width = 1,
    picture =
    {
      sheet = "__base__/graphics/entity/pump/pump.png",
      priority = "extra-high",
      shift = {0.9, 0.05},
      width = 160,
      height = 102
    }
  },
  {
    type = "smoke",
    name = "smoke",
    animation = {
      filename = "__base__/graphics/entity/smoke/smoke.png",
      priority = "extra-high",
      frame_width = 88,
      frame_height = 78,
      frame_count = 39,
      animation_speed = 12,
      line_length = 7
    }
  },
  {
    type = "smoke",
    name = "smoke-fast",
    animation = {
      filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
      priority = "extra-high",
      frame_width = 50,
      frame_height = 50,
      frame_count = 16,
      animation_speed = 1
    }
  },
  {
    type = "inserter",
    name = "basic-inserter",
    icon = "__base__/graphics/icons/basic-inserter.png",
    flags = {
      "placeable-neutral",
      "player-creation"
    },
    minable = {hardness = 0.2, mining_time = 0.5, result = "basic-inserter"},
    max_health = 10,
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    energy_per_movement = 5,
    energy_per_rotation = 5,
    energy_source =
    {
      type = "electric",
      input_priority = "secondary"
    },
    extension_speed = 0.028,
    fast_replaceable_group = "inserter",
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/basic-inserter/basic-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/basic-inserter/basic-inserter-hand-closed.png",
      priority = "extra-high",
      width = 13,
      height = 41
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/basic-inserter/basic-inserter-hand-open.png",
      priority = "extra-high",
      width = 13,
      height = 41
    },
    insert_distance = 0.85,
    pickup_distance = 1,
    platform_picture =
    {
      priority = "extra-high",
      width = 46,
      height = 46,
      sheet = "__base__/graphics/entity/basic-inserter/basic-inserter-platform.png"
    },
    rotation_speed = 0.014
  },
  {
    type = "inserter",
    name = "burner-inserter",
    icon = "__base__/graphics/icons/burner-inserter.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "burner-inserter"},
    max_health = 10,
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    energy_per_movement = 100,
    energy_per_rotation = 100,
    energy_source =
    {
      type = "burner",
      effectivity = 1,
      fuel_inventory_size = 1,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 0.3
        }
      }
    },
    extension_speed = 0.02,
    fast_replaceable_group = "inserter",
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed.png",
      priority = "extra-high",
      width = 13,
      height = 41
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open.png",
      priority = "extra-high",
      width = 13,
      height = 41
    },
    insert_distance = 0.85,
    pickup_distance = 1,
    platform_picture =
    {
      priority = "extra-high",
      width = 46,
      height = 46,
      sheet = "__base__/graphics/entity/burner-inserter/burner-inserter-platform.png"
    },
    rotation_speed = 0.01
  },
  {
    type = "item-entity",
    name = "item-on-ground",
    flags = {"placeable-off-grid"},
    collision_box = {{-0.14, -0.14}, {0.14, 0.14}},
    selection_box = {{-0.17, -0.17}, {0.17, 0.17}}
  },
  {
    type = "pipe",
    name = "pipe",
    icon = "__base__/graphics/icons/pipe.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "pipe"},
    max_health = 10,
    fast_replaceable_group = "pipe",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    max_liquid_amount = 10,
    pictures = pipepictures()
  },
  {
    type = "radar",
    name = "radar",
    icon = "__base__/graphics/icons/radar.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "radar"},
    max_health = 60,
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    energy_per_sector = 20000,
    energy_source =
    {
      type = "electric",
      input_priority = "secondary"
    },
    energy_usage_per_tick = 10,
    pictures =
    {
      filename = "__base__/graphics/entity/radar/radar.png",
      priority = "low",
      frame_width = 169,
      frame_height = 140,
      axially_symmetrical = false,
      direction_count = 64,
      line_length = 8,
      shift = {1.15, 0.75}
    }
  },
  {
    type = "lamp",
    name = "small-lamp",
    icon = "__base__/graphics/icons/small-lamp.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "small-lamp"},
    max_health = 35,
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    energy_source =
    {
      type = "electric",
      input_priority = "secondary"
    },
    energy_usage_per_tick = 0.2,
    light = {intensity = 0.9, size = 40},
    picture_off =
    {
      filename = "__base__/graphics/entity/small-lamp/small-lamp.png",
      width = 83,
      height = 75,
      shift = {0, -0.1}
    },
    picture_on =
    {
      filename = "__base__/graphics/entity/small-lamp/small-lamp.png",
      width = 83,
      height = 75,
      x = 83,
      shift = {0, -0.1}
    }
  },
  {
    type = "container",
    name = "space-module-wreck",
    icon = "__base__/graphics/icons/space-module-wreck.png",
    flags = {"placeable-neutral", "player-creation"},
    max_health = 20,
    collision_box = {{-2.2, -1}, {2.2, 1}},
    selection_box = {{-2.7, -1.5}, {2.7, 1.5}},
    inventory_size = 4,
    picture =
    {
      filename = "__base__/graphics/entity/space-module-wreck/wreck.png",
      width = 168,
      height = 96
    }
  },
  {
    type = "arrow",
    name = "red-arrow",
    flags = {"placeable-off-grid"},
    arrow_picture =
    {
      filename = "__core__/graphics/red-arrow/red-arrow-arrow.png",
      width = "1030",
      height = "230"
    }
  },
  {
    type = "arrow",
    name = "red-arrow-with-circle",
    flags = {"placeable-off-grid"},
    arrow_picture =
    {
      filename = "__core__/graphics/red-arrow/red-arrow-arrow.png",
      width = "1030",
      height = "230"
    },
    circle_picture =
    {
      filename = "__core__/graphics/red-arrow/red-arrow-circle.png",
      width = "200",
      height = "200"
    }
  },
  {
    type = "pipe-to-ground",
    name = "pipe-to-ground",
    icon = "__base__/graphics/icons/pipe-to-ground.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "pipe-to-ground"},
    max_health = 50,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    max_liquid_amount = 10,
    pictures =
    {
      up =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-up.png",
        priority = "high",
        width = 32,
        height = 32
      },
      down =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-down.png",
        priority = "high",
        width = 32,
        height = 32
      },
      left =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-left.png",
        priority = "high",
        width = 34,
        height = 38,
        shift = {0, 0.1}
      },
      right =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-right.png",
        priority = "high",
        width = 34,
        height = 38,
        shift = {0.1, 0.1}
      },
    }
  },
  {
    type = "assembling-machine",
    name = "assembling-machine-1",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "assembling-machine-1"},
    max_health = 100,
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    animation =
    {
      filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
      priority = "medium",
      frame_width = 141,
      frame_height = 120,
      frame_count = 32,
      line_length = 6,
      shift = {0.7, 0.12}
    },
    crafting_categories = {"crafting"},
    effectivity = 1.5,
    energy_source =
    {
      type = "electric",
      input_priority = "secondary"
    },
    energy_usage_per_tick = 1.5,
    ingredient_count = 2
  },
  {
    type = "flying-text",
    name = "flying-text",
    flags = {},
    time_to_live = 150,
    speed = 0.05
  }
}
)

require ("prototypes.entity.demo-railpictures")
require ("prototypes.entity.demo-pipecovers")
require ("prototypes.entity.demo-transport-belt-pictures")
require ("prototypes.entity.demo-player-animations")

function make_unit_melee_ammo_type(damagevalue)
  return
  {
    category = "melee",
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = damagevalue , type = "physical"}
        }
      }
    }
  }
end

boilerfires =
{
  down =
  {
    filename = "__base__/graphics/entity/boiler/boiler-fire-down.png",
    priority = "extra-high",
    width = 11,
    height = 11,
    frame_count = 32,
    line_length = 8,
    shift = {0.03125, 0.28125}
  },
  left =
  {
    filename = "__base__/graphics/entity/boiler/boiler-fire-left.png",
    priority = "extra-high",
    width = 5,
    height = 7,
    frame_count = 14,
    shift = {-0.4375, -0.09375}
  },
  right =
  {
    filename = "__base__/graphics/entity/boiler/boiler-fire-right.png",
    priority = "extra-high",
    width = 6,
    height = 9,
    frame_count = 14,
    shift = {0.46875, -0.0625}
  }
}

pipepictures = function()
  return {
    straight_vertical_single =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-single.png",
      priority = "extra-high",
      width = 44,
      height = 58
    },
    straight_vertical =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
      priority = "extra-high",
      width = 44,
      height = 42
    },
    straight_vertical_window =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-window.png",
      priority = "extra-high",
      width = 44,
      height = 32
    },
    straight_horizontal_window =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal-window.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    straight_horizontal =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    corner_up_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-up-right.png",
      priority = "extra-high",
      width = 32,
      height = 40
    },
    corner_up_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-up-left.png",
      priority = "extra-high",
      width = 44,
      height = 44
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
      width = 36,
      height = 32
    },
    t_up =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-up.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    t_down =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-down.png",
      priority = "extra-high",
      width = 40,
      height = 44
    },
    t_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-right.png",
      priority = "extra-high",
      width = 40,
      height = 32
    },
    t_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-left.png",
      priority = "extra-high",
      width = 44,
      height = 42
    },
    cross =
    {
      filename = "__base__/graphics/entity/pipe/pipe-cross.png",
      priority = "extra-high",
      width = 40,
      height = 40
    },
    ending_up =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-up.png",
      priority = "extra-high",
      width = 44,
      height = 42
      },
    ending_down =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-down.png",
      priority = "extra-high",
      width = 44,
      height = 32
    },
    ending_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-right.png",
      priority = "extra-high",
      width = 32,
      height = 44
    },
    ending_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-left.png",
      priority = "extra-high",
      width = 58,
      height = 44
    },
    horizontal_window_background =
    {
      filename = "__base__/graphics/entity/pipe/pipe-horizontal-window-background.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    vertical_window_background =
    {
      filename = "__base__/graphics/entity/pipe/pipe-vertical-window-background.png",
      priority = "extra-high",
      width = 44,
      height = 32
    },
    fluid_background =
    {
      filename = "__base__/graphics/entity/pipe/fluid-background.png",
      priority = "extra-high",
      width = 32,
      height = 20
    },
    low_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    middle_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-medium-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    high_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-high-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    }
  }
end

function smoke(opts)
  return {
    type = "smoke",
    name = opts.name,
    flags = {"not-on-map"},
    duration = opts.duration or 600,
    fade_away_duration = opts.fade_away_duration or 600,
    spread_duration = opts.spread_duration or 600,
    start_scale = opts.start_scale or 0.20,
    end_scale = opts.end_scale or 1.0,
    color = opts.color,
    cyclic = true,
    affected_by_wind = opts.affected_by_wind or true,
    animation =
    {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png"
    }
  }
end


data:extend(
{
  {
    type = "player",
    name = "player",
    icon = "__base__/graphics/icons/player.png",
    flags = {"pushable", "placeable-off-grid", "breaths-air", "not-repairable", "not-on-map"},
    max_health = 100,
    healing_per_tick = 0.01,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.4, -1.4}, {0.4, 0.2}},
    crafting_categories = {"crafting"},
    mining_categories = {"basic-solid"},
    inventory_size = 60,
    build_distance = 6,
    drop_item_distance = 6,
    reach_distance = 6,
    reach_resource_distance = 2.7,
    ticks_to_keep_gun = 600,
    ticks_to_keep_aiming_direction = 100,
    damage_hit_tint = {r = 1, g = 0, b = 0, a = 0},
    running_speed = 0.15,
    distance_per_frame = 0.13,
    maximum_corner_sliding_distance = 0.7,
    subgroup = "creatures",
    order="a",
    eat =
    {
      {
        filename = "__base__/sound/eat.ogg",
        volume = 1
      }
    },
    heartbeat =
    {
      {
        filename = "__base__/sound/heartbeat.ogg"
      }
    },

    animations =
    {
      {
        idle =
        {
          layers =
          {
            playeranimations.level1.idle,
            playeranimations.level1.idlemask,
          }
        },
        idle_with_gun =
        {
          layers =
          {
            playeranimations.level1.idlewithgun,
            playeranimations.level1.idlewithgunmask,
          }
        },
        mining_with_hands =
        {
          layers =
          {
            playeranimations.level1.miningwithhands,
            playeranimations.level1.miningwithhandsmask,
          }
        },
        mining_with_tool =
        {
          layers =
          {
            playeranimations.level1.miningwithtool,
            playeranimations.level1.miningwithtoolmask,
          }
        },
        running_with_gun =
        {
          layers =
          {
            playeranimations.level1.runningwithgun,
            playeranimations.level1.runningwithgunmask,
          }
        },
        running =
        {
          layers =
          {
            playeranimations.level1.running,
            playeranimations.level1.runningmask,
          }
        }
      },
      {
        -- heavy-armor is not in the demo
        armors = data.is_demo and {"basic-armor"} or {"basic-armor", "heavy-armor"},
        idle =
        {
          layers =
          {
            playeranimations.level1.idle,
            playeranimations.level1.idlemask,
            playeranimations.level2addon.idle,
            playeranimations.level2addon.idlemask
          }
        },
        idle_with_gun =
        {
          layers =
          {
            playeranimations.level1.idlewithgun,
            playeranimations.level1.idlewithgunmask,
            playeranimations.level2addon.idlewithgun,
            playeranimations.level2addon.idlewithgunmask,
          }
        },
        mining_with_hands =
        {
          layers =
          {
            playeranimations.level1.miningwithhands,
            playeranimations.level1.miningwithhandsmask,
            playeranimations.level2addon.miningwithhands,
            playeranimations.level2addon.miningwithhandsmask,
          }
        },
        mining_with_tool =
        {
          layers =
          {
            playeranimations.level1.miningwithtool,
            playeranimations.level1.miningwithtoolmask,
            playeranimations.level2addon.miningwithtool,
            playeranimations.level2addon.miningwithtoolmask,
          }
        },
        running_with_gun =
        {
          layers =
          {
            playeranimations.level1.runningwithgun,
            playeranimations.level1.runningwithgunmask,
            playeranimations.level2addon.runningwithgun,
            playeranimations.level2addon.runningwithgunmask,
          }
        },
        running =
        {
          layers =
          {
            playeranimations.level1.running,
            playeranimations.level1.runningmask,
            playeranimations.level2addon.running,
            playeranimations.level2addon.runningmask,
          }
        }
      },
      {
        -- modular armors are not in the demo
        armors = data.is_demo and {} or {"basic-modular-armor", "power-armor", "power-armor-mk2"},
        idle =
        {
          layers =
          {
            playeranimations.level1.idle,
            playeranimations.level1.idlemask,
            playeranimations.level3addon.idle,
            playeranimations.level3addon.idlemask
          }
        },
        idle_with_gun =
        {
          layers =
          {
            playeranimations.level1.idlewithgun,
            playeranimations.level1.idlewithgunmask,
            playeranimations.level3addon.idlewithgun,
            playeranimations.level3addon.idlewithgunmask,
          }
        },
        mining_with_hands =
        {
          layers =
          {
            playeranimations.level1.miningwithhands,
            playeranimations.level1.miningwithhandsmask,
            playeranimations.level3addon.miningwithhands,
            playeranimations.level3addon.miningwithhandsmask,
          }
        },
        mining_with_tool =
        {
          layers =
          {
            playeranimations.level1.miningwithtool,
            playeranimations.level1.miningwithtoolmask,
            playeranimations.level3addon.miningwithtool,
            playeranimations.level3addon.miningwithtoolmask,
          }
        },
        running_with_gun =
        {
          layers =
          {
            playeranimations.level1.runningwithgun,
            playeranimations.level1.runningwithgunmask,
            playeranimations.level3addon.runningwithgun,
            playeranimations.level3addon.runningwithgunmask,
          }
        },
        running =
        {
          layers =
          {
            playeranimations.level1.running,
            playeranimations.level1.runningmask,
            playeranimations.level3addon.running,
            playeranimations.level3addon.runningmask,
          }
        }
      }
    },
    light =
    {
      {
        minimum_darkness = 0.3,
        intensity = 0.4,
        size = 25,
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "medium",
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0, -13},
        size = 2,
        intensity = 0.6
      },
    },
    mining_speed = 0.01,
    mining_with_hands_particles_animation_positions = {29, 63},
    mining_with_tool_particles_animation_positions = {28},
    running_sound_animation_positions = {5, 16}
  },

  {
    type = "furnace",
    name = "stone-furnace",
    icon = "__base__/graphics/icons/stone-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "stone-furnace"},
    max_health = 150,
    corpse = "medium-remnants",
    repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
    working_sound =
    {
      sound = { filename = "__base__/sound/furnace.ogg", }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "explosion",
        percent = 30
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    energy_usage = "180kW",
    crafting_speed = 1,
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions = 0.01,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 5,
          position = {0.0, -0.8},
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/stone-furnace/stone-furnace.png",
      priority = "extra-high",
      width = 81,
      height = 64,
      frame_count = 1,
      shift = {0.5, 0.05 }
    },
    working_visualisations =
    {
      {
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        south_position = {0.0, 0.0},
        west_position = {0.0, 0.0},
        animation =
        {
          filename = "__base__/graphics/entity/stone-furnace/stone-furnace-fire.png",
          priority = "extra-high",
          width = 23,
          height = 27,
          frame_count = 12,
          shift = { 0.078125, 0.5234375}
        },
        light = {intensity = 1, size = 1}
      }
    },
    fast_replaceable_group = "furnace"
  },

  {
    type = "transport-belt",
    name = "basic-transport-belt",
    icon = "__base__/graphics/icons/basic-transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = "basic-transport-belt"},
    max_health = 50,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/basic-transport-belt.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 3
    },
    animation_speed_coefficient = 32,
    animations =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      width = 40,
      height = 40,
      frame_count = 16,
      direction_count = 12
    },
    belt_horizontal = basic_belt_horizontal,
    belt_vertical = basic_belt_vertical,
    ending_top = basic_belt_ending_top,
    ending_bottom = basic_belt_ending_bottom,
    ending_side = basic_belt_ending_side,
    starting_top = basic_belt_starting_top,
    starting_bottom = basic_belt_starting_bottom,
    starting_side = basic_belt_starting_side,
    ending_patch = ending_patch_prototype,
    fast_replaceable_group = "transport-belt",
    speed = 0.03125
  },

  {
    type = "fish",
    name = "fish",
    icon = "__base__/graphics/icons/fish.png",
    flags = {"placeable-neutral", "not-on-map"},
    minable = {mining_time = 1, result = "raw-fish"},
    max_health = 20,
    subgroup = "creatures",
    order = "b-a",
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
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "boiler"},
    max_health = 100,
    corpse = "small-remnants",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    fast_replaceable_group = "pipe",
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {0, -1} },
        { position = {1, 0} },
        { position = {0, 1} },
        { position = {-1, 0} }
      },
    },
    energy_consumption = "390kW",
    burner =
    {
      effectivity = 0.5,
      fuel_inventory_size = 1,
      emissions = 0.1 / 6.5,
      smoke =
      {
        {
          name = "smoke",
          position = {0.0, -0.8},
          frequency = 5,
          starting_vertical_speed = 0.0,
          starting_frame_deviation = 60
        }
      }
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/boiler.ogg",
        volume = 0.8
      },
      max_sounds_per_type = 3
    },
    structure =
    {
      left =
      {
        filename = "__base__/graphics/entity/boiler/boiler-left.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.03125, 0}
      },
      down =
      {
        filename = "__base__/graphics/entity/boiler/boiler-down.png",
        priority = "extra-high",
        width = 66,
        height = 72 --, shift = {0.05, 0}
      },
      left_down =
      {
        filename = "__base__/graphics/entity/boiler/boiler-left-down.png",
        priority = "extra-high",
        width = 60,
        height = 50 --, shift = {0, -0.02}
      },
      right_down =
      {
        filename = "__base__/graphics/entity/boiler/boiler-right-down.png",
        priority = "extra-high",
        width = 44,
        height = 50
      },
      left_up =
      {
        filename = "__base__/graphics/entity/boiler/boiler-left-up.png",
        priority = "extra-high",
        width = 66,
        height = 74 --, shift = {0.05, 0}
      },
      right_up =
      {
        filename = "__base__/graphics/entity/boiler/boiler-right-up.png",
        priority = "extra-high",
        width = 46,
        height = 72 --, shift = {0.15, 0}
      },
      t_down =
      {
        filename = "__base__/graphics/entity/boiler/boiler-t-down.png",
        priority = "extra-high",
        width = 44,
        height = 50 --, shift = {0, 0}
      },
      t_up =
      {
        filename = "__base__/graphics/entity/boiler/boiler-t-up.png",
        priority = "extra-high",
        width = 46,
        height = 70 --, shift = {0, 0}
      }
    },
    fire =
    {
      left = boilerfires.down,
      down = boilerfires.left,
      left_down = boilerfires.right,
      right_down = boilerfires.left,
      left_up = boilerfires.down,
      right_up = boilerfires.down,
      t_up = boilerfires.down
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
    max_health = 50,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    fast_replaceable_group = "container",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    inventory_size = 16,
    open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" },
    close_sound = { filename = "__base__/sound/wooden-chest-close.ogg" },
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
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
    type = "electric-pole",
    name = "small-electric-pole",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "small-electric-pole"},
    max_health = 35,
    corpse = "small-remnants",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    drawing_box = {{-0.5, -2.6}, {0.5, 0.5}},
    maximum_wire_distance = 7.5,
    supply_area_distance = 2.5,
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    pictures =
    {
      filename = "__base__/graphics/entity/small-electric-pole/small-electric-pole.png",
      priority = "extra-high",
      width = 123,
      height = 124,
      direction_count = 4,
      shift = {1.4, -1.1}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {2.7, 0},
          red = {2.3, 0},
          green = {3.1, 0}
        },
        wire =
        {
          copper = {0, -2.7},
          red = {-0.4,-2.7},
          green = {0.4,-2.7}
        }
      },
      {
        shadow =
        {
          copper = {2.7, -0.05},
          red = {2.2, -0.35},
          green = {3, 0.12}
        },
        wire =
        {
          copper = {-0.04, -2.8},
          red = {-0.3, -2.9},
          green = {0.2, -2.6}
        }
      },
      {
        shadow =
        {
          copper = {2.5, -0.1},
          red = {2.55, -0.45},
          green = {2.5, 0.25}
        },
        wire =
        {
          copper = {-0.2, -2.7},
          red = {-0.05, -2.95},
          green = {0, -2.4}
        }
      },
      {
        shadow =
        {
          copper = {2.30, -0.1},
          red = {2.65, -0.40},
          green = {1.75, 0.20}
        },
        wire =
        {
          copper = {0, -2.7},
          red = {0.3, -2.85},
          green = {-0.3, -2.5}
        }
      }
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    }
  },

  {
    type = "explosion",
    name = "explosion",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/explosion/explosion-1.png",
        priority = "extra-high",
        width = 64,
        height = 59,
        frame_count = 16,
        animation_speed = 0.5
      },
      {
        filename = "__base__/graphics/entity/explosion/explosion-2.png",
        priority = "extra-high",
        width = 64,
        height = 57,
        frame_count = 16,
        animation_speed = 0.5
      },
      {
        filename = "__base__/graphics/entity/explosion/explosion-3.png",
        priority = "extra-high",
        width = 64,
        height = 49,
        frame_count = 16,
        animation_speed = 0.5
      },
      {
        filename = "__base__/graphics/entity/explosion/explosion-4.png",
        priority = "extra-high",
        width = 64,
        height = 51,
        frame_count = 16,
        animation_speed = 0.5
      }
    },
    light = {intensity = 1, size = 20},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound =
    {
      {
        filename = "__base__/sound/fight/small-explosion-1.ogg",
        volume = 0.75
      },
      {
        filename = "__base__/sound/fight/small-explosion-2.ogg",
        volume = 0.75
      }
    }
  },

  {
    type = "explosion",
    name = "explosion-gunshot",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/explosion-gunshot/explosion-gunshot.png",
        priority = "extra-high",
        width = 34,
        height = 38,
        frame_count = 13,
        animation_speed = 1.5,
        shift = {0, 0}
      }
    },
    rotate = true,
    light = {intensity = 1, size = 10},
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },
  {
    type = "explosion",
    name = "explosion-gunshot-small",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/explosion-hit/explosion-hit.png",
        priority = "extra-high",
        width = 34,
        height = 38,
        frame_count = 13,
        animation_speed = 1.5,
        shift = {0, 0}
      }
    },
    rotate = true,
    light = {intensity = 1, size = 10},
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },
  {
    type = "explosion",
    name = "explosion-hit",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/explosion-hit/explosion-hit.png",
        priority = "extra-high",
        width = 34,
        height = 38,
        frame_count = 13,
        animation_speed = 1.5,
        shift = {0, -0.3125}
      }
    },
    light = {intensity = 1, size = 10},
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },
  {
    type = "explosion",
    name = "big-explosion",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/big-explosion/big-explosion.png",
        priority = "extra-high",
        width = 197,
        height = 245,
        frame_count = 47,
        line_length = 6,
        axially_symmetrical = false,
        direction_count = 1,
        shift = {0.1875, -0.75},
        animation_speed = 0.5
      }
    },
    light = {intensity = 1, size = 50},
    sound =
    {
      {
        filename = "__base__/sound/fight/large-explosion-1.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/fight/large-explosion-2.ogg",
        volume = 1.0
      }
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
            type = "create-particle",
            repeat_count = 20,
            entity_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "medium-explosion",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/medium-explosion/medium-explosion.png",
        priority = "extra-high",
        width = 112,
        height = 94,
        frame_count = 54,
        line_length = 6,
        shift = {-0.56, -0.96},
        animation_speed = 0.5
      }
    },
    light = {intensity = 1, size = 50},
    sound =
    {
      {
        filename = "__base__/sound/fight/large-explosion-1.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/fight/large-explosion-2.ogg",
        volume = 0.8
      }
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
            type = "create-particle",
            repeat_count = 20,
            entity_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "massive-explosion",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/medium-explosion/medium-explosion.png",
        priority = "extra-high",
        width = 112,
        height = 94,
        scale = 0.8,
        frame_count = 54,
        line_length = 6,
        shift = {-0.56, -0.96},
        animation_speed = 0.5
      }
    },
    light = {intensity = 1, size = 50},
    sound =
    {
      {
        filename = "__base__/sound/fight/large-explosion-1.ogg",
        volume = 1.25
      },
      {
        filename = "__base__/sound/fight/large-explosion-2.ogg",
        volume = 1.25
      }
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
            type = "create-particle",
            repeat_count = 60,
            entity_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "blood-explosion-small",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__core__/graphics/empty.png",
        priority = "extra-high",
        width = 1,
        height = 1,
        frame_count = 1
      }
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "create-entity",
          entity_name = "blood-fountain",
          repeat_count = 20,
          offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}}
        }
      }
    }
  },
  {
    type = "explosion",
    name = "blood-explosion-big",
    flags = {"not-on-map"},
     animations =
    {
      {
        filename = "__core__/graphics/empty.png",
        priority = "extra-high",
        width = 1,
        height = 1,
        frame_count = 1
      }
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
            type = "create-particle",
            repeat_count = 150,
            entity_name = "blood-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.05,
            initial_vertical_speed = -0.01,
            initial_vertical_speed_deviation = 0.02,
            offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}}
          },
          {
            type = "create-entity",
            entity_name = "blood-fountain",
            repeat_count = 35,
            offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}}
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "blood-explosion-huge",
    flags = {"not-on-map"},
     animations =
    {
      {
        filename = "__core__/graphics/empty.png",
        priority = "extra-high",
        width = 1,
        height = 1,
        frame_count = 1
      }
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
            type = "create-particle",
            repeat_count = 150,
            entity_name = "blood-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.05,
            initial_vertical_speed = -0.01,
            initial_vertical_speed_deviation = 0.02,
            offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}}
          },
          {
            type = "create-entity",
            entity_name = "blood-fountain-big",
            repeat_count = 35,
            offset_deviation = {{-1.6, -1.6}, {1.6, 1.6}}
          }
        }
      }
    }
  },

  {
    type = "generator",
    name = "steam-engine",
    icon = "__base__/graphics/icons/steam-engine.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "steam-engine"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    effectivity = 1,
    fluid_usage_per_tick = 0.1,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.35, -2.35}, {1.35, 2.35}},
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {0, 3} },
        { position = {0, -3} },
      },
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    horizontal_animation =
    {
      filename = "__base__/graphics/entity/steam-engine/steam-engine-horizontal.png",
      width = 246,
      height = 137,
      frame_count = 32,
      line_length = 8,
      shift = {1.34, -0.06}
    },
    vertical_animation =
    {
      filename = "__base__/graphics/entity/steam-engine/steam-engine-vertical.png",
      width = 155,
      height = 186,
      frame_count = 32,
      line_length = 8,
      shift = {0.812, 0.031}
    },
    smoke =
    {
      {
        name = "light-smoke",
        north_position = {0.9, 0.0},
        east_position = {-2.0, -2.0},
        frequency = 10 / 32,
        starting_vertical_speed = 0.08,
        slow_down_factor = 1,
        starting_frame_deviation = 60
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/steam-engine-90bpm.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true,
    },
    min_perceived_performance = 0.25,
    performance_to_sound_speedup = 0.5
  },

  {
    type = "offshore-pump",
    name = "offshore-pump",
    icon = "__base__/graphics/icons/offshore-pump.png",
    flags = {"placeable-neutral", "player-creation", "filter-directions"},
    minable = {mining_time = 1, result = "offshore-pump"},
    max_health = 80,
    corpse = "small-remnants",
    fluid = "water",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-0.6, -0.3}, {0.6, 0.3}},
    selection_box = {{-1, -1.49}, {1, 0.49}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {0, 1} },
      },
    },
    pumping_speed = 1,
    tile_width = 1,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      north =
      {
        filename = "__base__/graphics/entity/offshore-pump/offshore-pump.png",
        priority = "high",
        shift = {0.9, 0.05},
        width = 160,
        height = 102
      },
      east =
      {
        filename = "__base__/graphics/entity/offshore-pump/offshore-pump.png",
        priority = "high",
        shift = {0.9, 0.05},
        x = 160,
        width = 160,
        height = 102
      },
      south =
      {
        filename = "__base__/graphics/entity/offshore-pump/offshore-pump.png",
        priority = "high",
        shift = {0.9, 0.65},
        x = 320,
        width = 160,
        height = 102
      },
      west =
      {
        filename = "__base__/graphics/entity/offshore-pump/offshore-pump.png",
        priority = "high",
        shift = {1.0, 0.05},
        x = 480,
        width = 160,
        height = 102
      }
    },
    circuit_wire_connection_points =
    {
      {
        shadow =
        {
          red = {2.7125, 0.20625},
          green = {2.7125, 0.20625},
        },
        wire =
        {
          red = {0.4, -0.41875},
          green = {0.4, -0.41875},
        }
      },
      {
        shadow =
        {
          red = {2.025, 0.83125},
          green = {2.025, 0.83125},
        },
        wire =
        {
          red = {0.36875, -0.1375},
          green = {0.36875, -0.1375},
        }
      },
      {
        shadow =
        {
          red = {1.09, 1.025},
          green = {1.09, 1.025},
        },
        wire =
        {
          red = {-0.50625, 0.2125},
          green = {-0.50625, 0.2125},
        }
      },
      {
        shadow =
        {
          red = {1.6875, -0.10625},
          green = {1.6875, -0.10625},
        },
        wire =
        {
          red = {-0.34375, -0.73125},
          green = {-0.34375, -0.73125},
        }
      }
    },
    circuit_wire_max_distance = 7.5

  },

  smoke{name = "smoke", color = {r = 0.4, g = 0.4, b = 0.4, a = 0.4}},
  smoke{name = "light-smoke", color = {r = 0.5, g = 0.5, b = 0.5, a = 0.3}},
  smoke
  {
    name = "train-smoke",
    color = {r = 0.3, g = 0.3, b = 0.3, a = 0.3},
    duration = 150,
    spread_duration = 100,
    fade_away_duration = 100,
    start_scale = 0.4,
    end_scale = 1.5,
    affected_by_wind = true
  },
  smoke
  {
    name = "car-smoke",
    color = {r = 0.5, g = 0.5, b = 0.5, a = 0.5},
    duration = 12,
    spread_duration = 12,
    fade_away_duration = 12,
    start_scale = 0.1,
    end_scale = 0.5
  },
  smoke
  {
    name = "tank-smoke",
    color = {r = 0.6, g = 0.6, b = 0.6, a = 0.6},
    duration = 100,
    spread_duration = 100,
    fade_away_duration = 100,
    start_scale = 0.3,
    end_scale = 1.0
  },
  {
    type = "smoke",
    name = "smoke-fast",
    flags = {"not-on-map"},
    animation =
    {
      filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
      priority = "high",
      width = 50,
      height = 50,
      frame_count = 16,
      animation_speed = 16 / 60,
      duration = 60,
      fade_away_duration = 60
    }
  },

  {
    type = "smoke",
    name = "smoke-train-stop",
    flags = {"not-on-map"},
    animation =
    {
      filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
      priority = "high",
      width = 50,
      height = 50,
      animation_speed = 16 / 60,
      frame_count = 16,
      scale = 0.5
    },
    render_layer = "lower-object",
    affected_by_wind = false,
    movement_slow_down_factor = 0.95,
    duration = 40,
    fade_away_duration = 30,
    show_when_smoke_off = true
  },

  {
    type = "smoke",
    name = "smoke-building",
    flags = {"not-on-map"},
    animation =
    {
      filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
      priority = "high",
      width = 50,
      height = 50,
      animation_speed = 1 / 2,
      frame_count = 16,
      scale = 0.5
    },
    render_layer = "building-smoke",
    affected_by_wind = false,
    movement_slow_down_factor = 0.96,
    duration = 45,
    fade_away_duration = 20,
    show_when_smoke_off = true
  },

  {
    type = "smoke",
    name = "smoke-explosion-particle",
    flags = {"not-on-map"},
    animation =
    {
      filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
      priority = "high",
      width = 50,
      height = 50,
      animation_speed = 1 / 2,
      frame_count = 16,
      scale = 0.5,
      tint = {r = 0.1, g = 0.1, b = 0.1, a = 0.7}
    },
    render_layer = "smoke",
    affected_by_wind = false,
    movement_slow_down_factor = 0.96,
    duration = 150,
    fade_away_duration = 60,
    show_when_smoke_off = true
  },

  {
    type = "inserter",
    name = "basic-inserter",
    icon = "__base__/graphics/icons/basic-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "basic-inserter"},
    max_health = 40,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    energy_per_movement = 5000,
    energy_per_rotation = 5000,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.4kW"
    },
    extension_speed = 0.03,
    rotation_speed = 0.014,
    fast_replaceable_group = "inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-basic-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/basic-inserter/basic-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 33
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/basic-inserter/basic-inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/basic-inserter/basic-inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 34
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41
    },
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/basic-inserter/basic-inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
      }
    }
  },

  {
    type = "inserter",
    name = "burner-inserter",
    icon = "__base__/graphics/icons/burner-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "burner-inserter"},
    max_health = 40,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    energy_per_movement = 100000,
    energy_per_rotation = 100000,
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
          frequency = 9
        }
      }
    },
    extension_speed = 0.0214,
    fast_replaceable_group = "inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-basic-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-5.ogg",
          volume = 0.75
        }
      }
    },
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
      width = 18,
      height = 41
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 34
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41
    },
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/burner-inserter/burner-inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46
      }
    },
    rotation_speed = 0.01
  },

  {
    type = "item-entity",
    name = "item-on-ground",
    flags = {"placeable-off-grid", "not-on-map"},
    collision_box = {{-0.14, -0.14}, {0.14, 0.14}},
    selection_box = {{-0.17, -0.17}, {0.17, 0.17}}
  },

  {
    type = "pipe",
    name = "pipe",
    icon = "__base__/graphics/icons/pipe.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "pipe"},
    max_health = 50,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    fast_replaceable_group = "pipe",
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_connections =
      {
        { position = {0, -1} },
        { position = {1, 0} },
        { position = {0, 1} },
        { position = {-1, 0} }
      },
    },
    pictures = pipepictures(),
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/pipe.ogg",
          volume = 0.85
        },
      },
      match_volume_to_activity = true,
      max_sounds_per_type = 3
    },
    horizontal_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.15625}},
    vertical_window_bounding_box = {{-0.28125, -0.40625}, {0.03125, 0.125}}
  },

  {
    type = "radar",
    name = "radar",
    icon = "__base__/graphics/icons/radar.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "radar"},
    max_health = 150,
    corpse = "big-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    energy_per_sector = "10MJ",
    max_distance_of_sector_revealed = 14,
    max_distance_of_nearby_sector_revealed = 3,
    energy_per_nearby_scan = "250kJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "300kW",
    pictures =
    {
      filename = "__base__/graphics/entity/radar/radar.png",
      priority = "low",
      width = 153,
      height = 131,
      apply_projection = false,
      direction_count = 64,
      line_length = 8,
      shift = {0.875, -0.34375}
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/radar.ogg"
        }
      },
      apparent_volume = 2,
    }
  },

  {
    type = "lamp",
    name = "small-lamp",
    icon = "__base__/graphics/icons/small-lamp.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "small-lamp"},
    max_health = 55,
    corpse = "small-remnants",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage_per_tick = "5KW",
    light = {intensity = 0.9, size = 40},
    picture_off =
    {
      filename = "__base__/graphics/entity/small-lamp/light-off.png",
      priority = "high",
      width = 67,
      height = 58,
      frame_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.021875, 0.16875},
    },
    picture_on =
    {
      filename = "__base__/graphics/entity/small-lamp/light-on-patch.png",
      priority = "high",
      width = 62,
      height = 62,
      frame_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.0375, -0.01875},
    },

    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {0.759375, -0.096875},
        green = {0.759375, -0.096875},
      },
      wire =
      {
        red = {0.30625, -0.39375},
        green = {0.30625, -0.39375},
      }
    },

    circuit_wire_max_distance = 7.5
  },

  {
    type = "arrow",
    name = "orange-arrow-with-circle",
    flags = {"placeable-off-grid", "not-on-map"},
    blinking = true,
    arrow_picture =
    {
      filename = "__core__/graphics/arrows/gui-arrow-medium.png",
      priority = "low",
      width = "58",
      height = "62"
    },
    circle_picture =
    {
      filename = "__core__/graphics/arrows/gui-arrow-circle.png",
      priority = "low",
      width = "50",
      height = "50"
    }
  },

  {
    type = "pipe-to-ground",
    name = "pipe-to-ground",
    icon = "__base__/graphics/icons/pipe-to-ground.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "pipe-to-ground"},
    max_health = 50,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {0, 1},
          max_underground_distance = 10
        }
      },
    },
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 32,
      height = 32
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures =
    {
      up =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-up.png",
        priority = "high",
        width = 44,
        height = 32 --, shift = {0.10, -0.04}
      },
      down =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-down.png",
        priority = "high",
        width = 40,
        height = 32 --, shift = {0.05, 0}
      },
      left =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-left.png",
        priority = "high",
        width = 32,
        height = 42 --, shift = {-0.12, 0.1}
      },
      right =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-right.png",
        priority = "high",
        width = 32,
        height = 40 --, shift = {0.1, 0.1}
      },
    }
  },

  {
    type = "assembling-machine",
    name = "assembling-machine-1",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "assembling-machine-1"},
    max_health = 200,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    animation =
    {
      filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
      priority="high",
      width = 99,
      height = 102,
      frame_count = 32,
      line_length = 8,
      shift = {0.25, -0.1}
    },
    crafting_categories = {"crafting"},
    crafting_speed = 0.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.05 / 1.5
    },
    energy_usage = "90kW",
    ingredient_count = 2,
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    }
  },

  {
    type = "flying-text",
    name = "flying-text",
    flags = {"not-on-map"},
    time_to_live = 150,
    speed = 0.05
  },

  {
    type = "corpse",
    name = "acid-splash-purple",
    flags = {"not-on-map"},
    time_before_removed = 60 * 30,
    final_render_layer = "corpse",
    splash =
    {
      {
        filename = "__base__/graphics/entity/acid-splash-purple/splash-1.png",
        line_length = 5,
        width = 199,
        height = 159,
        frame_count = 20,
        shift = {0.484375, -0.171875},
      },
      {
        filename = "__base__/graphics/entity/acid-splash-purple/splash-2.png",
        line_length = 5,
        width = 238,
        height = 157,
        frame_count = 20,
        shift = {0.8125, -0.15625},
      },
      {
        filename = "__base__/graphics/entity/acid-splash-purple/splash-3.png",
        line_length = 5,
        width = 240,
        height = 162,
        frame_count = 20,
        shift = {0.71875, -0.09375},
      },
      {
        filename = "__base__/graphics/entity/acid-splash-purple/splash-4.png",
        line_length = 5,
        width = 241,
        height = 146,
        frame_count = 20,
        shift = {0.703125, -0.375},
      }
    },
    splash_speed = 0.03
  },

  {
    type = "entity-ghost",
    name = "entity-ghost",
    flags = {"not-on-map"},
    minable = { mining_time = 0, results={}},
  },

  {
    type = "tile-ghost",
    name = "tile-ghost",
    flags = {"not-on-map"},
    minable = { mining_time = 0, results={}},
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}}
  },

  {
    type = "deconstructible-tile-proxy",
    name = "deconstructible-tile-proxy",
    flags = {"not-on-map"},
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
  },

  {
    type = "explosion",
    name = "water-splash",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/water-splash/water-splash.png",
        priority = "extra-high",
        width = 92,
        height = 66,
        frame_count = 15,
        line_length = 5,
        shift = {-0.437, 0.5},
        animation_speed = 0.35
      }
    }
  },

  {
    type = "wall",
    name = "stone-wall",
    icon = "__base__/graphics/icons/stone-wall.png",
    flags = {"placeable-neutral", "player-creation"},
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    minable = {mining_time = 1, result = "stone-wall"},
    fast_replaceable_group = "wall",
    max_health = 350,
    repair_speed_modifier = 2,
    corpse = "wall-remnants",
    repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
    -- this kind of code can be used for having walls mirror the effect
    -- there can be multiple reaction items
    --attack_reaction =
    --{
      --{
        ---- how far the mirroring works
        --range = 2,
        ---- what kind of damage triggers the mirroring
        ---- if not present then anything triggers the mirroring
        --damage_type = "physical",
        ---- caused damage will be multiplied by this and added to the subsequent damages
        --reaction_modifier = 0.1,
        --action =
        --{
          --type = "direct",
          --action_delivery =
          --{
            --type = "instant",
            --target_effects =
            --{
              --type = "damage",
              ---- always use at least 0.1 damage
              --damage = {amount = 0.1, type = "physical"}
            --}
          --}
        --},
      --}
    --},
    resistances =
    {
      {
        type = "physical",
        decrease = 3,
        percent = 20
      },
      {
        type = "impact",
        decrease = 45,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      },
      {
        type = "fire",
        percent = 100
      },
      {
        type = "laser",
        percent = 70
      }
    },
    pictures =
    {
      single =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/stone-wall/wall-single.png",
            priority = "extra-high",
            width = 22,
            height = 42,
            shift = {0, -0.15625}
          },
          {
            filename = "__base__/graphics/entity/stone-wall/wall-single-shadow.png",
            priority = "extra-high",
            width = 47,
            height = 32,
            shift = {0.359375, 0.5},
            draw_as_shadow = true
          }
        }
      },
      straight_vertical =
      {
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-vertical-1.png",
              priority = "extra-high",
              width = 22,
              height = 42,
              shift = {0, -0.15625}
            },
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-vertical-shadow.png",
              priority = "extra-high",
              width = 47,
              height = 60,
              shift = {0.390625, 0.625},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-vertical-2.png",
              priority = "extra-high",
              width = 22,
              height = 42,
              shift = {0, -0.15625}
            },
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-vertical-shadow.png",
              priority = "extra-high",
              width = 47,
              height = 60,
              shift = {0.390625, 0.625},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-vertical-3.png",
              priority = "extra-high",
              width = 22,
              height = 42,
              shift = {0, -0.15625}
            },
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-vertical-shadow.png",
              priority = "extra-high",
              width = 47,
              height = 60,
              shift = {0.390625, 0.625},
              draw_as_shadow = true
            }
          }
        }
      },
      straight_horizontal =
      {
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-horizontal-1.png",
              priority = "extra-high",
              width = 32,
              height = 42,
              shift = {0, -0.15625}
            },
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-horizontal-shadow.png",
              priority = "extra-high",
              width = 59,
              height = 32,
              shift = {0.421875, 0.5},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-horizontal-2.png",
              priority = "extra-high",
              width = 32,
              height = 42,
              shift = {0, -0.15625}
            },
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-horizontal-shadow.png",
              priority = "extra-high",
              width = 59,
              height = 32,
              shift = {0.421875, 0.5},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-horizontal-3.png",
              priority = "extra-high",
              width = 32,
              height = 42,
              shift = {0, -0.15625}
            },
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-horizontal-shadow.png",
              priority = "extra-high",
              width = 59,
              height = 32,
              shift = {0.421875, 0.5},
              draw_as_shadow = true
            }
          }
        }
      },
      corner_right_down =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/stone-wall/wall-corner-right-down.png",
            priority = "extra-high",
            width = 27,
            height = 42,
            shift = {0.078125, -0.15625}
          },
          {
            filename = "__base__/graphics/entity/stone-wall/wall-corner-right-down-shadow.png",
            priority = "extra-high",
            width = 53,
            height = 61,
            shift = {0.484375, 0.640625},
            draw_as_shadow = true
          }
        }
      },
      corner_left_down =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/stone-wall/wall-corner-left-down.png",
            priority = "extra-high",
            width = 27,
            height = 42,
            shift = {-0.078125, -0.15625}
          },
          {
            filename = "__base__/graphics/entity/stone-wall/wall-corner-left-down-shadow.png",
            priority = "extra-high",
            width = 53,
            height = 60,
            shift = {0.328125, 0.640625},
            draw_as_shadow = true
          }
        }
      },
      t_up =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/stone-wall/wall-t-down.png",
            priority = "extra-high",
            width = 32,
            height = 42,
            shift = {0, -0.15625}
          },
          {
            filename = "__base__/graphics/entity/stone-wall/wall-t-down-shadow.png",
            priority = "extra-high",
            width = 71,
            height = 61,
            shift = {0.546875, 0.640625},
            draw_as_shadow = true
          }
        }
      },
      ending_right =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/stone-wall/wall-ending-right.png",
            priority = "extra-high",
            width = 27,
            height = 42,
            shift = {0.078125, -0.15625}
          },
          {
            filename = "__base__/graphics/entity/stone-wall/wall-ending-right-shadow.png",
            priority = "extra-high",
            width = 53,
            height = 32,
            shift = {0.484375, 0.5},
            draw_as_shadow = true
          }
        }
      },
      ending_left =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/stone-wall/wall-ending-left.png",
            priority = "extra-high",
            width = 27,
            height = 42,
            shift = {-0.078125, -0.15625}
          },
          {
            filename = "__base__/graphics/entity/stone-wall/wall-ending-left-shadow.png",
            priority = "extra-high",
            width = 53,
            height = 32,
            shift = {0.328125, 0.5},
            draw_as_shadow = true
          }
        }
      }
    }
  },
  {
    type = "corpse",
    name = "wall-remnants",
    icon = "__base__/graphics/icons/wall-remnants.png",
    flags = {"placeable-neutral", "not-on-map"},
    subgroup="remnants",
    order="d[remnants]-c[wall]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation =
    {
      {
        width = 36,
        height = 36,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/stone-wall/remains/wall-remain-01.png"
      },
      {
        width = 38,
        height = 35,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/stone-wall/remains/wall-remain-02.png"
      },
      {
        width = 35,
        height = 36,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/stone-wall/remains/wall-remain-03.png"
      },
      {
        width = 41,
        height = 36,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/stone-wall/remains/wall-remain-04.png"
      },
      {
        width = 35,
        height = 35,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/stone-wall/remains/wall-remain-05.png"
      },
      {
        width = 50,
        height = 37,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/stone-wall/remains/wall-remain-06.png"
      },
      {
        width = 54,
        height = 40,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/stone-wall/remains/wall-remain-07.png"
      },
      {
        width = 43,
        height = 45,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/stone-wall/remains/wall-remain-08.png"
      }
    }
  }
}
)

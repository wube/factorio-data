require ("prototypes.entity.demo-railpictures")
require ("prototypes.entity.demo-pipecovers")
require ("prototypes.entity.demo-transport-belt-pictures")

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
    frame_width = 9,
    frame_height = 8,
    frame_count = 14,
    shift = {0.03125, 0.28125}
  },
  left =
  {
    filename = "__base__/graphics/entity/boiler/boiler-fire-left.png",
    priority = "extra-high",
    frame_width = 5,
    frame_height = 7,
    frame_count = 14,
    shift = {-0.4375, -0.09375}
  },
  right =
  {
    filename = "__base__/graphics/entity/boiler/boiler-fire-right.png",
    priority = "extra-high",
    frame_width = 6,
    frame_height = 9,
    frame_count = 14,
    shift = {0.46875, -0.0625}
  }
}

function biterspawneranimation(variation)
return
  {
    frame_width = 257,
    frame_height = 188,
    frame_count = 8,
    animation_speed = 0.18,
    run_mode = "forward-then-backward",
    axially_symmetrical = false,
    shift = {0.359375, -0.125},
    stripes =
    {
     {
      filename = "__base__/graphics/entity/biter-spawner/biter-spawner-1.png",
      width_in_frames = 4,
      height_in_frames = 4,
      y = variation * 188
     },
     {
      filename = "__base__/graphics/entity/biter-spawner/biter-spawner-2.png",
      width_in_frames = 4,
      height_in_frames = 4,
      y = variation * 188
     }
    }
  }
end

function biterspawnercorpse(variation)
return
  {
    frame_width = 320,
    frame_height = 320,
    frame_count = 20,
    axially_symmetrical = false,
    shift = {0, 0},
    direction_count = 1,
    stripes =
    {
      {
        filename = "__base__/graphics/entity/biter-spawner/biter-spawner-corpse-1.png",
        width_in_frames = 5,
        height_in_frames = 4,
        y = variation * 320,
      },
      {
        filename = "__base__/graphics/entity/biter-spawner/biter-spawner-corpse-2.png",
        width_in_frames = 5,
        height_in_frames = 4,
        y = variation * 320,
      },
      {
        filename = "__base__/graphics/entity/biter-spawner/biter-spawner-corpse-3.png",
        width_in_frames = 5,
        height_in_frames = 4,
        y = variation * 320,
      },
      {
        filename = "__base__/graphics/entity/biter-spawner/biter-spawner-corpse-4.png",
        width_in_frames = 5,
        height_in_frames = 4,
        y = variation * 320,
      }
    }
  }
end

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
      filename = "__base__/graphics/entity/pipe/fluid-flow.png",
      priority = "extra-high",
      width = 128,
      height = 18
    },
    middle_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow.png",
      priority = "extra-high",
      width = 128,
      height = 18
    },
    high_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow.png",
      priority = "extra-high",
      width = 128,
      height = 18
    }
  }
end

data:extend(
{
  {
    type = "player",
    name = "player",
    icon = "__base__/graphics/icons/player.png",
    flags = {"pushable", "placeable-player", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 100,
    healing_per_tick = 0.01,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.4, -1.4}, {0.4, 0.2}},
    crafting_categories = {"crafting"},
    mining_categories = {"basic-solid"},
    inventory_size = 60,
    running_speed = 0.15,
    distance_per_frame = 0.13,
    maximum_corner_sliding_distance = 0.7,
    subgroup = "creatures",
    order="a",
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
        filename = "__base__/sound/heartbeat.wav"
      }
    },
    idle_animation =
    {
      priority = "medium",
      frame_width = 48,
      frame_height = 66,
      direction_count = 5,
      frame_count = 120,
      stripes =
      {
        {
          filename = "__base__/graphics/entity/player/character-idle-1.png",
          width_in_frames = 40
        },
        {
          filename = "__base__/graphics/entity/player/character-idle-2.png",
          width_in_frames = 40
        },
        {
          filename = "__base__/graphics/entity/player/character-idle-3.png",
          width_in_frames = 40
        }
      },
      shift = {0, -0.6}
    },
    idle_with_gun_animation =
    {
      priority = "medium",
      frame_width = 48,
      frame_height = 66,
      direction_count = 5,
      frame_count = 120,
      stripes =
      {
        {
          filename = "__base__/graphics/entity/player/character-idle-with-gun-1.png",
          width_in_frames = 40
        },
        {
          filename = "__base__/graphics/entity/player/character-idle-with-gun-2.png",
          width_in_frames = 40
        },
        {
          filename = "__base__/graphics/entity/player/character-idle-with-gun-3.png",
          width_in_frames = 40
        }
      },
      shift = {0, -0.6}
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
    mining_with_hands_animation =
    {
      priority = "medium",
      frame_width = 48,
      frame_height = 66,
      direction_count = 5,
      frame_count = 80,
      stripes =
      {
        {
          filename = "__base__/graphics/entity/player/character-mine-with-hands-1.png",
          width_in_frames = 40
        },
        {
          filename = "__base__/graphics/entity/player/character-mine-with-hands-2.png",
          width_in_frames = 40
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
      frame_count = 48,
      stripes =
      {
        {
          filename = "__base__/graphics/entity/player/character-mine-with-tool-1.png",
          width_in_frames = 24
        },
        {
          filename = "__base__/graphics/entity/player/character-mine-with-tool-2.png",
          width_in_frames = 24
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
    },
    running_sound_animation_positions = {14, 29}
  },

  {
    type = "furnace",
    name = "stone-furnace",
    icon = "__base__/graphics/icons/stone-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "stone-furnace"},
    max_health = 150,
    corpse = "medium-remnants",
    repair_sound = { filename = "__base__/sound/manual-repair-simple.wav" },
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.wav" },
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
    smelting_categories = {"smelting"},
    result_inventory_size = 1,
    smelting_energy_consumption = "180kW",
    smelting_speed = 1,
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
          frequency = 0.5,
          position = {0, 0},
          starting_vertical_speed = 0.05
        }
      }
    },
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
    animation_speed_coefficient = 32,
    animations =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 40,
      frame_height = 40,
      frame_count = 16,
      direction_count = 12
    },
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
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    fast_replaceable_group = "pipe",
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
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
          deviation = {0.1, 0.1},
          frequency = 1
        }
      }
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
    open_sound = { filename = "__base__/sound/wooden-chest-open.wav" },
    close_sound = { filename = "__base__/sound/wooden-chest-close.wav" },
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
    name = "small-biter-corpse",
    icon = "__base__/graphics/icons/small-biter-corpse.png",
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    dying_speed = 0.04,
    final_render_layer = "corpse",
    animation =
    {
      frame_width = 142,
      frame_height = 97,
      frame_count = 17,
      direction_count = 16,
      axially_symetric = false,
      shift = {0.328125, -0.09375},
      stripes =
      {
        {
          filename = "__base__/graphics/entity/small-biter/small-biter-die-1.png",
          width_in_frames = 9
        },
        {
          filename = "__base__/graphics/entity/small-biter/small-biter-die-2.png",
          width_in_frames = 8
        }
      },
    },
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
    copper_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/copper-wire.png",
      priority = "high",
      width = 224,
      height = 46
    },
    green_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/green-wire.png",
      priority = "high",
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
      priority = "high",
      width = 224,
      height = 46
    },
    wire_shadow_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/wire-shadow.png",
      priority = "high",
      width = 224,
      height = 46
    }
  },

  {
    type = "unit",
    name = "small-biter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air"},
    max_health = 15,
    order = "b-b-a",
    subgroup="enemies",
    healing_per_tick = 0.01,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
    attack_parameters =
    {
      range = 0.5,
      cooldown = 35,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(6),
      animation =
      {
        filename = "__base__/graphics/entity/small-biter/small-biter-attack.png",
        frame_width = 139,
        frame_height = 93,
        frame_count = 11,
        direction_count = 16,
        axially_symmetrical = false,
        shift = {0.84375, -0.3125}
      }
    },
    vision_distance = 30,
    movement_speed = 0.2,
    distance_per_frame = 0.1,
    pollution_to_join_attack = 200,
    distraction_cooldown = 300,
    corpse = "small-biter-corpse",
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
      filename = "__base__/graphics/entity/small-biter/small-biter-run.png",
      still_frame = 4,
      frame_width = 86,
      frame_height = 59,
      frame_count = 16,
      direction_count = 16,
      shift = {0.359375, -0.15625},
      axially_symmetrical = false
    }
  },

  {
    type = "unit-spawner",
    name = "biter-spawner",
    icon = "__base__/graphics/icons/biter-spawner.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    minable = {mining_time = 1, result = "biter-spawner"},
    max_health = 350,
    order="b-b-g",
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
      },
      {
        type = "explosion",
        decrease = 5,
        percent = 15,
      }
    },
    healing_per_tick = 0.02,
    collision_box = {{-3.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-3.5, -2.5}, {2.5, 2.5}},
    -- in ticks per 1 pu
    pollution_cooldown = 10,
    corpse = "biter-spawner-corpse",
    loot =
    {
      {
        count_max = 10,
        count_min = 2,
        item = "alien-artifact",
        probability = 1
      }
    },
    maximum_count_of_owned_units = 7,
    animations =
    {
      biterspawneranimation(0),
      biterspawneranimation(1),
      biterspawneranimation(2),
      biterspawneranimation(3)
    },
    result_units = (function()
                     local res = {}
                     res[1] = {"small-biter", 0.3}
                     if not data.isdemo then
                       res[2] = {"medium-biter", 0.3}
                       res[3] = {"big-biter", 0.4}
                     end
                     return res
                   end)(),
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {360, 150},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    autoplace =
    {
      sharpness = 0.4,
      control = "enemy-base",
      richness_multiplier = 1,
      richness_base = 0,
      force = "enemy",
      peaks =
      {
        {
          influence = 0,
          richness_influence = 100,
          tier_from_start_optimal = 20,
          tier_from_start_top_property_limit = 20,
          tier_from_start_max_range = 40,
        },
        {
          influence = -10.0,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = 0.425,
          noise_layer = "enemy-base",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
        },
        -- increase the size when moving further away
        {
          influence = 0.5,
          noise_layer = "enemy-base",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
          tier_from_start_optimal = 20,
          tier_from_start_top_property_limit = 20,
          tier_from_start_max_range = 40,
        },
      }
    }
  },

  {
    type = "corpse",
    name = "biter-spawner-corpse",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/biter-spawner-corpse.png",
    collision_box = {{-2, -2}, {2, 2}},
    selection_box = {{-2, -2}, {2, 2}},
    selectable_in_game = false,
    dying_speed = 0.04,
    subgroup="corpses",
    order = "c[corpse]-b[biter-spawner]",
    final_render_layer = "corpse",
    animation =
    {
      biterspawnercorpse(0),
      biterspawnercorpse(1),
      biterspawnercorpse(2),
      biterspawnercorpse(3)
    }
  },

  {
    type = "explosion",
    name = "explosion",
    flags = {"not-on-map"},
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
    flags = {"not-on-map"},
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
    flags = {"not-on-map"},
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
    max_health = 300,
    corpse = "big-remnants",
    effectivity = 1,
    fluid_usage_per_tick = 0.1,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.4, -2.4}, {1.4, 2.4}},
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
      frame_width = 219,
      frame_height = 150,
      frame_count = 32,
      line_length = 8,
      shift = {1.1, -0.3}
    },
    vertical_animation =
    {
      filename = "__base__/graphics/entity/steam-engine/steam-engine-vertical.png",
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
      height = 42,
      shift = {0, 0}
    },
    pipes_vertical =
    {
      filename = "__base__/graphics/entity/steam-engine/pipes-vertical.png",
      priority = "high",
      width = 44,
      height = 160
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
    }
  },

  {
    type = "smoke",
    name = "smoke",
    flags = {"not-on-map"},
    animation =
    {
      filename = "__base__/graphics/entity/smoke/smoke.png",
      priority = "high",
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
    flags = {"not-on-map"},
    animation =
    {
      filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
      priority = "high",
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
      width = 20,
      height = 41
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/basic-inserter/basic-inserter-hand-open.png",
      priority = "extra-high",
      width = 20,
      height = 41
    },
    pickup_position = {0, -1},
    insert_position = {0, 1.35},
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
      width = 20,
      height = 41
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open.png",
      priority = "extra-high",
      width = 20,
      height = 41
    },
    pickup_position = {0, -1},
    insert_position = {0, 1.35},
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
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
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
      frame_width = 169,
      frame_height = 140,
      axially_symmetrical = false,
      apply_projection = false,
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
    max_health = 55,
    corpse = "small-remnants",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage_per_tick = "5KW",
    light = {intensity = 0.9, size = 40},
    picture_off =
    {
      filename = "__base__/graphics/entity/small-lamp/small-lamp.png",
      priority = "high",
      width = 83,
      height = 75,
      shift = {0, -0.1}
    },
    picture_on =
    {
      filename = "__base__/graphics/entity/small-lamp/small-lamp.png",
      priority = "high",
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
    flags = {"placeable-neutral"},
    subgroup = "wrecks",
    order="c-f",
    max_health = 50,
    collision_box = {{-2.2, -1}, {2.2, 1}},
    selection_box = {{-2.7, -1.5}, {2.7, 1.5}},
    inventory_size = 4,
    enable_inventory_bar = false,
    picture =
    {
      filename = "__base__/graphics/entity/space-module-wreck/wreck.png",
      width = 168,
      height = 96
    }
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
    collision_box = {{-0.3, -0.3}, {0.3, 0.2}},
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
      frame_width = 99,
      frame_height = 102,
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
    ingredient_count = 2
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
        frame_width = 199,
        frame_height = 159,
        frame_count = 20,
        shift = {0.484375, -0.171875},
      },
      {
        filename = "__base__/graphics/entity/acid-splash-purple/splash-2.png",
        line_length = 5,
        frame_width = 238,
        frame_height = 157,
        frame_count = 20,
        shift = {0.8125, -0.15625},
      },
      {
        filename = "__base__/graphics/entity/acid-splash-purple/splash-3.png",
        line_length = 5,
        frame_width = 240,
        frame_height = 162,
        frame_count = 20,
        shift = {0.71875, -0.09375},
      },
      {
        filename = "__base__/graphics/entity/acid-splash-purple/splash-4.png",
        line_length = 5,
        frame_width = 241,
        frame_height = 146,
        frame_count = 20,
        shift = {0.703125, -0.375},
      }
    },
    splash_speed = 0.03
  },

  {
    type = "ghost",
    name = "ghost",
    flags = {"not-on-map"},
    minable = { mining_time = 0, results={}},
  }
}
)

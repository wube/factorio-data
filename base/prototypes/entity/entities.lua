require ("prototypes.entity.demo-railpictures")

railpictures = function()
  return railpicturesinternal({{"metals", "metals"}, {"backplates", "backplates"}, {"ties", "ties"}, {"stone_path", "stone-path"}})
end

data:extend(
{
  {
    type = "transport-belt-to-ground",
    name = "basic-transport-belt-to-ground",
    icon = "__base__/graphics/icons/basic-transport-belt-to-ground.png",
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-rotate-only"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "basic-transport-belt-to-ground"},
    max_health = 70,
    corpse = "small-remnants",
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 32,
      height = 32,
      x = 32
    },
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.05}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 64,
    belt_horizontal =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32
    },
    belt_vertical =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 32
    },
    ending_top =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 64
    },
    ending_bottom =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 96
    },
    ending_side =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 128
    },
    starting_top =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 160
    },
    starting_bottom =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 192
    },
    starting_side =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 224
    },
    fast_replaceable_group = "transport-belt-to-ground",
    speed = 0.03125,
    structure =
    {
      direction_in =
      {
        sheet = "__base__/graphics/entity/basic-transport-belt-to-ground/basic-transport-belt-to-ground-structure.png",
        priority = "extra-high",
        shift = {0.26, 0},
        width = 57,
        height = 43
      },
      direction_out =
      {
        sheet = "__base__/graphics/entity/basic-transport-belt-to-ground/basic-transport-belt-to-ground-structure.png",
        priority = "extra-high",
        shift = {0.26, 0},
        width = 57,
        height = 43,
        y = 43
      }
    }
  },
  {
    type = "transport-belt-to-ground",
    name = "fast-transport-belt-to-ground",
    icon = "__base__/graphics/icons/fast-transport-belt-to-ground.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "fast-transport-belt-to-ground"},
    max_health = 60,
    corpse = "small-remnants",
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 32,
      height = 32,
      x = 32
    },
    resistances = 
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.05}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 64,
    belt_horizontal =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32
    },
    belt_vertical =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 32
    },
    ending_top =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 64
    },
    ending_bottom =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 96
    },
    ending_side =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 128
    },
    starting_top =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 160
    },
    starting_bottom =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 192
    },
    starting_side =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 224
    },
    fast_replaceable_group = "transport-belt-to-ground",
    speed = 0.0625,
    structure =
    {
      direction_in =
      {
        sheet = "__base__/graphics/entity/fast-transport-belt-to-ground/fast-transport-belt-to-ground-structure.png",
        priority = "extra-high",
        shift = {0.26, 0},
        width = 57,
        height = 43
      },
      direction_out =
      {
        sheet = "__base__/graphics/entity/fast-transport-belt-to-ground/fast-transport-belt-to-ground-structure.png",
        priority = "extra-high",
        shift = {0.26, 0},
        width = 57,
        height = 43,
        y = 43
      }
    }
  },
  {
    type = "transport-belt-to-ground",
    name = "express-transport-belt-to-ground",
    icon = "__base__/graphics/icons/express-transport-belt-to-ground.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "express-transport-belt-to-ground"},
    max_health = 60,
    corpse = "small-remnants",
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 32,
      height = 32,
      x = 32
    },
    resistances = 
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.05}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 64,
    belt_horizontal =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32
    },
    belt_vertical =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 32,
    },
    ending_top =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 64
    },
    ending_bottom =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 96
    },
    ending_side =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 128
    },
    starting_top =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 160
    },
    starting_bottom =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 192
    },
    starting_side =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 224
    },
    fast_replaceable_group = "transport-belt-to-ground",
    speed = 0.09375,
    structure =
    {
      direction_in =
      {
        sheet = "__base__/graphics/entity/express-transport-belt-to-ground/express-transport-belt-to-ground-structure.png",
        priority = "extra-high",
        shift = {0.26, 0},
        width = 57,
        height = 43
      },
      direction_out =
      {
        sheet = "__base__/graphics/entity/express-transport-belt-to-ground/express-transport-belt-to-ground-structure.png",
        priority = "extra-high",
        shift = {0.26, 0},
        width = 57,
        height = 43,
        y = 43
      }
    }
  },
  {
    type = "splitter",
    name = "basic-splitter",
    icon = "__base__/graphics/icons/basic-splitter.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "basic-splitter"},
    max_health = 80,
    corpse = "medium-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.1}, {0.9, 0.1}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    animation_speed_coefficient = 64,
    structure_animation_speed_coefficient = 0.7,
    structure_animation_movement_cooldown = 10,
    belt_horizontal =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32
    },
    belt_vertical =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 32,
    },
    ending_top =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 64
    },
    ending_bottom =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 96
    },
    ending_side =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 128
    },
    starting_top =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 160
    },
    starting_bottom =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 192
    },
    starting_side =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 224
    },
    fast_replaceable_group = "splitter",
    speed = 0.03125,
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/basic-splitter/basic-splitter-north.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        frame_width = 80,
        frame_height = 35,
        shift = {0.225, 0}
      },
      east =
      {
        filename = "__base__/graphics/entity/basic-splitter/basic-splitter-east.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        frame_width = 46,
        frame_height = 81,
        shift = {0.075, 0}
      },
      south =
      {
        filename = "__base__/graphics/entity/basic-splitter/basic-splitter-south.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        frame_width = 82,
        frame_height = 36,
        shift = {0.075, 0}
      },
      west =
      {
        filename = "__base__/graphics/entity/basic-splitter/basic-splitter-west.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        frame_width = 47,
        frame_height = 79,
        shift = {0.25, 0.05}
      },
    }
  },
  {
    type = "splitter",
    name = "fast-splitter",
    icon = "__base__/graphics/icons/fast-splitter.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "fast-splitter"},
    max_health = 80,
    corpse = "medium-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.1}, {0.9, 0.1}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    animation_speed_coefficient = 64,
    structure_animation_speed_coefficient = 1.2,
    structure_animation_movement_cooldown = 10,
    belt_horizontal =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32
    },
    belt_vertical =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 32,
    },
    ending_top =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 64
    },
    ending_bottom =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 96
    },
    ending_side =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 128
    },
    starting_top =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 160
    },
    starting_bottom =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 192
    },
    starting_side =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 224
    },
    fast_replaceable_group = "splitter",
    speed = 0.0625,
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-north.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        frame_width = 80,
        frame_height = 35,
        shift = {0.225, 0}
      },
      east =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-east.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        frame_width = 46,
        frame_height = 81,
        shift = {0.075, 0}
      },
      south =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-south.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        frame_width = 82,
        frame_height = 36,
        shift = {0.075, 0}
      },
      west =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-west.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        frame_width = 47,
        frame_height = 79,
        shift = {0.25, 0.05}
      },
    }
  },
  {
    type = "splitter",
    name = "express-splitter",
    icon = "__base__/graphics/icons/express-splitter.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "express-splitter"},
    max_health = 80,
    corpse = "medium-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.1}, {0.9, 0.1}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    animation_speed_coefficient = 64,
    structure_animation_speed_coefficient = 1.2,
    structure_animation_movement_cooldown = 10,
    belt_horizontal =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32
    },
    belt_vertical =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 32,
    },
    ending_top =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 64
    },
    ending_bottom =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 96
    },
    ending_side =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 128
    },
    starting_top =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 160
    },
    starting_bottom =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 192
    },
    starting_side =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      y = 224
    },
    fast_replaceable_group = "splitter",
    speed = 0.09375,
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-north.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        frame_width = 80,
        frame_height = 35,
        shift = {0.225, 0}
      },
      east =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-east.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        frame_width = 46,
        frame_height = 81,
        shift = {0.075, 0}
      },
      south =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-south.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        frame_width = 82,
        frame_height = 36,
        shift = {0.075, 0}
      },
      west =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-west.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        frame_width = 47,
        frame_height = 79,
        shift = {0.25, 0.05}
      },
    }
  },
  {
    type = "transport-belt",
    name = "fast-transport-belt",
    icon = "__base__/graphics/icons/fast-transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = "fast-transport-belt"},
    max_health = 50,
    corpse = "small-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 50
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 64,
    animations =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      direction_count = 12
    },
    fast_replaceable_group = "transport-belt",
    speed = 0.0625
  },
  {
    type = "transport-belt",
    name = "express-transport-belt",
    icon = "__base__/graphics/icons/express-transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = "express-transport-belt"},
    max_health = 50,
    corpse = "small-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 50
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 64,
    animations =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      frame_width = 32,
      frame_height = 32,
      frame_count = 32,
      direction_count = 12
    },
    fast_replaceable_group = "transport-belt",
    speed = 0.09375
  },
  {
    type = "assembling-machine",
    name = "assembling-machine-2",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "assembling-machine-2"},
    max_health = 250,
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
    fast_replaceable_group = "assembling-machine",
    animation =
    {
      filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2.png",
      priority = "high",
      frame_width = 141,
      frame_height = 120,
      frame_count = 32,
      line_length = 6,
      shift = {0.7, 0.12}
    },
    crafting_categories = {"crafting"},
    crafting_speed = 0.75,
    energy_source =
    {
      type = "electric",
      input_priority = "secondary",
      emissions = 0.04 / 2.5
    },
    energy_usage = "150W",
    ingredient_count = 4,
    module_slots = 2,
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },
  {
    type = "assembling-machine",
    name = "assembling-machine-3",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "assembling-machine-3"},
    max_health = 300,
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
    fast_replaceable_group = "assembling-machine",
    animation =
    {
      filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3.png",
      priority = "high",
      frame_width = 141,
      frame_height = 120,
      frame_count = 32,
      line_length = 6,
      shift = {0.7, 0.12}
    },
    crafting_categories = {"crafting"},
    crafting_speed = 1.25,
    energy_source =
    {
      type = "electric",
      input_priority = "secondary",
      emissions = 0.03 / 3.5
    },
    energy_usage = "210W",
    ingredient_count = 4,
    module_slots = 4,
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },
  {
    type = "car",
    name = "car",
    icon = "__base__/graphics/icons/car.png",
    flags = {"pushable", "placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "car"},
    max_health = 500,
    corpse = "medium-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 50
      }
    },
    collision_box = {{-0.7, -1}, {0.7, 1}},
    selection_box = {{-0.7, -1}, {0.7, 1}},
    acceleration_per_energy = 0.001,
    breaking_speed = 0.01,
    burner =
    {
      effectivity = 1,
      fuel_inventory_size = 1,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0, 1.5},
          slow_down_factor = 0.9,
          starting_frame = 3,
          starting_frame_deviation = 5,
          starting_frame_speed = 0,
          starting_frame_speed_deviation = 5
        }
      }
    },
    consumption = "600W",
    friction = 0.02,
    light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "medium",
          width = 400,
          height = 400
        },
        shift = {-0.6, -14},
        size = 2,
        intensity = 0.6
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "medium",
          width = 400,
          height = 400
        },
        shift = {0.6, -14},
        size = 2,
        intensity = 0.6
      }
    },
    pictures =
    {
      filename = "__base__/graphics/entity/car/car-sheet.png",
      line_length = 8,
      frame_width = 130,
      frame_height = 93,
      shift={0.5, 0},
      axially_symmetrical = false,
      direction_count = 64
    },
    rotation_speed = 0.015,
    weight = 50,
    inventory_size = 80
  },
  {
    type = "container",
    name = "iron-chest",
    icon = "__base__/graphics/icons/iron-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "iron-chest"},
    max_health = 100,
    corpse = "small-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 32,
    picture =
    {
      filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
      priority = "extra-high",
      width = 48,
      height = 34,
      shift = {0.2, 0}
    }
  },
  {
    type = "container",
    name = "steel-chest",
    icon = "__base__/graphics/icons/steel-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "steel-chest"},
    max_health = 200,
    corpse = "small-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 48,
    picture =
    {
      filename = "__base__/graphics/entity/steel-chest/steel-chest.png",
      priority = "extra-high",
      width = 48,
      height = 34,
      shift = {0.2, 0}
    }
  },
  {
    type = "smart-container",
    name = "smart-chest",
    icon = "__base__/graphics/icons/smart-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    minable =
    {
      hardness = 0.2,
      mining_time = 0.5,
      result = "smart-chest"
    },
    max_health = 150,
    corpse = "small-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 48,
    picture =
    {
      filename = "__base__/graphics/entity/smart-chest/smart-chest.png",
      priority = "extra-high",
      width = 62,
      height = 41,
      shift = {0.4, -0.13}
    },
    connection_point =
    {
      shadow =
      {
        red = {0.7, -0.3},
        green = {0.7, -0.3}
      },
      wire =
      {
        red = {0.3, -0.8},
        green = {0.3, -0.8}
      }
    }
  },
  {
    type = "inserter",
    name = "long-handed-inserter",
    icon = "__base__/graphics/icons/long-handed-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "long-handed-inserter"},
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
    insert_distance = 1.85,
    pickup_distance = 2,
    energy_per_movement = 5,
    energy_per_rotation = 5,
    rotation_speed = 0.02,
    energy_source =
    {
      type = "electric",
      input_priority = "secondary"
    },
    extension_speed = 0.04,
    fast_replaceable_group = "inserter",
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-hand-closed.png",
      priority = "extra-high",
      width = 13,
      height = 41
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-hand-open.png",
      priority = "extra-high",
      width = 13,
      height = 41
    },
    platform_picture =
    {
      priority = "extra-high",
      width = 46,
      height = 46,
      sheet = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-platform.png"
    }
  },
  {
    type = "inserter",
    name = "fast-inserter",
    icon = "__base__/graphics/icons/fast-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable =
    {
      hardness = 0.2,
      mining_time = 0.5,
      result = "fast-inserter"
    },
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
    insert_distance = 0.85,
    pickup_distance = 1,
    energy_per_movement = 5,
    energy_per_rotation = 5,
    energy_source = {
      type = "electric",
      input_priority = "secondary"
    },
    extension_speed = 0.07,
    fast_replaceable_group = "inserter",
    hand_base_picture = {
      filename = "__base__/graphics/entity/fast-inserter/fast-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34
    },
    hand_closed_picture = {
      filename = "__base__/graphics/entity/fast-inserter/fast-inserter-hand-closed.png",
      priority = "extra-high",
      width = 13,
      height = 41
    },
    hand_open_picture = {
      filename = "__base__/graphics/entity/fast-inserter/fast-inserter-hand-open.png",
      priority = "extra-high",
      width = 13,
      height = 41
    },
    platform_picture =
    {
      priority = "extra-high",
      width = 46,
      height = 46,
      sheet = "__base__/graphics/entity/fast-inserter/fast-inserter-platform.png"
    },
    rotation_speed = 0.035
  },
  {
    type = "inserter",
    name = "smart-inserter",
    icon = "__base__/graphics/icons/smart-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "smart-inserter"},
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
    insert_distance = 0.85,
    pickup_distance = 1,
    energy_per_movement = 7,
    energy_per_rotation = 7,
    energy_source =
    {
      type = "electric",
      input_priority = "secondary"
    },
    extension_speed = 0.07,
    fast_replaceable_group = "inserter",
    filter_count = 5,
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/smart-inserter/smart-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/smart-inserter/smart-inserter-hand-closed.png",
      priority = "extra-high",
      width = 13,
      height = 41
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/smart-inserter/smart-inserter-hand-open.png",
      priority = "extra-high",
      width = 13,
      height = 41
    },
    platform_picture =
    {
      priority = "extra-high",
      width = 46,
      height = 46,
      sheet = "__base__/graphics/entity/smart-inserter/smart-inserter-platform.png"
    },
    programmable = true,
    rotation_speed = 0.035,
    uses_arm_movement = "basic-inserter"
  },
  {
    type = "solar-panel",
    name = "solar-panel",
    icon = "__base__/graphics/icons/solar-panel.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "solar-panel"},
    max_health = 100,
    corpse = "big-remnants",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    energy_source =
    {
      type = "electric",
      input_priority = "none",
      output_priority = "primary"
    },
    picture =
    {
      filename = "__base__/graphics/entity/solar-panel/solar-panel.png",
      priority = "high",
      width = 104,
      height = 96
    },
    production = "60W"
  },
  {
    type = "locomotive",
    name = "diesel-locomotive",
    icon = "__base__/graphics/icons/diesel-locomotive.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 1, result = "diesel-locomotive"},
    max_health = 1000,
    corpse = "medium-remnants",
    collision_box = {{-0.6, -2.6}, {0.9, 2.6}},
    selection_box = {{-0.7, -2.5}, {1, 2.5}},
    drawing_box = {{-1, -4}, {1, 3}},
    weight = 2000,
    max_speed = 1.2,
    max_power = 10,
    braking_force = 10,
    friction_force = 0.0015,
    -- this is a percentage of current speed that will be substracted
    air_resistance = 0.002,
    connection_distance = 3.3,
    joint_distance = 4.6,
    energy_per_hit_point = 5,
    energy_source =
    {
      type = "burner",
      effectivity = 1,
      fuel_inventory_size = 3,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 20,
          position = {0, 0},
          slow_down_factor = 0.9,
          starting_frame = 3,
          starting_frame_deviation = 5,
          starting_frame_speed = 0,
          starting_frame_speed_deviation = 5
        }
      }
    },
    light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "medium",
          width = 400,
          height = 400
        },
        shift = {-0.6, -16},
        size = 2,
        intensity = 0.6
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "medium",
          width = 400,
          height = 400
        },
        shift = {0.6, -16},
        size = 2,
        intensity = 0.6
      }
    },
    pictures =
    {
      priority = "very-low",
      frame_width = 346,
      frame_height = 248,
      axially_symmetrical = false,
      direction_count = 256,
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
      shift = {0.9, -0.45}
    },
    rail_category = "regular"
  },
  {
    type = "cargo-wagon",
    name = "cargo-wagon",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    inventory_size = 15,
    minable = {mining_time = 1, result = "cargo-wagon"},
    max_health = 600,
    corpse = "medium-remnants",
    collision_box = {{-0.6, -2.4}, {0.9, 2.4}},
    selection_box = {{-0.7, -2.5}, {1, 2.5}},
    weight = 1000,
    max_speed = 1.5,
    braking_force = 3,
    friction_force = 0.0015,
    air_resistance = 0.002,
    connection_distance = 3.3,
    joint_distance = 4,
    energy_per_hit_point = 5,
    pictures =
    {
      priority = "very-low",
      frame_width = 285,
      frame_height = 218,
      axially_symmetrical = false,
      back_equals_front = true,
      direction_count = 128,
      filenames =
      {
        "__base__/graphics/entity/cargo-wagon/cargo-wagon-spritesheet-1.png",
        "__base__/graphics/entity/cargo-wagon/cargo-wagon-spritesheet-2.png",
        "__base__/graphics/entity/cargo-wagon/cargo-wagon-spritesheet-3.png",
        "__base__/graphics/entity/cargo-wagon/cargo-wagon-spritesheet-4.png"
      },
      line_length = 4,
      lines_per_file = 8,
      shift={0.7, -0.45}
    },
    rail_category = "regular"
  },
  {
    type = "wall",
    name = "wall",
    icon = "__base__/graphics/icons/wall.png",
    flags = {"placeable-neutral", "player-creation"},
    collision_box = {{-0.49, -0.49}, {0.49, 0.49}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    minable = {mining_time = 1, result = "wall"},
    max_health = 350,
    corpse = "wall-remnants",
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
        {
          filename = "__base__/graphics/entity/wall/wall-single.png",
          priority = "extra-high",
          width = 33,
          height = 58,
          shift = {0.1, 0.1}
        }
      },
      straight_vertical =
      {
        {
          filename = "__base__/graphics/entity/wall/wall-straight-vertical-1.png",
          priority = "extra-high",
          width = 51,
          height = 32,
          shift = {0.296875, 0}
        },
        {
          filename = "__base__/graphics/entity/wall/wall-straight-vertical-2.png",
          priority = "extra-high",
          width = 51,
          height = 32,
          shift = {0.296875, 0}
        }
      },
      straight_vertical_under_ending =
      {
        {
          filename = "__base__/graphics/entity/wall/wall-straight-vertical-under-ending.png",
          priority = "extra-high",
          width = 51,
          height = 32,
          shift = {0.296875, 0}
        }
      },
      straight_horizontal =
      {
        {
          filename = "__base__/graphics/entity/wall/wall-straight-horizontal-1.png",
          priority = "extra-high",
          width = 32,
          height = 57,
          shift = {0, 0.078125}
        },
        {
          filename = "__base__/graphics/entity/wall/wall-straight-horizontal-2.png",
          priority = "extra-high",
          width = 32,
          height = 57,
          shift = {0, 0.078125}
        },
        {
          filename = "__base__/graphics/entity/wall/wall-straight-horizontal-3.png",
          priority = "extra-high",
          width = 32,
          height = 55,
          shift = {0, 0.078125}
        }
      },
      corner_right_up =
      {
        {
          filename = "__base__/graphics/entity/wall/wall-corner-right-up.png",
          priority = "extra-high",
          width = 32,
          height = 53,
          shift = {0, 0.171875}
        }
      },
      corner_right_down =
      {
        {
          filename = "__base__/graphics/entity/wall/wall-corner-right-down.png",
          priority = "extra-high",
          width = 32,
          height = 42,
          shift = {0, -0.15625}
        }
      },
      corner_left_down =
      {
        {
          filename = "__base__/graphics/entity/wall/wall-corner-left-down.png",
          priority = "extra-high",
          width = 46,
          height = 42,
          shift = {0.21875, -0.15625}
        }
      },
      corner_left_up =
      {
        {
          filename = "__base__/graphics/entity/wall/wall-corner-left-up.png",
          priority = "extra-high",
          width = 51,
          height = 58,
          shift = {0.296875, 0.03125}
        }
      },
      t_up =
      {
        {
          filename = "__base__/graphics/entity/wall/wall-t-up.png",
          priority = "extra-high",
          width = 32,
          height = 44,
          shift = {0, -0.1875}
        }
      },
      t_down =
      {
        {
          filename = "__base__/graphics/entity/wall/wall-t-down.png",
          priority = "extra-high",
          width = 32,
          height = 53,
          shift = {0, 0.140625}
       }
      },
      t_right =
      {
        {
          filename = "__base__/graphics/entity/wall/wall-t-right.png",
          priority = "extra-high",
          width = 51,
          height = 38,
          shift = {0.296875, -0.09375}
        }
      },
      t_left =
      {
        {
          filename = "__base__/graphics/entity/wall/wall-t-left.png",
          priority = "extra-high",
          width = 32,
          height = 38,
          shift = {0, -0.09375}
        }
      },
      cross =
      {
        {
          filename = "__base__/graphics/entity/wall/wall-cross.png",
          priority = "extra-high",
          width = 32,
          height = 38,
          shift = {0, -0.09375}
        }
      },
      ending_up =
      {
        {
          filename = "__base__/graphics/entity/wall/wall-ending-up.png",
          priority = "extra-high",
          width = 64,
          height = 47,
          shift = {0.5, 0.234375}
        }
      },
      ending_down =
      {
        {
          filename = "__base__/graphics/entity/wall/wall-ending-down.png",
          priority = "extra-high",
          width = 51,
          height = 36,
          shift = {0.296875, -0.0625}
        }
      },
      ending_right =
      {
        {
          filename = "__base__/graphics/entity/wall/wall-ending-right.png",
          priority = "extra-high",
          width = 32,
          height = 58,
          shift = {0, 0.0625}
        }
      },
      ending_left =
      {
        {
          filename = "__base__/graphics/entity/wall/wall-ending-left.png",
          priority = "extra-high",
          width = 44,
          height = 57,
          shift = {0.1875, 0.078125}
        }
      }
    }
  },
  {
    type = "corpse",
    name = "wall-remnants",
    icon = "__base__/graphics/icons/wall-remnants.png",
    flags = {"placeable-neutral"},
    order="c-g",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation = 
    {
      {
        frame_width = 36,
        frame_height = 36,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/wall/remains/wall-remain-01.png"
      },
      {
        frame_width = 38,
        frame_height = 35,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/wall/remains/wall-remain-02.png"
      },
      {
        frame_width = 35,
        frame_height = 36,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/wall/remains/wall-remain-03.png"
      },
      {
        frame_width = 41,
        frame_height = 36,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/wall/remains/wall-remain-04.png"
      },
      {
        frame_width = 35,
        frame_height = 35,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/wall/remains/wall-remain-05.png"
      },
      {
        frame_width = 50,
        frame_height = 37,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/wall/remains/wall-remain-06.png"
      },
      {
        frame_width = 54,
        frame_height = 40,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/wall/remains/wall-remain-07.png"
      },
      {
        frame_width = 43,
        frame_height = 45,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/wall/remains/wall-remain-08.png"
      }
    }
  },
  {
    type = "player-port",
    name = "player-port",
    icon = "__base__/graphics/icons/player-port.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "player-port"},
    max_health = 50,
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    animation =
    {
      filename = "__base__/graphics/entity/player-port/player-port-animation.png",
      frame_width = 64,
      frame_height = 64,
      frame_count = 2
    }
  },
  {
    type = "rail",
    name = "straight-rail",
    icon = "__base__/graphics/icons/straight-rail.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 1, result = "straight-rail"},
    max_health = 100,
    corpse = "straight-rail-remnants",
    collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
    bending_type = "straight",
    rail_category = "regular",
    pictures = railpictures()
  },
  {
    type = "rail",
    name = "curved-rail",
    icon = "__base__/graphics/icons/curved-rail.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 1, result = "curved-rail"},
    max_health = 200,
    corpse = "curved-rail-remnants",
    collision_box = {{-0.75, -0.65}, {0.75, 1.7}},
    secondary_collision_box = {{-0.85, -2.6}, {0.85, 2.6}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    bending_type = "turn",
    rail_category = "regular",
    pictures = railpictures()
  },
  {
    type = "flame-thrower-explosion",
    name = "flame-thrower-explosion",
    animation_speed = 1,
    animations =
    {
      {
        filename = "__base__/graphics/entity/flame-thrower-explosion/flame-thrower-explosion.png",
        priority = "extra-high",
        frame_width = 64,
        frame_height = 64,
        frame_count = 64,
        line_length = 8
      }
    },
    light = {intensity = 0.2, size = 20},
    slow_down_factor = 0.98,
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 0.95,
    damage = {amount = 0.25, type = "fire"}
  },
  {
    type = "land-mine",
    name = "land-mine",
    icon = "__base__/graphics/icons/land-mine.png",
    flags =
    {
      "placeable-player",
      "placeable-enemy",
      "player-creation",
      "placeable-off-grid"
    },
    minable = {mining_time = 1, result = "land-mine"},
    max_health = 15,
    corpse = "small-remnants",
    collision_box = {{-0.4,-0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    dying_explosion = "explosion-gunshot",
    picture_safe =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    picture_set =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine-set.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    trigger_radius = 2.5,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "nested-result",
            affects_target = true,
            action =
            {
              type = "area",
              perimeter = 6,
              collision_mask = { "player-layer" },
              action_delivery =
              {
                type = "instant",
                target_effects = 
                {
                  type = "damage",
                  damage = { amount = 40, type = "explosion"}
                }
              }
            },
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = { amount = 1000, type = "explosion"}
          }
        }
      }
    },
  },
  {
    type = "train-stop",
    name = "train-stop",
    icon = "__base__/graphics/icons/train-stop.png",
    flags = {"placeable-neutral", "player-creation", "filter-directions"},
    minable = {mining_time = 1, result = "train-stop"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.6, -0.6}, {0.6, 0.6}},
    drawing_box = {{-0.5, -3}, {0.5, 0.5}},
    animation_ticks_per_frame = 20,
    animations =
    {
      north =
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-north.png",
        priority = "high",
        frame_width = 180,
        frame_height = 136,
        frame_count = 2,
        shift = {1.65, -0.9}
      },
      east =
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-east.png",
        priority = "high",
        frame_width = 173,
        frame_height = 128,
        frame_count = 2,
        shift = {1.7, -1.5}
      },
      south =
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-south.png",
        priority = "high",
        frame_width = 155,
        frame_height = 132,
        frame_count = 2,
        shift = {1.7, -1.4}
      },
      west =
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-west.png",
        priority = "high",
        frame_width = 173,
        frame_height = 126,
        frame_count = 2,
        shift = {2, -0.8}
      }
    }
  },
  {
    type = "rail-signal",
    name = "rail-signal",
    icon = "__base__/graphics/icons/rail-signal.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way", "filter-directions"},
    minable = {mining_time = 1, result = "rail-signal"},
    max_health = 80,
    corpse = "small-remnants",
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation =
    {
      filename = "__base__/graphics/entity/rail-signal/rail-signal.png",
      priority = "high",
      frame_width = 70,
      frame_height = 46,
      frame_count = 3,
      direction_count = 8,
      axially_symmetrical = false
    },
    green_light = {intensity = 0.2, size = 4, color={g=1}},
    orange_light = {intensity = 0.2, size = 4, color={r=1, g=0.5}},
    red_light = {intensity = 0.2, size = 4, color={r=1}}
  },
  {
    type = "lab",
    name = "lab",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "lab"},
    max_health = 150,
    corpse = "big-remnants",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    light = {intensity = 0.75, size = 8},
    on_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      frame_width = 113,
      frame_height = 91,
      frame_count = 33,
      line_length = 11,
      shift = {0.2, 0.15}
    },
    off_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      frame_width = 113,
      frame_height = 91,
      frame_count = 1,
      shift = {0.2, 0.15}
    },
    energy_source =
    {
      type = "electric",
      input_priority = "secondary"
    },
    energy_usage = "60W",
    inputs =
    {
      "science-pack-1",
      "science-pack-2",
      "science-pack-3",
      "alien-science-pack"
    },
    module_slots = 2
  },

  {
    type = "logistic-robot",
    name = "logistic-robot",
    icon = "__base__/graphics/icons/logistic-robot.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid"},
    minable = {hardness = 0.1, mining_time = 0.1, result = "logistic-robot"},
    max_health = 100,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    max_payload_size = 1,
    speed = 0.05,
    transfer_distance = 0.5,
    max_energy = "300J",
    energy_per_tick = "0.01J",
    energy_per_move = "1J",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    picture =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
      priority = "high",
      width = 37,
      height = 34
    },
    shadow =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
      priority = "high",
      width = 52,
      height = 37
    }
  },

  {
    type = "construction-robot",
    name = "construction-robot",
    icon = "__base__/graphics/icons/construction-robot.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid"},
    minable = {hardness = 0.1, mining_time = 0.1, result = "construction-robot"},
    max_health = 100,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    max_payload_size = 1,
    speed = 0.06,
    transfer_distance = 0.5,
    max_energy = "300J",
    energy_per_tick = "0.01J",
    energy_per_move = "1J",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    picture =
    {
      filename = "__base__/graphics/entity/construction-robot/construction-robot.png",
      priority = "high",
      width = 37,
      height = 34
    },
    shadow =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
      priority = "high",
      width = 52,
      height = 37
    },
    repair_pack = "repair-pack"
  },
  {
    type = "logistic-container",
    name = "logistic-chest-provider",
    icon = "__base__/graphics/icons/logistic-chest-provider.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "logistic-chest-provider"},
    max_health = 150,
    corpse = "small-remnants",
    collision_box = {{-0.4,-0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 48,
    logistic_mode = "provider",
    picture =
    {
      filename = "__base__/graphics/entity/logistic-chest/logistic-chest-provider.png",
      priority = "extra-high",
      width = 38,
      height = 32,
      shift = {0.1, 0}
    }
  },
  {
    type = "logistic-container",
    name = "logistic-chest-storage",
    icon = "__base__/graphics/icons/logistic-chest-storage.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "logistic-chest-storage"},
    max_health = 150,
    corpse = "small-remnants",
    collision_box = {{-0.4,-0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 48,
    logistic_mode = "storage",
    picture =
    {
      filename = "__base__/graphics/entity/logistic-chest/logistic-chest-storage.png",
      priority = "extra-high",
      width = 38,
      height = 32,
      shift = {0.1, 0}
    }
  },
  {
    type = "logistic-container",
    name = "logistic-chest-requester",
    icon = "__base__/graphics/icons/logistic-chest-requester.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "logistic-chest-requester"},
    max_health = 150,
    corpse = "small-remnants",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 48,
    logistic_mode = "requester",
    picture =
    {
      filename = "__base__/graphics/entity/logistic-chest/logistic-chest-requester.png",
      priority = "extra-high",
      width = 38,
      height = 32,
      shift = {0.1, 0}
    }
  },
  {
    type = "rocket-defense",
    name = "rocket-defense",
    icon = "__base__/graphics/icons/rocket-defense.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "rocket-defense"},
    max_health = 5000,
    corpse = "big-remnants",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = "100KJ",
      input_priority = "primary"
    },
    picture =
    {
      filename = "__base__/graphics/entity/rocket-defense/rocket-defense.png",
      priority = "low",
      width = 160,
      height = 160
    }
  },

  {
    type = "roboport",
    name = "roboport",
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "roboport"},
    max_health = 500,
    corpse = "big-remnants",
    collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
    selection_box = {{-2, -2}, {2, 2}},
    energy_source =
    {
      type = "electric",
      input_priority = "primary",
      input_flow_limit = "2KW",
      buffer_capacity = "48KJ"
    },
    recharge_minimum = "20KJ",
    energy_usage = "200W",
    -- per one charge slot
    charging_energy = "200W",
    radius = 25,
    charge_approach_distance = 5,
    robot_slots_count = 7,
    material_slots_count = 7,
    stationing_offset = {0, 0},
    charging_offsets =
    {
      {-1.5, -0.5}, {1.5, -0.5}, {1.5, 1.5}, {-1.5, 1.5},
    },
    base_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport.png",
      priority = "medium",
      frame_width = 143,
      frame_height = 151,
      frame_count = 8,
      shift = {0.5, 0},
      animation_speed = 0.5
    },
    door_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door.png",
      priority = "medium",
      frame_width = 52,
      frame_height = 39,
      frame_count = 16,
      shift = {0, -0.6}
    },
    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      priority = "high",
      frame_width = 37,
      frame_height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5
    },
    recharging_light = {intensity = 0.4, size = 5},
    request_to_open_door_timeout = 15,
    spawn_and_station_height = 0.33,
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/roboport/roboport-radius-visualization.png",
      width = 12,
      height = 12
    }
  },

  {
    type = "explosion",
    name = "laser-bubble",
    animation_speed = 1,
    animations =
    {
      {
        filename = "__base__/graphics/entity/laser-bubble/laser-bubble.png",
        priority = "extra-high",
        frame_width = 8,
        frame_height = 8,
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
    name = "railgun-beam",
    animation_speed = 3,
    rotate = true,
    beam = true,
    animations =
    {
      {
        filename = "__base__/graphics/entity/blue-beam/blue-beam.png",
        priority = "extra-high",
        frame_width = 187,
        frame_height = 1,
        frame_count = 6,
      }
    },
    light = {intensity = 1, size = 10},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1
  },
  {
    type = "market",
    name = "market",
    icon = "__base__/graphics/icons/market.png",
    flags = {"placeable-neutral", "player-creation"},
    order="d-a-a",
    max_health = 150,
    corpse = "big-remnants",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    picture =
    {
      filename = "__base__/graphics/entity/market/market.png",
      width = 156,
      height = 127,
      shift = {0.95, 0.2}
    }
  },
  {
    type = "electric-pole",
    name = "big-electric-pole",
    icon = "__base__/graphics/icons/big-electric-pole.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "big-electric-pole"},
    max_health = 150,
    corpse = "medium-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box = {{-2.8, -0.5}, {0.5, 0.5}},
    maximum_wire_distance = 30,
    supply_area_distance = 2,
    pictures =
    {
      filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole.png",
      priority = "high",
      frame_width = 168,
      frame_height = 165,
      axially_symmetrical = false,
      direction_count = 4,
      shift = {1.6, -1.1}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {2.7, 0},
          green = {1.8, 0},
          red = {3.6, 0}
        },
        wire =
        {
          copper = {0, -3.1},
          green = {-0.6,-3.1},
          red = {0.6,-3.1}
        }
      },
      {
        shadow =
        {
          copper = {3.1, 0.2},
          green = {2.3, -0.3},
          red = {3.8, 0.6}
        },
        wire =
        {
          copper = {-0.08, -3.15},
          green = {-0.55, -3.5},
          red = {0.3, -2.87}
        }
      },
      {
        shadow =
        {
          copper = {2.9, 0.06},
          green = {3.0, -0.6},
          red = {3.0, 0.8}
        },
        wire =
        {
          copper = {-0.1, -3.1},
          green = {-0.1, -3.55},
          red = {-0.1, -2.8}
        }
      },
      {
        shadow =
        {
          copper = {3.1, 0.2},
          green = {3.8, -0.3},
          red = {2.35, 0.6}
        },
        wire =
        {
          copper = {0, -3.25},
          green = {0.45, -3.55},
          red = {-0.54, -3.0}
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
    type = "electric-pole",
    name = "medium-electric-pole",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "medium-electric-pole"},
    max_health = 100,
    corpse = "small-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    drawing_box = {{-2.8, -0.5}, {0.5, 0.5}},
    maximum_wire_distance = 9,
    supply_area_distance = 3.5,
    pictures =
    {
      filename = "__base__/graphics/entity/medium-electric-pole/medium-electric-pole.png",
      priority = "high",
      frame_width = 136,
      frame_height = 122,
      axially_symmetrical = false,
      direction_count = 4,
      shift = {1.4, -1.0}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {2.55, 0.4},
          green = {2.0, 0.4},
          red = {3.05, 0.4}
        },
        wire =
        {
          copper = {-0.03, -2.5},
          green = {-0.35,-2.5},
          red = {0.25,-2.5}
        }
      },
      {
        shadow =
        {
          copper = {2.9, 0.1},
          green = {2.6, -0.15},
          red = {3.25, 0.35}
        },
        wire =
        {
          copper = {0.05, -2.75},
          green = {-0.15, -2.9},
          red = {0.25, -2.55}
        }
      },
      {
        shadow =
        {
          copper = {1.5, -0.2},
          green = {1.5, -0.55},
          red = {1.5, 0.1}
        },
        wire =
        {
          copper = {-0.43, -2.4},
          green = {-0.43, -2.63},
          red = {-0.43, -2.2}
        }
      },
      {
        shadow =
        {
          copper = {2.88, 0.2},
          green = {3.2, -0.1},
          red = {2.45, 0.4}
        },
        wire =
        {
          copper = {0, -2.7},
          green = {0.22, -2.85},
          red = {-0.24, -2.55}
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
    type = "electric-pole",
    name = "substation",
    icon = "__base__/graphics/icons/substation.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "substation"},
    max_health = 200,
    corpse = "medium-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box = {{-1, -1.5}, {1, 1}},
    maximum_wire_distance = 14,
    supply_area_distance = 7,
    pictures =
    {
      filename = "__base__/graphics/entity/substation/substation.png",
      priority = "high",
      frame_width = 132,
      frame_height = 144,
      axially_symmetrical = false,
      direction_count = 4,
      shift = {0.9, -1}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {1.9, -0.6},
          green = {1.3, -0.6},
          red = {2.65, -0.6}
        },
        wire =
        {
          copper = {-0.23, -2.65},
          green = {-0.85,-2.65},
          red = {0.35,-2.65}
        }
      },
      {
        shadow =
        {
          copper = {1.9, -0.6},
          green = {1.2, -0.8},
          red = {2.5, -0.35}
        },
        wire =
        {
          copper = {-0.26, -2.71},
          green = {-0.67,-3},
          red = {0.17,-2.47}
        }
      },
      {
        shadow =
        {
          copper = {1.9, -0.6},
          green = {1.9, -0.9},
          red = {1.9, -0.3}
        },
        wire =
        {
          copper = {-0.23, -2.7},
          green = {-0.23,-3.2},
          red = {-0.23,-2.35}
        }
      },
      {
        shadow =
        {
          copper = {1.8, -0.7},
          green = {1.3, -0.6},
          red = {2.4, -1.15}
        },
        wire =
        {
          copper = {-0.2, -2.7},
          green = {-0.62,-2.45},
          red = {0.25,-2.98}
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
    type = "accumulator",
    name = "basic-accumulator",
    icon = "__base__/graphics/icons/basic-accumulator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "basic-accumulator"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = "5KJ",
      input_priority = "terciary",
      input_flow_limit = "300W",
      output_priority = "terciary",
      output_flow_limit = "300W"
    },
    picture =
    {
      filename = "__base__/graphics/entity/basic-accumulator/basic-accumulator.png",
      priority = "extra-high",
      width = 124,
      height = 103,
      shift = {0.7, -0.2}
    },
    charge_animation =
    {
      filename = "__base__/graphics/entity/basic-accumulator/basic-accumulator-charge-animation.png",
      frame_width = 138,
      frame_height = 135,
      line_length = 8,
      frame_count = 24,
      shift = {0.482, -0.638},
      animation_speed = 0.5
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation =
    {
      filename = "__base__/graphics/entity/basic-accumulator/basic-accumulator-discharge-animation.png",
      frame_width = 147,
      frame_height = 128,
      line_length = 8,
      frame_count = 24,
      shift = {0.395, -0.525},
      animation_speed = 0.5
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7}
  },
  {
    type = "furnace",
    name = "steel-furnace",
    icon = "__base__/graphics/icons/steel-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "steel-furnace"},
    max_health = 200,
    corpse = "medium-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    smelting_categories = {"smelting"},
    result_inventory_size = 1,
    smelting_energy_consumption = "180W",
    smelting_speed = 1,
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      effectivity = 1,
      emissions = 0.02,
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
    on_animation =
    {
      filename = "__base__/graphics/entity/steel-furnace/steel-furnace.png",
      priority = "high",
      frame_width = 91,
      frame_height = 69,
      frame_count = 1,
      shift = {0.5, 0.05 }
    },
    off_animation =
    {
      filename = "__base__/graphics/entity/steel-furnace/steel-furnace.png",
      priority = "high",
      frame_width = 91,
      frame_height = 69,
      frame_count = 1,
      shift = {0.5, 0.05 }
    },
    fire_animation =
    {
      filename = "__base__/graphics/entity/steel-furnace/steel-furnace-fire.png",
      priority = "high",
      frame_width = 36,
      frame_height = 19,
      frame_count = 12,
      shift = { -0.05, 0.65}
    },
    fast_replaceable_group = "furnace"
  },
  {
    type = "furnace",
    name = "electric-furnace",
    icon = "__base__/graphics/icons/electric-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "electric-furnace"},
    max_health = 150,
    corpse = "big-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    module_slots = 2,
    smelting_categories = {"smelting"},
    result_inventory_size = 1,
    smelting_speed = 1,
    smelting_energy_consumption = "180W",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      input_priority = "secondary",
      emissions = 0.005
    },
    on_animation =
    {
      filename = "__base__/graphics/entity/electric-furnace/electric-furnace.png",
      priority = "high",
      x = 131,
      frame_width = 131,
      frame_height = 102,
      frame_count = 12,
      animation_speed = 0.5,
      shift = {0.5, 0.05 }
    },
    off_animation =
    {
      filename = "__base__/graphics/entity/electric-furnace/electric-furnace.png",
      priority = "high",
      frame_width = 131,
      frame_height = 102,
      frame_count = 1,
      animation_speed = 0.5,
      shift = {0.5, 0.05 }
    },
    fast_replaceable_group = "furnace"
  },
  {
    type = "beacon",
    name = "basic-beacon",
    icon = "__base__/graphics/icons/basic-beacon.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "basic-beacon"},
    max_health = 200,
    corpse = "big-remnants",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    allowed_effects = {"consumption", "speed", "pollution"},
    animation =
    {
      filename = "__base__/graphics/entity/basic-beacon/basic-beacon.png",
      frame_width = 176,
      frame_height = 186,
      frame_count = 32,
      line_length = 6,
      shift = {1.2, 0.5},
      animation_speed = 1 / 3
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/basic-beacon/beacon-radius-visualization.png",
      width = 12,
      height = 12
    },
    supply_area_distance = 3,
    energy_source =
    {
      type = "electric",
      input_priority = "secondary"
    },
    energy_usage = "480W",
    distribution_effectivity = 0.5,
    num_module_slots = 2
  },
  {
    type = "smoke",
    name = "poison-cloud",
    animation =
    {
      filename = "__base__/graphics/entity/cloud/cloud-45-frames.png",
      priority = "low",
      frame_width = 256,
      frame_height = 256,
      frame_count = 45,
      animation_speed = 3,
      line_length = 7,
      scale = 3,
    },
    slow_down_factor = 0,
    wind_speed_factor = 0,
    cyclic = true,
    duration = 60 * 20,
    fade_away_duration = 2 * 60,
    spread_duration = 10,
    color = { r = 0.2, g = 0.9, b = 0.2 },
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            perimeter = 11,
            entity_flags = {"breaths-air"},
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 4, type = "poison"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
  {
    type = "combat-robot",
    name = "distractor",
    icon = "__base__/graphics/icons/logistic-robot.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid"},
    order="e-a-b",
    max_health = 90,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.9, -1.5}, {0.9, -0.5}},
    distance_per_frame = 0.13,
    time_to_live = 1800,
    speed = 0.01,
    destroy_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
            type = "create-entity",
            entity_name = "explosion"
        }
      }
    },
    attack_parameters =
    {
      ammo_category = "combat-robot-laser",
      cooldown = 20,
      damage_modifier = 0.5,
      projectile_center = {0, 0},
      projectile_creation_distance = 0.6,
      range = 15,
      sound =
      {
        {
          filename = "__base__/sound/laser.wav",
          volume = 0.4
        }
      },
      ammo_type =
      {
        category = "combat-robot-laser",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "laser",
            starting_speed = 0.3
          }
        }
      }
    },
    picture =
    {
      filename = "__base__/graphics/entity/combat-robot/distractor.png",
      priority = "high",
      width = 37,
      height = 34
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot/combat-robot-shadow.png",
      priority = "high",
      width = 52,
      height = 37
    }
  },
  {
    type = "combat-robot",
    name = "defender",
    icon = "__base__/graphics/icons/logistic-robot.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid"},
    order="e-a-a",
    max_health = 60,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    distance_per_frame = 0.13,
    time_to_live = 60 * 45,
    follows_player = true,
    friction = 0.01,
    range_from_player = 6.0,
    speed = 0.01,
    destroy_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
            type = "create-entity",
            entity_name = "explosion"
        }
      }
    },
    attack_parameters =
    {
      ammo_category = "bullet",
      cooldown = 20,
      projectile_center = {0, 0},
      projectile_creation_distance = 0.6,
      range = 15,
      sound =
      {
        {
          filename = "__base__/sound/gunshot.wav",
          volume = 0.3
        }
      },
      ammo_type =
      {
        category = "bullet",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              type = "create-entity",
              entity_name = "explosion-gunshot"
            },
            target_effects =
            {
              {
                type = "create-entity",
                entity_name = "explosion-gunshot"
              },
              {
                type = "damage",
                damage = { amount = 5 , type = "physical"}
              }
            }
          }
        }
      }
    },
    picture =
    {
      filename = "__base__/graphics/entity/combat-robot/defender.png",
      priority = "high",
      width = 37,
      height = 34
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot/combat-robot-shadow.png",
      priority = "high",
      width = 52,
      height = 37
    }
  },
  {
    type = "combat-robot",
    name = "destroyer",
    icon = "__base__/graphics/icons/logistic-robot.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid"},
    order="e-a-c",
    max_health = 60,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    distance_per_frame = 0.13,
    time_to_live = 60 * 60 * 2,
    speed = 0.01,
    follows_player = true,
    friction = 0.01,
    range_from_player = 6.0,
    destroy_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
            type = "create-entity",
            entity_name = "explosion"
        }
      }
    },
    attack_parameters =
    {
      ammo_category = "combat-robot-laser",
      cooldown = 20,
      projectile_center = {0, 0},
      projectile_creation_distance = 0.6,
      range = 15,
      sound =
      {
        {
          filename = "__base__/sound/laser.wav",
          volume = 0.4
        }
      },
      ammo_type =
      {
        category = "combat-robot-laser",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "blue-laser",
            starting_speed = 0.3
          }
        }
      }
    },
    picture =
    {
      filename = "__base__/graphics/entity/combat-robot/destroyer.png",
      priority = "high",
      width = 37,
      height = 34
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot/combat-robot-shadow.png",
      priority = "high",
      width = 52,
      height = 37
    }
  },
  {
    type = "sticker",
    name = "slowdown-sticker",
    --icon = "__base__/graphics/icons/slowdown-sticker.png",
    flags = {},
    animation =
    {
      filename = "__base__/graphics/entity/slowdown-sticker/slowdown-sticker.png",
      priority = "extra-high",
      frame_width = 11,
      frame_height = 11,
      frame_count = 13,
      animation_speed = 0.4
    },
    duration_in_ticks = 30 * 60,
    magnitude = 0.5
  }
}
)

data:extend(
{
  {
    type = "resource",
    name = "copper-ore",
    icon = "__base__/graphics/icons/copper-ore.png",
    flags = {"placeable-neutral"},
    minable =
    {
      hardness = 0.9,
      mining_particle = "copper-ore-particle",
      mining_time = 2,
      result = "copper-ore"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    default_generator_settings =
    {
      frequency = "frequent",
      richness = "good",
      size = "medium"
    },
    stage_counts = {1000, 600, 400, 200, 100, 50, 20, 1},
    stages =
    {
      filename = "__base__/graphics/entity/copper-ore/copper-ore.png",
      priority = "extra-high",
      frame_width = 38,
      frame_height = 38,
      frame_count = 4,
      direction_count = 8
    },
    map_color={r=0.803, g=0.388, b=0.215}
  },
  {
    type = "resource",
    name = "iron-ore",
    icon = "__base__/graphics/icons/iron-ore.png",
    flags = {"placeable-neutral"},
    minable =
    {
      hardness = 0.9,
      mining_particle = "iron-ore-particle",
      mining_time = 2,
      result = "iron-ore"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    default_generator_settings =
    {
      frequency = "frequent",
      richness = "good",
      size = "medium"
    },
    stage_counts = {1000, 600, 400, 200, 100, 50, 20, 1},
    stages =
    {
      filename = "__base__/graphics/entity/iron-ore/iron-ore.png",
      priority = "extra-high",
      frame_width = 38,
      frame_height = 38,
      frame_count = 4,
      direction_count = 8
    },
    map_color={r=0.337, g=0.419, b=0.427}
  },
  {
    type = "resource",
    name = "coal",
    icon = "__base__/graphics/icons/coal.png",
    flags = {"placeable-neutral"},
    minable =
    {
      hardness = 0.9,
      mining_particle = "coal-particle",
      mining_time = 2,
      result = "coal"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    default_generator_settings =
    {
      frequency = "frequent",
      richness = "very-good",
      size = "medium"
    },
    stage_counts = {1000, 600, 400, 200, 100, 50, 20, 1},
    stages =
    {
      filename = "__base__/graphics/entity/coal/coal.png",
      priority = "extra-high",
      frame_width = 38,
      frame_height = 38,
      frame_count = 4,
      direction_count = 8
    },
    map_color={r=0.241, g=0.233, b=0.15}
  },
  {
    type = "resource",
    name = "stone",
    icon = "__base__/graphics/icons/stone.png",
    flags = {"placeable-neutral"},
    minable =
    {
      hardness = 0.4,
      mining_particle = "stone-particle",
      mining_time = 2,
      result = "stone"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    default_generator_settings =
    {
      frequency = "rare",
      richness = "regular",
      size = "small"
    },
    stage_counts = {1000, 600, 400, 200, 100, 50, 20, 1},
    stages =
    {
      filename = "__base__/graphics/entity/stone/stone.png",
      priority = "extra-high",
      frame_width = 38,
      frame_height = 38,
      frame_count = 4,
      direction_count = 8
    },
    map_color={r=0.478, g=0.450, b=0.317}
  }
}
)

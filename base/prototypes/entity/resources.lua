
data:extend(
{
  {
    type = "resource",
    name = "crude-oil",
    icon = "__base__/graphics/icons/crude-oil.png",
    icon_size = 32,
    flags = {"placeable-neutral"},
    category = "basic-fluid",
    order="a-b-a",
    infinite = true,
    highlight = true,
    minimum = 60000,
    normal = 300000,
    infinite_depletion_amount = 10,
    resource_patch_search_radius = 12,
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      hardness = 1,
      mining_time = 1,
      results =
      {
        {
          type = "fluid",
          name = "crude-oil",
          amount_min = 10,
          amount_max = 10,
          probability = 1
        }
      }
    },
    collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace =
    {
      order = "b",
      control = "crude-oil",
      sharpness = 0.99,
      max_probability = 0.02,
      richness_base = 240000,
      richness_multiplier = 300000,
      richness_multiplier_distance_bonus = 1500,
      coverage = 0.001 / 3,
      peaks =
      {
        {
          noise_layer = "crude-oil",
          noise_octaves_difference = -0.5,
          noise_persistence = 0.4
        }
      }
    },
    stage_counts = {0},
    stages =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/crude-oil/crude-oil.png",
        priority = "extra-high",
        width = 75,
        height = 61,
        frame_count = 4,
        variation_count = 1
      }
    },
    map_color = {r=0.78, g=0.2, b=0.77},
    map_grid = false
  },
  {
    type = "resource",
    name = "uranium-ore",
    icon = "__base__/graphics/icons/uranium-ore.png",
    icon_size = 32,
    flags = {"placeable-neutral"},
    order="a-b-e",
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      hardness = 0.9,
      mining_particle = "stone-particle",
      mining_time = 4,
      result = "uranium-ore",
      fluid_amount = 10,
      required_fluid = "sulfuric-acid"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace =
    {
      order = "c",
      control = "uranium-ore",
      sharpness = 1,
      richness_multiplier = 3000,
      richness_multiplier_distance_bonus = 30,
      richness_base = 500,
      coverage = 0.0003 / 2,
      peaks =
      {
        {
          noise_layer = "uranium-ore",
          noise_octaves_difference = -0.85,
          noise_persistence = 0.4
        },
        --no uranium in the starting area
        {
          influence = -1.0,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2
        },

      },
      --starting_area_size = 600 * 0.005,
      --starting_area_amount = 600
    },
    stage_counts = {10000, 5200, 2600, 1800, 1200, 800, 400, 80},
    stages =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/uranium-ore/uranium-ore.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        frame_count = 8,
        variation_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/uranium-ore/hr-uranium-ore.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5
        }
      }
    },
    stages_effect =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/uranium-ore/uranium-ore-glow.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        frame_count = 8,
        variation_count = 8,
        blend_mode = "additive",
        flags = {"light"},
        hr_version =
        {
          filename = "__base__/graphics/entity/uranium-ore/hr-uranium-ore-glow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5,
          blend_mode = "additive",
          flags = {"light"}
        }
      }
    },
    effect_animation_period = 5,
    effect_animation_period_deviation = 1,
    effect_darkness_multiplier = 3.6,
    min_effect_alpha = 0.2,
    max_effect_alpha = 0.3,
    map_color = {r=0, g=0.7, b=0}
  }
})

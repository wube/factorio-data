local noise = require("noise");
local tne = noise.to_noise_expression;
local resource_autoplace = require("prototypes.entity.demo-resource-autoplace");

-- Pre-spot noise
local oil_old_autoplace =
{
  order = "b",
  control = "crude-oil",
  -- probability_expression = oil_probability,
  -- richness_expression = (oil_probability + 240000) * 300000,
  -- richness_expression should be probability_expression + some amount probably
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
};

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
    -- autoplace = oil_old_autoplace,
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "crude-oil",
      order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
      base_density = 8.2,
      base_spots_per_km2 = 1.8,
      random_probability = 1/48,
      random_spot_size_minimum = 1,
      random_spot_size_maximum = 1, -- don't randomize spot size
      additional_richness = 220000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
      has_starting_area_placement = false,
      resource_index = resource_autoplace.get_next_resource_index(),
      regular_rq_factor_multiplier = 1
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
      mining_particle = "stone-particle",
      mining_time = 2,
      result = "uranium-ore",
      fluid_amount = 10,
      required_fluid = "sulfuric-acid"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "uranium-ore",
      order = "c",
      base_density = 0.9,
      base_spots_per_km2 = 1.25,
      has_starting_area_placement = false,
      random_spot_size_minimum = 2,
      random_spot_size_maximum = 4,
      resource_index = resource_autoplace.get_next_resource_index(),
      regular_rq_factor_multiplier = 1
    },
    stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50},
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

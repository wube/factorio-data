local noise = require("noise")
local tne = noise.to_noise_expression
local resource_autoplace = require("resource-autoplace")
local sounds = require ("prototypes.entity.demo-sounds")

-- Initialize the core patch sets in a predictable order
resource_autoplace.initialize_patch_set("iron-ore", true)
resource_autoplace.initialize_patch_set("copper-ore", true)
resource_autoplace.initialize_patch_set("coal", true)
resource_autoplace.initialize_patch_set("stone", true)
resource_autoplace.initialize_patch_set("crude-oil", false)
resource_autoplace.initialize_patch_set("uranium-ore", false)

local function autoplace_settings(name, order, coverage)
  return
  {
    order = order,
    control = name,
    sharpness = 15/16,
    richness_multiplier = 1500,
    richness_multiplier_distance_bonus = 20,
    richness_base = 10,
    coverage = coverage,
    peaks =
    {
      {
        noise_layer = name,
        noise_octaves_difference = -0.85,
        noise_persistence = 0.4
      }
    },
    starting_area_size = 5500 * coverage,
    starting_area_amount = 1600
  }
end

local function resource(resource_parameters, autoplace_parameters)
  if coverage == nil then coverage = 0.02 end

  return
  {
    type = "resource",
    name = resource_parameters.name,
    icon = "__base__/graphics/icons/" .. resource_parameters.name .. ".png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = {"placeable-neutral"},
    order="a-b-"..resource_parameters.order,
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_particle = resource_parameters.name .. "-particle",
      mining_time = resource_parameters.mining_time,
      result = resource_parameters.name
    },
    walking_sound = resource_parameters.walking_sound,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    -- autoplace = autoplace_settings(name, order, coverage),
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = resource_parameters.name,
      order = resource_parameters.order,
      base_density = autoplace_parameters.base_density,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = autoplace_parameters.regular_rq_factor_multiplier,
      starting_rq_factor_multiplier = autoplace_parameters.starting_rq_factor_multiplier,
      candidate_spot_count = autoplace_parameters.candidate_spot_count,
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/" .. resource_parameters.name .. "/" .. resource_parameters.name .. ".png",
        priority = "extra-high",
        size = 64,
        frame_count = 8,
        variation_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/" .. resource_parameters.name .. "/hr-" .. resource_parameters.name .. ".png",
          priority = "extra-high",
          size = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5
        }
      }
    },
    map_color = resource_parameters.map_color,
    mining_visualisation_tint = resource_parameters.mining_visualisation_tint
  }
end

data:extend({
          -- Usually earlier order takes priority, but there's some special
          -- case buried in the code about resources removing other things
          -- (though maybe there shouldn't be, and we should just place things in a different order).
          -- Trees are "a", and resources will delete trees when placed.
          -- Oil is "c" so won't be placed if another resource is already there.
          -- "d" is available for another resource, but isn't used for now.

  resource(
    {
      name = "iron-ore",
      order = "b",
      map_color = {0.415, 0.525, 0.580},
      mining_time = 1,
      walking_sound = sounds.ore,
      mining_visualisation_tint = {r = 0.895, g = 0.965, b = 1.000, a = 1.000}, -- #e4f6ffff
    },
    {
      base_density = 10,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.5,
      candidate_spot_count = 22, -- To match 0.17.50 placement
    }
  ),
  resource(
    {
      name = "copper-ore",
      order = "b",
      map_color = {0.803, 0.388, 0.215},
      mining_time = 1,
      walking_sound = sounds.ore,
      mining_visualisation_tint = {r = 1.000, g = 0.675, b = 0.541, a = 1.000}, -- #ffac89ff
    },
    {
      base_density = 8,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.2,
      candidate_spot_count = 22, -- To match 0.17.50 placement
    }
  ),
  resource(
    {
      name = "coal",
      order = "b",
      map_color = {0, 0, 0},
      mining_visualisation_tint = {0, 0, 0},
      mining_time = 1,
      walking_sound = sounds.ore,
      mining_visualisation_tint = {r = 0.465, g = 0.465, b = 0.465, a = 1.000}, -- #767676ff
    },
    {
      base_density = 8,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1
    }
  ),
  resource(
    {
      name = "stone",
      order = "b",
      map_color = {0.690, 0.611, 0.427},
      mining_time = 1,
      walking_sound = sounds.ore,
      mining_visualisation_tint = {r = 0.984, g = 0.883, b = 0.646, a = 1.000}, -- #fae1a4ff
    },
    {
      base_density = 4,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1
    }
  ),

  {
    type = "resource",
    name = "uranium-ore",
    icon = "__base__/graphics/icons/uranium-ore.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = {"placeable-neutral"},
    order="a-b-e",
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    walking_sound = sounds.ore,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      result = "uranium-ore",
      fluid_amount = (not data.is_demo and 10) or nil,
      required_fluid = (not data.is_demo and "sulfuric-acid") or nil
    },
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "uranium-ore",
      order = "c",
      base_density = 0.9,
      base_spots_per_km2 = 1.25,
      has_starting_area_placement = false,
      random_spot_size_minimum = 2,
      random_spot_size_maximum = 4,
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
    mining_visualisation_tint = {r = 0.814, g = 1.000, b = 0.499, a = 1.000}, -- #cfff7fff
    map_color = {0, 0.7, 0}
  }
})

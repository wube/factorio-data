local function autoplace_settings(name, order, coverage)
  local ret = {
    order = order,
    control = name,
    sharpness = 15/16,
    richness_multiplier = 1500,
    richness_multiplier_distance_bonus = 20,
    richness_base = 10,
    coverage = coverage,
    peaks = {
      {
        noise_layer = name,
        noise_octaves_difference = -0.85,
        noise_persistence = 0.4,
      },
    },
    starting_area_size = 5500 * coverage,
    starting_area_amount = 1600
  }
  
  return ret
end

local function resource(name, order, map_color, hardness, coverage)
  if hardness == nil then hardness = 0.9 end
  if coverage == nil then coverage = 0.02 end
  return {
    type = "resource",
    name = name,
    icon = "__base__/graphics/icons/" .. name .. ".png",
    icon_size = 32,
    flags = {"placeable-neutral"},
    order="a-b-"..order,
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      hardness = hardness,
      mining_particle = name .. "-particle",
      mining_time = 2,
      result = name
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace = autoplace_settings(name, order, coverage),
    stage_counts = {15000, 8000, 4000, 2000, 1000, 500, 200, 80},
    stages =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/" .. name .. "/" .. name .. ".png",
        priority = "extra-high",
        width = 64,
        height = 64,
        frame_count = 8,
        variation_count = 8,
        hr_version =
          {
          filename = "__base__/graphics/entity/" .. name .. "/hr-" .. name .. ".png",
          priority = "extra-high",
          width = 128,
          height = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5
          }
      }
    },
    map_color = map_color
  }
end

data:extend(
{
  --trees are "a", so resources can delete trees when placed
  --oil is "b"
  --uranium is "c"
  resource("iron-ore",   "d", {r=0.337, g=0.419, b=0.427}, nil, (0.006 / 3) / 1.1 * 1.49  ), -- 1.1 compensates for overlapping. 1.49 is the expected ratio of iron to copper
  resource("copper-ore", "e", {r=0.803, g=0.388, b=0.215}, nil, 0.006 / 3),
  resource("coal",       "f", {r=0, g=0, b=0},             nil, 0.0045 / 3),
  resource("stone",      "g", {r=0.478, g=0.450, b=0.317}, 0.4, 0.0023 / 3)
}
)

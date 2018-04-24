local function autoplace_settings(name, coverage)
  local ret = {
    control = name,
    sharpness = 1,
    richness_multiplier = 1500,
    richness_multiplier_distance_bonus = 30,
    richness_base = 500,
    coverage = coverage,
    peaks = {
      {
        noise_layer = name,
        noise_octaves_difference = -1.5,
        noise_persistence = 0.3,
      },
    }
  }
  for i, resource in ipairs({ "copper-ore", "iron-ore", "coal", "stone" }) do
    if resource ~= name then
      ret.starting_area_size = 600 * coverage
      ret.starting_area_amount = 1500
    end
  end
  return ret
end

local function resource(name, map_color, hardness, coverage)
  if hardness == nil then hardness = 0.9 end
  if coverage == nil then coverage = 0.02 end
  return {
    type = "resource",
    name = name,
    icon = "__base__/graphics/icons/" .. name .. ".png",
    flags = {"placeable-neutral"},
    order="a-b-a",
    minable =
    {
      hardness = hardness,
      mining_particle = name .. "-particle",
      mining_time = 2,
      result = name
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace = autoplace_settings(name, coverage),
    stage_counts = {5000, 3000, 1500, 800, 400, 100, 50, 10},
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
  resource("copper-ore", {r=0.803, g=0.388, b=0.215}),
  resource("iron-ore", {r=0.337, g=0.419, b=0.427}),
  resource("coal", {r=0, g=0, b=0}),
  resource("stone", {r=0.478, g=0.450, b=0.317},
    0.4, --hardness
    0.015 --coverage
  )
}
)

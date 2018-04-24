data:extend(
{
  {
    type = "recipe",
    name = "piercing-rounds-magazine",
    enabled = false,
    energy_required = 3,
    ingredients =
    {
      {"firearm-magazine", 1},
      {"steel-plate", 1},
      {"copper-plate", 5}
    },
    result = "piercing-rounds-magazine"
  },
  {
    type = "recipe",
    name = "uranium-rounds-magazine",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"piercing-rounds-magazine", 1},
      {"uranium-238", 1}
    },
    result = "uranium-rounds-magazine"
  },
  {
    type = "recipe",
    name = "rocket",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {"electronic-circuit", 1},
      {"explosives", 1},
      {"iron-plate", 2}
    },
    result = "rocket"
  },
  {
    type = "recipe",
    name = "explosive-rocket",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {"rocket", 1},
      {"explosives", 2}
    },
    result = "explosive-rocket"
  },
  {
    type = "recipe",
    name = "atomic-bomb",
    enabled = false,
    energy_required = 50,
    ingredients =
    {
      {"processing-unit", 20},
      {"explosives", 10},
      {"uranium-235", 30}
    },
    result = "atomic-bomb"
  },
  {
    type = "recipe",
    name = "shotgun-shell",
    enabled = false,
    energy_required = 3,
    ingredients =
    {
      {"copper-plate", 2},
      {"iron-plate", 2}
    },
    result = "shotgun-shell"
  },
  {
    type = "recipe",
    name = "piercing-shotgun-shell",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {"shotgun-shell", 2},
      {"copper-plate", 5},
      {"steel-plate", 2}
    },
    result = "piercing-shotgun-shell"
  },
  {
    type = "recipe",
    name = "railgun-dart",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {"steel-plate", 5},
      {"electronic-circuit", 5}
    },
    result = "railgun-dart"
  },
  {
    type = "recipe",
    name = "cannon-shell",
    normal =
    {
      enabled = false,
      energy_required = 8,
      ingredients =
      {
        {"steel-plate", 2},
        {"plastic-bar", 2},
        {"explosives", 1},
      },
      result = "cannon-shell",
    },
    expensive =
    {
      enabled = false,
      energy_required = 8,
      ingredients =
      {
        {"steel-plate", 4},
        {"plastic-bar", 4},
        {"explosives", 1},
      },
      result = "cannon-shell",
    }
  },
  {
    type = "recipe",
    name = "explosive-cannon-shell",
    normal =
    {
      enabled = false,
      energy_required = 8,
      ingredients =
      {
        {"steel-plate", 2},
        {"plastic-bar", 2},
        {"explosives", 2},
      },
      result = "explosive-cannon-shell"
    },
    expensive =
    {
      enabled = false,
      energy_required = 8,
      ingredients =
      {
        {"steel-plate", 4},
        {"plastic-bar", 4},
        {"explosives", 2},
      },
      result = "explosive-cannon-shell"
    },
  },
  {
    type = "recipe",
    name = "uranium-cannon-shell",
    enabled = false,
    energy_required = 12,
    ingredients =
    {
      {"cannon-shell", 1},
      {"uranium-238", 1}
    },
    result = "uranium-cannon-shell"
  },
  {
    type = "recipe",
    name = "explosive-uranium-cannon-shell",
    enabled = false,
    energy_required = 12,
    ingredients =
    {
      {"explosive-cannon-shell", 1},
      {"uranium-238", 1}
    },
    result = "explosive-uranium-cannon-shell"
  },
  {
    type = "recipe",
    name = "flamethrower-ammo",
    category = "chemistry",
    enabled = false,
    energy_required = 6,
    ingredients =
    {
      {type="item", name="steel-plate", amount=5},
      {type="fluid", name="light-oil", amount=50},
      {type="fluid", name="heavy-oil", amount=50}
    },
    result = "flamethrower-ammo",
    crafting_machine_tint =
    {
      primary = {r = 0.845, g = 0.533, b = 0.000, a = 0.000}, -- #d7870000
      secondary = {r = 0.655, g = 0.000, b = 0.000, a = 0.000}, -- #a7000000
      tertiary = {r = 0.685, g = 0.329, b = 0.000, a = 0.000}, -- #ae530000
    }
  }
}
)

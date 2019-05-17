data:extend(
{
  {
    type = "recipe",
    name = "copper-plate",
    category = "smelting",
    energy_required = 3.2,
    ingredients = {{ "copper-ore", 1}},
    result = "copper-plate"
  },
  {
    type = "recipe",
    name = "iron-plate",
    category = "smelting",
    energy_required = 3.2,
    ingredients = {{"iron-ore", 1}},
    result = "iron-plate"
  },
  {
    type = "recipe",
    name = "stone-brick",
    category = "smelting",
    energy_required = 3.2,
    enabled = true,
    ingredients = {{"stone", 2}},
    result = "stone-brick"
  },
  {
    type = "recipe",
    name = "steel-plate",
    category = "smelting",
    normal =
    {
      enabled = false,
      energy_required = 16,
      ingredients = {{"iron-plate", 5}},
      result = "steel-plate"
    },
    expensive =
    {
      enabled = false,
      energy_required = 32,
      ingredients = {{"iron-plate", 10}},
      result = "steel-plate"
    }
  }
}
)

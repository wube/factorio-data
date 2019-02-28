data:extend(
{
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

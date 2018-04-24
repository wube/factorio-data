data:extend(
{
  {
    type = "recipe",
    name = "steel-plate",
    category = "smelting",
    normal =
    {
      enabled = false,
      energy_required = 17.5,
      ingredients = {{"iron-plate", 5}},
      result = "steel-plate"
    },
    expensive =
    {
      enabled = false,
      energy_required = 35,
      ingredients = {{"iron-plate", 10}},
      result = "steel-plate"
    }
  }
}
)

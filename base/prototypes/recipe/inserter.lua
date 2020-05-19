data:extend(
{
  {
    type = "recipe",
    name = "stack-inserter",
    enabled = false,
    ingredients =
    {
      {"iron-gear-wheel", 15},
      {"electronic-circuit", 15},
      {"advanced-circuit", 1},
      {"fast-inserter", 1}
    },
    result = "stack-inserter"
  },
  {
    type = "recipe",
    name = "stack-filter-inserter",
    enabled = false,
    ingredients =
    {
      {"stack-inserter", 1},
      {"electronic-circuit", 5}
    },
    result = "stack-filter-inserter"
  }
}
)

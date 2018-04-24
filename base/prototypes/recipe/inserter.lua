data:extend(
{
  {
    type = "recipe",
    name = "long-handed-inserter",
    enabled = false,
    ingredients =
    {
      {"iron-gear-wheel", 1},
      {"iron-plate", 1},
      {"inserter", 1}
    },
    result = "long-handed-inserter",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "fast-inserter",
    enabled = false,
    ingredients =
    {
      {"electronic-circuit", 2},
      {"iron-plate", 2},
      {"inserter", 1}
    },
    result = "fast-inserter",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "filter-inserter",
    enabled = false,
    ingredients =
    {
      {"fast-inserter", 1},
      {"electronic-circuit", 4}
    },
    result = "filter-inserter",
    requester_paste_multiplier = 4
  },
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
    result = "stack-inserter",
    requester_paste_multiplier = 4
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
    result = "stack-filter-inserter",
    requester_paste_multiplier = 4
  }
}
)

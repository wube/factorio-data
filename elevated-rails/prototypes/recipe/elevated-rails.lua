data:extend
(
  {
    {
      type = "recipe",
      name = "rail-support",
      enabled = false,
      ingredients =
      {
        {type = "item", name = "refined-concrete", amount = 20},
        {type = "item", name = "steel-plate", amount = 10}
      },
      results = {{type="item", name="rail-support", amount=1}}
    },
    {
      type = "recipe",
      name = "rail-ramp",
      enabled = false,
      ingredients =
      {
        {type = "item", name = "refined-concrete", amount = 100},
        {type = "item", name = "rail", amount = 8},
        {type = "item", name = "steel-plate", amount = 10}
      },
      results = {{type="item", name="rail-ramp", amount=1}}
    }
  })
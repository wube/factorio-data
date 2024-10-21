data:extend
({
  {
    type = "recipe",
    name = "quality-module",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "electronic-circuit", amount = 5},
      {type = "item", name = "advanced-circuit", amount = 5},
    },
    energy_required = 15,
    results = {{type="item", name="quality-module", amount=1}}
  },
  {
    type = "recipe",
    name = "quality-module-2",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "quality-module", amount = 4},
      {type = "item", name = "advanced-circuit", amount = 5},
      {type = "item", name = "processing-unit", amount = 5},
    },
    energy_required = 30,
    results = {{type="item", name="quality-module-2", amount=1}}
  },
  {
    type = "recipe",
    name = "quality-module-3",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "quality-module-2", amount = 4},
      {type = "item", name = "advanced-circuit", amount = 5},
      {type = "item", name = "processing-unit", amount = 5}
    },
    energy_required = 60,
    results = {{type="item", name="quality-module-3", amount=1}}
  },
  {
    type = "recipe",
    name = "recycler",
    ingredients =
    {
      {type = "item", name = "processing-unit", amount = 6},
      {type = "item", name = "steel-plate", amount = 20},
      {type = "item", name = "iron-gear-wheel", amount = 40},
      {type = "item", name = "concrete", amount = 20}
    },
    results = {{type="item", name="recycler", amount=1}},
    energy_required = 3,
    enabled = false
  }
})

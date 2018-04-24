

data:extend(
{
  {
    type = "recipe",
    name = "basic-oil-processing",
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="crude-oil", amount=100}
    },
    results=
    {
      {type="fluid", name="heavy-oil", amount=30},
      {type="fluid", name="light-oil", amount=30},
      {type="fluid", name="petroleum-gas", amount=40}
    },
    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-a[basic-oil-processing]"
  },

  {
    type = "recipe",
    name = "advanced-oil-processing",
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="water", amount=50},
      {type="fluid", name="crude-oil", amount=100}
    },
    results=
    {
      {type="fluid", name="heavy-oil", amount=10},
      {type="fluid", name="light-oil", amount=45},
      {type="fluid", name="petroleum-gas", amount=55}
    },
    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-b[advanced-oil-processing]"
  },

  {
    type = "recipe",
    name = "coal-liquefaction",
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type="item", name="coal", amount=10},
      {type="fluid", name="heavy-oil", amount=25},
      {type="fluid", name="steam", amount=50}
    },
    results=
    {
      {type="fluid", name="heavy-oil", amount=35},
      {type="fluid", name="light-oil", amount=15},
      {type="fluid", name="petroleum-gas", amount=20}
    },
    icon = "__base__/graphics/icons/fluid/coal-liquefaction.png",
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-c[coal-liquefaction]",
    allow_decomposition = false
  },

  {
    type = "recipe",
    name = "heavy-oil-cracking",
    category = "chemistry",
    enabled = false,
    energy_required = 3,
    ingredients =
    {
      {type="fluid", name="water", amount=30},
      {type="fluid", name="heavy-oil", amount=40}
    },
    results=
    {
      {type="fluid", name="light-oil", amount=30}
    },
    main_product= "",
    icon = "__base__/graphics/icons/fluid/heavy-oil-cracking.png",
    subgroup = "fluid-recipes",
    order = "b[fluid-chemistry]-a[heavy-oil-cracking]",
    crafting_machine_tint =
    {
      primary = {r = 0.290, g = 0.027, b = 0.000, a = 0.000}, -- #49060000
      secondary = {r = 0.722, g = 0.465, b = 0.190, a = 0.000}, -- #b8763000
      tertiary = {r = 0.870, g = 0.365, b = 0.000, a = 0.000}, -- #dd5d0000
    }
  },

  {
    type = "recipe",
    name = "light-oil-cracking",
    category = "chemistry",
    enabled = false,
    energy_required = 3,
    ingredients =
    {
      {type="fluid", name="water", amount=30},
      {type="fluid", name="light-oil", amount=30}
    },
    results=
    {
      {type="fluid", name="petroleum-gas", amount=20}
    },
    main_product= "",
    icon = "__base__/graphics/icons/fluid/light-oil-cracking.png",
    subgroup = "fluid-recipes",
    order = "b[fluid-chemistry]-b[light-oil-cracking]",
    crafting_machine_tint =
    {
      primary = {r = 0.785, g = 0.406, b = 0.000, a = 0.000}, -- #c8670000
      secondary = {r = 0.795, g = 0.805, b = 0.605, a = 0.000}, -- #cacd9a00
      tertiary = {r = 0.835, g = 0.551, b = 0.000, a = 0.000}, -- #d48c0000
    }
  },

  {
    type = "recipe",
    name = "sulfuric-acid",
    category = "chemistry",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {type="item", name="sulfur", amount=5},
      {type="item", name="iron-plate", amount=1},
      {type="fluid", name="water", amount=100}
    },
    results=
    {
      {type="fluid", name="sulfuric-acid", amount=50}
    },
    subgroup = "fluid-recipes",
    crafting_machine_tint =
    {
      primary = {r = 0.875, g = 0.735, b = 0.000, a = 0.000}, -- #dfbb0000
      secondary = {r = 0.103, g = 0.940, b = 0.000, a = 0.000}, -- #1aef0000
      tertiary = {r = 0.564, g = 0.795, b = 0.000, a = 0.000}, -- #8fca0000
    }
  },

  {
    type = "recipe",
    name = "plastic-bar",
    category = "chemistry",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {type="fluid", name="petroleum-gas", amount=20},
      {type="item", name="coal", amount=1}
    },
    results=
    {
      {type="item", name="plastic-bar", amount=2}
    },
    requester_paste_multiplier = 4,
    crafting_machine_tint =
    {
      primary = {r = 0.498, g = 0.498, b = 0.498, a = 0.000}, -- #7f7f7f00
      secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
      tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
    }
  },

  {
    type = "recipe",
    name = "solid-fuel-from-light-oil",
    category = "chemistry",
    energy_required = 3,
    ingredients =
    {
      {type="fluid", name="light-oil", amount=10}
    },
    results=
    {
      {type="item", name="solid-fuel", amount=1}
    },
    icon = "__base__/graphics/icons/solid-fuel-from-light-oil.png",
    subgroup = "fluid-recipes",
    enabled = false,
    order = "b[fluid-chemistry]-c[solid-fuel-from-light-oil]",
    crafting_machine_tint =
    {
      primary = {r = 0.270, g = 0.122, b = 0.000, a = 0.000}, -- #441f0000
      secondary = {r = 0.735, g = 0.546, b = 0.325, a = 0.000}, -- #bb8b5200
      tertiary = {r = 0.610, g = 0.348, b = 0.000, a = 0.000}, -- #9b580000
    }
  },

  {
    type = "recipe",
    name = "solid-fuel-from-petroleum-gas",
    category = "chemistry",
    energy_required = 3,
    ingredients =
    {
      {type="fluid", name="petroleum-gas", amount=20}
    },
    results=
    {
      {type="item", name="solid-fuel", amount=1}
    },
    icon = "__base__/graphics/icons/solid-fuel-from-petroleum-gas.png",
    subgroup = "fluid-recipes",
    enabled = false,
    order = "b[fluid-chemistry]-d[solid-fuel-from-petroleum-gas]",
    crafting_machine_tint =
    {
      primary = {r = 0.331, g = 0.075, b = 0.510, a = 0.000}, -- #54138200
      secondary = {r = 0.589, g = 0.540, b = 0.615, a = 0.361}, -- #96899c5c
      tertiary = {r = 0.469, g = 0.145, b = 0.695, a = 0.000}, -- #7724b100
    }
  },

  {
    type = "recipe",
    name = "solid-fuel-from-heavy-oil",
    category = "chemistry",
    energy_required = 3,
    ingredients =
    {
      {type="fluid", name="heavy-oil", amount=20}
    },
    results=
    {
      {type="item", name="solid-fuel", amount=1}
    },
    icon = "__base__/graphics/icons/solid-fuel-from-heavy-oil.png",
    subgroup = "fluid-recipes",
    enabled = false,
    order = "b[fluid-chemistry]-e[solid-fuel-from-heavy-oil]",
    crafting_machine_tint =
    {
      primary = {r = 0.160, g = 0.095, b = 0.095, a = 0.000}, -- #28181800
      secondary = {r = 0.470, g = 0.215, b = 0.190, a = 0.000}, -- #77363000
      tertiary = {r = 0.435, g = 0.144, b = 0.135, a = 0.000}, -- #6e242200
    }
  },


  {
    type = "recipe",
    name = "sulfur",
    category = "chemistry",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {type="fluid", name="water", amount=30},
      {type="fluid", name="petroleum-gas", amount=30}
    },
    results=
    {
      {type="item", name="sulfur", amount=2}
    },
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.659, b = 0.000, a = 0.000}, -- #ffa70000
      secondary = {r = 0.812, g = 1.000, b = 0.000, a = 0.000}, -- #cfff0000
      tertiary = {r = 0.960, g = 0.806, b = 0.000, a = 0.000}, -- #f4cd0000
    }
  },

  {
    type = "recipe",
    name = "lubricant",
    category = "chemistry",
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {type="fluid", name="heavy-oil", amount=10}
    },
    results=
    {
      {type="fluid", name="lubricant", amount=10}
    },
    subgroup = "fluid-recipes",
    crafting_machine_tint =
    {
      primary = {r = 0.000, g = 0.260, b = 0.010, a = 0.000}, -- #00420200
      secondary = {r = 0.071, g = 0.640, b = 0.000, a = 0.000}, -- #12a30000
      tertiary = {r = 0.026, g = 0.520, b = 0.000, a = 0.000}, -- #06840000
    }
  },

  {
    type = "recipe",
    name = "empty-barrel",
    category = "crafting",
    energy_required = 1,
    subgroup = "intermediate-product",
    enabled = false,
    ingredients =
    {
      {type="item", name="steel-plate", amount=1},
    },
    results=
    {
      {type="item", name="empty-barrel", amount=1}
    },
  }
})

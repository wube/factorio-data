local seconds = 60
local minutes = 60*seconds

data:extend(
{
  {
    type = "recipe",
    name = "simple-coal-liquefaction",
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "coal", amount = 10},
      {type = "item", name = "calcite", amount = 2},
      {type = "fluid", name = "sulfuric-acid", amount = 25},
    },
    results=
    {
      {type="fluid", name="heavy-oil", amount=50}
    },
    allow_productivity = true,
    icon = "__space-age__/graphics/icons/fluid/simple-coal-liquefaction.png",
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-c[coal-liquefaction]",
    allow_decomposition = false,
    show_amount_in_title = false
  },

  ----------------------- gleba seeds
  {
    type = "recipe",
    name = "yumako-processing",
    icon = "__space-age__/graphics/icons/yumako-processing.png",
    category = "organic-or-hand-crafting",
    subgroup = "agriculture-processes",
    order = "a[seeds]-a[yumako-processing]",
    enabled = false,
    allow_productivity = true,
    energy_required = 1,
    ingredients = {{type = "item", name = "yumako", amount = 1}},
    results =
    {
      {type = "item", name = "yumako-seed", amount = 1, probability = 0.02},
      {type = "item", name = "yumako-mash", amount = 2}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.976, g = 0.006, b = 0.310, a = 1.000},
      secondary = {r = 0.805, g = 0.701, b = 0.293, a = 1.000},

    }
  },
  {
    type = "recipe",
    name = "jellynut-processing",
    icon = "__space-age__/graphics/icons/jellynut-processing.png",
    category = "organic-or-hand-crafting",
    subgroup = "agriculture-processes",
    order = "a[seeds]-b[jellynut-processing]",
    enabled = false,
    allow_productivity = true,
    energy_required = 1,
    ingredients =
    {
      {type = "item", name = "jellynut", amount = 1},
    },
    results =
    {
      {type = "item", name = "jellynut-seed", amount = 1, probability = 0.02 },
      {type = "item", name = "jelly", amount = 4}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.405, g = 0.701, b = 0.693, a = 1.000},
      secondary = {r = 0.876, g = 0.406, b = 0.710, a = 1.000},
    }
  },

  {
    type = "recipe",
    name = "copper-bacteria",
    icon = "__space-age__/graphics/icons/copper-bacteria.png",
    category = "organic-or-hand-crafting",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    subgroup = "agriculture-processes",
    order = "e[bacteria]-a[bacteria]-b[copper]",
    enabled = false,
    allow_productivity = true,
    energy_required = 1,
    ingredients =
    {
      {type = "item", name = "yumako-mash", amount = 3},
    },
    results =
    {
      {type = "item", name = "copper-bacteria", amount = 1, probability = 0.1 },
      {type = "item", name = "spoilage", amount = 1}
    },
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.457, b = 0.000, a = 1.000}, -- #ff7400ff
      secondary = {r = 1.000, g = 0.196, b = 0.000, a = 1.000}, -- #ff3100ff
    }
  },

  {
    type = "recipe",
    name = "copper-bacteria-cultivation",
    icon = "__space-age__/graphics/icons/copper-bacteria-cultivation.png",
    category = "organic",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b[cultivation]-b[copper]",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    energy_required = 4,
    ingredients =
    {
      {type = "item", name = "copper-bacteria", amount = 1},
      {type = "item", name = "bioflux", amount = 1}
    },
    results =
    {
      {type = "item", name = "copper-bacteria", amount = 4}
    },
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.457, b = 0.000, a = 1.000}, -- #ff7400ff
      secondary = {r = 1.000, g = 0.196, b = 0.000, a = 1.000}, -- #ff3100ff
    },
    show_amount_in_title = false
  },

  {
    type = "recipe",
    name = "iron-bacteria",
    icon = "__space-age__/graphics/icons/iron-bacteria.png",
    category = "organic-or-hand-crafting",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    subgroup = "agriculture-processes",
    order = "e[bacteria]-a[bacteria]-a[iron]",
    enabled = false,
    allow_productivity = true,
    energy_required = 1,
    ingredients =
    {
      {type = "item", name = "jelly", amount = 6},
    },
    results =
    {
      {type = "item", name = "iron-bacteria", amount = 1, probability = 0.1 },
      {type = "item", name = "spoilage", amount = 4}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.000, g = 0.500, b = 1.000, a = 1.000}, -- #007fffff
      secondary = {r = 0.095, g = 0.412, b = 0.822, a = 1.000}, -- #1868d1ff
    }
  },

  {
    type = "recipe",
    name = "iron-bacteria-cultivation",
    icon = "__space-age__/graphics/icons/iron-bacteria-cultivation.png",
    category = "organic",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b[cultivation]-a[iron]",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    energy_required = 4,
    ingredients =
    {
      {type = "item", name = "iron-bacteria", amount = 1},
      {type = "item", name = "bioflux", amount = 1}
    },
    results =
    {
      {type = "item", name = "iron-bacteria", amount = 4}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.000, g = 0.500, b = 1.000, a = 1.000}, -- #007fffff
      secondary = {r = 0.095, g = 0.412, b = 0.822, a = 1.000}, -- #1868d1ff
    },
    show_amount_in_title = false
  },

  ----------------------- gleba processing
  {
    type = "recipe",
    name = "artificial-yumako-soil",
    icon = "__space-age__/graphics/icons/artificial-yumako-soil.png",
    category = "crafting",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    enabled = false,
    allow_productivity = true,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "yumako-seed", amount = 2},
      {type = "item", name = "nutrients", amount = 50},
      {type = "item", name = "landfill", amount = 5}
    },
    results = {{type="item", name="artificial-yumako-soil", amount=10}}
  },
  {
    type = "recipe",
    name = "overgrowth-yumako-soil",
    icon = "__space-age__/graphics/icons/overgrowth-yumako-soil.png",
    category = "crafting-with-fluid",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    enabled = false,
    allow_productivity = true,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "artificial-yumako-soil", amount = 2},
      {type = "item", name = "yumako-seed", amount = 5},
      {type = "item", name = "biter-egg", amount = 10},
      {type = "item", name = "spoilage", amount = 50},
      {type="fluid", name="water", amount=100}
    },
    results = {{type="item", name="overgrowth-yumako-soil", amount=1}}
  },
  {
    type = "recipe",
    name = "artificial-jellynut-soil",
    icon = "__space-age__/graphics/icons/artificial-jellynut-soil.png",
    category = "crafting",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    enabled = false,
    allow_productivity = true,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "jellynut-seed", amount = 2},
      {type = "item", name = "nutrients", amount = 50},
      {type = "item", name = "landfill", amount = 5}
    },
    results = {{type="item", name="artificial-jellynut-soil", amount=10}}
  },
  {
    type = "recipe",
    name = "overgrowth-jellynut-soil",
    icon = "__space-age__/graphics/icons/overgrowth-jellynut-soil.png",
    category = "crafting-with-fluid",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    enabled = false,
    allow_productivity = true,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "artificial-jellynut-soil", amount = 2},
      {type = "item", name = "jellynut-seed", amount = 5},
      {type = "item", name = "biter-egg", amount = 10},
      {type = "item", name = "spoilage", amount = 50},
      {type="fluid", name="water", amount=100}
    },
    results = {{type="item", name="overgrowth-jellynut-soil", amount=1}}
  },
  {
    type = "recipe",
    name = "nutrients-from-spoilage",
    icon = "__space-age__/graphics/icons/nutrients-from-spoilage.png",
    category = "organic-or-assembling",
    subgroup = "agriculture-processes",
    order = "c[nutrients]-a[nutrients-from-spoilage]",
    enabled = false,
    allow_productivity = true,
    energy_required = 2,
    ingredients = {{type = "item", name = "spoilage", amount = 10}},
    results = {{type="item", name="nutrients", amount=1, percent_spoiled=0.5}},
    crafting_machine_tint =
    {
      primary = {r = 0.8, g = 0.9, b = 1, a = 1.000},
      secondary = {r = 0.5, g = 0.5, b = 0.8, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "nutrients-from-yumako-mash",
    icon = "__space-age__/graphics/icons/nutrients-from-yumako-mash.png",
    category = "organic",
    subgroup = "agriculture-processes",
    enabled = false,
    allow_productivity = true,
    order = "c[nutrients]-b[nutrients-from-yumako-mash]",
    energy_required = 4,
    ingredients = {{type = "item", name = "yumako-mash", amount = 4}},
    results = {{type="item", name="nutrients", amount=6}},
    crafting_machine_tint =
    {
      primary = {r = 0.8, g = 0.9, b = 1, a = 1.000},
      secondary = {r = 0.8, g = 0.2, b = 0.0, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "nutrients-from-bioflux",
    icon = "__space-age__/graphics/icons/nutrients-from-bioflux.png",
    category = "organic",
    subgroup = "agriculture-processes",
    enabled = false,
    allow_productivity = true,
    order = "c[nutrients]-c[nutrients-from-bioflux]",
    energy_required = 2,
    ingredients = {{type = "item", name = "bioflux", amount = 5}},
    results = {{type="item", name="nutrients", amount=40}},
    crafting_machine_tint =
    {
      primary = {r = 0.8, g = 0.9, b = 1, a = 1.000},
      secondary = {r = 0.900, g = 0.137, b = 0.000, a = 1.000}, -- #e52200ff
    }
  },

  {
    type = "recipe",
    name = "pentapod-egg",
    icon = "__space-age__/graphics/icons/pentapod-egg-3.png",
    category = "organic",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    subgroup = "agriculture-processes",
    order = "d[organic-processing]-a[pentapod-egg]",
    auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    hide_from_signal_gui = true,
    energy_required = 15,
    ingredients =
    {
      {type = "item", name = "pentapod-egg", amount = 1},
      {type = "item", name = "nutrients", amount = 30},
      {type = "fluid", name = "water", amount = 60}
    },
    results =
    {
      {type = "item", name = "pentapod-egg", amount = 2, ignored_by_stats = 1, ignored_by_productivity = 1}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.5, g = 0.9, b = 0.5, a = 1.000},
      secondary = {r = 0.0, g = 0.5, b = 0.0, a = 1.000},
    }
  },

  {
    type = "recipe",
    name = "rocket-fuel-from-jelly",
    icon = "__space-age__/graphics/icons/rocket-fuel-from-jelly.png",
    category = "organic",
    subgroup = "agriculture-products",
    order = "a[organic-products]-a[rocket-fuel-from-jelly]",
    auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 10,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 30},
      {type = "item", name =  "jelly", amount = 30},
      {type = "item", name = "bioflux", amount = 2}
    },
    results = {{type="item", name="rocket-fuel", amount=1}},
    crafting_machine_tint =
    {
      primary = {r = 0.728, g = 0.116, b = 0.116, a = 1.000}, -- #b91d1dff
      secondary = {r = 0.3, g = 0.9, b = 0.3, a = 1.000},
    }
  },

  {
    type = "recipe",
    name = "bioflux",
    icon = "__space-age__/graphics/icons/bioflux.png",
    category = "organic",
    subgroup = "agriculture-products",
    order = "a[organic-products]-g[bioflux]",
    auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 6,
    ingredients =
    {
      {type = "item", name = "yumako-mash", amount = 15},
      {type = "item", name = "jelly", amount = 12}
    },
    results = {{type="item", name="bioflux", amount=4}},
    crafting_machine_tint =
    {
      primary = {r = 0.3, g = 0.9, b = 0.8, a = 1.000},
      secondary = {r = 0.8, g = 0.5, b = 0.3, a = 1.000},
    }
  },

  {
    type = "recipe",
    name = "bioplastic",
    icon = "__space-age__/graphics/icons/bioplastic.png",
    category = "organic",
    subgroup = "agriculture-products",
    order = "a[organic-products]-c[bioplastic]",
    auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "bioflux", amount = 1},
      {type = "item", name = "yumako-mash", amount = 4}
    },
    results = {{type="item", name="plastic-bar", amount=3}},
    crafting_machine_tint =
    {
      primary = {r = 0.722, g = 0.621, b = 0.655, a = 1.000},
      secondary = {r = 0.693, g = 0.449, b = 0.449, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "biosulfur",
    icon = "__space-age__/graphics/icons/biosulfur.png",
    category = "organic",
    subgroup = "agriculture-products",
    order = "a[organic-products]-d[biosulfur]",
    auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "spoilage", amount = 5},
      {type = "item", name = "bioflux", amount = 1}
    },
    results = {{type="item", name="sulfur", amount=2}},
    crafting_machine_tint =
    {
      primary = {r = 1, g = 1, b = 0, a = 1.000},
      secondary = {r = 0.693, g = 0.449, b = 0.0, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "biolubricant",
    icon = "__space-age__/graphics/icons/fluid/biolubricant.png",
    category = "organic",
    subgroup = "agriculture-products",
    order = "a[organic-products]-b[biolubricant]",
    auto_recycle = false,
    energy_required = 3,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "jelly", amount = 60}
    },
    results =
    {
      {type = "fluid", name="lubricant", amount = 20}
    },
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0, g = 1, b = 0, a = 1.000},
      secondary = {r = 0.3, g = 1, b = 0.3, a = 1.000},
    }
  },
  ----------------------- gleba results
  {
    type = "recipe",
    name = "carbon-fiber",
    category = "organic",
    subgroup = "agriculture-products",
    order = "a[organic-products]-h[carbon-fiber]",
    auto_recycle = false,
    energy_required = 5,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "yumako-mash", amount = 10},
      {type = "item", name = "carbon", amount = 1}
    },
    results = {{type="item", name="carbon-fiber", amount=1}},
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0.306, g = 0.643, b = 0.684, a = 1.000},
      secondary = {r = 0.684, g = 0.684, b = 0.684, a = 1.000},
    },
  },

  {
    type = "recipe",
    name = "toolbelt-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "advanced-circuit", amount = 3},
      {type = "item", name = "carbon-fiber", amount = 10}
    },
    results = {{type="item", name="toolbelt-equipment", amount=1}}
  },
  {
    type = "recipe",
    name = "battery-mk3-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "battery-mk2-equipment", amount = 5},
      {type = "item", name = "supercapacitor", amount = 10}
    },
    results = {{type="item", name="battery-mk3-equipment", amount=1}}
  },
  {
    type = "recipe",
    name = "fission-reactor-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "processing-unit", amount = 200},
      {type = "item", name = "low-density-structure", amount = 50},
      {type = "item", name = "uranium-fuel-cell", amount = 4}
    },
    results = {{type="item", name="fission-reactor-equipment", amount=1}}
  },
  {
    type = "recipe",
    name = "space-platform-foundation",
    energy_required = 10,
    enabled = false,
    category = "crafting",
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 20},
      {type = "item", name = "copper-cable", amount = 20}
    },
    results = {{type="item", name="space-platform-foundation", amount=1}}
  },
  {
    type = "recipe",
    name = "stack-inserter",
    enabled = false,
    energy_required = 0.5,
    ingredients =
    {
      {type = "item", name = "bulk-inserter", amount = 1},
      {type = "item", name = "processing-unit", amount = 1},
      {type = "item", name = "carbon-fiber", amount = 2},
      {type = "item", name = "jelly", amount = 10}
    },
    results = {{type="item", name="stack-inserter", amount=1}}
  },

  {
    type = "recipe",
    name = "rocket-turret",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "rocket-launcher", amount = 4},
      {type = "item", name = "processing-unit", amount = 4},
      {type = "item", name = "carbon-fiber", amount = 20},
      {type = "item", name = "steel-plate", amount = 20},
      {type = "item", name = "iron-gear-wheel", amount = 20}
    },
    results = {{type="item", name="rocket-turret", amount=1}}
  },
  {
    type = "recipe",
    name = "infinity-chest",
    energy_required = 0.5,
    enabled = false,
    hidden = true,
    ingredients =
    {
      {type = "item", name = "steel-chest", amount = 1},
      {type = "item", name = "electronic-circuit", amount = 5}
    },
    results = {{type="item", name="infinity-chest", amount=1}}
  },
  {
    type = "recipe",
    name = "infinity-pipe",
    energy_required = 0.5,
    hidden = true,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "pipe", amount = 1},
      {type = "item", name = "electronic-circuit", amount = 5}
    },
    results = {{type="item", name="infinity-pipe", amount=1}}
  },
  {
    type = "recipe",
    name = "heat-interface",
    energy_required = 0.5,
    hidden = true,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "heat-pipe", amount = 1},
      {type = "item", name = "electronic-circuit", amount = 5}
    },
    results = {{type="item", name="heat-interface", amount=1}}
  },
  {
    type = "recipe",
    name = "space-platform-starter-pack",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "space-platform-foundation", amount = 60},
      {type = "item", name = "steel-plate", amount = 20},
      {type = "item", name = "processing-unit", amount = 20}
    },
    energy_required = 60,
    results = {{type="item", name="space-platform-starter-pack", amount=1}}
  },
  {
    type = "recipe",
    name = "cargo-bay",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 20},
      {type = "item", name = "low-density-structure", amount = 20},
      {type = "item", name = "processing-unit", amount = 5}
    },
    energy_required = 10,
    results = {{type="item", name="cargo-bay", amount=1}}
  },
  {
    type = "recipe",
    name = "asteroid-collector",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "low-density-structure", amount = 20},
      {type = "item", name = "electric-engine-unit", amount = 8},
      {type = "item", name = "processing-unit", amount = 5}
    },
    energy_required = 10,
    results = {{type="item", name="asteroid-collector", amount=1}}
  },
  {
    type = "recipe",
    name = "crusher",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "low-density-structure", amount = 20},
      {type = "item", name = "steel-plate", amount = 10},
      {type = "item", name = "electric-engine-unit", amount = 10}
    },
    energy_required = 10,
    results = {{type="item", name="crusher", amount=1}}
  },
  {
    type = "recipe",
    name = "thruster",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 10},
      {type = "item", name = "processing-unit", amount = 10},
      {type = "item", name = "electric-engine-unit", amount = 5}
    },
    energy_required = 10,
    results = {{type="item", name="thruster", amount=1}}
  },

-------------------------------------------------------------------------- PLANET SCIENCE PACKS
  {
    type = "recipe",
    name = "space-science-pack",
    icon = "__base__/graphics/icons/space-science-pack.png",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 2},
      {type = "item", name = "carbon", amount = 1},
      {type = "item", name = "ice", amount = 1}
    },
    surface_conditions =
    {
      {
        property = "gravity",
        min = 0,
        max = 0
      }
    },
    energy_required = 15,
    results =
    {
      {type = "item", name = "space-science-pack", amount = 5}
    },
    allow_productivity = true,
    main_product = "space-science-pack"
  },
  {
    type = "recipe",
    name = "metallurgic-science-pack",
    category = "metallurgy",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 4000,
        max = 4000
      }
    },
    enabled = false,
    ingredients =
    {
      {type = "item", name = "tungsten-carbide", amount = 3},
      {type = "item", name = "tungsten-plate", amount = 2},
      {type = "fluid", name = "molten-copper", amount = 200},
    },
    energy_required = 10,
    results = {{type="item", name="metallurgic-science-pack", amount=1}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "agricultural-science-pack",
    category = "organic",
    subgroup = "science-pack",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    enabled = false,
    ingredients =
    {
      {type = "item", name = "bioflux", amount = 1},
      {type = "item", name = "pentapod-egg", amount = 1}

    },
    energy_required = 4,
    results = {{type="item", name="agricultural-science-pack", amount=1}},
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {0.1, 0.2, 0.0, 1},
      secondary = {0.639, 0.764, 1, 1}
    }
  },
  {
    type = "recipe",
    name = "electromagnetic-science-pack",
    category = "electromagnetics",
    surface_conditions =
    {
      {
        property = "magnetic-field",
        min = 99,
        max = 99
      }
    },
    enabled = false,
    ingredients =
    {
      {type = "item", name = "supercapacitor", amount = 1},
      {type = "item", name = "accumulator", amount = 1},
      {type = "fluid", name = "electrolyte", amount = 25},
      {type = "fluid", name = "holmium-solution", amount = 25},
    },
    energy_required = 10,
    results = {{type="item", name="electromagnetic-science-pack", amount=1}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "cryogenic-science-pack",
    category = "cryogenics",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 300,
        max = 300
      }
    },
    enabled = false,
    ingredients =
    {
      {type = "item", name = "ice", amount = 3},
      {type = "item", name = "lithium-plate", amount = 1},
      {type = "fluid", name = "fluoroketone-cold", amount = 6, ignored_by_stats = 6}
    },
    energy_required = 20,
    results =
    {
      {type = "item", name = "cryogenic-science-pack", amount = 1},
      {type = "fluid", name = "fluoroketone-hot", amount = 3, ignored_by_stats = 3, ignored_by_productivity = 3}
    },
    main_product = "cryogenic-science-pack",
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0.040, g = 0.186, b = 1.000, a = 1.000}, -- #0a2fffff
      secondary = {r = 0.200, g = 0.400, b = 1.000, a = 1.000}, -- #3366ffff
      tertiary = {r = 0.600, g = 0.651, b = 1.000, a = 1.000}, -- #99a6ffff
      quaternary = {r = 0.100, g = 0.300, b = 0.500, a = 1.000}, -- #194c7fff
    }
  },

-------------------------------------------------------------------------- CRUSHING
  {
    type = "recipe",
    name = "metallic-asteroid-crushing",
    icon = "__space-age__/graphics/icons/metallic-asteroid-crushing.png",
    category = "crushing",
    subgroup="space-crushing",
    order = "b-a-a",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "metallic-asteroid-chunk", amount = 1},
    },
    energy_required = 2,
    results =
    {
      {type = "item", name = "iron-ore", amount = 20},
      {type = "item", name = "metallic-asteroid-chunk", amount = 1, probability = 0.2}
    },
    allow_productivity = true,
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "carbonic-asteroid-crushing",
    icon = "__space-age__/graphics/icons/carbonic-asteroid-crushing.png",
    category = "crushing",
    subgroup="space-crushing",
    order = "b-a-b",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "carbonic-asteroid-chunk", amount = 1},
    },
    energy_required = 2,
    results =
    {
      {type = "item", name = "carbon", amount = 10},
      {type = "item", name = "carbonic-asteroid-chunk", amount = 1, probability = 0.2}
    },
    allow_productivity = true,
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "oxide-asteroid-crushing",
    icon = "__space-age__/graphics/icons/oxide-asteroid-crushing.png",
    category = "crushing",
    subgroup="space-crushing",
    order = "b-a-c",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "oxide-asteroid-chunk", amount = 1},
    },
    energy_required = 2,
    results =
    {
      {type = "item", name = "ice", amount = 5},
      {type = "item", name = "oxide-asteroid-chunk", amount = 1, probability = 0.2}
    },
    allow_productivity = true,
    allow_decomposition = false
  },
-------------------------------------------------------------------------- ADVANCED CRUSHING
  {
    type = "recipe",
    name = "advanced-metallic-asteroid-crushing",
    localised_name = {"recipe-name.advanced-metallic-asteroid-crushing"},
    icon = "__space-age__/graphics/icons/advanced-metallic-asteroid-crushing.png",
    category = "crushing",
    subgroup="space-crushing",
    order = "c-a-b",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "metallic-asteroid-chunk", amount = 1}
    },
    energy_required = 5,
    results =
    {
      {type = "item", name = "iron-ore", amount = 10},
      {type = "item", name = "copper-ore", amount = 4},
      {type = "item", name = "metallic-asteroid-chunk", amount = 1, probability = 0.05}
    },
    allow_productivity = true,
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "advanced-carbonic-asteroid-crushing",
    localised_name = {"recipe-name.advanced-carbonic-asteroid-crushing"},
    icon = "__space-age__/graphics/icons/advanced-carbonic-asteroid-crushing.png",
    category = "crushing",
    subgroup="space-crushing",
    order = "e[advanced-carbonic-asteroid-crushing]",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "carbonic-asteroid-chunk", amount = 1}
    },
    energy_required = 5,
    results =
    {
      {type = "item", name = "carbon", amount = 5},
      {type = "item", name = "sulfur", amount = 2},
      {type = "item", name = "carbonic-asteroid-chunk", amount = 1, probability = 0.05}
    },
    allow_productivity = true,
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "advanced-oxide-asteroid-crushing",
    localised_name = {"recipe-name.advanced-oxide-asteroid-crushing"},
    icon = "__space-age__/graphics/icons/advanced-oxide-asteroid-crushing.png",
    category = "crushing",
    subgroup="space-crushing",
    order = "f[advanced-oxide-asteroid-crushing]",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "oxide-asteroid-chunk", amount = 1}
    },
    energy_required = 5,
    results =
    {
      {type = "item", name = "ice", amount = 3},
      {type = "item", name = "calcite", amount = 2},
      {type = "item", name = "oxide-asteroid-chunk", amount = 1, probability = 0.05}
    },
    allow_productivity = true,
    allow_decomposition = false
  },
  -------------------------------------------------------------------------- REPROCESSING
  {
    type = "recipe",
    name = "metallic-asteroid-reprocessing",
    icon = "__space-age__/graphics/icons/metallic-asteroid-reprocessing.png",
    category = "crushing",
    subgroup="space-crushing",
    order = "b-b-a",
    auto_recycle = false,
    enabled = false,
    ingredients = {{type = "item", name = "metallic-asteroid-chunk", amount = 1}},
    energy_required = 2,
    results =
    {
      {type = "item", name = "metallic-asteroid-chunk", amount = 1, probability = 0.4},
      {type = "item", name = "carbonic-asteroid-chunk", amount = 1, probability = 0.2},
      {type = "item", name = "oxide-asteroid-chunk", amount = 1, probability = 0.2}
    },
    allow_productivity = false,
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "carbonic-asteroid-reprocessing",
    icon = "__space-age__/graphics/icons/carbonic-asteroid-reprocessing.png",
    category = "crushing",
    subgroup="space-crushing",
    order = "b-b-b",
    auto_recycle = false,
    enabled = false,
    ingredients = {{type = "item", name = "carbonic-asteroid-chunk", amount = 1}},
    energy_required = 2,
    results =
    {
      {type = "item", name = "carbonic-asteroid-chunk", amount = 1, probability = 0.4},
      {type = "item", name = "metallic-asteroid-chunk", amount = 1, probability = 0.2},
      {type = "item", name = "oxide-asteroid-chunk", amount = 1, probability = 0.2}
    },
    allow_productivity = false,
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "oxide-asteroid-reprocessing",
    icon = "__space-age__/graphics/icons/oxide-asteroid-reprocessing.png",
    category = "crushing",
    subgroup="space-crushing",
    order = "b-b-c",
    auto_recycle = false,
    enabled = false,
    ingredients = {{type = "item", name = "oxide-asteroid-chunk", amount = 1}},
    energy_required = 1,
    results =
    {
      {type = "item", name = "oxide-asteroid-chunk", amount = 1, probability = 0.4},
      {type = "item", name = "metallic-asteroid-chunk", amount = 1, probability = 0.2},
      {type = "item", name = "carbonic-asteroid-chunk", amount = 1, probability = 0.2}
    },
    allow_productivity = false,
    allow_decomposition = false
  },
  -------------------------------------------------------------------------- FUEL & OXIDISER
  {
    type = "recipe",
    name = "thruster-fuel",
    category = "chemistry",
    subgroup="space-processing",
    order = "a[thruster-fuel]",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "carbon", amount = 2},
      {type = "fluid", name = "water", amount = 10}
    },
    surface_conditions =
    {
      {
        property = "gravity",
        min = 0,
        max = 0
      }
    },
    energy_required = 2,
    results = {{type = "fluid", name = "thruster-fuel", amount = 75}},
    allow_productivity = true,
    show_amount_in_title = false,
    always_show_products = true,
    crafting_machine_tint =
    {
      primary = {r = 0.881, g = 0.100, b = 0.000, a = 0.502}, -- #e0190080
      secondary = {r = 0.930, g = 0.767, b = 0.605, a = 0.502}, -- #edc39a80
      tertiary = {r = 0.873, g = 0.649, b = 0.542, a = 0.502}, -- #dea58a80
      quaternary = {r = 0.629, g = 0.174, b = 0.000, a = 0.502}, -- #a02c0080
    }
  },
  {
    type = "recipe",
    name = "thruster-oxidizer",
    category = "chemistry",
    subgroup="space-processing",
    order = "c[thruster-oxidizer]",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-ore", amount = 2},
      {type = "fluid", name = "water", amount = 10}
    },
    surface_conditions =
    {
      {
        property = "gravity",
        min = 0,
        max = 0
      }
    },
    energy_required = 2,
    results = {{type = "fluid", name = "thruster-oxidizer", amount = 75}},
    allow_productivity = true,
    show_amount_in_title = false,
    always_show_products = true,
    crafting_machine_tint =
    {
      primary = {r = 0.082, g = 0.396, b = 0.792, a = 0.502}, -- #1565ca80
      secondary = {r = 0.161, g = 0.553, b = 0.796, a = 0.502}, -- #298dcb80
      tertiary = {r = 0.059, g = 0.376, b = 0.545, a = 0.502}, -- #0f5f8a80
      quaternary = {r = 0.683, g = 0.915, b = 1.000, a = 0.502}, -- #aee9ff80
    }
  },
  {
    type = "recipe",
    name = "ice-melting",
    icon = "__space-age__/graphics/icons/fluid/ice-melting.png",
    category = "chemistry",
    subgroup = "fluid-recipes",
    order = "d[other-chemistry]-c[ice-melting]",
    auto_recycle = false,
    enabled = false,
    ingredients = {{type = "item", name = "ice", amount = 1}},
    energy_required = 1,
    results = {{type = "fluid", name = "water", amount = 20}},
    allow_productivity = true,
    allow_decomposition = false,
    crafting_machine_tint =
    {
      primary = {r = 0.433, g = 0.773, b = 1.000, a = 1.000}, -- #6ec5ffff
      secondary = {r = 0.591, g = 0.856, b = 1.000, a = 1.000}, -- #96daffff
      tertiary = {r = 0.381, g = 0.428, b = 0.436, a = 0.502}, -- #616d6f80
      quaternary = {r = 0.499, g = 0.797, b = 0.793, a = 0.733}, -- #7fcbcabb
    },
    show_amount_in_title = false
  },

-------------------------------------------------------------------------- SECONDARY FUEL / OXIDISER

  {
    type = "recipe",
    name = "advanced-thruster-fuel",
    icon = "__space-age__/graphics/icons/advanced-thruster-fuel.png",
    localised_name = {"recipe-name.advanced-thruster-fuel"},
    category = "chemistry",
    subgroup = "space-processing",
    order = "b[advanced-thruster-fuel]",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "carbon", amount = 2},
      {type = "item", name = "calcite", amount = 1},
      {type = "fluid", name = "water", amount = 100}
    },
    surface_conditions =
    {
      {
        property = "gravity",
        min = 0,
        max = 0
      }
    },
    energy_required = 10,
    results =
    {
      {type = "fluid", name = "thruster-fuel", amount = 1500},
    },
    allow_productivity = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    crafting_machine_tint =
    {
      primary = {r = 0.881, g = 0.100, b = 0.000, a = 0.502}, -- #e0190080
      secondary = {r = 0.930, g = 0.767, b = 0.605, a = 0.502}, -- #edc39a80
      tertiary = {r = 0.873, g = 0.649, b = 0.542, a = 0.502}, -- #dea58a80
      quaternary = {r = 0.629, g = 0.174, b = 0.000, a = 0.502}, -- #a02c0080
    }
  },

  {
    type = "recipe",
    name = "advanced-thruster-oxidizer",
    icon = "__space-age__/graphics/icons/advanced-thruster-oxidizer.png",
    localised_name = {"recipe-name.advanced-thruster-oxidizer"},
    category = "chemistry",
    subgroup = "space-processing",
    order = "d[advanced-thruster-oxydizer]",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-ore", amount = 2},
      {type = "item", name = "calcite", amount = 1},
      {type = "fluid", name = "water", amount = 100}
    },
    surface_conditions =
    {
      {
        property = "gravity",
        min = 0,
        max = 0
      }
    },
    energy_required = 10,
    results =
    {
      {type = "fluid", name = "thruster-oxidizer", amount = 1500},
    },
    allow_productivity = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    crafting_machine_tint =
    {
      primary = {r = 0.082, g = 0.396, b = 0.792, a = 0.502}, -- #1565ca80
      secondary = {r = 0.161, g = 0.553, b = 0.796, a = 0.502}, -- #298dcb80
      tertiary = {r = 0.059, g = 0.376, b = 0.545, a = 0.502}, -- #0f5f8a80
      quaternary = {r = 0.683, g = 0.915, b = 1.000, a = 0.502}, -- #aee9ff80
    }
  },
  -------------------------------------------------------------------------- Vulcanus
  {
    type = "recipe",
    name = "acid-neutralisation",
    icon = "__space-age__/graphics/icons/fluid/acid-neutralisation.png",
    category = "chemistry-or-cryogenics",
    subgroup = "fluid-recipes",
    order = "d[other-chemistry]-a[acid-neutralisation]",
    auto_recycle = false,
    enabled = false,
    surface_conditions =
    {
      {
        property = "pressure",
        min = 4000,
        max = 4000
      }
    },
    ingredients =
    {
      {type = "item", name = "calcite", amount = 1},
      {type = "fluid", name = "sulfuric-acid", amount = 1000},
    },
    energy_required = 5,
    results =
    {
      {type = "fluid", name = "steam", amount = 10000, temperature = 500}
    },
    allow_productivity = false,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.912, b = 0.036, a = 1.000}, -- #ffe809ff
      secondary = {r = 0.707, g = 0.797, b = 0.335, a = 1.000}, -- #b4cb55ff
      tertiary = {r = 0.681, g = 0.635, b = 0.486, a = 1.000}, -- #ada17bff
      quaternary = {r = 1.000, g = 0.804, b = 0.000, a = 1.000}, -- #ffcd00ff
    }
  },
  {
    type = "recipe",
    name = "steam-condensation",
    icon = "__space-age__/graphics/icons/fluid/steam-condensation.png",
    localised_name = {"recipe-name.steam-condensation"},
    category = "chemistry-or-cryogenics",
    subgroup = "fluid-recipes",
    order = "d[other-chemistry]-b[steam-condensation]",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "steam", amount = 1000},
    },
    energy_required = 1,
    results =
    {
      {type = "fluid", name = "water", amount = 90},
    },
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    allow_quality = false,
    crafting_machine_tint =
    {
      primary = {r = 0.409, g = 0.694, b = 0.895, a = 1.000}, -- #68b0e4ff
      secondary = {r = 1.000, g = 1.000, b = 1.000, a = 1.000}, -- #fffefeff
      tertiary = {r = 0.540, g = 0.520, b = 0.520, a = 1.000}, -- #898484ff
      quaternary = {r = 0.750, g = 0.750, b = 0.750, a = 1.000}, -- #bfbfbfff
    }
  },
  {
    type = "recipe",
    name = "carbon",
    icon = "__space-age__/graphics/icons/carbon.png",
    category = "chemistry-or-cryogenics",
    subgroup = "raw-material",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "coal", amount = 2},
      {type = "fluid", name = "sulfuric-acid", amount = 20},
    },
    energy_required = 1,
    results = {{type="item", name="carbon", amount=1}},
    allow_productivity = true,
    allow_decomposition = false,
    crafting_machine_tint =
    {
      primary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
      secondary = {r = 0.293, g = 0.293, b = 0.293, a = 1.000}, -- #4a4a4aff
      tertiary = {r = 0.199, g = 0.179, b = 0.070, a = 1.000}, -- #322d11ff
      quaternary = {r = 0.293, g = 0.293, b = 0.293, a = 1.000}, -- #4a4a4aff
    }
  },
  {
    type = "recipe",
    name = "tungsten-carbide",
    category = "crafting-with-fluid",
    subgroup = "vulcanus-processes",
    order = "c[tungsten]-b[tungsten-carbide]",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "tungsten-ore", amount = 2},
      {type = "fluid", name = "sulfuric-acid", amount = 10},
      {type = "item", name = "carbon", amount = 1}
    },
    energy_required = 1,
    results = {{type="item", name="tungsten-carbide", amount=1}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "foundry",
    category = "metallurgy-or-assembling",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 4000,
        max = 4000
      }
    },
    enabled = false,
    ingredients =
    {
      {type = "item", name = "tungsten-carbide", amount = 50},
      {type = "item", name = "steel-plate", amount = 50},
      {type = "item", name = "electronic-circuit", amount = 30},
      {type = "item", name = "refined-concrete", amount = 20},
      {type = "fluid", name = "lubricant", amount = 20}
    },
    energy_required = 10,
    results = {{type="item", name="foundry", amount=1}}
  },
  {
    type = "recipe",
    name = "molten-iron-from-lava",
    icon = "__space-age__/graphics/icons/fluid/molten-iron-from-lava.png",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "a[melting]-a[lava-a]",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "lava", amount = 500},
      {type = "item", name = "calcite", amount = 1},
    },
    energy_required = 16,
    results =
    {
      {type = "fluid", name = "molten-iron", amount = 250},
      {type = "item", name = "stone", amount = 10},
    },
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "molten-copper-from-lava",
    icon = "__space-age__/graphics/icons/fluid/molten-copper-from-lava.png",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "a[melting]-a[lava-b]",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "lava", amount = 500},
      {type = "item", name = "calcite", amount = 1},
    },
    energy_required = 16,
    results =
    {
      {type = "fluid", name = "molten-copper", amount = 250},
      {type = "item", name = "stone", amount = 15},
    },
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "molten-iron",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "a[melting]-b[molten-iron]",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-ore", amount = 50},
      {type = "item", name = "calcite", amount = 1},
    },
    energy_required = 32,
    results =
    {
      {type = "fluid", name = "molten-iron", amount = 500},
    },
    allow_productivity = true,
    hide_from_signal_gui = false,
    main_product =  "molten-iron"
  },
  {
    type = "recipe",
    name = "molten-copper",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "a[melting]-c[molten-copper]",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "copper-ore", amount = 50},
      {type = "item", name = "calcite", amount = 1},
    },
    energy_required = 32,
    results =
    {
      {type = "fluid", name = "molten-copper", amount = 500},
    },
    hide_from_signal_gui = false,
    allow_productivity = true,
    main_product =  "molten-copper"
  },

  -- remove alternate basic resource recipes.
  {
    type = "recipe",
    name = "casting-iron",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "b[casting]-a[casting-iron]",
    icon = "__space-age__/graphics/icons/casting-iron.png",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "molten-iron", amount = 20, fluidbox_multiplier = 10},
    },
    energy_required = 3.2,
    allow_decomposition = false,
    results = {{type = "item", name = "iron-plate", amount = 2}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "casting-steel",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "b[casting]-c[casting-steel]",
    icon = "__space-age__/graphics/icons/casting-steel.png",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "molten-iron", amount = 30, fluidbox_multiplier = 10}
    },
    energy_required = 3.2,
    allow_decomposition = false,
    results = {{type = "item", name = "steel-plate", amount = 1}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "casting-copper",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "b[casting]-b[casting-copper]",
    icon = "__space-age__/graphics/icons/casting-copper.png",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "molten-copper", amount = 20, fluidbox_multiplier = 10},
    },
    energy_required = 3.2,
    allow_decomposition = false,
    results = {{type = "item", name = "copper-plate", amount = 2}},
    allow_productivity = true
  },

  {
    type = "recipe",
    name = "casting-iron-gear-wheel",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "b[casting]-d[casting-iron-gear-wheel]",
    icon = "__space-age__/graphics/icons/casting-iron-gear-wheel.png",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "molten-iron", amount = 10, fluidbox_multiplier = 10},
    },
    energy_required = 1,
    allow_decomposition = false,
    results = {{type = "item", name = "iron-gear-wheel", amount = 1}},
    allow_productivity = true
  },

  {
    type = "recipe",
    name = "casting-iron-stick",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "b[casting]-e[casting-iron-stick]",
    icon = "__space-age__/graphics/icons/casting-iron-stick.png",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "molten-iron", amount = 20, fluidbox_multiplier = 10},
    },
    energy_required = 1,
    allow_decomposition = false,
    results = {{type = "item", name = "iron-stick", amount = 4}},
    allow_productivity = true
  },

  {
    type = "recipe",
    name = "casting-pipe",
    category = "metallurgy",
    subgroup = "energy-pipe-distribution",
    order = "b[casting]-f[casting-pipe]",
    icon = "__space-age__/graphics/icons/casting-pipe.png",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "molten-iron", amount = 10, fluidbox_multiplier = 10},
    },
    energy_required = 1,
    allow_decomposition = false,
    results = {{type = "item", name = "pipe", amount = 1}},
    allow_productivity = false
  },

  {
    type = "recipe",
    name = "casting-pipe-to-ground",
    category = "metallurgy",
    subgroup = "energy-pipe-distribution",
    order = "b[casting]-g[casting-pipe-to-ground]",
    icon = "__space-age__/graphics/icons/casting-pipe-to-ground.png",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "molten-iron", amount = 50, fluidbox_multiplier = 10},
      {type = "item", name = "pipe", amount = 10}
    },
    energy_required = 1,
    allow_decomposition = false,
    results = {{type = "item", name = "pipe-to-ground", amount = 2}},
    allow_productivity = false
  },

  {
    type = "recipe",
    name = "casting-low-density-structure",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "b[casting]-f[low-density-structure]",
    icon = "__space-age__/graphics/icons/casting-low-density-structure.png",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "molten-iron", amount = 80},
      {type = "fluid", name = "molten-copper", amount = 250},
      {type = "item", name = "plastic-bar", amount = 5},
    },
    energy_required = 15,
    allow_decomposition = false,
    auto_recycle = false,
    results = {{type = "item", name = "low-density-structure", amount = 1}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "concrete-from-molten-iron",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "b[casting]-g[concrete]",
    icon = "__space-age__/graphics/icons/concrete-from-molten-iron.png",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "molten-iron", amount = 20},
      {type = "fluid", name = "water", amount = 100},
      {type = "item", name = "stone-brick", amount = 5},
    },
    energy_required = 10,
    allow_decomposition = false,
    results = {{type = "item", name = "concrete", amount = 10}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "casting-copper-cable",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "b[casting]-h[casting-copper-cable]",
    icon = "__space-age__/graphics/icons/casting-copper-cable.png",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "molten-copper", amount = 5, fluidbox_multiplier = 5},
    },
    energy_required = 1,
    allow_decomposition = false,
    results = {{type = "item", name = "copper-cable", amount = 2}},
    allow_productivity = true
  },

  {
    type = "recipe",
    name = "tungsten-plate",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "c[tungsten]-c[tungsten-plate]",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "tungsten-ore", amount = 4},
      {type = "fluid", name = "molten-iron", amount = 10},
    },
    energy_required = 10,
    results = {{type="item", name="tungsten-plate", amount=1}},
    allow_productivity = true
  },

  {
    type = "recipe",
    name = "turbo-transport-belt",
    category = "metallurgy",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 4000,
        max = 4000
      }
    },
    enabled = false,
    ingredients =
    {
      {type = "item", name = "tungsten-plate", amount = 5},
      {type = "item", name = "express-transport-belt", amount = 1},
      {type= "fluid", name = "lubricant", amount = 20}
    },
    results = {{type="item", name="turbo-transport-belt", amount=1}}
  },
  {
    type = "recipe",
    name = "turbo-underground-belt",
    energy_required = 2,
    category = "metallurgy",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 4000,
        max = 4000
      }
    },
    enabled = false,
    ingredients =
    {
      {type = "item", name = "tungsten-plate", amount = 40},
      {type = "item", name = "express-underground-belt", amount = 2},
      {type = "fluid", name = "lubricant", amount = 40}
    },
    results = {{type="item", name="turbo-underground-belt", amount=2}}
  },
  {
    type = "recipe",
    name = "turbo-splitter",
    category = "metallurgy",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 4000,
        max = 4000
      }
    },
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "express-splitter", amount = 1},
      {type = "item", name = "tungsten-plate", amount = 15},
      {type = "item", name = "processing-unit", amount = 2},
      {type = "fluid", name = "lubricant", amount = 80}
    },
    results = {{type="item", name="turbo-splitter", amount=1}}
  },
  {
    type = "recipe",
    name = "turbo-loader",
    enabled = false,
    hidden = true,
    energy_required = 20,
    ingredients =
    {
      {type = "item", name = "turbo-transport-belt", amount = 5},
      {type = "item", name = "express-loader", amount = 1}
    },
    results = {{type="item", name="turbo-loader", amount=1}}
  },
  {
    type = "recipe",
    name = "big-mining-drill",
    category = "metallurgy",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 4000,
        max = 4000
      }
    },
    enabled = false,
    energy_required = 30,
    ingredients =
    {
      {type = "item", name = "electric-mining-drill", amount = 1},
      {type = "fluid", name = "molten-iron", amount = 200},
      {type = "item", name = "tungsten-carbide", amount = 20},
      {type = "item", name = "electric-engine-unit", amount = 10},
      {type = "item", name = "advanced-circuit", amount = 10},
    },
    results = {{type="item", name="big-mining-drill", amount=1}}
  },
  {
    type = "recipe",
    name = "mech-armor",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
      {type = "item", name = "power-armor-mk2", amount = 1},
      {type = "item", name = "holmium-plate", amount = 200},
      {type = "item", name = "processing-unit", amount = 100},
      {type = "item", name = "superconductor", amount = 50},
      {type = "item", name = "supercapacitor", amount = 50}
    },
    results = {{type="item", name="mech-armor", amount=1}}
  },
  {
    type = "recipe",
    name = "railgun",
    category = "cryogenics",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "tungsten-plate", amount = 10},
      {type = "item", name = "superconductor", amount = 10},
      {type = "item", name = "quantum-processor", amount = 20},
      {type = "fluid", name = "fluoroketone-cold", amount = 10}
    },
    results = {{type="item", name="railgun", amount=1}},
    crafting_machine_tint =
    {
      primary = {r = 0.504, g = 0.448, b = 0.321, a = 1.000}, -- #807251ff
      secondary = {r = 0.312, g = 0.519, b = 0.601, a = 1.000}, -- #4f8499ff
      tertiary = {r = 0.402, g = 0.558, b = 0.880, a = 1.000}, -- #668ee0ff
      quaternary = {r = 0.246, g = 0.246, b = 0.246, a = 1.000}, -- #3e3e3eff
    }
  },
  {
    type = "recipe",
    name = "railgun-turret",
    category = "cryogenics",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "quantum-processor", amount = 100},
      {type = "item", name = "tungsten-plate", amount = 30},
      {type = "item", name = "superconductor", amount = 50},
      {type = "item", name = "carbon-fiber", amount = 20},
      {type = "fluid", name = "fluoroketone-cold", amount = 100}
    },
    results = {{type="item", name="railgun-turret", amount=1}},
    crafting_machine_tint =
    {
      primary = {r = 0.504, g = 0.448, b = 0.321, a = 1.000}, -- #807251ff
      secondary = {r = 0.312, g = 0.519, b = 0.601, a = 1.000}, -- #4f8499ff
      tertiary = {r = 0.402, g = 0.558, b = 0.880, a = 1.000}, -- #668ee0ff
      quaternary = {r = 0.246, g = 0.246, b = 0.246, a = 1.000}, -- #3e3e3eff
    }
  },
  {
    type = "recipe",
    name = "railgun-ammo",
    enabled = false,
    energy_required = 25,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 5},
      {type = "item", name = "copper-cable", amount = 10},
      {type = "item", name = "explosives", amount = 2},
    },
    results = {{type="item", name="railgun-ammo", amount=1}}
  },

-------------------------------------------------------------------------- Gleba
  {
    type = "recipe",
    name = "agricultural-tower",
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 10},
      {type = "item", name = "electronic-circuit", amount = 3},
      {type = "item", name = "spoilage", amount = 20},
      {type = "item", name = "landfill", amount = 1}
    },
    results = {{type="item", name="agricultural-tower", amount=1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "biochamber",
    category = "organic-or-assembling",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    energy_required = 20,
    ingredients =
    {
      {type = "item", name = "nutrients", amount = 5},
      {type = "item", name = "pentapod-egg", amount = 1},
      {type = "item", name = "iron-plate", amount = 20},
      {type = "item", name = "electronic-circuit", amount = 5},
      {type = "item", name = "landfill", amount = 1}
    },
    results = {{type="item", name="biochamber", amount=1}},
    enabled = false
  },

  {
    type = "recipe",
    name = "burnt-spoilage",
    icon = "__space-age__/graphics/icons/burnt-spoilage.png",
    category = "organic",
    subgroup = "agriculture-products",
    order = "a[organic-products]-h[burnt-spoilage]",
    auto_recycle = false,
    energy_required = 12,
    ingredients =
    {
      {type = "item", name = "spoilage", amount = 6}
    },
    results =
    {
      {type = "item", name = "carbon", amount = 1}
    },
    allow_productivity = true,
    enabled = false,
    crafting_machine_tint =
    {
      primary = {r = 0.134, g = 0.009, b = 0.009, a = 1.000}, -- #220202ff
      secondary = {r = 0.377, g = 0.255, b = 0.255, a = 1.000}, -- #604141ff
    }
  },

  {
    type = "recipe",
    name = "coal-synthesis",
    category = "chemistry",
    auto_recycle = false,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "carbon", amount = 5},
      {type = "item", name = "sulfur", amount = 1},
      {type = "fluid", name="water", amount=10},
    },
    results = {{type="item", name="coal", amount=1}},
    allow_productivity = true,
    enabled = false,
    icon = "__space-age__/graphics/icons/coal-synthesis.png",
    subgroup = "raw-material",
    order = "m",
    allow_decomposition = false,
    crafting_machine_tint =
    {
      primary = {r = 0.207, g = 0.177, b = 0.177, a = 1.000}, -- #342d2dff
      secondary = {r = 0.301, g = 0.276, b = 0.196, a = 1.000}, -- #4c4632ff
      tertiary = {r = 0.790, g = 0.722, b = 0.478, a = 1.000}, -- #c9b879ff
      quaternary = {r = 0.554, g = 0.540, b = 0.540, a = 1.000}, -- #8d8989ff
    }
  },
  {
    type = "recipe",
    name = "capture-robot-rocket",
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "flying-robot-frame", amount = 1},
      {type = "item", name = "steel-plate", amount = 2},
      {type = "item", name = "bioflux", amount = 20},
      {type = "item", name = "processing-unit", amount = 2},
    },
    results = {{type="item", name="capture-robot-rocket", amount=1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "biolab",
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "lab", amount = 1},
      {type = "item", name = "biter-egg", amount = 10},
      {type = "item", name = "refined-concrete", amount = 25},
      {type = "item", name = "capture-robot-rocket", amount = 2},
      {type = "item", name = "uranium-235", amount = 3}
    },
    results = {{type="item", name="biolab", amount=1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "captive-biter-spawner",
    category = "cryogenics",
    energy_required = 10,
    enabled = false,
    result_is_always_fresh = true,
    ingredients =
    {
      {type = "item", name = "biter-egg", amount = 10},
      {type = "item", name = "capture-robot-rocket", amount = 1},
      {type = "item", name = "uranium-235", amount = 15},
      {type = "fluid", name = "fluoroketone-cold", amount = 100},
    },
    results = {{type = "item", name = "captive-biter-spawner", amount = 1}}
  },
  {
    type = "recipe",
    name = "biter-egg",
    icon = "__space-age__/graphics/icons/biter-egg.png",
    category = "captive-spawner-process",
    order = "c[eggs]-a[biter-egg]",
    hide_from_player_crafting = true,
    auto_recycle = false,
    preserve_products_in_machine_output = true,
    energy_required = 10,
    ingredients = {},
    results =
    {
      {type = "item", name = "biter-egg", amount = 5}
    },
    enabled = false
  },
  {
    type = "recipe",
    name = "fish-breeding",
    icon = "__space-age__/graphics/icons/fish-breeding.png",
    category = "organic-or-chemistry",
    subgroup = "nauvis-agriculture",
    order = "b[nauvis-agriculture]-b[fish-breeding]",
    result_is_always_fresh = true,
    auto_recycle = false,
    energy_required = 6,
    enabled = false,
    surface_conditions =
    {
      {
        property = "pressure",
        min = 1000,
        max = 1000
      }
    },
    ingredients =
    {
      {type = "item", name = "raw-fish", amount = 2, ignored_by_stats = 2},
      {type = "item", name = "nutrients", amount = 100},
      {type = "fluid", name = "water", amount = 100}
    },
    results = {{type="item", name="raw-fish", amount=3, ignored_by_stats = 2}},
    allow_productivity = false,
    allow_quality = false,
    crafting_machine_tint =
    {
      primary = {0, 0, 1, 1},
      secondary = {0, 0, 1, 1}
    },
    show_amount_in_title = false
  },
  {
    type = "recipe",
    name = "nutrients-from-fish",
    icon = "__space-age__/graphics/icons/nutrients-from-fish.png",
    category = "organic-or-assembling",
    subgroup = "nauvis-agriculture",
    order = "b[nauvis-agriculture]-c[nutrients-from-fish]",
    auto_recycle = false,
    enabled = false,
    energy_required = 2,
    ingredients = {{type = "item", name = "raw-fish", amount = 1}},
    results = {{type="item", name="nutrients", amount=20}},
    allow_productivity = false,
    allow_quality = false,
    crafting_machine_tint =
    {
      primary = {1, 0, 0, 1},
      secondary = {1, 0, 0, 1}
    }
  },
  {
    type = "recipe",
    name = "nutrients-from-biter-egg",
    icon = "__space-age__/graphics/icons/nutrients-from-biter-egg.png",
    category = "organic-or-assembling",
    subgroup = "nauvis-agriculture",
    order = "b[nauvis-agriculture]-d[nutrients-from-biter-egg]",
    auto_recycle = false,
    enabled = false,
    energy_required = 2,
    ingredients = {{type = "item", name = "biter-egg", amount = 1}},
    results = {{type="item", name="nutrients", amount=20}},
    allow_productivity = true,
    allow_quality = false,
    crafting_machine_tint =
    {
      primary = {r = 1, g = 0, b = 0.25, a = 1},
      secondary = {r = 1, g = 0, b = 0.25, a = 1},
    },
  },
  -------------------------------------------------------------------------- Fulgora
  {
    type = "recipe",
    name = "scrap-recycling",
    icons = {
      {
        icon = "__quality__/graphics/icons/recycling.png"
      },
      {
        icon = "__space-age__/graphics/icons/scrap.png",
        scale = 0.4
      },
      {
        icon = "__quality__/graphics/icons/recycling-top.png"
      }
    },
    category = "recycling-or-hand-crafting",
    subgroup = "fulgora-processes",
    order = "a[trash]-a[trash-recycling]",
    enabled = false,
    auto_recycle = false,
    energy_required = 0.2,
    ingredients = {{type = "item", name = "scrap", amount = 1}},
    results =
    {
      {type = "item", name = "processing-unit",        amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false},
      {type = "item", name = "advanced-circuit",       amount = 1, probability = 0.03, show_details_in_recipe_tooltip = false},
      {type = "item", name = "low-density-structure",  amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false},
      {type = "item", name = "solid-fuel",             amount = 1, probability = 0.07, show_details_in_recipe_tooltip = false},
      {type = "item", name = "steel-plate",            amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
      {type = "item", name = "concrete",               amount = 1, probability = 0.06, show_details_in_recipe_tooltip = false},
      {type = "item", name = "battery",                amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
      {type = "item", name = "ice",                    amount = 1, probability = 0.05, show_details_in_recipe_tooltip = false},
      {type = "item", name = "stone",                  amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
      {type = "item", name = "holmium-ore",            amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false},
      {type = "item", name = "iron-gear-wheel",        amount = 1, probability = 0.20, show_details_in_recipe_tooltip = false},
      {type = "item", name = "copper-cable",           amount = 1, probability = 0.03, show_details_in_recipe_tooltip = false}
    }
  },
  {
    type = "recipe",
    name = "lightning-rod",
    category = "electronics",
    surface_conditions =
    {
      {
        property = "magnetic-field",
        min = 99,
        max = 99
      }
    },
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "copper-cable", amount = 12},
      {type = "item", name = "steel-plate", amount = 8},
      {type = "item", name = "stone-brick", amount = 4},
    },
    results = {{type="item", name="lightning-rod", amount=1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "holmium-solution",
    category = "chemistry",
    subgroup = "fulgora-processes",
    order = "b[holmium]-b[holmium-solution]",
    auto_recycle = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "holmium-ore", amount = 2},
      {type = "item", name = "stone", amount = 1},
      {type = "fluid", name="water", amount = 10}
    },
    results =
    {
      {type = "fluid", name="holmium-solution", amount = 100}
    },
    allow_productivity = true,
    main_product = "holmium-solution",
    enabled = false,
    crafting_machine_tint =
    {
      primary = {r = 0.598, g = 0.274, b = 0.501, a = 0.502}, -- #98457f80
      secondary = {r = 0.524, g = 0.499, b = 0.521, a = 0.502}, -- #857f8480
      tertiary = {r = 0.716, g = 0.716, b = 0.716, a = 0.502}, -- #b6b6b680
      quaternary = {r = 0.768, g = 0.487, b = 0.684, a = 0.502}, -- #c37cae80
    }
  },
  {
    type = "recipe",
    name = "holmium-plate",
    category = "crafting-with-fluid-or-metallurgy",
    subgroup = "fulgora-processes",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "holmium-solution", amount = 20, fluidbox_multiplier = 10},
    },
    energy_required = 1,
    results = {{type="item", name="holmium-plate", amount=1}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "electromagnetic-plant",
    category = "electronics-or-assembling",
    surface_conditions =
    {
      {
        property = "magnetic-field",
        min = 99
      }
    },
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "holmium-plate", amount = 150},
      {type = "item", name = "steel-plate", amount = 50},
      {type = "item", name = "processing-unit", amount = 50},
      {type = "item", name = "refined-concrete", amount = 50}
    },
    results = {{type="item", name="electromagnetic-plant", amount=1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "superconductor",
    category = "electromagnetics",
    subgroup = "fulgora-processes",
    order = "b[holmium]-d[superconductor]",
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "holmium-plate", amount = 1},
      {type = "item", name = "copper-plate", amount = 1},
      {type = "item", name = "plastic-bar", amount = 1},
      {type = "fluid", name = "light-oil", amount = 5},
    },
    results = {{type = "item", name = "superconductor", amount = 2}},
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "supercapacitor",
    category = "electromagnetics",
    subgroup = "fulgora-processes",
    order = "b[holmium]-f[supercapacitor]",
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "holmium-plate", amount = 2},
      {type = "item", name = "superconductor", amount = 2},
      {type = "item", name = "electronic-circuit", amount = 4},
      {type = "item", name = "battery", amount = 1},
      {type = "fluid", name = "electrolyte", amount = 10},
    },
    results = {{type="item", name="supercapacitor", amount=1}},
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "electrolyte",
    category = "electromagnetics",
    subgroup = "fulgora-processes",
    order = "b[holmium]-e[electrolyte]",
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "stone", amount = 1},
      {type = "fluid", name = "heavy-oil", amount = 10},
      {type = "fluid", name = "holmium-solution", amount = 10},
    },
    results = {{type = "fluid", name = "electrolyte", amount = 10}},
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "lightning-collector",
    category = "electromagnetics",
    surface_conditions =
    {
      {
        property = "magnetic-field",
        min = 99,
        max = 99
      }
    },
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "lightning-rod", amount = 1},
      {type = "item", name = "supercapacitor", amount = 8},
      {type = "item", name = "accumulator", amount = 1},
      {type = "fluid", name = "electrolyte", amount = 80},
    },
    results = {{type="item", name="lightning-collector", amount=1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "teslagun",
    category = "electromagnetics",
    energy_required = 30,
    ingredients =
    {
      {type = "item", name = "holmium-plate", amount = 10},
      {type = "item", name = "superconductor", amount = 10},
      {type = "item", name = "plastic-bar", amount = 30},
      {type = "fluid", name = "electrolyte", amount = 100},
    },
    results = {{type="item", name="teslagun", amount=1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "tesla-turret",
    category = "electromagnetics",
    energy_required = 30,
    ingredients =
    {
      {type = "item", name = "teslagun", amount = 1},
      {type = "item", name = "supercapacitor", amount = 10},
      {type = "item", name = "processing-unit", amount = 10},
      {type = "item", name = "superconductor", amount = 50},
      {type = "fluid", name = "electrolyte", amount = 500},
    },
    results = {{type="item", name="tesla-turret", amount=1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "tesla-ammo",
    category = "electromagnetics",
    energy_required = 30,
    ingredients =
    {
      {type = "item", name = "supercapacitor", amount = 1},
      {type = "item", name = "plastic-bar", amount = 1},
      {type = "fluid", name = "electrolyte", amount = 10},
    },
    results = {{type="item", name="tesla-ammo", amount=1}},
    enabled = false
  },

-------------------------------------------------------------------------- Aquilo
  {
    type = "recipe",
    name = "heating-tower",
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "boiler", amount = 2},
      {type = "item", name = "heat-pipe", amount = 5},
      {type = "item", name = "concrete", amount = 20},
    },
    results = {{type="item", name="heating-tower", amount=1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "lithium",
    category = "chemistry-or-cryogenics",
    subgroup = "aquilo-processes",
    order = "c[lithium]-a[lithium]",
    auto_recycle = false,
    energy_required = 20,
    ingredients =
    {
      {type = "item", name = "holmium-plate", amount = 1},
      {type = "fluid", name = "lithium-brine", amount = 50},
      {type = "fluid", name = "ammonia", amount = 50}
    },
    results = {{type = "item", name = "lithium", amount = 5}},
    allow_productivity = true,
    enabled = false,
    crafting_machine_tint =
    {
      primary = {r = 0.455, g = 0.837, b = 0.563, a = 1.000}, -- #73d58fff
      secondary = {r = 0.643, g = 0.668, b = 0.739, a = 1.000}, -- #a3aabcff
      tertiary = {r = 0.591, g = 0.556, b = 0.556, a = 1.000}, -- #968d8dff
      quaternary = {r = 1.000, g = 1.000, b = 1.000, a = 1.000}, -- #fffefeff
    }
  },
  {
    type = "recipe",
    name = "lithium-plate",
    category = "smelting",
    subgroup = "aquilo-processes",
    order = "c[lithium]-b[lithium-plate]",
    auto_recycle = false,
    energy_required = 6.4,
    ingredients = {{type = "item", name = "lithium", amount = 1}},
    results = {{type="item", name="lithium-plate", amount=1}},
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "fluoroketone",
    category = "cryogenics",
    subgroup = "aquilo-processes",
    order = "b[fluoroketone]-a[fluoroketone]",
    auto_recycle = false,
    energy_required = 10,
    ingredients =
    {
      {type = "fluid", name = "fluorine", amount = 50},
      {type = "fluid", name = "ammonia", amount = 50},
      {type = "item", name = "solid-fuel", amount = 1},
      {type = "item", name = "lithium", amount = 1},
    },
    results = {{type = "fluid", name = "fluoroketone-hot", amount = 50, temperature = 180}},
    allow_productivity = true,
    enabled = false,
    crafting_machine_tint =
    {
      primary = {r = 0.365, g = 0.815, b = 0.334, a = 1.000}, -- #5dcf55ff
      secondary = {r = 0.772, g = 0.394, b = 0.394, a = 1.000}, -- #c46464ff
      tertiary = {r = 0.116, g = 0.116, b = 0.111, a = 1.000}, -- #1d1d1cff
      quaternary = {r = 0.395, g = 0.717, b = 0.563, a = 1.000}, -- #64b68fff
    }
  },
  {
    type = "recipe",
    name = "fluoroketone-cooling",
    icon = "__space-age__/graphics/icons/fluid/fluoroketone-cooling.png",
    localised_name = {"recipe-name.fluoroketone-cooling"},
    category = "cryogenics",
    subgroup = "aquilo-processes",
    order = "b[fluoroketone]-b[fluoroketone-cooling]",
    auto_recycle = false,
    energy_required = 5,
    ingredients =
    {
      {type = "fluid", name = "fluoroketone-hot", amount = 10, ignored_by_stats = 10},
    },
    results =
    {
      {type = "fluid", name = "fluoroketone-cold", amount = 10, temperature = -150, ignored_by_stats = 10},
    },
    show_amount_in_title = false,
    always_show_products = true,
    allow_productivity = false,
    enabled = false,
    crafting_machine_tint =
    {
      primary = {r = 0.455, g = 0.837, b = 0.563, a = 1.000}, -- #73d58fff
      secondary = {r = 0.398, g = 0.732, b = 0.681, a = 1.000}, -- #65baadff
      tertiary = {r = 0.337, g = 0.306, b = 0.306, a = 1.000}, -- #554e4eff
      quaternary = {r = 0.436, g = 0.743, b = 0.711, a = 1.000}, -- #6fbdb5ff
    }
  },
  {
    type = "recipe",
    name = "cryogenic-plant",
    category = "cryogenics-or-assembling",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 100,
        max = 600
      }
    },
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "refined-concrete", amount = 40},
      {type = "item", name = "superconductor", amount = 20},
      {type = "item", name = "processing-unit", amount = 20},
      {type = "item", name = "lithium-plate", amount = 20},
    },
    results = {{type="item", name="cryogenic-plant", amount=1}},
    enabled = false,
    crafting_machine_tint =
    {
      primary = {r = 0.294, g = 0.368, b = 0.862, a = 1.000}, -- #4a5ddbff
      secondary = {r = 0.420, g = 0.851, b = 0.767, a = 1.000}, -- #6ad9c3ff
      tertiary = {r = 0.260, g = 0.245, b = 0.301, a = 1.000}, -- #423e4cff
      quaternary = {r = 0.566, g = 0.841, b = 0.769, a = 1.000}, -- #90d6c4ff
    }
  },
  {
    type = "recipe",
    name = "quantum-processor",
    category = "electromagnetics",
    subgroup = "aquilo-processes",
    surface_conditions =
    {
      {
        property = "pressure",
        max = 600
      }
    },
    order = "c[lithium]-c[quantum-processor]",
    energy_required = 30,
    ingredients =
    {
      {type = "item", name = "tungsten-carbide", amount = 1},
      {type = "item", name = "processing-unit", amount = 1},
      {type = "item", name = "superconductor", amount = 1},
      {type = "item", name = "carbon-fiber", amount = 1},
      {type = "item", name = "lithium-plate", amount = 2},
      {type = "fluid", name = "fluoroketone-cold", amount = 10, ignored_by_stats = 10},
    },
    results = {
      {type = "item", name = "quantum-processor", amount = 1},
      {type = "fluid", name = "fluoroketone-hot", amount = 5, temperature = 180, ignored_by_stats = 5, ignored_by_productivity = 5}
    },
    allow_productivity = true,
    main_product = "quantum-processor",
    enabled = false,
    crafting_machine_tint =
    {
      primary = {r = 0.460, g = 0.188, b = 0.649, a = 1.000}, -- #752fa5ff
      secondary = {r = 0.489, g = 0.484, b = 0.381, a = 1.000}, -- #7c7b61ff
      tertiary = {r = 0.196, g = 0.101, b = 0.101, a = 1.000}, -- #311919ff
      quaternary = {r = 0.518, g = 0.539, b = 0.993, a = 1.000}, -- #8489fdff
    }
  },
  {
    type = "recipe",
    name = "ammoniacal-solution-separation",
    icon = "__space-age__/graphics/icons/fluid/ammoniacal-solution-separation.png",
    category = "chemistry-or-cryogenics",
    subgroup = "aquilo-processes",
    order = "a[ammonia]-a[ammoniacal-solution-separation]",
    auto_recycle = false,
    energy_required = 1,
    ingredients =
    {
      {type = "fluid", name = "ammoniacal-solution", amount = 50},
    },
    results =
    {
      {type = "item", name = "ice", amount = 5},
      {type = "fluid", name = "ammonia", amount = 50},
    },
    allow_productivity = true,
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    allow_decomposition = false,
    crafting_machine_tint =
    {
      primary = {r = 0.596, g = 0.764, b = 0.780, a = 1.000},
      secondary = {r = 0.551, g = 0.762, b = 0.844, a = 1.000},
      tertiary = {r = 0.596, g = 0.773, b = 0.895, a = 1.000},
      quaternary = {r = 0.290, g = 0.734, b = 1, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "fusion-reactor-equipment",
    enabled = false,
    energy_required = 30,
    ingredients =
    {
      {type = "item", name = "fission-reactor-equipment", amount = 1},
      {type = "item", name = "fusion-power-cell", amount = 10},
      {type = "item", name = "tungsten-plate", amount = 250},
      {type = "item", name = "carbon-fiber", amount = 100},
      {type = "item", name = "supercapacitor", amount = 25},
      {type = "item", name = "quantum-processor", amount = 250}
    },
    results = {{type="item", name="fusion-reactor-equipment", amount=1}},
    crafting_machine_tint =
    {
      primary = {r = 0.298, g = 0.442, b = 0.518, a = 1.000}, -- #4c7084ff
      secondary = {r = 0.864, g = 0.706, b = 0.902, a = 1.000}, -- #dcb4e6ff
      tertiary = {r = 0.159, g = 0.136, b = 0.207, a = 1.000}, -- #282234ff
      quaternary = {r = 0.945, g = 0.370, b = 1.000, a = 1.000}, -- #f15effff
    }
  },
  {
    type = "recipe",
    name = "fusion-power-cell",
    category = "cryogenics",
    subgroup = "aquilo-processes",
    order = "c[lithium]-d[fusion-power-cell]",
    auto_recycle = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "lithium-plate", amount = 5},
      {type = "item", name = "holmium-plate", amount = 1},
      {type = "fluid", name = "ammonia", amount = 100}
    },
    results = {{type="item", name="fusion-power-cell", amount=1}},
    allow_productivity = true,
    enabled = false,
    crafting_machine_tint =
    {
      primary = {r = 0.054, g = 0.897, b = 1.000, a = 1.000}, -- #0de4ffff
      secondary = {r = 1.000, g = 0.779, b = 0.974, a = 1.000}, -- #ffc6f8ff
      tertiary = {r = 0.497, g = 0.655, b = 0.757, a = 1.000}, -- #7ea7c1ff
      quaternary = {r = 0.761, g = 0.312, b = 1.000, a = 1.000}, -- #c14fffff
    }
  },
  {
    type = "recipe",
    name = "fusion-reactor",
    category = "cryogenics",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 100,
        max = 600
      }
    },
    energy_required = 60,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "tungsten-plate", amount = 200},
      {type = "item", name = "superconductor", amount = 200},
      {type = "item", name = "quantum-processor", amount = 250},
    },
    results = {{type="item", name="fusion-reactor", amount=1}},
    requester_paste_multiplier = 1,
    crafting_machine_tint =
    {
      primary = {r = 0.298, g = 0.442, b = 0.518, a = 1.000}, -- #4c7084ff
      secondary = {r = 0.864, g = 0.706, b = 0.902, a = 1.000}, -- #dcb4e6ff
      tertiary = {r = 0.159, g = 0.136, b = 0.207, a = 1.000}, -- #282234ff
      quaternary = {r = 0.945, g = 0.370, b = 1.000, a = 1.000}, -- #f15effff
    }
  },
  {
    type = "recipe",
    name = "fusion-generator",
    category = "cryogenics",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 100,
        max = 600
      }
    },
    energy_required = 30,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "tungsten-plate", amount = 100},
      {type = "item", name = "superconductor", amount = 100},
      {type = "item", name = "quantum-processor", amount = 50},
    },
    results = {{type="item", name="fusion-generator", amount=1}},
    requester_paste_multiplier = 1,
    crafting_machine_tint =
    {
      primary = {r = 0.298, g = 0.442, b = 0.518, a = 1.000}, -- #4c7084ff
      secondary = {r = 0.864, g = 0.706, b = 0.902, a = 1.000}, -- #dcb4e6ff
      tertiary = {r = 0.159, g = 0.136, b = 0.207, a = 1.000}, -- #282234ff
      quaternary = {r = 0.945, g = 0.370, b = 1.000, a = 1.000}, -- #f15effff
    }
  },
  {
    type = "recipe",
    name = "ice-platform",
    always_show_made_in = true,
    category = "crafting-with-fluid",
    energy_required = 30,
    ingredients =
    {
      {type = "fluid", name = "ammonia", amount = 400},
      {type = "item", name = "ice", amount = 50},
    },
    results = {{type="item", name="ice-platform", amount=1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "solid-fuel-from-ammonia",
    icon = "__space-age__/graphics/icons/solid-fuel-from-ammonia.png",
    energy_required = 1,
    enabled = false,
    category = "chemistry-or-cryogenics",
    subgroup = "aquilo-processes",
    order = "a[ammonia]-b[solid-fuel-from-ammonia]",
    ingredients =
    {
      {type="fluid", name = "ammonia", amount = 50},
      {type="fluid", name = "crude-oil", amount = 20}
    },
    results = {{type="item", name="solid-fuel", amount=1}},
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0.222, g = 0.188, b = 0.344, a = 1.000}, -- #383057ff
      secondary = {r = 0.394, g = 0.481, b = 0.594, a = 1.000}, -- #647a97ff
      tertiary = {r = 0.370, g = 0.362, b = 0.362, a = 1.000}, -- #5e5c5cff
      quaternary = {r = 0.192, g = 0.210, b = 0.308, a = 1.000}, -- #30354eff
    }
  },
  {
    type = "recipe",
    name = "ammonia-rocket-fuel",
    localised_name = {"recipe-name.ammonia-rocket-fuel"},
    icon = "__space-age__/graphics/icons/ammonia-rocket-fuel.png",
    energy_required = 10,
    enabled = false,
    category = "chemistry-or-cryogenics",
    subgroup = "aquilo-processes",
    order = "a[ammonia]-c[ammonia-rocket-fuel]",
    ingredients =
    {
      {type = "item", name = "solid-fuel", amount = 3},
      {type="fluid", name = "water", amount= 50},
      {type="fluid", name = "ammonia", amount = 500}
    },
    results = {{type="item", name="rocket-fuel", amount=1}},
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0.996, g = 0.742, b = 0.408, a = 1.000}, -- #febd68ff
      secondary = {r = 0.446, g = 0.392, b = 0.168, a = 1.000}, -- #71632aff
      tertiary = {r = 0.347, g = 0.388, b = 0.387, a = 1.000}, -- #586262ff
      quaternary = {r = 0.656, g = 0.562, b = 0.264, a = 1.000}, -- #a78f43ff
    }
  },
  {
    type = "recipe",
    name = "foundation",
    energy_required = 30,
    enabled = false,
    category = "crafting-with-fluid",
    ingredients =
    {
      {type = "item", name = "tungsten-plate", amount = 4},
      {type = "item", name = "lithium-plate", amount = 4},
      {type = "item", name = "carbon-fiber", amount = 4},
      {type = "item", name = "stone", amount = 20},
      {type = "fluid", name = "fluoroketone-cold", amount = 20}
    },
    results = {{type="item", name="foundation", amount=1}}
  },
  {
    type = "recipe",
    name = "promethium-science-pack",
    energy_required = 5,
    surface_conditions =
    {
      {
        property = "gravity",
        min = 0,
        max = 0
      }
    },
    enabled = false,
    allow_productivity = true,
    category = "cryogenics",
    ingredients =
    {
      {type = "item", name = "promethium-asteroid-chunk", amount = 25},
      {type = "item", name = "quantum-processor", amount = 1},
      {type = "item", name = "biter-egg", amount = 10}
    },
    results = {{type="item", name="promethium-science-pack", amount=10}},
    crafting_machine_tint =
    {
      primary = {r = 0, g = 0, b = 0.1, a = 1},
      secondary = {r = 0, g = 0, b = 0.4, a = 1},
      tertiary = {r = 0.1, g = 0.1, b = 0.4, a = 1},
      quaternary = {r = 0, g = 0, b = 0.1, a = 1},
    }
  },
  {
    type = "recipe",
    name = "wood-processing",
    icon = "__base__/graphics/icons/tree-08.png",
    category = "organic-or-assembling",
    subgroup = "nauvis-agriculture",
    order = "b[nauvis-agriculture]-a[wood-processing]",
    enabled = false,
    allow_productivity = true,
    energy_required = 2,
    ingredients = {{type = "item", name = "wood", amount = 2}},
    surface_conditions =
    { -- tree seeds can only be planted on nauvis
      {
        property = "pressure",
        min = 1000,
        max = 1000
      }
    },
    results =
    {
      {type = "item", name = "tree-seed", amount = 1},
    },
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 0.442, g = 0.205, b = 0.090, a = 1.000}, -- #703416ff
      secondary = {r = 1.000, g = 0.500, b = 0.000, a = 1.000}, -- #ff7f00ff
    }
  }
})

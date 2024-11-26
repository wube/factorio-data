data:extend
({
  {
    type = "technology",
    name = "quality-module",
    icon = "__quality__/graphics/technology/quality-module-1.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "quality-module"
      },
      {
        type = "unlock-quality",
        quality = "uncommon"
      },
      {
        type = "unlock-quality",
        quality = "rare"
      }
    },
    prerequisites = { "modules" },
    unit =
    {
      count = 500,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 }
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "quality-module-2",
    icon = "__quality__/graphics/technology/quality-module-2.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "quality-module-2"
      }
    },
    prerequisites = { "quality-module", "processing-unit" },
    unit =
    {
      count = 75,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 }
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "quality-module-3",
    icon = "__quality__/graphics/technology/quality-module-3.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "quality-module-3"
      }
    },
    prerequisites = { "quality-module-2", "production-science-pack" },
    unit =
    {
      count = 300,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 }
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "epic-quality",
    icon_size = 256,
    icon = "__quality__/graphics/technology/epic-quality.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-quality",
        quality = "epic"
      }
    },
    prerequisites = { "quality-module", "utility-science-pack", "production-science-pack" },
    unit =
    {
      count = 5000,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 }
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "legendary-quality",
    icon_size = 256,
    icon = "__quality__/graphics/technology/legendary-quality.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-quality",
        quality = "legendary"
      }
    },
    prerequisites = { "space-science-pack", "epic-quality" },
    unit =
    {
      count = 5000,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "space-science-pack", 1 },
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "recycling",
    icon = "__quality__/graphics/technology/recycling.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "recycler"
      },
    },
    prerequisites = {"production-science-pack", "processing-unit", "concrete"},
    unit =
    {
      count = 5000,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 }
      },
      time = 15
    }
  }
})

data:extend(
  {
    {
      type = "technology",
      name = "elevated-rail",
      icon = "__elevated-rails__/graphics/technology/elevated-rail.png",
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "rail-support"
        },
        {
          type = "unlock-recipe",
          recipe = "rail-ramp"
        },
        {
          type = "rail-planner-allow-elevated-rails",
          modifier = true
        },
      },
      prerequisites = { "concrete", "production-science-pack" },
      unit =
      {
        count = 100,
        ingredients =
        {
          { "automation-science-pack", 1 },
          { "logistic-science-pack", 1 },
          { "chemical-science-pack", 1 },
          { "production-science-pack", 1 }
        },
        time = 30
      }
    },
  }
)

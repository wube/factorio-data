local simulations = require("__quality__/prototypes/tips-and-tricks-simulations")

data:extend(
  {
    {
      type = "tips-and-tricks-item-category",
      name = "quality",
      order = "j-[quality]"
    },
    {
      type = "tips-and-tricks-item",
      name = "quality",
      category = "quality",
      order = "a",
      is_title = true,
      trigger =
      {
        type = "unlock-recipe",
        recipe = "quality-module"
      },
      skip_trigger =
      {
        type = "build-entity",
        quality = "uncommon",
        count = 10
      },
      simulation = simulations.quality
    },
    {
      type = "tips-and-tricks-item",
      name = "quality-factoriopedia",
      tag = "[technology=legendary-quality]",
      category = "quality",
      order = "b",
      indent = 1,
      trigger =
      {
        type = "time-since-last-tip-activation",
        ticks = 30 * minute
      },
      skip_trigger =
      {
        type = "sequence",
        triggers =
        {
          {
            type = "dependencies-met",
          },
          {
            type = "time-elapsed",
            ticks = 180 * minute
          }
        }
      },
      dependencies = {"quality"},
      simulation = simulations.quality_factoriopedia
    },
    {
      type = "tips-and-tricks-item",
      name = "quality-modules",
      tag = "[item=quality-module]",
      category = "quality",
      order = "c",
      indent = 1,
      skip_trigger =
      {
        type = "module-transfer",
        module = "quality-module",
        count = 12
      },
      dependencies = { "quality" },
      simulation = simulations.quality_modules
    },
    {
      type = "tips-and-tricks-item",
      name = "quality-probabilities",
      tag = "[item=quality-module][item=quality-module-3]",
      category = "quality",
      order = "d",
      indent = 1,
      trigger =
      {
        type = "time-since-last-tip-activation",
        ticks = 30 * minute
      },
      skip_trigger =
      {
        type = "sequence",
        triggers =
        {
          {
            type = "dependencies-met",
          },
          {
            type = "time-elapsed",
            ticks = 180 * minute
          }
        }
      },
      dependencies = { "quality-modules" },
      simulation = simulations.quality_probabilities
    }
  })

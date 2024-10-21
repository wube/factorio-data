local simulations = require("__elevated-rails__/prototypes/tips-and-tricks-simulations")

data:extend(
{
  {
    type = "tips-and-tricks-item",
    name = "elevated-rails",
    tag = "[item=rail-ramp]",
    category = "trains",
    order = "c",
    indent = 1,
    trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "research",
          technology = "elevated-rail"
        },
        {
          type = "or",
          triggers =
          {
            {
              type = "craft-item",
              item = "rail-ramp",
              event_type = "crafting-finished"
            },
            {
              type = "time-elapsed",
              ticks = 30 * minute
            }
          }
        },
        {
          type = "time-since-last-tip-activation",
          ticks = 15 * minute
        }
      }
    },
    skip_trigger =
    {
      type = "toggle-rail-layer",
      count = 5
    },
    simulation = simulations.elevated_rails
  }
})

data:extend(
{
  {
    type = "virtual-signal",
    name = "signal-unknown",
    icon = "__core__/graphics/icons/unknown.png",
    icon_size = 64,
    subgroup = "other",
    special_signal = true
  },
  {
    type = "flying-text",
    name = "entity-unknown",
    icon = "__core__/graphics/icons/unknown.png",
    icon_size = 64,
    flags = {"hidden"},
    time_to_live = 0,
   speed = 0
  },
  {
    type = "item",
    name = "item-unknown",
    icon = "__core__/graphics/icons/unknown.png",
    icon_size = 64,
    flags = {"hidden"},
    stack_size = 1
  },
  {
    type = "fluid",
    name = "fluid-unknown",
    icon = "__core__/graphics/icons/unknown.png",
    base_color = {},
    flow_color = {},
    icon_size = 64,
    hidden = true,
    default_temperature = 0,
    max_temperature = 0,
    auto_barrel = false
  },
  {
    name = "tile-unknown",
    type = "tile",
    order = "z-a",
    collision_mask = {},
    layer_group = "zero",
    layer = 0,
    variants =
    {
      main =
      {
        {
          picture = "__core__/graphics/icons/unknown.png",
          count = 1,
          size = 1,
          scale = 0.5,
          hr_version =
          {
            picture = "__core__/graphics/icons/unknown.png",
            count = 1,
            size = 1,
            scale = 0.5,
          }
        }
      },
      empty_transitions = true
    },
    map_color = {r=0, g=0, b=0},
    pollution_absorption_per_second = 0
  },
})

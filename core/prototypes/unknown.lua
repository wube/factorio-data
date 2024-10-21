data:extend(
{
  {
    type = "virtual-signal",
    name = "signal-unknown",
    icon = "__core__/graphics/icons/unknown.png",
    hidden = true
  },
  {
    type = "entity-ghost",
    name = "entity-unknown",
    icon = "__core__/graphics/icons/unknown.png",
    hidden = true
  },
  {
    type = "item",
    name = "item-unknown",
    icon = "__core__/graphics/icons/unknown.png",
    hidden = true,
    stack_size = 1
  },
  {
    type = "recipe",
    name = "recipe-unknown",
    icon = "__core__/graphics/icons/unknown.png",
    icon_size = 64,
    hidden = true,
    ingredients = {},
    results = {}
  },
  {
    type = "quality",
    name = "quality-unknown",
    level = 0, -- so it is at the end internally
    color = {1, 1, 1},
    order = "z",
    icons =
    {{
      icon = "__core__/graphics/icons/unknown.png",
      scale = 0.5
    }},
    hidden = true
  },
  {
    type = "fluid",
    name = "fluid-unknown",
    icon = "__core__/graphics/icons/unknown.png",
    base_color = {},
    flow_color = {},
    hidden = true,
    default_temperature = 0,
    max_temperature = 0,
    auto_barrel = false
  },
  {
    name = "tile-unknown",
    type = "tile",
    order = "z-a",
    hidden = true,
    collision_mask = {layers={}},
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
          scale = 0.5
        }
      },
      empty_transitions = true
    },
    map_color = {r=0, g=0, b=0}
  },
  {
    type = "space-location",
    name = "space-location-unknown",
    hidden = true,
    distance = 0,
    orientation = 0,
    icon = "__core__/graphics/icons/unknown.png",
  },
  {
    type = "asteroid-chunk",
    name = "asteroid-chunk-unknown",
    hidden = true,
    icon = "__core__/graphics/icons/unknown.png",
  }
})

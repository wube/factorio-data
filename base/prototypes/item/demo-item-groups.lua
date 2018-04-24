data:extend(
{
  {
    type = "item-group",
    name = "signals",
    order = "f",
    inventory_order = "a",
    icon = data.is_demo and "__core__/graphics/questionmark.png" or "__base__/graphics/item-group/signals.png",
  },
  {
    type = "item-subgroup",
    name = "virtual-signal-special",
    group = "signals",
    order = "a"
  },
  {
    type = "item-group",
    name = "other",
    icon = "__core__/graphics/questionmark.png",
    order = "z",
    inventory_order = "z"
  },
  {
    type = "item-subgroup",
    name = "other",
    group = "other",
    order = "z",
  }
}
)

data:extend(
{
  {
    type = "item-group",
    name = "signals",
    order = "f",
    icon = "__base__/graphics/item-group/signals.png",
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
    icon_size = 64,
    order = "z",
  },
  {
    type = "item-subgroup",
    name = "other",
    group = "other",
    order = "z",
  },
  {
    type = "item-subgroup",
    name = "virtual-signal-color",
    group = "signals",
    order = "d"
  },
  {
    type = "item-group",
    name = "environment",
    icon = "__core__/graphics/treex64-provisional.png",
    icon_size = 64,
    order = "a"
  },
  {
    type = "item-subgroup",
    name = "creatures",
    group = "environment",
    order = "a",
  },
  {
    type = "item-subgroup",
    name = "trees",
    group = "environment",
    order = "aa",
  },
  {
    type = "item-subgroup",
    name = "grass",
    group = "environment",
    order = "b",
  },
  {
    type = "item-subgroup",
    name = "corpses",
    group = "environment",
    order = "c",
  },
  {
    type = "item-subgroup",
    name = "remnants",
    group = "environment",
    order = "d",
  },
  {
    type = "item-subgroup",
    name = "wrecks",
    group = "environment",
    order = "e",
  },

  {
    type = "item-group",
    name = "enemies",
    icon = "__core__/graphics/enemy-force-icon.png",
    icon_size = 64,
    order = "aa"
  },
  {
    type = "item-subgroup",
    name = "enemies",
    group = "enemies",
    order = "a",
  },
  {
    type = "item-group",
    name = "logistics",
    order = "aaa",
    icon = "__base__/graphics/item-group/logistics.png"
  },
  {
    type = "item-subgroup",
    name = "storage",
    group = "logistics",
    order = "a",
  },
  {
    type = "item-subgroup",
    name = "belt",
    group = "logistics",
    order = "b",
  },
  {
    type = "item-subgroup",
    name = "inserter",
    group = "logistics",
    order = "c",
  },
  {
    type = "item-subgroup",
    name = "energy-pipe-distribution",
    group = "logistics",
    order = "d"
  },
  {
    type = "item-subgroup",
    name = "transport",
    group = "logistics",
    order = "e",
  },
  {
    type = "item-subgroup",
    name = "logistic-network",
    group = "logistics",
    order = "f",
  },
  {
    type = "item-subgroup",
    name = "circuit-network",
    group = "logistics",
    order = "g"
  },
  {
    type = "item-subgroup",
    name = "terrain",
    group = "logistics",
    order = "h",
  },
  {
    type = "item-group",
    name = "production",
    order = "b",
    icon = "__base__/graphics/item-group/production.png"
  },
  {
    type = "item-subgroup",
    name = "tool",
    group = "production",
    order = "a",
  },
  {
    type = "item-subgroup",
    name = "energy",
    group = "production",
    order = "b"
  },
  {
    type = "item-subgroup",
    name = "extraction-machine",
    group = "production",
    order = "c",
  },
  {
    type = "item-subgroup",
    name = "smelting-machine",
    group = "production",
    order = "d",
  },
  {
    type = "item-subgroup",
    name = "production-machine",
    group = "production",
    order = "e",
  },
  {
    type = "item-subgroup",
    name = "module",
    group = "production",
    order = "f",
  },

  {
    type = "item-group",
    name = "combat",
    order = "d",
    icon = "__base__/graphics/item-group/military.png"
  },
  {
    type = "item-subgroup",
    name = "gun",
    group = "combat",
    order = "a"
  },
  {
    type = "item-subgroup",
    name = "ammo",
    group = "combat",
    order = "b"
  },
  {
    type = "item-subgroup",
    name = "capsule",
    group = "combat",
    order = "c"
  },
  {
    type = "item-subgroup",
    name = "armor",
    group = "combat",
    order = "d"
  },
  {
    type = "item-subgroup",
    name = "equipment",
    group = "combat",
    order = "e"
  },
  {
    type = "item-subgroup",
    name = "defensive-structure",
    group = "combat",
    order = "f"
  },
  {
    type = "item-group",
    name = "intermediate-products",
    order = "c",
    icon = "__base__/graphics/item-group/intermediate-products.png",
  },
  {
    type = "item-subgroup",
    name = "fluid-recipes",
    group = "intermediate-products",
    order = "a"
  },
  {
    type = "item-subgroup",
    name = "raw-resource",
    group = "intermediate-products",
    order = "b"
  },
  {
    type = "item-subgroup",
    name = "raw-material",
    group = "intermediate-products",
    order = "c"
  },
  {
    type = "item-subgroup",
    name = "fill-barrel",
    group = "intermediate-products",
    order = "d"
  },
  {
    type = "item-subgroup",
    name = "empty-barrel",
    group = "intermediate-products",
    order = "e"
  },
  {
    type = "item-subgroup",
    name = "intermediate-product",
    group = "intermediate-products",
    order = "f"
  },
  {
    type = "item-subgroup",
    name = "science-pack",
    group = "intermediate-products",
    order = "g"
  },
  {
    type = "item-group",
    name = "fluids",
    order = "e",
    icon = "__base__/graphics/item-group/fluids.png",
  },
  {
    type = "item-subgroup",
    name = "fluid",
    group = "fluids",
    order = "a"
  },
  {
    type = "item-subgroup",
    name = "virtual-signal-number",
    group = "signals",
    order = "b"
  },
  {
    type = "item-subgroup",
    name = "virtual-signal-letter",
    group = "signals",
    order = "c"
  },
  {
    type = "item-subgroup",
    name = "virtual-signal",
    group = "signals",
    order = "e"
  }
}
)

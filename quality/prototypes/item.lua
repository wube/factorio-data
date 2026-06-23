local item_sounds = require("__base__.prototypes.item_sounds")

data:extend
({
  {
    type = "module",
    name = "quality-module",
    localised_description = { "item-description.quality-module" },
    icon = "__quality__/graphics/icons/quality-module.png",
    subgroup = "module",
    color_hint = { text = "Q" },
    category = "quality",
    tier = 1,
    order = "d[quality]-a[quality-module-1]",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    stack_size = 50,
    weight = 20 * kg,
    effect = { quality = 0.01, speed = -0.05 }
  },
  {
    type = "module",
    name = "quality-module-2",
    localised_description = { "item-description.quality-module" },
    icon = "__quality__/graphics/icons/quality-module-2.png",
    subgroup = "module",
    color_hint = { text = "Q" },
    category = "quality",
    tier = 2,
    order = "d[quality]-b[quality-module-2]",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    stack_size = 50,
    weight = 20 * kg,
    effect = { quality = 0.02, speed = -0.05 }
  },
  {
    type = "module",
    name = "quality-module-3",
    localised_description = { "item-description.quality-module" },
    icon = "__quality__/graphics/icons/quality-module-3.png",
    subgroup = "module",
    color_hint = { text = "Q" },
    category = "quality",
    tier = 3,
    order = "d[quality]-c[quality-module-3]",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    stack_size = 50,
    weight = 20 * kg,
    effect = { quality = 0.025, speed = -0.05 }
  },
})

local item_sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend(
  {
    {
      type = "rail-planner",
      name = "rail-ramp",
      icon = "__elevated-rails__/graphics/icons/rail-ramp.png",
      subgroup = "train-transport",
      order = "a[rail]-b[rail-ramp]",
      inventory_move_sound = item_sounds.train_inventory_move,
      pick_sound = item_sounds.train_inventory_pickup,
      drop_sound = item_sounds.train_inventory_move,
      place_result = "rail-ramp",
      rails =
      {
        "straight-rail",
        "curved-rail-a",
        "curved-rail-b",
        "half-diagonal-rail"
      },
      stack_size = 10
    },
    {
      type = "item",
      name = "rail-support",
      icon = "__elevated-rails__/graphics/icons/rail-support.png", -- TODO (@GFX)
      subgroup = "train-transport",
      order = "a[rail]-c[rail-support]",
      inventory_move_sound = item_sounds.train_inventory_move,
      pick_sound = item_sounds.train_inventory_pickup,
      drop_sound = item_sounds.train_inventory_move,
      place_result = "rail-support",
      stack_size = 20,
      weight = 200*kg
    }
  }
)

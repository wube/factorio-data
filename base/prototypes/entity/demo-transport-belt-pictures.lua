-- Specifies set of pictures and animations used by more entities, to avoid duplication.
-- The standard set of transport belt pictures (vertical/horizontal + endigns + startings)
-- are used in transport belt, transport belt to ground and splitter.

ending_patch_prototype =
  {
    sheet =
    {
      filename = "__base__/graphics/entity/basic-transport-belt/start-end-integration-patches.png",
      width = 40,
      height = 40,
      priority = "extra-high"
    }
  }

---------------------- BASIC BELT PICTURES
basic_belt_horizontal =
  {
    filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16
  }
basic_belt_vertical =
  {
    filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 40
  }
basic_belt_ending_top =
  {
    filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 80
  }
basic_belt_ending_bottom =
  {
    filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 120
  }
basic_belt_ending_side =
  {
    filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 160
  }
basic_belt_starting_top =
  {
    filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 200
  }
basic_belt_starting_bottom =
  {
    filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 240
  }
basic_belt_starting_side =
  {
    filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 280
  }

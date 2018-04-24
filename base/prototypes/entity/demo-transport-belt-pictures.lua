-- Specifies set of pictures and animations used by more entities, to avoid duplication.
-- The standard set of transport belt pictures (vertical/horizontal + endings + startings)
-- are used in transport belt, transport belt to ground and splitter.

ending_patch_prototype =
  {
    sheet =
    {
      filename = "__base__/graphics/entity/transport-belt/start-end-integration-patches.png",
      width = 40,
      height = 40,
      priority = "extra-high",
      hr_version =
      {
        filename = "__base__/graphics/entity/transport-belt/hr-start-end-integration-patches.png",
        width = 80,
        height = 80,
        priority = "extra-high",
        scale = 0.5
      }
    }
  }

---------------------- BASIC BELT PICTURES
basic_belt_horizontal =
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      scale = 0.5,
      frame_count = 16
    }
  }
basic_belt_vertical =
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 40,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      frame_count = 16,
      scale = 0.5,
      y = 80
    }
  }
basic_belt_ending_top =
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 80,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      frame_count = 16,
      y = 160,
      scale = 0.5
    }
  }
basic_belt_ending_bottom =
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 120,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      frame_count = 16,
      y = 240,
      scale = 0.5
    }
  }
basic_belt_ending_side =
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 160,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      frame_count = 16,
      y = 320,
      scale = 0.5
    }
  }

basic_belt_starting_top =
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 200,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      frame_count = 16,
      y = 400,
      scale = 0.5
    }
  }
basic_belt_starting_bottom =
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 240,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      frame_count = 16,
      y = 480,
      scale = 0.5
    }
  }
basic_belt_starting_side =
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 280,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      frame_count = 16,
      y = 560,
      scale = 0.5
    }
  }

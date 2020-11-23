data:extend
{
  {
    type = "container",
    name = "factorio-logo-11tiles",
    icon = "__base__/graphics/icons/factorio-logo-11tiles.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "hidden"},
    minable = {mining_time = 0.1},
    max_health = 666,
    collision_box = {{-5.5+0.15, -1+0.15}, {5.5-0.15, 1-0.15}},
    selection_box = {{-5.5, -1}, {5.5, 1}},
    inventory_size = 1,
    picture =
    {
      filename = "__base__/graphics/entity/factorio-logo/factorio-logo-11tiles.png",
      priority = "extra-high",
      width = 768,
      height = 256,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    },
    resistances =
    {
      {
        type = "fire",
        decrease = 0,
        percent = 100
      },
      {
        type = "physical",
        decrease = 0,
        percent = 100
      },
      {
        type = "impact",
        decrease = 0,
        percent = 0
      },
      {
        type = "explosion",
        decrease = 0,
        percent = 100
      },
      {
        type = "acid",
        decrease = 0,
        percent = 100
      },
      {
        type = "laser",
        decrease = 0,
        percent = 100
      },
      {
        type = "electric",
        decrease = 0,
        percent = 100
      },
    },
  },
  {
    type = "container",
    name = "factorio-logo-16tiles",
    icon = "__base__/graphics/icons/factorio-logo-16tiles.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "hidden"},
    minable = {mining_time = 0.1},
    max_health = 666,
    collision_box = {{-8+0.15, -1+0.15}, {8-0.15, 1-0.15}},
    selection_box = {{-8, -1}, {8, 1}},
    inventory_size = 1,
    picture =
    {
      filename = "__base__/graphics/entity/factorio-logo/factorio-logo-16tiles.png",
      priority = "extra-high",
      width = 1536,
      height = 512,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    },
    resistances =
    {
      {
        type = "fire",
        decrease = 0,
        percent = 100
      },
      {
        type = "physical",
        decrease = 0,
        percent = 100
      },
      {
        type = "impact",
        decrease = 0,
        percent = 100
      },
      {
        type = "explosion",
        decrease = 0,
        percent = 100
      },
      {
        type = "acid",
        decrease = 0,
        percent = 100
      },
      {
        type = "laser",
        decrease = 0,
        percent = 100
      },
      {
        type = "electric",
        decrease = 0,
        percent = 100
      },
    },
  },
  {
    type = "container",
    name = "factorio-logo-22tiles",
    icon = "__base__/graphics/icons/factorio-logo-22tiles.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "hidden"},
    minable = {mining_time = 0.1},
    max_health = 666,
    collision_box = {{-11+0.15, -1.5+0.15}, {11-0.15, 1.5-0.15}},
    selection_box = {{-11, -1.5}, {11, 1.5}},
    inventory_size = 1,
    picture =
    {
      filename = "__base__/graphics/entity/factorio-logo/factorio-logo-22tiles.png",
      priority = "extra-high",
      width = 1536,
      height = 512,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    },
    resistances =
    {
      {
        type = "fire",
        decrease = 0,
        percent = 100
      },
      {
        type = "physical",
        decrease = 0,
        percent = 100
      },
      {
        type = "impact",
        decrease = 0,
        percent = 100
      },
      {
        type = "explosion",
        decrease = 0,
        percent = 100
      },
      {
        type = "acid",
        decrease = 0,
        percent = 100
      },
      {
        type = "laser",
        decrease = 0,
        percent = 100
      },
      {
        type = "electric",
        decrease = 0,
        percent = 100
      },
    },
  }
}

data:extend
{
  {
    type = "tile",
    name = "water-wube",
    icon = "__base__/graphics/icons/water-wube.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "x-a",
    collision_mask =
    {
      "water-tile",
      "item-layer",
      "resource-layer",
      "player-layer",
      "doodad-layer"
    },
    layer = 2,
    map_color={r=0, g=0, b=0},
    pollution_absorption_per_second = 0,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/water-wube/concrete-dummy.png",
          count = 1,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/water-wube/concrete-dummy.png",
          count = 1,
          size = 2,
          probability = 0.39
        },
        {
          picture = "__base__/graphics/terrain/water-wube/concrete-dummy.png",
          count = 1,
          size = 4,
          probability = 1
        }
      },
      empty_transitions = true,
      material_background =
      {
        picture = "__base__/graphics/terrain/water-wube/water-wube.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water-wube/hr-water-wube.png",
          count = 1,
          scale = 0.5,
        }
      }
    }
  }
}
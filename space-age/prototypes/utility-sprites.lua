local space_platform_entity_build_animations = require("__space-age__/graphics/entity/space-platform-build-anim/entity-build-animations")

data:extend(
{
  {
    type = "sprite",
    name = "tooltip-category-thrust",
    filename = "__space-age__/graphics/icons/tooltips/tooltip-category-thrust.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-fusion",
    filename = "__space-age__/graphics/icons/tooltips/tooltip-category-fusion.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-food",
    filename = "__base__/graphics/icons/tooltips/tooltip-category-food.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-thruster-fuel",
    filename = "__base__/graphics/icons/tooltips/tooltip-category-water.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-thruster-oxidizer",
    filename = "__base__/graphics/icons/tooltips/tooltip-category-water.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-nutrients",
    filename = "__space-age__/graphics/icons/tooltips/tooltip-category-nutrients.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-fusion-plasma",
    filename = "__space-age__/graphics/icons/tooltips/tooltip-category-fusion-plasma.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-fluoroketone-hot",
    filename = "__space-age__/graphics/icons/tooltips/tooltip-category-fluoroketone-hot.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-fluoroketone-cold",
    filename = "__space-age__/graphics/icons/tooltips/tooltip-category-fluoroketone-cold.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
})

data.raw["utility-sprites"]["default"].platform_entity_build_animations = space_platform_entity_build_animations

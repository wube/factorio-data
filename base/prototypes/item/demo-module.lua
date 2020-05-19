data:extend
{
  {
    type = "module",
    name = "speed-module",
    localised_description = {"item-description.speed-module"},
    icon = "__base__/graphics/icons/speed-module.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "speed",
    tier = 1,
    order = "a[speed]-a[speed-module-1]",
    stack_size = 50,
    effect = { speed = {bonus = 0.2}, consumption = {bonus = 0.5}}
  },
  {
    type = "module",
    name = "effectivity-module",
    localised_description = {"item-description.effectivity-module"},
    icon = "__base__/graphics/icons/effectivity-module.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "effectivity",
    tier = 1,
    order = "c[effectivity]-a[effectivity-module-1]",
    stack_size = 50,
    effect = { consumption = {bonus = -0.3}}
  }
}
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
    effect = { speed = {bonus = 0.2}, consumption = {bonus = 0.5}},
    beacon_tint =
    {
      primary = {r = 0.441, g = 0.714, b = 1.000, a = 1.000}, -- #70b6ffff
      secondary = {r = 0.388, g = 0.976, b = 1.000, a = 1.000}, -- #63f8ffff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false,
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
    effect = { consumption = {bonus = -0.3}},
    beacon_tint =
    {
      primary = { 0, 1, 0 },
      secondary = {r = 0.370, g = 1.000, b = 0.370, a = 1.000}, -- #5eff5eff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false,
  }
}

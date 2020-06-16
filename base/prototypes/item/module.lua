data:extend
{
  {
    type = "module",
    name = "speed-module-2",
    localised_description = {"item-description.speed-module"},
    icon = "__base__/graphics/icons/speed-module-2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "speed",
    tier = 2,
    order = "a[speed]-b[speed-module-2]",
    stack_size = 50,
    effect = { speed = {bonus = 0.3}, consumption = {bonus = 0.6}},
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
    name = "speed-module-3",
    localised_description = {"item-description.speed-module"},
    icon = "__base__/graphics/icons/speed-module-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "speed",
    tier = 3,
    order = "a[speed]-c[speed-module-3]",
    stack_size = 50,
    effect = { speed = {bonus = 0.5}, consumption = {bonus = 0.7}},
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
    name = "effectivity-module-2",
    localised_description = {"item-description.effectivity-module"},
    icon = "__base__/graphics/icons/effectivity-module-2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "effectivity",
    tier = 2,
    order = "c[effectivity]-b[effectivity-module-2]",
    stack_size = 50,
    effect = { consumption = {bonus = -0.4}},
    beacon_tint =
    {
      primary = { 0, 1, 0 },
      secondary = {r = 0.370, g = 1.000, b = 0.370, a = 1.000}, -- #5eff5eff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false,
  },
  {
    type = "module",
    name = "effectivity-module-3",
    localised_description = {"item-description.effectivity-module"},
    icon = "__base__/graphics/icons/effectivity-module-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "effectivity",
    tier = 3,
    order = "c[effectivity]-c[effectivity-module-3]",
    stack_size = 50,
    effect = { consumption = {bonus = -0.5}},
    beacon_tint =
    {
      primary = { 0, 1, 0 },
      secondary = {r = 0.370, g = 1.000, b = 0.370, a = 1.000}, -- #5eff5eff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false,
  }
}

function productivity_module_limitation()
return
      {
        "sulfuric-acid",
        "basic-oil-processing",
        "advanced-oil-processing",
        "coal-liquefaction",
        "heavy-oil-cracking",
        "light-oil-cracking",
        "solid-fuel-from-light-oil",
        "solid-fuel-from-heavy-oil",
        "solid-fuel-from-petroleum-gas",
        "lubricant",
        "iron-plate",
        "copper-plate",
        "steel-plate",
        "stone-brick",
        "sulfur",
        "plastic-bar",
        "empty-barrel",
        "uranium-processing",
        "copper-cable",
        "iron-stick",
        "iron-gear-wheel",
        "electronic-circuit",
        "advanced-circuit",
        "processing-unit",
        "engine-unit",
        "electric-engine-unit",
        "uranium-fuel-cell",
        "explosives",
        "battery",
        "flying-robot-frame",
        "low-density-structure",
        "rocket-fuel",
        "rocket-control-unit",
        "rocket-part",
        "automation-science-pack",
        "logistic-science-pack",
        "chemical-science-pack",
        "military-science-pack",
        "production-science-pack",
        "utility-science-pack",
        "kovarex-enrichment-process"
      }
end

data:extend(
{
  {
    type = "module",
    name = "productivity-module",
    localised_description = {"item-description.productivity-module"},
    icon = "__base__/graphics/icons/productivity-module.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "productivity",
    tier = 1,
    order = "c[productivity]-a[productivity-module-1]",
    stack_size = 50,
    effect =
    {
      productivity = {bonus = 0.04},
      consumption = {bonus = 0.4},
      pollution = {bonus = 0.05},
      speed = {bonus = -0.15}
    },
    limitation = productivity_module_limitation(),
    limitation_message_key = "production-module-usable-only-on-intermediates"
  },
  {
    type = "module",
    name = "productivity-module-2",
    localised_description = {"item-description.productivity-module"},
    icon = "__base__/graphics/icons/productivity-module-2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "productivity",
    tier = 2,
    order = "c[productivity]-b[productivity-module-2]",
    stack_size = 50,
    effect =
    {
      productivity = {bonus = 0.06},
      consumption = {bonus = 0.6},
      pollution = {bonus = 0.07},
      speed = {bonus = -0.15}
    },
    limitation = productivity_module_limitation(),
    limitation_message_key = "production-module-usable-only-on-intermediates"
  },
  {
    type = "module",
    name = "productivity-module-3",
    localised_description = {"item-description.productivity-module"},
    icon = "__base__/graphics/icons/productivity-module-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "productivity",
    tier = 3,
    order = "c[productivity]-c[productivity-module-3]",
    stack_size = 50,
    effect =
    {
      productivity = {bonus = 0.1},
      consumption = {bonus = 0.8},
      pollution = {bonus = 0.1},
      speed = {bonus = -0.15}
    },
    limitation = productivity_module_limitation(),
    limitation_message_key = "production-module-usable-only-on-intermediates"
  }
}
)

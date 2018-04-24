data:extend(
{
  {
    type = "module",
    name = "speed-module",
    icon = "__base__/graphics/icons/speed-module.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    order = "a[speed]-a[speed-module-1]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { speed = {bonus = 0.2}, consumption = {bonus = 0.5}}
  },
  {
    type = "module",
    name = "speed-module-2",
    icon = "__base__/graphics/icons/speed-module-2.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    order = "a[speed]-b[speed-module-2]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { speed = {bonus = 0.3}, consumption = {bonus = 0.6}}
  },
  {
    type = "module",
    name = "speed-module-3",
    icon = "__base__/graphics/icons/speed-module-3.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    order = "a[speed]-c[speed-module-3]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { speed = {bonus = 0.5}, consumption = {bonus = 0.7}}
  },
  {
    type = "module",
    name = "effectivity-module",
    icon = "__base__/graphics/icons/effectivity-module.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    order = "c[effectivity]-a[effectivity-module-1]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { consumption = {bonus = -0.3}},
    limitation = production
  },
  {
    type = "module",
    name = "effectivity-module-2",
    icon = "__base__/graphics/icons/effectivity-module-2.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    order = "c[effectivity]-b[effectivity-module-2]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { consumption = {bonus = -0.4}}
  },
  {
    type = "module",
    name = "effectivity-module-3",
    icon = "__base__/graphics/icons/effectivity-module-3.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    order = "c[effectivity]-c[effectivity-module-3]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { consumption = {bonus = -0.5}}
  }
})

function productivitymodulelimitation()
return {"sulfuric-acid",
        "basic-oil-processing",
        "advanced-oil-processing",
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
        "iron-stick",
        "iron-gear-wheel",
        "copper-cable",
        "electronic-circuit",
        "advanced-circuit",
        "engine-unit",
        "electric-engine-unit",
        "processing-unit",
        "explosives",
        "battery",
        "flying-robot-frame",
        "science-pack-1",
        "science-pack-2",
        "science-pack-3",
        "alien-science-pack",
        "low-density-structure",
        "rocket-fuel",
        "rocket-control-unit",
        "rocket-part"
      }
end

data:extend(
{
  {
    type = "module",
    name = "productivity-module",
    icon = "__base__/graphics/icons/productivity-module.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    order = "c[productivity]-a[productivity-module-1]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { productivity = {bonus = 0.04}, consumption = {bonus = 0.4}, pollution = {bonus = 0.3}, speed = {bonus = -0.15}},
    limitation = productivitymodulelimitation(),
    limitation_message_key = "production-module-usable-only-on-intermediates"
  },
  {
    type = "module",
    name = "productivity-module-2",
    icon = "__base__/graphics/icons/productivity-module-2.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    order = "c[productivity]-b[productivity-module-2]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { productivity = {bonus = 0.06}, consumption = {bonus = 0.6}, pollution = {bonus = 0.4}, speed = {bonus = -0.15}},
    limitation = productivitymodulelimitation(),
    limitation_message_key = "production-module-usable-only-on-intermediates"
  },
  {
    type = "module",
    name = "productivity-module-3",
    icon = "__base__/graphics/icons/productivity-module-3.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    order = "c[productivity]-c[productivity-module-3]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { productivity = {bonus = 0.1}, consumption = {bonus = 0.8}, pollution = {bonus = 0.5}, speed = {bonus = -0.15}},
    limitation = productivitymodulelimitation(),
    limitation_message_key = "production-module-usable-only-on-intermediates"
  }
}
)

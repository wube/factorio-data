data:extend(
{
  {
    type = "module",
    name = "speed-module",
    icon = "__base__/graphics/icons/speed-module.png",
    flags = {"goes-to-main-inventory"},
    group = "production",
    order = "m-a-a",
    stack_size = 64,
    effect = { speed = {bonus = 0.2}, consumption = {bonus = 0.5}}
  },
  {
    type = "module",
    name = "speed-module-2",
    icon = "__base__/graphics/icons/speed-module-2.png",
    flags = {"goes-to-main-inventory"},
    group = "production",
    order = "m-a-b",
    stack_size = 64,
    effect = { speed = {bonus = 0.3}, consumption = {bonus = 0.6}}
  },
  {
    type = "module",
    name = "speed-module-3",
    icon = "__base__/graphics/icons/speed-module-3.png",
    flags = {"goes-to-main-inventory"},
    group = "production",
    order = "m-a-c",
    stack_size = 64,
    effect = { speed = {bonus = 0.5}, consumption = {bonus = 0.7}}
  },
  {
    type = "module",
    name = "productivity-module",
    icon = "__base__/graphics/icons/productivity-module.png",
    flags = {"goes-to-main-inventory"},
    group = "production",
    order = "m-b-a",
    stack_size = 64,
    effect = { productivity = {bonus = 0.05}, consumption = {bonus = 0.5}}
  },
  {
    type = "module",
    name = "productivity-module-2",
    icon = "__base__/graphics/icons/productivity-module-2.png",
    flags = {"goes-to-main-inventory"},
    group = "production",
    order = "m-b-b",
    stack_size = 64,
    effect = { productivity = {bonus = 0.1}, consumption = {bonus = 0.7}}
  },
  {
    type = "module",
    name = "productivity-module-3",
    icon = "__base__/graphics/icons/productivity-module-3.png",
    flags = {"goes-to-main-inventory"},
    group = "production",
    order = "m-b-c",
    stack_size = 64,
    effect = { productivity = {bonus = 0.15}, consumption = {bonus = 0.9}}
  },
  {
    type = "module",
    name = "effectivity-module",
    icon = "__base__/graphics/icons/effectivity-module.png",
    flags = {"goes-to-main-inventory"},
    group = "production",
    order = "m-c-a",
    stack_size = 64,
    effect = { consumption = {bonus = -0.5}}
  },
  {
    type = "module",
    name = "effectivity-module-2",
    icon = "__base__/graphics/icons/effectivity-module-2.png",
    flags = {"goes-to-main-inventory"},
    group = "production",
    order = "m-c-b",
    stack_size = 64,
    effect = { consumption = {bonus = -0.7}}
  },
  {
    type = "module",
    name = "effectivity-module-3",
    icon = "__base__/graphics/icons/effectivity-module-3.png",
    flags = {"goes-to-main-inventory"},
    group = "production",
    order = "m-c-c",
    stack_size = 64,
    effect = { consumption = {bonus = -0.9}}
  }
}
)

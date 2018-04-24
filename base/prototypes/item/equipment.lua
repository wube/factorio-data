data:extend(
{
  {
    type = "item",
    name = "solar-panel-equipment",
    icon = "__base__/graphics/icons/solar-panel-equipment.png",
    placed_as_equipment_result = "solar-panel-equipment",
    flags = {"goes-to-main-inventory"},
    subgroup = "equipment",
    order = "a[energy-source]-a[solar-panel]",
    stack_size = 20
  },
  {
    type = "item",
    name = "fusion-reactor-equipment",
    icon = "__base__/graphics/icons/fusion-reactor-equipment.png",
    placed_as_equipment_result = "fusion-reactor-equipment",
    flags = {"goes-to-main-inventory"},
    subgroup = "equipment",
    order = "a[energy-source]-b[fusion-reactor]",
    stack_size = 20
  },
  {
    type = "item",
    name = "energy-shield-equipment",
    icon = "__base__/graphics/icons/energy-shield-equipment.png",
    placed_as_equipment_result = "energy-shield-equipment",
    flags = {"goes-to-main-inventory"},
    subgroup = "equipment",
    order = "b[shield]-a[energy-shield-equipment]",
    stack_size = 50,
    default_request_amount = 10
  },
  {
    type = "item",
    name = "energy-shield-mk2-equipment",
    icon = "__base__/graphics/icons/energy-shield-mk2-equipment.png",
    placed_as_equipment_result = "energy-shield-mk2-equipment",
    flags = {"goes-to-main-inventory"},
    subgroup = "equipment",
    order = "b[shield]-b[energy-shield-equipment-mk2]",
    stack_size = 50,
    default_request_amount = 10
  },
  {
    type = "item",
    name = "battery-equipment",
    icon = "__base__/graphics/icons/battery-equipment.png",
    placed_as_equipment_result = "battery-equipment",
    flags = {"goes-to-main-inventory"},
    subgroup = "equipment",
    order = "c[battery]-a[battery-equipment]",
    stack_size = 50,
    default_request_amount = 10
  },
  {
    type = "item",
    name = "battery-mk2-equipment",
    icon = "__base__/graphics/icons/battery-mk2-equipment.png",
    placed_as_equipment_result = "battery-mk2-equipment",
    flags = {"goes-to-main-inventory"},
    subgroup = "equipment",
    order = "c[battery]-b[battery-equipment-mk2]",
    stack_size = 50,
    default_request_amount = 10
  },
  {
    type = "item",
    name = "basic-laser-defense-equipment",
    icon = "__base__/graphics/icons/basic-laser-defense-equipment.png",
    placed_as_equipment_result = "basic-laser-defense-equipment",
    flags = {"goes-to-main-inventory"},
    subgroup = "equipment",
    order = "d[active-defense]-a[basic-laser-defense-equipment]",
    stack_size = 20
  },
  {
    type = "item",
    name = "basic-electric-discharge-defense-equipment",
    icon = "__base__/graphics/icons/basic-electric-discharge-defense-equipment.png",
    placed_as_equipment_result = "basic-electric-discharge-defense-equipment",
    flags = {"goes-to-main-inventory"},
    subgroup = "equipment",
    order = "d[active-defense]-b[basic-electric-discharge-defense-equipment]",
    stack_size = 20
  },
  {
    type = "item",
    name = "basic-exoskeleton-equipment",
    icon = "__base__/graphics/icons/basic-exoskeleton-equipment.png",
    placed_as_equipment_result = "basic-exoskeleton-equipment",
    flags = {"goes-to-main-inventory"},
    subgroup = "equipment",
    order = "e[exoskeleton]-a[basic-exoskeleton-equipment]",
    stack_size = 10
  },
  {
    type = "item",
    name = "personal-roboport-equipment",
    icon = "__base__/graphics/icons/personal-roboport-equipment.png",
    placed_as_equipment_result = "personal-roboport-equipment",
    flags = {"goes-to-main-inventory"},
    subgroup = "equipment",
    order = "e[robotics]-a[personal-roboport-equipment]",
    stack_size = 5
  },
  {
    type = "item",
    name = "night-vision-equipment",
    icon = "__base__/graphics/icons/night-vision-equipment.png",
    placed_as_equipment_result = "night-vision-equipment",
    flags = {"goes-to-main-inventory"},
    subgroup = "equipment",
    order = "f[night-vision]-a[night-vision-equipment]",
    stack_size = 20
  }
}
)

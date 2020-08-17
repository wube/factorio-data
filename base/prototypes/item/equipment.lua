data:extend(
{
  {
    type = "item",
    name = "solar-panel-equipment",
    icon = "__base__/graphics/icons/solar-panel-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "solar-panel-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-a[solar-panel]",
    stack_size = 20
  },
  {
    type = "item",
    name = "fusion-reactor-equipment",
    icon = "__base__/graphics/icons/fusion-reactor-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "fusion-reactor-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-b[fusion-reactor]",
    default_request_amount = 1,
    stack_size = 20,
  },
  {
    type = "item",
    name = "battery-equipment",
    icon = "__base__/graphics/icons/battery-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "battery-equipment",
    subgroup = "equipment",
    order = "b[battery]-a[battery-equipment]",
    default_request_amount = 5,
    stack_size = 20
  },
  {
    type = "item",
    name = "battery-mk2-equipment",
    localised_description = {"item-description.battery-equipment"},
    icon = "__base__/graphics/icons/battery-mk2-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "battery-mk2-equipment",
    subgroup = "equipment",
    order = "b[battery]-b[battery-equipment-mk2]",
    default_request_amount = 5,
    stack_size = 20
  },
  {
    type = "item",
    name = "belt-immunity-equipment",
    icon = "__base__/graphics/icons/belt-immunity-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "belt-immunity-equipment",
    subgroup = "equipment",
    order = "c[belt-immunity]-a[belt-immunity]",
    default_request_amount = 1,
    stack_size = 20
  },
  {
    type = "item",
    name = "exoskeleton-equipment",
    icon = "__base__/graphics/icons/exoskeleton-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "exoskeleton-equipment",
    subgroup = "equipment",
    order = "d[exoskeleton]-a[exoskeleton-equipment]",
    default_request_amount = 5,
    stack_size = 20
  },
  {
    type = "item",
    name = "personal-roboport-equipment",
    icon = "__base__/graphics/icons/personal-roboport-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "personal-roboport-equipment",
    subgroup = "equipment",
    order = "e[robotics]-a[personal-roboport-equipment]",
    default_request_amount = 1,
    stack_size = 20
  },
  {
    type = "item",
    name = "personal-roboport-mk2-equipment",
    localised_description = {"item-description.personal-roboport-equipment"},
    icon = "__base__/graphics/icons/personal-roboport-mk2-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "personal-roboport-mk2-equipment",
    subgroup = "equipment",
    order = "e[robotics]-b[personal-roboport-mk2-equipment]",
    default_request_amount = 1,
    stack_size = 20
  },
  {
    type = "item",
    name = "night-vision-equipment",
    icon = "__base__/graphics/icons/night-vision-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "night-vision-equipment",
    subgroup = "equipment",
    order = "f[night-vision]-a[night-vision-equipment]",
    default_request_amount = 1,
    stack_size = 20
  },  
  {
    type = "item",
    name = "energy-shield-equipment",
    icon = "__base__/graphics/icons/energy-shield-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "energy-shield-equipment",
    subgroup = "military-equipment",
    order = "a[shield]-a[energy-shield-equipment]",
    default_request_amount = 5,
    stack_size = 20
  },
  {
    type = "item",
    name = "energy-shield-mk2-equipment",
    localised_description = {"item-description.energy-shield-equipment"},
    icon = "__base__/graphics/icons/energy-shield-mk2-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "energy-shield-mk2-equipment",
    subgroup = "military-equipment",
    order = "a[shield]-b[energy-shield-equipment-mk2]",
    default_request_amount = 5,
    stack_size = 20
  },
  {
    type = "item",
    name = "personal-laser-defense-equipment",
    icon = "__base__/graphics/icons/personal-laser-defense-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "personal-laser-defense-equipment",
    subgroup = "military-equipment",
    order = "b[active-defense]-a[personal-laser-defense-equipment]",
    default_request_amount = 5,
    stack_size = 20
  },
  {
    type = "item",
    name = "discharge-defense-equipment",
    icon = "__base__/graphics/icons/discharge-defense-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "discharge-defense-equipment",
    subgroup = "military-equipment",
    order = "b[active-defense]-b[discharge-defense-equipment]-a[equipment]",
    default_request_amount = 1,
    stack_size = 20
  },
  {
    type = "capsule",
    name = "discharge-defense-remote",
    icon = "__base__/graphics/icons/discharge-defense-equipment-controller.png",
    icon_size = 64, icon_mipmaps = 4,
    capsule_action =
    {
      type = "equipment-remote",
      equipment = "discharge-defense-equipment"
    },
    subgroup = "military-equipment",
    order = "b[active-defense]-b[discharge-defense-equipment]-b[remote]",
    stack_size = 1
  },
}
)

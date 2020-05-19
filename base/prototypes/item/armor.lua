data:extend(
{
  {
    type = "armor",
    name = "modular-armor",
    icon = "__base__/graphics/icons/modular-armor.png",
    icon_size = 64, icon_mipmaps = 4,
    resistances =
    {
      {
        type = "physical",
        decrease = 6,
        percent = 30
      },
      {
        type = "acid",
        decrease = 0,
        percent = 50
      },
      {
        type = "explosion",
        decrease = 30,
        percent = 35
      },
      {
        type = "fire",
        decrease = 0,
        percent = 40
      }
    },
    subgroup = "armor",
    order = "c[modular-armor]",
    stack_size = 1,
    infinite = true,
    equipment_grid = "small-equipment-grid",
    inventory_size_bonus = 10
  },
  {
    type = "armor",
    name = "power-armor",
    icon = "__base__/graphics/icons/power-armor.png",
    icon_size = 64, icon_mipmaps = 4,
    resistances =
    {
      {
        type = "physical",
        decrease = 8,
        percent = 30
      },
      {
        type = "acid",
        decrease = 0,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 40,
        percent = 40
      },
      {
        type = "fire",
        decrease = 0,
        percent = 60
      }
    },
    subgroup = "armor",
    order = "d[power-armor]",
    stack_size = 1,
    infinite = true,
    equipment_grid = "medium-equipment-grid",
    inventory_size_bonus = 20
  },
  {
    type = "armor",
    name = "power-armor-mk2",
    icon = "__base__/graphics/icons/power-armor-mk2.png",
    icon_size = 64, icon_mipmaps = 4,
    resistances =
    {
      {
        type = "physical",
        decrease = 10,
        percent = 40
      },
      {
        type = "acid",
        decrease = 0,
        percent = 70
      },
      {
        type = "explosion",
        decrease = 60,
        percent = 50
      },
      {
        type = "fire",
        decrease = 0,
        percent = 70
      }
    },
    subgroup = "armor",
    order = "e[power-armor-mk2]",
    stack_size = 1,
    infinite = true,
    equipment_grid = "large-equipment-grid",
    inventory_size_bonus = 30
  }
}
)

data:extend(
{
  {
    type = "armor",
    name = "heavy-armor",
    icon = "__base__/graphics/icons/heavy-armor.png",
    flags = {"goes-to-main-inventory"},
    resistances =
    {
      {
        type = "physical",
        decrease = 6,
        percent = 30
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      },
      {
        type = "acid",
        decrease = 5,
        percent = 30
      }
    },
    durability = 5000,
    subgroup = "armor",
    order = "b[heavy-armor]",
    stack_size = 10
  },
  {
    type = "armor",
    name = "basic-modular-armor",
    icon = "__base__/graphics/icons/basic-modular-armor.png",
    flags = {"goes-to-main-inventory"},
    resistances =
    {
      {
        type = "physical",
        decrease = 6,
        percent = 30
      },
      {
        type = "acid",
        decrease = 5,
        percent = 30
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      }
    },
    durability = 10000,
    subgroup = "armor",
    order = "c[basic-modular-armor]",
    stack_size = 1,
    equipment_grid = {width = 5, height = 5}
  },
  {
    type = "armor",
    name = "power-armor",
    icon = "__base__/graphics/icons/power-armor.png",
    flags = {"goes-to-main-inventory"},
    resistances =
    {
      {
        type = "physical",
        decrease = 8,
        percent = 30
      },
      {
        type = "acid",
        decrease = 7,
        percent = 30
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 30
      }
    },
    durability = 15000,
    subgroup = "armor",
    order = "d[power-armor]",
    stack_size = 1,
    equipment_grid = {width = 7, height = 7}
  },
  {
    type = "armor",
    name = "power-armor-mk2",
    icon = "__base__/graphics/icons/power-armor-mk2.png",
    flags = {"goes-to-main-inventory"},
    resistances =
    {
      {
        type = "physical",
        decrease = 10,
        percent = 40
      },
      {
        type = "acid",
        decrease = 10,
        percent = 40
      },
      {
        type = "explosion",
        decrease = 20,
        percent = 50
      }
    },
    durability = 20000,
    subgroup = "armor",
    order = "e[power-armor-mk2]",
    stack_size = 1,
    equipment_grid = {width = 10, height = 10}
  }
}
)

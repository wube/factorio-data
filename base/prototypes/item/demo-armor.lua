data:extend(
{
  {
    type = "armor",
    name = "light-armor",
    icon = "__base__/graphics/icons/light-armor.png",
    flags = {"goes-to-main-inventory"},
    resistances =
    {
      {
        type = "physical",
        decrease = 3,
        percent = 20
      },
      {
        type = "acid",
        decrease = 0,
        percent = 10
      },
      {
        type = "explosion",
        decrease = 2,
        percent = 20
      },
      {
        type = "fire",
        decrease = 0,
        percent = 10
      }
    },
    durability = 1000,
    subgroup = "armor",
    order = "a[light-armor]",
    stack_size = 10
  }
}
)

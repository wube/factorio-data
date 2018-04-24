data:extend(
{
  {
    type = "armor",
    name = "basic-armor",
    icon = "__base__/graphics/icons/basic-armor.png",
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
        decrease = 3,
        percent = 30
      },
      {
        type = "explosion",
        decrease = 2,
        percent = 20
      }
    },
    durability = 1000,
    subgroup = "armor",
    order = "a[basic-armor]",
    stack_size = 10
  }
}
)

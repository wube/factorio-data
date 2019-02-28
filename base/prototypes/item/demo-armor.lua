data:extend(
{
  {
    type = "armor",
    name = "light-armor",
    icon = "__base__/graphics/icons/light-armor.png",
    icon_size = 32,
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
        percent = 20
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
    subgroup = "armor",
    order = "a[light-armor]",
    stack_size = 1,
    infinite = true
  }
}
)

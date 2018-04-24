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
        decrease = 2,
        percent = 20
      },
      {
        type = "explosion",
        decrease = 2,
        percent = 20
      }
    },
    durability = 1000,
    group = "combat",
    order = "g-a",
    stack_size = 10
  }
}
)

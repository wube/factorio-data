data:extend(
{
  {
    type = "ammo",
    name = "basic-bullet-magazine",
    icon = "__base__/graphics/icons/basic-bullet-magazine.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      type = "instant",
      category = "bullet",
      damage = 2,
      target_explosion = "explosion-gunshot"
    },
    magazine_size = 10,
    group = "combat",
    order = "f-a-a",
    stack_size = 100
  }
}
)

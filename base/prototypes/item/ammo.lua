data:extend(
{
  {
    type = "ammo",
    name = "piercing-bullet-magazine",
    icon = "__base__/graphics/icons/piercing-bullet-magazine.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      type = "instant",
      category = "bullet",
      damage = 5,
      target_explosion = "explosion-gunshot"
    },
    magazine_size = 10,
    group = "combat",
    order = "f-a-c",
    stack_size = 100
  },
  {
    type = "ammo",
    name = "flame-thrower-ammo",
    icon = "__base__/graphics/icons/flame-thrower-ammo.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      type = "flame-thrower",
      category = "flame-thrower",
      damage = 10,
      direction_deviation = 0.07,
      flame_thrower_explosion = "flame-thrower-explosion",
      speed_deviation = 0.1,
      starting_distance = 0.6,
      starting_frame_deviation = 0.07,
      target_type = "direction"
    },
    magazine_size = 100,
    group = "combat",
    order = "f-c-a",
    stack_size = 50
  },
  {
    type = "ammo",
    name = "rocket",
    icon = "__base__/graphics/icons/rocket.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      type = "projectile",
      category = "rocket",
      damage = 40,
      projectile = "rocket",
      starting_distance = 0.6
    },
    group = "combat",
    order = "f-b-a",
    stack_size = 100
  }
}
)

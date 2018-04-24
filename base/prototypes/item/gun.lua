data:extend(
{
  {
    type = "gun",
    name = "flame-thrower",
    icon = "__base__/graphics/icons/flame-thrower.png",
    flags = {"goes-to-main-inventory"},
    group = "combat",
    order = "e-d",
    shooting_parameters =
    {
      ammo_category = "flame-thrower",
      cooldown = 2,
      damage_modifier = 0.03,
      projectile_creation_distance = 0.6,
      projectile_starting_speed = 0.2,
      range = 15
    },
    stack_size = 4
  },
  {
    type = "item",
    name = "land-mine",
    icon = "__base__/graphics/icons/land-mine.png",
    flags = {"goes-to-quickbar"},
    damage_radius = 5,
    group = "combat",
    order = "e-e",
    place_result = "land-mine",
    stack_size = 16,
    trigger_radius = 1
  },
  {
    type = "gun",
    name = "rocket-launcher",
    icon = "__base__/graphics/icons/rocket-launcher.png",
    flags = {"goes-to-main-inventory"},
    group = "combat",
    order = "e-c",
    shooting_parameters =
    {
      ammo_category = "rocket",
      cooldown = 60,
      projectile_creation_distance = 0.6,
      projectile_starting_speed = 0.07,
      range = 20
    },
    stack_size = 4
  }
}
)

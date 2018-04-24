data:extend(
{
  {
    type = "gun",
    name = "pistol",
    icon = "__base__/graphics/icons/pistol.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "gun",
    order = "a[basic-clips]-a[pistol]",
    attack_parameters =
    {
      ammo_category = "bullet",
      cooldown = 10,
      movement_slow_down_factor = 0.7,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0.6},
        creation_distance = 0.6,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_creation_distance = 0.6,
      range = 15,
      sound =
      {
        {
          filename = "__base__/sound/gunshot.ogg",
          volume = 0.3
        }
      }
    },
    stack_size = 5
  },
  {
    type = "gun",
    name = "submachine-gun",
    icon = "__base__/graphics/icons/submachine-gun.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "gun",
    order = "a[basic-clips]-b[submachine-gun]",
    attack_parameters =
    {
      ammo_category = "bullet",
      cooldown = 4,
      movement_slow_down_factor = 0.7,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0.6},
        creation_distance = 0.6,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_creation_distance = 0.6,
      range = 15,
      sound =
      {
        {
          filename = "__base__/sound/gunshot.ogg",
          volume = 0.2
        }
      }
    },
    stack_size = 1
  }
}
)

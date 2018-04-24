data:extend(
{
  {
    type = "gun",
    name = "pistol",
    icon = "__base__/graphics/icons/pistol.png",
    flags = {"goes-to-main-inventory"},
    group = "combat",
    order = "e-a",
    shooting_parameters =
    {
      ammo_category = "bullet",
      cooldown = 10,
      explosion = "explosion-gunshot",
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
          filename = "__base__/sound/gunshot.wav",
          volume = 0.3
        }
      }
    },
    stack_size = 4
  },
  {
    type = "gun",
    name = "submachine-gun",
    icon = "__base__/graphics/icons/submachine-gun.png",
    flags = {"goes-to-main-inventory"},
    group = "combat",
    order = "e-b",
    shooting_parameters =
    {
      ammo_category = "bullet",
      cooldown = 4,
      explosion = "explosion-gunshot",
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
          filename = "__base__/sound/gunshot.wav",
          volume = 0.2
        }
      }
    },
    stack_size = 1
  }
}
)

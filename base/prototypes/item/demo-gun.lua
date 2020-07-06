local sounds = require("prototypes.entity.demo-sounds")

data:extend(
{
  {
    type = "gun",
    name = "pistol",
    icon = "__base__/graphics/icons/pistol.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "a[basic-clips]-a[pistol]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 15,
      movement_slow_down_factor = 0.2,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0.1},
        creation_distance = -0.5,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_creation_distance = 1.125,
      range = 15,
      sound = sounds.light_gunshot
    },
    stack_size = 5
  },
  {
    type = "gun",
    name = "submachine-gun",
    icon = "__base__/graphics/icons/submachine-gun.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "a[basic-clips]-b[submachine-gun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 6,
      movement_slow_down_factor = 0.7,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0.1},
        creation_distance = -0.5,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_creation_distance = 1.125,
      range = 18,
      sound = sounds.submachine_gunshot
    },
    stack_size = 5
  },
  {
    type = "gun",
    name = "vehicle-machine-gun",
    icon = "__base__/graphics/icons/submachine-gun.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "gun",
    order = "a[basic-clips]-b[vehicle-machine-gun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 4,
      movement_slow_down_factor = 0.7,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0},
        creation_distance = -0.6875,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_creation_distance = 0.65,
      range = 20,
      sound = sounds.heavy_gunshot
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "shotgun",
    icon = "__base__/graphics/icons/shotgun.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "b[shotgun]-a[basic]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "shotgun-shell",
      cooldown = 60,
      movement_slow_down_factor = 0.6,
      projectile_creation_distance = 1.125,
      range = 15,
      min_range = 1,
      sound = sounds.shotgun
    },
    stack_size = 5
  },
}
)

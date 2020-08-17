local sounds = require("prototypes.entity.demo-sounds")

data:extend(
{
  {
    type = "gun",
    name = "flamethrower",
    icon = "__base__/graphics/icons/flamethrower.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "e[flamethrower]",
    attack_parameters =
    {
      type = "stream",
      ammo_category = "flamethrower",
      cooldown = 1,
      movement_slow_down_factor = 0.4,
      gun_barrel_length = 0.8,
      gun_center_shift = { 0, -1 },
      range = 15,
      min_range = 3,
      cyclic_sound =
      {
        begin_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-start.ogg",
            volume = 0.7
          }
        },
        middle_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-mid.ogg",
            volume = 0.7
          }
        },
        end_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-end.ogg",
            volume = 0.7
          }
        }
      }
    },
    stack_size = 5
  },
  {
    type = "gun",
    name = "tank-machine-gun",
    icon = "__base__/graphics/icons/submachine-gun.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "gun",
    order = "a[basic-clips]-b[tank-machine-gun]",
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
      projectile_center = {-0.15625, -0.07812},
      projectile_creation_distance = 1,
      range = 20,
      sound = sounds.heavy_gunshot
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "tank-flamethrower",
    icon = "__base__/graphics/icons/flamethrower.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "gun",
    order = "b[flamethrower]-b[tank-flamethrower]",
    attack_parameters =
    {
      type = "stream",
      ammo_category = "flamethrower",
      cooldown = 1,
      gun_barrel_length = 1.4,
      gun_center_shift = { -0.17, -1.15 },
      range = 9,
      min_range = 3,
      cyclic_sound =
      {
        begin_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-start.ogg",
            volume = 1
          }
        },
        middle_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-mid.ogg",
            volume = 1
          }
        },
        end_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-end.ogg",
            volume = 1
          }
        }
      }
    },
    stack_size = 1
  },
  {
    type = "item",
    name = "land-mine",
    icon = "__base__/graphics/icons/land-mine.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "f[land-mine]",
    place_result = "land-mine",
    stack_size = 100,
  },
  {
    type = "gun",
    name = "rocket-launcher",
    icon = "__base__/graphics/icons/rocket-launcher.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "d[rocket-launcher]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      movement_slow_down_factor = 0.8,
      cooldown = 60,
      projectile_creation_distance = 0.6,
      range = 36,
      projectile_center = {-0.17, 0},
      sound =
      {
        {
          filename = "__base__/sound/fight/rocket-launcher.ogg",
          volume = 0.7
        }
      }
    },
    stack_size = 5
  },
  {
    type = "gun",
    name = "combat-shotgun",
    icon = "__base__/graphics/icons/combat-shotgun.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "b[shotgun]-a[combat]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "shotgun-shell",
      cooldown = 30,
      movement_slow_down_factor = 0.5,
      damage_modifier = 1.2,
      projectile_creation_distance = 1.125,
      range = 15,
      sound = sounds.shotgun
    },
    stack_size = 5
  },
  {
    type = "gun",
    name = "railgun",
    icon = "__base__/graphics/icons/railgun.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "gun",
    order = "c[railgun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "railgun",
      cooldown = 3 * 60,
      movement_slow_down_factor = 0.6,
      projectile_creation_distance = 0.6,
      range = 20,
      sound =
      {
        {
          filename = "__base__/sound/railgun.ogg",
          volume = 0.5
        }
      }
    },
    stack_size = 5
  },
  {
    type = "gun",
    name = "tank-cannon",
    icon = "__base__/graphics/icons/tank-cannon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "gun",
    order = "z[tank]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "cannon-shell",
      cooldown = 90,
      movement_slow_down_factor = 0,
      projectile_creation_distance = 1.6,
      projectile_center = {-0.15625, -0.07812},
      range = 25,
      sound = sounds.tank_gunshot,
    },
    stack_size = 5
  },
  {
    type = "gun",
    name = "artillery-wagon-cannon",
    icon = "__base__/graphics/icons/tank-cannon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "gun",
    order = "z[artillery]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "artillery-shell",
      cooldown = 200,
      movement_slow_down_factor = 0,
      projectile_creation_distance = 1.6,
      projectile_center = {-0.15625, -0.07812},
      range = 7 * 32,
      min_range = 1 * 32,
      projectile_creation_parameters = require("prototypes.entity.artillery-cannon-muzzle-flash-shifting"),
      sound =
      {
        {
          filename = "__base__/sound/fight/artillery-shoots-1.ogg",
          volume = 0.7
        }
      },
      shell_particle =
      {
        name = "artillery-shell-particle",
        direction_deviation = 0.05,
        direction = 0.4,
        speed = 0.10,
        speed_deviation = 0.1,
        vertical_speed = 0.05,
        vertical_speed_deviation = 0.01,
        center = {0, -0.5},
        creation_distance = 0.5,
        creation_distance_orientation = 0.4,
        starting_frame_speed = 0.5,
        starting_frame_speed_deviation = 0.5,
        use_source_position = true,
        height = 1
      },
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "spidertron-rocket-launcher-1",
    localised_name = {"item-name.spidertron-rocket-launcher"},
    icon = "__base__/graphics/icons/rocket-launcher.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    flags = {"hidden"},
    order = "z[spider]-a[rocket-launcher]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 60,
      range = 36,
      projectile_creation_distance = -0.5,
      projectile_center = {0, 0.3},
      projectile_orientation_offset = -0.0625,
      sound =
      {
        {
          filename = "__base__/sound/fight/rocket-launcher.ogg",
          volume = 0.7
        }
      }
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "spidertron-rocket-launcher-2",
    localised_name = {"item-name.spidertron-rocket-launcher"},
    icon = "__base__/graphics/icons/rocket-launcher.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    flags = {"hidden"},
    order = "z[spider]-a[rocket-launcher]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 60,
      range = 36,
      projectile_creation_distance = -0.5,
      projectile_orientation_offset = -0.03125,
      projectile_center = {0, 0.3},
      sound =
      {
        {
          filename = "__base__/sound/fight/rocket-launcher.ogg",
          volume = 0.7
        }
      }
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "spidertron-rocket-launcher-3",
    localised_name = {"item-name.spidertron-rocket-launcher"},
    icon = "__base__/graphics/icons/rocket-launcher.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    flags = {"hidden"},
    order = "z[spider]-a[rocket-launcher]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 60,
      range = 36,
      projectile_creation_distance = -0.5,
      projectile_center = {0, 0.3},
      projectile_orientation_offset = 0.03125,
      sound =
      {
        {
          filename = "__base__/sound/fight/rocket-launcher.ogg",
          volume = 0.7
        }
      }
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "spidertron-rocket-launcher-4",
    localised_name = {"item-name.spidertron-rocket-launcher"},
    icon = "__base__/graphics/icons/rocket-launcher.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    flags = {"hidden"},
    order = "z[spider]-a[rocket-launcher]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 60,
      range = 36,
      projectile_creation_distance = -0.5,
      projectile_center = {0, 0.3},
      projectile_orientation_offset = 0.0625,
      sound =
      {
        {
          filename = "__base__/sound/fight/rocket-launcher.ogg",
          volume = 0.7
        }
      }
    },
    stack_size = 1
  },
}
)

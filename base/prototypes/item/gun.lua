data:extend(
{
  {
    type = "gun",
    name = "flame-thrower",
    icon = "__base__/graphics/icons/flame-thrower.png",
    flags = {"goes-to-main-inventory"},
    group = "combat",
    order = "e-d",
    attack_parameters =
    {
      ammo_category = "flame-thrower",
      cooldown = 2,
      movement_slow_down_factor = 0.6,
      projectile_creation_distance = 0.6,
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
    order = "e-c-a",
    attack_parameters =
    {
      ammo_category = "rocket",
      movement_slow_down_factor = 0.8,
      cooldown = 60,
      projectile_creation_distance = 0.6,
      range = 20
    },
    stack_size = 4
  },
  {
    type = "gun",
    name = "shotgun",
    icon = "__base__/graphics/icons/shotgun.png",
    flags = {"goes-to-main-inventory"},
    group = "combat",
    order = "e-b-a",
    attack_parameters =
    {
      ammo_category = "shotgun-shell",
      explosion = "explosion-gunshot",
      cooldown = 60,
      movement_slow_down_factor = 0.6,
      projectile_creation_distance = 0.6,
      range = 20,
      sound =
      {
        {
          filename = "__base__/sound/pump-shotgun.wav",
          volume = 0.5
        }
      }
    },
    stack_size = 4
  },
  {
    type = "gun",
    name = "combat-shotgun",
    icon = "__base__/graphics/icons/combat-shotgun.png",
    flags = {"goes-to-main-inventory"},
    group = "combat",
    order = "e-b-b",
    attack_parameters =
    {
      ammo_category = "shotgun-shell",
      explosion = "explosion-gunshot",
      cooldown = 30,
      movement_slow_down_factor = 0.5,
      damage_modifier = 1.2,
      projectile_creation_distance = 0.6,
      range = 20,
      sound =
      {
        {
          filename = "__base__/sound/pump-shotgun.wav",
          volume = 0.5
        }
      }
    },
    stack_size = 4
  },
  {
    type = "gun",
    name = "railgun",
    icon = "__base__/graphics/icons/railgun.png",
    flags = {"goes-to-main-inventory"},
    group = "combat",
    order = "e-c-b",
    attack_parameters =
    {
      ammo_category = "railgun",
      cooldown = 3 * 60,
      movement_slow_down_factor = 0.6,
      projectile_creation_distance = 0.6,
      range = 20,
      sound =
      {
        {
          filename = "__base__/sound/railgun.wav",
          volume = 0.8
        }
      }
    },
    stack_size = 4
  }
}
)

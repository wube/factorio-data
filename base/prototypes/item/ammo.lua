data:extend(
{
  {
    type = "ammo",
    name = "piercing-rounds-magazine",
    icon = "__base__/graphics/icons/piercing-rounds-magazine.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "bullet",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-hit"
            },
            {
              type = "damage",
              damage = { amount = 8, type = "physical"}
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-b[piercing-rounds-magazine]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "uranium-rounds-magazine",
    icon = "__base__/graphics/icons/uranium-rounds-magazine.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "bullet",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-hit"
            },
            {
              type = "damage",
              damage = { amount = 24, type = "physical"}
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-c[uranium-rounds-magazine]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "flamethrower-ammo",
    icon = "__base__/graphics/icons/flamethrower-ammo.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      {
        source_type = "default",
        category = "flamethrower",
        target_type = "position",
        clamp_position = true,

        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "handheld-flamethrower-fire-stream",
            max_length = 15,
            duration = 160,
          }
        }
      },
      {
        source_type = "vehicle",
        consumption_modifier = 1.125,
        category = "flamethrower",
        target_type = "position",
        clamp_position = true,

        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "tank-flamethrower-fire-stream",
            max_length = 9,
            duration = 160,
          }
        }
      }
    },
    magazine_size = 100,
    subgroup = "ammo",
    order = "e[flamethrower]",
    stack_size = 100
  },
  {
    type = "ammo",
    name = "rocket",
    icon = "__base__/graphics/icons/rocket.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "rocket",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "rocket",
          starting_speed = 0.1,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-a[basic]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "explosive-rocket",
    icon = "__base__/graphics/icons/explosive-rocket.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "rocket",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "explosive-rocket",
          starting_speed = 0.1,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-b[explosive]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "atomic-bomb",
    icon = "__base__/graphics/icons/atomic-bomb.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      range_modifier = 3,
      cooldown_modifier = 3,
      target_type = "position",
      category = "rocket",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "atomic-rocket",
          starting_speed = 0.05,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-c[atomic-bomb]",
    stack_size = 10
  },
  {
    type = "ammo",
    name = "shotgun-shell",
    icon = "__base__/graphics/icons/shotgun-shell.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "shotgun-shell",
      target_type = "direction",
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        },
        {
          type = "direct",
          repeat_count = 12,
          action_delivery =
          {
            type = "projectile",
            projectile = "shotgun-pellet",
            starting_speed = 1,
            direction_deviation = 0.3,
            range_deviation = 0.3,
            max_range = 15
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "b[shotgun]-a[basic]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "piercing-shotgun-shell",
    icon = "__base__/graphics/icons/piercing-shotgun-shell.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "shotgun-shell",
      target_type = "direction",
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        },
        {
          type = "direct",
          repeat_count = 16,
          action_delivery =
          {
            type = "projectile",
            projectile = "piercing-shotgun-pellet",
            starting_speed = 1,
            direction_deviation = 0.3,
            range_deviation = 0.3,
            max_range = 15,
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "b[shotgun]-b[piercing]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "railgun-dart",
    icon = "__base__/graphics/icons/railgun-ammo.png",
    flags = {"goes-to-main-inventory", "hidden"},
    ammo_type =
    {
      category = "railgun",
      target_type = "direction",
      action =
      {
        type = "line",
        range = 25,
        width = 0.5,

        source_effects =
        {
          type = "create-explosion",
          entity_name = "railgun-beam"
        },
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "damage",
            damage = { amount = 100, type="physical"}
          }
        }
      }
    },
    magazine_size = 4,
    subgroup = "ammo",
    order = "c[railgun]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "cannon-shell",
    icon = "__base__/graphics/icons/cannon-shell.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "cannon-shell",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 30,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
        }
      },
    },
    subgroup = "ammo",
    order = "d[cannon-shell]-a[basic]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "explosive-cannon-shell",
    icon = "__base__/graphics/icons/explosive-cannon-shell.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "cannon-shell",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "explosive-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 30,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
        }
      },
    },
    subgroup = "ammo",
    order = "d[cannon-shell]-c[explosive]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "uranium-cannon-shell",
    icon = "__base__/graphics/icons/uranium-cannon-shell.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "cannon-shell",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "uranium-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 30,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
        }
      },
    },
    subgroup = "ammo",
    order = "d[cannon-shell]-c[uranium]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "explosive-uranium-cannon-shell",
    icon = "__base__/graphics/icons/explosive-uranium-cannon-shell.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "cannon-shell",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "explosive-uranium-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 30,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
        }
      },
    },
    subgroup = "ammo",
    order = "d[explosive-cannon-shell]-c[uranium]",
    stack_size = 200
  }
}
)

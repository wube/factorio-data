function ntimes(n, table)
  local i
  local ret = {}

  for i = 1, n do
    ret[#ret + 1] = table
  end

  return ret
end

data:extend(
{
  {
    type = "ammo",
    name = "piercing-bullet-magazine",
    icon = "__base__/graphics/icons/piercing-bullet-magazine.png",
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
              type = "create-entity",
              entity_name = "explosion-gunshot"
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-gunshot"
            },
            {
              type = "damage",
              damage = { amount = 5 , type = "physical"}
            }
          }
        }
      }
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
      category = "flame-thrower",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          {
            type = "flame-thrower",
            explosion = "flame-thrower-explosion",
            direction_deviation = 0.07,
            speed_deviation = 0.1,
            starting_frame_deviation = 0.07,
            damage = { amount = 15, type = "fire"},
            projectile_starting_speed = 0.2,
            starting_distance = 0.6,
          }
        }
      }
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
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    group = "combat",
    order = "f-b-a",
    stack_size = 100
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
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    group = "combat",
    order = "f-b-b",
    stack_size = 100
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
      source_effects =
      {
        type = "create-entity",
        entity_name = "explosion-gunshot"
      },
      action = ntimes(12,
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "shotgun-pellet",
            starting_speed = 1,
            direction_deviation = 0.3,
            range_deviation = 0.3,
            max_range = 15,
          }
        })
    },
    magazine_size = 10,
    group = "combat",
    order = "f-d-a",
    stack_size = 100
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
      source_effects =
      {
        type = "create-entity",
        entity_name = "explosion-gunshot"
      },
      action = ntimes(16,
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "piercing-shotgun-pellet",
            starting_speed = 1,
            direction_deviation = 0.3,
            range_deviation = 0.3,
            max_range = 15,
          }
        })
    },
    magazine_size = 10,
    group = "combat",
    order = "f-d-a",
    stack_size = 100
  },
  {
    type = "ammo",
    name = "railgun-dart",
    icon = "__base__/graphics/icons/railgun-ammo.png",
    flags = {"goes-to-main-inventory"},
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
          type = "create-entity",
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
    group = "combat",
    order = "f-d-a",
    stack_size = 100
  },
}
)

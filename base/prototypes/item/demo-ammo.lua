data:extend(
{
  {
    type = "ammo",
    name = "firearm-magazine",
    icon = "__base__/graphics/icons/firearm-magazine.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "bullet",
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                }
              },
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-hit",
                  offsets = {{0, 1}},
                  offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
                },
                {
                  type = "damage",
                  damage = { amount = 5 , type = "physical"}
                }
              }
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-a[firearm-magazine]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "piercing-rounds-magazine",
    icon = "__base__/graphics/icons/piercing-rounds-magazine.png",
    icon_size = 64, icon_mipmaps = 4,
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
              entity_name = "explosion-hit",
              offsets = {{0, 1}},
              offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
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
    name = "shotgun-shell",
    icon = "__base__/graphics/icons/shotgun-shell.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "shotgun-shell",
      target_type = "direction",
      clamp_position = true,
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
            starting_speed_deviation = 0.1,
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
}
)

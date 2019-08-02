data:extend(
{
  {
    type = "capsule",
    name = "cluster-grenade",
    icon = "__base__/graphics/icons/cluster-grenade.png",
    icon_size = 32,
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "grenade",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 20,
        ammo_type =
        {
          category = "grenade",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "cluster-grenade",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "a[grenade]-b[cluster]",
    stack_size = 100
  },
  {
    type = "capsule",
    name = "poison-capsule",
    icon = "__base__/graphics/icons/poison-capsule.png",
    icon_size = 32,
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "capsule",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 25,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "poison-capsule",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "b[poison-capsule]",
    stack_size = 100
   },
   {
    type = "capsule",
    name = "slowdown-capsule",
    icon = "__base__/graphics/icons/slowdown-capsule.png",
    icon_size = 32,
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "capsule",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 25,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "slowdown-capsule",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "c[slowdown-capsule]",
    stack_size = 100
  },
  {
    type = "capsule",
    name = "defender-capsule",
    icon = "__base__/graphics/icons/defender.png",
    icon_size = 32,
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 20,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "defender-capsule",
              starting_speed = 0.3
            }
          }
        }
      }
    },
   subgroup = "capsule",
    order = "d[defender-capsule]",
    stack_size = 100
  },
  {
    type = "capsule",
    name = "distractor-capsule",
    icon = "__base__/graphics/icons/distractor.png",
    icon_size = 32,
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "capsule",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 25,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "distractor-capsule",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "e[defender-capsule]",
    stack_size = 100
  },
  {
    type = "capsule",
    name = "destroyer-capsule",
    icon = "__base__/graphics/icons/destroyer.png",
    icon_size = 32,
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "capsule",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 25,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "destroyer-capsule",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "f[destroyer-capsule]",
    stack_size = 100
  },
  {
    type = "capsule",
    name = "discharge-defense-remote",
    icon = "__base__/graphics/equipment/discharge-defense-equipment-ability.png",
    icon_size = 32,
    capsule_action =
    {
      type = "equipment-remote",
      equipment = "discharge-defense-equipment"
    },
    subgroup = "capsule",
    order = "z",
    stack_size = 1
  },
  {
    type = "capsule",
    name = "cliff-explosives",
    icon = "__base__/graphics/icons/cliff-explosives.png",
    icon_size = 32,
    flags = {"hide-from-bonus-gui"},
    capsule_action =
    {
      type = "destroy-cliffs",
      radius = 1.5,
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "grenade",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 10,
        ammo_type =
        {
          category = "grenade",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "cliff-explosives",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    robot_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "ground-explosion"
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          },
          {
            type = "destroy-cliffs",
            radius = 1.5,
            explosion = "explosion"
          }
        }
      }
    },

    subgroup = "terrain",
    order = "d[cliff-explosives]",
    stack_size = 20
  },
  {
    type = "capsule",
    name = "artillery-targeting-remote",
    icon = "__base__/graphics/icons/artillery-targeting-remote.png",
    icon_size = 32,
    capsule_action =
    {
      type = "artillery-remote",
      flare = "artillery-flare"
    },
    subgroup = "capsule",
    order = "zz",
    stack_size = 1
  }
})

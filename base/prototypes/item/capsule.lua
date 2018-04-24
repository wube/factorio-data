data:extend(
{
  {
    type = "capsule",
    name = "poison-capsule",
    icon = "__base__/graphics/icons/poison-capsule.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
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
    group = "combat",
    order = "f-e-a",
    stack_size = 100
   },
   {
    type = "capsule",
    name = "slowdown-capsule",
    icon = "__base__/graphics/icons/slowdown-capsule.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
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
    group = "combat",
    order = "f-e-b",
    stack_size = 100
  },
  {
    type = "capsule",
    name = "small-combat-robot-capsule",
    icon = "__base__/graphics/icons/small-combat-robot-capsule.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
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
              projectile = "small-combat-robot-capsule",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    group = "combat",
    order = "f-e-e",
    stack_size = 100
  },
  {
    type = "capsule",
    name = "big-combat-robot-capsule",
    icon = "__base__/graphics/icons/big-combat-robot-capsule.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
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
              projectile = "big-combat-robot-capsule",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    group = "combat",
    order = "f-e-d",
    stack_size = 100
  },
  {
    type = "capsule",
    name = "basic-grenade",
    icon = "__base__/graphics/icons/basic-grenade.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        ammo_category = "capsule",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 15,
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
              projectile = "basic-grenade",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    group = "combat",
    order = "f-e-c",
    stack_size = 100
  },
  {
    type = "capsule",
    name = "basic-electric-discharge-defense-remote",
    icon = "__base__/graphics/equipment/basic-electric-discharge-defense-equipment-ability.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "equipment-remote",
      equipment = "basic-electric-discharge-defense-equipment"
    },
    group = "combat",
    order = "f-e-a",
    stack_size = 1
  },
})

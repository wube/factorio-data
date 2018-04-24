data:extend(
{
  {
    type = "night-vision-equipment",
    name = "night-vision-equipment",
    sprite = 
    {
      filename = "__base__/graphics/equipment/night-vision-equipment.png",
      width = 96,
      height = 64,
      priority = "medium"
    },
    shape =
    {
      width = 3,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "120J",
      input_flow_limit = "120W",
      usage_priority = "primary-input"
    },
    energy_input = "10W"
  },
  {
    type = "energy-shield-equipment",
    name = "energy-shield-equipment",
    sprite = 
    {
      filename = "__base__/graphics/equipment/energy-shield-equipment.png",
      width = 64,
      height = 64,
      priority = "medium"
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    max_shield_value = 50,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "120J",
      input_flow_limit = "120W",
      usage_priority = "primary-input"
    },
    energy_per_shield = "20J"
  },
  {
    type = "energy-shield-equipment",
    name = "energy-shield-mk2-equipment",
    sprite = 
    {
      filename = "__base__/graphics/equipment/energy-shield-mk2-equipment.png",
      width = 64,
      height = 64,
      priority = "medium"
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    max_shield_value = 150,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "180J",
      input_flow_limit = "180W",
      usage_priority = "primary-input"
    },
    energy_per_shield = "30J"
  },
  {
    type = "battery-equipment",
    name = "battery-equipment",
    sprite = 
    {
      filename = "__base__/graphics/equipment/battery-equipment.png",
      width = 32,
      height = 64,
      priority = "medium"
    },
    shape =
    {
      width = 1,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "1KJ",
      input_flow_limit = "10KW",
      output_flow_limit = "10KW",
      usage_priority = "terciary"
    }
  },
  {
    type = "battery-equipment",
    name = "battery-mk2-equipment",
    sprite = 
    {
      filename = "__base__/graphics/equipment/battery-mk2-equipment.png",
      width = 32,
      height = 64,
      priority = "medium"
    },
    shape =
    {
      width = 1,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "5KJ",
      input_flow_limit = "50KW",
      output_flow_limit = "50KW",
      usage_priority = "terciary"
    }
  },
  {
    type = "solar-panel-equipment",
    name = "solar-panel-equipment",
    sprite = 
    {
      filename = "__base__/graphics/equipment/solar-panel-equipment.png",
      width = 32,
      height = 32,
      priority = "medium"
    },
    shape =
    {
      width = 1,
      height = 1,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-output"
    },
    power = "10W"
  },
  {
    type = "generator-equipment",
    name = "fusion-reactor-equipment",
    sprite = 
    {
      filename = "__base__/graphics/equipment/fusion-reactor-equipment.png",
      width = 128,
      height = 128,
      priority = "medium"
    },
    shape =
    {
      width = 4,
      height = 4,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-output"
    },
    power = "750W"
  },
  {
    type = "active-defense-equipment",
    name = "basic-laser-defense-equipment",
    sprite = 
    {
      filename = "__base__/graphics/equipment/basic-laser-defense-equipment.png",
      width = 64,
      height = 96,
      priority = "medium"
    },
    shape =
    {
      width = 2,
      height = 3,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      buffer_capacity = "101J"
    },
    attack_parameters =
    {
      ammo_category = "electric",
      cooldown = 20,
      damage_modifier = 1,
      projectile_center = {0, 0},
      projectile_creation_distance = 0.6,
      range = 15,
      sound =
      {
        {
          filename = "__base__/sound/laser.wav",
          volume = 0.4
        }
      },
      ammo_type =
      {
        type = "projectile",
        category = "electric",
        energy_consumption = "100J",
        projectile = "laser",
        speed = 1,
        action = 
        {
          {
            type = "direct",
            action_delivery =
            {
              {
                type = "projectile",
                projectile = "laser",
                starting_speed = 0.28
              }
            }
          }
        }
      }
    },
    automatic = true
  },
  {
    type = "active-defense-equipment",
    name = "basic-electric-discharge-defense-equipment",
    ability_icon =
    {
      filename = "__base__/graphics/equipment/basic-electric-discharge-defense-equipment-ability.png",
      width = 32,
      height = 32,
      priority = "medium"
    },
    sprite = 
    {
      filename = "__base__/graphics/equipment/basic-electric-discharge-defense-equipment.png",
      width = 96,
      height = 96,
      priority = "medium"
    },
    shape =
    {
      width = 3,
      height = 3,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      buffer_capacity = "4040J"
    },
    attack_parameters =
    {
      ammo_category = "electric",
      damage_modifier = 3,
      cooldown = 150,
      projectile_center = {0, 0},
      projectile_creation_distance = 0.6,
      range = 10,
      sound =
      {
        {
          filename = "__base__/sound/laser.wav",
          volume = 0.4
        }
      },
      ammo_type =
      {
        type = "projectile",
        category = "electric",
        energy_consumption = "2KJ",
        speed = 1,
        action = 
        {
          {
            type = "area",
            perimeter = 10,
            force = "enemy",
            action_delivery =
            {
              {
                type = "projectile",
                projectile = "blue-laser",
                starting_speed = 0.28
              }
            }
          }
        }
      },
    },
    automatic = false
  },
  {
    type = "movement-bonus-equipment",
    name = "basic-exoskeleton-equipment",
    sprite = 
    {
      filename = "__base__/graphics/equipment/basic-exoskeleton-equipment.png",
      width = 64,
      height = 128,
      priority = "medium"
    },
    shape =
    {
      width = 2,
      height = 4,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_consumption = "200W",
    movement_bonus = 0.3
  }
}
)

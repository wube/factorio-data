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
      buffer_capacity = 2,
      input_flow_limit = 2,
      input_priority = "primary"
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
      buffer_capacity = 2,
      input_flow_limit = 2,
      input_priority = "primary"
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
      buffer_capacity = 3,
      input_flow_limit = 3,
      input_priority = "primary"
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
      buffer_capacity = 1000,
      input_flow_limit = 1000,
      output_flow_limit = 1000,
      input_priority = "terciary",
      output_priority = "terciary"
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
      buffer_capacity = 5000,
      input_flow_limit = 5000,
      output_flow_limit = 5000,
      input_priority = "terciary",
      output_priority = "terciary"
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
      output_priority = "primary"
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
      output_priority = "primary"
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
      input_priority = "secondary",
      buffer_capacity = 102
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
        energy_consumption = 100,
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
      input_priority = "secondary",
      buffer_capacity = 4040
    },
    attack_parameters =
    {
      ammo_category = "electric",
      cooldown = 300,
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
        energy_consumption = 4000,
        projectile = "laser",
        speed = 1,
        action = 
        {
          {
            type = "area",
            perimeter = 10,
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
      input_priority = "secondary"
    },
    energy_consumption = "200W",
    movement_bonus = 0.3
  }
}
)

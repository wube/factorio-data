require ("prototypes.entity.laser-sounds")

data:extend(
{
  {
    type = "night-vision-equipment",
    name = "night-vision-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/night-vision-equipment.png",
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
    energy_source =
    {
      type = "electric",
      buffer_capacity = "120kJ",
      input_flow_limit = "240kW",
      usage_priority = "primary-input"
    },
    energy_input = "10kW",
    tint = {r = 0.1, g = 0.5, b = 0.2, a = 0},
    desaturation_params = 
    { 
      smoothstep_min = 0.1,
      smoothstep_max = 0.7,
      minimum = 0.3,
      maximum = 1.0
    },
    light_params = 
    { 
      smoothstep_min = 0.1,
      smoothstep_max = 0.7,
      minimum = 0.666,
      maximum = 1.0,
    },
    categories = {"armor"}
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
      buffer_capacity = "120kJ",
      input_flow_limit = "240kW",
      usage_priority = "primary-input"
    },
    energy_per_shield = "20kJ",
    categories = {"armor"}
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
      buffer_capacity = "180kJ",
      input_flow_limit = "360kW",
      usage_priority = "primary-input"
    },
    energy_per_shield = "30kJ",
    categories = {"armor"}
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
      buffer_capacity = "20MJ",
      input_flow_limit = "200MW",
      output_flow_limit = "200MW",
      usage_priority = "terciary"
    },
    categories = {"armor"}
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
      buffer_capacity = "100MJ",
      input_flow_limit = "1GW",
      output_flow_limit = "1GW",
      usage_priority = "terciary"
    },
    categories = {"armor"}
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
    power = "10kW",
    categories = {"armor"}
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
    power = "750kW",
    categories = {"armor"}
  },
  {
    type = "active-defense-equipment",
    name = "personal-laser-defense-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/personal-laser-defense-equipment.png",
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
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      buffer_capacity = "220kJ"
    },
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "electric",
      cooldown = 20,
      damage_modifier = 15,
      projectile_center = {0, 0},
      projectile_creation_distance = 0.6,
      range = 15,
      sound = make_laser_sounds(),
      ammo_type =
      {
        type = "projectile",
        category = "electric",
        energy_consumption = "200kJ",
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
    automatic = true,
    categories = {"armor"}
  },
  {
    type = "active-defense-equipment",
    name = "discharge-defense-equipment",
    ability_icon =
    {
      filename = "__base__/graphics/equipment/discharge-defense-equipment-ability.png",
      width = 32,
      height = 32,
      priority = "medium"
    },
    sprite =
    {
      filename = "__base__/graphics/equipment/discharge-defense-equipment.png",
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
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      buffer_capacity = "4040kJ"
    },

    attack_parameters =
    {
      type = "projectile",
      ammo_category = "electric",
      damage_modifier = 10,
      cooldown = 150,
      projectile_center = {0, 0},
      projectile_creation_distance = 0.6,
      range = 10,
      sound =
      {
         filename = "__base__/sound/fight/pulse.ogg",
         volume = 0.7
      },
      ammo_type =
      {
        type = "projectile",
        category = "electric",
        energy_consumption = "2MJ",
        speed = 1,
        action =
        {
          {
            type = "area",
            perimeter = 8,
            force = "enemy",
            action_delivery =
            {
             {
               type = "instant",
               target_effects =
               {
                {
                  type = "create-sticker",
                  sticker = "stun-sticker"
                },
                {
                  type = "push-back",
                  distance = 4,
                }
               }
             },
             {
               type = "beam",
               beam = "electric-beam-no-sound",
               max_length = 16,
               duration = 15,
               source_offset = {0, -0.5},
               add_to_shooter = false
             }
            }
          }
        }
      },
    },
    

    automatic = false,
    categories = {"armor"}
  },
  {
    type = "movement-bonus-equipment",
    name = "exoskeleton-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/exoskeleton-equipment.png",
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
    energy_consumption = "200kW",
    movement_bonus = 0.3,
    categories = {"armor"}
  },
  {
    type = "roboport-equipment",
    name = "personal-roboport-equipment",
    take_result = "personal-roboport-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/personal-roboport-equipment.png",
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
    energy_source =
    {
      type = "electric",
      buffer_capacity = "35MJ",
      input_flow_limit = "3500KW",
      usage_priority = "secondary-input"
    },
    charging_energy = "1000kW",

    robot_limit = 10,
    construction_radius = 15,
    spawn_and_station_height = 0.4,
    charge_approach_distance = 2.6,

    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5
    },
    recharging_light = {intensity = 0.4, size = 5},
    stationing_offset = {0, -0.6},
    charging_station_shift = {0, 0.5},
    charging_station_count = 2,
    charging_distance = 1.6,
    charging_threshold_distance = 5,
    categories = {"armor"}
  },
  {
    type = "roboport-equipment",
    name = "personal-roboport-mk2-equipment",
    take_result = "personal-roboport-mk2-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/personal-roboport-mk2-equipment.png",
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
    energy_source =
    {
      type = "electric",
      buffer_capacity = "35MJ",
      input_flow_limit = "3500KW",
      usage_priority = "secondary-input"
    },
    charging_energy = "1000kW",

    robot_limit = 25,
    construction_radius = 20,
    spawn_and_station_height = 0.4,
    charge_approach_distance = 2.6,

    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5
    },
    recharging_light = {intensity = 0.4, size = 5},
    stationing_offset = {0, -0.6},
    charging_station_shift = {0, 0.5},
    charging_station_count = 4,
    charging_distance = 1.6,
    charging_threshold_distance = 5,
    categories = {"armor"}
  },
  {
    type = "belt-immunity-equipment",
    name = "belt-immunity-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/belt-immunity-equipment.png",
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
      buffer_capacity = "100kJ",
      input_flow_limit = "240kW",
      drain = "100kW",
      usage_priority = "primary-input"
    },
    categories = {"armor"},
    order = "b-i-c"
  },
}
)

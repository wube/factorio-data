data:extend(
{
  {
    type = "ammo-turret",
    name = "rocket-turret",
    icon = "__base__/graphics/icons/rocket-turret.png",
    flags = {"placeable-player", "placeable-enemy", "player-creation"},
    minable = {mining_time = 0.5, result = "rocket-turret"},
    max_health = 350,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.6, -0.9}, {0.6, 0.6}},
    dying_explosion = "huge-explosion",
    inventory_size = 2,
    pictures =
    {
      filename = "__base__/graphics/entity/rocket-turret/rocket-turret.png",
      priority = "medium",
      frame_width = 118,
      frame_height = 118,
      direction_count = 5,
      shift = {0, -0.5}
    },
    shooting_parameters =
    {
      ammo_category = "rocket",
      cooldown = 15,
      range = 25,
      projectile_creation_distance = 0.6
    }
  },
  {
    type = "electric-turret",
    name = "laser-turret",
    icon = "__base__/graphics/icons/laser-turret.png",
    flags = { "placeable-player", "placeable-enemy", "player-creation" },
    minable = { mining_time = 0.5, result = "laser-turret" },
    max_health = 350,
    collision_box = {{ -0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{ -0.6, -0.9}, {0.6, 0.6}},
    rotation_speed = 0.01,
    extension_speed = 0.05,
    ammo_type =
    {
      type = "projectile",
      category = "electric",
      damage = 5,
      energy_consumption = 200,
      projectile = "laser",
      speed = 1
    },
    dying_explosion = "huge-explosion",
    energy_source =
    {
      type = "electric",
      buffer_capacity = 202,
      input_flow_limit = 9,
      input_priority = "secondary"
    },
    pictures =
    {
      filename = "__base__/graphics/entity/laser-turret/laser-turret.png",
      priority = "medium",
      frame_width = 131,
      frame_height = 72,
      direction_count = 64,
      line_length = 8,
      axially_symmetrical = false,
      shift = {1.328125, -0.375}
    },
    extension_animation =
    {
      filename = "__base__/graphics/entity/laser-turret/laser-turret-extension.png",
      priority = "medium",
      frame_width = 131,
      frame_height = 74,
      direction_count = 4,
      frame_count = 5,
      axially_symmetrical = false,
      shift = {1.171875, -0.34375}
    },
    base_picture =
    {
      filename = "__base__/graphics/entity/laser-turret/laser-turret-base.png",
      priority = "high",
      width = 43,
      height = 28,
      shift = { 0.109375, 0.03125 }
    },
    shooting_parameters =
    {
      ammo_category = "electric",
      cooldown = 20,
      damage = 2,
      projectile_center = {0, 0},
      projectile_creation_distance = 0.6,
      projectile_starting_speed = 0.28,
      explosion = "laser-bubble",
      range = 25,
      sound =
      {
        {
          filename = "__base__/sound/laser.wav",
          volume = 0.4
        }
      },
      speed = 1
    }
  }
}
)

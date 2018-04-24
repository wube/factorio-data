data:extend(
{
  {
    type = "ammo-turret",
    name = "basic-turret",
    icon = "__base__/graphics/icons/basic-turret.png",
    flags = {"placeable-enemy", "player-creation"},
    max_health = 200,
    collision_box = {{-0.4, -0.4 }, {0.4, 0.4}},
    selection_box = {{-0.6, -0.9 }, {0.6, 0.6}},
    dying_explosion = "huge-explosion",
    inventory_size = 1,
    pictures =
    {
      filename = "__base__/graphics/entity/basic-turret/basic-turret.png",
      priority = "medium",
      frame_width = 108,
      frame_height = 82,
      direction_count = 5,
      shift = { 0, -0.5 }
    },
    shooting_parameters =
    {
      ammo_category = "bullet",
      cooldown = 6,
      damage_modifier = 2.5,
      explosion = "explosion-gunshot",
      range = 15,
      sound =
      {
        {
          filename = "__base__/sound/gunshot.wav",
          volume = 0.3
        }
      }
    }
  },
  {
    type = "ammo-turret",
    name = "gun-turret",
    icon = "__base__/graphics/icons/gun-turret.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "gun-turret"},
    max_health = 200,
    collision_box = {{-0.4, -0.9 }, {0.4, 0.9}},
    selection_box = {{-0.5, -1 }, {0.5, 1}},
    rotation_speed = 0.01,
    extension_speed = 0.05,
    dying_explosion = "huge-explosion",
    inventory_size = 1,
    pictures =
    {
      filename = "__base__/graphics/entity/gun-turret/gun-turret.png",
      priority = "medium",
      frame_width = 178,
      frame_height = 107,
      direction_count = 64,
      line_length = 8,
      axially_symmetrical = false,
      shift = {1.34375, -0.46875 + 0.6}
    },
    extension_animation =
    {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-extension.png",
      priority = "medium",
      frame_width = 171,
      frame_height = 102,
      direction_count = 4,
      frame_count = 5,
      axially_symmetrical = false,
      shift = {1.34375, -0.5 + 0.6}
    },
    base_picture =
    {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-base.png",
      priority = "high",
      width = 43,
      height = 28,
      shift = { 0, -0.125 + 0.6 }
    },
    shooting_parameters =
    {
      ammo_category = "bullet",
      cooldown = 6,
      damage_modifier = 1,
      projectile_center = {0, 0.6},
      projectile_creation_distance = 1.2,
      explosion = "explosion-gunshot",
      shell_particle = 
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0.6},
        creation_distance = 0.6,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      range = 15,
      sound =
      {
        {
          filename = "__base__/sound/gunshot.wav",
          volume = 0.3
        }
      }
    }
  }
}
)

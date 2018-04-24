data:extend(
{
  {
    type = "projectile",
    name = "laser",
    acceleration = 0.005,
    attack_result = {explosion = "laser-bubble"},
    light = {intensity = 0.5, size = 10},
    picture =
    {
      filename = "__base__/graphics/entity/laser/laser.png",
      width = 7,
      height = 14
    },
    speed = 0.15
  },
  {
    type = "projectile",
    name = "rocket",
    acceleration = 0.005,
    attack_result = {explosion = "explosion"},
    light = {intensity = 0.5, size = 4},
    picture =
    {
      filename = "__base__/graphics/entity/rocket/rocket.png",
      width = 10,
      height = 30
    },
    shadow =
    {
      filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
      width = 10,
      height = 30
    },
    smoke =
    {
      {
        name = "smoke-fast",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, 0},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    }
  }
}
)

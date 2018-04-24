data:extend(
{
  {
    type = "projectile",
    name = "acid-projectile-purple",
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "acid-splash-purple"
          },
          {
            type = "damage",
            damage = {amount = 10, type = "acid"}
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/acid-projectile-purple/acid-projectile-purple.png",
      line_length = 5,
      frame_width = 16,
      frame_height = 18,
      frame_count = 33,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/acid-projectile-purple/acid-projectile-purple-shadow.png",
      line_length = 5,
      frame_width = 28,
      frame_height = 16,
      frame_count = 33,
      priority = "high",
      shift = {-0.09, 0.395}
    },
    animation_speed = 1,
    rotatable = false
  }
})

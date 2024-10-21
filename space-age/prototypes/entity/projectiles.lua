local explosion_animations = require("__base__.prototypes.entity.explosion-animations")

data:extend(
{

  {
    type = "projectile",
    name = "capture-robot-rocket",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "create-entity",
          show_in_tooltip = true,
          entity_name = "capture-robot",
          offsets = {{0, 0}}
        }
      }
    },
    --light = {intensity = 0.5, size = 4},
    enable_drawing_with_mask = true,
    animation =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/capture-robot-rocket/capture-robot",
        {
          direction_count = 32,
          scale = 0.5,
          priority = "high"
        }),
        util.sprite_load("__space-age__/graphics/entity/capture-robot-rocket/capture-robot-mask",
        {
          direction_count = 32,
          scale = 0.5,
          priority = "high",
          apply_runtime_tint = true
        }),
        util.sprite_load("__space-age__/graphics/entity/capture-robot-rocket/capture-robot-shadow",
        {
          direction_count = 32,
          scale = 0.5,
          priority = "high",
          draw_as_shadow = true
        }),
      }
    },
    rotatable = false,
    smoke =
    {
      {
        name = "smoke-train-stop",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, 0.5},
        starting_frame = 3,
        starting_frame_deviation = 5,
        height = 2,
        starting_vertical_speed = -0.1,
        starting_vertical_speed_deviation = 0.05
      }
    }
  }
}
)

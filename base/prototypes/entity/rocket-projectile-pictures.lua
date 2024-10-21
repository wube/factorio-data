return {
  animation = function(tip_tint)
    return {
      layers = {
        util.sprite_load("__base__/graphics/entity/rocket/rocket", {
          scale = 0.5,
          repeat_count = 8,
          frame_count = 1,
          rotate_shift = true,
          priority = "high"
        }),
        util.sprite_load("__base__/graphics/entity/rocket/rocket-tinted-tip", {
          scale = 0.5,
          repeat_count = 8,
          frame_count = 1,
          rotate_shift = true,
          priority = "high",
          tint = tip_tint
        }),
        util.sprite_load("__base__/graphics/entity/rocket/rocket-lights", {
          blend_mode = "additive",
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 8,
          rotate_shift = true,
          priority = "high",
        }),
      }
    }
  end,
  shadow = util.sprite_load("__base__/graphics/entity/rocket/rocket", {
    draw_as_shadow = true,
    scale = 0.5,
    frame_count = 1,
    rotate_shift = true,
    priority = "high"
  }),
  smoke =
  {
    {
      name = "smoke-fast",
      deviation = {0.15, 0.15},
      frequency = 1,
      position = {0, 1},
      starting_frame = 3,
      starting_frame_deviation = 5
    }
  }
}

return {
  animation =
  {
    north =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-top-north",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 3
        }),
        util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-shadow",
        {
          draw_as_shadow = true,
          frame_sequence = {1,1,1,1},
          frame_count = 4,
          repeat_count = 4,
          scale = 0.5,
        })
      }
    },
    east =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-top-east",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 3
        }),
        util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-shadow",
        {
          draw_as_shadow = true,
          frame_sequence = {2,2,2,2},
          frame_count = 4,
          repeat_count = 4,
          scale = 0.5,
        })
      }
    },
    south =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-top-south",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 3
        }),
        util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-shadow",
        {
          draw_as_shadow = true,
          frame_sequence = {3,3,3,3},
          frame_count = 4,
          repeat_count = 4,
          scale = 0.5,
        })
      }
    },
    west =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-top-west",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 3
        }),
        util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-shadow",
        {
          draw_as_shadow = true,
          frame_sequence = {4,4,4,4},
          frame_count = 4,
          repeat_count = 4,
          scale = 0.5,
        })
      }
    }
  },
  status_lamp_picture_on =util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-status-lamp",
  {
    tint = {0,1,0,1},
    blend_mode = "additive",
    draw_as_glow = true,
    direction_count = 4,
    scale = 0.5,
  }),
  status_lamp_picture_full = util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-status-lamp",
  {
    tint = {1,0.5,0,1},
    blend_mode = "additive",
    draw_as_glow = true,
    direction_count = 4,
    scale = 0.5,
  }),
  status_lamp_picture_off = util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-status-lamp",
  {
    tint = {0.7,0,0,1},
    blend_mode = "additive",
    draw_as_glow = true,
    direction_count = 4,
    scale = 0.5,
  }),
  below_arm_pictures =
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-middle",
      {
        direction_count = 4,
        scale = 0.5,
      }),
    }
  },
  below_ground_pictures =
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-bottom",
      {
        direction_count = 4,
        scale = 0.5,
      }),
    }
  },
  arm_head_animation = util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-head",
  {
    frame_count = 5,
    direction_count = 32,
    scale = 0.5,
  }),
  arm_head_top_animation = util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-head-top",
  {
    frame_count = 5,
    direction_count = 32,
    scale = 0.5,
  }),
  arm_link = util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-link",
  {
    --frame_count = 1,
    direction_count = 64,
    scale = 0.5,
  })
}

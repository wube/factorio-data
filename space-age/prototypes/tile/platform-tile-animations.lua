
local animation_speed = 0.5

local animation =
{
  north =
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/terrain/space-platform/tile-animations/north",{
        frame_count = 64,
        scale = 0.5,
        animation_speed = animation_speed
      }),
      util.sprite_load("__space-age__/graphics/terrain/space-platform/tile-animations/north-lights",{
        draw_as_glow = true,
        blend_mode = "additive",
        frame_count = 64,
        scale = 0.5,
        animation_speed = animation_speed
      })
    }
  },
  east =
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/terrain/space-platform/tile-animations/east",{
        frame_count = 64,
        scale = 0.5,
        animation_speed = animation_speed
      }),
      util.sprite_load("__space-age__/graphics/terrain/space-platform/tile-animations/east-lights",{
        draw_as_glow = true,
        blend_mode = "additive",
        frame_count = 64,
        scale = 0.5,
        animation_speed = animation_speed
      })
    }
  },
  south =
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/terrain/space-platform/tile-animations/south",{
        frame_count = 64,
        scale = 0.5,
        animation_speed = animation_speed
      }),
      util.sprite_load("__space-age__/graphics/terrain/space-platform/tile-animations/south-lights",{
        draw_as_glow = true,
        blend_mode = "additive",
        frame_count = 64,
        scale = 0.5,
        animation_speed = animation_speed
      })
    }
  },
  west =
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/terrain/space-platform/tile-animations/west",{
        frame_count = 64,
        scale = 0.5,
        animation_speed = animation_speed
      }),
      util.sprite_load("__space-age__/graphics/terrain/space-platform/tile-animations/west-lights",{
        draw_as_glow = true,
        blend_mode = "additive",
        frame_count = 64,
        scale = 0.5,
        animation_speed = animation_speed
      })
    }
  }
}
local top_animation =
{
  north =
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/terrain/space-platform/tile-animations/north-top",{
        frame_count = 64,
        scale = 0.5,
        animation_speed = animation_speed
      }),
      util.sprite_load("__space-age__/graphics/terrain/space-platform/tile-animations/north-lights-top",{
        draw_as_glow = true,
        blend_mode = "additive",
        frame_count = 64,
        scale = 0.5,
        animation_speed = animation_speed
      })
    }
  },
  east =
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/terrain/space-platform/tile-animations/east-top",{
        frame_count = 64,
        scale = 0.5,
        animation_speed = animation_speed
      }),
      util.sprite_load("__space-age__/graphics/terrain/space-platform/tile-animations/east-lights-top",{
        draw_as_glow = true,
        blend_mode = "additive",
        frame_count = 64,
        scale = 0.5,
        animation_speed = animation_speed
      })
    }
  },
  south =
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/terrain/space-platform/tile-animations/south-top",{
        frame_count = 64,
        scale = 0.5,
        animation_speed = animation_speed
      }),
      util.sprite_load("__space-age__/graphics/terrain/space-platform/tile-animations/south-lights-top",{
        draw_as_glow = true,
        blend_mode = "additive",
        frame_count = 64,
        scale = 0.5,
        animation_speed = animation_speed
      })
    }
  },
  west =
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/terrain/space-platform/tile-animations/west-top",{
        frame_count = 64,
        scale = 0.5,
        animation_speed = animation_speed
      }),
      util.sprite_load("__space-age__/graphics/terrain/space-platform/tile-animations/west-lights-top",{
        draw_as_glow = true,
        blend_mode = "additive",
        frame_count = 64,
        scale = 0.5,
        animation_speed = animation_speed
      })
    }
  }
}

return {
  animation = animation,
  top_animation = top_animation
};

local explosion_animations = {}

local util = require("util")

explosion_animations.explosion = function()
  return
  {
    {
      filename = "__base__/graphics/entity/explosion/explosion-1.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 48,
      height = 42,
      frame_count = 17,
      animation_speed = 0.5,
      shift = util.by_pixel(4.5,6),
      scale = 0.5,
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/explosion/explosion-3.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 102,
      height = 88,
      frame_count = 17,
      animation_speed = 0.5,
      shift = util.by_pixel(-1,1.5),
      scale = 0.5,
      usage = "explosion"
    }
  }
end

explosion_animations.gunshot = function()
  return
  {
    {
      filename = "__base__/graphics/entity/explosion-gunshot/explosion-gunshot.png",
      draw_as_glow = true,
      priority = "extra-high",
      width = 34,
      height = 38,
      frame_count = 2,
      animation_speed = 1.5,
      shift = {0, 0},
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/explosion-gunshot/explosion-gunshot.png",
      draw_as_glow = true,
      priority = "extra-high",
      width = 34,
      height = 38,
      x = 34 * 2,
      frame_count = 2,
      animation_speed = 1.5,
      shift = {0, 0},
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/explosion-gunshot/explosion-gunshot.png",
      draw_as_glow = true,
      priority = "extra-high",
      width = 34,
      height = 38,
      x = 34 * 4,
      frame_count = 3,
      animation_speed = 1.5,
      shift = {0, 0},
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/explosion-gunshot/explosion-gunshot.png",
      draw_as_glow = true,
      priority = "extra-high",
      width = 34,
      height = 38,
      x = 34 * 7,
      frame_count = 3,
      animation_speed = 1.5,
      shift = {0, 0},
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/explosion-gunshot/explosion-gunshot.png",
      draw_as_glow = true,
      priority = "extra-high",
      width = 34,
      height = 38,
      x = 34 * 10,
      frame_count = 3,
      animation_speed = 1.5,
      shift = {0, 0},
      usage = "explosion"
    }
  }
end

explosion_animations.small_gunshot = function()
  return
  {
    {
      filename = "__base__/graphics/entity/explosion-hit/explosion-hit.png",
      draw_as_glow = true,
      priority = "extra-high",
      width = 34,
      height = 38,
      frame_count = 13,
      animation_speed = 1.5,
      shift = {0, 0},
      usage = "explosion"
    }
  }
end

explosion_animations.hit_explosion = function()
  return
  {
    {
      filename = "__base__/graphics/entity/explosion-hit/explosion-hit.png",
      draw_as_glow = true,
      priority = "extra-high",
      width = 34,
      height = 38,
      frame_count = 13,
      animation_speed = 1.5,
      shift = {0, -0.3125},
      usage = "explosion"
    }
  }
end

explosion_animations.dust_explosion = function ()
  return
  {
    filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
    priority = "high",
    width = 50,
    height = 50,
    frame_count = 16,
    animation_speed = 1 / 2,
    scale = 0.8,
    tint = {r = 0.604, g = 0.502, b = 0.400, a = 0.6},
    affected_by_wind = true
  }
end

explosion_animations.small_explosion = function()
  return
  {
    {
      filename = "__base__/graphics/entity/small-explosion/small-explosion-1.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 88,
      height = 178,
      frame_count = 24,
      animation_speed = 0.5,
      shift = util.by_pixel(-1,-24),
      scale = 0.5,
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/small-explosion/small-explosion-2.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 92,
      height = 152,
      frame_count = 24,
      animation_speed = 0.5,
      shift = util.by_pixel(2,-7.5),
      scale = 0.5,
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/small-explosion/small-explosion-3.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 154,
      height = 222,
      frame_count = 24,
      animation_speed = 0.3,
      shift = util.by_pixel( 1.5, -23.0),
      scale = 0.5,
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/small-explosion/small-explosion-4.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 146,
      height = 134,
      frame_count = 24,
      animation_speed = 0.3,
      shift = util.by_pixel(2.5, -25.5),
      scale = 0.5,
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/small-explosion/small-explosion-5.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 144,
      height = 222,
      frame_count = 24,
      animation_speed = 0.3,
      shift = util.by_pixel(4.5, -25.5),
      scale = 0.5,
      usage = "explosion"
    }
  }
end

explosion_animations.small_dust_explosion = function()
  return
  {
    {
      filename = "__base__/graphics/entity/small-explosion/small-dust-explosion-1.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 160,
      height = 140,
      frame_count = 24,
      animation_speed = 0.3,
      shift = util.by_pixel(-4.0, -34.5),
      scale = 0.5,
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/small-explosion/small-dust-explosion-2.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 196,
      height = 186,
      frame_count = 24,
      animation_speed = 0.3,
      shift = util.by_pixel(0.0, -36.0),
      scale = 0.5,
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/small-explosion/small-dust-explosion-3.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 228,
      height = 216,
      frame_count = 24,
      animation_speed = 0.3,
      shift = util.by_pixel(-5.5, -35.0),
      scale = 0.5,
      usage = "explosion"
    }
  }
end  
------
explosion_animations.space_platform_foundation_explosion = function()
  return
  {
    {
      filename = "__base__/graphics/entity/small-explosion/small-dust-explosion-1.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 160,
      height = 140,
      frame_count = 24,
      animation_speed = 0.3,
      shift = util.by_pixel(-4.0, 5.0),
      scale = 0.5,
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/small-explosion/small-dust-explosion-2.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 196,
      height = 186,
      frame_count = 24,
      animation_speed = 0.3,
      shift = util.by_pixel(0.0, 1.5),
      scale = 0.5,
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/small-explosion/small-dust-explosion-3.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 228,
      height = 216,
      frame_count = 24,
      animation_speed = 0.3,
      shift = util.by_pixel(-5.5, 10.0),
      scale = 0.5,
      usage = "explosion"
    },
    -- {
    --   filename = "__base__/graphics/entity/small-explosion/small-explosion-3.png",
    --   draw_as_glow = true,
    --   priority = "high",
    --   line_length = 6,
    --   width = 152,
    --   height = 222,
    --   frame_count = 24,
    --   animation_speed = 0.3,
    --   shift = util.by_pixel( 2.5, -3.0),
    --   scale = 0.5,
    --   usage = "explosion"
    -- },
    {
      filename = "__base__/graphics/entity/small-explosion/small-explosion-4.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 146,
      height = 134,
      frame_count = 24,
      animation_speed = 0.3,
      shift = util.by_pixel(2.5, 6.0),
      scale = 0.5,
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/small-explosion/small-explosion-5.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 144,
      height = 222,
      frame_count = 24,
      animation_speed = 0.3,
      shift = util.by_pixel(4.5, 6.0),
      scale = 0.5,
      usage = "explosion"
    }
  }
end  
------
explosion_animations.nuke_shockwave = function()
  return
  {
    {
      filename = "__base__/graphics/entity/smoke/nuke-shockwave-1.png",
      draw_as_glow = true,
      priority = "high",
      flags = {"smoke"},
      line_length = 8,
      width = 132,
      height = 136,
      frame_count = 32,
      animation_speed = 0.5,
      shift = util.by_pixel(-0.5,0),
      scale = 1.5,
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/smoke/nuke-shockwave-2.png",
      draw_as_glow = true,
      priority = "high",
      flags = {"smoke"},
      line_length = 8,
      width = 110,
      height = 128,
      frame_count = 32,
      animation_speed = 0.5,
      shift = util.by_pixel(0,3),
      scale = 1.5,
      usage = "explosion"
    }
  }
end

explosion_animations.medium_explosion = function()
  return
  {
    {
      filename = "__base__/graphics/entity/medium-explosion/medium-explosion-1.png",
      draw_as_glow = true,
      priority = "high",
      width = 124,
      height = 224,
      frame_count = 30,
      line_length = 6,
      shift = util.by_pixel(-1, -36),
      animation_speed = 0.5,
      scale = 0.5,
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/medium-explosion/medium-explosion-2.png",
      draw_as_glow = true,
      priority = "high",
      width = 154,
      height = 212,
      frame_count = 41,
      line_length = 6,
      shift = util.by_pixel(-13,-34),
      animation_speed = 0.5,
      scale = 0.5,
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/medium-explosion/medium-explosion-3.png",
      draw_as_glow = true,
      priority = "high",
      width = 126,
      height = 236,
      frame_count = 39,
      line_length = 6,
      shift = util.by_pixel(0.5,-37),
      animation_speed = 0.5,
      scale = 0.5,
      usage = "explosion"
    }
  }
end

explosion_animations.big_explosion = function()
  return
  {
    {
      filename = "__base__/graphics/entity/big-explosion/big-explosion.png",
      draw_as_glow = true,
      width = 197,
      height = 245,
      frame_count = 47,
      line_length = 6,
      shift = {0.1875, -0.75},
      animation_speed = 0.5,
      usage = "explosion"
    }
  }
end

explosion_animations.massive_explosion = function(shift)
  shift = shift or {0,0}
  return
  {
    width = 656,
    height = 634,
    frame_count = 57,
    shift = util.add_shift(util.by_pixel(-45, -91), shift),
    animation_speed = 0.5,
    scale = 0.5,
    allow_forced_downscale = true,
    draw_as_glow = true,
    stripes =
    {
    {
    filename = "__base__/graphics/entity/massive-explosion/massive-explosion-1.png",
    width_in_frames = 6,
    height_in_frames = 5
    },
    {
    filename = "__base__/graphics/entity/massive-explosion/massive-explosion-2.png",
    width_in_frames = 6,
    height_in_frames = 5
    }
    },
    usage = "explosion"
  }
end

explosion_animations.nuke_explosion = function()
  return
  {
    width = 628,
    height = 720,
    frame_count = 100,
    draw_as_glow = true,
    priority = "very-low",
    flags = {"linear-magnification"},
    shift = util.by_pixel(0.5, -122.5), --shift = util.by_pixel(0.5, -62.5), shifted by 60 due to scaling and centering
    animation_speed = 0.5 * 0.75,
    scale = 1,
    dice_y = 5,
    allow_forced_downscale = true,
    stripes =
    {
    {
    filename = "__base__/graphics/entity/nuke-explosion/nuke-explosion-1.png",
    width_in_frames = 5,
    height_in_frames = 5
    },
    {
    filename = "__base__/graphics/entity/nuke-explosion/nuke-explosion-2.png",
    width_in_frames = 5,
    height_in_frames = 5
    },
    {
    filename = "__base__/graphics/entity/nuke-explosion/nuke-explosion-3.png",
    width_in_frames = 5,
    height_in_frames = 5
    },
    {
    filename = "__base__/graphics/entity/nuke-explosion/nuke-explosion-4.png",
    width_in_frames = 5,
    height_in_frames = 5
    }
    },
    usage = "explosion"
  }
end

explosion_animations.laser_bubble = function()
  return
  {
    {
      filename = "__base__/graphics/entity/laser-bubble/laser-bubble.png",
      draw_as_glow = true,
      priority = "extra-high",
      width = 8,
      height = 8,
      frame_count = 5,
      usage = "explosion"
    }
  }
end

explosion_animations.bigass_explosion = function()
  return
  {
    {
      filename = "__base__/graphics/entity/bigass-explosion/hr-bigass-explosion-36f.png",
      draw_as_glow = true,
      animation_speed = 0.5,
      width = 324,
      height = 416,
      frame_count = 36,
      shift = util.by_pixel(0, -48),
      stripes =
      {
        {
          filename = "__base__/graphics/entity/bigass-explosion/bigass-explosion-36f-1.png",
          width_in_frames = 6,
          height_in_frames = 3
        },
        {
          filename = "__base__/graphics/entity/bigass-explosion/bigass-explosion-36f-2.png",
          width_in_frames = 6,
          height_in_frames = 3
        }
      },
      usage = "explosion"
    }
  }
end

explosion_animations.artillery_muzzle_flash = function()
  return
  {
    {
      filename = "__base__/graphics/entity/artillery-cannon-muzzle-flash/muzzle-flash.png",
      draw_as_glow = true,
      line_length = 7,
      width = 276,
      height = 382,
      frame_count = 21,
      scale = 0.5,
      shift = util.by_pixel(1, -82),
      animation_speed = 0.75,
      usage = "explosion"
    }
  }
end

return explosion_animations

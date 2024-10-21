local explosion_animations = require("__base__/prototypes/entity/explosion-animations")
local util = require("util")

explosion_animations.asteroid_explosion_chunk = function(options)
  return
  {
    {
      filename = "__space-age__/graphics/entity/asteroid-explosions/asteroid-explosion-chunk.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 78,
      height = 90,
      frame_count = 31,
      animation_speed = 0.6,
      shift = util.by_pixel( -0.5, 0.5),
      scale = 0.7,
      tint = options and options.tint,
    }
  }
end
  
explosion_animations.asteroid_explosion_small = function(options)
  return
  {
    {
      filename = "__space-age__/graphics/entity/asteroid-explosions/asteroid-explosion-small.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 118,
      height = 142,
      frame_count = 31,
      animation_speed = 0.6,
      shift = util.by_pixel( -1.5, 0.0),
      scale = 0.8,
      tint = options and options.tint,
    }
  }
end
  
explosion_animations.asteroid_explosion_medium = function(options)
  return
  {
    {
      filename = "__space-age__/graphics/entity/asteroid-explosions/asteroid-explosion-medium.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 196,
      height = 224,
      frame_count = 32,
      animation_speed = 0.5,
      shift = util.by_pixel(0.0, 5.0),
      scale = 0.8,
      tint = options and options.tint,
    }
  }
end
  
explosion_animations.asteroid_explosion_big = function(options)
  return
  {
    {
      filename = "__space-age__/graphics/entity/asteroid-explosions/asteroid-explosion-big.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 248,
      height = 300,
      frame_count = 32,
      animation_speed = 0.5,
      shift = util.by_pixel( -1.0, -0.5),
      scale = 0.8,
      tint = options and options.tint,
    }
  }
end
  
explosion_animations.asteroid_explosion_huge = function(options)
  return
  {
    {
      filename = "__space-age__/graphics/entity/asteroid-explosions/asteroid-explosion-huge.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 442,
      height = 400,
      frame_count = 31,
      animation_speed = 0.5,
      shift = util.by_pixel(4.5, -3.0),
      scale = 0.7,
      tint = options and options.tint,
    }
  }
end

explosion_animations.magma_eruption = function()
  return
  {
    {
      filename = "__space-age__/graphics/entity/demolisher/magma-eruption/magma-eruption-1.png",
      draw_as_glow = true,
      width = 290,
      height = 358,
      frame_count = 54,
      line_length = 6,
      animation_speed = 0.5,
      shift = util.by_pixel( 9.0, 12.0),
      scale = 0.5
    },
    {
      filename = "__space-age__/graphics/entity/demolisher/magma-eruption/magma-eruption-2.png",
      draw_as_glow = true,
      width = 318,
      height = 428,
      frame_count = 54,
      line_length = 6,
      animation_speed = 0.5,
      shift = util.by_pixel( 8.5, 9.5),
      scale = 0.5
    }, 
    {
      filename = "__space-age__/graphics/entity/demolisher/magma-eruption/magma-eruption-3.png",
      draw_as_glow = true,
      width = 304,
      height = 398,
      frame_count = 54,
      line_length = 6,
      animation_speed = 0.5,
      shift = util.by_pixel( 7.5, 0.5),
      scale = 0.5
    }, 
    {
      filename = "__space-age__/graphics/entity/demolisher/magma-eruption/magma-eruption-4.png",
      draw_as_glow = true,
      width = 274,
      height = 384,
      frame_count = 54,
      line_length = 6,
      animation_speed = 0.5,
      shift = util.by_pixel(-16.0, -13.5),
      scale = 0.5
    }, 
  }
end

return explosion_animations

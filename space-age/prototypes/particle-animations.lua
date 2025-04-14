
local particle_animations = require("__base__/prototypes/particle-animations")

particle_animations.get_lava_particle_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/lava-particle/vulcanus-lava-particle.png",
      line_length = 12,
      width = 32,
      height = 24,
      frame_count = 12,
      variation_count = 7,
      scale = 0.25,
      draw_as_glow = true,
      shift = util.add_shift(util.by_pixel(0,0.5), options.shift)
    }
  }
end

particle_animations.get_lava_particle_big_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/lava-particle/vulcanus-lava-particle.png",
      line_length = 12,
      width = 32,
      height = 24,
      frame_count = 12,
      variation_count = 7,
      scale = 0.45,
      draw_as_glow = true,
      shift = util.add_shift(util.by_pixel(0,0.5), options.shift)
    }
  }
end
-------------------------------------------------------------------------------
--CARBONIC-asteroid-particles

particle_animations.get_carbonic_asteroid_particle_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/carbonic-asteroid-particle-small.png",
      priority = "extra-high",
      width = 14,
      height = 16,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_carbonic_asteroid_particle_medium_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/carbonic-asteroid-particle-medium.png",
      priority = "extra-high",
      width = 22,
      height = 22,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.0), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_carbonic_asteroid_particle_big_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/carbonic-asteroid-particle-big.png",
      priority = "extra-high",
      width = 36,
      height = 36,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.5
    }
  }
end
particle_animations.get_carbonic_asteroid_particle_top_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/carbonic-asteroid-particle-top-small.png",
      priority = "extra-high",
      width = 58,
      height = 56,
      frame_count = 16,
      animation_speed = 0.2,
      variation_count = 6,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel( 0.5, 0.0), options.shift),
      scale = 0.5
    }
  }
end
particle_animations.get_carbonic_asteroid_particle_top_big_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/carbonic-asteroid-particle-top-big.png",
      priority = "extra-high",
      width = 82,
      height = 82,
      frame_count = 16,
      animation_speed = 0.2,
      variation_count = 6,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel( 0.5, 0.5), options.shift),
      scale = options.scale or 0.5
    }
  }
end

-------------------------------------------------------------------------------
--METALLIC-asteroid-particles

particle_animations.get_metallic_asteroid_particle_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/metallic-asteroid-particle-small.png",
      priority = "extra-high",
      width = 14,
      height = 16,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_metallic_asteroid_particle_medium_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/metallic-asteroid-particle-medium.png",
      priority = "extra-high",
      width = 22,
      height = 20,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.0), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_metallic_asteroid_particle_big_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/metallic-asteroid-particle-big.png",
      priority = "extra-high",
      width = 36,
      height = 36,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_metallic_asteroid_particle_top_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/metallic-asteroid-particle-top-small.png",
      priority = "extra-high",
      width = 62,
      height = 56,
      frame_count = 16,
      animation_speed = 0.2,
      variation_count = 6,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(2.5, 2.0), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_metallic_asteroid_particle_top_big_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/metallic-asteroid-particle-top-big.png",
      priority = "extra-high",
      width = 82,
      height = 86,
      frame_count = 16,
      animation_speed = 0.2,
      variation_count = 6,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(2.0, 2.5), options.shift),
      scale = options.scale or 0.5
    }
  }
end
-------------------------------------------------------------------------------
--OXIDE-asteroid-particles

particle_animations.get_oxide_asteroid_particle_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/oxide-asteroid-particle-small.png",
      priority = "extra-high",
      width = 16,
      height = 18,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.6
    }
  }
end

particle_animations.get_oxide_asteroid_particle_medium_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/oxide-asteroid-particle-medium.png",
      priority = "extra-high",
      width = 28,
      height = 22,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_oxide_asteroid_particle_big_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/oxide-asteroid-particle-big.png",
      priority = "extra-high",
      width = 44,
      height = 38,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.6
    }
  }
end
particle_animations.get_oxide_asteroid_particle_top_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/oxide-asteroid-particle-top-small.png",
      priority = "extra-high",
      width = 70,
      height = 52,
      frame_count = 16,
      animation_speed = 0.2,
      variation_count = 6,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0, 0.0), options.shift),
      scale = 0.5
    }
  }
end
particle_animations.get_oxide_asteroid_particle_top_big_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/oxide-asteroid-particle-top-big.png",
      priority = "extra-high",
      width = 90,
      height = 88,
      frame_count = 16,
      animation_speed = 0.2,
      variation_count = 6,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0, 1.0), options.shift),
      scale = options.scale or 0.5
    }
  }
end
-------------------------------------------------------------------------------
--promethium-asteroid-particles

particle_animations.get_promethium_asteroid_particle_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/promethium-asteroid-particle-small.png",
      priority = "extra-high",
      width = 12,
      height = 12,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_promethium_asteroid_particle_medium_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/promethium-asteroid-particle-medium.png",
      priority = "extra-high",
      width = 18,
      height = 16,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_promethium_asteroid_particle_big_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/promethium-asteroid-particle-big.png",
      priority = "extra-high",
      width = 38,
      height = 36,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.5
    }
  }
end
particle_animations.get_promethium_asteroid_particle_top_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/promethium-asteroid-particle-top-small.png",
      priority = "extra-high",
      width = 32,
      height = 36,
      frame_count = 16,
      animation_speed = 0.2,
      variation_count = 6,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0, 0.0), options.shift),
      scale = 0.5
    }
  }
end
particle_animations.get_promethium_asteroid_particle_top_big_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/promethium-asteroid-particle-top-big.png",
      priority = "extra-high",
      width = 82,
      height = 84,
      frame_count = 16,
      animation_speed = 0.2,
      variation_count = 6,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0, 1.0), options.shift),
      scale = options.scale or 0.5
    }
  }
end


-------------------------------------------------------------------------------
--PENTAPOD-particles

particle_animations.get_pentpod_entrails_particles = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/pentapod-particle/pentapod-entrails-particles.png",
      priority = "extra-high",
      width = 86,
      height = 90,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = util.add_shift(util.by_pixel(0,1.0), options.shift),
      scale = 0.5 * (options.scale or 1)
    }
  }
end

particle_animations.get_pentpod_skin_particles_small = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/pentapod-particle/pentapod-skin-particles-small.png",
      priority = "extra-high",
      width = 24,
      height = 26,
      frame_count = 12,
      animation_speed = 0.8,
      variation_count = 6,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = util.add_shift(util.by_pixel(0.0,0.0), options.shift),
      scale = 0.5 * (options.scale or 1)
    }
  }
end

particle_animations.get_pentpod_skin_particles_medium = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/pentapod-particle/pentapod-skin-particles-medium.png",
      priority = "extra-high",
      width = 50,
      height = 56,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 6,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = util.add_shift(util.by_pixel(-0.5, 1.0), options.shift),
      scale = 0.5 * (options.scale or 1)
    }
  }
end

particle_animations.get_pentpod_skin_particles_big = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/pentapod-particle/pentapod-skin-particles-big.png",
      priority = "extra-high",
      width = 84,
      height = 86,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 4,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = util.add_shift(util.by_pixel(0.0, 0.0), options.shift),
      scale = 0.5 * (options.scale or 1)
    }
  }
end

particle_animations.get_pentpod_shell_particles_small = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/pentapod-particle/pentapod-shell-particles-small.png",
      priority = "extra-high",
      width = 18,
      height = 20,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 6,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = util.add_shift(util.by_pixel(0.0,0.0), options.shift),
      scale = 0.5 * (options.scale or 1)
    }
  }
end

particle_animations.get_pentpod_shell_particles_big = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/pentapod-particle/pentapod-shell-particles-big.png",
      priority = "extra-high",
      width = 66,
      height = 58,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 4,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = util.add_shift(util.by_pixel(2.0,1.5), options.shift),
      scale = 0.5 * (options.scale or 1)
    }
  }
end

-------------------------------------------------------------------------------
--DEMOLISHER-particles

particle_animations.get_demolisher_skin_particles_small = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/demolisher-particle/demolisher-skin-particles-small.png",
      priority = "extra-high",
      width = 30,
      height = 32,
      frame_count = 12,
      animation_speed = 0.8,
      variation_count = 5,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = util.add_shift(util.by_pixel(0.0, 0.0), options.shift),
      scale = 0.5 * (options.scale or 1)
    }
  }
end

particle_animations.get_demolisher_skin_particles_medium = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/demolisher-particle/demolisher-skin-particles-medium.png",
      priority = "extra-high",
      width = 62,
      height = 68,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 5,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = util.add_shift(util.by_pixel(-0.5, 0.0), options.shift),
      scale = 0.5 * (options.scale or 1)
    }
  }
end

particle_animations.get_demolisher_skin_particles_big = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/demolisher-particle/demolisher-skin-particles-big.png",
      priority = "extra-high",
      width = 92,
      height = 104,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 4,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = util.add_shift(util.by_pixel( -1.5, 0.0), options.shift),
      scale = 0.5 * (options.scale or 1)
    }
  }
end

particle_animations.get_demolisher_shell_particles_small = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/demolisher-particle/demolisher-shell-particles-small.png",
      priority = "extra-high",
      width = 50,
      height = 50,
      frame_count = 1,
      animation_speed = 0.8,
      variation_count = 6,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = util.add_shift(util.by_pixel(0.0, 0.0), options.shift),
      scale = 0.3 * (options.scale or 1)
    }
  }
end

particle_animations.get_demolisher_shell_particles_big = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/demolisher-particle/demolisher-shell-particles-big.png",
      priority = "extra-high",
      width = 200,
      height = 200,
      frame_count = 1,
      animation_speed = 0.5,
      variation_count = 4,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = util.add_shift(util.by_pixel( 0.0, 0.0), options.shift),
      scale = 0.35 * (options.scale or 1)
    }
  }
end

particle_animations.get_gleba_tree_sap_particle_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/gleba-tree-particle/gleba-tree-sap-particle.png",
      line_length = 12,
      width = 32,
      height = 24,
      frame_count = 12,
      variation_count = 7,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      draw_as_glow = true,
      shift = util.add_shift(util.by_pixel(0,0.5), options.shift),
      scale = 0.3 * (options.scale or 1),
      
    }
  }
end

particle_animations.get_slipstack_sap_particle_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/gleba-tree-particle/gleba-tree-sap-particle.png",
      line_length = 12,
      width = 32,
      height = 24,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 7,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      draw_as_glow = true,
      shift = util.add_shift(util.by_pixel(0,0.5), options.shift),
      scale = 0.3 * (options.scale or 1),
      
    }
  }
end


particle_animations.get_gleba_tree_leaf_particle_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename =  "__space-age__/graphics/particle/gleba-tree-particle/gleba-leaf-particle.png",
      priority = "extra-high",
      width = 48,
      height = 50,
      frame_count = 16,
      animation_speed = 0.8,
      variation_count = 10,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = {0.0, 0.0},
      --shift = util.add_shift(util.by_pixel( 0.0, 0.0), options.shift),
      scale = 0.5 * (options.scale or 1),
    }
  }
end

particle_animations.get_gleba_tree_leaf_particle_2_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename =  "__space-age__/graphics/particle/gleba-tree-particle/gleba-leaf-particle-2.png",
      priority = "extra-high",
      width = 56,
      height = 54,
      frame_count = 16,
      animation_speed = 0.8,
      variation_count = 6,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = {0.0, 0.0},
      --shift = util.add_shift(util.by_pixel( 0.0, 0.0), options.shift),
      scale = 0.5 * (options.scale or 1),
    }
  }
end

particle_animations.get_gleba_tree_crop_particle_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename =  "__space-age__/graphics/particle/gleba-tree-particle/gleba-crop-particle.png",
      priority = "extra-high",
      width = 38,
      height = 38,
      frame_count = 16,
      animation_speed = 0.5,
      variation_count = 10,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = {0.0, 0.0},
      --shift = util.add_shift(util.by_pixel( 0.0, 0.0), options.shift),
      scale = 0.5 * (options.scale or 1),
    }
  }
end

particle_animations.get_gleba_tree_wooden_particle_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename =  "__space-age__/graphics/particle/gleba-tree-particle/gleba-wooden-particle.png",
      priority = "extra-high",
      width = 52,
      height = 62,
      frame_count = 16,
      animation_speed = 0.5,
      variation_count = 10,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = {0.0, 0.0},
      --shift = util.add_shift(util.by_pixel( 0.0, 0.0), options.shift),
      scale = 0.5 * (options.scale or 1),
    }
  }
end

particle_animations.get_gleba_tree_spongy_particle_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename =  "__space-age__/graphics/particle/gleba-tree-particle/gleba-spongy-particle.png",
      priority = "extra-high",
      width = 40,
      height = 38,
      frame_count = 16,
      animation_speed = 0.5,
      variation_count = 10,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = {0.0, 0.0},
      --shift = util.add_shift(util.by_pixel( 0.0, 0.0), options.shift),
      scale = 0.5 * (options.scale or 1),
    }
  }
end

particle_animations.get_gleba_water_cane_particle_pictures = function(options)
  local options = options or {}
  return
  {
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-01.png",
      line_length = 4,
      width = 17,
      height = 16,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-02.png",
      line_length = 4,
      width = 4,
      height = 9,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-03.png",
      line_length = 4,
      width = 10,
      height = 14,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-04.png",
      line_length = 4,
      width = 8,
      height = 11,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-05.png",
      line_length = 4,
      width = 14,
      height = 13,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-06.png",
      line_length = 4,
      width = 14,
      height = 12,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-07.png",
      line_length = 4,
      width = 11,
      height = 10,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-08.png",
      line_length = 4,
      width = 17,
      height = 14,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-09.png",
      line_length = 4,
      width = 14,
      height = 16,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-10.png",
      line_length = 4,
      width = 11,
      height = 20,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-11.png",
      line_length = 4,
      width = 21,
      height = 18,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    -- {
    --   filename = "__base__/graphics/particle/wooden-particle/wooden-particle-12.png",
    --   line_length = 4,
    --   width = 14,
    --   height = 32,
    --   frame_count = 16,
    --   animation_speed = options.animation_speed or 0.5,
    --   scale = 0.5 * (options.scale or 1),
    --   tint = options.tint,
    --   tint_as_overlay = options.tint_as_overlay,
    -- },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-13.png",
      line_length = 4,
      width = 14,
      height = 18,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-14.png",
      line_length = 4,
      width = 12,
      height = 24,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-15.png",
      line_length = 4,
      width = 14,
      height = 19,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-16.png",
      line_length = 4,
      width = 24,
      height = 12,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    -- {
    --   filename = "__base__/graphics/particle/wooden-particle/wooden-particle-17.png",
    --   line_length = 4,
    --   width = 25,
    --   height = 15,
    --   frame_count = 16,
    --   animation_speed = options.animation_speed or 0.5,
    --   scale = 0.5 * (options.scale or 1),
    --   tint = options.tint,
    --   tint_as_overlay = options.tint_as_overlay,
    -- },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-18.png",
      line_length = 4,
      width = 22,
      height = 23,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-19.png",
      line_length = 4,
      width = 32,
      height = 29,
      frame_count = 16,
      animation_speed = 0.5,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    -- {
    --   filename = "__base__/graphics/particle/wooden-particle/wooden-particle-20.png",
    --   line_length = 4,
    --   width = 17,
    --   height = 29,
    --   frame_count = 16,
    --   animation_speed = options.animation_speed or 0.5,
    --   scale = 0.5 * (options.scale or 1),
    --   tint = options.tint,
    --   tint_as_overlay = options.tint_as_overlay,
    -- },
    -- {
    --   filename = "__base__/graphics/particle/wooden-particle/wooden-particle-21.png",
    --   line_length = 4,
    --   width = 15,
    --   height = 32,
    --   frame_count = 16,
    --   animation_speed = options.animation_speed or 0.5,
    --   scale = 0.5 * (options.scale or 1),
    --   tint = options.tint,
    --   tint_as_overlay = options.tint_as_overlay,
    -- },
    -- {
    --   filename = "__base__/graphics/particle/wooden-particle/wooden-particle-22.png",
    --   line_length = 4,
    --   width = 34,
    --   height = 19,
    --   frame_count = 16,
    --   animation_speed = options.animation_speed or 0.5,
    --   scale = 0.5 * (options.scale or 1),
    --   tint = options.tint,
    --   tint_as_overlay = options.tint_as_overlay,
    -- },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-23.png",
      line_length = 4,
      width = 34,
      height = 43,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-24.png",
      line_length = 4,
      width = 38,
      height = 33,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-25.png",
      line_length = 4,
      width = 45,
      height = 50,
      frame_count = 16,
      animation_speed = options.animation_speed or 0.5,
      scale = 0.5 * (options.scale or 1),
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
    }
  }

end

return particle_animations
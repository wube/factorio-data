local particle_animations = {}

particle_animations.get_metal_particle_big_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/metal-particle/metal-particle-big.png",
      priority = "extra-high",
      width = 50,
      height = 44,
      frame_count = 12,
      tint = options.tint,
      animation_speed = 0.5,
      variation_count = 10,
      shift = util.add_shift(util.by_pixel(2.25,0.75), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_wooden_particle_pictures = function(options)
  return
  {
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-01.png",
      line_length = 4,
      width = 17,
      height = 16,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-02.png",
      line_length = 4,
      width = 4,
      height = 9,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-03.png",
      line_length = 4,
      width = 10,
      height = 14,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-04.png",
      line_length = 4,
      width = 8,
      height = 11,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-05.png",
      line_length = 4,
      width = 14,
      height = 13,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-06.png",
      line_length = 4,
      width = 14,
      height = 12,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-07.png",
      line_length = 4,
      width = 11,
      height = 10,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-08.png",
      line_length = 4,
      width = 17,
      height = 14,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-09.png",
      line_length = 4,
      width = 14,
      height = 16,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-10.png",
      line_length = 4,
      width = 11,
      height = 20,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-11.png",
      line_length = 4,
      width = 21,
      height = 18,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-12.png",
      line_length = 4,
      width = 14,
      height = 32,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-13.png",
      line_length = 4,
      width = 14,
      height = 18,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-14.png",
      line_length = 4,
      width = 12,
      height = 24,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-15.png",
      line_length = 4,
      width = 14,
      height = 19,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-16.png",
      line_length = 4,
      width = 24,
      height = 12,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-17.png",
      line_length = 4,
      width = 25,
      height = 15,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-18.png",
      line_length = 4,
      width = 22,
      height = 23,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-19.png",
      line_length = 4,
      width = 32,
      height = 29,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-20.png",
      line_length = 4,
      width = 17,
      height = 29,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-21.png",
      line_length = 4,
      width = 15,
      height = 32,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-22.png",
      line_length = 4,
      width = 34,
      height = 19,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-23.png",
      line_length = 4,
      width = 34,
      height = 43,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-24.png",
      line_length = 4,
      width = 38,
      height = 33,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-25.png",
      line_length = 4,
      width = 45,
      height = 50,
      frame_count = 16,
      scale = 0.5
    }
  }

end

particle_animations.get_branch_particle_shadow_pictures = function()
  return
  {
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-01.png",
      line_length = 4,
      width = 66,
      height = 64,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-02.png",
      line_length = 4,
      width = 87,
      height = 107,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-03.png",
      line_length = 4,
      width = 121,
      height = 119,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-04.png",
      line_length = 4,
      width = 26,
      height = 57,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-05.png",
      line_length = 4,
      width = 53,
      height = 40,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-06.png",
      line_length = 4,
      width = 64,
      height = 46,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-07.png",
      line_length = 4,
      width = 65,
      height = 69,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-08.png",
      line_length = 4,
      width = 27,
      height = 60,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-09.png",
      line_length = 4,
      width = 52,
      height = 64,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-10.png",
      line_length = 4,
      width = 53,
      height = 55,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-11.png",
      line_length = 4,
      width = 49,
      height = 64,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-12.png",
      line_length = 4,
      width = 64,
      height = 56,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-13.png",
      line_length = 4,
      width = 50,
      height = 35,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-14.png",
      line_length = 4,
      width = 54,
      height = 37,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-15.png",
      line_length = 4,
      width = 23,
      height = 30,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-16.png",
      line_length = 4,
      width = 25,
      height = 27,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-17.png",
      line_length = 4,
      width = 62,
      height = 59,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-18.png",
      line_length = 4,
      width = 57,
      height = 67,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-19.png",
      line_length = 4,
      width = 76,
      height = 79,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-20.png",
      line_length = 4,
      width = 56,
      height = 48,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-21.png",
      line_length = 4,
      width = 46,
      height = 47,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-22.png",
      line_length = 4,
      width = 26,
      height = 37,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-23.png",
      line_length = 4,
      width = 70,
      height = 26,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-24.png",
      line_length = 4,
      width = 28,
      height = 37,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-25.png",
      line_length = 4,
      width = 44,
      height = 41,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-26.png",
      line_length = 4,
      width = 25,
      height = 42,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-27.png",
      line_length = 4,
      width = 70,
      height = 33,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-28.png",
      line_length = 4,
      width = 34,
      height = 29,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-shadow-29.png",
      line_length = 4,
      width = 51,
      height = 50,
      frame_count = 8,
      scale = 0.5
    }
  }
end

particle_animations.get_branch_particle_pictures = function()
  return
  {
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-01.png",
      line_length = 4,
      width = 66,
      height = 64,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-02.png",
      line_length = 4,
      width = 87,
      height = 107,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-03.png",
      line_length = 4,
      width = 121,
      height = 119,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-04.png",
      line_length = 4,
      width = 26,
      height = 57,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-05.png",
      line_length = 4,
      width = 53,
      height = 40,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-06.png",
      line_length = 4,
      width = 64,
      height = 46,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-07.png",
      line_length = 4,
      width = 65,
      height = 69,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-08.png",
      line_length = 4,
      width = 27,
      height = 60,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-09.png",
      line_length = 4,
      width = 52,
      height = 64,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-10.png",
      line_length = 4,
      width = 53,
      height = 55,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-11.png",
      line_length = 4,
      width = 49,
      height = 64,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-12.png",
      line_length = 4,
      width = 64,
      height = 56,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-13.png",
      line_length = 4,
      width = 50,
      height = 35,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-14.png",
      line_length = 4,
      width = 54,
      height = 37,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-15.png",
      line_length = 4,
      width = 23,
      height = 30,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-16.png",
      line_length = 4,
      width = 25,
      height = 27,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-17.png",
      line_length = 4,
      width = 62,
      height = 59,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-18.png",
      line_length = 4,
      width = 57,
      height = 67,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-19.png",
      line_length = 4,
      width = 76,
      height = 79,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-20.png",
      line_length = 4,
      width = 56,
      height = 48,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-21.png",
      line_length = 4,
      width = 46,
      height = 47,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-22.png",
      line_length = 4,
      width = 26,
      height = 37,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-23.png",
      line_length = 4,
      width = 70,
      height = 26,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-24.png",
      line_length = 4,
      width = 28,
      height = 37,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-25.png",
      line_length = 4,
      width = 44,
      height = 41,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-26.png",
      line_length = 4,
      width = 25,
      height = 42,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-27.png",
      line_length = 4,
      width = 70,
      height = 33,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-28.png",
      line_length = 4,
      width = 34,
      height = 29,
      frame_count = 8,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/branch-particle/branch-particle-29.png",
      line_length = 4,
      width = 51,
      height = 50,
      frame_count = 8,
      scale = 0.5
    }
  }
end

particle_animations.get_leaf_particle_pictures = function(options)
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/leaf-particle/leaf-particle.png",
      priority = "extra-high",
      line_length = 12,
      width = 26,
      height = 18,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      shift = util.add_shift(util.by_pixel(3.25,-0.75), options and options.shift or nil),
      tint = options and options.tint or nil,
      scale = 0.5
    }
  }
end

particle_animations.get_new_leaf_particle_pictures = function(options)
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/leaf-particle/new-leaf-particle.png",
      priority = "extra-high",
      line_length = 12,
      width = 26,
      height = 18,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      shift = util.add_shift(util.by_pixel(3.25,-0.75), options and options.shift or nil),
      tint = options and options.tint or nil,
      scale = 0.5
    }
  }
end

particle_animations.get_coal_particle_shadow_pictures = function()
  return

  {
    {
      filename = "__base__/graphics/particle/coal-particle/coal-particle-shadow-1.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/coal-particle/coal-particle-shadow-2.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/coal-particle/coal-particle-shadow-3.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/coal-particle/coal-particle-shadow-4.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    }
  }
end

particle_animations.get_coal_particle_pictures = function()
  return
  {
    {
      filename = "__base__/graphics/particle/coal-particle/coal-particle-1.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/coal-particle/coal-particle-2.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/coal-particle/coal-particle-3.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/coal-particle/coal-particle-4.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    }
  }
end

particle_animations.get_old_stone_particle_shadow_pictures = function(options)
  return

  {
    {
      filename = "__base__/graphics/particle/stone-particle/stone-particle-shadow-1.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/stone-particle/stone-particle-shadow-2.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/stone-particle/stone-particle-shadow-3.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/stone-particle/stone-particle-shadow-4.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    }
  }
end

particle_animations.get_old_stone_particle_pictures = function(options)
  return
  {
    {
      filename = "__base__/graphics/particle/stone-particle/stone-particle-1.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/stone-particle/stone-particle-2.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/stone-particle/stone-particle-3.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/stone-particle/stone-particle-4.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    }
  }
end

particle_animations.get_copper_particle_shadow_pictures = function(options)
  return

  {
    {
      filename = "__base__/graphics/particle/copper-ore-particle/copper-ore-particle-shadow-1.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/copper-ore-particle/copper-ore-particle-shadow-2.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/copper-ore-particle/copper-ore-particle-shadow-3.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/copper-ore-particle/copper-ore-particle-shadow-4.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    }
  }
end

particle_animations.get_copper_particle_pictures = function(options)
  return

  {
    {
      filename = "__base__/graphics/particle/copper-ore-particle/copper-ore-particle-1.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/copper-ore-particle/copper-ore-particle-2.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/copper-ore-particle/copper-ore-particle-3.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/copper-ore-particle/copper-ore-particle-4.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    }
  }
end

particle_animations.get_iron_particle_shadow_pictures = function(options)
  return
  {
    {
      filename = "__base__/graphics/particle/iron-ore-particle/iron-ore-particle-shadow-1.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/iron-ore-particle/iron-ore-particle-shadow-2.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/iron-ore-particle/iron-ore-particle-shadow-3.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/iron-ore-particle/iron-ore-particle-shadow-4.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    }
  }
end

particle_animations.get_iron_particle_pictures = function(options)
  return
  {
    {
      filename = "__base__/graphics/particle/iron-ore-particle/iron-ore-particle-1.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/iron-ore-particle/iron-ore-particle-2.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/iron-ore-particle/iron-ore-particle-3.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/iron-ore-particle/iron-ore-particle-4.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    }
  }
end

particle_animations.get_explosion_remnants_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/explosion-particle/explosion-particle.png",
      priority = "extra-high",
      width = 38,
      height = 38,
      frame_count = 10,
      animation_speed = 0.5,
      variation_count = 40
    }
  }
end

particle_animations.get_explosion_remnants_shadow_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/explosion-particle/explosion-particle-shadow.png",
      priority = "extra-high",
      width = 48,
      height = 38,
      frame_count = 10,
      animation_speed = 0.5,
      variation_count = 40,
      shift = {0.0625, 0}
    }
  }
end

particle_animations.get_shell_particle_pictures = function(options)
  return
  {
    {
      filename = "__base__/graphics/particle/shell-particle/shell-particle-1.png",
      priority = "extra-high",
      width = 6,
      height = 6,
      frame_count = 5
    },
    {
      filename = "__base__/graphics/particle/shell-particle/shell-particle-2.png",
      priority = "extra-high",
      width = 5,
      height = 7,
      frame_count = 5
    }
  }
end

particle_animations.get_shell_particle_shadow_pictures = function(options)
  return
  {
    {
      filename = "__base__/graphics/particle/shell-particle/shell-particle-shadow-1.png",
      priority = "extra-high",
      width = 9,
      height = 7,
      frame_count = 5
    },
    {
      filename = "__base__/graphics/particle/shell-particle/shell-particle-shadow-2.png",
      priority = "extra-high",
      width = 7,
      height = 8,
      frame_count = 5
    }
  }
end

particle_animations.get_wooden_particle_shadow_pictures = function(options)
  return
  {
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-01.png",
      line_length = 4,
      width = 17,
      height = 16,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-02.png",
      line_length = 4,
      width = 4,
      height = 9,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-03.png",
      line_length = 4,
      width = 10,
      height = 14,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-04.png",
      line_length = 4,
      width = 8,
      height = 11,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-05.png",
      line_length = 4,
      width = 14,
      height = 13,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-06.png",
      line_length = 4,
      width = 14,
      height = 12,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-07.png",
      line_length = 4,
      width = 11,
      height = 10,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-08.png",
      line_length = 4,
      width = 17,
      height = 14,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-09.png",
      line_length = 4,
      width = 14,
      height = 16,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-10.png",
      line_length = 4,
      width = 11,
      height = 20,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-11.png",
      line_length = 4,
      width = 21,
      height = 18,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-12.png",
      line_length = 4,
      width = 14,
      height = 32,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-13.png",
      line_length = 4,
      width = 14,
      height = 18,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-14.png",
      line_length = 4,
      width = 12,
      height = 24,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-15.png",
      line_length = 4,
      width = 14,
      height = 19,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-16.png",
      line_length = 4,
      width = 24,
      height = 12,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-17.png",
      line_length = 4,
      width = 25,
      height = 15,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-18.png",
      line_length = 4,
      width = 22,
      height = 23,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-19.png",
      line_length = 4,
      width = 32,
      height = 29,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-20.png",
      line_length = 4,
      width = 17,
      height = 29,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-21.png",
      line_length = 4,
      width = 15,
      height = 32,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-22.png",
      line_length = 4,
      width = 34,
      height = 19,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-23.png",
      line_length = 4,
      width = 34,
      height = 43,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-24.png",
      line_length = 4,
      width = 38,
      height = 33,
      frame_count = 16,
      scale = 0.5
    },
    {
      filename = "__base__/graphics/particle/wooden-particle/wooden-particle-shadow-25.png",
      line_length = 4,
      width = 45,
      height = 50,
      frame_count = 16,
      scale = 0.5
    }
  }
end

particle_animations.get_metal_particle_medium_pictures = function(options)
  local options = options or {}
  return
  {
  sheet =
    {
      filename = "__base__/graphics/particle/metal-particle/metal-particle-medium.png",
      priority = "extra-high",
      width = 30,
      height = 30,
      tint = options.tint,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      shift = util.add_shift(util.by_pixel(2.25,0.75), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_metal_particle_medium_long_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/metal-particle/long-metal-particle-medium.png",
      priority = "extra-high",
      width = 100,
      height = 92,
      tint = options.tint,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      shift = util.add_shift(util.by_pixel(3.75,0.25), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_mechanical_component_particle_medium_pictures = function(options)
  local options = options or {}
  return
    {
    sheet =
    {
      filename = "__base__/graphics/particle/mechanical-components-particle/mechanical-components-particle-medium.png",
      priority = "extra-high",
      width = 22,
      height = 22,
      tint = options.tint,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      shift = util.add_shift(util.by_pixel(2.25,-0.25), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_vegetation_particle_small_medium_pictures = function(options)
  local options = options or {}
  return
    {
    sheet =
    {
      filename = "__base__/graphics/particle/vegetation-particle/vegetation-particle-small-medium.png",
      priority = "extra-high",
      line_length = 12,
      width = 20,
      height = 26,
      tint = options.tint,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      shift = util.add_shift(util.by_pixel(2.25,-1.25), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_grass_particle_small_medium_pictures = function(options)
  local options = options or {}
  return
    {
    sheet =
    {
      filename = "__base__/graphics/particle/vegetation-particle/vegetation-particle-small-medium.png",
      priority = "extra-high",
      line_length = 12,
      width = 20,
      height = 26,
      tint = options.tint,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 4,
      shift = util.add_shift(util.by_pixel(2.25,-1.25), options.shift),
      scale = 0.8
    }
  }
end

particle_animations.get_vegetation_particle_character_pictures = function(options)
  local options = options or {}
  return
    {
    sheet =
    {
      filename = "__base__/graphics/particle/vegetation-particle/vegetation-particle-small-medium.png",
      priority = "extra-high",
      line_length = 12,
      width = 20,
      height = 26,
      tint = options.tint,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 4,
      shift = util.add_shift(util.by_pixel(2.25,-1.25), options.shift),
      scale = 0.7
    }
  }
end

particle_animations.get_vegetation_particle_vehicle_pictures = function(options)
  local options = options or {}
  return
    {
    sheet =
    {
      filename = "__base__/graphics/particle/vegetation-particle/vegetation-particle-small-medium.png",
      priority = "extra-high",
      line_length = 12,
      width = 20,
      height = 26,
      tint = options.tint,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 4,
      shift = util.add_shift(util.by_pixel(2.25,-1.25), options.shift),
      scale = 0.8
    }
  }
end

particle_animations.get_metal_particle_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/metal-particle/metal-particle-small.png",
      priority = "extra-high",
      width = 20,
      height = 16,
      tint = options.tint,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      shift = util.add_shift(util.by_pixel(2.25,-0.25), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_wooden_splinter_particle_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/wooden-particle/wood-splinter-particle-small.png",
      priority = "extra-high",
      width = 10,
      height = 10,
      tint = options.tint,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      shift = util.add_shift(util.by_pixel(2.25,-0.25), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_wooden_splinter_particle_medium_pictures = function(options)
  local options = options or {}
  return
 {
    sheet =
    {
      filename = "__base__/graphics/particle/wooden-particle/wood-splinter-particle-medium.png",
      priority = "extra-high",
      width = 20,
      height = 20,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(2.25,0.25), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_glass_particle_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/glass-particle/glass-particle-small.png",
      priority = "extra-high",
      width = 14,
      height = 14,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(2.75,0.25), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_guts_and_entrails_particle_small_medium_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/guts-entrails-particle/gut-particles.png",
      priority = "extra-high",
      width = 86,
      height = 90,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0,1.0), options.shift),
      scale = 0.17
    }
  }
end

particle_animations.get_guts_and_entrails_particle_big_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/guts-entrails-particle/gut-particles.png",
      priority = "extra-high",
      width = 86,
      height = 90,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0,1.0), options.shift),
      scale = 0.35
    }
  }
end

particle_animations.get_guts_and_entrails_particle_spawner = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/guts-entrails-particle/gut-particles.png",
      priority = "extra-high",
      width = 86,
      height = 90,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0,1.0), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_stone_particle_tiny_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/stone-particle/stone-particle-tiny.png",
      priority = "extra-high",
      width = 6,
      height = 6,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(2.25,0.25), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_stone_particle_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/stone-particle/stone-particle-small.png",
      priority = "extra-high",
      width = 10,
      height = 12,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(2.25,0.25), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_stone_particle_medium_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/stone-particle/stone-particle-medium.png",
      priority = "extra-high",
      width = 18,
      height = 20,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(2.25,0.25), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_stone_particle_big_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/stone-particle/stone-particle-big.png",
      priority = "extra-high",
      width = 36,
      height = 44,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(2.25,0.75), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_cable_and_electronic_particle_small_medium_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/cable-and-electronics-particle/cables-and-electronics-particle-small-medium.png",
      priority = "extra-high",
      width = 44,
      height = 58,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(1.25,0.75), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_sparks_debris_pictures = function()
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/spark-particle/sparks-debris.png",
      line_length = 12,
      width = 20,
      height = 22,
      frame_count = 12,
      variation_count = 2,
      scale = 0.5,
      shift = util.by_pixel(2,0.5)
    }
  }
end

particle_animations.get_pole_sparks_particle_pictures = function()
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/pole-sparks/pole-sparks.png",
      draw_as_glow = true,
      line_length = 12,
      width = 6,
      height = 6,
      frame_count = 12,
      variation_count = 3,
      scale = 0.5,
      shift = util.by_pixel(0,0)
    }
  }
end

particle_animations.get_sparks_particle_pictures = function()
  return

  {
    sheet =
    {
      filename = "__base__/graphics/particle/spark-particle/sparks.png",
      draw_as_glow = true,
      line_length = 12,
      width = 6,
      height = 6,
      frame_count = 12,
      variation_count = 3,
      scale = 0.5,
      shift = util.by_pixel(0,0)
    }
  }

end

particle_animations.get_water_particle_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/blood-particle/water-particle.png",
      line_length = 12,
      width = 16,
      height = 16,
      frame_count = 12,
      variation_count = 7,
      tint = options.tint,
      scale = 0.5,
      shift = util.add_shift(util.by_pixel(1.5,-1), options.shift)
    }
  }
end

particle_animations.get_blood_particle_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/blood-particle/blood-particle.png",
      line_length = 12,
      width = 32,
      height = 24,
      frame_count = 12,
      variation_count = 7,
      scale = 0.5 * options.scale,
      shift = util.add_shift(util.by_pixel(0,0.5), options.shift)
    }
  }
end

particle_animations.get_slowdown_particle_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/blood-particle/water-particle.png",
      line_length = 12,
      width = 16,
      height = 16,
      frame_count = 12,
      variation_count = 7,
      tint = options.tint,
      scale = 0.9,
      shift = util.add_shift(util.by_pixel(1.5,-1), options.shift)
    }
  }
end

particle_animations.get_dust_particle = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
    filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
    priority = "high",
    width = 50,
    height = 50,
    frame_count = 16,
    animation_speed = 1 / 2,
    scale = 0.5,
    variation_count = 1,
    tint = options.tint,
    affected_by_wind = true
    }
  }
end

particle_animations.get_general_dust_particle = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
    filename = "__base__/graphics/entity/smoke-fast/smoke-general.png",
    priority = "high",
    width = 50,
    height = 50,
    frame_count = 16,
    animation_speed = 1 / 2,
    scale = 0.5,
    variation_count = 1,
    tint = options.tint,
    }
  }
end

particle_animations.get_artillery_shell_particle = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/artillery-shell-particle/artillery-shells.png",
      line_length = 12,
      width = 34,
      height = 36,
      frame_count = 12,
      variation_count = 4,
      shift = util.add_shift(util.by_pixel(2.25,-0.75), options.shift),
      animation_speed = 1,
      scale = 0.5
    }
  }
end

particle_animations.get_rail_tie_particle = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/rail-tie-particle/rail-tie-particle.png",
      line_length = 16,
      width = 60,
      height = 80,
      frame_count = 16,
      variation_count = 5,
      shift = util.by_pixel( 0.5, -0.5),
      animation_speed = 1,
      scale = 0.5
    }
  }
end

return particle_animations

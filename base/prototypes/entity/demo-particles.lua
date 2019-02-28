function bloodtint()
return {r = 0.6, g = 0.1, b = 0.6}
end

function shadowtint()
return {r = 0, g = 0, b = 0}
end

function bloodparticlescale()
  return 1
end

function watertint()
  return {r = 0.1, g = 0.6, b = 0.85}
end

function waterparticlescale()
  return 1
end

data:extend(
{
  {
    type = "particle",
    name = "iron-ore-particle",
    flags = {"not-on-map"},
    life_time = 180,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/iron-ore-particle/iron-ore-particle-1.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/iron-ore-particle/hr-iron-ore-particle-1.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/iron-ore-particle/iron-ore-particle-2.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/iron-ore-particle/hr-iron-ore-particle-2.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/iron-ore-particle/iron-ore-particle-3.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/iron-ore-particle/hr-iron-ore-particle-3.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/iron-ore-particle/iron-ore-particle-4.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/iron-ore-particle/hr-iron-ore-particle-4.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      }
    },
    shadows =
    {
      {
        filename = "__base__/graphics/entity/iron-ore-particle/iron-ore-particle-shadow-1.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/iron-ore-particle/hr-iron-ore-particle-shadow-1.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/iron-ore-particle/iron-ore-particle-shadow-2.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/iron-ore-particle/hr-iron-ore-particle-shadow-2.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/iron-ore-particle/iron-ore-particle-shadow-3.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/iron-ore-particle/hr-iron-ore-particle-shadow-3.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/iron-ore-particle/iron-ore-particle-shadow-4.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/iron-ore-particle/hr-iron-ore-particle-shadow-4.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      }
    }
  },
  {
    type = "particle",
    name = "copper-ore-particle",
    flags = {"not-on-map"},
    life_time = 180,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-1.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/copper-ore-particle/hr-copper-ore-particle-1.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-2.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/copper-ore-particle/hr-copper-ore-particle-2.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-3.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/copper-ore-particle/hr-copper-ore-particle-3.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-4.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/copper-ore-particle/hr-copper-ore-particle-4.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      }
    },
    shadows =
    {
      {
        filename = "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-shadow-1.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/copper-ore-particle/hr-copper-ore-particle-shadow-1.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-shadow-2.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/copper-ore-particle/hr-copper-ore-particle-shadow-2.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-shadow-3.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/copper-ore-particle/hr-copper-ore-particle-shadow-3.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-shadow-4.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/copper-ore-particle/hr-copper-ore-particle-shadow-4.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      }
    }
  },
  {
    type = "particle",
    name = "stone-particle",
    flags = {"not-on-map"},
    life_time = 180,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/stone-particle/stone-particle-1.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/stone-particle/hr-stone-particle-1.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/stone-particle/stone-particle-2.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/stone-particle/hr-stone-particle-2.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/stone-particle/stone-particle-3.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/stone-particle/hr-stone-particle-3.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/stone-particle/stone-particle-4.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/stone-particle/hr-stone-particle-4.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      }
    },
    shadows =
    {
      {
        filename = "__base__/graphics/entity/stone-particle/stone-particle-shadow-1.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/stone-particle/hr-stone-particle-shadow-1.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/stone-particle/stone-particle-shadow-2.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/stone-particle/hr-stone-particle-shadow-2.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/stone-particle/stone-particle-shadow-3.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/stone-particle/hr-stone-particle-shadow-3.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/stone-particle/stone-particle-shadow-4.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/stone-particle/hr-stone-particle-shadow-4.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      }
    }
  },
  {
    type = "particle",
    name = "coal-particle",
    flags = {"not-on-map"},
    life_time = 180,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/coal-particle/coal-particle-1.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/coal-particle/hr-coal-particle-1.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/coal-particle/coal-particle-2.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/coal-particle/hr-coal-particle-2.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/coal-particle/coal-particle-3.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/coal-particle/hr-coal-particle-3.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/coal-particle/coal-particle-4.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/coal-particle/hr-coal-particle-4.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      }
    },
    shadows =
    {
      {
        filename = "__base__/graphics/entity/coal-particle/coal-particle-shadow-1.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/coal-particle/hr-coal-particle-shadow-1.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/coal-particle/coal-particle-shadow-2.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/coal-particle/hr-coal-particle-shadow-2.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/coal-particle/coal-particle-shadow-3.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/coal-particle/hr-coal-particle-shadow-3.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/coal-particle/coal-particle-shadow-4.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/coal-particle/hr-coal-particle-shadow-4.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      }
    }
  },
  {
    type = "particle",
    name = "wooden-particle",
    flags = {"not-on-map"},
    life_time = 180,
    mining_particle_frame_speed = 1,
    pictures =
    {
      --woodenC
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-01.png",
        line_length = 4,
        width = 9,
        height = 7,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-01.png",
          line_length = 4,
          width = 17,
          height = 16,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-02.png",
        line_length = 4,
        width = 2,
        height = 5,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-02.png",
          line_length = 4,
          width = 4,
          height = 9,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-03.png",
        line_length = 4,
        width = 6,
        height = 7,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-03.png",
          line_length = 4,
          width = 10,
          height = 14,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-04.png",
        line_length = 4,
        width = 5,
        height = 5,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-04.png",
          line_length = 4,
          width = 8,
          height = 11,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-05.png",
        line_length = 4,
        width = 6,
        height = 7,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-05.png",
          line_length = 4,
          width = 14,
          height = 13,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-06.png",
        line_length = 4,
        width = 7,
        height = 6,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-06.png",
          line_length = 4,
          width = 14,
          height = 12,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-07.png",
        line_length = 4,
        width = 6,
        height = 5,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-07.png",
          line_length = 4,
          width = 11,
          height = 10,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-08.png",
        line_length = 4,
        width = 8,
        height = 6,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-08.png",
          line_length = 4,
          width = 17,
          height = 14,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-09.png",
        line_length = 4,
        width = 7,
        height = 8,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-09.png",
          line_length = 4,
          width = 14,
          height = 16,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-10.png",
        line_length = 4,
        width = 5,
        height = 9,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-10.png",
          line_length = 4,
          width = 11,
          height = 20,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-11.png",
        line_length = 4,
        width = 10,
        height = 9,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-11.png",
          line_length = 4,
          width = 21,
          height = 18,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-12.png",
        line_length = 4,
        width = 6,
        height = 16,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-12.png",
          line_length = 4,
          width = 14,
          height = 32,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-13.png",
        line_length = 4,
        width = 7,
        height = 9,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-13.png",
          line_length = 4,
          width = 14,
          height = 18,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-14.png",
        line_length = 4,
        width = 7,
        height = 12,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-14.png",
          line_length = 4,
          width = 12,
          height = 24,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-15.png",
        line_length = 4,
        width = 7,
        height = 10,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-15.png",
          line_length = 4,
          width = 14,
          height = 19,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-16.png",
        line_length = 4,
        width = 12,
        height = 6,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-16.png",
          line_length = 4,
          width = 24,
          height = 12,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-17.png",
        line_length = 4,
        width = 12,
        height = 7,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-17.png",
          line_length = 4,
          width = 25,
          height = 15,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-18.png",
        line_length = 4,
        width = 11,
        height = 11,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-18.png",
          line_length = 4,
          width = 22,
          height = 23,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-19.png",
        line_length = 4,
        width = 16,
        height = 15,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-19.png",
          line_length = 4,
          width = 32,
          height = 29,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-20.png",
        line_length = 4,
        width = 9,
        height = 14,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-20.png",
          line_length = 4,
          width = 17,
          height = 29,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-21.png",
        line_length = 4,
        width = 8,
        height = 16,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-21.png",
          line_length = 4,
          width = 15,
          height = 32,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-22.png",
        line_length = 4,
        width = 17,
        height = 9,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-22.png",
          line_length = 4,
          width = 34,
          height = 19,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-23.png",
        line_length = 4,
        width = 17,
        height = 22,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-23.png",
          line_length = 4,
          width = 34,
          height = 43,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-24.png",
        line_length = 4,
        width = 19,
        height = 16,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-24.png",
          line_length = 4,
          width = 38,
          height = 33,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-25.png",
        line_length = 4,
        width = 23,
        height = 25,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-25.png",
          line_length = 4,
          width = 45,
          height = 50,
          frame_count = 16,
          scale = 0.5
        }
      }
    },
    shadows =
    {
      --woodenS
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-01.png",
        line_length = 4,
        width = 9,
        height = 7,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-01.png",
          line_length = 4,
          width = 17,
          height = 16,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-02.png",
        line_length = 4,
        width = 2,
        height = 5,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-02.png",
          line_length = 4,
          width = 4,
          height = 9,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-03.png",
        line_length = 4,
        width = 6,
        height = 7,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-03.png",
          line_length = 4,
          width = 10,
          height = 14,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-04.png",
        line_length = 4,
        width = 5,
        height = 5,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-04.png",
          line_length = 4,
          width = 8,
          height = 11,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-05.png",
        line_length = 4,
        width = 6,
        height = 7,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-05.png",
          line_length = 4,
          width = 14,
          height = 13,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-06.png",
        line_length = 4,
        width = 7,
        height = 6,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-06.png",
          line_length = 4,
          width = 14,
          height = 12,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-07.png",
        line_length = 4,
        width = 6,
        height = 5,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-07.png",
          line_length = 4,
          width = 11,
          height = 10,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-08.png",
        line_length = 4,
        width = 8,
        height = 6,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-08.png",
          line_length = 4,
          width = 17,
          height = 14,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-09.png",
        line_length = 4,
        width = 7,
        height = 8,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-09.png",
          line_length = 4,
          width = 14,
          height = 16,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-10.png",
        line_length = 4,
        width = 5,
        height = 9,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-10.png",
          line_length = 4,
          width = 11,
          height = 20,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-11.png",
        line_length = 4,
        width = 10,
        height = 9,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-11.png",
          line_length = 4,
          width = 21,
          height = 18,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-12.png",
        line_length = 4,
        width = 6,
        height = 16,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-12.png",
          line_length = 4,
          width = 14,
          height = 32,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-13.png",
        line_length = 4,
        width = 7,
        height = 9,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-13.png",
          line_length = 4,
          width = 14,
          height = 18,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-14.png",
        line_length = 4,
        width = 7,
        height = 12,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-14.png",
          line_length = 4,
          width = 12,
          height = 24,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-15.png",
        line_length = 4,
        width = 7,
        height = 10,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-15.png",
          line_length = 4,
          width = 14,
          height = 19,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-16.png",
        line_length = 4,
        width = 12,
        height = 6,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-16.png",
          line_length = 4,
          width = 24,
          height = 12,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-17.png",
        line_length = 4,
        width = 12,
        height = 7,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-17.png",
          line_length = 4,
          width = 25,
          height = 15,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-18.png",
        line_length = 4,
        width = 11,
        height = 11,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-18.png",
          line_length = 4,
          width = 22,
          height = 23,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-19.png",
        line_length = 4,
        width = 16,
        height = 15,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-19.png",
          line_length = 4,
          width = 32,
          height = 29,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-20.png",
        line_length = 4,
        width = 9,
        height = 14,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-20.png",
          line_length = 4,
          width = 17,
          height = 29,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-21.png",
        line_length = 4,
        width = 8,
        height = 16,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-21.png",
          line_length = 4,
          width = 15,
          height = 32,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-22.png",
        line_length = 4,
        width = 17,
        height = 9,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-22.png",
          line_length = 4,
          width = 34,
          height = 19,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-23.png",
        line_length = 4,
        width = 17,
        height = 22,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-23.png",
          line_length = 4,
          width = 34,
          height = 43,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-24.png",
        line_length = 4,
        width = 19,
        height = 16,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-24.png",
          line_length = 4,
          width = 38,
          height = 33,
          frame_count = 16,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-25.png",
        line_length = 4,
        width = 23,
        height = 25,
        frame_count = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/wooden-particle/hr-wooden-particle-shadow-25.png",
          line_length = 4,
          width = 45,
          height = 50,
          frame_count = 16,
          scale = 0.5
        }
      }
    }
  },
  {
    type = "particle",
    name = "shell-particle",
    flags = {"not-on-map"},
    life_time = 600,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/shell-particle/shell-particle-1.png",
        priority = "extra-high",
        width = 6,
        height = 6,
        frame_count = 5
      },
      {
        filename = "__base__/graphics/entity/shell-particle/shell-particle-2.png",
        priority = "extra-high",
        width = 5,
        height = 7,
        frame_count = 5
      }
    },
    shadows =
    {
      {
        filename = "__base__/graphics/entity/shell-particle/shell-particle-shadow-1.png",
        priority = "extra-high",
        width = 9,
        height = 7,
        frame_count = 5
      },
      {
        filename = "__base__/graphics/entity/shell-particle/shell-particle-shadow-2.png",
        priority = "extra-high",
        width = 7,
        height = 8,
        frame_count = 5
      }
    }
  },
  {
    type = "particle",
    name = "explosion-remnants-particle",
    flags = {"not-on-map"},
    life_time = 60 * 15,
    pictures =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/explosion-particle/explosion-particle.png",
        priority = "extra-high",
        width = 38,
        height = 38,
        frame_count = 10,
        animation_speed = 0.5,
        variation_count = 40
      }
    },
    shadows =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/explosion-particle/explosion-particle-shadow.png",
        priority = "extra-high",
        width = 48,
        height = 38,
        frame_count = 10,
        animation_speed = 0.5,
        variation_count = 40,
        shift = {0.0625, 0}
      }
    },
    regular_trigger_effect =
    {
      type = "create-trivial-smoke",
      smoke_name = "smoke-explosion-particle",
      starting_frame_deviation = 5,
      starting_frame_speed_deviation = 5,
      offset_deviation = {{-0.06, -0.06}, {0.06, 0.06}},
      speed_from_center = 0.007
    },
    regular_trigger_effect_frequency = 1,
    ended_in_water_trigger_effect =
    {
      type = "create-entity",
      entity_name = "water-splash"
    }
  },
  {
    type = "particle",
    name = "blood-particle",
    flags = {"not-on-map"},
    movement_modifier_when_on_ground = 0,
    life_time = 180,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-01.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = bloodtint(),
        shift = util.by_pixel(0,1),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-01.png",
          width = 6,
          height = 6,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = bloodtint(),
          shift = util.by_pixel(0,0.5)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-02.png",
        priority = "extra-high",
        width = 6,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = bloodtint(),
        shift = util.by_pixel(1,1),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-02.png",
          line_length = 6,
          width = 8,
          height = 6,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = bloodtint(),
          shift = util.by_pixel(0.5,0.5)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-03.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = bloodtint(),
        shift = util.by_pixel(1,1),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-03.png",
          line_length = 6,
          width = 6,
          height = 6,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = bloodtint(),
          shift = util.by_pixel(0.5,0.5)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-04.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = bloodtint(),
        shift = util.by_pixel(1,0),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-04.png",
          line_length = 6,
          width = 6,
          height = 6,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = bloodtint(),
          shift = util.by_pixel(0.5,-0.5)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-05.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = bloodtint(),
        shift = util.by_pixel(1,1),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-05.png",
          line_length = 6,
          width = 6,
          height = 4,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = bloodtint(),
          shift = util.by_pixel(0.5,0.5)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-06.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = bloodtint(),
        shift = util.by_pixel(1,1),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-06.png",
          line_length = 6,
          width = 6,
          height = 6,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = bloodtint(),
          shift = util.by_pixel(0.5,0.5)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-07.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = bloodtint(),
        shift = util.by_pixel(1,1),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-07.png",
          line_length = 6,
          width = 6,
          height = 6,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = bloodtint(),
          shift = util.by_pixel(0.5,0.5)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-08.png",
        priority = "extra-high",
        width = 6,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = bloodtint(),
        shift = util.by_pixel(2,0),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-08.png",
          line_length = 6,
          width = 10,
          height = 8,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = bloodtint(),
          shift = util.by_pixel(1.5,0)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-09.png",
        priority = "extra-high",
        width = 6,
        height = 6,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = bloodtint(),
        shift = util.by_pixel(2,0),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-09.png",
          width = 10,
          height = 8,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = bloodtint(),
          shift = util.by_pixel(1.5,-0.5)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-10.png",
        priority = "extra-high",
        width = 6,
        height = 6,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = bloodtint(),
        shift = util.by_pixel(1,0),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-10.png",
          width = 10,
          height = 10,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = bloodtint(),
          shift = util.by_pixel(0.5,0)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-11.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = bloodtint(),
        shift = util.by_pixel(1,0),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-11.png",
          width = 8,
          height = 8,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = bloodtint(),
          shift = util.by_pixel(1,0)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-12.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = bloodtint(),
        shift = util.by_pixel(0,0),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-12.png",
          line_length = 6,
          width = 8,
          height = 8,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = bloodtint(),
          shift = util.by_pixel(0,0)
        }
      }
    },
    shadows =
    {
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-01.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = shadowtint(),
        shift = util.by_pixel(0,1),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-01.png",
          width = 6,
          height = 6,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = shadowtint(),
          shift = util.by_pixel(0,0.5)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-02.png",
        priority = "extra-high",
        width = 6,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = shadowtint(),
        shift = util.by_pixel(1,1),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-02.png",
          line_length = 6,
          width = 8,
          height = 6,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = shadowtint(),
          shift = util.by_pixel(0.5,0.5)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-03.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = shadowtint(),
        shift = util.by_pixel(1,1),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-03.png",
          line_length = 6,
          width = 6,
          height = 6,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = shadowtint(),
          shift = util.by_pixel(0.5,0.5)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-04.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = shadowtint(),
        shift = util.by_pixel(1,0),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-04.png",
          line_length = 6,
          width = 6,
          height = 6,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = shadowtint(),
          shift = util.by_pixel(0.5,-0.5)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-05.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = shadowtint(),
        shift = util.by_pixel(1,1),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-05.png",
          line_length = 6,
          width = 6,
          height = 4,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = shadowtint(),
          shift = util.by_pixel(0.5,0.5)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-06.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = shadowtint(),
        shift = util.by_pixel(1,1),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-06.png",
          width = 6,
          height = 6,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = shadowtint(),
          shift = util.by_pixel(0.5,0.5)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-07.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = shadowtint(),
        shift = util.by_pixel(1,1),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-07.png",
          width = 6,
          height = 6,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = shadowtint(),
          shift = util.by_pixel(0.5,0.5)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-08.png",
        priority = "extra-high",
        width = 6,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = shadowtint(),
        shift = util.by_pixel(2,0),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-08.png",
          line_length = 6,
          width = 10,
          height = 8,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = shadowtint(),
          shift = util.by_pixel(1.5,0)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-09.png",
        priority = "extra-high",
        width = 6,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = shadowtint(),
        shift = util.by_pixel(2,0),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-09.png",
          width = 10,
          height = 8,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = shadowtint(),
          shift = util.by_pixel(1.5,-0.5)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-10.png",
        priority = "extra-high",
        width = 6,
        height = 6,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = shadowtint(),
        shift = util.by_pixel(1,0),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-10.png",
          width = 10,
          height = 10,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = shadowtint(),
          shift = util.by_pixel(0.5,0)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-11.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = shadowtint(),
        shift = util.by_pixel(1,0),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-11.png",
          width = 8,
          height = 8,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = shadowtint(),
          shift = util.by_pixel(1,0)
        }
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-12.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = bloodparticlescale(),
        tint = shadowtint(),
        shift = util.by_pixel(0,0),
        hr_version =
        {
          filename = "__base__/graphics/entity/blood-particle/hr-blood-particle-12.png",
          line_length = 6,
          width = 8,
          height = 8,
          line_length = 6,
          frame_count = 12,
          scale = bloodparticlescale(),
          tint = shadowtint(),
          shift = util.by_pixel(0,0)
        }
      }
    }
  },
  {
    type = "particle-source",
    name = "blood-fountain",
    particle = "blood-particle",
    time_to_live = 10,
    time_to_live_deviation = 5,
    time_before_start = 0,
    time_before_start_deviation = 3,
    height = 0.4,
    height_deviation = 0.1,
    vertical_speed = 0.05,
    vertical_speed_deviation = 0.03,
    horizontal_speed = 0.025,
    horizontal_speed_deviation = 0.025
  },
  {
    type = "particle-source",
    name = "blood-fountain-big",
    particle = "blood-particle",
    time_to_live = 30,
    time_to_live_deviation = 5,
    time_before_start = 0,
    time_before_start_deviation = 10,
    height = 0.4,
    height_deviation = 0.1,
    vertical_speed = 0.15,
    vertical_speed_deviation = 0.05,
    horizontal_speed = 0.04,
    horizontal_speed_deviation = 0.04
  },

  {
    type = "leaf-particle",
    name = "leaf-particle",
    flags = {"not-on-map"},
    life_time = 180,
    movement_modifier = 0.9,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/leaf-particle/leaf-particle-01.png",
        width = 6,
        height = 6,
        frame_count = 8
      },
      {
        filename = "__base__/graphics/entity/leaf-particle/leaf-particle-02.png",
        width = 6,
        height = 4,
        frame_count = 8
      },
      {
        filename = "__base__/graphics/entity/leaf-particle/leaf-particle-03.png",
        width = 8,
        height = 5,
        frame_count = 8
      },
      {
        filename = "__base__/graphics/entity/leaf-particle/leaf-particle-04.png",
        width = 6,
        height = 6,
        frame_count = 8
      },
      {
        filename = "__base__/graphics/entity/leaf-particle/leaf-particle-05.png",
        width = 6,
        height = 5,
        frame_count = 8
      },
      {
        filename = "__base__/graphics/entity/leaf-particle/leaf-particle-06.png",
        width = 6,
        height = 4,
        frame_count = 8
      },
      {
        filename = "__base__/graphics/entity/leaf-particle/leaf-particle-07.png",
        width = 6,
        height = 6,
        frame_count = 8
      },
      {
        filename = "__base__/graphics/entity/leaf-particle/leaf-particle-08.png",
        width = 4,
        height = 7,
        frame_count = 8
      }
    },
    shadows =
    {
      {
        filename = "__base__/graphics/entity/leaf-particle/leaf-particle-01-shadow.png",
        width = 6,
        height = 6,
        frame_count = 8
      },
      {
        filename = "__base__/graphics/entity/leaf-particle/leaf-particle-02-shadow.png",
        width = 6,
        height = 4,
        frame_count = 8
      },
      {
        filename = "__base__/graphics/entity/leaf-particle/leaf-particle-03-shadow.png",
        width = 8,
        height = 5,
        frame_count = 8
      },
      {
        filename = "__base__/graphics/entity/leaf-particle/leaf-particle-04-shadow.png",
        width = 6,
        height = 6,
        frame_count = 8
      },
      {
        filename = "__base__/graphics/entity/leaf-particle/leaf-particle-05-shadow.png",
        width = 6,
        height = 5,
        frame_count = 8
      },
      {
        filename = "__base__/graphics/entity/leaf-particle/leaf-particle-06-shadow.png",
        width = 6,
        height = 4,
        frame_count = 8
      },
      {
        filename = "__base__/graphics/entity/leaf-particle/leaf-particle-07-shadow.png",
        width = 6,
        height = 6,
        frame_count = 8
      },
      {
        filename = "__base__/graphics/entity/leaf-particle/leaf-particle-08-shadow.png",
        width = 4,
        height = 7,
        frame_count = 8
      }
    }
  },
  {
    type = "particle",
    name = "branch-particle",
    flags = {"not-on-map"},
    life_time = 1200,
    pictures =
    {
      --branchC
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-01.png",
        line_length = 4,
        width = 34,
        height = 32,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-01.png",
          line_length = 4,
          width = 66,
          height = 64,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-02.png",
        line_length = 4,
        width = 44,
        height = 54,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-02.png",
          line_length = 4,
          width = 87,
          height = 107,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-03.png",
        line_length = 4,
        width = 60,
        height = 60,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-03.png",
          line_length = 4,
          width = 121,
          height = 119,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-04.png",
        line_length = 4,
        width = 13,
        height = 28,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-04.png",
          line_length = 4,
          width = 26,
          height = 57,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-05.png",
        line_length = 4,
        width = 27,
        height = 21,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-05.png",
          line_length = 4,
          width = 53,
          height = 40,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-06.png",
        line_length = 4,
        width = 32,
        height = 24,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-06.png",
          line_length = 4,
          width = 64,
          height = 46,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-07.png",
        line_length = 4,
        width = 33,
        height = 35,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-07.png",
          line_length = 4,
          width = 65,
          height = 69,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-08.png",
        line_length = 4,
        width = 14,
        height = 29,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-08.png",
          line_length = 4,
          width = 27,
          height = 60,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-09.png",
        line_length = 4,
        width = 26,
        height = 32,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-09.png",
          line_length = 4,
          width = 52,
          height = 64,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-10.png",
        line_length = 4,
        width = 27,
        height = 28,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-10.png",
          line_length = 4,
          width = 53,
          height = 55,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-11.png",
        line_length = 4,
        width = 25,
        height = 33,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-11.png",
          line_length = 4,
          width = 49,
          height = 64,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-12.png",
        line_length = 4,
        width = 32,
        height = 28,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-12.png",
          line_length = 4,
          width = 64,
          height = 56,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-13.png",
        line_length = 4,
        width = 25,
        height = 18,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-13.png",
          line_length = 4,
          width = 50,
          height = 35,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-14.png",
        line_length = 4,
        width = 27,
        height = 19,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-14.png",
          line_length = 4,
          width = 54,
          height = 37,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-15.png",
        line_length = 4,
        width = 12,
        height = 14,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-15.png",
          line_length = 4,
          width = 23,
          height = 30,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-16.png",
        line_length = 4,
        width = 12,
        height = 13,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-16.png",
          line_length = 4,
          width = 25,
          height = 27,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-17.png",
        line_length = 4,
        width = 31,
        height = 29,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-17.png",
          line_length = 4,
          width = 62,
          height = 59,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-18.png",
        line_length = 4,
        width = 29,
        height = 34,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-18.png",
          line_length = 4,
          width = 57,
          height = 67,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-19.png",
        line_length = 4,
        width = 38,
        height = 40,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-19.png",
          line_length = 4,
          width = 76,
          height = 79,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-20.png",
        line_length = 4,
        width = 28,
        height = 24,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-20.png",
          line_length = 4,
          width = 56,
          height = 48,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-21.png",
        line_length = 4,
        width = 23,
        height = 24,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-21.png",
          line_length = 4,
          width = 46,
          height = 47,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-22.png",
        line_length = 4,
        width = 14,
        height = 19,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-22.png",
          line_length = 4,
          width = 26,
          height = 37,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-23.png",
        line_length = 4,
        width = 35,
        height = 14,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-23.png",
          line_length = 4,
          width = 70,
          height = 26,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-24.png",
        line_length = 4,
        width = 14,
        height = 18,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-24.png",
          line_length = 4,
          width = 28,
          height = 37,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-25.png",
        line_length = 4,
        width = 22,
        height = 21,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-25.png",
          line_length = 4,
          width = 44,
          height = 41,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-26.png",
        line_length = 4,
        width = 13,
        height = 22,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-26.png",
          line_length = 4,
          width = 25,
          height = 42,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-27.png",
        line_length = 4,
        width = 36,
        height = 17,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-27.png",
          line_length = 4,
          width = 70,
          height = 33,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-28.png",
        line_length = 4,
        width = 17,
        height = 14,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-28.png",
          line_length = 4,
          width = 34,
          height = 29,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-29.png",
        line_length = 4,
        width = 26,
        height = 25,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-29.png",
          line_length = 4,
          width = 51,
          height = 50,
          frame_count = 8,
          scale = 0.5
        }
      }
    },
    shadows =
    {
      --branchS
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-01.png",
        line_length = 4,
        width = 34,
        height = 32,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-01.png",
          line_length = 4,
          width = 66,
          height = 64,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-02.png",
        line_length = 4,
        width = 44,
        height = 54,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-02.png",
          line_length = 4,
          width = 87,
          height = 107,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-03.png",
        line_length = 4,
        width = 60,
        height = 60,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-03.png",
          line_length = 4,
          width = 121,
          height = 119,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-04.png",
        line_length = 4,
        width = 13,
        height = 28,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-04.png",
          line_length = 4,
          width = 26,
          height = 57,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-05.png",
        line_length = 4,
        width = 27,
        height = 21,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-05.png",
          line_length = 4,
          width = 53,
          height = 40,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-06.png",
        line_length = 4,
        width = 32,
        height = 24,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-06.png",
          line_length = 4,
          width = 64,
          height = 46,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-07.png",
        line_length = 4,
        width = 33,
        height = 35,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-07.png",
          line_length = 4,
          width = 65,
          height = 69,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-08.png",
        line_length = 4,
        width = 14,
        height = 29,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-08.png",
          line_length = 4,
          width = 27,
          height = 60,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-09.png",
        line_length = 4,
        width = 26,
        height = 32,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-09.png",
          line_length = 4,
          width = 52,
          height = 64,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-10.png",
        line_length = 4,
        width = 27,
        height = 28,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-10.png",
          line_length = 4,
          width = 53,
          height = 55,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-11.png",
        line_length = 4,
        width = 25,
        height = 33,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-11.png",
          line_length = 4,
          width = 49,
          height = 64,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-12.png",
        line_length = 4,
        width = 32,
        height = 28,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-12.png",
          line_length = 4,
          width = 64,
          height = 56,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-13.png",
        line_length = 4,
        width = 25,
        height = 18,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-13.png",
          line_length = 4,
          width = 50,
          height = 35,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-14.png",
        line_length = 4,
        width = 27,
        height = 19,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-14.png",
          line_length = 4,
          width = 54,
          height = 37,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-15.png",
        line_length = 4,
        width = 12,
        height = 14,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-15.png",
          line_length = 4,
          width = 23,
          height = 30,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-16.png",
        line_length = 4,
        width = 12,
        height = 13,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-16.png",
          line_length = 4,
          width = 25,
          height = 27,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-17.png",
        line_length = 4,
        width = 31,
        height = 29,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-17.png",
          line_length = 4,
          width = 62,
          height = 59,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-18.png",
        line_length = 4,
        width = 29,
        height = 34,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-18.png",
          line_length = 4,
          width = 57,
          height = 67,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-19.png",
        line_length = 4,
        width = 38,
        height = 40,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-19.png",
          line_length = 4,
          width = 76,
          height = 79,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-20.png",
        line_length = 4,
        width = 28,
        height = 24,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-20.png",
          line_length = 4,
          width = 56,
          height = 48,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-21.png",
        line_length = 4,
        width = 23,
        height = 24,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-21.png",
          line_length = 4,
          width = 46,
          height = 47,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-22.png",
        line_length = 4,
        width = 14,
        height = 19,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-22.png",
          line_length = 4,
          width = 26,
          height = 37,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-23.png",
        line_length = 4,
        width = 35,
        height = 14,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-23.png",
          line_length = 4,
          width = 70,
          height = 26,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-24.png",
        line_length = 4,
        width = 14,
        height = 18,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-24.png",
          line_length = 4,
          width = 28,
          height = 37,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-25.png",
        line_length = 4,
        width = 22,
        height = 21,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-25.png",
          line_length = 4,
          width = 44,
          height = 41,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-26.png",
        line_length = 4,
        width = 13,
        height = 22,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-26.png",
          line_length = 4,
          width = 25,
          height = 42,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-27.png",
        line_length = 4,
        width = 36,
        height = 17,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-27.png",
          line_length = 4,
          width = 70,
          height = 33,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-28.png",
        line_length = 4,
        width = 17,
        height = 14,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-28.png",
          line_length = 4,
          width = 34,
          height = 29,
          frame_count = 8,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/branch-particle/branch-particle-shadow-29.png",
        line_length = 4,
        width = 26,
        height = 25,
        frame_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/branch-particle/hr-branch-particle-shadow-29.png",
          line_length = 4,
          width = 51,
          height = 50,
          frame_count = 8,
          scale = 0.5
        }
      }
    }
  },
  {
    type = "particle",
    name = "shallow-water-droplet-particle",
    flags = {"not-on-map"},
    life_time = 60,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-01.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = waterparticlescale(),
        tint = watertint(),
        shift = util.by_pixel(0,1)
      }
    },
    shadows =
    {
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-01.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        line_length = 6,
        frame_count = 12,
        scale = waterparticlescale(),
        tint = shadowtint(),
        shift = util.by_pixel(0,1)
      }
    },
--  ended_in_water_trigger_effect =
--  {
--    type = "create-entity",
--    entity_name = "water-splash"
--  }
  }
}
)

require ("circuit-connector-sprites")
require ("circuit-connector-generated-definitions")
return
{
  water_reflection =
  {
    pictures =
    {
      filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-reflection.png",
      priority = "extra-high",
      width = 24,
      height = 24,
      shift = util.by_pixel(5, 40),
      variation_count = 1,
      scale = 5
    },
    rotate = false,
    orientation_to_variation = false
  },
  assembler1_graphics_set =
  {
    animation =
    {
      layers =
      {
        util.sprite_load("__base__/graphics/entity/assembling-machine-1/assembling-machine-1-base",
        {
          priority = "high",
          frame_count = 1,
          repeat_count = 64,
          scale = 0.5,
        }),
        util.sprite_load("__base__/graphics/entity/assembling-machine-1/assembling-machine-1-anim",
        {
          priority = "high",
          frame_count = 64,
          scale = 0.5,
        }),
        util.sprite_load("__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow",
        {
          priority = "high",
          frame_count = 1,
          repeat_count = 64,
          scale = 0.5,
          draw_as_shadow = true,
        }),
      }
    },
    working_visualisations =
    {
      {
        animation = util.sprite_load("__base__/graphics/entity/assembling-machine-1/assembling-machine-1-status-light",
        {
          priority = "high",
          repeat_count = 64,
          draw_as_glow = true,
          blend_mode = "additive",
          scale = 0.5,
        }),
      }
    }
  },
  assembler2_graphics_set =
  {
    animation =
    {
      layers =
      {
        util.sprite_load("__base__/graphics/entity/assembling-machine-2/assembling-machine-2-base",
        {
          priority = "high",
          repeat_count = 64,
          scale = 0.5,
        }),
        util.sprite_load("__base__/graphics/entity/assembling-machine-2/assembling-machine-2-anim",
        {
          priority = "high",
          frame_count = 64,
          scale = 0.5,
        }),
        util.sprite_load("__base__/graphics/entity/assembling-machine-2/assembling-machine-2-shadow",
        {
          priority = "high",
          repeat_count = 64,
          scale = 0.5,
          draw_as_shadow = true,
        }),
      }
    },
    working_visualisations =
    {
      {
        animation = util.sprite_load("__base__/graphics/entity/assembling-machine-2/assembling-machine-2-status-light",
        {
          priority = "high",
          repeat_count = 64,
          draw_as_glow = true,
          blend_mode = "additive",
          scale = 0.5,
        }),
      }
    }
  },
  assembler2pipepictures =
  {
    north = util.sprite_load("__base__/graphics/entity/assembling-machine-2/assembling-machine-2-pipe-N",
    {
      priority = "extra-high",
      scale = 0.5,
    }),
    east = util.sprite_load("__base__/graphics/entity/assembling-machine-2/assembling-machine-2-pipe-E",
    {
      priority = "extra-high",
      scale = 0.5,
    }),
    south = util.sprite_load("__base__/graphics/entity/assembling-machine-2/assembling-machine-2-pipe-S",
    {
      priority = "extra-high",
      scale = 0.5,
    }),
    west = util.sprite_load("__base__/graphics/entity/assembling-machine-2/assembling-machine-2-pipe-W",
    {
      priority = "extra-high",
      scale = 0.5,
    }),
  },
  assembler3_graphics_set =
  {
    animation_progress = 0.5,
    animation =
    {
      layers =
      {
        util.sprite_load("__base__/graphics/entity/assembling-machine-3/assembling-machine-3-base",
        {
          priority = "high",
          repeat_count = 64,
          scale = 0.5,
        }),
        util.sprite_load("__base__/graphics/entity/assembling-machine-3/assembling-machine-3-anim",
        {
          priority = "high",
          frame_count = 64,
          scale = 0.5,
        }),
        util.sprite_load("__base__/graphics/entity/assembling-machine-3/assembling-machine-3-shadow",
        {
          priority = "high",
          frame_count = 64,
          scale = 0.5,
          draw_as_shadow = true,
        }),
      }
    },
    working_visualisations =
    {
      {
        animation = util.sprite_load("__base__/graphics/entity/assembling-machine-3/assembling-machine-3-status-light",
        {
          priority = "high",
          repeat_count = 64,
          draw_as_glow = true,
          blend_mode = "additive",
          scale = 0.5,
        }),
      }
    }
  },
  assembler3pipepictures =
  {
    north = util.sprite_load("__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-N",
    {
      priority = "extra-high",
      scale = 0.5,
    }),
    east = util.sprite_load("__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-E",
    {
      priority = "extra-high",
      scale = 0.5,
    }),
    south = util.sprite_load("__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-S",
    {
      priority = "extra-high",
      scale = 0.5,
    }),
    west = util.sprite_load("__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-W",
    {
      priority = "extra-high",
      scale = 0.5,
    }),
  },
  circuit_connector = circuit_connector_definitions.create_vector
  (
    {
      connector_main = util.sprite_load("__base__/graphics/entity/assembling-machine-1/assembling-machine-1-connection",
      {
        priority = "low",
        frame_count = 1,
        scale = 0.5,
      }),
      connector_shadow = util.sprite_load("__base__/graphics/entity/assembling-machine-1/assembling-machine-1-connection-shadow",
      {
        priority = "low",
        frame_count = 1,
        scale = 0.5,
        draw_as_shadow = true
      }),
      led_blue = util.sprite_load("__base__/graphics/entity/assembling-machine-1/assembling-machine-1-connection-lights-blue",
      {
        priority = "low",
        frame_count = 1,
        scale = 0.5,
        draw_as_glow = true
      }),
      led_green = util.sprite_load("__base__/graphics/entity/assembling-machine-1/assembling-machine-1-connection-lights-green",
      {
        priority = "low",
        frame_count = 1,
        scale = 0.5,
        draw_as_glow = true
      }),
      led_red = util.sprite_load("__base__/graphics/entity/assembling-machine-1/assembling-machine-1-connection-lights-red",
      {
        priority = "low",
        frame_count = 1,
        scale = 0.5,
        draw_as_glow = true
      }),
      wire_offsets =
      {
        {red = util.by_pixel(25, 10), green = util.by_pixel(29, 8)},
      },
      wire_shadow_offsets =
      {
        {red = util.by_pixel(60, 30), green = util.by_pixel(60, 29)},
      },
      light_offsets =
      {
        {rg = util.by_pixel(0, 0), b = util.by_pixel(0, 0)},
      }
    },
    {
      {variation = 0, main_offset = util.by_pixel(0, 0), shadow_offset = util.by_pixel(0, 0), show_shadow = true},
      {variation = 0, main_offset = util.by_pixel(0, 0), shadow_offset = util.by_pixel(0, 0), show_shadow = true},
      {variation = 0, main_offset = util.by_pixel(0, 0), shadow_offset = util.by_pixel(0, 0), show_shadow = true},
      {variation = 0, main_offset = util.by_pixel(0, 0), shadow_offset = util.by_pixel(0, 0), show_shadow = true},
    }
  )

}
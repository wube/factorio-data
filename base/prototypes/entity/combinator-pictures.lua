function generate_arithmetic_combinator(combinator)
  combinator.sprites =
    make_4way_animation_from_spritesheet({ layers =
      {
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/arithmetic-combinator.png",
          width = 144,
          height = 124,
          shift = util.by_pixel(0.5, 7.5)
        },
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/arithmetic-combinator-shadow.png",
          width = 148,
          height = 156,
          shift = util.by_pixel(13.5, 24.5),
          draw_as_shadow = true
        }
      }
    })
  combinator.activity_led_sprites =
  {
    north = util.draw_as_glow
    {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/activity-leds/arithmetic-combinator-LED-N.png",
      width = 16,
      height = 14,
      shift = util.by_pixel(8.5, -12.5)
    },
    east = util.draw_as_glow
    {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/activity-leds/arithmetic-combinator-LED-E.png",
      width = 14,
      height = 14,
      shift = util.by_pixel(16.5, -1)
    },
    south = util.draw_as_glow
    {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/activity-leds/arithmetic-combinator-LED-S.png",
      width = 16,
      height = 16,
      shift = util.by_pixel(-8, 7.5)
    },
    west = util.draw_as_glow
    {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/activity-leds/arithmetic-combinator-LED-W.png",
      width = 14,
      height = 14,
      shift = util.by_pixel(-16, -12.5)
    }
  }
  combinator.plus_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  combinator.minus_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  combinator.multiply_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 90,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 90,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 90,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 90,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  combinator.divide_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 120,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 120,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 120,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 120,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  combinator.modulo_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 150,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 150,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 150,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 150,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  combinator.power_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 180,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 180,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 180,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 180,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  combinator.left_shift_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 210,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 210,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 210,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 210,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  combinator.right_shift_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 240,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 240,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 240,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 240,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  combinator.and_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 270,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 270,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 270,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 270,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  combinator.or_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 300,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 300,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 300,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 300,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  combinator.xor_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  combinator.input_connection_points =
  {
    {
      shadow =
      {
        red = util.by_pixel(5, 26),
        green = util.by_pixel(24.5, 26)
      },
      wire =
      {
        red = util.by_pixel(-8.5, 14),
        green = util.by_pixel(10, 14)
      }
    },
    {
      shadow =
      {
        red = util.by_pixel(-10, -3.5),
        green = util.by_pixel(-10, 9.5)
      },
      wire =
      {
        red = util.by_pixel(-25.5, -15),
        green = util.by_pixel(-25.5, -1.5)
      }
    },
    {
      shadow =
      {
        red = util.by_pixel(24.5, -11.5),
        green = util.by_pixel(5.5, -9.5)
      },
      wire =
      {
        red = util.by_pixel(9.5, -21.5),
        green = util.by_pixel(-9, -21.5)
      }
    },
    {
      shadow =
      {
        red = util.by_pixel(44, 12),
        green = util.by_pixel(44, -1.5)
      },
      wire =
      {
        red = util.by_pixel(26, -1),
        green = util.by_pixel(26, -14.5)
      }
    }
  }
  combinator.output_connection_points =
  {
    {
      shadow =
      {
        red = util.by_pixel(4, -12.5),
        green = util.by_pixel(23.5, -12)
      },
      wire =
      {
        red = util.by_pixel(-9, -22),
        green = util.by_pixel(10, -22)
      }
    },
    {
      shadow =
      {
        red = util.by_pixel(38.5, -1.5),
        green = util.by_pixel(38, 12)
      },
      wire =
      {
        red = util.by_pixel(23, -13),
        green = util.by_pixel(23, 1)
      }
    },
    {
      shadow =
      {
        red = util.by_pixel(24, 26.5),
        green = util.by_pixel(4, 27)
      },
      wire =
      {
        red = util.by_pixel(10, 15.5),
        green = util.by_pixel(-9, 15.5)
      }
    },
    {
      shadow =
      {
        red = util.by_pixel(-7, 12.5),
        green = util.by_pixel(-7.5, -1.5)
      },
      wire =
      {
        red = util.by_pixel(-22.5, 1),
        green = util.by_pixel(-22.5, -12)
      }
    }
  }
  return combinator
end

function generate_decider_combinator(combinator)
  combinator.sprites =
    make_4way_animation_from_spritesheet({ layers =
      {
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/decider-combinator.png",
          width = 156,
          height = 132,
          shift = util.by_pixel(0.5, 7.5)
        },
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/decider-combinator-shadow.png",
          width = 156,
          height = 158,
          shift = util.by_pixel(12, 24),
          draw_as_shadow = true
        }
      }
    })
  combinator.activity_led_sprites =
  {
    north = util.draw_as_glow
    {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/activity-leds/decider-combinator-LED-N.png",
      width = 16,
      height = 14,
      shift = util.by_pixel(8.5, -13)
    },
    east = util.draw_as_glow
    {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/activity-leds/decider-combinator-LED-E.png",
      width = 16,
      height = 16,
      shift = util.by_pixel(16, -4)
    },
    south = util.draw_as_glow
    {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/activity-leds/decider-combinator-LED-S.png",
      width = 16,
      height = 14,
      shift = util.by_pixel(-8, 4.5)
    },
    west = util.draw_as_glow
    {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/activity-leds/decider-combinator-LED-W.png",
      width = 16,
      height = 16,
      shift = util.by_pixel(-15, -18.5)
    }
  }
  combinator.greater_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -13.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -13.5)
      }
  }
  combinator.less_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -13.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -13.5)
      }
  }
  combinator.equal_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 90,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 90,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -13.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 90,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 90,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -13.5)
      }
  }
  combinator.not_equal_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 120,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 120,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -13.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 120,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 120,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -13.5)
      }
  }
  combinator.less_or_equal_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 150,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 150,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -13.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 150,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 150,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -13.5)
      }
  }
  combinator.greater_or_equal_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 180,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 180,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -13.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 180,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 180,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -13.5)
      }
  }
  combinator.input_connection_points =
  {
    {
      shadow =
      {
        red = util.by_pixel(8, 28),
        green = util.by_pixel(26.5, 27.5)
      },
      wire =
      {
        red = util.by_pixel(-8.5, 15.5),
        green = util.by_pixel(9, 15)
      }
    },
    {
      shadow =
      {
        red = util.by_pixel(-9.5, -8.5),
        green = util.by_pixel(-10, 8)
      },
      wire =
      {
        red = util.by_pixel(-24.5, -18.5),
        green = util.by_pixel(-24, -4)
      }
    },
    {
      shadow =
      {
        red = util.by_pixel(27, -7.5),
        green = util.by_pixel(9.5, -7.5)
      },
      wire =
      {
        red = util.by_pixel(9.5, -19.5),
        green = util.by_pixel(-8, -19.5)
      }
    },
    {
      shadow =
      {
        red = util.by_pixel(42.5, 9),
        green = util.by_pixel(42.5, -6.5)
      },
      wire =
      {
        red = util.by_pixel(25.5, -4),
        green = util.by_pixel(25, -19)
      }
    }
  }
  combinator.output_connection_points =
  {
    {
      shadow =
      {
        red = util.by_pixel(7, -9.5),
        green = util.by_pixel(26.5, -9.5)
      },
      wire =
      {
        red = util.by_pixel(-9, -21.5),
        green = util.by_pixel(10, -21)
      }
    },
    {
      shadow =
      {
        red = util.by_pixel(39, -5),
        green = util.by_pixel(39, 8.5)
      },
      wire =
      {
        red = util.by_pixel(22, -17),
        green = util.by_pixel(22, -3.5)
      }
    },
    {
      shadow =
      {
        red = util.by_pixel(27, 30.5),
        green = util.by_pixel(7.5, 30.5)
      },
      wire =
      {
        red = util.by_pixel(9.5, 17),
        green = util.by_pixel(-9, 17.5)
      }
    },
    {
      shadow =
      {
        red = util.by_pixel(-5.5, 8),
        green = util.by_pixel(-5.5, -6)
      },
      wire =
      {
        red = util.by_pixel(-21.5, -4),
        green = util.by_pixel(-21.5, -17)
      }
    }
  }
  return combinator
end

function generate_constant_combinator(combinator)
  combinator.sprites =
    make_4way_animation_from_spritesheet({ layers =
      {
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/constant-combinator.png",
          width = 114,
          height = 102,
          shift = util.by_pixel(0, 5)
        },
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/constant-combinator-shadow.png",
          width = 98,
          height = 66,
          shift = util.by_pixel(8.5, 5.5),
          draw_as_shadow = true
        }
      }
    })
  combinator.activity_led_sprites =
  {
    north = util.draw_as_glow
    {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/activity-leds/constant-combinator-LED-N.png",
      width = 14,
      height = 12,
      shift = util.by_pixel(9, -11.5)
    },
    east = util.draw_as_glow
    {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/activity-leds/constant-combinator-LED-E.png",
      width = 14,
      height = 14,
      shift = util.by_pixel(7.5, -0.5)
    },
    south = util.draw_as_glow
    {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/activity-leds/constant-combinator-LED-S.png",
      width = 14,
      height = 16,
      shift = util.by_pixel(-9, 2.5)
    },
    west = util.draw_as_glow
    {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/activity-leds/constant-combinator-LED-W.png",
      width = 14,
      height = 16,
      shift = util.by_pixel(-7, -15)
    }
  }
  combinator.circuit_wire_connection_points =
  {
    {
      shadow =
      {
        red = util.by_pixel(7, -6),
        green = util.by_pixel(23, -6)
      },
      wire =
      {
        red = util.by_pixel(-8.5, -17.5),
        green = util.by_pixel(7, -17.5)
      }
    },
    {
      shadow =
      {
        red = util.by_pixel(32, -5),
        green = util.by_pixel(32, 8)
      },
      wire =
      {
        red = util.by_pixel(16, -16.5),
        green = util.by_pixel(16, -3.5)
      }
    },
    {
      shadow =
      {
        red = util.by_pixel(25, 20),
        green = util.by_pixel(9, 20)
      },
      wire =
      {
        red = util.by_pixel(9, 7.5),
        green = util.by_pixel(-6.5, 7.5)
      }
    },
    {
      shadow =
      {
        red = util.by_pixel(1, 11),
        green = util.by_pixel(1, -2)
      },
      wire =
      {
        red = util.by_pixel(-15, -0.5),
        green = util.by_pixel(-15, -13.5)
      }
    }
  }
  return combinator
end

function generate_selector_combinator(combinator)
  combinator.sprites =
    make_4way_animation_from_spritesheet({ layers =
      {
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/selector-combinator.png",
          width = 154,
          height = 160,
          shift = util.by_pixel( 1.0, -1.0)
        },
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/selector-combinator-shadow.png",
          width = 134,
          height = 94,
          shift = util.by_pixel( 8.0, 7.0),
          draw_as_shadow = true
        }
      }
    })
  combinator.frozen_patch =
  {
    sheet = {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/selector-combinator-frozen.png",
      width = 154,
      height = 160,
      shift = util.by_pixel( 1.0, -1.0)
    }
  }
  combinator.activity_led_sprites =
  {
    north = util.draw_as_glow
    {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/activity-leds/selector-combinator-LED-N.png",
      width = 16,
      height = 14,
      shift = util.by_pixel(7.5, -14.0)
    },
    east = util.draw_as_glow
    {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/activity-leds/selector-combinator-LED-E.png",
      width = 16,
      height = 16,
      shift = util.by_pixel(15.0, -3.0)
    },
    south = util.draw_as_glow
    {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/activity-leds/selector-combinator-LED-S.png",
      width = 16,
      height = 16,
      shift = util.by_pixel(-6.0, 7.5)
    },
    west = util.draw_as_glow
    {
      scale = 0.5,
      filename = "__base__/graphics/entity/combinator/activity-leds/selector-combinator-LED-W.png",
      width = 14,
      height = 14,
      shift = util.by_pixel(-14.0, -13.5)
    }
  }
  combinator.max_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 210,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 210,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 210,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 210,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  combinator.min_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 240,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 240,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 240,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 240,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  combinator.count_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 270,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 270,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 270,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 270,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  combinator.random_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 300,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 300,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 300,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 300,
        y = 22,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  -- TODO: symbol for quality transfer
  combinator.quality_symbol_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 0,
        y = 44,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 0,
        y = 44,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 0,
        y = 44,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 0,
        y = 44,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  combinator.stack_size_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 44,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 44,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 44,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 44,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }
  combinator.rocket_capacity_sprites =
  {
    north = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 44,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    east = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 44,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      },
    south = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 44,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      },
    west = util.draw_as_glow
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 44,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
  }

  combinator.input_connection_points =
  {
    -- North
    {
      shadow =
      {
        red = util.by_pixel(2, 25),
        green = util.by_pixel(21, 25)
      },
      wire =
      {
        red = util.by_pixel(-9, 16),
        green = util.by_pixel(9, 16)
      }
    },
    -- East
    {
      shadow =
      {
        red = util.by_pixel(38, -2),
        green = util.by_pixel(-12, 12)
      },
      wire =
      {
        red = util.by_pixel(-24, -11),
        green = util.by_pixel(-23, 3)
      }
    },
    -- South
    {
      shadow =
      {
        red = util.by_pixel(20, -13),
        green = util.by_pixel(1, -13)
      },
      wire =
      {
        red = util.by_pixel(9, -22),
        green = util.by_pixel(-9, -22)
      }
    },
    -- West
    {
      shadow =
      {
        red = util.by_pixel(35, 13),
        green = util.by_pixel(35, -2)
      },
      wire =
      {
        red = util.by_pixel(23, 4),
        green = util.by_pixel(23, -11)
      }
    },
  }
  combinator.output_connection_points =
  {
    -- North
    {
      shadow =
      {
        red = util.by_pixel(5, -11),
        green = util.by_pixel(20, -11)
      },
      wire =
      {
        red = util.by_pixel(-7, -22),
        green = util.by_pixel(7, -21)
      }
    },
    -- East
    {
      shadow =
      {
        red = util.by_pixel(-12, -2),
        green = util.by_pixel(37, 12)
      },
      wire =
      {
        red = util.by_pixel(24, -12),
        green = util.by_pixel(24, 1)
      }
    },
    -- South
    {
      shadow =
      {
        red = util.by_pixel(20, 28),
        green = util.by_pixel(5, 28)
      },
      wire =
      {
        red = util.by_pixel(7, 19),
        green = util.by_pixel(-7, 19)
      }
    },
    -- West
    {
      shadow =
      {
        red = util.by_pixel(-10, 12),
        green = util.by_pixel(-10, -1)
      },
      wire =
      {
        red = util.by_pixel(-24, 1),
        green = util.by_pixel(-24, -12)
      }
    },
  }

  return combinator
end

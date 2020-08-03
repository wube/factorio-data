function generate_arithmetic_combinator(combinator)
  combinator.sprites =
    make_4way_animation_from_spritesheet({ layers =
      {
        {
          filename = "__base__/graphics/entity/combinator/arithmetic-combinator.png",
          width = 74,
          height = 64,
          frame_count = 1,
          shift = util.by_pixel(1, 8),
          hr_version =
          {
            scale = 0.5,
            filename = "__base__/graphics/entity/combinator/hr-arithmetic-combinator.png",
            width = 144,
            height = 124,
            frame_count = 1,
            shift = util.by_pixel(0.5, 7.5)
          }
        },
        {
          filename = "__base__/graphics/entity/combinator/arithmetic-combinator-shadow.png",
          width = 76,
          height = 78,
          frame_count = 1,
          shift = util.by_pixel(14, 24),
          draw_as_shadow = true,
          hr_version =
          {
            scale = 0.5,
            filename = "__base__/graphics/entity/combinator/hr-arithmetic-combinator-shadow.png",
            width = 148,
            height = 156,
            frame_count = 1,
            shift = util.by_pixel(13.5, 24.5),
            draw_as_shadow = true
          }
        }
      }
    })
  combinator.activity_led_sprites =
  {
    north =
    {
      filename = "__base__/graphics/entity/combinator/activity-leds/arithmetic-combinator-LED-N.png",
      width = 8,
      height = 8,
      frame_count = 1,
      shift = util.by_pixel(8, -12),
      hr_version =
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/activity-leds/hr-arithmetic-combinator-LED-N.png",
        width = 16,
        height = 14,
        frame_count = 1,
        shift = util.by_pixel(8.5, -12.5)
      }
    },
    east =
    {
      filename = "__base__/graphics/entity/combinator/activity-leds/arithmetic-combinator-LED-E.png",
      width = 8,
      height = 8,
      frame_count = 1,
      shift = util.by_pixel(17, -1),
      hr_version =
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/activity-leds/hr-arithmetic-combinator-LED-E.png",
        width = 14,
        height = 14,
        frame_count = 1,
        shift = util.by_pixel(16.5, -1)
      }
    },
    south =
    {
      filename = "__base__/graphics/entity/combinator/activity-leds/arithmetic-combinator-LED-S.png",
      width = 8,
      height = 8,
      frame_count = 1,
      shift = util.by_pixel(-8, 7),
      hr_version =
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/activity-leds/hr-arithmetic-combinator-LED-S.png",
        width = 16,
        height = 16,
        frame_count = 1,
        shift = util.by_pixel(-8, 7.5)
      }
    },
    west =
    {
      filename = "__base__/graphics/entity/combinator/activity-leds/arithmetic-combinator-LED-W.png",
      width = 8,
      height = 8,
      frame_count = 1,
      shift = util.by_pixel(-16, -12),
      hr_version =
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/activity-leds/hr-arithmetic-combinator-LED-W.png",
        width = 14,
        height = 14,
        frame_count = 1,
        shift = util.by_pixel(-16, -12.5)
      }
    }
  }
  combinator.plus_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      }
  }
  combinator.minus_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      }
  }
  combinator.multiply_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      }
  }
  combinator.divide_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      }
  }
  combinator.modulo_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      }
  }
  combinator.power_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      }
  }
  combinator.left_shift_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      }
  }
  combinator.right_shift_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      }
  }
  combinator.and_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      }
  }
  combinator.or_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      }
  }
  combinator.xor_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        y = 11,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -10.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          y = 22,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -10.5)
        }
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
          filename = "__base__/graphics/entity/combinator/decider-combinator.png",
          width = 78,
          height = 66,
          frame_count = 1,
          shift = util.by_pixel(0, 7),
          hr_version =
          {
            scale = 0.5,
            filename = "__base__/graphics/entity/combinator/hr-decider-combinator.png",
            width = 156,
            height = 132,
            frame_count = 1,
            shift = util.by_pixel(0.5, 7.5)
          }
        },
        {
          filename = "__base__/graphics/entity/combinator/decider-combinator-shadow.png",
          width = 78,
          height = 80,
          frame_count = 1,
          shift = util.by_pixel(12, 24),
          draw_as_shadow = true,
          hr_version =
          {
            scale = 0.5,
            filename = "__base__/graphics/entity/combinator/hr-decider-combinator-shadow.png",
            width = 156,
            height = 158,
            frame_count = 1,
            shift = util.by_pixel(12, 24),
            draw_as_shadow = true
          }
        }
      }
    })
  combinator.activity_led_sprites =
  {
    north =
    {
      filename = "__base__/graphics/entity/combinator/activity-leds/decider-combinator-LED-N.png",
      width = 8,
      height = 8,
      frame_count = 1,
      shift = util.by_pixel(8, -13),
      hr_version =
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/activity-leds/hr-decider-combinator-LED-N.png",
        width = 16,
        height = 14,
        frame_count = 1,
        shift = util.by_pixel(8.5, -13)
      }
    },
    east =
    {
      filename = "__base__/graphics/entity/combinator/activity-leds/decider-combinator-LED-E.png",
      width = 8,
      height = 8,
      frame_count = 1,
      shift = util.by_pixel(16, -4),
      hr_version =
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/activity-leds/hr-decider-combinator-LED-E.png",
        width = 16,
        height = 16,
        frame_count = 1,
        shift = util.by_pixel(16, -4)
      }
    },
    south =
    {
      filename = "__base__/graphics/entity/combinator/activity-leds/decider-combinator-LED-S.png",
      width = 8,
      height = 8,
      frame_count = 1,
      shift = util.by_pixel(-8, 5),
      hr_version =
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/activity-leds/hr-decider-combinator-LED-S.png",
        width = 16,
        height = 14,
        frame_count = 1,
        shift = util.by_pixel(-8, 4.5)
      }
    },
    west =
    {
      filename = "__base__/graphics/entity/combinator/activity-leds/decider-combinator-LED-W.png",
      width = 8,
      height = 8,
      frame_count = 1,
      shift = util.by_pixel(-15, -19),
      hr_version =
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/activity-leds/hr-decider-combinator-LED-W.png",
        width = 16,
        height = 16,
        frame_count = 1,
        shift = util.by_pixel(-15, -18.5)
      }
    }
  }
  combinator.greater_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -13.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -13.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -13.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -13.5)
        }
      }
  }
  combinator.less_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -13.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -13.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -13.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -13.5)
        }
      }
  }
  combinator.equal_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -13.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -13.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -13.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -13.5)
        }
      }
  }
  combinator.not_equal_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -13.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -13.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -13.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -13.5)
        }
      }
  }
  combinator.less_or_equal_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -13.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -13.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -13.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -13.5)
        }
      }
  }
  combinator.greater_or_equal_symbol_sprites =
  {
    north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -13.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -13.5)
        }
      },
    south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -4.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -4.5)
        }
      },
    west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        y = 22,
        width = 15,
        height = 11,
        shift = util.by_pixel(0, -13.5),
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          y = 44,
          width = 30,
          height = 22,
          shift = util.by_pixel(0, -13.5)
        }
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
          filename = "__base__/graphics/entity/combinator/constant-combinator.png",
          width = 58,
          height = 52,
          frame_count = 1,
          shift = util.by_pixel(0, 5),
          hr_version =
          {
            scale = 0.5,
            filename = "__base__/graphics/entity/combinator/hr-constant-combinator.png",
            width = 114,
            height = 102,
            frame_count = 1,
            shift = util.by_pixel(0, 5)
          }
        },
        {
          filename = "__base__/graphics/entity/combinator/constant-combinator-shadow.png",
          width = 50,
          height = 34,
          frame_count = 1,
          shift = util.by_pixel(9, 6),
          draw_as_shadow = true,
          hr_version =
          {
            scale = 0.5,
            filename = "__base__/graphics/entity/combinator/hr-constant-combinator-shadow.png",
            width = 98,
            height = 66,
            frame_count = 1,
            shift = util.by_pixel(8.5, 5.5),
            draw_as_shadow = true
          }
        }
      }
    })
  combinator.activity_led_sprites =
  {
    north =
    {
      filename = "__base__/graphics/entity/combinator/activity-leds/constant-combinator-LED-N.png",
      width = 8,
      height = 6,
      frame_count = 1,
      shift = util.by_pixel(9, -12),
      hr_version =
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/activity-leds/hr-constant-combinator-LED-N.png",
        width = 14,
        height = 12,
        frame_count = 1,
        shift = util.by_pixel(9, -11.5)
      }
    },
    east =
    {
      filename = "__base__/graphics/entity/combinator/activity-leds/constant-combinator-LED-E.png",
      width = 8,
      height = 8,
      frame_count = 1,
      shift = util.by_pixel(8, 0),
      hr_version =
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/activity-leds/hr-constant-combinator-LED-E.png",
        width = 14,
        height = 14,
        frame_count = 1,
        shift = util.by_pixel(7.5, -0.5)
      }
    },
    south =
    {
      filename = "__base__/graphics/entity/combinator/activity-leds/constant-combinator-LED-S.png",
      width = 8,
      height = 8,
      frame_count = 1,
      shift = util.by_pixel(-9, 2),
      hr_version =
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/activity-leds/hr-constant-combinator-LED-S.png",
        width = 14,
        height = 16,
        frame_count = 1,
        shift = util.by_pixel(-9, 2.5)
      }
    },
    west =
    {
      filename = "__base__/graphics/entity/combinator/activity-leds/constant-combinator-LED-W.png",
      width = 8,
      height = 8,
      frame_count = 1,
      shift = util.by_pixel(-7, -15),
      hr_version =
      {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/activity-leds/hr-constant-combinator-LED-W.png",
        width = 14,
        height = 16,
        frame_count = 1,
        shift = util.by_pixel(-7, -15)
      }
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


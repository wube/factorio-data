require ("util")

function biterrunanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-run-01.png",
          "__base__/graphics/entity/biter/biter-run-02.png",
          "__base__/graphics/entity/biter/biter-run-03.png",
          "__base__/graphics/entity/biter/biter-run-04.png",
        },
        slice = 8,
        lines_per_file = 8,
        line_length = 8,
        width = 202,
        height = 158,
        frame_count = 16,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(-2, -6), scale),
        scale = scale,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-run-01.png",
            "__base__/graphics/entity/biter/hr-biter-run-02.png",
            "__base__/graphics/entity/biter/hr-biter-run-03.png",
            "__base__/graphics/entity/biter/hr-biter-run-04.png",
          },
          slice = 8,
          lines_per_file = 8,
          line_length = 8,
          width = 398,
          height = 310,
          frame_count = 16,
          shift = util.mul_shift(util.by_pixel(-1, -5), scale),
          direction_count = 16,
          scale = 0.5 * scale,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-run-mask1-01.png",
          "__base__/graphics/entity/biter/biter-run-mask1-02.png",
          "__base__/graphics/entity/biter/biter-run-mask1-03.png",
          "__base__/graphics/entity/biter/biter-run-mask1-04.png",
        },
        slice = 8,
        lines_per_file = 8,
        flags = { "mask" },
        line_length = 8,
        width = 118,
        height = 94,
        frame_count = 16,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(0, -38), scale),
        scale = scale,
        tint = tint1,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-run-mask1-01.png",
            "__base__/graphics/entity/biter/hr-biter-run-mask1-02.png",
            "__base__/graphics/entity/biter/hr-biter-run-mask1-03.png",
            "__base__/graphics/entity/biter/hr-biter-run-mask1-04.png",
          },
          slice = 8,
          lines_per_file = 8,
          line_length = 8,
          width = 238,
          height = 182,
          frame_count = 16,
          shift = util.mul_shift(util.by_pixel(-1, -37), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          tint = tint1,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-run-mask2-01.png",
          "__base__/graphics/entity/biter/biter-run-mask2-02.png",
          "__base__/graphics/entity/biter/biter-run-mask2-03.png",
          "__base__/graphics/entity/biter/biter-run-mask2-04.png",
        },
        slice = 8,
        lines_per_file = 8,
        flags = { "mask" },
        line_length = 8,
        width = 120,
        height = 92,
        frame_count = 16,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(-2, -38), scale),
        scale = scale,
        tint = tint2,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-run-mask2-01.png",
            "__base__/graphics/entity/biter/hr-biter-run-mask2-02.png",
            "__base__/graphics/entity/biter/hr-biter-run-mask2-03.png",
            "__base__/graphics/entity/biter/hr-biter-run-mask2-04.png",
          },
          slice = 8,
          lines_per_file = 8,
          line_length = 8,
          width = 232,
          height = 184,
          frame_count = 16,
          shift = util.mul_shift(util.by_pixel(0, -38), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          tint = tint2,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-run-shadow-01.png",
          "__base__/graphics/entity/biter/biter-run-shadow-02.png",
          "__base__/graphics/entity/biter/biter-run-shadow-03.png",
          "__base__/graphics/entity/biter/biter-run-shadow-04.png",
        },
        slice = 8,
        lines_per_file = 8,
        line_length = 8,
        width = 216,
        height = 144,
        frame_count = 16,
        shift = util.mul_shift(util.by_pixel(8, 0), scale),
        direction_count = 16,
        scale = scale,
        draw_as_shadow = true,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-run-shadow-01.png",
            "__base__/graphics/entity/biter/hr-biter-run-shadow-02.png",
            "__base__/graphics/entity/biter/hr-biter-run-shadow-03.png",
            "__base__/graphics/entity/biter/hr-biter-run-shadow-04.png",
          },
          slice = 8,
          lines_per_file = 8,
          line_length = 8,
          width = 432,
          height = 292,
          frame_count = 16,
          shift = util.mul_shift(util.by_pixel(8, -1), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          draw_as_shadow = true,
        }
      }
    }
  }
end

function biterattackanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-attack-01.png",
          "__base__/graphics/entity/biter/biter-attack-02.png",
          "__base__/graphics/entity/biter/biter-attack-03.png",
          "__base__/graphics/entity/biter/biter-attack-04.png",
        },
        slice = 11,
        lines_per_file = 4,
        line_length = 16,
        width = 182,
        height = 176,
        frame_count = 11,
        direction_count = 16,
        animation_speed = 0.4,
        shift = util.mul_shift(util.by_pixel(-2, -26), scale),
        scale = scale,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-attack-01.png",
            "__base__/graphics/entity/biter/hr-biter-attack-02.png",
            "__base__/graphics/entity/biter/hr-biter-attack-03.png",
            "__base__/graphics/entity/biter/hr-biter-attack-04.png",
          },
          slice = 11,
          lines_per_file = 4,
          line_length = 16,
          width = 356,
          height = 348,
          frame_count = 11,
          shift = util.mul_shift(util.by_pixel(0, -25), scale),
          direction_count = 16,
          animation_speed = 0.4,
          scale = 0.5 * scale,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-attack-mask1-01.png",
          "__base__/graphics/entity/biter/biter-attack-mask1-02.png",
          "__base__/graphics/entity/biter/biter-attack-mask1-03.png",
          "__base__/graphics/entity/biter/biter-attack-mask1-04.png",
        },
        slice = 11,
        lines_per_file = 4,
        flags = { "mask" },
        line_length = 16,
        width = 178,
        height = 144,
        frame_count = 11,
        direction_count = 16,
        animation_speed = 0.4,
        shift = util.mul_shift(util.by_pixel(0, -42), scale),
        scale = scale,
        tint = tint1,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-attack-mask1-01.png",
            "__base__/graphics/entity/biter/hr-biter-attack-mask1-02.png",
            "__base__/graphics/entity/biter/hr-biter-attack-mask1-03.png",
            "__base__/graphics/entity/biter/hr-biter-attack-mask1-04.png",
          },
          slice = 11,
          lines_per_file = 4,
          line_length = 16,
          width = 360,
          height = 282,
          frame_count = 11,
          shift = util.mul_shift(util.by_pixel(-1, -41), scale),
          direction_count = 16,
          animation_speed = 0.4,
          scale = 0.5 * scale,
          tint = tint1,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-attack-mask2-01.png",
          "__base__/graphics/entity/biter/biter-attack-mask2-02.png",
          "__base__/graphics/entity/biter/biter-attack-mask2-03.png",
          "__base__/graphics/entity/biter/biter-attack-mask2-04.png",
        },
        slice = 11,
        lines_per_file = 4,
        flags = { "mask" },
        line_length = 16,
        width = 182,
        height = 144,
        frame_count = 11,
        direction_count = 16,
        animation_speed = 0.4,
        shift = util.mul_shift(util.by_pixel(-2, -42), scale),
        scale = scale,
        tint = tint2,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-attack-mask2-01.png",
            "__base__/graphics/entity/biter/hr-biter-attack-mask2-02.png",
            "__base__/graphics/entity/biter/hr-biter-attack-mask2-03.png",
            "__base__/graphics/entity/biter/hr-biter-attack-mask2-04.png",
          },
          slice = 11,
          lines_per_file = 4,
          line_length = 16,
          width = 358,
          height = 282,
          frame_count = 11,
          shift = util.mul_shift(util.by_pixel(-1, -41), scale),
          direction_count = 16,
          animation_speed = 0.4,
          scale = 0.5 * scale,
          tint = tint2,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-attack-shadow-01.png",
          "__base__/graphics/entity/biter/biter-attack-shadow-02.png",
          "__base__/graphics/entity/biter/biter-attack-shadow-03.png",
          "__base__/graphics/entity/biter/biter-attack-shadow-04.png",
        },
        slice = 11,
        lines_per_file = 4,
        line_length = 16,
        width = 240,
        height = 128,
        frame_count = 11,
        shift = util.mul_shift(util.by_pixel(30, 0), scale),
        direction_count = 16,
        animation_speed = 0.4,
        scale = scale,
        draw_as_shadow = true,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-attack-shadow-01.png",
            "__base__/graphics/entity/biter/hr-biter-attack-shadow-02.png",
            "__base__/graphics/entity/biter/hr-biter-attack-shadow-03.png",
            "__base__/graphics/entity/biter/hr-biter-attack-shadow-04.png",
          },
          slice = 11,
          lines_per_file = 4,
          line_length = 16,
          width = 476,
          height = 258,
          frame_count = 11,
          shift = util.mul_shift(util.by_pixel(31, -1), scale),
          direction_count = 16,
          animation_speed = 0.4,
          scale = 0.5 * scale,
          draw_as_shadow = true,
        }
      },
    }
  }
end

function biteridleanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-idle-01.png",
          "__base__/graphics/entity/biter/biter-idle-02.png",
          "__base__/graphics/entity/biter/biter-idle-03.png",
          "__base__/graphics/entity/biter/biter-idle-04.png",
        },
        line_length = 11,
        width = 154,
        height = 132,
        frame_count = 11,
        slice = 11,
        lines_per_file = 4,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(-2, -12), scale),
        scale = scale,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-idle-01.png",
            "__base__/graphics/entity/biter/hr-biter-idle-02.png",
            "__base__/graphics/entity/biter/hr-biter-idle-03.png",
            "__base__/graphics/entity/biter/hr-biter-idle-04.png",
          },
          line_length = 11,
          width = 304,
          height = 258,
          frame_count = 11,
          slice = 11,
          lines_per_file = 4,
          shift = util.mul_shift(util.by_pixel(-1, -11), scale),
          direction_count = 16,
          scale = 0.5 * scale,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-idle-mask1-01.png",
          "__base__/graphics/entity/biter/biter-idle-mask1-02.png",
          "__base__/graphics/entity/biter/biter-idle-mask1-03.png",
          "__base__/graphics/entity/biter/biter-idle-mask1-04.png",
        },
        flags = { "mask" },
        line_length = 11,
        width = 124,
        height = 110,
        frame_count = 11,
        slice = 11,
        lines_per_file = 4,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(-2, -24), scale),
        scale = scale,
        tint = tint1,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-idle-mask1-01.png",
            "__base__/graphics/entity/biter/hr-biter-idle-mask1-02.png",
            "__base__/graphics/entity/biter/hr-biter-idle-mask1-03.png",
            "__base__/graphics/entity/biter/hr-biter-idle-mask1-04.png",
          },
          line_length = 11,
          width = 244,
          height = 214,
          frame_count = 11,
          slice = 11,
          lines_per_file = 4,
          shift = util.mul_shift(util.by_pixel(-1, -23), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          tint = tint1,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-idle-mask2-01.png",
          "__base__/graphics/entity/biter/biter-idle-mask2-02.png",
          "__base__/graphics/entity/biter/biter-idle-mask2-03.png",
          "__base__/graphics/entity/biter/biter-idle-mask2-04.png",
        },
        flags = { "mask" },
        line_length = 11,
        width = 124,
        height = 108,
        frame_count = 11,
        slice = 11,
        lines_per_file = 4,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(-2, -24), scale),
        scale = scale,
        tint = tint2,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-idle-mask2-01.png",
            "__base__/graphics/entity/biter/hr-biter-idle-mask2-02.png",
            "__base__/graphics/entity/biter/hr-biter-idle-mask2-03.png",
            "__base__/graphics/entity/biter/hr-biter-idle-mask2-04.png",
          },
          line_length = 11,
          width = 242,
          height = 212,
          frame_count = 11,
          slice = 11,
          lines_per_file = 4,
          shift = util.mul_shift(util.by_pixel(-1, -23), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          tint = tint2,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-idle-shadow-01.png",
          "__base__/graphics/entity/biter/biter-idle-shadow-02.png",
          "__base__/graphics/entity/biter/biter-idle-shadow-03.png",
          "__base__/graphics/entity/biter/biter-idle-shadow-04.png",
        },
        line_length = 11,
        width = 184,
        height = 110,
        frame_count = 11,
        slice = 11,
        lines_per_file = 4,
        shift = util.mul_shift(util.by_pixel(14, -2), scale),
        direction_count = 16,
        scale = scale,
        draw_as_shadow = true,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-idle-shadow-01.png",
            "__base__/graphics/entity/biter/hr-biter-idle-shadow-02.png",
            "__base__/graphics/entity/biter/hr-biter-idle-shadow-03.png",
            "__base__/graphics/entity/biter/hr-biter-idle-shadow-04.png",
          },
          line_length = 11,
          width = 362,
          height = 216,
          frame_count = 11,
          slice = 11,
          lines_per_file = 4,
          shift = util.mul_shift(util.by_pixel(15, -1), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          draw_as_shadow = true,
        }
      },
    }
  }
end

function biterdieanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-die-01.png",
          "__base__/graphics/entity/biter/biter-die-02.png",
          "__base__/graphics/entity/biter/biter-die-03.png",
          "__base__/graphics/entity/biter/biter-die-04.png",
          "__base__/graphics/entity/biter/biter-die-05.png",
          "__base__/graphics/entity/biter/biter-die-06.png",
          "__base__/graphics/entity/biter/biter-die-07.png",
          "__base__/graphics/entity/biter/biter-die-08.png",
          "__base__/graphics/entity/biter/biter-die-09.png",
          "__base__/graphics/entity/biter/biter-die-10.png",
          "__base__/graphics/entity/biter/biter-die-11.png",
          "__base__/graphics/entity/biter/biter-die-12.png",
          "__base__/graphics/entity/biter/biter-die-13.png",
          "__base__/graphics/entity/biter/biter-die-14.png",
          "__base__/graphics/entity/biter/biter-die-15.png",
          "__base__/graphics/entity/biter/biter-die-16.png",
          "__base__/graphics/entity/biter/biter-die-17.png",
        },
        slice = 4,
        lines_per_file = 4,
        line_length = 4,
        width = 276,
        height = 202,
        frame_count = 17,
        direction_count = 16,
        shift= util.mul_shift(util.by_pixel(-2, -4), scale),
        scale = scale,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-die-01.png",
            "__base__/graphics/entity/biter/hr-biter-die-02.png",
            "__base__/graphics/entity/biter/hr-biter-die-03.png",
            "__base__/graphics/entity/biter/hr-biter-die-04.png",
            "__base__/graphics/entity/biter/hr-biter-die-05.png",
            "__base__/graphics/entity/biter/hr-biter-die-06.png",
            "__base__/graphics/entity/biter/hr-biter-die-07.png",
            "__base__/graphics/entity/biter/hr-biter-die-08.png",
            "__base__/graphics/entity/biter/hr-biter-die-09.png",
            "__base__/graphics/entity/biter/hr-biter-die-10.png",
            "__base__/graphics/entity/biter/hr-biter-die-11.png",
            "__base__/graphics/entity/biter/hr-biter-die-12.png",
            "__base__/graphics/entity/biter/hr-biter-die-13.png",
            "__base__/graphics/entity/biter/hr-biter-die-14.png",
            "__base__/graphics/entity/biter/hr-biter-die-15.png",
            "__base__/graphics/entity/biter/hr-biter-die-16.png",
            "__base__/graphics/entity/biter/hr-biter-die-17.png",
          },
          slice = 4,
          lines_per_file = 4,
          line_length = 4,
          width = 544,
          height = 402,
          frame_count = 17,
          shift = util.mul_shift(util.by_pixel(0, -4), scale),
          direction_count = 16,
          scale = 0.5 * scale,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-die-mask1-01.png",
          "__base__/graphics/entity/biter/biter-die-mask1-02.png",
          "__base__/graphics/entity/biter/biter-die-mask1-03.png",
          "__base__/graphics/entity/biter/biter-die-mask1-04.png",
          "__base__/graphics/entity/biter/biter-die-mask1-05.png",
          "__base__/graphics/entity/biter/biter-die-mask1-06.png",
          "__base__/graphics/entity/biter/biter-die-mask1-07.png",
          "__base__/graphics/entity/biter/biter-die-mask1-08.png",
          "__base__/graphics/entity/biter/biter-die-mask1-09.png",
          "__base__/graphics/entity/biter/biter-die-mask1-10.png",
          "__base__/graphics/entity/biter/biter-die-mask1-11.png",
          "__base__/graphics/entity/biter/biter-die-mask1-12.png",
          "__base__/graphics/entity/biter/biter-die-mask1-13.png",
          "__base__/graphics/entity/biter/biter-die-mask1-14.png",
          "__base__/graphics/entity/biter/biter-die-mask1-15.png",
          "__base__/graphics/entity/biter/biter-die-mask1-16.png",
          "__base__/graphics/entity/biter/biter-die-mask1-17.png",
        },
        slice = 4,
        lines_per_file = 4,
        flags = { "mask" },
        line_length = 4,
        width = 198,
        height = 166,
        frame_count = 17,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(0, -22), scale),
        scale = scale,
        tint = tint1,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-die-mask1-01.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-02.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-03.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-04.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-05.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-06.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-07.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-08.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-09.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-10.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-11.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-12.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-13.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-14.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-15.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-16.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-17.png",
          },
          slice = 4,
          lines_per_file = 4,
          line_length = 4,
          width = 398,
          height = 328,
          frame_count = 17,
          shift = util.mul_shift(util.by_pixel(-1, -21), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          tint = tint1,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-die-mask2-01.png",
          "__base__/graphics/entity/biter/biter-die-mask2-02.png",
          "__base__/graphics/entity/biter/biter-die-mask2-03.png",
          "__base__/graphics/entity/biter/biter-die-mask2-04.png",
          "__base__/graphics/entity/biter/biter-die-mask2-05.png",
          "__base__/graphics/entity/biter/biter-die-mask2-06.png",
          "__base__/graphics/entity/biter/biter-die-mask2-07.png",
          "__base__/graphics/entity/biter/biter-die-mask2-08.png",
          "__base__/graphics/entity/biter/biter-die-mask2-09.png",
          "__base__/graphics/entity/biter/biter-die-mask2-10.png",
          "__base__/graphics/entity/biter/biter-die-mask2-11.png",
          "__base__/graphics/entity/biter/biter-die-mask2-12.png",
          "__base__/graphics/entity/biter/biter-die-mask2-13.png",
          "__base__/graphics/entity/biter/biter-die-mask2-14.png",
          "__base__/graphics/entity/biter/biter-die-mask2-15.png",
          "__base__/graphics/entity/biter/biter-die-mask2-16.png",
          "__base__/graphics/entity/biter/biter-die-mask2-17.png",
        },
        slice = 4,
        lines_per_file = 4,
        flags = { "mask" },
        line_length = 4,
        width = 200,
        height = 166,
        frame_count = 17,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(-2, -22), scale),
        scale = scale,
        tint = tint2,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-die-mask2-01.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-02.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-03.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-04.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-05.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-06.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-07.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-08.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-09.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-10.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-11.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-12.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-13.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-14.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-15.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-16.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-17.png",
          },
          slice = 4,
          lines_per_file = 4,
          line_length = 4,
          width = 396,
          height = 330,
          frame_count = 17,
          shift = util.mul_shift(util.by_pixel(-1, -22), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          tint = tint2,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-die-shadow-01.png",
          "__base__/graphics/entity/biter/biter-die-shadow-02.png",
          "__base__/graphics/entity/biter/biter-die-shadow-03.png",
          "__base__/graphics/entity/biter/biter-die-shadow-04.png",
          "__base__/graphics/entity/biter/biter-die-shadow-05.png",
          "__base__/graphics/entity/biter/biter-die-shadow-06.png",
          "__base__/graphics/entity/biter/biter-die-shadow-07.png",
          "__base__/graphics/entity/biter/biter-die-shadow-08.png",
          "__base__/graphics/entity/biter/biter-die-shadow-09.png",
          "__base__/graphics/entity/biter/biter-die-shadow-10.png",
          "__base__/graphics/entity/biter/biter-die-shadow-11.png",
          "__base__/graphics/entity/biter/biter-die-shadow-12.png",
          "__base__/graphics/entity/biter/biter-die-shadow-13.png",
          "__base__/graphics/entity/biter/biter-die-shadow-14.png",
          "__base__/graphics/entity/biter/biter-die-shadow-15.png",
          "__base__/graphics/entity/biter/biter-die-shadow-16.png",
          "__base__/graphics/entity/biter/biter-die-shadow-17.png",
        },
        slice = 4,
        lines_per_file = 4,
        line_length = 4,
        width = 282,
        height = 192,
        frame_count = 17,
        shift = util.mul_shift(util.by_pixel(4, 0), scale),
        direction_count = 16,
        scale = scale,
        draw_as_shadow = true,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-die-shadow-01.png",
            "__base__/graphics/entity/biter/hr-biter-die-shadow-02.png",
            "__base__/graphics/entity/biter/hr-biter-die-shadow-03.png",
            "__base__/graphics/entity/biter/hr-biter-die-shadow-04.png",
            "__base__/graphics/entity/biter/hr-biter-die-shadow-05.png",
            "__base__/graphics/entity/biter/hr-biter-die-shadow-06.png",
            "__base__/graphics/entity/biter/hr-biter-die-shadow-07.png",
            "__base__/graphics/entity/biter/hr-biter-die-shadow-08.png",
            "__base__/graphics/entity/biter/hr-biter-die-shadow-09.png",
            "__base__/graphics/entity/biter/hr-biter-die-shadow-10.png",
            "__base__/graphics/entity/biter/hr-biter-die-shadow-11.png",
            "__base__/graphics/entity/biter/hr-biter-die-shadow-12.png",
            "__base__/graphics/entity/biter/hr-biter-die-shadow-13.png",
            "__base__/graphics/entity/biter/hr-biter-die-shadow-14.png",
            "__base__/graphics/entity/biter/hr-biter-die-shadow-15.png",
            "__base__/graphics/entity/biter/hr-biter-die-shadow-16.png",
            "__base__/graphics/entity/biter/hr-biter-die-shadow-17.png",
          },
          slice = 4,
          lines_per_file = 4,
          line_length = 4,
          width = 564,
          height = 384,
          frame_count = 17,
          shift = util.mul_shift(util.by_pixel(4, 0), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          draw_as_shadow = true,
        }
      },
    }
  }
end

function add_biter_die_animation(scale, tint1, tint2, corpse)
  corpse.animation = biterdieanimation(scale, tint1, tint2)
  corpse.dying_speed = 0.04
  corpse.time_before_removed = 15 * 60 * 60
  corpse.direction_shuffle = { { 1, 2, 3, 16 }, { 4, 5, 6, 7 }, { 8, 9, 10, 11 }, { 12, 13, 14, 15 } }
  corpse.shuffle_directions_at_frame = 7
  corpse.final_render_layer = "lower-object-above-shadow"

  corpse.ground_patch_render_layer = "decals" -- "transport-belt-integration"
  corpse.ground_patch_fade_in_delay = 1 / 0.02 --  in ticks; 1/dying_speed to delay the animation until dying animation finishes
  corpse.ground_patch_fade_in_speed = 0.002
  corpse.ground_patch_fade_out_start = 50 * 60
  corpse.ground_patch_fade_out_duration = 20 * 60

  local a = 1
  local d = 0.9
  corpse.ground_patch =
  {
    sheet =
    {
      filename = "__base__/graphics/entity/biter/blood-puddle-var-main.png",
      flags = { "low-object" },
      line_length = 4,
      variation_count = 4,
      frame_count = 1,
      width = 84,
      height = 68,
      shift = util.by_pixel(1, 0),
      tint = {r = 0.6 * d * a, g = 0.1 * d * a, b = 0.6 * d * a, a = a},
      scale = scale,
      hr_version =
      {
        filename = "__base__/graphics/entity/biter/hr-blood-puddle-var-main.png",
        flags = { "low-object" },
        line_length = 4,
        variation_count = 4,
        frame_count = 1,
        width = 164,
        height = 134,
        shift = util.by_pixel(-0.5,-0.5),
        tint = {r = 0.6 * d * a, g = 0.1 * d * a, b = 0.6 * d * a, a = a},
        scale = 0.5 * scale
      }
    }
  }
  return corpse
end

function biter_water_reflection(scale)
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/biter/biter-reflection.png",
      priority = "extra-high",
      width = 20,
      height = 28,
      shift = util.by_pixel(5, 15),
      scale = 5 * scale,
      variation_count = 1,
    },
    rotate = true,
    orientation_to_variation = false
  }
end

function worm_integration(scale)
return
  {
    filename = "__base__/graphics/entity/worm/worm-integration.png",
    frame_count = 1,
    variation_count = 1,
    width = 166,
    height = 122,
    shift = util.mul_shift(util.by_pixel(4, -2), scale),
    scale = scale,
    hr_version =
    {
      filename = "__base__/graphics/entity/worm/hr-worm-integration.png",
      frame_count = 1,
      variation_count = 1,
      width = 332,
      height = 240,
      shift = util.mul_shift(util.by_pixel(4, -1), scale),
      scale = 0.5 * scale,
    }
  }
end

function worm_folded_animation(scale, tint)
  return
  {
    layers=
    {
      {
        filename = "__base__/graphics/entity/worm/worm-folded.png",
        run_mode = "forward-then-backward",
        line_length = 9,
        width = 66,
        height = 60,
        frame_count = 9,
        shift = util.mul_shift(util.by_pixel(0, 4), scale),
        direction_count = 1,
        scale = scale,
        hr_version =
        {
          filename = "__base__/graphics/entity/worm/hr-worm-folded.png",
          run_mode = "forward-then-backward",
          line_length = 9,
          width = 130,
          height = 120,
          frame_count = 9,
          shift = util.mul_shift(util.by_pixel(0, 4), scale),
          direction_count = 1,
          scale = scale * 0.5,
        }
      },
      {
        filename = "__base__/graphics/entity/worm/worm-folded-mask.png",
        flags = { "mask" },
        run_mode = "forward-then-backward",
        line_length = 9,
        width = 66,
        height = 56,
        frame_count = 9,
        shift = util.mul_shift(util.by_pixel(0, 6), scale),
        scale = scale,
        direction_count = 1,
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/entity/worm/hr-worm-folded-mask.png",
          flags = { "mask" },
          run_mode = "forward-then-backward",
          line_length = 9,
          width = 130,
          height = 108,
          frame_count = 9,
          shift = util.mul_shift(util.by_pixel(0, 7), scale),
          scale = scale * 0.5,
          direction_count = 1,
          tint = tint
        }
      },
      {
        filename = "__base__/graphics/entity/worm/worm-folded-shadow.png",
        run_mode = "forward-then-backward",
        line_length = 9,
        width = 60,
        height = 34,
        frame_count = 9,
        shift = util.mul_shift(util.by_pixel(4, -4), scale),
        direction_count = 1,
        scale = scale,
        draw_as_shadow = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/worm/hr-worm-folded-shadow.png",
          run_mode = "forward-then-backward",
          line_length = 9,
          width = 116,
          height = 68,
          frame_count = 9,
          shift = util.mul_shift(util.by_pixel(5, -4), scale),
          direction_count = 1,
          scale = scale * 0.5,
          draw_as_shadow = true,
        }
      },
    }
  }
end

function worm_preparing_animation(scale, tint, run_mode)
  return
  {
    layers=
    {
      {
        filename = "__base__/graphics/entity/worm/worm-preparing.png",
        width = 94,
        height = 152,
        line_length = 6,
        frame_count = 18,
        shift = util.mul_shift(util.by_pixel(0, -42), scale),
        run_mode = run_mode,
        scale = scale,
        direction_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/worm/hr-worm-preparing.png",
          width = 188,
          height = 304,
          line_length = 6,
          frame_count = 18,
          shift = util.mul_shift(util.by_pixel(0, -42), scale),
          run_mode = run_mode,
          scale = 0.5 * scale,
          direction_count = 1,
        }
      },
      {
        filename = "__base__/graphics/entity/worm/worm-preparing-mask.png",
        flags = { "mask" },
        line_length = 6,
        width = 94,
        height = 124,
        frame_count = 18,
        shift = util.mul_shift(util.by_pixel(0, -28), scale),
        run_mode = run_mode,
        scale = scale,
        direction_count = 1,
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/entity/worm/hr-worm-preparing-mask.png",
          flags = { "mask" },
          line_length = 6,
          width = 188,
          height = 248,
          frame_count = 18,
          shift = util.mul_shift(util.by_pixel(0, -28), scale),
          run_mode = run_mode,
          scale = 0.5 * scale,
          direction_count = 1,
          tint = tint,
        }
      },
      {
        filename = "__base__/graphics/entity/worm/worm-preparing-shadow.png",
        width = 208,
        height = 66,
        line_length = 6,
        frame_count = 18,
        shift = util.mul_shift(util.by_pixel(54, -6), scale),
        run_mode = run_mode,
        scale = scale,
        direction_count = 1,
        draw_as_shadow = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/worm/hr-worm-preparing-shadow.png",
          width = 410,
          height = 124,
          line_length = 6,
          frame_count = 18,
          shift = util.mul_shift(util.by_pixel(55, -4), scale),
          run_mode = run_mode,
          scale = 0.5 * scale,
          direction_count = 1,
          draw_as_shadow = true,
        }
      },
    }
  }
end

function worm_prepared_animation(scale, tint)
  return
  {
    layers=
    {
      {
        filename = "__base__/graphics/entity/worm/worm-prepared.png",
        run_mode = "forward-then-backward",
        line_length = 9,
        width = 98,
        height = 152,
        frame_count = 9,
        scale = scale,
        direction_count = 1,
        shift = util.mul_shift(util.by_pixel(-4, -42), scale),
        hr_version =
        {
          filename = "__base__/graphics/entity/worm/hr-worm-prepared.png",
          run_mode = "forward-then-backward",
          line_length = 9,
          width = 190,
          height = 300,
          frame_count = 9,
          scale = 0.5 * scale,
          direction_count = 1,
          shift = util.mul_shift(util.by_pixel(-3, -41), scale),
        }
      },
      {
        filename = "__base__/graphics/entity/worm/worm-prepared-mask.png",
        flags = { "mask" },
        run_mode = "forward-then-backward",
        line_length = 9,
        width = 98,
        height = 132,
        frame_count = 9,
        shift = util.mul_shift(util.by_pixel(-4, -32), scale),
        scale = scale,
        direction_count = 1,
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/entity/worm/hr-worm-prepared-mask.png",
          flags = { "mask" },
          run_mode = "forward-then-backward",
          line_length = 9,
          width = 190,
          height = 268,
          frame_count = 9,
          shift = util.mul_shift(util.by_pixel(-3, -33), scale),
          scale = 0.5 * scale,
          direction_count = 1,
          tint = tint,
        }
      },
      {
        filename = "__base__/graphics/entity/worm/worm-prepared-shadow.png",
        run_mode = "forward-then-backward",
        line_length = 9,
        width = 204,
        height = 62,
        frame_count = 9,
        scale = scale,
        direction_count = 1,
        shift = util.mul_shift(util.by_pixel(52, -6), scale),
        draw_as_shadow = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/worm/hr-worm-prepared-shadow.png",
          run_mode = "forward-then-backward",
          line_length = 9,
          width = 408,
          height = 122,
          frame_count = 9,
          scale = 0.5 * scale,
          direction_count = 1,
          shift = util.mul_shift(util.by_pixel(52, -6), scale),
          draw_as_shadow = true,
        }
      },
    }
  }
end

alternate_frame_sequence = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
                             17, 17, 16, 16, 15, 15, 16, 16, 17, 17, 16, 16, 16, 17, 17,
                             16, 16, 15, 15, 16, 16, 15, 15, 16, 16, 17, 17,
                             17, 16, 16, 15, 15, 16, 16, 15, 15, 16, 16, 17,
                             16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1}

function worm_prepared_alternative_animation(scale, tint)
  return
  {
    layers=
    {
      {
        filename = "__base__/graphics/entity/worm/worm-prepared-alternative.png",
        line_length = 6,
        width = 92,
        height = 164,
        frame_count = 17,
        frame_sequence = alternate_frame_sequence,
        scale = scale,
        direction_count = 1,
        shift = util.mul_shift(util.by_pixel(-2, -48), scale),
        hr_version =
        {
          filename = "__base__/graphics/entity/worm/hr-worm-prepared-alternative.png",
          line_length = 6,
          width = 182,
          height = 324,
          frame_count = 17,
          frame_sequence = alternate_frame_sequence,
          scale = 0.5 * scale,
          direction_count = 1,
          shift = util.mul_shift(util.by_pixel(-2, -47), scale),
        }
      },
      {
        filename = "__base__/graphics/entity/worm/worm-prepared-alternative-mask.png",
        flags = { "mask" },
        line_length = 6,
        width = 92,
        height = 144,
        frame_count = 17,
        frame_sequence = alternate_frame_sequence,
        shift = util.mul_shift(util.by_pixel(-2, -38), scale),
        scale = scale,
        direction_count = 1,
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/entity/worm/hr-worm-prepared-alternative-mask.png",
          flags = { "mask" },
          line_length = 6,
          width = 182,
          height = 288,
          frame_count = 17,
          frame_sequence = alternate_frame_sequence,
          shift = util.mul_shift(util.by_pixel(-2, -38), scale),
          scale = 0.5 * scale,
          direction_count = 1,
          tint = tint,
        }
      },
      {
        filename = "__base__/graphics/entity/worm/worm-prepared-alternative-shadow.png",
        line_length = 6,
        width = 214,
        height = 60,
        frame_count = 17,
        frame_sequence = alternate_frame_sequence,
        scale = scale,
        direction_count = 1,
        shift = util.mul_shift(util.by_pixel(56, -6), scale),
        draw_as_shadow = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/worm/hr-worm-prepared-alternative-shadow.png",
          line_length = 6,
          width = 424,
          height = 120,
          frame_count = 17,
          frame_sequence = alternate_frame_sequence,
          scale = 0.5 * scale,
          direction_count = 1,
          shift = util.mul_shift(util.by_pixel(57, -6), scale),
          draw_as_shadow = true,
        }
      },
    }
  }
end

start_attack_frame_sequence = { 1, 2, 3, 4, 5, 6, 7, 8, 9}

function worm_start_attack_animation(scale, tint)
  return
  {
    layers=
    {
      {
        filenames =
        {
          "__base__/graphics/entity/worm/worm-attack-01.png",
          "__base__/graphics/entity/worm/worm-attack-02.png",
          "__base__/graphics/entity/worm/worm-attack-03.png",
          "__base__/graphics/entity/worm/worm-attack-04.png",
          "__base__/graphics/entity/worm/worm-attack-05.png",
          "__base__/graphics/entity/worm/worm-attack-06.png",
          "__base__/graphics/entity/worm/worm-attack-07.png",
          "__base__/graphics/entity/worm/worm-attack-08.png",
          "__base__/graphics/entity/worm/worm-attack-09.png",
          "__base__/graphics/entity/worm/worm-attack-10.png"
        },
        slice = 4,
        lines_per_file = 4,
        line_length = 4,
        width = 240,
        height = 222,
        frame_count = 10,
        frame_sequence = start_attack_frame_sequence,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(-8, -30), scale),
        scale = scale,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/worm/hr-worm-attack-01.png",
            "__base__/graphics/entity/worm/hr-worm-attack-02.png",
            "__base__/graphics/entity/worm/hr-worm-attack-03.png",
            "__base__/graphics/entity/worm/hr-worm-attack-04.png",
            "__base__/graphics/entity/worm/hr-worm-attack-05.png",
            "__base__/graphics/entity/worm/hr-worm-attack-06.png",
            "__base__/graphics/entity/worm/hr-worm-attack-07.png",
            "__base__/graphics/entity/worm/hr-worm-attack-08.png",
            "__base__/graphics/entity/worm/hr-worm-attack-09.png",
            "__base__/graphics/entity/worm/hr-worm-attack-10.png"
          },
          slice = 4,
          lines_per_file = 4,
          line_length = 4,
          width = 480,
          height = 440,
          frame_count = 10,
          frame_sequence = start_attack_frame_sequence,
          direction_count = 16,
          shift = util.mul_shift(util.by_pixel(-8, -29), scale),
          scale = 0.5 * scale,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/worm/worm-attack-mask-01.png",
          "__base__/graphics/entity/worm/worm-attack-mask-02.png",
          "__base__/graphics/entity/worm/worm-attack-mask-03.png",
          "__base__/graphics/entity/worm/worm-attack-mask-04.png",
          "__base__/graphics/entity/worm/worm-attack-mask-05.png",
          "__base__/graphics/entity/worm/worm-attack-mask-06.png",
          "__base__/graphics/entity/worm/worm-attack-mask-07.png",
          "__base__/graphics/entity/worm/worm-attack-mask-08.png",
          "__base__/graphics/entity/worm/worm-attack-mask-09.png",
          "__base__/graphics/entity/worm/worm-attack-mask-10.png"
        },
        slice = 4,
        lines_per_file = 4,
        line_length = 4,
        width = 196,
        height = 186,
        frame_count = 10,
        frame_sequence = start_attack_frame_sequence,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(-8, -28), scale),
        tint = tint,
        scale = scale,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/worm/hr-worm-attack-mask-01.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-02.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-03.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-04.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-05.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-06.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-07.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-08.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-09.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-10.png"
          },
          slice = 4,
          lines_per_file = 4,
          line_length = 4,
          width = 388,
          height = 366,
          frame_count = 10,
          frame_sequence = start_attack_frame_sequence,
          direction_count = 16,
          shift = util.mul_shift(util.by_pixel(-7, -27), scale),
          tint = tint,
          scale = 0.5 * scale,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/worm/worm-attack-shadow-01.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-02.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-03.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-04.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-05.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-06.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-07.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-08.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-09.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-10.png"
        },
        slice = 4,
        lines_per_file = 4,
        line_length = 4,
        width = 310,
        height = 176,
        frame_count = 10,
        frame_sequence = start_attack_frame_sequence,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(38, -2), scale),
        scale = scale,
        draw_as_shadow = true,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-01.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-02.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-03.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-04.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-05.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-06.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-07.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-08.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-09.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-10.png"
          },
          slice = 4,
          lines_per_file = 4,
          line_length = 4,
          width = 618,
          height = 350,
          frame_count = 10,
          frame_sequence = start_attack_frame_sequence,
          direction_count = 16,
          shift = util.mul_shift(util.by_pixel(38, -2), scale),
          scale = 0.5 * scale,
          draw_as_shadow = true,
        }
      },
    }
  }
end

end_attack_frame_sequence = { 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1}

function worm_end_attack_animation(scale, tint)
  return
  {
    layers=
    {
      {
        filenames =
        {
          "__base__/graphics/entity/worm/worm-attack-01.png",
          "__base__/graphics/entity/worm/worm-attack-02.png",
          "__base__/graphics/entity/worm/worm-attack-03.png",
          "__base__/graphics/entity/worm/worm-attack-04.png",
          "__base__/graphics/entity/worm/worm-attack-05.png",
          "__base__/graphics/entity/worm/worm-attack-06.png",
          "__base__/graphics/entity/worm/worm-attack-07.png",
          "__base__/graphics/entity/worm/worm-attack-08.png",
          "__base__/graphics/entity/worm/worm-attack-09.png",
          "__base__/graphics/entity/worm/worm-attack-10.png"
        },
        slice = 4,
        lines_per_file = 4,
        line_length = 4,
        width = 240,
        height = 222,
        frame_count = 10,
        frame_sequence = end_attack_frame_sequence,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(-8, -30), scale),
        scale = scale,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/worm/hr-worm-attack-01.png",
            "__base__/graphics/entity/worm/hr-worm-attack-02.png",
            "__base__/graphics/entity/worm/hr-worm-attack-03.png",
            "__base__/graphics/entity/worm/hr-worm-attack-04.png",
            "__base__/graphics/entity/worm/hr-worm-attack-05.png",
            "__base__/graphics/entity/worm/hr-worm-attack-06.png",
            "__base__/graphics/entity/worm/hr-worm-attack-07.png",
            "__base__/graphics/entity/worm/hr-worm-attack-08.png",
            "__base__/graphics/entity/worm/hr-worm-attack-09.png",
            "__base__/graphics/entity/worm/hr-worm-attack-10.png"
          },
          slice = 4,
          lines_per_file = 4,
          line_length = 4,
          width = 480,
          height = 440,
          frame_count = 10,
          frame_sequence = end_attack_frame_sequence,
          direction_count = 16,
          shift = util.mul_shift(util.by_pixel(-8, -29), scale),
          scale = 0.5 * scale,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/worm/worm-attack-mask-01.png",
          "__base__/graphics/entity/worm/worm-attack-mask-02.png",
          "__base__/graphics/entity/worm/worm-attack-mask-03.png",
          "__base__/graphics/entity/worm/worm-attack-mask-04.png",
          "__base__/graphics/entity/worm/worm-attack-mask-05.png",
          "__base__/graphics/entity/worm/worm-attack-mask-06.png",
          "__base__/graphics/entity/worm/worm-attack-mask-07.png",
          "__base__/graphics/entity/worm/worm-attack-mask-08.png",
          "__base__/graphics/entity/worm/worm-attack-mask-09.png",
          "__base__/graphics/entity/worm/worm-attack-mask-10.png"
        },
        slice = 4,
        lines_per_file = 4,
        line_length = 4,
        width = 196,
        height = 186,
        frame_count = 10,
        frame_sequence = end_attack_frame_sequence,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(-8, -28), scale),
        tint = tint,
        scale = scale,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/worm/hr-worm-attack-mask-01.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-02.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-03.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-04.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-05.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-06.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-07.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-08.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-09.png",
            "__base__/graphics/entity/worm/hr-worm-attack-mask-10.png"
          },
          slice = 4,
          lines_per_file = 4,
          line_length = 4,
          width = 388,
          height = 366,
          frame_count = 10,
          frame_sequence = end_attack_frame_sequence,
          direction_count = 16,
          shift = util.mul_shift(util.by_pixel(-7, -27), scale),
          tint = tint,
          scale = 0.5 * scale,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/worm/worm-attack-shadow-01.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-02.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-03.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-04.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-05.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-06.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-07.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-08.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-09.png",
          "__base__/graphics/entity/worm/worm-attack-shadow-10.png"
        },
        slice = 4,
        lines_per_file = 4,
        line_length = 4,
        width = 310,
        height = 176,
        frame_count = 10,
        frame_sequence = end_attack_frame_sequence,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(38, -2), scale),
        scale = scale,
        draw_as_shadow = true,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-01.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-02.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-03.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-04.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-05.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-06.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-07.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-08.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-09.png",
            "__base__/graphics/entity/worm/hr-worm-attack-shadow-10.png"
          },
          slice = 4,
          lines_per_file = 4,
          line_length = 4,
          width = 618,
          height = 350,
          frame_count = 10,
          frame_sequence = end_attack_frame_sequence,
          direction_count = 16,
          shift = util.mul_shift(util.by_pixel(38, -2), scale),
          scale = 0.5 * scale,
          draw_as_shadow = true,
        }
      },
    }
  }
end

function worm_die_animation(scale, tint)
  return
  {
    {
      layers=
      {
        {
          filename = "__base__/graphics/entity/worm/worm-die-01.png",
          line_length = 6,
          width = 134,
          height = 186,
          frame_count = 24,
          shift = util.mul_shift(util.by_pixel(18, -26), scale),
          direction_count = 1,
          scale = scale,
          hr_version =
          {
            filename = "__base__/graphics/entity/worm/hr-worm-die-01.png",
            line_length = 6,
            width = 262,
            height = 372,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(19, -26), scale),
            direction_count = 1,
            scale = 0.5 * scale,
          }
        },
        {
          filename = "__base__/graphics/entity/worm/worm-die-01-mask.png",
          flags = { "mask" },
          line_length = 6,
          width = 124,
          height = 160,
          frame_count = 24,
          shift = util.mul_shift(util.by_pixel(15, -19), scale),
          direction_count = 1,
          scale = scale,
          tint = tint,
          hr_version =
          {
            filename = "__base__/graphics/entity/worm/hr-worm-die-01-mask.png",
            flags = { "mask" },
            line_length = 6,
            width = 250,
            height = 318,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(15, -19), scale),
            direction_count = 1,
            scale = 0.5 * scale,
            tint = tint,
          }
        },
        {
          filename = "__base__/graphics/entity/worm/worm-die-01-shadow.png",
          line_length = 6,
          width = 202,
          height = 106,
          frame_count = 24,
          shift = util.mul_shift(util.by_pixel(54, 16), scale),
          direction_count = 1,
          scale = scale,
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/worm/hr-worm-die-01-shadow.png",
            line_length = 6,
            width = 404,
            height = 210,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(54, 16), scale),
            direction_count = 1,
            scale = 0.5 * scale,
            draw_as_shadow = true,
          }
        },
      },
    },
    {
      layers=
      {
        {
          filename = "__base__/graphics/entity/worm/worm-die-02.png",
          line_length = 6,
          width = 184,
          height = 164,
          frame_count = 24,
          shift = util.mul_shift(util.by_pixel(-48, -42), scale),
          direction_count = 1,
          scale = scale,
          hr_version =
          {
            filename = "__base__/graphics/entity/worm/hr-worm-die-02.png",
            line_length = 6,
            width = 362,
            height = 322,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(-47, -41), scale),
            direction_count = 1,
            scale = 0.5 * scale,
          }
        },
        {
          filename = "__base__/graphics/entity/worm/worm-die-02-mask.png",
          flags = { "mask" },
          line_length = 6,
          width = 156,
          height = 144,
          frame_count = 24,
          shift = util.mul_shift(util.by_pixel(-33, -31), scale),
          direction_count = 1,
          scale = scale,
          tint = tint,
          hr_version =
          {
            filename = "__base__/graphics/entity/worm/hr-worm-die-02-mask.png",
            flags = { "mask" },
            line_length = 6,
            width = 306,
            height = 282,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(-33, -31), scale),
            direction_count = 1,
            scale = 0.5 * scale,
            tint = tint,
          }
        },
        {
          filename = "__base__/graphics/entity/worm/worm-die-02-shadow.png",
          line_length = 6,
          width = 296,
          height = 82,
          frame_count = 24,
          shift = util.mul_shift(util.by_pixel(16, 4), scale),
          direction_count = 1,
          scale = scale,
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/worm/hr-worm-die-02-shadow.png",
            line_length = 6,
            width = 588,
            height = 160,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(17, 5), scale),
            direction_count = 1,
            scale = 0.5 * scale,
            draw_as_shadow = true,
          }
        },
      },
    },
    {
      layers=
      {
        {
          filename = "__base__/graphics/entity/worm/worm-die-03.png",
          line_length = 6,
          width = 130,
          height = 164,
          frame_count = 24,
          shift = util.mul_shift(util.by_pixel(16, -48), scale),
          direction_count = 1,
          scale = scale,
          hr_version =
          {
            filename = "__base__/graphics/entity/worm/hr-worm-die-03.png",
            line_length = 6,
            width = 260,
            height = 328,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(16, -48), scale),
            direction_count = 1,
            scale = 0.5 * scale,
          }
        },
        {
          filename = "__base__/graphics/entity/worm/worm-die-03-mask.png",
          flags = { "mask" },
          line_length = 6,
          width = 124,
          height = 136,
          frame_count = 24,
          shift = util.mul_shift(util.by_pixel(14, -34), scale),
          direction_count = 1,
          scale = scale,
          tint = tint,
          hr_version =
          {
            filename = "__base__/graphics/entity/worm/hr-worm-die-03-mask.png",
            flags = { "mask" },
            line_length = 6,
            width = 246,
            height = 272,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(14, -34), scale),
            direction_count = 1,
            scale = 0.5 * scale,
            tint = tint,
          }
        },
        {
          filename = "__base__/graphics/entity/worm/worm-die-03-shadow.png",
          line_length = 6,
          width = 204,
          height = 116,
          frame_count = 24,
          shift = util.mul_shift(util.by_pixel(52, -34), scale),
          direction_count = 1,
          scale = scale,
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/worm/hr-worm-die-03-shadow.png",
            line_length = 6,
            width = 404,
            height = 224,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(53, -32), scale),
            direction_count = 1,
            scale = 0.5 * scale,
            draw_as_shadow = true,
          }
        },
      }
    }
  }
end

function worm_shoot_shiftings(scale, offset)
  return
  {
    {0.0625 *  0, util.add_shift(util.mul_shift(util.by_pixel(  -6, -213), scale * 0.5), util.by_pixel(  offset *    0, -offset *    1))},
    {0.0625 *  1, util.add_shift(util.mul_shift(util.by_pixel(  86, -193), scale * 0.5), util.by_pixel(  offset * 0.38, -offset * 0.92))},
    {0.0625 *  2, util.add_shift(util.mul_shift(util.by_pixel( 136, -155), scale * 0.5), util.by_pixel(  offset * 0.71, -offset * 0.71))},
    {0.0625 *  3, util.add_shift(util.mul_shift(util.by_pixel( 166, -134), scale * 0.5), util.by_pixel(  offset * 0.92, -offset * 0.38))},
    {0.0625 *  4, util.add_shift(util.mul_shift(util.by_pixel( 200,  -75), scale * 0.5), util.by_pixel(  offset *    1,  offset *    0))},
    {0.0625 *  5, util.add_shift(util.mul_shift(util.by_pixel( 168,   13), scale * 0.5), util.by_pixel(  offset * 0.92,  offset * 0.38))},
    {0.0625 *  6, util.add_shift(util.mul_shift(util.by_pixel( 118,   59), scale * 0.5), util.by_pixel(  offset * 0.71,  offset * 0.71))},
    {0.0625 *  7, util.add_shift(util.mul_shift(util.by_pixel(  48,   52), scale * 0.5), util.by_pixel(  offset * 0.38,  offset * 0.92))},
    {0.0625 *  8, util.add_shift(util.mul_shift(util.by_pixel(   4,   68), scale * 0.5), util.by_pixel(  offset *    0,  offset *    1))},
    {0.0625 *  9, util.add_shift(util.mul_shift(util.by_pixel( -58,   91), scale * 0.5), util.by_pixel( -offset * 0.38,  offset * 0.92))},
    {0.0625 * 10, util.add_shift(util.mul_shift(util.by_pixel(-114,   71), scale * 0.5), util.by_pixel( -offset * 0.71,  offset * 0.71))},
    {0.0625 * 11, util.add_shift(util.mul_shift(util.by_pixel(-163,   32), scale * 0.5), util.by_pixel( -offset * 0.92,  offset * 0.38))},
    {0.0625 * 12, util.add_shift(util.mul_shift(util.by_pixel(-220,  -56), scale * 0.5), util.by_pixel( -offset *    1,  offset *    0))},
    {0.0625 * 13, util.add_shift(util.mul_shift(util.by_pixel(-200, -120), scale * 0.5), util.by_pixel( -offset * 0.92, -offset * 0.38))},
    {0.0625 * 14, util.add_shift(util.mul_shift(util.by_pixel(-152, -175), scale * 0.5), util.by_pixel( -offset * 0.71, -offset * 0.71))},
    {0.0625 * 15, util.add_shift(util.mul_shift(util.by_pixel( -67, -204), scale * 0.5), util.by_pixel( -offset * 0.38, -offset * 0.92))}
  }
end

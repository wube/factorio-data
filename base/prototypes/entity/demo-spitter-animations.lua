
function spitterattackanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        filenames =
        {
          "__base__/graphics/entity/spitter/spitter-attack-01.png",
          "__base__/graphics/entity/spitter/spitter-attack-02.png",
          "__base__/graphics/entity/spitter/spitter-attack-03.png",
          "__base__/graphics/entity/spitter/spitter-attack-04.png",
        },
        slice = 7,
        lines_per_file = 8,
        line_length = 7,
        width = 156,
        height = 132,
        frame_count = 14,
        direction_count = 16,
        run_mode = "forward-then-backward",
        animation_speed = 0.4,
        shift = util.mul_shift(util.by_pixel(0, -18), scale),
        scale = scale,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/spitter/hr-spitter-attack-01.png",
            "__base__/graphics/entity/spitter/hr-spitter-attack-02.png",
            "__base__/graphics/entity/spitter/hr-spitter-attack-03.png",
            "__base__/graphics/entity/spitter/hr-spitter-attack-04.png",
          },
          slice = 7,
          lines_per_file = 8,
          line_length = 7,
          width = 312,
          height = 264,
          frame_count = 14,
          shift = util.mul_shift(util.by_pixel(0, -18), scale),
          direction_count = 16,
          run_mode = "forward-then-backward",
          animation_speed = 0.4,
          scale = 0.5 * scale,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/spitter/spitter-attack-mask1-01.png",
          "__base__/graphics/entity/spitter/spitter-attack-mask1-02.png",
          "__base__/graphics/entity/spitter/spitter-attack-mask1-03.png",
          "__base__/graphics/entity/spitter/spitter-attack-mask1-04.png",
        },
        slice = 7,
        lines_per_file = 8,
        flags = { "mask" },
        line_length = 7,
        width = 156,
        height = 126,
        frame_count = 14,
        direction_count = 16,
        run_mode = "forward-then-backward",
        animation_speed = 0.4,
        shift = util.mul_shift(util.by_pixel(0, -14), scale),
        scale = scale,
        tint = tint1,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/spitter/hr-spitter-attack-mask1-01.png",
            "__base__/graphics/entity/spitter/hr-spitter-attack-mask1-02.png",
            "__base__/graphics/entity/spitter/hr-spitter-attack-mask1-03.png",
            "__base__/graphics/entity/spitter/hr-spitter-attack-mask1-04.png",
          },
          slice = 7,
          lines_per_file = 8,
          line_length = 7,
          width = 316,
          height = 246,
          frame_count = 14,
          shift = util.mul_shift(util.by_pixel(-1, -13), scale),
          direction_count = 16,
          run_mode = "forward-then-backward",
          animation_speed = 0.4,
          scale = 0.5 * scale,
          tint = tint1,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/spitter/spitter-attack-mask2-01.png",
          "__base__/graphics/entity/spitter/spitter-attack-mask2-02.png",
          "__base__/graphics/entity/spitter/spitter-attack-mask2-03.png",
          "__base__/graphics/entity/spitter/spitter-attack-mask2-04.png",
        },
        slice = 7,
        lines_per_file = 8,
        flags = { "mask" },
        line_length = 7,
        width = 160,
        height = 124,
        frame_count = 14,
        direction_count = 16,
        run_mode = "forward-then-backward",
        animation_speed = 0.4,
        shift = util.mul_shift(util.by_pixel(-2, -14), scale),
        scale = scale,
        tint = tint2,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/spitter/hr-spitter-attack-mask2-01.png",
            "__base__/graphics/entity/spitter/hr-spitter-attack-mask2-02.png",
            "__base__/graphics/entity/spitter/hr-spitter-attack-mask2-03.png",
            "__base__/graphics/entity/spitter/hr-spitter-attack-mask2-04.png",
          },
          slice = 7,
          lines_per_file = 8,
          line_length = 7,
          width = 310,
          height = 244,
          frame_count = 14,
          shift = util.mul_shift(util.by_pixel(0, -13), scale),
          direction_count = 16,
          run_mode = "forward-then-backward",
          animation_speed = 0.4,
          scale = 0.5 * scale,
          tint = tint2,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/spitter/spitter-attack-shadow-01.png",
          "__base__/graphics/entity/spitter/spitter-attack-shadow-02.png",
          "__base__/graphics/entity/spitter/spitter-attack-shadow-03.png",
          "__base__/graphics/entity/spitter/spitter-attack-shadow-04.png",
        },
        slice = 7,
        lines_per_file = 8,
        line_length = 7,
        width = 188,
        height = 110,
        frame_count = 14,
        shift = util.mul_shift(util.by_pixel(22, 0), scale),
        direction_count = 16,
        run_mode = "forward-then-backward",
        animation_speed = 0.4,
        scale = scale,
        draw_as_shadow = true,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/spitter/hr-spitter-attack-shadow-01.png",
            "__base__/graphics/entity/spitter/hr-spitter-attack-shadow-02.png",
            "__base__/graphics/entity/spitter/hr-spitter-attack-shadow-03.png",
            "__base__/graphics/entity/spitter/hr-spitter-attack-shadow-04.png",
          },
          slice = 7,
          lines_per_file = 8,
          line_length = 7,
          width = 370,
          height = 224,
          frame_count = 14,
          shift = util.mul_shift(util.by_pixel(23, -1), scale),
          direction_count = 16,
          run_mode = "forward-then-backward",
          animation_speed = 0.4,
          scale = 0.5 * scale,
          draw_as_shadow = true,
        }
      },
    }
  }
end

spitter_alternative_attacking_animation_sequence =
{
  warmup_frame_sequence = { 1, 2, 3, 4, 5, 6 },
  warmup2_frame_sequence = { 7, 7, 7, 7, 7, 7 },
  attacking_frame_sequence = { 7, 8, 9, 10, 11,  12, 13, 14, 13, 14,  13, 12, 11, 10, 9,  8 },
  cooldown_frame_sequence = { 7 },
  prepared_frame_sequence = { 7 },
  back_to_walk_frame_sequence = { 6, 5, 4, 3, 2, 1 },

  warmup_animation_speed = 1 / 6 * 0.4,
  attacking_animation_speed = 1 / 16 * 0.4,
  cooldown_animation_speed = 1 / 1 * 0.4 * 0.125,
  prepared_animation_speed = 1 / 1 * 0.5 * 0.4,
  back_to_walk_animation_speed = 1 / 6 * 0.4,
}

function spitterrunanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        filenames =
        {
          "__base__/graphics/entity/spitter/spitter-run-01.png",
          "__base__/graphics/entity/spitter/spitter-run-02.png",
          "__base__/graphics/entity/spitter/spitter-run-03.png",
          "__base__/graphics/entity/spitter/spitter-run-04.png",
        },
        slice = 8,
        lines_per_file = 8,
        line_length = 8,
        width = 124,
        height = 110,
        frame_count = 16,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(0, -12), scale),
        scale = scale,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/spitter/hr-spitter-run-01.png",
            "__base__/graphics/entity/spitter/hr-spitter-run-02.png",
            "__base__/graphics/entity/spitter/hr-spitter-run-03.png",
            "__base__/graphics/entity/spitter/hr-spitter-run-04.png",
          },
          slice = 8,
          lines_per_file = 8,
          line_length = 8,
          width = 248,
          height = 220,
          frame_count = 16,
          shift = util.mul_shift(util.by_pixel(0, -12), scale),
          direction_count = 16,
          scale = 0.5 * scale,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/spitter/spitter-run-mask1-01.png",
          "__base__/graphics/entity/spitter/spitter-run-mask1-02.png",
          "__base__/graphics/entity/spitter/spitter-run-mask1-03.png",
          "__base__/graphics/entity/spitter/spitter-run-mask1-04.png",
        },
        slice = 8,
        lines_per_file = 8,
        flags = { "mask" },
        line_length = 8,
        width = 124,
        height = 100,
        frame_count = 16,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(0, -18), scale),
        scale = scale,
        tint = tint1,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/spitter/hr-spitter-run-mask1-01.png",
            "__base__/graphics/entity/spitter/hr-spitter-run-mask1-02.png",
            "__base__/graphics/entity/spitter/hr-spitter-run-mask1-03.png",
            "__base__/graphics/entity/spitter/hr-spitter-run-mask1-04.png",
          },
          slice = 8,
          lines_per_file = 8,
          line_length = 8,
          width = 248,
          height = 194,
          frame_count = 16,
          shift = util.mul_shift(util.by_pixel(0, -17), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          tint = tint1,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/spitter/spitter-run-mask2-01.png",
          "__base__/graphics/entity/spitter/spitter-run-mask2-02.png",
          "__base__/graphics/entity/spitter/spitter-run-mask2-03.png",
          "__base__/graphics/entity/spitter/spitter-run-mask2-04.png",
        },
        slice = 8,
        lines_per_file = 8,
        flags = { "mask" },
        line_length = 8,
        width = 124,
        height = 98,
        frame_count = 16,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(0, -18), scale),
        scale = scale,
        tint = tint2,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/spitter/hr-spitter-run-mask2-01.png",
            "__base__/graphics/entity/spitter/hr-spitter-run-mask2-02.png",
            "__base__/graphics/entity/spitter/hr-spitter-run-mask2-03.png",
            "__base__/graphics/entity/spitter/hr-spitter-run-mask2-04.png",
          },
          slice = 8,
          lines_per_file = 8,
          line_length = 8,
          width = 252,
          height = 196,
          frame_count = 16,
          shift = util.mul_shift(util.by_pixel(-1, -18), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          tint = tint2,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/spitter/spitter-run-shadow-01.png",
          "__base__/graphics/entity/spitter/spitter-run-shadow-02.png",
          "__base__/graphics/entity/spitter/spitter-run-shadow-03.png",
          "__base__/graphics/entity/spitter/spitter-run-shadow-04.png",
        },
        slice = 8,
        lines_per_file = 8,
        line_length = 8,
        width = 154,
        height = 88,
        frame_count = 16,
        shift = util.mul_shift(util.by_pixel(16, 0), scale),
        direction_count = 16,
        scale = scale,
        draw_as_shadow = true,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/spitter/hr-spitter-run-shadow-01.png",
            "__base__/graphics/entity/spitter/hr-spitter-run-shadow-02.png",
            "__base__/graphics/entity/spitter/hr-spitter-run-shadow-03.png",
            "__base__/graphics/entity/spitter/hr-spitter-run-shadow-04.png",
          },
          slice = 8,
          lines_per_file = 8,
          line_length = 8,
          width = 306,
          height = 180,
          frame_count = 16,
          shift = util.mul_shift(util.by_pixel(16, -1), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          draw_as_shadow = true,
        }
      }
    }
  }
end

function spitterdyinganimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        filenames =
        {
          "__base__/graphics/entity/spitter/spitter-die-01.png",
          "__base__/graphics/entity/spitter/spitter-die-02.png",
          "__base__/graphics/entity/spitter/spitter-die-03.png",
          "__base__/graphics/entity/spitter/spitter-die-04.png",
        },
        slice = 7,
        lines_per_file = 8,
        line_length = 7,
        width = 142,
        height = 128,
        frame_count = 14,
        direction_count = 16,
        shift= util.mul_shift(util.by_pixel(0, -16), scale),
        scale = scale,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/spitter/hr-spitter-die-01.png",
            "__base__/graphics/entity/spitter/hr-spitter-die-02.png",
            "__base__/graphics/entity/spitter/hr-spitter-die-03.png",
            "__base__/graphics/entity/spitter/hr-spitter-die-04.png",
          },
          slice = 7,
          lines_per_file = 8,
          line_length = 7,
          width = 282,
          height = 254,
          frame_count = 14,
          shift = util.mul_shift(util.by_pixel(0, -15), scale),
          direction_count = 16,
          scale = 0.5 * scale,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/spitter/spitter-die-mask1-01.png",
          "__base__/graphics/entity/spitter/spitter-die-mask1-02.png",
          "__base__/graphics/entity/spitter/spitter-die-mask1-03.png",
          "__base__/graphics/entity/spitter/spitter-die-mask1-04.png",
        },
        slice = 7,
        lines_per_file = 8,
        flags = { "mask" },
        line_length = 7,
        width = 130,
        height = 114,
        frame_count = 14,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(0, -16), scale),
        scale = scale,
        tint = tint1,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/spitter/hr-spitter-die-mask1-01.png",
            "__base__/graphics/entity/spitter/hr-spitter-die-mask1-02.png",
            "__base__/graphics/entity/spitter/hr-spitter-die-mask1-03.png",
            "__base__/graphics/entity/spitter/hr-spitter-die-mask1-04.png",
          },
          slice = 7,
          lines_per_file = 8,
          line_length = 7,
          width = 258,
          height = 228,
          frame_count = 14,
          shift = util.mul_shift(util.by_pixel(0, -16), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          tint = tint1,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/spitter/spitter-die-mask2-01.png",
          "__base__/graphics/entity/spitter/spitter-die-mask2-02.png",
          "__base__/graphics/entity/spitter/spitter-die-mask2-03.png",
          "__base__/graphics/entity/spitter/spitter-die-mask2-04.png",
        },
        slice = 7,
        lines_per_file = 8,
        flags = { "mask" },
        line_length = 7,
        width = 128,
        height = 114,
        frame_count = 14,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(0, -16), scale),
        scale = scale,
        tint = tint2,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/spitter/hr-spitter-die-mask2-01.png",
            "__base__/graphics/entity/spitter/hr-spitter-die-mask2-02.png",
            "__base__/graphics/entity/spitter/hr-spitter-die-mask2-03.png",
            "__base__/graphics/entity/spitter/hr-spitter-die-mask2-04.png",
          },
          slice = 7,
          lines_per_file = 8,
          line_length = 7,
          width = 260,
          height = 228,
          frame_count = 14,
          shift = util.mul_shift(util.by_pixel(-1, -16), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          tint = tint2,
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/spitter/spitter-die-shadow-01.png",
          "__base__/graphics/entity/spitter/spitter-die-shadow-02.png",
          "__base__/graphics/entity/spitter/spitter-die-shadow-03.png",
          "__base__/graphics/entity/spitter/spitter-die-shadow-04.png",
        },
        slice = 7,
        lines_per_file = 8,
        line_length = 7,
        width = 180,
        height = 104,
        frame_count = 14,
        shift = util.mul_shift(util.by_pixel(18, -2), scale),
        direction_count = 16,
        scale = scale,
        draw_as_shadow = true,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/spitter/hr-spitter-die-shadow-01.png",
            "__base__/graphics/entity/spitter/hr-spitter-die-shadow-02.png",
            "__base__/graphics/entity/spitter/hr-spitter-die-shadow-03.png",
            "__base__/graphics/entity/spitter/hr-spitter-die-shadow-04.png",
          },
          slice = 7,
          lines_per_file = 8,
          line_length = 7,
          width = 356,
          height = 204,
          frame_count = 14,
          shift = util.mul_shift(util.by_pixel(19, -1), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          draw_as_shadow = true,
        }
      },
    }
  }
end

function add_spitter_die_animation(scale, tint1, tint2, corpse)
  corpse.animation = spitterdyinganimation(scale, tint1, tint2)
  corpse.dying_speed = 0.04
  corpse.time_before_removed = 15 * 60 * 60
  corpse.direction_shuffle = { { 1, 2, 3, 16 }, { 4, 5, 6, 7 }, { 8, 9, 10, 11 }, { 12, 13, 14, 15 } }
  corpse.shuffle_directions_at_frame = 4
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

function spitter_water_reflection(scale)
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/spitter/spitter-reflection.png",
      priority = "extra-high",
      width = 20,
      height = 32,
      shift = util.by_pixel(5, 15),
      scale = 5 * scale,
      variation_count = 1,
    },
    rotate = true,
    orientation_to_variation = false
  }
end

function spitter_shoot_shiftings(scale, offset)
  return
  {
    {0.0625 *  0, util.add_shift(util.mul_shift(util.by_pixel(   0, -135), scale * 0.5), util.by_pixel(  offset *    0, -offset *    1))},
    {0.0625 *  1, util.add_shift(util.mul_shift(util.by_pixel(  24, -133), scale * 0.5), util.by_pixel(  offset * 0.38, -offset * 0.92))},
    {0.0625 *  2, util.add_shift(util.mul_shift(util.by_pixel(  48, -121), scale * 0.5), util.by_pixel(  offset * 0.71, -offset * 0.71))},
    {0.0625 *  3, util.add_shift(util.mul_shift(util.by_pixel(  76, -105), scale * 0.5), util.by_pixel(  offset * 0.92, -offset * 0.38))},
    {0.0625 *  4, util.add_shift(util.mul_shift(util.by_pixel(  86,  -73), scale * 0.5), util.by_pixel(  offset *    1,  offset *    0))},
    {0.0625 *  5, util.add_shift(util.mul_shift(util.by_pixel(  74,  -43), scale * 0.5), util.by_pixel(  offset * 0.92,  offset * 0.38))},
    {0.0625 *  6, util.add_shift(util.mul_shift(util.by_pixel(  52,  -25), scale * 0.5), util.by_pixel(  offset * 0.71,  offset * 0.71))},
    {0.0625 *  7, util.add_shift(util.mul_shift(util.by_pixel(  26,  -17), scale * 0.5), util.by_pixel(  offset * 0.38,  offset * 0.92))},
    {0.0625 *  8, util.add_shift(util.mul_shift(util.by_pixel(   1,  -13), scale * 0.5), util.by_pixel(  offset *    0,  offset *    1))},
    {0.0625 *  9, util.add_shift(util.mul_shift(util.by_pixel( -27,  -16), scale * 0.5), util.by_pixel( -offset * 0.38,  offset * 0.92))},
    {0.0625 * 10, util.add_shift(util.mul_shift(util.by_pixel( -51,  -23), scale * 0.5), util.by_pixel( -offset * 0.71,  offset * 0.71))},
    {0.0625 * 11, util.add_shift(util.mul_shift(util.by_pixel( -71,  -41), scale * 0.5), util.by_pixel( -offset * 0.92,  offset * 0.38))},
    {0.0625 * 12, util.add_shift(util.mul_shift(util.by_pixel( -85,  -71), scale * 0.5), util.by_pixel( -offset *    1,  offset *    0))},
    {0.0625 * 13, util.add_shift(util.mul_shift(util.by_pixel( -71, -103), scale * 0.5), util.by_pixel( -offset * 0.92, -offset * 0.38))},
    {0.0625 * 14, util.add_shift(util.mul_shift(util.by_pixel( -49, -119), scale * 0.5), util.by_pixel( -offset * 0.71, -offset * 0.71))},
    {0.0625 * 15, util.add_shift(util.mul_shift(util.by_pixel( -23, -125), scale * 0.5), util.by_pixel( -offset * 0.38, -offset * 0.92))}
  }
end

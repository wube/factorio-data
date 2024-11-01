
function spitterattackanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      util.sprite_load("__base__/graphics/entity/spitter/spitter-attack",
        {
          slice = 6,
          frame_count = 14,
          direction_count = 16,
          scale = scale * 0.5,
          run_mode = "forward-then-backward",
          animation_speed = 0.4,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/spitter/spitter-attack-mask1",
        {
          slice = 6,
          frame_count = 14,
          direction_count = 16,
          scale = scale * 0.5,
          run_mode = "forward-then-backward",
          animation_speed = 0.4,
          tint = tint1,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/spitter/spitter-attack-mask2",
        {
          slice = 6,
          frame_count = 14,
          direction_count = 16,
          scale = scale * 0.5,
          run_mode = "forward-then-backward",
          animation_speed = 0.4,
          tint = tint2,
          tint_as_overlay = true,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/spitter/spitter-attack-shadow",
        {
          slice = 6,
          frame_count = 14,
          direction_count = 16,
          scale = scale * 0.5,
          run_mode = "forward-then-backward",
          animation_speed = 0.4,
          draw_as_shadow = true,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      )
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
  back_to_walk_animation_speed = 1 / 6 * 0.4
}

function spitterrunanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      util.sprite_load("__base__/graphics/entity/spitter/spitter-run",
        {
          slice = 6,
          frame_count = 16,
          direction_count = 16,
          scale = scale * 0.5,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/spitter/spitter-run-mask1",
        {
          slice = 6,
          frame_count = 16,
          direction_count = 16,
          scale = scale * 0.5,
          flags = { "mask" },
          tint = tint1,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/spitter/spitter-run-mask2",
        {
          slice = 6,
          frame_count = 16,
          direction_count = 16,
          scale = scale * 0.5,
          flags = { "mask" },
          tint = tint2,
          tint_as_overlay = true,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/spitter/spitter-run-shadow",
        {
          slice = 6,
          frame_count = 16,
          direction_count = 16,
          scale = scale * 0.5,
          draw_as_shadow = true,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      )
    }
  }
end

function spitterdyinganimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      util.sprite_load("__base__/graphics/entity/spitter/spitter-die",
        {
          slice = 6,
          frame_count = 15,
          direction_count = 16,
          scale = scale * 0.5,
          multiply_shift = scale,
          flags = {"corpse-decay"},
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/spitter/spitter-die-mask1",
        {
          slice = 6,
          frame_count = 15,
          direction_count = 16,
          scale = scale * 0.5,
          tint = tint1,
          multiply_shift = scale,
          flags = {"corpse-decay"},
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/spitter/spitter-die-mask2",
        {
          slice = 6,
          frame_count = 15,
          direction_count = 16,
          scale = scale * 0.5,
          tint = tint2,
          tint_as_overlay = true,
          multiply_shift = scale,
          flags = {"corpse-decay"},
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/spitter/spitter-die-shadow",
        {
          slice = 6,
          frame_count = 15,
          direction_count = 16,
          scale = scale * 0.5,
          draw_as_shadow = true,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      )
    }
  }
end

function spitter_decay_animation(scale, tint1, tint2)
  return
  {

    layers=
    {
      util.sprite_load("__base__/graphics/entity/spitter/spitter-decay",
        {
          slice = 6,
          frame_count = 24,
          direction_count = 16,
          scale = scale * 0.5,
          multiply_shift = scale,
          flags = {"corpse-decay"},
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "corpse-decay"
        }
      ),
      util.sprite_load("__base__/graphics/entity/spitter/spitter-decay-mask1",
        {
          slice = 6,
          frame_count = 24,
          direction_count = 16,
          scale = scale * 0.5,
          tint = tint1,
          multiply_shift = scale,
          flags = {"corpse-decay"},
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "corpse-decay"
        }
      ),
      util.sprite_load("__base__/graphics/entity/spitter/spitter-decay-mask2",
        {
          slice = 6,
          frame_count = 24,
          direction_count = 16,
          scale = scale * 0.5,
          tint = tint2,
          tint_as_overlay = true,
          multiply_shift = scale,
          flags = {"corpse-decay"},
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "corpse-decay"
        }
      ),
      util.sprite_load("__base__/graphics/entity/spitter/spitter-decay-shadow",
        {
          slice = 6,
          frame_count = 24,
          direction_count = 16,
          scale = scale * 0.5,
          draw_as_shadow = true,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "corpse-decay"
        }
      ),
    }
  }
end

function add_spitter_die_animation(scale, tint1, tint2, corpse)
  corpse.animation = spitterdyinganimation(scale, tint1, tint2)
  corpse.decay_animation = spitter_decay_animation(scale, tint1, tint2)
  corpse.decay_frame_transition_duration = 6 * 60
  corpse.use_decay_layer = true
  corpse.dying_speed = (1 / 25) * (0.27 + 0.1 / scale)
  corpse.time_before_removed = 15 * 60 * 60
  corpse.direction_shuffle = { { 1, 2, 3, 16 }, { 4, 5, 6, 7 }, { 8, 9, 10, 11 }, { 12, 13, 14, 15 } }
  corpse.shuffle_directions_at_frame = 0
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
      util.sprite_load("__base__/graphics/entity/biter/blood-puddle-var-main",
        {
          flags = { "low-object" },
          variation_count = 4,
          scale = scale * 0.5,
          tint = {r = 0.6 * d * a, g = 0.1 * d * a, b = 0.6 * d * a, a = a},
          multiply_shift = scale,
          allow_forced_downscale = true,
        }
      )

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

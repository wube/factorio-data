require ("util")

function biterrunanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      util.sprite_load("__base__/graphics/entity/biter/biter-run",
        {
          slice = 8,
          frame_count = 16,
          direction_count = 16,
          scale = scale * 0.5,
          multiply_shift = scale,
          surface = "nauvis",
          usage = "enemy",
        }
      ),
      util.sprite_load("__base__/graphics/entity/biter/biter-run-mask1",
        {
          slice = 8,
          frame_count = 16,
          direction_count = 16,
          flags = { "mask" },
          tint = tint1,
          scale = scale * 0.5,
          multiply_shift = scale,
          surface = "nauvis",
          usage = "enemy",
        }
      ),
      util.sprite_load("__base__/graphics/entity/biter/biter-run-mask2",
        {
          slice = 8,
          frame_count = 16,
          direction_count = 16,
          flags = { "mask" },
          tint = tint2,
          tint_as_overlay = true,
          scale = scale * 0.5,
          multiply_shift = scale,
          surface = "nauvis",
          usage = "enemy",
        }
      ),
      util.sprite_load("__base__/graphics/entity/biter/biter-run-shadow",
        {
          slice = 8,
          frame_count = 16,
          direction_count = 16,
          draw_as_shadow = true,
          scale = scale * 0.5,
          multiply_shift = scale,
          surface = "nauvis",
          usage = "enemy",
        }
      )
    }
  }
end

function biterattackanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      util.sprite_load("__base__/graphics/entity/biter/biter-attack",
        {
          slice = 11,
          frame_count = 11,
          direction_count = 16,
          scale = scale * 0.5,
          animation_speed = 0.4,
          multiply_shift = scale,
          surface = "nauvis",
          usage = "enemy",
        }
      ),
      util.sprite_load("__base__/graphics/entity/biter/biter-attack-mask1",
        {
          slice = 11,
          frame_count = 11,
          direction_count = 16,
          scale = scale * 0.5,
          tint = tint1,
          animation_speed = 0.4,
          multiply_shift = scale,
          surface = "nauvis",
          usage = "enemy",
        }
      ),
      util.sprite_load("__base__/graphics/entity/biter/biter-attack-mask2",
        {
          slice = 11,
          frame_count = 11,
          direction_count = 16,
          scale = scale * 0.5,
          tint = tint2,
          tint_as_overlay = true,
          animation_speed = 0.4,
          multiply_shift = scale,
          surface = "nauvis",
          usage = "enemy",
        }
      ),
      util.sprite_load("__base__/graphics/entity/biter/biter-attack-shadow",
        {
          slice = 11,
          frame_count = 11,
          direction_count = 16,
          scale = scale * 0.5,
          draw_as_shadow = true,
          animation_speed = 0.4,
          multiply_shift = scale,
          surface = "nauvis",
          usage = "enemy",
        }
      )
    }
  }
end

function biterdieanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      util.sprite_load("__base__/graphics/entity/biter/biter-die",
        {
          slice = 8,
          frame_count = 17,
          direction_count = 16,
          scale = scale * 0.5,
          multiply_shift = scale,
          flags = {"corpse-decay"},
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/biter/biter-die-mask1",
        {
          slice = 8,
          frame_count = 17,
          direction_count = 16,
          scale = scale * 0.5,
          tint = tint1,
          multiply_shift = scale,
          flags = {"corpse-decay"},
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/biter/biter-die-mask2",
        {
          slice = 8,
          frame_count = 17,
          direction_count = 16,
          scale = scale * 0.5,
          tint = tint2,
          tint_as_overlay = true,
          multiply_shift = scale,
          flags = {"corpse-decay"},
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/biter/biter-die-shadow",
        {
          slice = 6,
          frame_count = 17,
          direction_count = 16,
          scale = scale * 0.5,
          draw_as_shadow = true,
          multiply_shift = scale,
          surface = "nauvis",
          usage = "enemy"
        }
      )
    }
  }
end

function biter_decay_animation(scale, tint1, tint2)
  return
  {
    layers=
    {
      util.sprite_load("__base__/graphics/entity/biter/biter-decay",
        {
          slice = 7,
          frame_count = 24,
          direction_count = 16,
          scale = scale * 0.5,
          multiply_shift = scale,
          flags = {"corpse-decay"},
          surface = "nauvis",
          usage = "corpse-decay"
        }
      ),
      util.sprite_load("__base__/graphics/entity/biter/biter-decay-mask1",
        {
          slice = 8,
          frame_count = 24,
          direction_count = 16,
          scale = scale * 0.5,
          tint = tint1,
          multiply_shift = scale,
          flags = {"corpse-decay"},
          surface = "nauvis",
          usage = "corpse-decay"
        }
      ),
      util.sprite_load("__base__/graphics/entity/biter/biter-decay-mask2",
        {
          slice = 8,
          frame_count = 24,
          direction_count = 16,
          scale = scale * 0.5,
          tint = tint2,
          tint_as_overlay = true,
          multiply_shift = scale,
          flags = {"corpse-decay"},
          surface = "nauvis",
          usage = "corpse-decay"
        }
      ),
      util.sprite_load("__base__/graphics/entity/biter/biter-decay-shadow",
        {
          slice = 8,
          frame_count = 24,
          direction_count = 16,
          scale = scale * 0.5,
          draw_as_shadow = true,
          multiply_shift = scale,
          surface = "nauvis",
          usage = "corpse-decay"
        }
      )
    }
  }
end

function add_biter_die_animation(scale, tint1, tint2, corpse)
  corpse.animation = biterdieanimation(scale, tint1, tint2)
  corpse.decay_animation = biter_decay_animation(scale, tint1, tint2)
  corpse.decay_frame_transition_duration = 6 * 60
  corpse.use_decay_layer = true
  corpse.dying_speed = (1 / 25) * (0.25 + 0.1 / scale)
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
        }
      )

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

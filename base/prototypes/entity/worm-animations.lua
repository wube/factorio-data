function worm_integration_impl(scale, skip_frames, use_frames, skip_animation)
  local frame_sequence = {}
  for i = 1, use_frames do
    frame_sequence[i] = i + skip_frames
  end

  local params =
  {
    scale = scale * 0.5,
    multiply_shift = scale,
  }

  if not skip_animation then
    params.variation_count = 1
    params.frame_count = 25
    params.frame_sequence = frame_sequence
  end

  params.surface = "nauvis"
  params.usage = "enemy"
  params.allow_forced_downscale = true


  local result = util.sprite_load("__base__/graphics/entity/worm/worm-hole-collapse", params)
  if skip_animation then result.line_length = nil end

  return result;
end

function worm_integration(scale, skip_animation)
  return worm_integration_impl(scale, 0, 1, skip_animation)
end

function worm_integration_decay(scale)
  return worm_integration_impl(scale, 1, 24)
end

function worm_folded_animation(scale, tint)
  return
  {
    layers=
    {
      util.sprite_load("__base__/graphics/entity/worm/worm-folded",
        {
          frame_count = 9,
          direction_count = 1,
          scale = scale * 0.5,
          run_mode = "forward-then-backward",
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/worm/worm-folded-mask",
        {
          frame_count = 9,
          direction_count = 1,
          scale = scale * 0.5,
          run_mode = "forward-then-backward",
          tint=tint,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/worm/worm-folded-shadow",
        {
          frame_count = 9,
          direction_count = 1,
          scale = scale * 0.5,
          run_mode = "forward-then-backward",
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

function worm_preparing_animation(scale, tint, run_mode)
  return
  {
    layers=
    {
      util.sprite_load("__base__/graphics/entity/worm/worm-preparing",
        {
          frame_count = 18,
          direction_count = 1,
          scale = scale * 0.5,
          run_mode = run_mode,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/worm/worm-preparing-mask",
        {
          frame_count = 18,
          direction_count = 1,
          scale = scale * 0.5,
          run_mode = run_mode,
          flags = { "mask" },
          tint = tint,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/worm/worm-preparing-shadow",
        {
          frame_count = 18,
          direction_count = 1,
          scale = scale * 0.5,
          run_mode = run_mode,
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

function worm_prepared_animation(scale, tint)
  return
  {
    layers=
    {
      util.sprite_load("__base__/graphics/entity/worm/worm-prepared",
        {
          frame_count = 9,
          direction_count = 1,
          scale = scale * 0.5,
          run_mode = "forward-then-backward",
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/worm/worm-prepared-mask",
        {
          frame_count = 9,
          direction_count = 1,
          scale = scale * 0.5,
          run_mode = "forward-then-backward",
          tint = tint,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/worm/worm-prepared-shadow",
        {
          frame_count = 9,
          direction_count = 1,
          scale = scale * 0.5,
          run_mode = "forward-then-backward",
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
      util.sprite_load("__base__/graphics/entity/worm/worm-prepared-alternative",
        {
          direction_count = 1,
          scale = scale * 0.5,
          frame_count = 17,
          frame_sequence = alternate_frame_sequence,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/worm/worm-prepared-alternative-mask",
        {
          direction_count = 1,
          scale = scale * 0.5,
          frame_sequence = alternate_frame_sequence,
          frame_count = 17,
          flags = { "mask" },
          tint = tint,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/worm/worm-prepared-alternative-shadow",
        {
          direction_count = 1,
          scale = scale * 0.5,
          frame_sequence = alternate_frame_sequence,
          frame_count = 17,
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

start_attack_frame_sequence = { 1, 2, 3, 4, 5, 6, 7, 8, 9}

function worm_start_attack_animation(scale, tint)
  return
  {
    layers=
    {
      util.sprite_load("__base__/graphics/entity/worm/worm-attack",
        {
          slice = 4,
          frame_count = 10,
          direction_count = 16,
          scale = scale * 0.5,
          frame_sequence = start_attack_frame_sequence,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/worm/worm-attack-mask",
        {
          slice = 4,
          frame_count = 10,
          direction_count = 16,
          scale = scale * 0.5,
          frame_sequence = start_attack_frame_sequence,
          tint = tint,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/worm/worm-attack-shadow",
        {
          slice = 4,
          frame_count = 10,
          direction_count = 16,
          scale = scale * 0.5,
          frame_sequence = start_attack_frame_sequence,
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

end_attack_frame_sequence = { 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1}

function worm_end_attack_animation(scale, tint)
  return
  {
    layers=
    {
      util.sprite_load("__base__/graphics/entity/worm/worm-attack",
        {
          slice = 4,
          frame_count = 10,
          direction_count = 16,
          scale = scale * 0.5,
          frame_sequence = end_attack_frame_sequence,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/worm/worm-attack-mask",
        {
          slice = 4,
          frame_count = 10,
          direction_count = 16,
          scale = scale * 0.5,
          frame_sequence = end_attack_frame_sequence,
          tint = tint,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/worm/worm-attack-shadow",
        {
          slice = 4,
          frame_count = 10,
          direction_count = 16,
          scale = scale * 0.5,
          frame_sequence = end_attack_frame_sequence,
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

local function dead_worm_animation (path, scale, tint, frame_count, usage)
  local shadow = nil
  if string.find(path, "decay") == false then
    shadow = util.sprite_load(path .. "-shadow",
    {
      frame_count = frame_count,
      direction_count = 1,
      scale = scale * 0.5,
      draw_as_shadow = true,
      multiply_shift = scale,
      surface = "nauvis",
      usage = usage or "enemy"
    }
  )
  end

  return
  {
    util.sprite_load( path ,
      {
        frame_count = frame_count,
        direction_count = 1,
        scale = scale * 0.5,
        multiply_shift = scale,
        flags = {"corpse-decay"},
        allow_forced_downscale = true,
        surface = "nauvis",
        usage = usage or "enemy"
      }
    ),
    util.sprite_load( path .. "-mask",
      {
        frame_count = frame_count,
        direction_count = 1,
        scale = scale * 0.5,
        tint = tint,
        multiply_shift = scale,
        flags = {"corpse-decay"},
        allow_forced_downscale = true,
        surface = "nauvis",
        usage = usage or "enemy"
      }
    ),
    shadow
  }
end

function worm_die_animation(scale, tint)
  return
  {
    {
      layers = dead_worm_animation("__base__/graphics/entity/worm/worm-die-01", scale, tint, 24)
    },
    {
      layers = dead_worm_animation("__base__/graphics/entity/worm/worm-die-02", scale, tint, 24)
    },
    {
      layers = dead_worm_animation("__base__/graphics/entity/worm/worm-die-03", scale, tint, 24)
    }
  }
end
function worm_die_burrowed_animation(scale, tint)
  return
  {
    {
      layers = dead_worm_animation("__base__/graphics/entity/worm/worm-die-burrowed-01", scale, tint, 24)
    },
    {
      layers = dead_worm_animation("__base__/graphics/entity/worm/worm-die-burrowed-02", scale, tint, 24)
    },
    {
      layers = dead_worm_animation("__base__/graphics/entity/worm/worm-die-burrowed-03", scale, tint, 24)
    }
  }
end
function worm_decay_animation(scale, tint)
  return
  {
    {
      layers = dead_worm_animation("__base__/graphics/entity/worm/worm-decay-01", scale, tint, 24, "corpse-decay")
    },
    {
      layers = dead_worm_animation("__base__/graphics/entity/worm/worm-decay-02", scale, tint, 24, "corpse-decay")
    },
    {
      layers = dead_worm_animation("__base__/graphics/entity/worm/worm-decay-03", scale, tint, 24, "corpse-decay")
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

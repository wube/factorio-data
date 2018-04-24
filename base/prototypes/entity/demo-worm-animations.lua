
function worm_folded_animation(scale, tint)
  return
  {
    layers=
    {
      {
        filename = "__base__/graphics/entity/worm/worm-folded.png",
        run_mode = "forward-then-backward",
        line_length = 5,
        width = 143,
        height = 104,
        frame_count = 5,
        shift = {scale * 0.09375, scale * -0.046875},
        direction_count = 1,
        scale = scale
      },
      {
        filename = "__base__/graphics/entity/worm/worm-folded-mask.png",
        run_mode = "forward-then-backward",
        line_length = 5,
        width = 60,
        height = 51,
        frame_count = 5,
        shift = {scale * 0.078125, scale * -0.09375},
        scale = scale,
        direction_count = 1,
        tint = tint
      }
    }
  }
end

function worm_preparing_animation(scale, tint, run_mode)
  return
  {
    layers=
    {
      {
        width = 208,
        height = 148,
        line_length = 13,
        frame_count = 26,
        shift = {scale * 1.10938, scale * -0.734375},
        run_mode = run_mode,
        scale = scale,
        direction_count = 1,
        stripes =
        {
         {
          filename = "__base__/graphics/entity/worm/worm-preparing-01.png",
          width_in_frames = 7,
          height_in_frames = 2,
         },
         {
          filename = "__base__/graphics/entity/worm/worm-preparing-02.png",
          width_in_frames = 6,
          height_in_frames = 2,
         }
        }
      },
      {
        filename = "__base__/graphics/entity/worm/worm-preparing-mask.png",
        line_length = 13,
        width = 98,
        height = 121,
        frame_count = 26,
        shift = {scale * 0.171875, scale * -1.15625},
        run_mode = run_mode,
        scale = scale,
        direction_count = 1,
        tint = tint
      }
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
        line_length = 10,
        width = 190,
        height = 156,
        frame_count = 10,
        scale = scale,
        direction_count = 1,
        shift = {scale * 0.828125, scale * -0.890625},
      },
      {
        filename = "__base__/graphics/entity/worm/worm-prepared-mask.png",
        run_mode = "forward-then-backward",
        line_length = 10,
        width = 80,
        height = 129,
        frame_count = 10,
        shift = {scale * 0.078125, scale * -1.28125},
        scale = scale,
        direction_count = 1,
        tint = tint
      },
    }
  }
end

function worm_attack_animation(scale, tint, run_mode)
  return
  {
    layers=
    {
      {
        width = 248,
        height = 196,
        frame_count = 8,
        direction_count = 16,
        shift = {scale * 0.953125, scale * -0.671875},
        scale = scale,
        run_mode = run_mode,
        stripes =
        {
         {
          filename = "__base__/graphics/entity/worm/worm-attack-01.png",
          width_in_frames = 8,
          height_in_frames = 8,
         },
         {
          filename = "__base__/graphics/entity/worm/worm-attack-02.png",
          width_in_frames = 8,
          height_in_frames = 8,
         }
        }
      },
      {
        width = 168,
        height = 153,
        frame_count = 8,
        direction_count = 16,
        shift = {scale * 0.078125, scale * -1.125},
        scale = scale,
        tint = tint,
        run_mode = run_mode,
        stripes =
        {
         {
          filename = "__base__/graphics/entity/worm/worm-attack-mask-01.png",
          width_in_frames = 8,
          height_in_frames = 8,
         },
         {
          filename = "__base__/graphics/entity//worm/worm-attack-mask-02.png",
          width_in_frames = 8,
          height_in_frames = 8,
         }
        }
      }
    }
  }
end

function worm_die_animation(scale, tint)
  return
  {
    layers=
    {
      {
        filename = "__base__/graphics/entity/worm/worm-die.png",
        line_length = 6,
        width = 198,
        height = 171,
        frame_count = 24,
        shift = {scale * 0.953125, scale * -0.625},
        direction_count = 1,
        scale = scale
      },
      {
        filename = "__base__/graphics/entity/worm/worm-die-mask.png",
        line_length = 6,
        width = 143,
        height = 133,
        frame_count = 24,
        shift = {scale * 0.5625, scale * -1.21875},
        direction_count = 1,
        scale = scale,
        tint = tint
      }
    }
  }
end

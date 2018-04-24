
function spitterattackanimation(scale, tint)
  return
  {
    layers =
    {
      {
        width = 199,
        height = 164,
        frame_count = 22,
        direction_count = 16,
        scale=scale,
        shift = {scale * 0.765625, scale * 0.0625},
        animation_speed = 0.4,
        stripes =
        {
          {
            filename = "__base__/graphics/entity/spitter/spitter-attack-1.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-attack-2.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-attack-3.png",
            width_in_frames = 6,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-attack-4.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-attack-5.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-attack-6.png",
            width_in_frames = 6,
            height_in_frames = 8
          }
        }
      },
      {
        width = 108,
        height = 90,
        frame_count = 22,
        direction_count = 16,
        shift = {scale * 0, scale * -0.625},
        scale = scale,
        tint = tint,
        animation_speed = 0.4,
        stripes =
        {
          {
            filename = "__base__/graphics/entity/spitter/spitter-attack-mask-1.png",
            width_in_frames = 11,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-attack-mask-2.png",
            width_in_frames = 11,
            height_in_frames = 16
          }
        }
      }
    }
  }
end

function spitterrunanimation(scale, tint)
  return
  {
    layers =
    {
      {
        width = 193,
        height = 164,
        priority="very-low",
        frame_count = 24,
        direction_count = 16,
        shift = {scale * 1.01562, 0},
        scale = scale,
        still_frame = 4,
        stripes =
        {
          {
            filename = "__base__/graphics/entity/spitter/spitter-run-1.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-run-2.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-run-3.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-run-4.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-run-5.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-run-6.png",
            width_in_frames = 8,
            height_in_frames = 8
          }
        }
      },
      {
        width = 81,
        height = 90,
        frame_count = 24,
        direction_count = 16,
        shift = {scale * 0.015625, scale * -0.6875},
        scale = scale,
        filename = "__base__/graphics/entity/spitter/spitter-run-mask.png",
        tint = tint
      },
    }
  }
end

function spitterdyinganimation(scale, tint)
  return
  {
    layers =
    {
      {
        width = 225,
        height = 174,
        frame_count = 16,
        direction_count = 16,
        shift = {scale * 0.546875, scale * 0.21875},
        priority = "very-low",
        scale = scale,
        stripes =
        {
          {
            filename = "__base__/graphics/entity/spitter/spitter-die-1.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-die-2.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-die-3.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-die-4.png",
            width_in_frames = 8,
            height_in_frames = 8
          }
        }
      },
      {
        width = 166,
        height = 144,
        frame_count = 16,
        direction_count = 16,
        shift = {scale * 0, scale * -0.0625},
        priority = "very-low",
        tint = tint,
        scale = scale,
        stripes =
        {
          {
            filename = "__base__/graphics/entity/spitter/spitter-die-mask-1.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-die-mask-2.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-die-mask-3.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/spitter/spitter-die-mask-4.png",
            width_in_frames = 8,
            height_in_frames = 8
          }
        }
      }
    }
  }
end


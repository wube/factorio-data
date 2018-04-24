
function spawner_idle_animation(variation, tint)
return
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/spawner/spawner-idle.png",
        line_length = 8,
        width = 243,
        height = 181,
        frame_count = 8,
        animation_speed = 0.18,
        direction_count = 1,
        run_mode = "forward-then-backward",
        shift = {0.140625 - 0.65, -0.234375},
        y = variation * 181
      },
      {
        filename = "__base__/graphics/entity/spawner/spawner-idle-mask.png",
        width = 166,
        height = 148,
        frame_count = 8,
        animation_speed = 0.18,
        run_mode = "forward-then-backward",
        shift = {-0.34375 - 0.65, -0.375},
        line_length = 8,
        tint = tint,
        y = variation * 148
      }
    }
  }
end

function spawner_die_animation(variation, tint)
return
  {
    layers =
    {
      {
        width = 255,
        height = 184,
        frame_count = 20,
        direction_count = 1,
        shift = {-0.015625 - 0.65, -0.28125},
        stripes =
        {
         {
          filename = "__base__/graphics/entity/spawner/spawner-die-01.png",
          width_in_frames = 7,
          height_in_frames = 4,
          y = variation * 184
         },
         {
          filename = "__base__/graphics/entity/spawner/spawner-die-02.png",
          width_in_frames = 7,
          height_in_frames = 4,
          y = variation * 184
         },
         {
          filename = "__base__/graphics/entity/spawner/spawner-die-03.png",
          width_in_frames = 6,
          height_in_frames = 4,
          y = variation * 184
         }
        }
      },
      {
        width = 166,
        height = 148,
        frame_count = 20,
        direction_count = 1,
        shift = {-0.34375 - 0.65, -0.375},
        tint = tint,
        stripes =
        {
         {
          filename = "__base__/graphics/entity/spawner/spawner-die-mask-01.png",
          width_in_frames = 10,
          height_in_frames = 4,
          y = variation * 148
         },
         {
          filename = "__base__/graphics/entity/spawner/spawner-die-mask-02.png",
          width_in_frames = 10,
          height_in_frames = 4,
          y = variation * 148
         }
        }
      }
    }
  }
end



function spawner_integration()
return
  {
    filename = "__base__/graphics/entity/spawner/spawner-idle-integration.png",
    variation_count = 4,
    width = 258,
    height = 188,
    shift = util.by_pixel(2, -2),
    frame_count = 1,
    line_length = 1,
    hr_version =
    {
      filename = "__base__/graphics/entity/spawner/hr-spawner-idle-integration.png",
      variation_count = 4,
      width = 522,
      height = 380,
      shift = util.by_pixel(3, -3),
      frame_count = 1,
      line_length = 1,
      scale = 0.5
    }
  }
end

function spawner_idle_animation(variation, tint)
return
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/spawner/spawner-idle.png",
        line_length = 4,
        width = 248,
        height = 180,
        frame_count = 8,
        animation_speed = 0.18,
        direction_count = 1,
        run_mode = "forward-then-backward",
        shift = util.by_pixel(2, -4),
        y = variation * 180 * 2,
        hr_version =
        {
          filename = "__base__/graphics/entity/spawner/hr-spawner-idle.png",
          line_length = 4,
          width = 490,
          height = 354,
          frame_count = 8,
          animation_speed = 0.18,
          direction_count = 1,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(3, -2),
          y = variation * 354 * 2,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/spawner/spawner-idle-mask.png",
        flags = { "mask" },
        width = 140,
        height = 118,
        frame_count = 8,
        animation_speed = 0.18,
        run_mode = "forward-then-backward",
        shift = util.by_pixel(-2, -14),
        line_length = 4,
        tint = tint,
        y = variation * 118 * 2,
        hr_version =
        {
          filename = "__base__/graphics/entity/spawner/hr-spawner-idle-mask.png",
          flags = { "mask" },
          width = 276,
          height = 234,
          frame_count = 8,
          animation_speed = 0.18,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(-1, -14),
          line_length = 4,
          tint = tint,
          y = variation * 234 * 2,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/spawner/spawner-idle-shadow.png",
        draw_as_shadow = true,
        width = 232,
        height = 176,
        frame_count = 8,
        animation_speed = 0.18,
        run_mode = "forward-then-backward",
        shift = util.by_pixel(36, -2),
        line_length = 4,
        y = variation * 176 * 2,
        hr_version =
        {
          filename = "__base__/graphics/entity/spawner/hr-spawner-idle-shadow.png",
          draw_as_shadow = true,
          width = 464,
          height = 406,
          frame_count = 8,
          animation_speed = 0.18,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(36, 10),
          line_length = 4,
          y = variation * 406 * 2,
          scale = 0.5
        }
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
        filename = "__base__/graphics/entity/spawner/spawner-die.png",
        line_length = 8,
        width = 248,
        height = 178,
        frame_count = 8,
        direction_count = 1,
        shift = util.by_pixel(2, -2),
        y = variation * 178,
        hr_version =
        {
          filename = "__base__/graphics/entity/spawner/hr-spawner-die.png",
          line_length = 8,
          width = 490,
          height = 354,
          frame_count = 8,
          direction_count = 1,
          shift = util.by_pixel(3, -2),
          y = variation * 354,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/spawner/spawner-die-mask.png",
        flags = { "mask" },
        width = 140,
        height = 118,
        frame_count = 8,
        direction_count = 1,
        shift = util.by_pixel(-2, -14),
        line_length = 8,
        tint = tint,
        y = variation * 118,
        hr_version =
        {
          filename = "__base__/graphics/entity/spawner/hr-spawner-die-mask.png",
          flags = { "mask" },
          width = 276,
          height = 234,
          frame_count = 8,
          direction_count = 1,
          shift = util.by_pixel(-1, -14),
          line_length = 8,
          tint = tint,
          y = variation * 234,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/spawner/spawner-die-shadow.png",
        draw_as_shadow = true,
        width = 232,
        height = 176,
        frame_count = 8,
        direction_count = 1,
        shift = util.by_pixel(36, -2),
        line_length = 8,
        y = variation * 176,
        hr_version =
        {
          filename = "__base__/graphics/entity/spawner/hr-spawner-die-shadow.png",
          draw_as_shadow = true,
          width = 466,
          height = 406,
          frame_count = 8,
          direction_count = 1,
          shift = util.by_pixel(36, 10),
          line_length = 8,
          y = variation * 406,
          scale = 0.5
        }
      }
    }
  }
end


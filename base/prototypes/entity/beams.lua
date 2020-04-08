local beam_blend_mode = "additive-soft"
local beam_non_light_flags = { "trilinear-filtering" }

function append_base_electric_beam_graphics(beam_table, blend_mode, beam_flags, beam_tint, light_tint)
    beam_table.start =
    {
      filename = "__base__/graphics/entity/beam/tileable-beam-START.png",
      flags = beam_flags or beam_non_light_flags,
      line_length = 4,
      width = 52,
      height = 40,
      frame_count = 16,
      direction_count = 1,
      shift = {-0.03125, 0},
      tint = beam_tint,
      hr_version =
      {
        filename = "__base__/graphics/entity/beam/hr-tileable-beam-START.png",
        flags = beam_flags or beam_non_light_flags,
        line_length = 4,
        width = 94,
        height = 66,
        frame_count = 16,
        direction_count = 1,
        shift = {0.53125, 0},
        tint = beam_tint,
        scale = 0.5
      }
    }

    beam_table.ending =
    {
      filename = "__base__/graphics/entity/beam/tileable-beam-END.png",
      flags = beam_flags or beam_non_light_flags,
      line_length = 4,
      width = 49,
      height = 54,
      frame_count = 16,
      direction_count = 1,
      shift = {-0.046875, 0},
      tint = beam_tint,
      hr_version =
      {
        filename = "__base__/graphics/entity/beam/hr-tileable-beam-END.png",
        flags = beam_flags or beam_non_light_flags,
        line_length = 4,
        width = 91,
        height = 93,
        frame_count = 16,
        direction_count = 1,
        shift = {-0.078125, -0.046875},
        tint = beam_tint,
        scale = 0.5
      }
    }

    beam_table.head =
    {
      filename = "__base__/graphics/entity/beam/beam-head.png",
      flags = beam_flags or beam_non_light_flags,
      line_length = 16,
      width = 45 - 7,
      height = 39,
      frame_count = 16,
      shift = util.by_pixel(-7/2, 0),
      tint = beam_tint,
      blend_mode = blend_mode or beam_blend_mode
    }

    beam_table.tail =
    {
      filename = "__base__/graphics/entity/beam/beam-tail.png",
      flags = beam_flags or beam_non_light_flags,
      line_length = 16,
      width = 45 - 6,
      height = 39,
      frame_count = 16,
      shift = util.by_pixel(6/2, 0),
      tint = beam_tint,
      blend_mode = blend_mode or beam_blend_mode
    }

    beam_table.body =
    {
      {
        filename = "__base__/graphics/entity/beam/beam-body-1.png",
        flags = beam_flags or beam_non_light_flags,
        line_length = 16,
        width = 32,
        height = 39,
        frame_count = 16,
        tint = beam_tint,
        blend_mode = blend_mode or beam_blend_mode
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-2.png",
        flags = beam_flags or beam_non_light_flags,
        line_length = 16,
        width = 32,
        height = 39,
        frame_count = 16,
        blend_mode = blend_mode or beam_blend_mode
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-3.png",
        flags = beam_flags or beam_non_light_flags,
        line_length = 16,
        width = 32,
        height = 39,
        frame_count = 16,
        blend_mode = blend_mode or beam_blend_mode
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-4.png",
        flags = beam_flags or beam_non_light_flags,
        line_length = 16,
        width = 32,
        height = 39,
        frame_count = 16,
        blend_mode = blend_mode or beam_blend_mode
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-5.png",
        flags = beam_flags or beam_non_light_flags,
        line_length = 16,
        width = 32,
        height = 39,
        frame_count = 16,
        blend_mode = blend_mode or beam_blend_mode
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-6.png",
        flags = beam_flags or beam_non_light_flags,
        line_length = 16,
        width = 32,
        height = 39,
        frame_count = 16,
        blend_mode = blend_mode or beam_blend_mode
      }
    }

    beam_table.light_animations =
    {
      start =
      {
        filename = "__base__/graphics/entity/beam/hr-tileable-beam-START-light.png",
        line_length = 4,
        width = 94,
        height = 66,
        frame_count = 16,
        direction_count = 1,
        shift = {0.53125, 0},
        scale = 0.5,
        tint = light_tint
      },

      ending =
      {
        filename = "__base__/graphics/entity/beam/hr-tileable-beam-END-light.png",
        line_length = 4,
        width = 91,
        height = 93,
        frame_count = 16,
        direction_count = 1,
        shift = {-0.078125, -0.046875},
        scale = 0.5,
        tint = light_tint
      },

      head =
      {
        filename = "__base__/graphics/entity/beam/beam-head-light.png",
        line_length = 16,
        width = 45 - 7,
        height = 39,
        frame_count = 16,
        shift = util.by_pixel(-7/2, 0),
        tint = light_tint
      },

      tail =
      {
        filename = "__base__/graphics/entity/beam/beam-tail-light.png",
        line_length = 16,
        width = 45 - 6,
        height = 39,
        shift = util.by_pixel(6/2, 0),
        frame_count = 16,
        tint = light_tint
      },

      body =
      {
        {
          filename = "__base__/graphics/entity/beam/beam-body-1-light.png",
          line_length = 16,
          width = 32,
          height = 39,
          frame_count = 16,
          tint = light_tint
        },
        {
          filename = "__base__/graphics/entity/beam/beam-body-2-light.png",
          line_length = 16,
          width = 32,
          height = 39,
          frame_count = 16,
          tint = light_tint
        },
        {
          filename = "__base__/graphics/entity/beam/beam-body-3-light.png",
          line_length = 16,
          width = 32,
          height = 39,
          frame_count = 16,
          tint = light_tint
        },
        {
          filename = "__base__/graphics/entity/beam/beam-body-4-light.png",
          line_length = 16,
          width = 32,
          height = 39,
          frame_count = 16,
          tint = light_tint
        },
        {
          filename = "__base__/graphics/entity/beam/beam-body-5-light.png",
          line_length = 16,
          width = 32,
          height = 39,
          frame_count = 16,
          tint = light_tint
        },
        {
          filename = "__base__/graphics/entity/beam/beam-body-6-light.png",
          line_length = 16,
          width = 32,
          height = 39,
          frame_count = 16,
          tint = light_tint
        }
      }
    }

    return beam_table
end

function make_beam(sound)
  local result =
  {
    type = "beam",
    flags = {"not-on-map"},
    width = 0.5,
    damage_interval = 20,
    random_target_offset = true,
    action_triggered_automatically = false,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = { amount = 10, type = "electric"}
          }
        }
      }
    }
  }

  if sound then
    result.working_sound =
    {
      sound =
      {
        filename = "__base__/sound/fight/electric-beam.ogg",
        volume = 0.7
      },
      max_sounds_per_type = 4
    }
    result.name = "electric-beam"
  else
    result.name = "electric-beam-no-sound"
  end

  return append_base_electric_beam_graphics(result, beam_blend_mode, beam_non_light_flags, nil, nil)
end

data:extend(
{
  make_beam(true),
  make_beam(false),
}
)

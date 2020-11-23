local laser_beam_blend_mode = "additive"

function make_laser_beam(sound)
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
            damage = { amount = 10, type = "laser"}
          }
        }
      }
    },
    head =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-body.png",
      flags = beam_non_light_flags,
      line_length = 8,
      width = 64,
      height = 12,
      frame_count = 8,
      scale = 0.5,
      animation_speed = 0.5,
      blend_mode = laser_beam_blend_mode
    },
    tail =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-end.png",
      flags = beam_non_light_flags,
      width = 110,
      height = 62,
      frame_count = 8,
      shift = util.by_pixel(11.5, 1),
      scale = 0.5,
      animation_speed = 0.5,
      blend_mode = laser_beam_blend_mode
    },
    body =
    {
      {
        filename = "__base__/graphics/entity/laser-turret/hr-laser-body.png",
        flags = beam_non_light_flags,
        line_length = 8,
        width = 64,
        height = 12,
        frame_count = 8,
        scale = 0.5,
        animation_speed = 0.5,
        blend_mode = laser_beam_blend_mode
      }
    },

    light_animations =
    {
      head =
      {
        filename = "__base__/graphics/entity/laser-turret/hr-laser-body-light.png",
        line_length = 8,
        width = 64,
        height = 12,
        frame_count = 8,
        scale = 0.5,
        animation_speed = 0.5
      },
      tail =
      {
        filename = "__base__/graphics/entity/laser-turret/hr-laser-end-light.png",
        width = 110,
        height = 62,
        frame_count = 8,
        shift = util.by_pixel(11.5, 1),
        scale = 0.5,
        animation_speed = 0.5
      },
      body =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/hr-laser-body-light.png",
          line_length = 8,
          width = 64,
          height = 12,
          frame_count = 8,
          scale = 0.5,
          animation_speed = 0.5
        }
      }
    },

    ground_light_animations =
    {
      head =
      {
        filename = "__base__/graphics/entity/laser-turret/laser-ground-light-head.png",
        line_length = 1,
        width = 256,
        height = 256,
        repeat_count = 8,
        scale = 0.5,
        shift = util.by_pixel(-32, 0),
        animation_speed = 0.5,
        tint = {0.5, 0.05, 0.05}
      },
      tail =
      {
        filename = "__base__/graphics/entity/laser-turret/laser-ground-light-tail.png",
        line_length = 1,
        width = 256,
        height = 256,
        repeat_count = 8,
        scale = 0.5,
        shift = util.by_pixel(32, 0),
        animation_speed = 0.5,
        tint = {0.5, 0.05, 0.05}
      },
      body =
      {
        filename = "__base__/graphics/entity/laser-turret/laser-ground-light-body.png",
        line_length = 1,
        width = 64,
        height = 256,
        repeat_count = 8,
        scale = 0.5,
        animation_speed = 0.5,
        tint = {0.5, 0.05, 0.05}
      }
    }
  }

  if sound then
    result.working_sound =
    {
      sound =
      {
        filename = "__base__/sound/fight/laser-beam.ogg",
        volume = 0.75
      },
      max_sounds_per_type = 1
    }
    result.name = "laser-beam"
  else
    result.name = "laser-beam-no-sound"
  end
  return result
end

data:extend(
{
  make_laser_beam(true)
}
)

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

    beam_table.light_animations = util.copy
    {
      start = beam_table.start,
      ending = beam_table.ending,
      head = beam_table.head,
      body = beam_table.body,
      tail = beam_table.tail
    }

    old_light_animations =
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

    beam_table.ground_light_animations =
    {
      head =
      {
        filename = "__base__/graphics/entity/laser-turret/laser-ground-light-head.png",
        line_length = 1,
        width = 256,
        height = 256,
        repeat_count = 16,
        scale = 0.5,
        shift = util.by_pixel(-32, 0),
        animation_speed = 0.5,
        tint = {0.05, 0.5, 0.5}
      },
      tail =
      {
        filename = "__base__/graphics/entity/laser-turret/laser-ground-light-tail.png",
        line_length = 1,
        width = 256,
        height = 256,
        repeat_count = 16,
        scale = 0.5,
        shift = util.by_pixel(32, 0),
        animation_speed = 0.5,
        tint = {0.05, 0.5, 0.5}
      },
      body =
      {
        filename = "__base__/graphics/entity/laser-turret/laser-ground-light-body.png",
        line_length = 1,
        width = 64,
        height = 256,
        repeat_count = 16,
        scale = 0.5,
        animation_speed = 0.5,
        tint = {0.05, 0.5, 0.5}
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
    target_offset = {0, -0.5},
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
  make_beam(false)
}
)

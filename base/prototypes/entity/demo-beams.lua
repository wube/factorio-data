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
        animation_speed = 0.5,
      },
      tail =
      {
        filename = "__base__/graphics/entity/laser-turret/hr-laser-end-light.png",
        width = 110,
        height = 62,
        frame_count = 8,
        shift = util.by_pixel(11.5, 1),
        scale = 0.5,
        animation_speed = 0.5,
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
          animation_speed = 0.5,
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
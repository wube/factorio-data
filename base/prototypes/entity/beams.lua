local beam_blend_mode = "additive-soft"
local laser_beam_blend_mode = "additive"

function make_beam(sound)
  local result =
  {
    type = "beam",
    flags = {"not-on-map"},
    width = 0.5,
    damage_interval = 20,
    random_target_offset = true,
    target_offset_y = -0.3,
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
    },
    start =
    {
      filename = "__base__/graphics/entity/beam/tileable-beam-START.png",
      line_length = 4,
      width = 52,
      height = 40,
      frame_count = 16,
      direction_count = 1,
      shift = {-0.03125, 0},
      hr_version =
      {
        filename = "__base__/graphics/entity/beam/hr-tileable-beam-START.png",
        line_length = 4,
        width = 94,
        height = 66,
        frame_count = 16,
        direction_count = 1,
        shift = {0.53125, 0},
        scale = 0.5
      }
    },
    ending =
    {
      filename = "__base__/graphics/entity/beam/tileable-beam-END.png",
      line_length = 4,
      width = 49,
      height = 54,
      frame_count = 16,
      direction_count = 1,
      shift = {-0.046875, 0},
      hr_version =
      {
        filename = "__base__/graphics/entity/beam/hr-tileable-beam-END.png",
        line_length = 4,
        width = 91,
        height = 93,
        frame_count = 16,
        direction_count = 1,
        shift = {-0.078125, -0.046875},
        scale = 0.5
      }
    },
    head =
    {
      filename = "__base__/graphics/entity/beam/beam-head.png",
      line_length = 16,
      width = 45,
      height = 39,
      frame_count = 16,
      animation_speed = 0.5,
      blend_mode = beam_blend_mode
    },
    tail =
    {
      filename = "__base__/graphics/entity/beam/beam-tail.png",
      line_length = 16,
      width = 45,
      height = 39,
      frame_count = 16,
      blend_mode = beam_blend_mode
    },
    body =
    {
      {
        filename = "__base__/graphics/entity/beam/beam-body-1.png",
        line_length = 16,
        width = 45,
        height = 39,
        frame_count = 16,
        blend_mode = beam_blend_mode
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-2.png",
        line_length = 16,
        width = 45,
        height = 39,
        frame_count = 16,
        blend_mode = beam_blend_mode
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-3.png",
        line_length = 16,
        width = 45,
        height = 39,
        frame_count = 16,
        blend_mode = beam_blend_mode
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-4.png",
        line_length = 16,
        width = 45,
        height = 39,
        frame_count = 16,
        blend_mode = beam_blend_mode
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-5.png",
        line_length = 16,
        width = 45,
        height = 39,
        frame_count = 16,
        blend_mode = beam_blend_mode
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-6.png",
        line_length = 16,
        width = 45,
        height = 39,
        frame_count = 16,
        blend_mode = beam_blend_mode
      }
    }
  }

  if sound then
    result.working_sound =
    {
      {
        filename = "__base__/sound/fight/electric-beam.ogg",
        volume = 0.7
      }
    }
    result.name = "electric-beam"
  else
    result.name = "electric-beam-no-sound"
  end
  return result;
end


function make_laser_beam(sound)
  local result =
  {
    type = "beam",
    flags = {"not-on-map"},
    width = 0.5,
    damage_interval = 20,
    random_target_offset = true,
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
      flags = {"mipmap"},
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
      flags = { "no-crop", "mipmap" },
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
        flags = {"mipmap"},
        line_length = 8,
        width = 64,
        height = 12,
        frame_count = 8,
        scale = 0.5,
        animation_speed = 0.5,
        blend_mode = laser_beam_blend_mode
      }
    }
  }

  if sound then
    result.working_sound =
    {
      {
        filename = "__base__/sound/fight/electric-beam.ogg",
        volume = 0.7
      }
    }
    result.name = "laser-beam"
  else
    result.name = "laser-beam-no-sound"
  end
  return result;
end

data:extend(
{
  make_beam(true),
  make_beam(false),
  make_laser_beam(true)
}
)

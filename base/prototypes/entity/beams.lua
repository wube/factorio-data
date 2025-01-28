local laser_beam_blend_mode = "additive"

function make_laser_beam(sound)
  local result =
  {
    type = "beam",
    flags = {"not-on-map"},
    hidden = true,
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
    graphics_set =
    {
      beam =
      {
        head =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/laser-turret/laser-body.png",
              flags = beam_non_light_flags,
              line_length = 8,
              width = 64,
              height = 12,
              frame_count = 8,
              scale = 0.5,
              animation_speed = 0.5,
              blend_mode = laser_beam_blend_mode
            },
            {
              filename = "__base__/graphics/entity/laser-turret/laser-body-light.png",
              draw_as_light = true,
              flags = {"light"},
              line_length = 8,
              width = 64,
              height = 12,
              frame_count = 8,
              scale = 0.5,
              animation_speed = 0.5
            }
          }
        },
        tail =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/laser-turret/laser-end.png",
              flags = beam_non_light_flags,
              width = 110,
              height = 62,
              frame_count = 8,
              shift = util.by_pixel(11.5, 1),
              scale = 0.5,
              animation_speed = 0.5,
              blend_mode = laser_beam_blend_mode
            },
            {
              filename = "__base__/graphics/entity/laser-turret/laser-end-light.png",
              draw_as_light = true,
              flags = {"light"},
              width = 110,
              height = 62,
              frame_count = 8,
              shift = util.by_pixel(11.5, 1),
              scale = 0.5,
              animation_speed = 0.5
            }
          }
        },
        body =
        {
          {
            layers =
            {
              {
                filename = "__base__/graphics/entity/laser-turret/laser-body.png",
                flags = beam_non_light_flags,
                line_length = 8,
                width = 64,
                height = 12,
                frame_count = 8,
                scale = 0.5,
                animation_speed = 0.5,
                blend_mode = laser_beam_blend_mode
              },
              {
                filename = "__base__/graphics/entity/laser-turret/laser-body-light.png",
                draw_as_light = true,
                flags = {"light"},
                line_length = 8,
                width = 64,
                height = 12,
                frame_count = 8,
                scale = 0.5,
                animation_speed = 0.5
              }
            }
          }
        },
        -- render_layer = "projectile"
      },

      ground =
      {
        head =
        {
          filename = "__base__/graphics/entity/laser-turret/laser-ground-light-head.png",
          draw_as_light = true,
          flags = {"light"},
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
          draw_as_light = true,
          flags = {"light"},
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
          draw_as_light = true,
          flags = {"light"},
          line_length = 1,
          width = 64,
          height = 256,
          repeat_count = 8,
          scale = 0.5,
          animation_speed = 0.5,
          tint = {0.5, 0.05, 0.05}
        }
        -- render_layer = "projectile"
      }
    }
  }

  if sound then
    result.working_sound =
    {
      sound =
      {
        category = "weapon",
        filename = "__base__/sound/fight/laser-beam.ogg",
        volume = 0.75,
        modifiers = volume_multiplier("main-menu", 2.5)
      },
      max_sounds_per_prototype = 1
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
  beam_table.graphics_set = beam_table.graphics_set or {}

  beam_table.graphics_set.beam =
  {
    start =
    {
      filename = "__base__/graphics/entity/beam/tileable-beam-START.png",
      flags = beam_flags or beam_non_light_flags,
      draw_as_glow = true,
      line_length = 4,
      width = 94,
      height = 66,
      frame_count = 16,
      shift = {0.53125, 0},
      tint = beam_tint,
      scale = 0.5
    },

    ending =
    {
      filename = "__base__/graphics/entity/beam/tileable-beam-END.png",
      flags = beam_flags or beam_non_light_flags,
      draw_as_glow = true,
      line_length = 4,
      width = 91,
      height = 93,
      frame_count = 16,
      shift = {-0.078125, -0.046875},
      tint = beam_tint,
      scale = 0.5
    },

    head =
    {
      filename = "__base__/graphics/entity/beam/beam-head.png",
      flags = beam_flags or beam_non_light_flags,
      draw_as_glow = true,
      line_length = 16,
      width = 45 - 7,
      height = 39,
      frame_count = 16,
      shift = util.by_pixel(-7/2, 0),
      tint = beam_tint,
      blend_mode = blend_mode or beam_blend_mode
    },

    tail =
    {
      filename = "__base__/graphics/entity/beam/beam-tail.png",
      flags = beam_flags or beam_non_light_flags,
      draw_as_glow = true,
      line_length = 16,
      width = 45 - 6,
      height = 39,
      frame_count = 16,
      shift = util.by_pixel(6/2, 0),
      tint = beam_tint,
      blend_mode = blend_mode or beam_blend_mode
    },

    body =
    {
      {
        filename = "__base__/graphics/entity/beam/beam-body-1.png",
        flags = beam_flags or beam_non_light_flags,
        draw_as_glow = true,
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
        draw_as_glow = true,
        line_length = 16,
        width = 32,
        height = 39,
        frame_count = 16,
        blend_mode = blend_mode or beam_blend_mode
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-3.png",
        flags = beam_flags or beam_non_light_flags,
        draw_as_glow = true,
        line_length = 16,
        width = 32,
        height = 39,
        frame_count = 16,
        blend_mode = blend_mode or beam_blend_mode
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-4.png",
        flags = beam_flags or beam_non_light_flags,
        draw_as_glow = true,
        line_length = 16,
        width = 32,
        height = 39,
        frame_count = 16,
        blend_mode = blend_mode or beam_blend_mode
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-5.png",
        flags = beam_flags or beam_non_light_flags,
        draw_as_glow = true,
        line_length = 16,
        width = 32,
        height = 39,
        frame_count = 16,
        blend_mode = blend_mode or beam_blend_mode
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-6.png",
        flags = beam_flags or beam_non_light_flags,
        draw_as_glow = true,
        line_length = 16,
        width = 32,
        height = 39,
        frame_count = 16,
        blend_mode = blend_mode or beam_blend_mode
      }
    }
  }

  beam_table.graphics_set.ground =
  {
    head =
    {
      filename = "__base__/graphics/entity/laser-turret/laser-ground-light-head.png",
      draw_as_light = true,
      flags = {"light"},
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
      draw_as_light = true,
      flags = {"light"},
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
      draw_as_light = true,
      flags = {"light"},
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

function make_electric_beam(name, sound, damage)
  local result =
  {
    name = name,
    type = "beam",
    flags = {"not-on-map"},
    hidden = true,
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
            damage = { amount = damage, type = "electric"}
          }
        }
      }
    },
    working_sound =
    sound and {
      sound = { filename = "__base__/sound/fight/electric-beam.ogg", volume = 0.7 },
      max_sounds_per_prototype = 4
    } or nil,
  }

  return append_base_electric_beam_graphics(result, beam_blend_mode, beam_non_light_flags, nil, nil)
end


data:extend(
{
  make_electric_beam("electric-beam", true, 10),
  make_electric_beam("electric-beam-no-sound", false, 10)
})

--[[
function make_lightning_beam(name, sound, damage)
  local result =
  {
    name = name,
    type = "beam",
    flags = {"not-on-map"},
    hidden = true,
    width = 0.5,
    damage_interval = 10,
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
            damage = { amount = damage, type = "electric"}
          },
          {
            type = "push-back",
            distance = 0.1
          },
          {
            type = "create-sticker",
            sticker = "electric-mini-stun"
          }
        }
      }
    },
    working_sound =
    sound and {
      sound = {category = "weapon", filename = "__base__/sound/fight/electric-beam.ogg", volume = 0.7},
      max_sounds_per_prototype = 4
    } or nil,
  }

  return append_base_electric_beam_graphics(result, beam_blend_mode, beam_non_light_flags, nil, nil)
end

local function make_chain_lightning_beams(start_name, bounce_name, chain_name, sound, damage)
  local start_beam = make_lightning_beam(start_name, sound, damage)
  local bounce_beam = make_lightning_beam(bounce_name, sound, damage)

  -- chain effect has to happen first, else jumping between friendly buildings may not work
  table.insert(start_beam.action.action_delivery.target_effects, 1,
  {
    type = "nested-result",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "chain",
        chain = chain_name,
      }
    }
  })

  data:extend({ start_beam, bounce_beam })
end

make_chain_lightning_beams("chain-lightning-beam-start", "chain-lightning-beam-bounce", "chain-lightning-chain", true, 30)
]]
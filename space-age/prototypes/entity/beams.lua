local beam_blend_mode = "additive"
local beam_non_light_flags = { "trilinear-filtering" }
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")

function get_beam_sprite(token)
  return
  {
      util.sprite_load("__space-age__/graphics/entity/beam/tesla-body-"..token.."",
      {
        frame_count = 20,
        repeat_count = 4,
        draw_as_glow = true,
        animation_speed = 0.5,
        scale = 0.5,
        tint = beam_tint,
        blend_mode = blend_mode or beam_blend_mode
      }),
      util.sprite_load("__space-age__/graphics/entity/beam/lightning-loop-"..token.."",
      {
        frame_count = 80,
        draw_as_glow = true,
        animation_speed = 0.5,
        scale = 0.5,
        tint = beam_tint,
        blend_mode = blend_mode or beam_blend_mode
      })
  }
end

function get_chain_sprite(token)
  return
  {
      util.sprite_load("__space-age__/graphics/entity/beam/chain-body-0",
      {
        frame_count = 1,
        repeat_count = 40,
        draw_as_glow = true,
        animation_speed = 0.5,
        scale = 0.5,
        tint = beam_tint,
        blend_mode = blend_mode or beam_blend_mode
      }),
      util.sprite_load("__space-age__/graphics/entity/beam/chain-body-"..token.."",
      {
        frame_count = 40,
        draw_as_glow = true,
        animation_speed = 0.5,
        scale = 0.5,
        tint = beam_tint,
        blend_mode = blend_mode or beam_blend_mode
      })
  }
end

function make_tesla_electric_beam_graphics(blend_mode, beam_flags, beam_tint, light_tint, base_graphics_set)
  local graphics_set = base_graphics_set or {}
  graphics_set.beam =
  {
    --render_layer = "projectile",

    start = util.sprite_load("__space-age__/graphics/entity/beam/tesla-beam-START",
    {
      flags = beam_flags or beam_non_light_flags,
      frame_count = 20,
      draw_as_glow = true,
      tint = beam_tint,
      animation_speed = 0.5,
      scale = 0.5
    }),

    ending = util.sprite_load("__space-age__/graphics/entity/beam/tesla-beam-END",
    {
      flags = beam_flags or beam_non_light_flags,
      frame_count = 20,
      draw_as_glow = true,
      tint = beam_tint,
      animation_speed = 0.5,
      scale = 0.5
    }),

    head = util.sprite_load("__space-age__/graphics/entity/beam/tesla-head",
    {
      flags = beam_flags or beam_non_light_flags,
      frame_count = 20,
      draw_as_glow = true,
      animation_speed = 0.5,
      scale = 0.5,
      tint = beam_tint,
      blend_mode = blend_mode or beam_blend_mode
    }),

    tail = util.sprite_load("__space-age__/graphics/entity/beam/tesla-tail",
    {
      flags = beam_flags or beam_non_light_flags,
      frame_count = 20,
      draw_as_glow = true,
      animation_speed = 0.5,
      scale = 0.5,
      tint = beam_tint,
      blend_mode = blend_mode or beam_blend_mode
    }),

    body =
    {
      {layers=get_beam_sprite('1')},
      {layers=get_beam_sprite('2')},
      {layers=get_beam_sprite('3')},
      {layers=get_beam_sprite('4')},
      {layers=get_beam_sprite('5')},
      {layers=get_beam_sprite('6')},
    }
  }

  graphics_set.ground =
  {
    --render_layer = "projectile",
    head =
    {
      filename = "__base__/graphics/entity/laser-turret/laser-ground-light-head.png",
      draw_as_light = true,
      flags = {"light"},
      line_length = 1,
      width = 256,
      height = 256,
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
      scale = 0.5,
      animation_speed = 0.5,
      tint = {0.05, 0.5, 0.5}
    }
  }

  return graphics_set
end

function make_tesla_electric_beam_chain_graphics(blend_mode, beam_flags, beam_tint, light_tint, base_graphics_set)
  local graphics_set = base_graphics_set or {}
  graphics_set.beam =
  {
    --render_layer = "projectile",

    start = util.sprite_load("__space-age__/graphics/entity/beam/chain-beam-START",
    {
      flags = beam_flags or beam_non_light_flags,
      frame_count = 20,
      draw_as_glow = true,
      tint = beam_tint,
      animation_speed = 0.5,
      scale = 0.5
    }),

    ending = util.sprite_load("__space-age__/graphics/entity/beam/chain-beam-END",
    {
      flags = beam_flags or beam_non_light_flags,
      frame_count = 20,
      draw_as_glow = true,
      tint = beam_tint,
      animation_speed = 0.5,
      scale = 0.5
    }),

    head = {layers=get_chain_sprite('1')},

    tail = {layers=get_chain_sprite('6')},

    body =
    {
      {layers=get_chain_sprite('1')},
      {layers=get_chain_sprite('2')},
      {layers=get_chain_sprite('3')},
      {layers=get_chain_sprite('4')},
      {layers=get_chain_sprite('5')},
      {layers=get_chain_sprite('6')},
    }
  }

  graphics_set.ground =
  {
    --render_layer = "projectile",
    head =
    {
      filename = "__base__/graphics/entity/laser-turret/laser-ground-light-head.png",
      draw_as_light = true,
      flags = {"light"},
      line_length = 1,
      width = 256,
      height = 256,
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
      scale = 0.5,
      animation_speed = 0.5,
      tint = {0.05, 0.5, 0.5}
    }
  }

  return graphics_set
end

function make_tesla_beam(name, sound, damage, token)
  return
  {
    name = name,
    type = "beam",
    flags = {"not-on-map"},
    hidden = true,
    width = 0.5,
    damage_interval = 20,
    random_target_offset = true,
    target_offset = {0, 0},
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
            distance = 0.5
          },
          {
            type = "create-sticker",
            sticker = "tesla-turret-stun"
          },
          {
            type = "create-sticker",
            sticker = "tesla-turret-slow"
          },
          {
            type = "play-sound",
            sound = space_age_sounds.tesla_turret_beam_deflect
          }
        }
      }
    },
    graphics_set = make_tesla_electric_beam_graphics(beam_blend_mode, beam_non_light_flags, nil, nil,
                                                     {
                                                       desired_segment_length = 1,
                                                       randomize_animation_per_segment = true
                                                     }),

    working_sound =
    sound and {
      sound = {category = "weapon", filename = "__space-age__/sound/entity/tesla-turret/tesla-turret-beam.ogg", volume = 1.0},
      max_sounds_per_type = 4
    } or nil,
  }
end

function make_tesla_beam_chain(name, sound, damage, token)
  return
  {
    name = name,
    type = "beam",
    flags = {"not-on-map"},
    hidden = true,
    width = 0.5,
    damage_interval = 20,
    random_target_offset = true,
    target_offset = {0, 0},
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
            distance = 0.25
          },
          {
            type = "create-sticker",
            sticker = "tesla-turret-stun"
          },
          {
            type = "create-sticker",
            sticker = "tesla-turret-slow"
          }
        }
      }
    },
    graphics_set = make_tesla_electric_beam_chain_graphics(beam_blend_mode, beam_non_light_flags, nil, nil,
                                                     {
                                                       desired_segment_length = 1,
                                                       randomize_animation_per_segment = true
                                                     }),

    working_sound =
    sound and {
      sound = {category = "weapon", filename = "__space-age__/sound/entity/tesla-turret/tesla-turret-chain-beam.ogg", volume = 0.8},
      max_sounds_per_type = 4
    } or nil,
  }
end

local function make_chain_tesla_beams(start_name, bounce_name, sound, damage)
  data:extend(
  {
    make_tesla_beam(start_name, sound, damage),
    make_tesla_beam_chain(bounce_name, sound, damage)
  })
end

make_chain_tesla_beams("chain-tesla-turret-beam-start", "chain-tesla-turret-beam-bounce", true, 120)
make_chain_tesla_beams("chain-tesla-gun-beam-start", "chain-tesla-gun-beam-bounce", true, 30)

local sounds = require("__base__.prototypes.entity.sounds")
local math3d = require "math3d"

local yumako_duration = 12 * second
local yumako_cooldown = 16 * second
local yumako_instant_health = 80
local yumako_regen_health = 4
local yumako_regen_interval = 0.25 * second

local jelly_duration = 12 * second
local jelly_cooldown = 16 * second
local jelly_speed_modifier = 1.5

local bioflux_duration = 16 * second
local bioflux_cooldown = 16 * second

local make_sticker_data = function()
  return
  {
    {
      type = "sticker",
      name = "jellynut-speed-sticker",
      flags = {"not-on-map"},
      hidden = true,
      single_particle = true,
      duration_in_ticks = jelly_duration,
      target_movement_modifier = jelly_speed_modifier,
      animation =
        util.sprite_load("__space-age__/graphics/sticker/jellynut-speed/whirl_front",
          {
            priority = "high",
            frame_count = 50,
            scale = 0.5,
            animation_speed = 0.5,
            shift = util.by_pixel(0,16)
          }
        )
    },
    {
      type = "sticker",
      name = "jellynut-speed-sticker-behind",
      flags = {"not-on-map"},
      hidden = true,
      single_particle = true,
      duration_in_ticks = jelly_duration,
      render_layer = "object-under",
      animation =
        util.sprite_load("__space-age__/graphics/sticker/jellynut-speed/whirl_back",
          {
            priority = "high",
            frame_count = 50,
            scale = 0.5,
            animation_speed = 0.5,
            shift = util.by_pixel(0,16)
          }
        )
    },

    {
      type = "sticker",
      name = "yumako-regen-sticker",
      flags = {"not-on-map"},
      hidden = true,
      single_particle = true,
      duration_in_ticks = yumako_duration,
      damage_interval = yumako_regen_interval,
      damage_per_tick = { amount = -yumako_regen_health, type = "physical" },
      animation =
        util.sprite_load("__space-age__/graphics/sticker/yumako-regen/regen-front",
          {
            priority = "high",
            frame_count = 50,
            scale = 0.5,
            draw_as_glow = true
          }
        )
    },
    {
      type = "sticker",
      name = "yumako-regen-sticker-behind",
      flags = {"not-on-map"},
      hidden = true,
      single_particle = true,
      duration_in_ticks = yumako_duration,
      render_layer = "object-under",
      animation =
      {
        layers =
        {
          util.sprite_load("__space-age__/graphics/sticker/yumako-regen/regen-ground",
            {
              priority = "high",
              frame_count = 50,
              scale = 0.5,
              draw_as_glow = true
            }),
          util.sprite_load("__space-age__/graphics/sticker/yumako-regen/regen",
            {
              priority = "high",
              frame_count = 50,
              scale = 0.5,
              draw_as_glow = true
            })
        }
      }
    },

    {
      type = "sticker",
      name = "bioflux-speed-regen-sticker",
      flags = {"not-on-map"},
      hidden = true,
      single_particle = true,
      duration_in_ticks = bioflux_duration,
      damage_interval = yumako_regen_interval,
      damage_per_tick = { amount = -yumako_regen_health, type = "physical" },
      target_movement_modifier = jelly_speed_modifier,
      animation =
      {
        layers =
        {
          util.sprite_load("__space-age__/graphics/sticker/yumako-regen/regen-front",
          {
            priority = "high",
            frame_count = 50,
            scale = 0.5,
            draw_as_glow = true
          }),
          util.sprite_load("__space-age__/graphics/sticker/jellynut-speed/whirl_front",
          {
            priority = "high",
            frame_count = 50,
            scale = 0.5,
            animation_speed = 0.5,
            shift = util.by_pixel(0,16)
          })
        }
      }
    },
    {
      type = "sticker",
      name = "bioflux-speed-regen-sticker-behind",
      flags = {"not-on-map"},
      hidden = true,
      single_particle = true,
      duration_in_ticks = bioflux_duration,
      render_layer = "object-under",
      animation =
      {
        layers =
        {
          util.sprite_load("__space-age__/graphics/sticker/yumako-regen/regen-ground",
          {
              priority = "high",
              frame_count = 50,
              scale = 0.5,
              draw_as_glow = true
          }),
          util.sprite_load("__space-age__/graphics/sticker/yumako-regen/regen",
          {
              priority = "high",
              frame_count = 50,
              scale = 0.5,
              draw_as_glow = true
          }),
          util.sprite_load("__space-age__/graphics/sticker/jellynut-speed/whirl_back",
          {
            priority = "high",
            frame_count = 50,
            scale = 0.5,
            animation_speed = 0.5,
            shift = util.by_pixel(0,16)
          })
        }
      }
    }
  }
end

local make_heal_capsule_effect = function()
  return
  {
    type = "use-on-self",
    attack_parameters =
    {
      type = "projectile",
      activation_type = "consume",
      ammo_category = "capsule",
      cooldown = yumako_cooldown,
      range = 0,
      ammo_type =
      {
        target_type = "position",
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
                damage = {type = "physical", amount = -yumako_instant_health},
                use_substitute = false
              },
              {
                type = "create-sticker",
                sticker = "yumako-regen-sticker"
              },
              {
                type = "create-sticker",
                sticker = "yumako-regen-sticker-behind"
              },
              {
                type = "play-sound",
                sound = sounds.eat_fish,
              }
            }
          }
        }
      }
    }
  }
end

local make_speed_capsule_effect = function()
  return
  {
    type = "use-on-self",
    attack_parameters =
    {
      type = "projectile",
      activation_type = "consume",
      ammo_category = "capsule",
      cooldown = jelly_cooldown,
      range = 0,
      ammo_type =
      {
        target_type = "position",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-sticker",
                sticker = "jellynut-speed-sticker"
              },
              {
                type = "create-sticker",
                sticker = "jellynut-speed-sticker-behind"
              },
              {
                type = "play-sound",
                sound = sounds.eat_fish,
              }
            }
          }
        }
      }
    }
  }
end

local make_speed_regen_capsule_effect = function()
  return
  {
    type = "use-on-self",
    attack_parameters =
    {
      type = "projectile",
      activation_type = "consume",
      ammo_category = "capsule",
      cooldown = bioflux_cooldown,
      range = 0,
      ammo_type =
      {
        target_type = "position",
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
                damage = {type = "physical", amount = -yumako_instant_health},
                use_substitute = false
              },
              {
                type = "create-sticker",
                sticker = "bioflux-speed-regen-sticker"
              },
              {
                type = "create-sticker",
                sticker = "bioflux-speed-regen-sticker-behind"
              },
              {
                type = "play-sound",
                sound = sounds.eat_fish,
              }
            }
          }
        }
      }
    }
  }
end

item_effects =
{
  data = make_sticker_data(),
  yumako_regen = make_heal_capsule_effect(),
  jellynut_speed = make_speed_capsule_effect(),
  bioflux_speed_and_regen = make_speed_regen_capsule_effect(),
}
return item_effects

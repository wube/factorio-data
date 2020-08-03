require ("prototypes.entity.demo-spitter-animations")
local math3d = require "math3d"

function spitter_attack_parameters(data)
  return
  {
    type = "stream",
    ammo_category = "biological",
    cooldown = data.cooldown,
    cooldown_deviation = data.cooldown_deviation,
    range = data.range,
    min_attack_distance = data.min_attack_distance,
    --projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    projectile_creation_parameters = spitter_shoot_shiftings(data.scale, data.scale * scale_spitter_stream),
    use_shooter_direction = true,

    lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

    ammo_type =
    {
      category = "biological",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "stream",
          stream = data.acid_stream_name
        }
      }
    },
    cyclic_sound =
    {
      begin_sound =
      {
        {
          filename = "__base__/sound/creatures/spitter-spit-start-1.ogg",
          volume = 0.27
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-2.ogg",
          volume = 0.27
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-3.ogg",
          volume = 0.27
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-4.ogg",
          volume = 0.27
        }
      },
      middle_sound =
      {
        {
          filename = "__base__/sound/fight/flamethrower-mid.ogg",
          volume = 0
        }
      },
      end_sound =
      {
        {
          filename = "__base__/sound/creatures/spitter-spit-end-1.ogg",
          volume = 0
        }
      }
    },
    --sound = sounds.spitter_roars(data.roarvolume),
    animation = spitterattackanimation(data.scale, data.tint1, data.tint2)
  }
end

function spitter_mid_attack_parameters(data)
  return
  {
    type = "stream",
    ammo_category = "biological",
    cooldown = data.cooldown,
    cooldown_deviation = data.cooldown_deviation,
    range = data.range,
    min_attack_distance = data.min_attack_distance,
    --projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    projectile_creation_parameters = spitter_shoot_shiftings(data.scale, data.scale * scale_spitter_stream),
    use_shooter_direction = true,

    lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

    ammo_type =
    {
      category = "biological",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "stream",
          stream = data.acid_stream_name
        }
      }
    },
    cyclic_sound =
    {
      begin_sound =
      {
        {
          filename = "__base__/sound/creatures/spitter-spit-start-mid-1.ogg",
          volume = 0.35
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-mid-2.ogg",
          volume = 0.35
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-mid-3.ogg",
          volume = 0.35
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-mid-5.ogg",
          volume = 0.35
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-mid-6.ogg",
          volume = 0.35
        }
      },
      middle_sound =
      {
        {
          filename = "__base__/sound/fight/flamethrower-mid.ogg",
          volume = 0
        }
      },
      end_sound =
      {
        {
          filename = "__base__/sound/creatures/spitter-spit-end-1.ogg",
          volume = 0
        }
      }
    },
    --sound = sounds.spitter_roars(data.roarvolume),
    animation = spitterattackanimation(data.scale, data.tint1, data.tint2)
  }
end

function spitter_big_attack_parameters(data)
  return
  {
    type = "stream",
    ammo_category = "biological",
    cooldown = data.cooldown,
    cooldown_deviation = data.cooldown_deviation,
    range = data.range,
    min_attack_distance = data.min_attack_distance,
    --projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    projectile_creation_parameters = spitter_shoot_shiftings(data.scale, data.scale * scale_spitter_stream),
    use_shooter_direction = true,

    lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

    ammo_type =
    {
      category = "biological",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "stream",
          stream = data.acid_stream_name
        }
      }
    },
    cyclic_sound =
    {
      begin_sound =
      {
        {
          filename = "__base__/sound/creatures/spitter-spit-start-big-1.ogg",
          volume = 0.47
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-big-2.ogg",
          volume = 0.47
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-big-3.ogg",
          volume = 0.47
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-big-4.ogg",
          volume = 0.47
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-big-5.ogg",
          volume = 0.47
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-big-6.ogg",
          volume = 0.47
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-big-7.ogg",
          volume = 0.47
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-big-8.ogg",
          volume = 0.47
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-big-9.ogg",
          volume = 0.47
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-big-10.ogg",
          volume = 0.47
        }
      },
      middle_sound =
      {
        {
          filename = "__base__/sound/fight/flamethrower-mid.ogg",
          volume = 0
        }
      },
      end_sound =
      {
        {
          filename = "__base__/sound/creatures/spitter-spit-end-1.ogg",
          volume = 0
        }
      }
    },
    --sound = sounds.spitter_roars(data.roarvolume),
    animation = spitterattackanimation(data.scale, data.tint1, data.tint2)
  }
end

function spitter_behemoth_attack_parameters(data)
  return
  {
    type = "stream",
    ammo_category = "biological",
    cooldown = data.cooldown,
    cooldown_deviation = data.cooldown_deviation,
    range = data.range,
    min_attack_distance = data.min_attack_distance,
    --projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    projectile_creation_parameters = spitter_shoot_shiftings(data.scale, data.scale * scale_spitter_stream),
    use_shooter_direction = true,

    lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

    ammo_type =
    {
      category = "biological",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "stream",
          stream = data.acid_stream_name
        }
      }
    },
    cyclic_sound =
    {
      begin_sound =
      {
        {
          filename = "__base__/sound/creatures/spitter-spit-start-behemoth-1.ogg",
          volume = 0.47
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-behemoth-2.ogg",
          volume = 0.47
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-behemoth-3.ogg",
          volume = 0.47
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-behemoth-4.ogg",
          volume = 0.47
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-behemoth-5.ogg",
          volume = 0.47
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-behemoth-6.ogg",
          volume = 0.47
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-behemoth-7.ogg",
          volume = 0.47
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-start-behemoth-8.ogg",
          volume = 0.47
        }
      },
      middle_sound =
      {
        {
          filename = "__base__/sound/fight/flamethrower-mid.ogg",
          volume = 0
        }
      },
      end_sound =
      {
        {
          filename = "__base__/sound/creatures/spitter-spit-end-big-1.ogg",
          volume = 0.43
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-end-big-2.ogg",
          volume = 0.43
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-end-big-3.ogg",
          volume = 0.43
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-end-big-4.ogg",
          volume = 0.43
        },
        {
          filename = "__base__/sound/creatures/spitter-spit-end-big-5.ogg",
          volume = 0.43
        }
      }
    },
    --sound = sounds.spitter_roars(data.roarvolume),
    animation = spitterattackanimation(data.scale, data.tint1, data.tint2)
  }
end

function acid_stream(data)
  return
  {
    type = "stream",
    name = data.name,
    flags = {"not-on-map"},
    --stream_light = {intensity = 1, size = 4},
    --ground_light = {intensity = 0.8, size = 4},

    particle_buffer_size = 90,
    particle_spawn_interval = data.particle_spawn_interval,
    particle_spawn_timeout = data.particle_spawn_timeout,
    particle_vertical_acceleration = 0.005 * 0.60 *1.5, --x
    particle_horizontal_speed = 0.2* 0.75 * 1.5 * 1.5, --x
    particle_horizontal_speed_deviation = 0.005 * 0.70,
    particle_start_alpha = 0.5,
    particle_end_alpha = 1,
    particle_alpha_per_part = 0.8,
    particle_scale_per_part = 0.8,
    particle_loop_frame_count = 15,
    --particle_fade_out_threshold = 0.95,
    particle_fade_out_duration = 2,
    particle_loop_exit_threshold = 0.25,
    special_neutral_target_damage = {amount = 1, type = "acid"},
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/fight/projectile-acid-burn-loop.ogg",
          volume = 0.4
        },
      }
    },
    initial_action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "play-sound",
              sound =
              {
                {
                  filename = "__base__/sound/creatures/projectile-acid-burn-1.ogg",
                  volume = 0.65
                },
                {
                  filename = "__base__/sound/creatures/projectile-acid-burn-2.ogg",
                  volume = 0.65
                },
                {
                  filename = "__base__/sound/creatures/projectile-acid-burn-long-1.ogg",
                  volume = 0.6
                },
                {
                  filename = "__base__/sound/creatures/projectile-acid-burn-long-2.ogg",
                  volume = 0.6
                }
              }
            },
            {
              type = "create-fire",
              entity_name = data.splash_fire_name,
              tile_collision_mask = { "water-tile" },
              show_in_tooltip = true
            },
            {
              type = "create-entity",
              entity_name = "water-splash",
              tile_collision_mask = { "ground-tile" }
            }
          }
        }
      },
      {
        type = "area",
        radius = data.spit_radius,
        force = "enemy",
        ignore_collision_condition = true,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-sticker",
              sticker = data.sticker_name
            },
            {
              type = "damage",
              damage = {amount = 1, type = "acid"}
            }
          }
        }
      }
    },
    particle = {
      filename = "__base__/graphics/entity/acid-projectile/acid-projectile-head.png",
      line_length = 5,
      width = 22,
      height = 84,
      frame_count = 15,
      shift = util.mul_shift(util.by_pixel(-2, 30), data.scale),
      tint = data.tint,
      priority = "high",
      scale = data.scale,
      animation_speed = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/acid-projectile/hr-acid-projectile-head.png",
        line_length = 5,
        width = 42,
        height = 164,
        frame_count = 15,
        shift = util.mul_shift(util.by_pixel(-2, 31), data.scale),
        tint = data.tint,
        priority = "high",
        scale = 0.5 * data.scale,
        animation_speed = 1,
      }
    },
    spine_animation = {
      filename = "__base__/graphics/entity/acid-projectile/acid-projectile-tail.png",
      line_length = 5,
      width = 66,
      height = 12,
      frame_count = 15,
      shift = util.mul_shift(util.by_pixel(0, -2), data.scale),
      tint = data.tint,
      priority = "high",
      scale = data.scale,
      animation_speed = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/acid-projectile/hr-acid-projectile-tail.png",
        line_length = 5,
        width = 132,
        height = 20,
        frame_count = 15,
        shift = util.mul_shift(util.by_pixel(0, -1), data.scale),
        tint = data.tint,
        priority = "high",
        scale = 0.5 * data.scale,
        animation_speed = 1,
      }
    },
    shadow = {
      filename = "__base__/graphics/entity/acid-projectile/acid-projectile-shadow.png",
      line_length = 15,
      width = 22,
      height = 84,
      frame_count = 15,
      priority = "high",
      shift = util.mul_shift(util.by_pixel(-2, 30), data.scale),
      draw_as_shadow = true,
      scale = data.scale,
      animation_speed = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/acid-projectile/hr-acid-projectile-shadow.png",
        line_length = 15,
        width = 42,
        height = 164,
        frame_count = 15,
        shift = util.mul_shift(util.by_pixel(-2, 31), data.scale),
        draw_as_shadow = true,
        priority = "high",
        scale = 0.5 * data.scale,
        animation_speed = 1,
      }
    },

    oriented_particle = true,
    shadow_scale_enabled = true,
  }
end

function acid_splash_fire(data)
  return{
    type = "fire",
    name = data.name,
    localised_name = {"entity-name.acid-splash"},
    flags = {"placeable-off-grid", "not-on-map"},
    damage_per_tick = {amount = 0 / 60, type = "acid"},
    maximum_damage_multiplier = 3,
    damage_multiplier_increase_per_added_fuel = 1,
    damage_multiplier_decrease_per_tick = 0.005,

    --spawn_entity = "fire-flame-on-tree",
    uses_alternative_behavior = true,
    limit_overlapping_particles = true,
    initial_render_layer = "object",
    render_layer = "lower-object-above-shadow",
    secondary_render_layer = "higher-object-above",
    secondary_picture_fade_out_start = 30,
    secondary_picture_fade_out_duration = 60,

    spread_delay = 300,
    spread_delay_deviation = 180,
    maximum_spread_count = 100,

    particle_alpha = 0.6,
    particle_alpha_blend_duration = 60*5,
    --flame_alpha = 0.35,
    --flame_alpha_deviation = 0.05,

    emissions_per_second = 0,

    add_fuel_cooldown = 10,
    fade_in_duration = 1,
    fade_out_duration = 30,

    initial_lifetime = 60*32,--120,
    lifetime_increase_by = 0,
    lifetime_increase_cooldown = 4,
    maximum_lifetime = 1800,
    delay_between_initial_flames = 10,
    initial_flame_count = 1,
    burnt_patch_lifetime = 0,

    on_damage_tick_effect =
    {
      type = "direct",
      force = "enemy",
      ignore_collision_condition = true,
      trigger_target_mask = { "ground-unit" },
      filter_enabled = true,
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-sticker",
            sticker = data.sticker_name,
            show_in_tooltip = true
          },
          {
            type = "damage",
            damage = { amount = data.splash_damage_per_tick, type = "acid" },
            apply_damage_to_trees = false
          }
        }
      }
    },

    pictures =
    {
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-1.png",
            line_length = 8,
            direction_count = 1,
            width = 106,
            height = 116,
            frame_count = 26,
            shift = util.mul_shift(util.by_pixel(-12, -10), data.scale),
            tint = data.tint,
            scale = data.scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-1.png",
              line_length = 8,
              direction_count = 1,
              width = 210,
              height = 224,
              frame_count = 26,
              shift = util.mul_shift(util.by_pixel(-12, -8), data.scale),
              tint = data.tint,
              scale = 0.5 * data.scale,
            }
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-1-shadow.png",
            line_length = 8,
            direction_count = 1,
            width = 134,
            height = 98,
            frame_count = 26,
            shift = util.mul_shift(util.by_pixel(2, 0), data.scale),
            draw_as_shadow = true,
            scale = data.scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-1-shadow.png",
              line_length = 8,
              direction_count = 1,
              width = 266,
              height = 188,
              frame_count = 26,
              shift = util.mul_shift(util.by_pixel(2, 2), data.scale),
              draw_as_shadow = true,
              scale = 0.5 * data.scale,
            }
          }
        },
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-2.png",
            line_length = 8,
            direction_count = 1,
            width = 88,
            height = 76,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(-10, -18), data.scale),
            tint = data.tint,
            scale = data.scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-2.png",
              line_length = 8,
              direction_count = 1,
              width = 174,
              height = 150,
              frame_count = 29,
              shift = util.mul_shift(util.by_pixel(-9, -17), data.scale),
              tint = data.tint,
              scale = 0.5 * data.scale,
            }
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-2-shadow.png",
            line_length = 8,
            direction_count = 1,
            width = 120,
            height = 136,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(6, 28), data.scale),
            draw_as_shadow = true,
            scale = data.scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-2-shadow.png",
              line_length = 8,
              direction_count = 1,
              width = 238,
              height = 266,
              frame_count = 29,
              shift = util.mul_shift(util.by_pixel(6, 29), data.scale),
              draw_as_shadow = true,
              scale = 0.5 * data.scale,
            }
          }
        },
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-3.png",
            line_length = 8,
            direction_count = 1,
            width = 118,
            height = 104,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(22, -16), data.scale),
            tint = data.tint,
            scale = data.scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-3.png",
              line_length = 8,
              direction_count = 1,
              width = 236,
              height = 208,
              frame_count = 29,
              shift = util.mul_shift(util.by_pixel(22, -16), data.scale),
              tint = data.tint,
              scale = 0.5 * data.scale,
            }
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-3-shadow.png",
            line_length = 8,
            direction_count = 1,
            width = 110,
            height = 70,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(16, 2), data.scale),
            draw_as_shadow = true,
            scale = data.scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-3-shadow.png",
              line_length = 8,
              direction_count = 1,
              width = 214,
              height = 140,
              frame_count = 29,
              shift = util.mul_shift(util.by_pixel(17, 2), data.scale),
              draw_as_shadow = true,
              scale = 0.5 * data.scale,
            }
          }
        },
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-4.png",
            line_length = 8,
            direction_count = 1,
            width = 128,
            height = 80,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(16, -20), data.scale),
            tint = data.tint,
            scale = data.scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-4.png",
              line_length = 8,
              direction_count = 1,
              width = 252,
              height = 154,
              frame_count = 24,
              shift = util.mul_shift(util.by_pixel(17, -19), data.scale),
              tint = data.tint,
              scale = 0.5 * data.scale,
            }
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-4-shadow.png",
            line_length = 8,
            direction_count = 1,
            width = 124,
            height = 80,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(18, -16), data.scale),
            draw_as_shadow = true,
            scale = data.scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-4-shadow.png",
              line_length = 8,
              direction_count = 1,
              width = 248,
              height = 160,
              frame_count = 24,
              shift = util.mul_shift(util.by_pixel(18, -16), data.scale),
              draw_as_shadow = true,
              scale = 0.5 * data.scale,
            }
          }
        }
      },
    },

    secondary_pictures =
    {
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-1.png",
            line_length = 8,
            direction_count = 1,
            width = 106,
            height = 116,
            frame_count = 26,
            shift = util.mul_shift(util.by_pixel(-12, -10), data.ground_patch_scale),
            tint = util.multiply_color(data.tint , data.patch_tint_multiplier),
            scale = data.ground_patch_scale ,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-1.png",
              line_length = 8,
              direction_count = 1,
              width = 210,
              height = 224,
              frame_count = 26,
              shift = util.mul_shift(util.by_pixel(-12, -8), data.ground_patch_scale),
              tint = util.multiply_color(data.tint , data.patch_tint_multiplier),
              scale = 0.5 * data.ground_patch_scale,
            }
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-1-shadow.png",
            line_length = 8,
            direction_count = 1,
            width = 134,
            height = 98,
            frame_count = 26,
            shift = util.mul_shift(util.by_pixel(2, 0), data.ground_patch_scale),
            draw_as_shadow = true,
            scale = data.ground_patch_scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-1-shadow.png",
              line_length = 8,
              direction_count = 1,
              width = 266,
              height = 188,
              frame_count = 26,
              shift = util.mul_shift(util.by_pixel(2, 2), data.ground_patch_scale),
              draw_as_shadow = true,
              scale = 0.5 * data.ground_patch_scale,
            }
          }
        },
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-2.png",
            line_length = 8,
            direction_count = 1,
            width = 88,
            height = 76,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(-10, -18), data.ground_patch_scale),
            tint = util.multiply_color(data.tint , data.patch_tint_multiplier),
            scale = data.ground_patch_scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-2.png",
              line_length = 8,
              direction_count = 1,
              width = 174,
              height = 150,
              frame_count = 29,
              shift = util.mul_shift(util.by_pixel(-9, -17), data.ground_patch_scale),
              tint = util.multiply_color(data.tint , data.patch_tint_multiplier),
              scale = 0.5 * data.ground_patch_scale,
            }
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-2-shadow.png",
            line_length = 8,
            direction_count = 1,
            width = 120,
            height = 136,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(6, 28), data.ground_patch_scale),
            draw_as_shadow = true,
            scale = data.ground_patch_scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-2-shadow.png",
              line_length = 8,
              direction_count = 1,
              width = 238,
              height = 266,
              frame_count = 29,
              shift = util.mul_shift(util.by_pixel(6, 29), data.ground_patch_scale),
              draw_as_shadow = true,
              scale = 0.5 * data.ground_patch_scale,
            }
          }
        },
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-3.png",
            line_length = 8,
            direction_count = 1,
            width = 118,
            height = 104,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(22, -16), data.ground_patch_scale),
            tint = util.multiply_color(data.tint , data.patch_tint_multiplier),
            scale = data.ground_patch_scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-3.png",
              line_length = 8,
              direction_count = 1,
              width = 236,
              height = 208,
              frame_count = 29,
              shift = util.mul_shift(util.by_pixel(22, -16), data.ground_patch_scale),
              tint = util.multiply_color(data.tint , data.patch_tint_multiplier),
              scale = 0.5 * data.ground_patch_scale,
            }
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-3-shadow.png",
            line_length = 8,
            direction_count = 1,
            width = 110,
            height = 70,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(16, 2), data.ground_patch_scale),
            draw_as_shadow = true,
            scale = data.ground_patch_scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-3-shadow.png",
              line_length = 8,
              direction_count = 1,
              width = 214,
              height = 140,
              frame_count = 29,
              shift = util.mul_shift(util.by_pixel(17, 2), data.ground_patch_scale),
              draw_as_shadow = true,
              scale = 0.5 * data.ground_patch_scale,
            }
          }
        },
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-4.png",
            line_length = 8,
            direction_count = 1,
            width = 128,
            height = 80,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(16, -20), data.ground_patch_scale),
            tint = util.multiply_color(data.tint , data.patch_tint_multiplier),
            scale = data.ground_patch_scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-4.png",
              line_length = 8,
              direction_count = 1,
              width = 252,
              height = 154,
              frame_count = 24,
              shift = util.mul_shift(util.by_pixel(17, -19), data.ground_patch_scale),
              tint = util.multiply_color(data.tint , data.patch_tint_multiplier),
              scale = 0.5 * data.ground_patch_scale,
            }
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-4-shadow.png",
            line_length = 8,
            direction_count = 1,
            width = 124,
            height = 80,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(18, -16), data.ground_patch_scale),
            draw_as_shadow = true,
            scale = data.ground_patch_scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-4-shadow.png",
              line_length = 8,
              direction_count = 1,
              width = 248,
              height = 160,
              frame_count = 24,
              shift = util.mul_shift(util.by_pixel(18, -16), data.ground_patch_scale),
              draw_as_shadow = true,
              scale = 0.5 * data.ground_patch_scale,
            }
          }
        }
      },
    }
  }
end

function acid_sticker(data)
  return{
    type = "sticker",
    name = data.name,
    flags = {"not-on-map"},

    animation =
    {
      filename = "__base__/graphics/entity/acid-sticker/acid-sticker.png",
      priority = "extra-high",
      line_length = 5,
      width = 16,
      height = 18,
      frame_count = 50,
      animation_speed = 0.5,
      tint = {r = 0.714, g = 0.669, b = 0.291, a = 0.745}, -- #b6aa4abe
      shift = util.by_pixel (2,0),
      hr_version = 
      {
        filename = "__base__/graphics/entity/acid-sticker/hr-acid-sticker.png",
        line_length = 5,
        width = 30,
        height = 34,
        frame_count = 50,
        animation_speed = 0.5,
        tint = {r = 0.714, g = 0.669, b = 0.291, a = 0.745}, -- #b6aa4abe
        shift = util.by_pixel(1.5, 0),
        scale = 0.5
      }
    },
    duration_in_ticks = data.slow_seconds * 60,
    target_movement_modifier_from = data.slow_player_movement,
    target_movement_modifier_to = 1,
    vehicle_speed_modifier_from = data.slow_vehicle_speed,
    vehicle_speed_modifier_to = 1,
    vehicle_friction_modifier_from = data.slow_vehicle_friction,
    vehicle_friction_modifier_to = 1,
    --damage_per_tick = { amount = 100 / 60, type = "fire" }
  }
end

scale_spitter_small    = 0.5
scale_spitter_medium   = 0.7
scale_spitter_big      = 1.0
scale_spitter_behemoth = 1.2

stream_scale_spitter_small    = 0.5
stream_scale_spitter_medium   = 0.7
stream_scale_spitter_big      = 1.0
stream_scale_spitter_behemoth = 1.2

tint_1_spitter_small    = {r=0.94 , g=0.61 , b=0    , a=1 }
tint_2_spitter_small    = {r=0.91 , g=0.92 , b=0.87 , a=1 }
tint_1_spitter_medium   = {r=0.76 , g=0.22 , b=0.30 , a=1 }
tint_2_spitter_medium   = {r=0.89 , g=0.84 , b=0.85 , a=1 }
tint_1_spitter_big      = {r=0.15 , g=0.43 , b=0.68 , a=1 }
tint_2_spitter_big      = {r=0.8  , g=0.82 , b=0.85 , a=1 }
tint_1_spitter_behemoth = {r=0.36 , g=0.18 , b=0.13 , a=1 }
tint_2_spitter_behemoth = {r = 0.7, g = 0.95, b = 0.4, a = 1.000}

stream_tint =  {r = 0.917, g = 1.000, b = 0.282, a = 1.000}-- #e9ff47ff
splash_tint =  {r = 1.000, g = 0.992, b = 0.512, a = 1.000} -- #fffc82ff
sticker_tint = {r = 0.129, g = 0.283, b = 0.078, a = 1.000} -- #204813ff

stream_tint_spitter_small    = stream_tint
stream_tint_spitter_medium   = stream_tint
stream_tint_spitter_big      = stream_tint
stream_tint_spitter_behemoth = stream_tint

stream_tint_worm_small    = stream_tint_spitter_small
stream_tint_worm_medium   = stream_tint_spitter_medium
stream_tint_worm_big      = stream_tint_spitter_big
stream_tint_worm_behemoth = stream_tint_spitter_behemoth

tint_worm_small      = {r = 0.7, g = 1, b = 0.3  , a = 0.5}--{r=1    , g=0.63 , b=0    , a=0.5  }
tint_worm_medium     = {r=0.9  , g=0.15 , b=0.3  , a=1    }
tint_worm_big        = {r=0.34 , g=0.68 , b=0.90 , a=0.8    }
tint_worm_behemoth   = {r = 0.3, g = 1, b = 0  , a = 0.8}

splash_tint_spitter_small      = splash_tint
splash_tint_spitter_medium     = splash_tint
splash_tint_spitter_big        = splash_tint
splash_tint_spitter_behemoth   = splash_tint

splash_tint_worm_small      = splash_tint_spitter_small
splash_tint_worm_medium     = splash_tint_spitter_medium
splash_tint_worm_big        = splash_tint_spitter_big
splash_tint_worm_behemoth   = splash_tint_spitter_behemoth

sticker_tint_small     = sticker_tint
sticker_tint_medium    = sticker_tint
sticker_tint_big       = sticker_tint
sticker_tint_behemoth  = sticker_tint

scale_worm_small     = 0.65
scale_worm_medium    = 0.83
scale_worm_big       = 1.0
scale_worm_behemoth  = 1.2

scale_worm_stream    = 15
scale_spitter_stream = 20

stream_scale_worm_small    = 0.65
stream_scale_worm_medium   = 0.83
stream_scale_worm_big      = 1.0
stream_scale_worm_behemoth = 1.2

damage_modifier_spitter_small    = 12
damage_modifier_spitter_medium   = 24
damage_modifier_spitter_big      = 36
damage_modifier_spitter_behemoth = 60

damage_modifier_worm_small    = 36
damage_modifier_worm_medium   = 48
damage_modifier_worm_big      = 72
damage_modifier_worm_behemoth = 96

damage_splash_worm_small    = 0.1
damage_splash_worm_medium   = 0.2
damage_splash_worm_big      = 0.6
damage_splash_worm_behemoth = 1.2

damage_splash_spitter_small    = 0.1
damage_splash_spitter_medium   = 0.2
damage_splash_spitter_big      = 0.6
damage_splash_spitter_behemoth = 1.0

stream_radius_spitter_small    = 1
stream_radius_spitter_medium   = 1.25
stream_radius_spitter_big      = 1.35
stream_radius_spitter_behemoth = 1.75

stream_radius_worm_small    = 1.4
stream_radius_worm_medium   = 1.55
stream_radius_worm_big      = 1.75
stream_radius_worm_behemoth = 2

range_spitter_small    = 13
range_spitter_medium   = 14
range_spitter_big      = 15
range_spitter_behemoth = 16

range_worm_small    = 25
range_worm_medium   = 30
range_worm_big      = 38
range_worm_behemoth = 48

prepare_range_worm_small    = 8
prepare_range_worm_medium   = 16
prepare_range_worm_big      = 24
prepare_range_worm_behemoth = 36

ground_patch_scale_modifier = 0.65
patch_opacity = 0.7

data:extend(
{
  -- W O R M   S T R E A M S --------------------------------------------------------------------------------------------------------
  acid_stream({
    name = "acid-stream-worm-small",
    scale = scale_worm_small*1.1,
    tint = stream_tint_worm_small,
    corpse_name = "acid-splash-worm-small",
    spit_radius = stream_radius_worm_small,
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = "acid-splash-fire-worm-small",
    sticker_name = "acid-sticker-small"
  }),
  acid_stream({
    name = "acid-stream-worm-medium",
    scale = scale_worm_medium,
    tint = stream_tint_worm_medium,
    corpse_name = "acid-splash-worm-medium",
    spit_radius = stream_radius_worm_medium,
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = "acid-splash-fire-worm-medium",
    sticker_name = "acid-sticker-medium"
  }),
  acid_stream({
    name = "acid-stream-worm-big",
    scale = scale_worm_big,
    tint = stream_tint_worm_big,
    corpse_name = "acid-splash-worm-big",
    spit_radius = stream_radius_worm_big,
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = "acid-splash-fire-worm-big",
    sticker_name = "acid-sticker-big"
  }),
  acid_stream({
    name = "acid-stream-worm-behemoth",
    scale = scale_worm_behemoth,
    tint = stream_tint_worm_behemoth,
    corpse_name = "acid-splash-worm-behemoth",
    spit_radius = stream_radius_worm_behemoth,
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = "acid-splash-fire-worm-behemoth",
    sticker_name = "acid-sticker-behemoth"
  }),
  -- S P I T T E R   S T R E A M S --------------------------------------------------------------------------------------------------------
  acid_stream({
    name = "acid-stream-spitter-small",
    scale = scale_spitter_small*1.1,
    tint = stream_tint_spitter_small,
    corpse_name = "acid-splash-spitter-small",
    spit_radius = stream_radius_spitter_small,
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = "acid-splash-fire-spitter-small",
    sticker_name = "acid-sticker-small"
  }),
  acid_stream({
    name = "acid-stream-spitter-medium",
    scale = scale_spitter_medium,
    tint = stream_tint_spitter_medium,
    corpse_name = "acid-splash-spitter-medium",
    spit_radius = stream_radius_spitter_medium,
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = "acid-splash-fire-spitter-medium",
    sticker_name = "acid-sticker-medium"
  }),
  acid_stream({
    name = "acid-stream-spitter-big",
    scale = scale_spitter_big,
    tint = stream_tint_spitter_big,
    corpse_name = "acid-splash-spitter-big",
    spit_radius = stream_radius_spitter_big,
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = "acid-splash-fire-spitter-big",
    sticker_name = "acid-sticker-big"
  }),
  acid_stream({
    name = "acid-stream-spitter-behemoth",
    scale = scale_spitter_behemoth,
    tint = stream_tint_spitter_behemoth,
    corpse_name = "acid-splash-spitter-behemoth",
    spit_radius = stream_radius_spitter_behemoth,
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = "acid-splash-fire-spitter-behemoth",
    sticker_name = "acid-sticker-behemoth"
  }),

  -- A C I D   S P L A S H   F I R E ------------------------------------------------------------------------------------------------------
  acid_splash_fire({
    name = "acid-splash-fire-worm-small",
    scale = scale_worm_small,
    tint = splash_tint_worm_small,
    ground_patch_scale = scale_worm_small * ground_patch_scale_modifier,
    patch_tint_multiplier = patch_opacity,
    splash_damage_per_tick = damage_splash_worm_small,
    sticker_name = "acid-sticker-small"
  }),
  acid_splash_fire({
    name = "acid-splash-fire-worm-medium",
    scale = scale_worm_medium,
    tint = splash_tint_worm_medium,
    ground_patch_scale = scale_worm_medium * ground_patch_scale_modifier,
    patch_tint_multiplier = patch_opacity,
    splash_damage_per_tick = damage_splash_worm_medium,
    sticker_name = "acid-sticker-medium"
  }),
  acid_splash_fire({
    name = "acid-splash-fire-worm-big",
    scale = scale_worm_big,
    tint = splash_tint_worm_big,
    ground_patch_scale = scale_worm_big * ground_patch_scale_modifier,
    patch_tint_multiplier = patch_opacity,
    splash_damage_per_tick = damage_splash_worm_big,
    sticker_name = "acid-sticker-big"
  }),
  acid_splash_fire({
    name = "acid-splash-fire-worm-behemoth",
    scale = scale_worm_behemoth,
    tint = splash_tint_worm_behemoth,
    ground_patch_scale = scale_worm_behemoth * ground_patch_scale_modifier,
    patch_tint_multiplier = patch_opacity,
    splash_damage_per_tick = damage_splash_worm_behemoth,
    sticker_name = "acid-sticker-behemoth"
  }),
  ------------------------------------------------------------------
  acid_splash_fire({
    name = "acid-splash-fire-spitter-small",
    scale = scale_spitter_small,
    tint = splash_tint_spitter_small,
    ground_patch_scale = scale_spitter_small * ground_patch_scale_modifier,
    patch_tint_multiplier = patch_opacity,
    splash_damage_per_tick = damage_splash_spitter_small,
    sticker_name = "acid-sticker-small"
  }),
  acid_splash_fire({
    name = "acid-splash-fire-spitter-medium",
    scale = scale_spitter_medium,
    tint = splash_tint_spitter_medium,
    ground_patch_scale = scale_spitter_medium * ground_patch_scale_modifier,
    patch_tint_multiplier = patch_opacity,
    splash_damage_per_tick = damage_splash_spitter_medium,
    sticker_name = "acid-sticker-medium"
  }),
  acid_splash_fire({
    name = "acid-splash-fire-spitter-big",
    scale = scale_spitter_big,
    tint = splash_tint_spitter_big,
    ground_patch_scale = scale_spitter_big * ground_patch_scale_modifier,
    patch_tint_multiplier = patch_opacity,
    splash_damage_per_tick = damage_splash_spitter_big,
    sticker_name = "acid-sticker-big"
  }),
  acid_splash_fire({
    name = "acid-splash-fire-spitter-behemoth",
    scale = scale_spitter_behemoth,
    tint = splash_tint_spitter_behemoth,
    ground_patch_scale = scale_spitter_behemoth * ground_patch_scale_modifier,
    patch_tint_multiplier = patch_opacity,
    splash_damage_per_tick = damage_splash_spitter_behemoth,
    sticker_name = "acid-sticker-behemoth"
  }),

  -- A C I D   S T I C K E R --------------------------------------------------------------------------------------------------------------
  acid_sticker({
    name = "acid-sticker-small",
    tint = sticker_tint_small,
    slow_player_movement = 0.6,
    slow_vehicle_speed = 0.6,
    slow_vehicle_friction =1.5,
    slow_seconds = 2
  }),
  acid_sticker({
    name = "acid-sticker-medium",
    tint = sticker_tint_medium,
    slow_player_movement = 0.5,
    slow_vehicle_speed = 0.5,
    slow_vehicle_friction = 1.5,
    slow_seconds = 2
  }),
  acid_sticker({
    name = "acid-sticker-big",
    tint = sticker_tint_big,
    slow_player_movement = 0.4,
    slow_vehicle_speed = 0.4,
    slow_vehicle_friction = 1.5,
    slow_seconds = 2
  }),
  acid_sticker({
    name = "acid-sticker-behemoth",
    tint = sticker_tint_behemoth,
    slow_player_movement = 0.3,
    slow_vehicle_speed = 0.3,
    slow_vehicle_friction = 1.5,
    slow_seconds = 2
  }),
})

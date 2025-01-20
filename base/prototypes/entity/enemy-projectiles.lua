require ("prototypes.entity.spitter-animations")
require ("prototypes.entity.enemy-constants")

local math3d = require "math3d"

function spitter_attack_parameters(data)
  return
  {
    type = "stream",
    ammo_category = "biological",
    cooldown = data.cooldown,
    cooldown_deviation = data.cooldown_deviation,
    range = data.range,
    range_mode = data.range_mode,
    min_attack_distance = data.min_attack_distance,
    --projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    projectile_creation_parameters = spitter_shoot_shiftings(data.scale, data.scale * scale_spitter_stream),
    use_shooter_direction = true,

    lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

    ammo_type =
    {
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
        category = "enemy",
        variations = sound_variations("__base__/sound/creatures/spitter-spit-start", 4, 0.27),
        aggregation = { max_count = 1, remove = true, count_already_playing = true}
      }
    },
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
    range_mode = data.range_mode,
    min_attack_distance = data.min_attack_distance,
    --projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    projectile_creation_parameters = spitter_shoot_shiftings(data.scale, data.scale * scale_spitter_stream),
    use_shooter_direction = true,

    lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

    ammo_type =
    {
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
        category = "enemy",
        variations = sound_variations("__base__/sound/creatures/spitter-spit-start-mid", 5, 0.35),
        aggregation = { max_count = 3, remove = true, count_already_playing = true}
      }
    },
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
    range_mode = data.range_mode,
    min_attack_distance = data.min_attack_distance,
    --projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    projectile_creation_parameters = spitter_shoot_shiftings(data.scale, data.scale * scale_spitter_stream),
    use_shooter_direction = true,

    lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

    ammo_type =
    {
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
        category = "enemy",
        variations = sound_variations("__base__/sound/creatures/spitter-spit-start-big", 10, 0.47),
        aggregation = { max_count = 3, remove = true, count_already_playing = true}
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
    range_mode = data.range_mode,
    min_attack_distance = data.min_attack_distance,
    --projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    projectile_creation_parameters = spitter_shoot_shiftings(data.scale, data.scale * scale_spitter_stream),
    use_shooter_direction = true,

    lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

    ammo_type =
    {
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
        category = "enemy",
        variations = sound_variations("__base__/sound/creatures/spitter-spit-start-behemoth", 8, 0.47),
        aggregation = { max_count = 3, remove = true, count_already_playing = true}
      },
      end_sound =
      {
        category = "enemy",
        variations = sound_variations("__base__/sound/creatures/spitter-spit-end-big", 5, 0.43),
        aggregation = { max_count = 3, remove = true, count_already_playing = true}
      }
    },
    animation = spitterattackanimation(data.scale, data.tint1, data.tint2)
  }
end

function acid_stream(data)
  return
  {
    type = "stream",
    name = data.name,
    flags = {"not-on-map"},
    hidden = true,
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
    target_initial_position_only = true,
    special_neutral_target_damage = {amount = 1, type = "acid"},
    working_sound =
    {
      sound = {category = "enemy", filename = "__base__/sound/fight/projectile-acid-burn-loop.ogg", volume = 0.4},
      max_sounds_per_type = 3
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
                category = "enemy",
                variations =
                {
                  {filename = "__base__/sound/creatures/projectile-acid-burn-1.ogg", volume = 0.65, modifiers = volume_multiplier("main-menu", 0.9)},
                  {filename = "__base__/sound/creatures/projectile-acid-burn-2.ogg", volume = 0.65, modifiers = volume_multiplier("main-menu", 0.9)},
                  {filename = "__base__/sound/creatures/projectile-acid-burn-long-1.ogg", volume = 0.65, modifiers = volume_multiplier("main-menu", 0.9)},
                  {filename = "__base__/sound/creatures/projectile-acid-burn-long-2.ogg", volume = 0.65, modifiers = volume_multiplier("main-menu", 0.9)},
                },
                aggregation = {max_count = 3, remove = true, count_already_playing = true}
              }
            },
            {
              type = "create-fire",
              entity_name = data.splash_fire_name,
              tile_collision_mask = {layers={water_tile=true}},
              show_in_tooltip = true
            },
            {
              type = "create-entity",
              entity_name = "water-splash",
              tile_collision_mask = {layers={ground_tile=true}}
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
    particle =
    {
      filename = "__base__/graphics/entity/acid-projectile/acid-projectile-head.png",
      draw_as_glow = true,
      line_length = 5,
      width = 42,
      height = 164,
      frame_count = 15,
      shift = util.mul_shift(util.by_pixel(-2, 31), data.scale),
      tint = data.tint,
      priority = "high",
      scale = 0.5 * data.scale,
      animation_speed = 1
    },
    spine_animation =
    {
      filename = "__base__/graphics/entity/acid-projectile/acid-projectile-tail.png",
      draw_as_glow = true,
      line_length = 5,
      width = 132,
      height = 20,
      frame_count = 15,
      shift = util.mul_shift(util.by_pixel(0, -1), data.scale),
      tint = data.tint,
      priority = "high",
      scale = 0.5 * data.scale,
      animation_speed = 1
    },
    shadow =
    {
      filename = "__base__/graphics/entity/acid-projectile/acid-projectile-shadow.png",
      line_length = 15,
      width = 42,
      height = 164,
      frame_count = 15,
      shift = util.mul_shift(util.by_pixel(-2, 31), data.scale),
      draw_as_shadow = true,
      priority = "high",
      scale = 0.5 * data.scale,
      animation_speed = 1
    },

    oriented_particle = true,
    shadow_scale_enabled = true
  }
end

function acid_splash_fire(data)
  return
  {
    type = "fire",
    name = data.name,
    localised_name = {"entity-name.acid-splash"},
    flags = {"placeable-off-grid", "not-on-map"},
    hidden = true,
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
            draw_as_glow = true,
            line_length = 8,
            width = 210,
            height = 224,
            frame_count = 26,
            shift = util.mul_shift(util.by_pixel(-12, -8), data.scale),
            tint = data.tint,
            scale = 0.5 * data.scale
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-1-shadow.png",
            line_length = 8,
            width = 266,
            height = 188,
            frame_count = 26,
            shift = util.mul_shift(util.by_pixel(2, 2), data.scale),
            draw_as_shadow = true,
            scale = 0.5 * data.scale
          }
        }
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-2.png",
            draw_as_glow = true,
            line_length = 8,
            width = 174,
            height = 150,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(-9, -17), data.scale),
            tint = data.tint,
            scale = 0.5 * data.scale
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-2-shadow.png",
            line_length = 8,
            width = 238,
            height = 266,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(6, 29), data.scale),
            draw_as_shadow = true,
            scale = 0.5 * data.scale
          }
        }
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-3.png",
            draw_as_glow = true,
            line_length = 8,
            width = 236,
            height = 208,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(22, -16), data.scale),
            tint = data.tint,
            scale = 0.5 * data.scale
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-3-shadow.png",
            line_length = 8,
            width = 214,
            height = 140,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(17, 2), data.scale),
            draw_as_shadow = true,
            scale = 0.5 * data.scale
          }
        }
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-4.png",
            draw_as_glow = true,
            line_length = 8,
            width = 252,
            height = 154,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(17, -19), data.scale),
            tint = data.tint,
            scale = 0.5 * data.scale
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-4-shadow.png",
            line_length = 8,
            width = 248,
            height = 160,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(18, -16), data.scale),
            draw_as_shadow = true,
            scale = 0.5 * data.scale
          }
        }
      }
    },

    secondary_pictures =
    {
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-1.png",
            draw_as_glow = true,
            line_length = 8,
            width = 210,
            height = 224,
            frame_count = 26,
            shift = util.mul_shift(util.by_pixel(-12, -8), data.ground_patch_scale),
            tint = util.multiply_color(data.tint , data.patch_tint_multiplier),
            scale = 0.5 * data.ground_patch_scale
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-1-shadow.png",
            line_length = 8,
            width = 266,
            height = 188,
            frame_count = 26,
            shift = util.mul_shift(util.by_pixel(2, 2), data.ground_patch_scale),
            draw_as_shadow = true,
            scale = 0.5 * data.ground_patch_scale
          }
        }
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-2.png",
            draw_as_glow = true,
            line_length = 8,
            width = 174,
            height = 150,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(-9, -17), data.ground_patch_scale),
            tint = util.multiply_color(data.tint , data.patch_tint_multiplier),
            scale = 0.5 * data.ground_patch_scale
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-2-shadow.png",
            line_length = 8,
            width = 238,
            height = 266,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(6, 29), data.ground_patch_scale),
            draw_as_shadow = true,
            scale = 0.5 * data.ground_patch_scale
          }
        }
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-3.png",
            draw_as_glow = true,
            line_length = 8,
            width = 236,
            height = 208,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(22, -16), data.ground_patch_scale),
            tint = util.multiply_color(data.tint , data.patch_tint_multiplier),
            scale = 0.5 * data.ground_patch_scale
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-3-shadow.png",
            line_length = 8,
            width = 214,
            height = 140,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(17, 2), data.ground_patch_scale),
            draw_as_shadow = true,
            scale = 0.5 * data.ground_patch_scale
          }
        }
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-4.png",
            draw_as_glow = true,
            line_length = 8,
            width = 252,
            height = 154,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(17, -19), data.ground_patch_scale),
            tint = util.multiply_color(data.tint , data.patch_tint_multiplier),
            scale = 0.5 * data.ground_patch_scale
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-4-shadow.png",
            line_length = 8,
            width = 248,
            height = 160,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(18, -16), data.ground_patch_scale),
            draw_as_shadow = true,
            scale = 0.5 * data.ground_patch_scale
          }
        }
      }
    }
  }
end

function acid_sticker(data)
  return
  {
    type = "sticker",
    name = data.name,
    flags = {"not-on-map"},
    hidden = true,
    animation =
    {
      filename = "__base__/graphics/entity/acid-sticker/acid-sticker.png",
      draw_as_glow = true,
      line_length = 5,
      width = 30,
      height = 34,
      frame_count = 50,
      animation_speed = 0.5,
      tint = data.tint or {r = 0.714, g = 0.669, b = 0.291, a = 0.745}, -- #b6aa4abe
      shift = util.by_pixel(1.5, 0),
      scale = 0.5
    },
    duration_in_ticks = data.slow_seconds * 60,
    target_movement_modifier_from = data.slow_player_movement,
    target_movement_modifier_to = 1,
    vehicle_speed_modifier_from = data.slow_vehicle_speed,
    vehicle_speed_modifier_to = 1,
    vehicle_friction_modifier_from = data.slow_vehicle_friction,
    vehicle_friction_modifier_to = 1,
  }
end


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
  })
})

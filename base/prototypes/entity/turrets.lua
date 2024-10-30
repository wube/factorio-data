require ("circuit-connector-sprites")
require ("prototypes.entity.enemy-projectiles")
require ("prototypes.entity.worm-animations")
require ("prototypes.entity.pipecovers")
require ("prototypes.entity.assemblerpipes")
enemy_autoplace = require ("prototypes.entity.enemy-autoplace-utils")

local sounds = require("prototypes.entity.sounds")
local hit_effects = require ("prototypes.entity.hit-effects")

function shift_medium_worm(shiftx, shifty)
  return {shiftx - 0.15, shifty + 0.15}
end

function shift_big_worm(shiftx, shifty)
  return {shiftx - 0.2, shifty + 0.2}
end

local util = require('util')

local end_attack_speed_multiplier_when_killed = 2
local start_attack_speed_multiplier_when_killed = 2
local prepared_alternative_speed_multiplier_when_killed = 2
local folding_speed_multiplier_when_killed = 2
local preparing_speed_multiplier_when_killed = 2

local end_attack_starting_progress_when_killed = 13 / 22 -- first 13-14 frames are just a two frame loop during which the worm vomits the acid, so we can skip it
local prepared_starting_progress_when_killed = (71-15) / 71

function gun_turret_extension(inputs)
return
{
  filename = "__base__/graphics/entity/gun-turret/gun-turret-raising.png",
  priority = "medium",
  width = 130,
  height = 126,
  direction_count = 4,
  frame_count = inputs.frame_count or 5,
  line_length = inputs.line_length or 0,
  run_mode = inputs.run_mode or "forward",
  shift = util.by_pixel(0, -26.5),
  scale = 0.5
}
end

function gun_turret_extension_mask(inputs)
return
{
  filename = "__base__/graphics/entity/gun-turret/gun-turret-raising-mask.png",
  flags = {"mask"},
  width = 48,
  height = 62,
  direction_count = 4,
  frame_count = inputs.frame_count or 5,
  line_length = inputs.line_length or 0,
  run_mode = inputs.run_mode or "forward",
  shift = util.by_pixel(0, -28),
  apply_runtime_tint = true,
  scale = 0.5
}
end

function gun_turret_extension_shadow(inputs)
return
{
  filename = "__base__/graphics/entity/gun-turret/gun-turret-raising-shadow.png",
  width = 250,
  height = 124,
  direction_count = 4,
  frame_count = inputs.frame_count or 5,
  line_length = inputs.line_length or 0,
  run_mode = inputs.run_mode or "forward",
  shift = util.by_pixel(19, 2.5),
  draw_as_shadow = true,
  scale = 0.5
}
end

function gun_turret_attack(inputs)
return
{
  layers =
  {
    {
      width = 132,
      height = 130,
      frame_count = inputs.frame_count or 2,
      direction_count = 64,
      shift = util.by_pixel(0, -27.5),
      stripes =
      {
      {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-1.png",
      width_in_frames = inputs.frame_count or 2,
      height_in_frames = 16
      },
      {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-2.png",
      width_in_frames = inputs.frame_count or 2,
      height_in_frames = 16
      },
      {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-3.png",
      width_in_frames = inputs.frame_count or 2,
      height_in_frames = 16
      },
      {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-4.png",
      width_in_frames = inputs.frame_count or 2,
      height_in_frames = 16
      }
      },
      scale = 0.5
    },
    {
      flags = {"mask"},
      line_length = inputs.frame_count or 2,
      width = 58,
      height = 54,
      frame_count = inputs.frame_count or 2,
      direction_count = 64,
      shift = util.by_pixel(0, -32.5),
      apply_runtime_tint = true,
      stripes =
      {
      {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-1.png",
      width_in_frames = inputs.frame_count or 2,
      height_in_frames = 16
      },
      {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-2.png",
      width_in_frames = inputs.frame_count or 2,
      height_in_frames = 16
      },
      {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-3.png",
      width_in_frames = inputs.frame_count or 2,
      height_in_frames = 16
      },
      {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-4.png",
      width_in_frames = inputs.frame_count or 2,
      height_in_frames = 16
      }
      },
      scale = 0.5
    },
    {
      width = 250,
      height = 124,
      frame_count = inputs.frame_count or 2,
      direction_count = 64,
      shift = util.by_pixel(22, 2.5),
      draw_as_shadow = true,
      stripes =
      {
      {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-1.png",
      width_in_frames = inputs.frame_count or 2,
      height_in_frames = 16
      },
      {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-2.png",
      width_in_frames = inputs.frame_count or 2,
      height_in_frames = 16
      },
      {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-3.png",
      width_in_frames = inputs.frame_count or 2,
      height_in_frames = 16
      },
      {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-4.png",
      width_in_frames = inputs.frame_count or 2,
      height_in_frames = 16
      }
      },
      scale = 0.5
    }
  }
}
end

function laser_turret_extension(inputs)
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-raising.png",
    priority = "medium",
    width = 130,
    height = 126,
    frame_count = inputs.frame_count or 15,
    line_length = inputs.line_length or 0,
    run_mode = inputs.run_mode or "forward",
    direction_count = 4,
    shift = util.by_pixel(0, -32.5),
    scale = 0.5
  }
end

function laser_turret_extension_shadow(inputs)
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-raising-shadow.png",
    width = 182,
    height = 96,
    frame_count = inputs.frame_count or 15,
    line_length = inputs.line_length or 0,
    run_mode = inputs.run_mode or "forward",
    direction_count = 4,
    draw_as_shadow = true,
    shift = util.by_pixel(47, 2.5),
    scale = 0.5
  }
end

function laser_turret_extension_mask(inputs)
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-raising-mask.png",
    flags = {"mask"},
    width = 86,
    height = 80,
    frame_count = inputs.frame_count or 15,
    line_length = inputs.line_length or 0,
    run_mode = inputs.run_mode or "forward",
    apply_runtime_tint = true,
    direction_count = 4,
    shift = util.by_pixel(0, -43),
    scale = 0.5
  }
end

function laser_turret_shooting()
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-shooting.png",
    line_length = 8,
    width = 126,
    height = 120,
    direction_count = 64,
    shift = util.by_pixel(0, -35),
    scale = 0.5
  }
end

function laser_turret_shooting_glow()
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-shooting-light.png",
    line_length = 8,
    width = 122,
    height = 116,
    direction_count = 64,
    shift = util.by_pixel(-0.5, -35),
    blend_mode = "additive",
    scale = 0.5
  }
end

function laser_turret_shooting_mask()
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-shooting-mask.png",
    flags = {"mask"},
    line_length = 8,
    width = 92,
    height = 80,
    apply_runtime_tint = true,
    direction_count = 64,
    shift = util.by_pixel(0, -43.5),
    scale = 0.5
  }
end

function laser_turret_shooting_shadow()
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-shooting-shadow.png",
    line_length = 8,
    width = 170,
    height = 92,
    direction_count = 64,
    draw_as_shadow = true,
    shift = util.by_pixel(50.5, 2.5),
    scale = 0.5
  }
end

function shift_small_worm(shiftx, shifty)
  return {shiftx - 0.1, shifty + 0.1}
end

function worm_corpse(name, scale, tint, order_char)
  local tab = {}
  order_char = order_char or "a"

  tab.type = "corpse"
  tab.name = name .. "-worm-corpse"
  tab.icon = "__base__/graphics/icons/" .. name .. "-worm-corpse.png"
  tab.selection_box = {{-0.8, -0.8}, {0.8, 0.8}}
  tab.selectable_in_game = false
  tab.dying_speed = 0.01
  tab.time_before_removed = 15 * 60 * 60
  tab.subgroup = "corpses"
  tab.order = "c[corpse]-c[worm]-".. order_char .."[" .. name .. "]"
  tab.flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"}
  tab.hidden_in_factoriopedia = true
  tab.final_render_layer = "lower-object-above-shadow"
  tab.animation = worm_die_animation(scale, tint)
  tab.decay_animation = worm_decay_animation(scale, tint)
  tab.decay_frame_transition_duration = 6 * 60
  tab.ground_patch =
  {
    sheet = worm_integration(scale)
  }
  tab.ground_patch_decay =
  {
    sheet = worm_integration_decay(scale)
  }

  return tab
end

function worm_corpse_burrowed(name, scale, tint, order_char)
  local tab = worm_corpse(name, scale, tint, order_char)

  tab.name = tab.name .. "-burrowed"
  tab.order = tab.order .. "-burrowed"
  tab.animation = worm_die_burrowed_animation(scale, tint)

  return tab
end

data:extend(
{
  {
    type = "turret",
    name = "small-worm-turret",
    icon = "__base__/graphics/icons/small-worm.png",
    flags = {"placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    order="b-c-a",
    max_health = 200,
    subgroup = "enemies",
    impact_category = "organic",
    resistances = {},
    healing_per_tick = 0.01,
    collision_box = {{-0.9, -0.8 }, {0.9, 0.8}},
    map_generator_bounding_box = {{-1.9, -1.8}, {1.9, 1.8}},
    selection_box = {{-0.9, -0.8 }, {0.9, 0.8}},
    damaged_trigger_effect = hit_effects.biter(),
    shooting_cursor_size = 3,
    corpse = "small-worm-corpse",
    folded_state_corpse = "small-worm-corpse-burrowed",
    dying_explosion = "small-worm-die",
    dying_sound = sounds.worm_dying_small(0.57),
    graphics_set = {},
    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation_is_stateless = true,
    folded_animation = worm_folded_animation(scale_worm_small, tint_worm_small),
    preparing_speed = 0.024,
    preparing_speed_when_killed = 0.024 * preparing_speed_multiplier_when_killed,
    preparing_animation = worm_preparing_animation(scale_worm_small, tint_worm_small, "forward"),
    preparing_sound = sounds.worm_standup_small(0.6),
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    prepared_sound = sounds.worm_breath(0.4, 0.6),
    prepared_animation = worm_prepared_animation(scale_worm_small, tint_worm_small),
    prepared_alternative_speed = 0.024,
    prepared_alternative_speed_secondary = 0.018,
    prepared_alternative_speed_when_killed = 0.024 * prepared_alternative_speed_multiplier_when_killed,
    prepared_alternative_starting_progress_when_killed = prepared_starting_progress_when_killed,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = worm_prepared_alternative_animation(scale_worm_small, tint_worm_small),
    prepared_alternative_sound = sounds.worm_roar_alternative(0.4, 0.6),
    starting_attack_speed = 0.034,
    starting_attack_speed_when_killed = 0.034 * start_attack_speed_multiplier_when_killed,
    starting_attack_animation = worm_start_attack_animation(scale_worm_small, tint_worm_small),
    starting_attack_sound = sounds.worm_roars(0.4, 0.6),
    ending_attack_speed = 0.016,
    ending_attack_speed_when_killed = 0.016 * end_attack_speed_multiplier_when_killed,
    ending_attack_starting_progress_when_killed = end_attack_starting_progress_when_killed,
    ending_attack_animation = worm_end_attack_animation(scale_worm_small, tint_worm_small),
    folding_speed = 0.015,
    folding_speed_when_killed = 0.015 * folding_speed_multiplier_when_killed,
    folding_animation =  worm_preparing_animation(scale_worm_small, tint_worm_small, "backward"),
    folding_sound = sounds.worm_fold(1),
    random_animation_offset = true,
    attack_from_start_frame = true,

    integration = worm_integration(scale_worm_small, true),
    prepare_range = range_worm_small + prepare_range_worm_small,
    allow_turning_when_starting_attack = true,
    attack_parameters =
    {
      type = "stream",
      cooldown = 4,
      range = range_worm_small,--defined in spitter-projectiles.lua
      damage_modifier = damage_modifier_worm_small,--defined in spitter-projectiles.lua
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(scale_worm_small, scale_worm_small * scale_worm_stream),
      use_shooter_direction = true,

      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      ammo_category = "biological",
      ammo_type =
      {
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-worm-small",
            source_offset = {0.15, -0.5}
          }
        }
      },
    },
    autoplace = enemy_autoplace.enemy_worm_autoplace("enemy_autoplace_base(0, 2)"),
    call_for_help_radius = 40,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "worms-decal",
        spawn_min = 0,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      },
      {
        decorative = "shroom-decal",
        spawn_min = 1,
        spawn_max = 1,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      },
      {
        decorative = "enemy-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 0,
        spawn_max_radius = 1
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 2,
        spawn_max = 4,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      }
    }
  },
  {
    type = "ammo-turret",
    name = "gun-turret",
    icon = "__base__/graphics/icons/gun-turret.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "gun-turret"},
    fast_replaceable_group = "ammo-turret",
    max_health = 400,
    corpse = "gun-turret-remnants",
    dying_explosion = "gun-turret-explosion",
    collision_box = {{-0.7, -0.7 }, {0.7, 0.7}},
    selection_box = {{-1, -1 }, {1, 1}},
    drawing_box_vertical_extension = 0.2,
    damaged_trigger_effect = hit_effects.entity(),
    rotation_speed = 0.015,
    preparing_speed = 0.08,
    preparing_sound = sounds.gun_turret_activate,
    folding_sound = sounds.gun_turret_deactivate,
    folding_speed = 0.08,
    inventory_size = 1,
    automated_ammo_count = 10,
    attacking_speed = 0.5,
    alert_when_attacking = true,
    circuit_connector = circuit_connector_definitions["gun-turret"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    open_sound = {filename = "__base__/sound/open-close/turret-open.ogg", volume = 0.6},
    close_sound = {filename = "__base__/sound/open-close/turret-close.ogg", volume = 0.6},
    icon_draw_specification = {scale = 0.7},
    folded_animation =
    {
      layers =
      {
        gun_turret_extension{frame_count=1, line_length = 1},
        gun_turret_extension_mask{frame_count=1, line_length = 1},
        gun_turret_extension_shadow{frame_count=1, line_length = 1}
      }
    },
    preparing_animation =
    {
      layers =
      {
        gun_turret_extension{},
        gun_turret_extension_mask{},
        gun_turret_extension_shadow{}
      }
    },
    prepared_animation = gun_turret_attack{frame_count=1},
    attacking_animation = gun_turret_attack{},
    folding_animation =
    {
      layers =
      {
        gun_turret_extension{run_mode = "backward"},
        gun_turret_extension_mask{run_mode = "backward"},
        gun_turret_extension_shadow{run_mode = "backward"}
      }
    },
    graphics_set =
    {
      base_visualisation =
      {
        animation =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/gun-turret/gun-turret-base.png",
              priority = "high",
              width = 150,
              height = 118,
              shift = util.by_pixel(0.5, -1),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/gun-turret/gun-turret-base-mask.png",
              flags = {"mask", "low-object"},
              line_length = 1,
              width = 122,
              height = 102,
              shift = util.by_pixel(0, -4.5),
              apply_runtime_tint = true,
              scale = 0.5
            }
          }
        }
      }
    },

    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      health_penalty = 1,
      cooldown = 6,
      projectile_creation_distance = 1.39375,
      projectile_center = {0, -0.0875}, -- same as gun_turret_attack shift
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {-0.0625, 0},
        creation_distance = -1.925,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      range = 18,
      sound = sounds.gun_turret_gunshot
    },

    call_for_help_radius = 40,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/gun-turret/gun-turret-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 32,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  worm_corpse("small", scale_worm_small, tint_worm_small,"a"),
  worm_corpse_burrowed("small", scale_worm_small, tint_worm_small,"a"),
  {
    type = "electric-turret",
    name = "laser-turret",
    icon = "__base__/graphics/icons/laser-turret.png",
    flags = {"placeable-player", "placeable-enemy", "player-creation"},
    minable = {mining_time = 0.5, result = "laser-turret"},
    fast_replaceable_group = "laser-turret",
    max_health = 1000,
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.3,
    damaged_trigger_effect = hit_effects.entity(),
    circuit_connector = circuit_connector_definitions["laser-turret"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    rotation_speed = 0.01,
    preparing_speed = 0.05,
    open_sound = {filename = "__base__/sound/open-close/turret-open.ogg", volume = 0.6},
    close_sound = {filename = "__base__/sound/open-close/turret-close.ogg", volume = 0.6},
    preparing_sound = sounds.laser_turret_activate,
    folding_sound = sounds.laser_turret_deactivate,
    corpse = "laser-turret-remnants",
    dying_explosion = "laser-turret-explosion",
    folding_speed = 0.05,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "801kJ",
      input_flow_limit = "9600kW",
      drain = "24kW",
      usage_priority = "primary-input"
    },
    folded_animation =
    {
      layers =
      {
        laser_turret_extension{frame_count=1, line_length = 1},
        laser_turret_extension_shadow{frame_count=1, line_length=1},
        laser_turret_extension_mask{frame_count=1, line_length=1}
      }
    },
    preparing_animation =
    {
      layers =
      {
        laser_turret_extension{},
        laser_turret_extension_shadow{},
        laser_turret_extension_mask{}
      }
    },
    prepared_animation =
    {
      layers =
      {
        laser_turret_shooting(),
        laser_turret_shooting_shadow(),
        laser_turret_shooting_mask()
      }
    },
    --attacking_speed = 0.1,
    energy_glow_animation = laser_turret_shooting_glow(),
    glow_light_intensity = 0.5, -- defaults to 0
    folding_animation =
    {
      layers =
      {
        laser_turret_extension{run_mode = "backward"},
        laser_turret_extension_shadow{run_mode = "backward"},
        laser_turret_extension_mask{run_mode = "backward"}
      }
    },
    graphics_set =
    {
      base_visualisation =
      {
        animation =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/laser-turret/laser-turret-base.png",
              priority = "high",
              width = 138,
              height = 104,
              shift = util.by_pixel(-0.5, 2),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/laser-turret/laser-turret-base-shadow.png",
              line_length = 1,
              width = 132,
              height = 82,
              draw_as_shadow = true,
              shift = util.by_pixel(6, 3),
              scale = 0.5
            }
          }
        }
      }
    },

    attack_parameters =
    {
      type = "beam",
      cooldown = 40,
      range = 24,
      range_mode = "center-to-bounding-box",
      source_direction_count = 64,
      source_offset = {0, -3.423489 / 4},
      damage_modifier = 2,
      ammo_category = "laser",
      ammo_type =
      {
        energy_consumption = "800kJ",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "beam",
            beam = "laser-beam",
            max_length = 24,
            duration = 40,
            source_offset = {0, -1.31439 }
          }
        }
      }
    },

    call_for_help_radius = 40,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/laser-turret/laser-turret-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 32,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "artillery-turret",
    name = "artillery-turret",
    icon = "__base__/graphics/icons/artillery-turret.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    inventory_size = 1,
    ammo_stack_limit = 15,
    automated_ammo_count = 5,
    alert_when_attacking = false,
    minable = {mining_time = 0.5, result = "artillery-turret"},
    fast_replaceable_group = "artillery-turret",
    open_sound = sounds.artillery_open,
    close_sound = sounds.artillery_close,
    mined_sound = sounds.deconstruct_large(0.8),
    rotating_sound =
    {
      sound = {filename = "__base__/sound/fight/artillery-rotation-loop.ogg", volume = 0.6},
      stopped_sound = {filename = "__base__/sound/fight/artillery-rotation-stop.ogg"}
    },
    max_health = 2000,
    corpse = "artillery-turret-remnants",
    dying_explosion = "artillery-turret-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    drawing_box_vertical_extension = 3.5,
    damaged_trigger_effect = hit_effects.entity(),
    circuit_connector = circuit_connector_definitions["artillery-turret"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    gun = "artillery-wagon-cannon",
    turret_rotation_speed = 0.001,
    turn_after_shooting_cooldown = 60,
    cannon_parking_frame_count = 8,
    cannon_parking_speed = 0.25,
    manual_range_modifier = 2.5,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 50
      },
      {
        type = "physical",
        decrease = 15,
        percent = 30
      },
      {
        type = "impact",
        decrease = 50,
        percent = 50
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 30
      },
      {
        type = "acid",
        decrease = 3,
        percent = 20
      }
    },

    base_picture_render_layer = "lower-object-above-shadow",
    base_picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/artillery-turret/artillery-turret-base.png",
          priority = "high",
          line_length = 1,
          width = 207,
          height = 199,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/artillery-turret/artillery-turret-base-shadow.png",
          priority = "high",
          line_length = 1,
          width = 277,
          height = 149,
          shift = util.by_pixel(18, 16),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },

    cannon_base_shift = {0.0, 0.0, 0.9722}, -- ENU
    cannon_barrel_pictures =
    {
      layers =
      {
        util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel",
          {
            dice = 4,
            priority = "very-low",
            allow_low_quality_rotation = true,
            direction_count = 256,
            scale = 0.5
          }
        ),
        util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow",
          {
            dice = 4,
            priority = "very-low",
            allow_low_quality_rotation = true,
            draw_as_shadow = true,
            direction_count = 256,
            scale = 0.5
          }
        )
      }
    },
    cannon_base_pictures =
    {
      layers =
      {
        util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base",
          {
            dice = 4,
            priority = "very-low",
            allow_low_quality_rotation = true,
            direction_count = 256,
            scale = 0.5
          }
        ),
        util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow",
          {
            dice = 4,
            priority = "very-low",
            allow_low_quality_rotation = true,
            draw_as_shadow = true,
            direction_count = 256,
            scale = 0.5
          }
        )
      }
    },
    cannon_barrel_recoil_shiftings =
    { -- East-North-Up (when cannon is facing North)
      {0.0100, -0.0000, -0.0000},
      {0.0093, -0.1973, -0.0878},
      {0.0088, -0.3945, -0.1755},
      {0.0083, -0.5918, -0.2635},
      {0.0078, -0.7888, -0.3513},
      {0.0070, -0.9860, -0.4390},
      {0.0070, -0.9828, -0.4375},
      {0.0070, -0.9753, -0.4343},
      {0.0073, -0.9635, -0.4290},
      {0.0073, -0.9475, -0.4220},
      {0.0073, -0.9278, -0.4130},
      {0.0073, -0.9043, -0.4025},
      {0.0075, -0.8770, -0.3905},
      {0.0075, -0.8463, -0.3768},
      {0.0075, -0.8123, -0.3618},
      {0.0078, -0.7755, -0.3453},
      {0.0078, -0.7360, -0.3278},
      {0.0080, -0.6940, -0.3090},
      {0.0080, -0.6498, -0.2893},
      {0.0083, -0.6040, -0.2690},
      {0.0083, -0.5565, -0.2478},
      {0.0085, -0.5080, -0.2263},
      {0.0085, -0.4588, -0.2043},
      {0.0088, -0.4088, -0.1820},
      {0.0088, -0.3590, -0.1598},
      {0.0090, -0.3095, -0.1378},
      {0.0093, -0.2605, -0.1160},
      {0.0093, -0.2128, -0.0948},
      {0.0095, -0.1663, -0.0740},
      {0.0095, -0.1213, -0.0540},
      {0.0098, -0.0785, -0.0350},
      {0.0098, -0.0380, -0.0170},
    },
    cannon_barrel_light_direction = {0.5976251, -0.0242053, -0.8014102}, -- ENU

    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/artillery-turret/artillery-turret-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 32,
        shift = util.by_pixel(0, 75),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  }
})

data:extend(
{
  {
    type = "turret",
    name = "medium-worm-turret",
    icon = "__base__/graphics/icons/medium-worm.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    order="b-c-b",
    subgroup="enemies",
    max_health = 500,
    impact_category = "organic",
    resistances =
    {
      {
        type = "physical",
        decrease = 5
      },
      {
        type = "explosion",
        decrease = 5,
        percent = 15
      },
      {
        type = "fire",
        decrease = 2,
        percent = 50
      },
      {
        type = "laser",
        percent = 20
      }
    },
    healing_per_tick = 0.015,
    collision_box = {{-1.1, -1.0}, {1.1, 1.0}},
    map_generator_bounding_box = {{-2.1, -2.0}, {2.1, 2.0}},
    selection_box = {{-1.1, -1.0}, {1.1, 1.0}},
    damaged_trigger_effect = hit_effects.biter(),
    shooting_cursor_size = 3.5,
    rotation_speed = 1,
    corpse = "medium-worm-corpse",
    folded_state_corpse = "medium-worm-corpse-burrowed",
    dying_explosion = "medium-worm-die",
    dying_sound = sounds.worm_dying(0.65),
    graphics_set = {},
    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation_is_stateless = true,
    folded_animation = worm_folded_animation(scale_worm_medium, tint_worm_medium),
    preparing_speed = 0.024,
    preparing_speed_when_killed = 0.024 * preparing_speed_multiplier_when_killed,
    preparing_animation = worm_preparing_animation(scale_worm_medium, tint_worm_medium, "forward"),
    preparing_sound = sounds.worm_standup(0.6),
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    prepared_sound = sounds.worm_breath(0.6, 0.8),
    prepared_alternative_speed = 0.014,
    prepared_alternative_speed_secondary = 0.010,
    prepared_alternative_speed_when_killed = 0.014 * prepared_alternative_speed_multiplier_when_killed,
    prepared_alternative_starting_progress_when_killed = prepared_starting_progress_when_killed,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = worm_prepared_alternative_animation(scale_worm_medium, tint_worm_medium),
    prepared_alternative_sound = sounds.worm_roar_alternative(0.4, 0.7),
    prepared_animation = worm_prepared_animation(scale_worm_medium, tint_worm_medium),
    starting_attack_speed = 0.034,
    starting_attack_animation = worm_start_attack_animation(scale_worm_medium, tint_worm_medium),
    starting_attack_sound = sounds.worm_roars(0.4, 0.7),
    starting_attack_speed_when_killed = 0.034 * start_attack_speed_multiplier_when_killed,
    ending_attack_speed = 0.016,
    ending_attack_speed_when_killed = 0.016 * end_attack_speed_multiplier_when_killed,
    ending_attack_starting_progress_when_killed = end_attack_starting_progress_when_killed,
    ending_attack_animation = worm_end_attack_animation(scale_worm_medium, tint_worm_medium),
    folding_speed = 0.015,
    folding_speed_when_killed = 0.015 * folding_speed_multiplier_when_killed,
    folding_animation =  worm_preparing_animation(scale_worm_medium, tint_worm_medium, "backward"),
    folding_sound = sounds.worm_fold(1),
    random_animation_offset = true,
    attack_from_start_frame = true,

    integration = worm_integration(scale_worm_medium, true),
    prepare_range = range_worm_medium + prepare_range_worm_medium,
    allow_turning_when_starting_attack = true,

    attack_parameters =
    {
      type = "stream",
      cooldown = 4,
      range = range_worm_medium,--defined in spitter-projectiles.lua
      damage_modifier = damage_modifier_worm_medium,--defined in spitter-projectiles.lua
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(scale_worm_medium, scale_worm_medium * scale_worm_stream),

      use_shooter_direction = true,

      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      ammo_category = "biological",
      ammo_type =
      {
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-worm-medium",
            source_offset = {0.15, -0.5}
          }
        }
      }
    },
    build_base_evolution_requirement = 0.3,
    autoplace = enemy_autoplace.enemy_worm_autoplace("enemy_autoplace_base(2, 3)"),
    call_for_help_radius = 40,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "worms-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 3
      },
      {
        decorative = "shroom-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      },
      {
        decorative = "enemy-decal",
        spawn_min = 1,
        spawn_max = 3,
        spawn_min_radius = 0,
        spawn_max_radius = 3
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 2,
        spawn_max = 4,
        spawn_min_radius = 1,
        spawn_max_radius = 3
      }
    }
  },

  {
    type = "turret",
    name = "big-worm-turret",
    icon = "__base__/graphics/icons/big-worm.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    max_health = 1500,
    order = "b-c-c",
    subgroup = "enemies",
    impact_category = "organic",
    resistances =
    {
      {
        type = "physical",
        decrease = 10
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      },
      {
        type = "fire",
        decrease = 3,
        percent = 70
      },
      {
        type = "laser",
        percent = 50
      }
    },
    healing_per_tick = 0.02,
    collision_box = {{-1.4, -1.2}, {1.4, 1.2}},
    map_generator_bounding_box = {{-2.4, -2.2}, {2.4, 2.2}},
    selection_box = {{-1.4, -1.2}, {1.4, 1.2}},
    damaged_trigger_effect = hit_effects.biter(),
    shooting_cursor_size = 4,
    rotation_speed = 1,
    corpse = "big-worm-corpse",
    folded_state_corpse = "big-worm-corpse-burrowed",
    dying_explosion = "big-worm-die",
    dying_sound = sounds.worm_dying_big(0.7),
    graphics_set = {},
    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation_is_stateless = true,
    folded_animation = worm_folded_animation(scale_worm_big, tint_worm_big),
    preparing_speed = 0.024,
    preparing_speed_when_killed = 0.024 * preparing_speed_multiplier_when_killed,
    preparing_animation = worm_preparing_animation(scale_worm_big, tint_worm_big, "forward"),
    preparing_sound = sounds.worm_standup(0.7),
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    prepared_animation = worm_prepared_animation(scale_worm_big, tint_worm_big),
    prepared_sound = sounds.worm_breath_big(0.6, 0.9),
    prepared_alternative_speed = 0.014,
    prepared_alternative_speed_secondary = 0.010,
    prepared_alternative_speed_when_killed = 0.014 * prepared_alternative_speed_multiplier_when_killed,
    prepared_alternative_starting_progress_when_killed = prepared_starting_progress_when_killed,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = worm_prepared_alternative_animation(scale_worm_big, tint_worm_big),
    prepared_alternative_sound = sounds.worm_roar_alternative_big(0.4, 0.7),
    starting_attack_speed = 0.034,
    starting_attack_animation = worm_start_attack_animation(scale_worm_big, tint_worm_big),
    starting_attack_sound = sounds.worm_roars_big(0.4, 0.7),
    starting_attack_speed_when_killed = 0.034 * start_attack_speed_multiplier_when_killed,
    ending_attack_speed = 0.016,
    ending_attack_speed_when_killed = 0.016 * end_attack_speed_multiplier_when_killed,
    ending_attack_starting_progress_when_killed = end_attack_starting_progress_when_killed,
    ending_attack_animation = worm_end_attack_animation(scale_worm_big, tint_worm_big),
    folding_speed = 0.015,
    folding_speed_when_killed = 0.015 * folding_speed_multiplier_when_killed,
    folding_animation =  worm_preparing_animation(scale_worm_big, tint_worm_big, "backward"),
    folding_sound = sounds.worm_fold(1),
    integration = worm_integration(scale_worm_big, true),
    random_animation_offset = true,
    attack_from_start_frame = true,

    prepare_range = range_worm_big + prepare_range_worm_big,
    allow_turning_when_starting_attack = true,
    attack_parameters =
    {
      type = "stream",
      damage_modifier = damage_modifier_worm_big,--defined in spitter-projectiles.lua
      cooldown = 4,
      range = range_worm_big,--defined in spitter-projectiles.lua
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(scale_worm_big, scale_worm_big * scale_worm_stream),

      use_shooter_direction = true,

      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 * 1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      ammo_category = "biological",
      ammo_type =
      {
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-worm-big",
            source_offset = {0.15, -0.5}
          }
        }
      }
    },
    build_base_evolution_requirement = 0.5,
    autoplace = enemy_autoplace.enemy_worm_autoplace("enemy_autoplace_base(5, 4)"),
    call_for_help_radius = 40,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "worms-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 4
      },
      {
        decorative = "shroom-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      },
      {
        decorative = "enemy-decal",
        spawn_min = 1,
        spawn_max = 4,
        spawn_min_radius = 1,
        spawn_max_radius = 3
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 3,
        spawn_max = 5,
        spawn_min_radius = 1,
        spawn_max_radius = 4
      }
    }
  },
  {
    type = "turret",
    name = "behemoth-worm-turret",
    icon = "__base__/graphics/icons/behemoth-worm.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    max_health = 3000,
    order = "b-c-d",
    subgroup = "enemies",
    impact_category = "organic",
    resistances =
    {
      {
        type = "physical",
        decrease = 10
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      },
      {
        type = "fire",
        decrease = 3,
        percent = 70
      },
      {
        type = "laser",
        percent = 80
      }
    },
    healing_per_tick = 0.02,
    collision_box = {{-1.4, -1.2}, {1.4, 1.2}},
    map_generator_bounding_box = {{-2.4, -2.2}, {2.4, 2.2}},
    selection_box = {{-1.4, -1.2}, {1.4, 1.2}},
    damaged_trigger_effect = hit_effects.biter(),
    shooting_cursor_size = 4,
    rotation_speed = 1,
    corpse = "behemoth-worm-corpse",
    folded_state_corpse = "behemoth-worm-corpse-burrowed",
    dying_explosion = "behemoth-worm-die",
    dying_sound = sounds.worm_dying_behemoth(0.8),
    graphics_set = {},
    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation_is_stateless = true,
    folded_animation = worm_folded_animation(scale_worm_behemoth, tint_worm_behemoth),
    preparing_speed = 0.024,
    preparing_speed_when_killed = 0.024 * preparing_speed_multiplier_when_killed,
    preparing_animation = worm_preparing_animation(scale_worm_behemoth, tint_worm_behemoth, "forward"),
    preparing_sound = sounds.worm_standup(0.7),
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    prepared_animation = worm_prepared_animation(scale_worm_behemoth, tint_worm_behemoth),
    prepared_sound = sounds.worm_breath_big(0.6, 0.9),
    prepared_alternative_speed = 0.014,
    prepared_alternative_speed_secondary = 0.010,
    prepared_alternative_speed_when_killed = 0.014 * prepared_alternative_speed_multiplier_when_killed,
    prepared_alternative_starting_progress_when_killed = prepared_starting_progress_when_killed,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = worm_prepared_alternative_animation(scale_worm_behemoth, tint_worm_behemoth),
    prepared_alternative_sound = sounds.worm_roar_alternative_big(0.5, 0.8),
    starting_attack_speed = 0.034,
    starting_attack_animation = worm_start_attack_animation(scale_worm_behemoth, tint_worm_behemoth),
    starting_attack_sound = sounds.worm_roars_big(0.6, 0.8),
    starting_attack_speed_when_killed = 0.034 * start_attack_speed_multiplier_when_killed,
    ending_attack_speed = 0.016,
    ending_attack_speed_when_killed = 0.016 * end_attack_speed_multiplier_when_killed,
    ending_attack_starting_progress_when_killed = end_attack_starting_progress_when_killed,
    ending_attack_animation = worm_end_attack_animation(scale_worm_behemoth, tint_worm_behemoth),
    folding_speed = 0.015,
    folding_speed_when_killed = 0.015 * folding_speed_multiplier_when_killed,
    folding_animation =  worm_preparing_animation(scale_worm_behemoth, tint_worm_behemoth, "backward"),
    folding_sound = sounds.worm_fold(1),
    integration = worm_integration(scale_worm_behemoth, true),
    random_animation_offset = true,
    attack_from_start_frame = true,

    prepare_range = range_worm_behemoth + prepare_range_worm_behemoth,
    allow_turning_when_starting_attack = true,
    attack_parameters =
    {
      type = "stream",
      ammo_category = "biological",
      damage_modifier = damage_modifier_worm_behemoth,--defined in spitter-projectiles.lua
      cooldown = 4,
      range = range_worm_behemoth,--defined in spitter-projectiles.lua
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(scale_worm_behemoth, scale_worm_behemoth * scale_worm_stream),
      use_shooter_direction = true,

      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 * 1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      ammo_type =
      {
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-worm-behemoth",
            source_offset = {0.15, -0.5}
          }
        }
      }
    },
    build_base_evolution_requirement = 0.9,
    autoplace = enemy_autoplace.enemy_worm_autoplace("enemy_autoplace_base(8, 5)"),
    call_for_help_radius = 80,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "worms-decal",
        spawn_min = 1,
        spawn_max = 3,
        spawn_min_radius = 1,
        spawn_max_radius = 5
      },
      {
        decorative = "shroom-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      },
      {
        decorative = "enemy-decal",
        spawn_min = 1,
        spawn_max = 4,
        spawn_min_radius = 1,
        spawn_max_radius = 4
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 3,
        spawn_max = 5,
        spawn_min_radius = 1,
        spawn_max_radius = 4
      }
    }
  },
  worm_corpse("medium", scale_worm_medium, tint_worm_medium,"b"),
  worm_corpse_burrowed("medium", scale_worm_medium, tint_worm_medium,"b"),

  worm_corpse("big", scale_worm_big, tint_worm_big,"c"),
  worm_corpse_burrowed("big", scale_worm_big, tint_worm_big,"c"),

  worm_corpse("behemoth", scale_worm_behemoth, tint_worm_behemoth,"d"),
  worm_corpse_burrowed("behemoth", scale_worm_behemoth, tint_worm_behemoth,"d")
}
)

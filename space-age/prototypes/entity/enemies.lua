local base_sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local space_enemy_autoplace = require ("__space-age__.prototypes.entity.space-enemy-autoplace-utils")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local decorative_trigger_effects = require("__base__.prototypes.decorative.decorative-trigger-effects")
local explosion_animations = require("__space-age__.prototypes.entity.explosion-animations")
local gleba_enemy_animations = require("__space-age__.prototypes.entity.gleba-enemy-animations")
local gleba_ai_settings = require ("__space-age__.prototypes.entity.gleba-ai-settings")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local particle_animations = require("__space-age__/prototypes/particle-animations")

local function lerp_color(a, b, amount)
  return
  {
    a[1] + amount * (b[1] - a[1]),
    a[2] + amount * (b[2] - a[2]),
    a[3] + amount * (b[3] - a[3]),
    a[4] + amount * (b[4] - a[4]),
  }
end

local function fade(tint, amount) -- fades to minimal opacity grey. Low opacity is good for the mask to let the base layer show htough (instead of having a grey mask)
  return lerp_color(tint, {1, 1, 1, 2}, amount)
end

local function grey_overlay(tint, amount) -- fades to opaque grey. Full opacity is required for body.
  return lerp_color(tint, {127, 127, 127, 255}, amount)
end

data.raw["unit-spawner"]["biter-spawner"].captured_spawner_entity = "captive-biter-spawner"
data.raw["unit-spawner"]["spitter-spawner"].captured_spawner_entity = "captive-biter-spawner"

-- should be moved to shared util for include
local default_ended_in_water_trigger_effect = function()
  return
  {

    {
      type = "create-particle",
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tintable-water-particle",
      apply_tile_tint = "secondary",
      offset_deviation = { { -0.05, -0.05 }, { 0.05, 0.05 } },
      initial_height = 0,
      initial_height_deviation = 0.02,
      initial_vertical_speed = 0.05,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.006,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 2,
      tail_length_deviation = 1,
      tail_width = 3
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 6,
      probability = 0.03,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tintable-water-particle",
      apply_tile_tint = "primary",
      offsets =
      {
        { 0, 0 },
        { 0.01563, -0.09375 },
        { 0.0625, 0.09375 },
        { -0.1094, 0.0625 }
      },
      offset_deviation = { { -0.2969, -0.1992 }, { 0.2969, 0.1992 } },
      initial_height = 0,
      initial_height_deviation = 0.02,
      initial_vertical_speed = 0.053,
      initial_vertical_speed_deviation = 0.005,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.006,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 9,
      tail_length_deviation = 0,
      tail_width = 1
    },
    {
      type = "play-sound",
      sound = base_sounds.small_splash
    }
  }

end

local particle_ended_in_water_trigger_effect = function()
  return
  {
    type = "create-particle",
    repeat_count = 5,
    repeat_count_deviation = 4,
    probability = 0.2,
    affects_target = false,
    show_in_tooltip = false,
    particle_name = "tintable-water-particle",
    apply_tile_tint = "secondary",
    offsets = { { 0, 0 } },
    offset_deviation = { { -0.2969, -0.2969 }, { 0.2969, 0.2969 } },
    tile_collision_mask = nil,
    initial_height = 0.1,
    initial_height_deviation = 0.1,
    initial_vertical_speed = 0.06,
    initial_vertical_speed_deviation = 0.069,
    speed_from_center = 0.02,
    speed_from_center_deviation = 0.05,
    frame_speed = 1,
    frame_speed_deviation = 0,
    tail_length = 9,
    tail_length_deviation = 8,
    tail_width = 1
  }
end

local make_particle = function(params)

  if not params then error("No params given to make_particle function") end
  local name = params.name or error("No name given")

  local ended_in_water_trigger_effect = params.ended_in_water_trigger_effect or default_ended_in_water_trigger_effect()
  if params.ended_in_water_trigger_effect == false then
    ended_in_water_trigger_effect = nil
  end

  local particle =
  {

    type = "optimized-particle",
    name = name,

    life_time = params.life_time or (60 * 15),
    fade_away_duration = params.fade_away_duration,

    render_layer = params.render_layer or "projectile",
    render_layer_when_on_ground = params.render_layer_when_on_ground or "corpse",

    regular_trigger_effect_frequency = params.regular_trigger_effect_frequency or 2,
    regular_trigger_effect = params.regular_trigger_effect,
    ended_in_water_trigger_effect = ended_in_water_trigger_effect,

    pictures = params.pictures,
    shadows = params.shadows,
    draw_shadow_when_on_ground = params.draw_shadow_when_on_ground,

    movement_modifier_when_on_ground = params.movement_modifier_when_on_ground,
    movement_modifier = params.movement_modifier,
    vertical_acceleration = params.vertical_acceleration,

    mining_particle_frame_speed = params.mining_particle_frame_speed,

  }

  return particle

end

function gleba_hit_effects(offset_deviation, offset)
  local offset = offset or {0, 0}
  return
  {
    type = "create-entity",
    entity_name = "gleba-enemy-damaged-explosion",
    offset_deviation = offset_deviation or {{-0.5, -0.5}, {0.5, 0.5}},
    offsets = {offset},
    damage_type_filters = "fire"
  }
end

local function gleba_spawner_variations(data)
  local animations  = {}
  local line_length = data.line_length or 8
  local width = data.width or 256
  local height = data.height or 256
  for i = 1, data.count or 1 do
    table.insert(animations,
      {
        filename = data.path .. ".png",
        width = width,
        height = height,
        line_length = line_length,
        shift = data.shift,
        frame_count = 1,
        tint = data.tint,
        scale = data.scale or 0.5,
        x = (i-1) % line_length * width,
        y = (data.y or 0) + math.floor((i-1) / line_length) * height,
        surface = "gleba",
        usage = "enemy"
      }
    )
  end
  return animations
end

local stomper_leg_part_template_layers =
{
  top_end =
  {
    { key = "top_end", row = 1 },
    { key = "top_end_shadow", row = 1, draw_as_shadow = true },
    { key = "top_end_tint", row = 1},
    --{ key = "top_end", row = 3, apply_runtime_tint = true },
    { key = "reflection_top_end", row = 1, draw_as_water_reflection = true }
  },
  middle =
  {
    { key = "middle", row = 1 },
    { key = "middle_shadow", row = 1, draw_as_shadow = true },
    { key = "middle_tint", row = 1},
    { key = "reflection_middle", row = 1, draw_as_water_reflection = true }
  },

  bottom_end =
  {
    { key = "bottom_end", row = 1 },
    { key = "bottom_end_shadow", row = 1, draw_as_shadow = true },
    { key = "bottom_end_tint", row = 1},
    --{ key = "bottom_end", row = 3, apply_runtime_tint = true },
    { key = "reflection_bottom_end", row = 1, draw_as_water_reflection = true }
  }
}
local strafer_leg_part_template_layers =
{
  middle =
  {
    { key = "middle", row = 1 },
    { key = "middle_shadow", row = 1, draw_as_shadow = true },
    { key = "middle_tint", row = 1},
    { key = "reflection_middle", row = 1, draw_as_water_reflection = true }
  }
}
local pentapod_upper_leg_dying_trigger_effect_positions = { 0.2, 0.4, 0.6, 0.8, 1.0 }
local pentapod_lower_leg_dying_trigger_effect_positions = { 0.25, 0.5, 0.75, 1.0 }

function make_pentapod_leg_dying_trigger_effects(effect_name, positions)
  local effects = {}
  for _,p in ipairs(positions) do
    table.insert(effects,
    {
      position = p,
      effect =
      {
        {
          type = "create-entity",
          entity_name = effect_name,
          probability = 0.5,
        }
      }
    })
  end
  return effects
end

local function demolisher_spritesheet(file_name, is_shadow, scale)
  is_shadow = is_shadow or false
  return util.sprite_load("__space-age__/graphics/entity/lavaslug/lavaslug-" .. file_name,
  {
    direction_count = 128,
    dice = 0, -- dicing is incompatible with sprite alpha masking, do not attempt
    draw_as_shadow = is_shadow,
    scale = scale,
    multiply_shift = scale * 2,
    surface = "vulcanus",
    usage = "enemy"
  })
end

local demolisher_overkill_fraction = 0.2 -- due to high regen this is required to make sure head is not accidentaly considered "will-die" because turrets may retarget. https://forums.factorio.com/116045

local demolisher_segment_scales =
{
  1.09,
  1.27,
  1.36,
  1.36,
  1.36,
  1.36,
  1.33,
  1.30,
  1.37,
  1.52,
  1.52,
  1.40,
  1.41,
  1.28,
  1.28,
  1.17,
  1.10,
  1.08,
  1.08,
  1.09,
  1.20,
  1.20,
  1.10,
  1.10,
  0.99,
  0.99,
  0.99,
  0.87,
  0.87,
  0.97,
  0.87,
  0.97,
  0.99,
  0.87,
  0.87,
  0.87,
  0.87,
  0.77,
  0.77,
  0.65,
  0.64,
}

local demolisher_resistances =
{
  {
    type = "explosion",
    percent = 60
  },
  {
    type = "physical",
    percent = 50
  },
  {
    type = "fire",
    percent = 100
  },
  {
    type = "laser",
    percent = 100
  },
  {
    type = "impact",
    percent = 100
  },
  {
    type = "poison",
    percent = 10
  },
  {
    type = "electric",
    decrease = 20,
    percent = 20
  }
}
local demolisher_body_resistances =
{
  {
    type = "explosion",
    percent = 99
  },
  {
    type = "physical",
    decrease = 5,
    percent = 50
  },
  {
    type = "fire",
    percent = 100
  },
  {
    type = "laser",
    percent = 100
  },
  {
    type = "impact",
    percent = 100
  },
  {
    type = "poison",
    percent = 50
  },
  {
    type = "electric",
    decrease = 20,
    percent = 20
  }
}

local demolisher_cloud_duration = 60 * 5
local demolisher_cloud_repeats = 2
local demolisher_expanding_cloud_steps = 30
local demolisher_expanding_cloud_interval = 10
local fissure_size = 0.4
local fissure_explosion_delay_ticks = 60
local fissure_explosion_particles_delay_ticks = 10
local fissure_explosion_damage_delay_ticks = 15
local fissure_eruption_ticks = fissure_explosion_delay_ticks + fissure_explosion_damage_delay_ticks


function make_segment_name(base_name, scale)
  return base_name.."-x"..string.gsub(tostring(scale), "%.", "_")
end

function make_demolisher_ash_cloud_update_effect(base_name)
  local effects = {}

  table.insert(effects,
  {
    type = "nested-result",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          type = "create-entity",
          entity_name = base_name .. "-expanding-ash-cloud-1",
        }
      }
    }
  })

  for i = 2, demolisher_expanding_cloud_steps do
    table.insert(effects,
    {
      type = "nested-result",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "delayed",
          delayed_trigger = base_name .. "-expanding-ash-cloud-delay-" .. i
        }
      }
    })
  end
  table.insert(effects,
  {
    type = "nested-result",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "delayed",
        delayed_trigger = base_name .. "-ash-cloud-delay"
      }
    }
  })

  return {
    time_cooldown = demolisher_expanding_cloud_interval * demolisher_expanding_cloud_steps + (1 + demolisher_cloud_repeats) * demolisher_cloud_duration,
    effect = effects
  }
end

function make_demolisher_head(base_name, order, scale, damage_multiplier, health, regen, speed_multiplier, factoriopedia_simulation, sounds)
  local effect_multiplier = 2 * scale

  return
  {
    name = base_name,
    type = "segmented-unit",
    icon = "__space-age__/graphics/icons/".. base_name ..".png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = health,
    factoriopedia_simulation = simulations.factoriopedia_vulcanus_enemy_demolisher,
    factoriopedia_simulation = factoriopedia_simulation,
    order = order,
    subgroup = "enemies",
    resistances = demolisher_resistances,
    impact_category = "organic",
    healing_per_tick = regen,
    collision_box = {{-3 * scale, -3 * scale}, {3 * scale, 3 * scale}},
    selection_box = {{-3 * scale, -3 * scale}, {3 * scale, 3 * scale}},
    drawing_box_vertical_extension = 4.0 * scale,
    is_military_target = true,
    overkill_fraction = demolisher_overkill_fraction,
    vision_distance = 64 * scale,
    territory_radius = 4,
    enraged_duration = 30 * 60, -- 30 seconds
    patrolling_speed = 2.0 * speed_multiplier / 60, -- 1.5 tiles per second
    investigating_speed = 4.0 * speed_multiplier / 60, -- 2.25 tiles per second
    attacking_speed = 7.0 * speed_multiplier / 60, -- 3.0 tiles per second
    enraged_speed = 10.0 * speed_multiplier / 60, -- 4.0 tiles per second
    acceleration_rate = 1 * speed_multiplier / 60 / 60, -- 1 tile per second per second
    turn_radius = 12 * scale, -- tiles
    patrolling_turn_radius = 20 * scale, -- tiles
    turn_smoothing = 0.75, -- fraction of the total turning range (based on turning radius)
    revenge_attack_parameters =
    {
      type = "projectile",
      ammo_category = "seismic",
      min_attack_distance = 5,
      cooldown = 20,
      cooldown_deviation = 1,
      range = 128 * scale,
      range_mode = "center-to-center",
      damage_modifier = damage_multiplier,
      lead_target_for_projectile_delay = (fissure_explosion_delay_ticks + fissure_explosion_damage_delay_ticks) * 1.1,
      ammo_type =
      {
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-entity",
                entity_name = base_name .. "-fissure",
                offset_deviation = {{-3, -5}, {3, 5}},
                probability = 0.3
              },
              {
                type = "create-entity",
                entity_name = base_name .. "-fissure",
                offset_deviation = {{-5, -3}, {5, 3}},
                probability = 0.3
              },
              {
                type = "create-entity",
                entity_name = base_name .. "-fissure",
                offset_deviation = {{-4, -4}, {4, 4}},
                probability = 0.3
              }
            }
          }
        }
      }
    },
    roar = sounds.roar,
    roar_probability = sounds.roar_probability,
    hurt_roar = sounds.hurt_roar,
    hurt_thresholds = sounds.hurt_thresholds,
    working_sound =
    {
      sound = { filename = "__space-age__/sound/world/semi-persistent/distant-rumble-2.ogg", volume = 1 },
      max_sounds_per_type = 1,
      audible_distance_modifier = 0.8,
      match_volume_to_activity = true
    },
    animation =
    {
      layers =
      {
        demolisher_spritesheet("head", false, 0.5 * scale),
        demolisher_spritesheet("head-shadow", true, 0.5 * scale),
      }
    },
    backward_padding = -2.5 * scale, -- tiles
    render_layer = "higher-object-under",
    update_effects =
    {
      {
        distance_cooldown = 4 * scale,
        effect =
        {
          {
            type = "create-smoke",
            entity_name = base_name .. "-ash-cloud-trail",
            show_in_tooltip = false
          }
        }
      },
      {
        distance_cooldown = 6 * scale,
        effect =
        {
          type = "create-entity",
          entity_name = base_name .. "-trail-upper",
          show_in_tooltip = false
        }
      },
      {
        distance_cooldown = 5 * scale,
        effect =
        {
          type = "create-entity",
          entity_name = base_name .. "-trail-lower",
          show_in_tooltip = false
        }
      },
      {
        distance_cooldown = 0.02 / effect_multiplier,
        effect =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = math.max(1, effect_multiplier),
            smoke_name = "demolisher-mining-smoke-front",
            initial_height = 0,
            speed = {-0.04 * effect_multiplier, 0},
            speed_multiplier = 0.75,
            speed_multiplier_deviation = 0.2,
            starting_frame_deviation = 0.5,
            offset_deviation =
            {
              {-1.2 * effect_multiplier, -1.5 * effect_multiplier}, {-0.2 * effect_multiplier, -2.3 * effect_multiplier}
            }
          },
          {
            type = "create-trivial-smoke",
            repeat_count = math.max(1, effect_multiplier),
            smoke_name = "demolisher-mining-smoke-front",
            initial_height = 0,
            speed = {0.04 * effect_multiplier, 0},
            speed_multiplier = 0.75,
            speed_multiplier_deviation = 0.2,
            starting_frame_deviation = 0.5,
            offset_deviation =
            {
              {0.2 * effect_multiplier, -1.5 * effect_multiplier}, {1.2 * effect_multiplier, -2.3 * effect_multiplier}
            }
          }
        }
      },
      -- side smoke top
      {
        distance_cooldown = 0.08 / effect_multiplier,
        effect =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = math.max(1, effect_multiplier),
            smoke_name = "demolisher-mining-smoke-small-top",
            initial_height = 0,
            speed = {-0.03, 0},
            speed_multiplier = 0.75,
            starting_frame_deviation = 0.5,
            offset_deviation =
            {
              {-2.4 * effect_multiplier, -1.8 * effect_multiplier}, {-1.4 * effect_multiplier, 0.1}
            }
          },
          {
            type = "create-trivial-smoke",
            repeat_count = math.max(1, effect_multiplier),
            smoke_name = "demolisher-mining-smoke-small-top",
            initial_height = 0,
            speed = {0.03, 0},
            speed_multiplier = 0.75,
            starting_frame_deviation = 0.5,
            offset_deviation =
            {
              {1.4 * effect_multiplier, -1.8 * effect_multiplier}, {2.4 * effect_multiplier, 0.1}
            }
          }
        }
      },
      -- inner smoke bottom
      {
        distance_cooldown = 0.05 / effect_multiplier,
        effect =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 4 * effect_multiplier,
            smoke_name = "demolisher-mining-smoke-small-bottom",
            initial_height = 0,
            speed = {-0.01, 0},
            speed_multiplier = 0.75,
            offset_deviation =
            {
              {-0.15 * effect_multiplier, -2.2 * effect_multiplier},
              {-0.1 * effect_multiplier, 1.5 * effect_multiplier}
            }
          },
          {
            type = "create-trivial-smoke",
            repeat_count = 4 * effect_multiplier,
            smoke_name = "demolisher-mining-smoke-small-bottom",
            initial_height = 0,
            speed = {-0.01, 0},
            speed_multiplier = 0.75,
            offset_deviation =
            {
              {0.1 * effect_multiplier, -2.2 * effect_multiplier},
              {0.15 * effect_multiplier, 1.5 * effect_multiplier}
            }
          },
          {
            type = "create-trivial-smoke",
            repeat_count = 4 * effect_multiplier,
            smoke_name = "demolisher-mining-smoke-small-bottom",
            initial_height = 0,
            speed = {-0.03, 0},
            speed_multiplier = 0.75,
            offset_deviation =
            {
              {-0.6 * effect_multiplier, -2.1 * effect_multiplier},
              {-0.4 * effect_multiplier, 0.2 * effect_multiplier}
            }
          },
          {
            type = "create-trivial-smoke",
            repeat_count = 4 * effect_multiplier,
            smoke_name = "demolisher-mining-smoke-small-bottom",
            initial_height = 0,
            speed = {0.03, 0},
            speed_multiplier = 0.75,
            offset_deviation =
            {
              {0.4 * effect_multiplier, -2.1 * effect_multiplier},
              {0.6 * effect_multiplier, 0.2 * effect_multiplier}
            }
          },
        }
      },
      -- big smoke bottom
      {
        distance_cooldown = 0.1 / effect_multiplier,
        effect =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 2 * effect_multiplier,
            smoke_name = "demolisher-mining-smoke-big",
            initial_height = 0,
            speed = {-0.03, 0},
            speed_multiplier = 0.75,
            speed_multiplier_deviation = 1.1,
            starting_frame_deviation = 0.5,
            offset_deviation =
            {
              {-0.75 * effect_multiplier, -1.7 * effect_multiplier},
              {-0.3 * effect_multiplier, 2.7 * effect_multiplier}
            }
          },
          {
            type = "create-trivial-smoke",
            repeat_count = 2 * effect_multiplier,
            smoke_name = "demolisher-mining-smoke-big",
            initial_height = 0,
            speed = {0.03, 0},
            speed_multiplier = 0.75,
            speed_multiplier_deviation = 1.1,
            starting_frame_deviation = 0.5,
            offset_deviation =
            {
              {0.3 * effect_multiplier, -1.7 * effect_multiplier},
              {0.75 * effect_multiplier, 2.7 * effect_multiplier}
            }
          },
        }
      },
      -- lava particle
      {
        distance_cooldown = 0.3 / effect_multiplier,
        effect =
        {
          type = "create-particle",
          repeat_count = 4, --* effect_multiplier,
          particle_name = "vulcanus-blood-particle-lower-layer-small",
          only_when_visible = true,
          offsets =
          {
            {-0.5 * effect_multiplier, 0.5 * effect_multiplier},
            {-0.5 * effect_multiplier, 0.5 * effect_multiplier}
          },
          offset_deviation =
          {
            {-1 * effect_multiplier, -1 * effect_multiplier},
            {1 * effect_multiplier, 1 * effect_multiplier}
          },
          initial_height = 0.1 * effect_multiplier,
          initial_height_deviation = 0.1 * effect_multiplier,
          initial_vertical_speed = 0,
          initial_vertical_speed_deviation = 0.1,
          speed_from_center = 0.12 *  effect_multiplier,
          speed_from_center_deviation = 0.1,
          frame_speed = 1,
          frame_speed_deviation = 0,
          tail_length = 52,
          tail_length_deviation = 25,
          tail_width = 6,
          rotate_offsets = false
        },
      },
      --rock particles rapid inner circle
      {
        distance_cooldown = 0.18 / effect_multiplier,
        effect =
        {
          {
            type = "create-particle",
            repeat_count = 10 * effect_multiplier,
            particle_name = "vulcanus-stone-particle-medium",
            offsets =
            {
             {0, -2.2 * effect_multiplier}
            },
            offset_deviation =
            {
              {-0.5 * effect_multiplier, -0.5 * effect_multiplier},
              {0.5 * effect_multiplier, 0.5 * effect_multiplier}
            },
            initial_height = 0.1,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.04,
            speed_from_center = 0.01 * effect_multiplier,
            speed_from_center_deviation = 0.01,
            only_when_visible = true,
            rotate_offsets = true
          },
          {
            type = "create-particle",
            repeat_count = 3 * effect_multiplier,
            particle_name = "vulcanus-stone-particle-big",
            offsets =
            {
             {0, -2 * effect_multiplier}
            },
            offset_deviation =
            {
              {-0.8 * effect_multiplier, -0.8 * effect_multiplier},
              {0.8 * effect_multiplier, 0.8 * effect_multiplier}
            },
            initial_height = 0,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.04,
            initial_vertical_speed_deviation = 0.04,
            speed_from_center = 0.02 * effect_multiplier,
            speed_from_center_deviation = 0.01,
            only_when_visible = true,
            rotate_offsets = true
          },
          {
            type = "create-particle",
            repeat_count = 14 * effect_multiplier,
            particle_name = "vulcanus-stone-particle-medium",
            offsets =
            {
              {0, -2 * effect_multiplier}
             },
             offset_deviation =
             {
               {-0.8 * effect_multiplier, -0.8 * effect_multiplier},
               {0.8 * effect_multiplier, 0.8 * effect_multiplier}
             },
            initial_height = 0.1,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.04,
            speed_from_center = 0.02 * effect_multiplier,
            speed_from_center_deviation = 0.01,
            only_when_visible = true,
            rotate_offsets = true
          },

        }
      },
      -- rocks particle with height outer circle
      {
        distance_cooldown = 0.4 / effect_multiplier,
        effect =
        {
          {
            type = "create-particle",
            repeat_count = 10 * effect_multiplier,
            particle_name = "vulcanus-stone-particle-small",
            offsets =
            {
             {0, -2.3 * effect_multiplier}
            },
            offset_deviation =
            {
              {-1.5 * effect_multiplier, -1.5 * effect_multiplier},
              {1.5 * effect_multiplier, 1.5 * effect_multiplier}
            },
            initial_height = 0.1,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.02,
            speed_from_center = 0.05 * effect_multiplier,
            speed_from_center_deviation = 0.04,
            only_when_visible = true,
            rotate_offsets = true
          },
          {
            type = "create-particle",
            repeat_count = 7 * effect_multiplier,
            particle_name = "vulcanus-stone-particle-medium",
            offsets =
            {
              {0, -2.3 * effect_multiplier}
            },
            offset_deviation =
            {
              {-1.5 * effect_multiplier, -1.5 * effect_multiplier},
              {1.5 * effect_multiplier, 1.5 * effect_multiplier}
            },
            initial_height = 0.1,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.03,
            speed_from_center = 0.06 * effect_multiplier,
            speed_from_center_deviation = 0.04,
            only_when_visible = true,
            rotate_offsets = true
          },
          {
            type = "create-particle",
            repeat_count = 3 * effect_multiplier,
            particle_name = "vulcanus-stone-particle-big",
            offsets =
            {
              {0, -2.3 * effect_multiplier}
            },
            offset_deviation =
            {
              {-1.5 * effect_multiplier, -1.5 * effect_multiplier},
              {1.5 * effect_multiplier, 1.5 * effect_multiplier}
            },
            initial_height = 0.1,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.04,
            initial_vertical_speed_deviation = 0.04,
            speed_from_center = 0.05 * effect_multiplier,
            speed_from_center_deviation = 0.04,
            only_when_visible = true,
            rotate_offsets = true
          },
          --rocks particle without height
          {
            type = "create-particle",
            repeat_count = 10 * effect_multiplier,
            particle_name = "vulcanus-stone-particle-small",
            offsets =
            {
             {0, -2.2 * effect_multiplier}
            },
            offset_deviation =
            {
              {-1.4 * effect_multiplier, -1.4 * effect_multiplier},
              {1.4 * effect_multiplier, 1.4 * effect_multiplier}
            },
            initial_height = 0,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.02,
            speed_from_center = 0.06 * effect_multiplier,
            speed_from_center_deviation = 0.04,
            only_when_visible = true,
            rotate_offsets = true
          },
          {
            type = "create-particle",
            repeat_count = 8 * effect_multiplier,
            particle_name = "vulcanus-stone-particle-medium",
            offsets =
            {
              {0, -2.2 * effect_multiplier}
            },
            offset_deviation =
            {
              {-1.4 * effect_multiplier, -1.4 * effect_multiplier},
              {1.4 * effect_multiplier, 1.4 * effect_multiplier}
            },
            initial_height = 0,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.02,
            speed_from_center = 0.06 * effect_multiplier,
            speed_from_center_deviation = 0.04,
            only_when_visible = true,
            rotate_offsets = true
          },
          {
            type = "create-particle",
            repeat_count = 1 * effect_multiplier,
            particle_name = "vulcanus-stone-particle-big",
            offsets =
            {
              {0, -2.2 * effect_multiplier}
            },
            offset_deviation =
            {
              {-1.4 * effect_multiplier, -1.4 * effect_multiplier},
              {1.4 * effect_multiplier, 1.4 * effect_multiplier}
            },
            initial_height = 0,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.02,
            speed_from_center = 0.06 * effect_multiplier,
            speed_from_center_deviation = 0.04,
            only_when_visible = true,
            rotate_offsets = true
          }
        }
      },
      {
        distance_cooldown = 0,
        effect =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            radius = 5 * scale,
            force = "not-same",
            collision_mask = {layers={player=true, train=true, rail=true, transport_belt=true, is_object=true}},
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "damage",
                  damage = { amount = 500 * damage_multiplier, type = "impact" }
                },
              }
            }
          }
        }
      },
      {
        distance_cooldown = 1,
        effect =
        {
          type = "destroy-cliffs",
          radius = scale * 2,
          explosion_at_cliff = "vulcanus-cliff-collapse",
        }
      }
    },
    update_effects_while_enraged =
    {
      make_demolisher_ash_cloud_update_effect(base_name)
    },
    segment_engine =
    {
      segments = make_demolisher_segment_specifications(base_name, demolisher_segment_scales, scale)
    },
    corpse = base_name .. "-corpse", -- doesn't work. Because not a real corpse?
    dying_trigger_effect =
    {
      {
        type = "create-entity",
        entity_name = base_name .. "-corpse"
      },
      {
        type = "create-trivial-smoke",
        repeat_count = 3 * effect_multiplier,
        smoke_name = "demolisher-dying-smoke",
        offset_deviation =
        {
          { -0.8 * effect_multiplier, -0.8 * effect_multiplier},
          { 0.8 * effect_multiplier, 0.8 * effect_multiplier}
        },
        initial_height = 0.6,
        starting_frame = 1,
        starting_frame_deviation = 60,
        speed_from_center = 0.03 * effect_multiplier,
        speed_from_center_deviation = 0.1
      },
      {
        type = "create-particle",
        repeat_count = 2 * effect_multiplier,
        repeat_count_deviation = 3,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "vulcanus-lava-particle-long-life-small",
        offsets =
        {
          { 0, -0.4 },
          { 0, 0.5 },
          { 0, 0.6 }
        },
        offset_deviation =
        {
          { -2 * effect_multiplier, -2 * effect_multiplier},
          { 2 * effect_multiplier, 2 * effect_multiplier }
        },
        initial_height = 0.5 * effect_multiplier,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.1 * effect_multiplier,
        initial_vertical_speed_deviation = 0.1,
        speed_from_center = 0.1 * effect_multiplier,
        speed_from_center_deviation = 0.1,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 52,
        tail_length_deviation = 25,
        tail_width = 3,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 4 * effect_multiplier,
        particle_name = "vulcanus-lava-particle-long-life-big",
        offset_deviation =
        {
          {-1.2 * effect_multiplier, -1.2 * effect_multiplier},
          {1.2 * effect_multiplier, 1.2 * effect_multiplier}
        },
        initial_height = 0.6,
        initial_height_deviation = 0.6,
        initial_vertical_speed = 0.08 * effect_multiplier,
        initial_vertical_speed_deviation = 0.25,
        speed_from_center = 0.035 * effect_multiplier,
        speed_from_center_deviation = 0.1,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 46,
        tail_length_deviation = 25,
        tail_width = 10,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 2 * effect_multiplier,
        repeat_count_deviation = 3,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "vulcanus-lava-particle-long-life-small",
        offsets =
        {
          { 0, -0.4 },
          { 0, 0.5 },
          { 0, 0.6 }
        },
        offset_deviation =
        {
          { -1.5 * effect_multiplier, -1.5 * effect_multiplier},
          { 1.5 * effect_multiplier, 1.5 * effect_multiplier }
        },
        initial_height = 0.5 * effect_multiplier,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.1 * effect_multiplier,
        initial_vertical_speed_deviation = 0.1,
        speed_from_center = 0.08 * effect_multiplier,
        speed_from_center_deviation = 0.08,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 52,
        tail_length_deviation = 25,
        tail_width = 3,
        rotate_offsets = false
      },
      --skin
      {
        type = "create-particle",
        repeat_count = 20 * effect_multiplier,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "demolisher-skin-particle-small",
        offsets =
        {
          { 0, -0.4 }
        },
        offset_deviation =
        {
          { -0.5 * effect_multiplier, -0.5 * effect_multiplier},
          { 0.5 * effect_multiplier, 0.5 * effect_multiplier}
        },
        initial_height = 1.3 * effect_multiplier,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.01 * effect_multiplier,
        initial_vertical_speed_deviation = 0.01,
        speed_from_center = 0.06 * effect_multiplier,
        speed_from_center_deviation = 0.06,
        frame_speed = 0.5,
        frame_speed_deviation = 0.2,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 2 * effect_multiplier,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "demolisher-skin-particle-medium",
        offsets =
        {
          { 0, -0.4 }
        },
        offset_deviation =
        {
          { -0.5 * effect_multiplier, -0.5 * effect_multiplier},
          { 0.5 * effect_multiplier, 0.5 * effect_multiplier}
        },
        initial_height = 1.4 * effect_multiplier,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.078 * effect_multiplier,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.07 * effect_multiplier,
        speed_from_center_deviation = 0.1,
        frame_speed = 0.3,
        frame_speed_deviation = 0.2,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 1 * effect_multiplier,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "demolisher-skin-particle-big",
        offsets =
        {
          { 0, -0.4 }
        },
        offset_deviation =
        {
          { -0.5 * effect_multiplier, -0.5 * effect_multiplier},
          { 0.5 * effect_multiplier, 0.5 * effect_multiplier}
        },
        initial_height = 1.5 * effect_multiplier,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.078 * effect_multiplier,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.07 * effect_multiplier,
        speed_from_center_deviation = 0.1,
        frame_speed = 0.2,
        frame_speed_deviation = 0.1,
        rotate_offsets = false
      },

      --shell
      {
        type = "create-particle",
        repeat_count = 20 * effect_multiplier,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "demolisher-shell-particle-small",
        offsets =
        {
          { 0, -0.4 }
        },
        offset_deviation =
        {
          { -1.5 * effect_multiplier, -1.5 * effect_multiplier},
          { 1.5 * effect_multiplier, 1.5 * effect_multiplier}
        },
        initial_height = 1.5 * effect_multiplier,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.058 * effect_multiplier,
        initial_vertical_speed_deviation = 0.01,
        speed_from_center = 0.06 * effect_multiplier,
        speed_from_center_deviation = 0.01,
      },
      {
        type = "create-particle",
        repeat_count = 1 * effect_multiplier,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "demolisher-shell-particle-big",
        offsets =
        {
          { 0, -0.4 }
        },
        offset_deviation =
        {
          { -1.5 * effect_multiplier, -1.5 * effect_multiplier},
          { 1.5 * effect_multiplier, 1.5 * effect_multiplier}
        },
        initial_height = 1.5 * effect_multiplier,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.058 * effect_multiplier,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.02 * effect_multiplier,
        speed_from_center_deviation = 0.1,
      },
    }
  }
end

function make_demolisher_corpse(base_name, order, scale, damage_multiplier, health, regen, speed_multiplier)
  local corpse_tint = {0.7,0.7,0.7}
  return {
    {
      name = base_name .. "-corpse",
      localised_name = {"entity-name.demolisher-corpse", {"entity-name."..base_name}},
      type = "simple-entity",
      flags = {"placeable-neutral", "placeable-off-grid"},
      icon = "__space-age__/graphics/icons/huge-volcanic-rock.png",
      subgroup = "grass",
      order=order,
      collision_box = {{-3 * scale, -3 * scale}, {3 * scale, 3 * scale}},
      selection_box = {{-3 * scale, -3 * scale}, {3 * scale, 3 * scale}},
      damaged_trigger_effect = hit_effects.rock(),
      dying_trigger_effect = decorative_trigger_effects.huge_rock(),
      minable =
      {
        mining_particle = "stone-particle",
        mining_time = 3,
        results =
        {
          {type = "item", name = "tungsten-ore", amount_min = 1, amount_max = 33}
        },
      },
      map_color = {129, 105, 78},
      count_as_rock_for_filtered_deconstruction = true,
      mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
      impact_category = "stone",
      render_layer = "object",
      max_health = 2000,
      resistances =
      {
        {
          type = "fire",
          percent = 100
        }
      },
      autoplace = {
        order = "a[landscape]-c[rock]-a[huge]",
        probability_expression = "vulcanus_rock_huge"
      },
      pictures =
      {
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-05.png",
          width = 201,
          height = 179,
          scale = 1.2 * scale,
          shift = {0.25, 0.0625},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-06.png",
          width = 233,
          height = 171,
          scale = 1.2 * scale,
          shift = {0.429688, 0.046875},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-07.png",
          width = 240,
          height = 192,
          scale = 1.2 * scale,
          shift = {0.398438, 0.03125},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-08.png",
          width = 219,
          height = 175,
          scale = 1.2 * scale,
          shift = {0.148438, 0.132812},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-09.png",
          width = 240,
          height = 208,
          scale = 1.2 * scale,
          shift = {0.3125, 0.0625},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-10.png",
          width = 243,
          height = 190,
          scale = 1.2 * scale,
          shift = {0.1875, 0.046875},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-11.png",
          width = 249,
          height = 185,
          scale = 1.2 * scale,
          shift = {0.398438, 0.0546875},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-12.png",
          width = 273,
          height = 163,
          scale = 1.2 * scale,
          shift = {0.34375, 0.0390625},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-13.png",
          width = 275,
          height = 175,
          scale = 1.2 * scale,
          shift = {0.273438, 0.0234375},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-14.png",
          width = 241,
          height = 215,
          scale = 1.2 * scale,
          shift = {0.195312, 0.0390625},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-15.png",
          width = 318,
          height = 181,
          scale = 1.2 * scale,
          shift = {0.523438, 0.03125},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-16.png",
          width = 217,
          height = 224,
          scale = 1.2 * scale,
          shift = {0.0546875, 0.0234375},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-17.png",
          width = 332,
          height = 228,
          scale = 1.2 * scale,
          shift = {0.226562, 0.046875},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-18.png",
          width = 290,
          height = 243,
          scale = 1.2 * scale,
          shift = {0.195312, 0.0390625},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-19.png",
          width = 349,
          height = 225,
          scale = 1.2 * scale,
          shift = {0.609375, 0.0234375},
          tint = corpse_tint
        },
        {
          filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-20.png",
          width = 287,
          height = 250,
          scale = 1.2 * scale,
          shift = {0.132812, 0.03125},
          tint = corpse_tint
        }
      }
    }
  }
end

function make_demolisher_segment(base_name, scale, damage_multiplier, health, sounds)
  local effect_multiplier = 2 * scale

  return
  {
    name = make_segment_name(base_name.."-segment", scale),
    type = "segment",
    localised_name = {"entity-name.demolisher-segment", {"entity-name."..base_name}},
    hidden = true,
    flags = {"not-repairable", "breaths-air", "not-in-kill-statistics"},
    max_health = health,
    impact_category = "organic",
    resistances = demolisher_body_resistances,
    collision_box = {{-3 * scale, -1 * scale}, {3 * scale, 1 * scale}},
    selection_box = {{-3 * scale, -1 * scale}, {3 * scale, 1 * scale}},
    drawing_box_vertical_extension = 4.0 * scale,
    is_military_target = true,
    overkill_fraction = demolisher_overkill_fraction,
    animation =
    {
      layers =
      {
        demolisher_spritesheet("segment", false, 0.5 * scale),
        demolisher_spritesheet("segment-shadow", true, 0.5 * scale),
      },
    },
    forward_overlap = 2,
    forward_padding = -0.5 * scale, -- tiles
    backward_padding = 1.5 * scale, -- tiles
    render_layer = "higher-object-under",
    working_sound = sounds.segment_working_sound,
    dying_sound_volume_modifier = sounds.dying_sound_volume_modifier,

    update_effects =
    {
      --lava
      {
        distance_cooldown = 3 / effect_multiplier,
        effect =
        {
          type = "create-particle",
          repeat_count = 1, --* effect_multiplier,
          particle_name = "vulcanus-blood-particle-lower-layer-small",
          offsets =
          {
            {-0.5 * effect_multiplier, 0.5 * effect_multiplier},
            {-0.5 * effect_multiplier, 0.5 * effect_multiplier}
          },
          offset_deviation =
          {
            {-1 * effect_multiplier, -1 * effect_multiplier},
            {1 * effect_multiplier, 1 * effect_multiplier}
          },
          initial_height = 0.1 * effect_multiplier,
          initial_height_deviation = 0.1 * effect_multiplier,
          initial_vertical_speed = 0,
          initial_vertical_speed_deviation = 0.1,
          speed_from_center = 0.045 *  effect_multiplier,
          speed_from_center_deviation = 0.1,
          frame_speed = 1,
          frame_speed_deviation = 0,
          tail_length = 52,
          tail_length_deviation = 25,
          tail_width = 6,
          rotate_offsets = false,
          only_when_visible = true
        },
      },
      --rocks
      {
        distance_cooldown = 1 / effect_multiplier,
        effect =
        {
          {
            type = "create-particle",
            repeat_count = 3 * effect_multiplier,
            particle_name = "vulcanus-stone-particle-small",
            offset_deviation = {{-2.15 * effect_multiplier, -2.15 * effect_multiplier}, {2.15 * effect_multiplier, 2.15 * effect_multiplier}},
            initial_height = 0,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.02,
            speed_from_center = 0.02 * effect_multiplier,
            speed_from_center_deviation = 0.01,
            only_when_visible = true,
            rotate_offsets = true
          },
          {
            type = "create-particle",
            repeat_count = 4 * effect_multiplier,
            particle_name = "vulcanus-stone-particle-medium",
            offset_deviation = {{-2.15 * effect_multiplier, -2.15 * effect_multiplier}, {2.15 * effect_multiplier, 2.15 * effect_multiplier}},
            initial_height = 0,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.02,
            speed_from_center = 0.02 * effect_multiplier,
            speed_from_center_deviation = 0.01,
            only_when_visible = true,
            rotate_offsets = true
          },
          {
            type = "create-particle",
            repeat_count = math.max(1, effect_multiplier),
            particle_name = "vulcanus-stone-particle-big",
            offset_deviation = {{-2.15 * effect_multiplier, -2.15 * effect_multiplier}, {2.15 * effect_multiplier, 2.15 * effect_multiplier}},
            initial_height = 0,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.02,
            speed_from_center = 0.02 * effect_multiplier,
            speed_from_center_deviation = 0.01,
            only_when_visible = true,
            rotate_offsets = true
          }
        }
      },
      {
        distance_cooldown = 1,
        effect =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            radius = 5 * scale,
            force = "not-same",
            collision_mask = {layers={player=true, train=true, rail=true, transport_belt=true, is_object=true}},
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "damage",
                  damage = { amount = 50 * damage_multiplier, type = "impact" }
                }
              }
            }
          }
        }
      }
    },
    corpse = base_name .. "-corpse", -- doesn't work. Because not a real corpse?
    dying_trigger_effect =
    {
      {
        type = "create-entity",
        entity_name = base_name .. "-corpse"
      },
      {
        type = "create-trivial-smoke",
        repeat_count = 3 * effect_multiplier,
        smoke_name = "demolisher-dying-smoke",
        offset_deviation =
        {
          { -0.8 * effect_multiplier, -0.8 * effect_multiplier},
          { 0.8 * effect_multiplier, 0.8 * effect_multiplier}
        },
        initial_height = 0.6,
        starting_frame = 1,
        starting_frame_deviation = 60,
        speed_from_center = 0.03 * effect_multiplier,
        speed_from_center_deviation = 0.1
      },
      {
        type = "create-particle",
        repeat_count = 2 * effect_multiplier,
        repeat_count_deviation = 3,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "vulcanus-lava-particle-long-life-small",
        offsets =
        {
          { 0, -0.4 },
          { 0, 0.5 },
          { 0, 0.6 }
        },
        offset_deviation =
        {
          { -2 * effect_multiplier, -2 * effect_multiplier},
          { 2 * effect_multiplier, 2 * effect_multiplier }
        },
        initial_height = 0.5 * effect_multiplier,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.1 * effect_multiplier,
        initial_vertical_speed_deviation = 0.1,
        speed_from_center = 0.1 * effect_multiplier,
        speed_from_center_deviation = 0.1,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 52,
        tail_length_deviation = 25,
        tail_width = 3,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 4 * effect_multiplier,
        particle_name = "vulcanus-lava-particle-long-life-big",
        offset_deviation =
        {
          {-1.2 * effect_multiplier, -1.2 * effect_multiplier},
          {1.2 * effect_multiplier, 1.2 * effect_multiplier}
        },
        initial_height = 0.6,
        initial_height_deviation = 0.6,
        initial_vertical_speed = 0.08 * effect_multiplier,
        initial_vertical_speed_deviation = 0.25,
        speed_from_center = 0.035 * effect_multiplier,
        speed_from_center_deviation = 0.1,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 46,
        tail_length_deviation = 25,
        tail_width = 10,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 2 * effect_multiplier,
        repeat_count_deviation = 3,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "vulcanus-lava-particle-long-life-small",
        offsets =
        {
          { 0, -0.4 },
          { 0, 0.5 },
          { 0, 0.6 }
        },
        offset_deviation =
        {
          { -1.5 * effect_multiplier, -1.5 * effect_multiplier},
          { 1.5 * effect_multiplier, 1.5 * effect_multiplier }
        },
        initial_height = 0.5 * effect_multiplier,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.1 * effect_multiplier,
        initial_vertical_speed_deviation = 0.1,
        speed_from_center = 0.08 * effect_multiplier,
        speed_from_center_deviation = 0.08,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 52,
        tail_length_deviation = 25,
        tail_width = 3,
        rotate_offsets = false
      },
      --skin
      {
        type = "create-particle",
        repeat_count = 20 * effect_multiplier,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "demolisher-skin-particle-small",
        offsets =
        {
          { 0, -0.4 }
        },
        offset_deviation =
        {
          { -0.5 * effect_multiplier, -0.5 * effect_multiplier},
          { 0.5 * effect_multiplier, 0.5 * effect_multiplier}
        },
        initial_height = 1.3 * effect_multiplier,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.01 * effect_multiplier,
        initial_vertical_speed_deviation = 0.01,
        speed_from_center = 0.06 * effect_multiplier,
        speed_from_center_deviation = 0.06,
        frame_speed = 0.5,
        frame_speed_deviation = 0.2,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 2 * effect_multiplier,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "demolisher-skin-particle-medium",
        offsets =
        {
          { 0, -0.4 }
        },
        offset_deviation =
        {
          { -0.5 * effect_multiplier, -0.5 * effect_multiplier},
          { 0.5 * effect_multiplier, 0.5 * effect_multiplier}
        },
        initial_height = 1.4 * effect_multiplier,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.078 * effect_multiplier,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.07 * effect_multiplier,
        speed_from_center_deviation = 0.1,
        frame_speed = 0.3,
        frame_speed_deviation = 0.2,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 1 * effect_multiplier,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "demolisher-skin-particle-big",
        offsets =
        {
          { 0, -0.4 }
        },
        offset_deviation =
        {
          { -0.5 * effect_multiplier, -0.5 * effect_multiplier},
          { 0.5 * effect_multiplier, 0.5 * effect_multiplier}
        },
        initial_height = 1.5 * effect_multiplier,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.078 * effect_multiplier,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.07 * effect_multiplier,
        speed_from_center_deviation = 0.1,
        frame_speed = 0.2,
        frame_speed_deviation = 0.1,
        rotate_offsets = false
      },

      --shell
      {
        type = "create-particle",
        repeat_count = 20 * effect_multiplier,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "demolisher-shell-particle-small",
        offsets =
        {
          { 0, -0.4 }
        },
        offset_deviation =
        {
          { -1.5 * effect_multiplier, -1.5 * effect_multiplier},
          { 1.5 * effect_multiplier, 1.5 * effect_multiplier}
        },
        initial_height = 1.5 * effect_multiplier,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.058 * effect_multiplier,
        initial_vertical_speed_deviation = 0.01,
        speed_from_center = 0.06 * effect_multiplier,
        speed_from_center_deviation = 0.01,
      },
      {
        type = "create-particle",
        repeat_count = 1 * effect_multiplier,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "demolisher-shell-particle-big",
        offsets =
        {
          { 0, -0.4 }
        },
        offset_deviation =
        {
          { -1.5 * effect_multiplier, -1.5 * effect_multiplier},
          { 1.5 * effect_multiplier, 1.5 * effect_multiplier}
        },
        initial_height = 1.5 * effect_multiplier,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.058 * effect_multiplier,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.02 * effect_multiplier,
        speed_from_center_deviation = 0.1,
      },
    }
  }
end

function make_demolisher_tail(base_name, scale, damage_multiplier, health, sounds)
  return
  {
    name = make_segment_name(base_name.."-tail", scale),
    type = "segment",
    localised_name = {"entity-name.demolisher-tail", {"entity-name."..base_name}},
    hidden = true,
    flags = {"not-repairable", "breaths-air", "not-in-kill-statistics"},
    max_health = health,
    impact_category = "organic",
    resistances = demolisher_body_resistances,
    collision_box = {{-3 * scale, -3 * scale}, {3 * scale, 3 * scale}},
    selection_box = {{-3 * scale, -3 * scale}, {3 * scale, 3 * scale}},
    drawing_box_vertical_extension = 4.0 * scale,
    is_military_target = true,
    overkill_fraction = demolisher_overkill_fraction,
    animation =
    {
      layers =
      {
        demolisher_spritesheet("tail", false, 0.5 * scale),
        demolisher_spritesheet("tail-shadow", true, 0.5 * scale),
      },
    },
    forward_overlap = 2,
    forward_padding = -2.75 * scale, -- tiles
    render_layer = "higher-object-under",
    working_sound = sounds.tail_working_sound,
    corpse = base_name .. "-corpse",
  }
end

function make_demolisher_segment_specifications(base_name, segment_scales, scale)
  local specifications = {}
  local num_segments = #segment_scales
  for i = 1,num_segments do
    local segment_scale = segment_scales[i] * scale
    if i < num_segments then
      specifications[i] = { segment = make_segment_name(base_name.."-segment", segment_scale) }
    else
      specifications[i] = { segment = make_segment_name(base_name.."-tail", segment_scale) }
    end
  end
  return specifications
end

function make_demolisher_segments(base_name, segment_scales, scale, damage_multiplier, health, sounds)
  local existing = {}
  local prototypes = {}
  local num_segments = #segment_scales
  for i = 1,num_segments do
    local segment_scale = segment_scales[i] * scale
    if i < num_segments then
      if not existing[make_segment_name(base_name.."-segment", segment_scale)] then
        existing[make_segment_name(base_name.."-segment", segment_scale)] = true
        table.insert(prototypes, make_demolisher_segment(base_name, segment_scale, damage_multiplier, health, sounds))
      end
    else
      if not existing[make_segment_name(base_name.."-tail", segment_scale)] then
        existing[make_segment_name(base_name.."-tail", segment_scale)] = true
        table.insert(prototypes, make_demolisher_tail(base_name, segment_scale, damage_multiplier, health, sounds))
      end
    end
  end
  return prototypes
end

function make_ash_cloud_trigger_effects(base_name, radius, damage_multiplier)
  return {
    type = "direct",
    action_delivery =
    {
      type = "instant",
      target_effects =
      {
        {
          type = "nested-result",
          action =
          {
            type = "area",
            ignore_collision_condition = true,
            radius = radius,
            target_enemies = true,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "create-sticker",
                  sticker = "demolisher-ash-sticker"
                }
              }
            }
          }
        },
        { -- combat robots can't take stickers
          type = "nested-result",
          action =
          {
            type = "area",
            trigger_target_mask = {"flying-robot"},
            ignore_collision_condition = true,
            target_enemies = true,
            radius = radius,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "damage",
                  damage = { amount = 1 * damage_multiplier, type = "physical"}
                },
                {
                  type = "damage",
                  damage = { amount = 2 * damage_multiplier, type = "fire"}
                }
              }
            }
          }
        }
      }
    }
  }
end

function make_demolisher_fissure_attack(base_name, order, scale, damage_multiplier)

  return {
    {
      type = "explosion",
      name = base_name .. "-fissure",
      localised_name = {"entity-name.demolisher-fissure", {"entity-name."..base_name}},
      flags = {"not-on-map"},
      hidden = true,
      icon = "__base__/graphics/icons/small-scorchmark.png",
      order = order ,
      subgroup = "explosions",
      height = 0,
      render_layer = "ground-patch-higher2",
      created_effect =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "delayed",
            delayed_trigger = base_name .. "-fissure-explosion-delay"
          }
        },
        {
          type = "direct",
          action_delivery =
          {
            type = "delayed",
            delayed_trigger = base_name .. "-fissure-explosion-particles-delay"
          }
        },
        {
          type = "direct",
          action_delivery =
          {
            type = "delayed",
            delayed_trigger = base_name .. "-fissure-explosion-damage-delay"
          }
        }
      },
      animations = util.sprite_load("__space-age__/graphics/entity/demolisher/fissure/demolisher-crack-effect",
      {
        frame_count = 15,
        priority = "high",
        --frame_count/fissure_eruption_ticks
        animation_speed = (15) / (fissure_eruption_ticks - 9),
        draw_as_glow = true,
        scale = fissure_size * scale,
      }),
      light =
      {
        intensity = 1,
        size = 20 * scale,
        color = {r = 1.0, g = 0.5, b = 0}
      },
      light_intensity_factor_final = 1,
      light_size_factor_final = 1
    },
    {
      type = "delayed-active-trigger",
      name = base_name .. "-fissure-explosion-delay",
      delay = fissure_explosion_delay_ticks,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-entity",
                entity_name = base_name .. "-fissure-explosion"
              },
              --[[ {
                type = "create-entity",
                entity_name = "crash-site-fire-smoke"
              }, ]]
              {
                type = "create-entity",
                entity_name = base_name .. "-fissure-scorchmark"
              }
            }
          }
        }
      }
    },
    {
      type = "delayed-active-trigger",
      name = base_name .. "-fissure-explosion-particles-delay",
      delay = fissure_explosion_delay_ticks + fissure_explosion_particles_delay_ticks,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-particle",
                repeat_count = 14,
                particle_name = "vulcanus-lava-particle-long-life-small",
                offset_deviation =
                {
                  {-1, -1},
                  {1 , 1}
                },
                initial_height = 0.6,
                initial_height_deviation = 0.6,
                initial_vertical_speed = 0.08,
                initial_vertical_speed_deviation = 0.3,
                speed_from_center = 0.045,
                speed_from_center_deviation = 0.1,
                frame_speed = 1,
                frame_speed_deviation = 0,
                tail_length = 52,
                tail_length_deviation = 25,
                tail_width = 6,
                rotate_offsets = false
              },
              {
                type = "create-particle",
                repeat_count = 8,
                particle_name = "vulcanus-lava-particle-long-life-small",
                offset_deviation =
                {
                  {-1, -1},
                  {1 , 1}
                },
                initial_height = 0.6,
                initial_height_deviation = 0.6,
                initial_vertical_speed = 0.11,
                initial_vertical_speed_deviation = 0.3,
                speed_from_center = 0.025,
                speed_from_center_deviation = 0.1,
                frame_speed = 1,
                frame_speed_deviation = 0,
                tail_length = 86,
                tail_length_deviation = 25,
                tail_width = 10,
                rotate_offsets = false
              },
              {
                type = "create-particle",
                repeat_count = 8,
                particle_name = "vulcanus-lava-particle-long-life-small",
                offset_deviation =
                {
                  {-1, -1},
                  {1 , 1}
                },
                initial_height = 0.6,
                initial_height_deviation = 0.6,
                initial_vertical_speed = 0.05,
                initial_vertical_speed_deviation = 0.3,
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.1,
                frame_speed = 1,
                frame_speed_deviation = 0,
                tail_length = 36,
                tail_length_deviation = 25,
                tail_width = 10,
                rotate_offsets = false
              },
              --rock
              {
                type = "create-particle",
                repeat_count = 30,
                particle_name = "vulcanus-stone-particle-smoke-small",
                offset_deviation = {{-1.3, -1.3}, {1.3, 1.3}},
                initial_height = 0,
                initial_vertical_speed = 0.1,
                initial_vertical_speed_deviation = 0.1,
                speed_from_center = 0.065,
                speed_from_center_deviation = 0.1,
                only_when_visible = true
              },
              {
                type = "create-particle",
                repeat_count = 25,
                particle_name = "vulcanus-stone-particle-smoke-medium",
                offset_deviation = {{-1.3, -1.3}, {1.3, 1.3}},
                initial_height = 0,
                initial_vertical_speed = 0.1,
                initial_vertical_speed_deviation = 0.1,
                speed_from_center = 0.065,
                speed_from_center_deviation = 0.1,
                only_when_visible = true
              },
              {
                type = "create-particle",
                repeat_count = 10,
                particle_name = "vulcanus-stone-particle-smoke-big",
                offset_deviation = {{-1.3, -1.3}, {1.3, 1.3}},
                initial_height = 0,
                initial_vertical_speed = 0.1,
                initial_vertical_speed_deviation = 0.1,
                speed_from_center = 0.065,
                speed_from_center_deviation = 0.1,
                only_when_visible = true
              },
              --smoke
              --[[
              {
                type = "create-trivial-smoke",
                repeat_count = 20,
                repeat_count_deviation = 1,
                smoke_name = "magma-eruption-ground-smoke",
                offset_deviation = {{-1.5, -1.5}, {1.5, 1.5}},
                --speed = {0, -0.5},
                initial_height = - 0.4,
                speed_from_center = 0.004,
                speed_from_center_deviation = 0.015
              },
              {
                type = "create-trivial-smoke",
                repeat_count = 10,
                smoke_name = "magma-eruption-dark-smoke",
                speed = {0, -0.8},
                speed_multiplier = 0.35,
                speed_multiplier_deviation = 0.3,
                offset_deviation = {{-1, -1}, {1, 1}},
                starting_frame = 0,
                starting_frame_deviation = 60,
                initial_height = 0.6,
                speed_from_center = 0.02,
                speed_from_center_deviation = 0.1
              },
              {
                type = "create-trivial-smoke",
                repeat_count = 6,
                smoke_name = "magma-eruption-bright-smoke",
                speed = {0, -0.5},
                speed_multiplier = 0.15,
                speed_multiplier_deviation = 0.4,
                offset_deviation = {{-1, -1}, {1, 1}},
                starting_frame = 0,
                starting_frame_deviation = 60,
                initial_height = 0.6,
                speed_from_center = 0.02,
                speed_from_center_deviation = 0.1
              },]]
            }
          }
        }
      }
    },
    {
      type = "delayed-active-trigger",
      name = base_name .. "-fissure-explosion-damage-delay",
      delay = fissure_explosion_delay_ticks + fissure_explosion_damage_delay_ticks,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-entity",
                entity_name = base_name .. "-fissure-damage-explosion"
              }
            }
          }
        }
      }
    },
    {
      type = "explosion",
      name = base_name .. "-fissure-explosion",
      localised_name = {"entity-name.demolisher-fissure-explosion", {"entity-name."..base_name}},
      flags = {"not-on-map"},
      hidden = true,
      icon = "__base__/graphics/icons/explosion.png",
      order = order ,
      subgroup = "explosions",
      height = 1.5,
      animations = explosion_animations.magma_eruption(),
      sound = space_age_sounds.fissure_explosion,
      light =
      {
        intensity = 0.8,
        size = 20 * scale,
        color = {r = 1.0, g = 0.5, b = 0}
      },
      light_intensity_factor_initial = 1,
      light_size_factor_initial = 1
    },
    {
      type = "explosion",
      name = base_name .. "-fissure-damage-explosion",
      localised_name = {"entity-name.demolisher-fissure-damage-explosion", {"entity-name."..base_name}},
      flags = {"not-on-map"},
      hidden = true,
      icon = "__base__/graphics/icons/explosion.png",
      order = order ,
      subgroup = "explosions",
      height = 0,
      animations = util.empty_sprite(),
      --[[sound =   {
        aggregation =
        {
          max_count = 1,
          remove = true
        },
        audible_distance_modifier = 1.95,
        switch_vibration_data =
        {
          filename = "__base__/sound/fight/large-explosion.bnvib",
          play_for = "everything",
          gain = 0.6,
        },
        game_controller_vibration_data =
        {
          low_frequency_vibration_intensity = 0.9,
          duration = 160,
          play_for = "everything"
        },
        filename = "__base__/sound/fight/fire-impact-4.ogg",
        volume = 1.0
      },]]
      sound = {
        aggregation =
        {
          max_count = 1,
          remove = true
        },
        switch_vibration_data =
        {
          filename = "__base__/sound/fight/medium-explosion.bnvib",
          gain = 1.0
        },
        audible_distance_modifier = 0.7,
        variations = sound_variations("__base__/sound/fight/medium-explosion", 5, 1, volume_multiplier("main-menu", 1.2) )
      },
      created_effect =
      {
        {
          type = "area",
          ignore_collision_condition = true,
          radius = 2 * scale,
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "damage",
                damage = {amount = 500 * damage_multiplier, type = "explosion"}
              },
              {
                type = "damage",
                damage = {amount = 400 * damage_multiplier, type = "fire"}
              }
            }
          }
        },
        {
          type = "area",
          ignore_collision_condition = true,
          radius = 4 * scale,
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "damage",
                damage = {amount = 75 * damage_multiplier, type = "explosion"}
              },
              {
                type = "damage",
                damage = {amount = 75 * damage_multiplier, type = "fire"}
              }
            }
          }
        },
        {
          type = "area",
          ignore_collision_condition = true,
          radius = 7 * scale,
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "damage",
                damage = {amount = 50 * damage_multiplier, type = "fire"}
              },
              {
                type = "create-entity",
                entity_name = "explosion"
              }
            }
          }
        }
      }
    },
    {
      type = "corpse",
      name = base_name .. "-fissure-scorchmark",
      localised_name = {"entity-name.demolisher-fissure-scorchmark", {"entity-name."..base_name}},
      icon = "__base__/graphics/icons/small-scorchmark.png",
      flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
      hidden_in_factoriopedia = true,
      collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
      collision_mask = {layers={doodad=true}, not_colliding_with_itself=true},
      selection_box = {{-1, -1}, {1, 1}},
      selectable_in_game = false,
      time_before_removed = 60 * 30, -- 30 seconds
      time_before_shading_off = 60 * 30,
      --time_before_shading_off = 60 * 2,
      final_render_layer = "ground-patch-higher",
      animation_render_layer = "ground-patch-higher2",
      subgroup = "scorchmarks",
      order = order ,
      remove_on_entity_placement = false,
      remove_on_tile_placement = true,
      use_tile_color_for_ground_patch_tint = false,
      decay_frame_transition_duration = 15,
      dying_speed = 0.01,
      animation = util.sprite_load("__space-age__/graphics/entity/demolisher/fissure/demolisher-fissure-hot-fade",
      {
        frame_count = 9,
        priority = "high",
        --frame_count/fissure_eruption_ticks
        draw_as_glow = true,
        scale = fissure_size * scale,
        shift = util.by_pixel( 0, 7.0),
        frame_sequence = {1, 2, 3, 4, 5, 6, 7, 8, 9}
      }),
      decay_animation =  {
        filename = "__space-age__/graphics/entity/demolisher/fissure/demolisher-fissure-fade.png",
        width = 922,
        height = 690,
        line_length = 1,
        shift = util.by_pixel( 2, 0.0),
        scale = fissure_size * scale
      }
    }
  }
end

function make_demolisher_effects(base_name, order, scale, damage_multiplier)
  local main_cloud_scale = 1 + 0.5 * scale
  local expanding_cloud_steps = demolisher_expanding_cloud_steps
  local ash_cloud =
  {
    type = "smoke-with-trigger",
    name = base_name .. "-ash-cloud",
    localised_name = {"entity-name.demolisher-ash-cloud", {"entity-name."..base_name}, i},
    order = order,
    flags = {"not-on-map"},
    hidden = true,
    show_when_smoke_off = true,
    particle_count = 1,
    particle_spread = { 1, 1 },
    particle_distance_scale_factor = 0.5,
    particle_scale_factor = { 1, 0.707 },
    wave_speed = { 1/80, 1/60 },
    wave_distance = { 0.3, 0.2 },
    spread_duration_variation = 20,
    particle_duration_variation = 60 * 3,
    render_layer = "object",

    affected_by_wind = false,
    cyclic = true,
    duration = demolisher_cloud_duration, -- linger for up to 5s
    fade_away_duration = 60,
    spread_duration = 20,
    color = {0.239, 0.239, 0.239, 0.50},
    attach_to_target = true,
    fade_when_attachment_is_destroyed = true,

    animation =
    {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png",
      flags = { "smoke" }
    },
    action =
    {
      {
        type = "cluster",
        cluster_count = math.ceil(4 * main_cloud_scale),
        distance = 5 * main_cloud_scale,
        distance_deviation = 5 * main_cloud_scale,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-smoke",
              show_in_tooltip = false,
              entity_name = "demolisher-ash-cloud-visual-dummy",
              initial_height = 0
            },
          }
        }
      },
      {
        type = "cluster",
        cluster_count = math.ceil(4 * main_cloud_scale),
        distance = 11 * main_cloud_scale,
        distance_deviation = 3 * main_cloud_scale,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-smoke",
              show_in_tooltip = false,
              entity_name = "demolisher-ash-cloud-visual-dummy",
              initial_height = 0
            }
          }
        }
      },
      {
        type = "cluster",
        cluster_count = math.ceil(6 * main_cloud_scale),
        distance = 17 * main_cloud_scale,
        distance_deviation = 3 * main_cloud_scale,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-smoke",
              show_in_tooltip = false,
              entity_name = "demolisher-ash-cloud-visual-dummy",
              initial_height = 0
            }
          }
        }
      },
      {
        type = "cluster",
        cluster_count = math.ceil(8 * main_cloud_scale),
        distance = 23 * main_cloud_scale,
        distance_deviation = 3 * main_cloud_scale,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-smoke",
              show_in_tooltip = false,
              entity_name = "demolisher-ash-cloud-visual-dummy",
              initial_height = 0
            }
          }
        }
      },
      {
        type = "cluster",
        cluster_count = math.ceil(12 * main_cloud_scale),
        distance = 29 * main_cloud_scale,
        distance_deviation = 3 * main_cloud_scale,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-smoke",
              show_in_tooltip = false,
              entity_name = "demolisher-ash-cloud-visual-dummy",
              initial_height = 0
            }
          }
        }
      },
      {
        -- thicker outer ring
        type = "cluster",
        cluster_count = math.ceil(3 * 32 * main_cloud_scale),
        distance = 32 * main_cloud_scale,
        distance_deviation = 0.5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-trivial-smoke",
              smoke_name = "demolisher-ash-cloud-boundary",
              initial_height = 0,
              offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
              starting_frame = 30,
              starting_frame_deviation = 30,
              speed_from_center = 0.1,
              speed_from_center_deviation = 0.1
            }
          }
        }
      },
      make_ash_cloud_trigger_effects(base_name, 32 * main_cloud_scale, damage_multiplier)
    },
    action_cooldown = 10
  }
  local function make_expanding_ash_cloud(i, cloud_scale)
    local max_radius = 32 * cloud_scale
    local band_thickness = 4
    local bands = math.max(1, math.floor(max_radius / band_thickness) - 1)
    local actions = {}
    for j = 1, bands do
      local radius = max_radius - (j-0.5) * band_thickness
      local particles = math.floor(radius / 4)
      if particles > 2 then
        local cluster = {
          type = "cluster",
          cluster_count = particles,
          distance = radius,
          distance_deviation = band_thickness * 0.75,
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-smoke",
                show_in_tooltip = false,
                entity_name = "demolisher-ash-cloud-visual-dummy",
                initial_height = 0
              }
            }
          }
        }
        table.insert(actions, cluster)
      end
    end
    -- outer band, no variation
    local outer_cluster = {
      -- thicker outer ring
      type = "cluster",
      cluster_count = math.max(2, 3 * math.ceil(max_radius)),
      distance = max_radius,
      distance_deviation = 0.02,
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            smoke_name = "demolisher-ash-cloud-expanding-boundary",
            initial_height = 0,
            -- repeat_count = 10,
            offset_deviation = {{-0.025, -0.025}, {0.025, 0.025}},
            starting_frame = 30,
            starting_frame_deviation = 30,
            speed_from_center = 0.1,
            speed_from_center_deviation = 0.1
          }
        }
      }
    }
    table.insert(actions, outer_cluster)
    -- add the significant actions
    table.insert(actions, make_ash_cloud_trigger_effects(base_name, 32 * cloud_scale, damage_multiplier))
    local expanding_ash_cloud =
    {
      type = "smoke-with-trigger",
      name = base_name .. "-expanding-ash-cloud-"..i,
      localised_name = {"entity-name.demolisher-expanding-ash-cloud", {"entity-name."..base_name}, ""..i},
      order = order .."-"..string.format("%02d", i),
      flags = {"not-on-map"},
      hidden = true,
      show_when_smoke_off = true,
      particle_count = 1,
      particle_spread = { 1, 1 },
      particle_distance_scale_factor = 0.5,
      particle_scale_factor = { 1, 0.707 },
      wave_speed = { 1/80, 1/60 },
      wave_distance = { 0.3, 0.2 },
      spread_duration_variation = 0,
      particle_duration_variation = demolisher_expanding_cloud_interval,
      render_layer = "object",

      affected_by_wind = false,
      cyclic = false,
      duration = demolisher_expanding_cloud_interval * 2,
      fade_away_duration = demolisher_expanding_cloud_interval,
      spread_duration = demolisher_expanding_cloud_interval,
      color = {0.239, 0.239, 0.239, 0.50},
      attach_to_target = true,
      fade_when_attachment_is_destroyed = true,

      animation =
      {
        width = 152,
        height = 120,
        line_length = 5,
        frame_count = 60,
        shift = {-0.53125, -0.4375},
        priority = "high",
        animation_speed = 0.25,
        filename = "__base__/graphics/entity/smoke/smoke.png",
        flags = { "smoke" }
      },
      action = actions,
      action_cooldown = demolisher_expanding_cloud_interval
    }
    return expanding_ash_cloud
  end
  local function make_expanding_ash_clouds(max_radius)
    local expanding_ash_clouds = {}
    local start_expansion = 2
    for i = 1, expanding_cloud_steps do
      local cloud_scale = main_cloud_scale * (i + start_expansion) / (expanding_cloud_steps + start_expansion)
      table.insert(expanding_ash_clouds, make_expanding_ash_cloud(i, cloud_scale))
    end

    table.insert(expanding_ash_clouds[1].action,
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "play-sound",
            sound = space_age_sounds.ash_cloud_explosion,
          }
        }
      }
    })

    return expanding_ash_clouds
  end
  local expanding_ash_clouds = make_expanding_ash_clouds(main_cloud_scale)

  local expanding_ash_cloud_delays = {}
  local ticks_between_expanding_ash_cloud_steps = demolisher_expanding_cloud_interval
  for i = 2, expanding_cloud_steps do
    table.insert(expanding_ash_cloud_delays,
    {
      type = "delayed-active-trigger",
      name = base_name .. "-expanding-ash-cloud-delay-" .. i,
      delay = ticks_between_expanding_ash_cloud_steps * (i - 1),
      cancel_when_source_is_destroyed = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              {
                type = "create-entity",
                entity_name = expanding_ash_clouds[i].name
              }
            }
          }
        }
      }
    })
  end

  table.insert(expanding_ash_cloud_delays,
  {
    type = "delayed-active-trigger",
    name = base_name .. "-ash-cloud-delay",
    delay = ticks_between_expanding_ash_cloud_steps * expanding_cloud_steps,
    repeat_count = demolisher_cloud_repeats,
    repeat_delay = demolisher_cloud_duration,
    cancel_when_source_is_destroyed = true,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-entity",
              entity_name = ash_cloud.name
            }
          }
        }
      }
    }
  })

  local fissure_prototypes = make_demolisher_fissure_attack(base_name, order, scale, damage_multiplier)

  local function variations_to_sheets(data)
    local sheets = {}
    for i = 1, data.variation_count do
      local sheet = table.deepcopy(data)
      sheet.variation_count = 1
      sheet.line_length = 1
      sheet.frame_count = 1
      sheet.x = ((i - 1) % data.line_length) * data.width
      sheet.y = math.floor((i - 1) / data.line_length) * data.height
      sheet.variation_count = nil
      table.insert(sheets, sheet)
    end
    --log(serpent.block(sheets))
    return sheets
  end

  local ash_cloud_trail =
  {
    type = "smoke-with-trigger",
    name = base_name .. "-ash-cloud-trail",
    localised_name = {"entity-name.demolisher-ash-cloud-trail", {"entity-name."..base_name}},
    order = order,
    flags = {"not-on-map"},
    hidden = true,
    show_when_smoke_off = true,
    particle_count = 20 * scale,
    particle_spread = { 12 * scale, 12 * scale },
    particle_distance_scale_factor = 0.5,
    particle_scale_factor = { 1, 0.707 },
    particle_duration_variation = 60,
    wave_speed = { 0.5 / 80, 0.5 / 60 },
    wave_distance = { 1, 0.5 },
    spread_duration_variation = 60,

    render_layer = "under-elevated",

    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 60 * 2, -- 2 minutes
    fade_away_duration = 60 * 10,
    spread_duration = 60 ,
    color = {0.239, 0.239, 0.239, 0.50},
    animation =
    {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png",
      flags = { "smoke" }
    },
    action = make_ash_cloud_trigger_effects(base_name, 8 * scale, 1),
    action_cooldown = 30
  }
  local trail_upper = {
    type = "corpse",
    name = base_name .. "-trail-upper",
    localised_name = {"entity-name.demolisher-trail-upper", {"entity-name."..base_name}},
    icon = "__base__/graphics/icons/small-scorchmark.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    hidden_in_factoriopedia = true,
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={doodad=true}, not_colliding_with_itself=true},
    selection_box = {{-1, -1}, {1, 1}},
    selectable_in_game = false,
    time_before_removed = 60 * 90,
    final_render_layer = "ground-patch-higher2",
    subgroup = "scorchmarks",
    order = order ,
    remove_on_entity_placement = false,
    remove_on_tile_placement = true,
    use_tile_color_for_ground_patch_tint = false,
    ground_patch_fade_in_speed = 0.004,
    ground_patch_render_layer = "ground-patch-higher",
    ground_patch = variations_to_sheets({
      filename = "__space-age__/graphics/entity/demolisher/trail-upper/demolisher-trail-upper.png",
      line_length = 4,
      variation_count = 14,
      width = 512,
      height = 512,
      scale = 1.5 * scale
    })
  }
  local trail_lower = {
    type = "corpse",
    name = base_name .. "-trail-lower",
    localised_name = {"entity-name.demolisher-trail-lower", {"entity-name."..base_name}},
    icon = "__base__/graphics/icons/small-scorchmark.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    hidden_in_factoriopedia = true,
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={doodad=true}, not_colliding_with_itself=true},
    selection_box = {{-1, -1}, {1, 1}},
    selectable_in_game = false,
    time_before_removed = 60 * 120,
    final_render_layer = "ground-patch-higher2",
    subgroup = "scorchmarks",
    order = order ,
    remove_on_entity_placement = false,
    remove_on_tile_placement = true,
    use_tile_color_for_ground_patch_tint = false,
    ground_patch_fade_in_speed = 0.004,
    ground_patch = variations_to_sheets({
      filename = "__space-age__/graphics/entity/demolisher/trail-lower/demolisher-trail-lower.png",
      line_length = 4,
      variation_count = 14,
      width = 512,
      height = 512,
      scale = 2 * scale
    })
  }

  local prototypes = {
    ash_cloud, ash_cloud_trail, trail_upper, trail_lower,
  }
  for _, prototype in pairs(expanding_ash_clouds) do
    table.insert(prototypes, prototype)
  end
  for _, prototype in pairs(expanding_ash_cloud_delays) do
    table.insert(prototypes, prototype)
  end
  for _, prototype in pairs(fissure_prototypes) do
    table.insert(prototypes, prototype)
  end
  return prototypes
end

data:extend(
{
  {
    type = "sticker",
    name = "demolisher-ash-sticker",
    order = "s-k",
    animation =
    {
      tint = {0.239, 0.239, 0.239, 0.50},
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = {0, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png",
      scale = 0.5
    },
    duration_in_ticks = 120,
    target_movement_max = 0.15,
    target_movement_modifier = 0.9,
    vehicle_speed_modifier = 0.4,
    vehicle_friction_modifier = 4,
    ground_target = true, -- prevent flight
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/stickers/ash-cloud-disruption.ogg",
        volume = 0.8,
        advanced_volume_control =
        {
          fades =
          {
            fade_in =
            {
              curve_type = "cosine",
              from =
              {
                control = 0.5, volume_percentage = 0.0
              },
              to =
              {
                control = 1.0, volume_percentage = 100.0
              }
            }
          }
        }
      },
      audible_distance_modifier = 0.6,
      fade_in_ticks = 4,
      fade_out_ticks = 20,
      max_sounds_per_type = 3
    },
    update_effects =
    {
      {
        time_cooldown = 5, -- ticks
        effect =
        {
          {
            type = "create-particle",
            repeat_count = 2,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "spark-particle",
            offset_deviation = { { -0.5, -0.9 }, { 0.5, 0.9 } },
            initial_height = 1.2,
            initial_vertical_speed = 0,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.025,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "spark-particle-debris",
            offset_deviation = { { -0.5, -0.9 }, { 0.5, 0.9 } },
            initial_height = 1.2,
            initial_vertical_speed = 0,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.025,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-entity",
            probability = 0.2,
            affects_target = false,
            show_in_tooltip = false,
            entity_name = "flying-robot-damaged-explosion"
          },
          {
            type = "create-entity",
            probability = 0.1,
            affects_target = false,
            show_in_tooltip = false,
            entity_name = "explosion-hit"
          }
        }
      }
    }
  },
  {
    type = "smoke-with-trigger",
    name = "demolisher-ash-cloud-visual-dummy",
    order = "s-k",
    flags = {"not-on-map"},
    hidden = true,
    show_when_smoke_off = true,
    particle_count = 24,
    particle_spread = { 6, 6 },
    particle_distance_scale_factor = 0.5,
    particle_scale_factor = { 1, 0.707 },
    particle_duration_variation = 60,
    wave_speed = { 0.5 / 80, 0.5 / 60 },
    wave_distance = { 1, 0.5 },
    spread_duration_variation = 60,

    render_layer = "under-elevated",

    affected_by_wind = false,
    cyclic = true,
    duration = 120,
    fade_away_duration = 60,
    spread_duration = 60 ,
    color = {0.239, 0.239, 0.239, 0.50},

    animation =
    {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png",
      flags = { "smoke" }
    },
    working_sound =
    {
      sound = {filename = "__space-age__/sound/smoke/ash-cloud.ogg", volume = 0.7},
      max_sounds_per_type = 1,
      audible_distance_modifier = 0.8,
      match_volume_to_activity = true
    }
  },
})

function make_demolisher(base_name, order, scale, damage_multiplier, health, regen, speed_multiplier, factoriopedia_simulation, sounds)
  data:extend({make_demolisher_head(base_name, order, scale, damage_multiplier, health, regen, speed_multiplier, factoriopedia_simulation, sounds)})
  data:extend(make_demolisher_segments(base_name, demolisher_segment_scales, scale, damage_multiplier, health, sounds))
  data:extend(make_demolisher_corpse(base_name, order, scale))
  data:extend(make_demolisher_effects(base_name, order, scale, damage_multiplier))
end

function make_leg(entity_name, scale, leg_thickness, movement_speed, graphics_definitions, sounds, extra)
  return util.merge{
  {
    type = "spider-leg",
    name = entity_name,
    hidden = true,
    localised_name = {"entity-name.leg"},
    collision_box = {{-0.05, -0.05}, {0.05, 0.05}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    collision_mask = {layers={player=true, train=true, is_object=true}}, -- object not player so can step in water
    -- legs breathe air so that poison works. alternatively, change torsos to collide with poison clouds.
    flags = {"not-repairable"},
    icon = graphics_definitions.icon,
    walking_sound_volume_modifier = sounds.walking_sound_volume_modifier,
    walking_sound_speed_modifier = sounds.walking_sound_speed_modifier,
    target_position_randomisation_distance = 0.25 * scale,
    minimal_step_size = 1 * scale,
    stretch_force_scalar = 1.5,
    initial_movement_speed = 0.06 * movement_speed,
    movement_acceleration = 0.03 * movement_speed,
    max_health = 100,
    base_position_selection_distance = 6 * scale,
    movement_based_position_selection_distance = 4 * scale,
    selectable_in_game = false,
    graphics_set = create_leg_graphics_set(scale * leg_thickness, graphics_definitions, leg_graphics_properties)
  }, extra }
end

function wriggler_spritesheet(name, frames, speed, scale, tint, flag)
  speed = speed or 1.0
  local is_shadow = string.sub(name, -string.len("-shadow")) == "-shadow"
  return util.sprite_load("__space-age__/graphics/entity/wriggler/wriggler-" .. name,
    {
      slice = 5,
      frame_count = frames,
      direction_count = 16,
      scale = 0.5 * 1.2 * scale,
      animation_speed = speed,
      draw_as_shadow = is_shadow,
      tint_as_overlay = tint and true or nil,
      tint = tint,
      flags = (not is_shadow) and { flag } or nil,
      surface = "gleba",
      usage = usage
    }
  )
end

function wriggler_corpse_spritesheet(name, frames, speed, scale, tint)
  return wriggler_spritesheet(name, frames, speed, scale, tint, "corpse-decay")
end

function make_stomper(prefix, scale, health, damage, speed, tints, factoriopedia_simulation, sounds)
  local tint_mask = tints.mask
  local tint_mask_thigh = tints.mask_thigh or tint_mask
  local tint_mask_head = tints.mask_head or tint_mask
  local tint_body = tints.body
  local tint_body_thigh = tints.body_thigh or tint_body
  local tint_body_head = tints.body_head or tint_body

  local stomper_scale = 1.1 * scale
  local stomper_head_size = 0.75
  local stomper_head_render_layer = "under-elevated"
  local stomper_leg_thickness = 2
  local stomper_leg_ground_position = {0, -7 * scale} -- foot natural position
  local stomper_leg_mount_position = {0, -1.1 * scale} -- hip
  local stomper_hip_flexibility = 0.75
  local stomper_knee_distance_factor = 0.55
  local stomper_knee_height = 0.5 -- tiles, in screen space, above the straight line between the leg's mount point and leg position
  local stomper_ankle_height = 0.65
  local stomper_leg_orientations = {0.10, 0.30, 0.50, 0.70, 0.90}
  local stomper_speed = speed
  local stomper_stomp_radius = 4.5 * scale
  local stomper_stomp_damage_multiplier = 3.5
  local stomper_parts_offset_upper = -0.25
  local stomper_parts_offset_lower = -0.33
  local stomper_resistances =
  {
    {
      type = "physical",
      decrease = 2,
      percent = 50
    },
    {
      type = "laser",
      percent = 80
    },
    {
      type = "impact",
      percent = 80
    }
  }

  local stomper_spit_tint1 = {0.3, 0.2, 0.06, 1}
  local stomper_spit_tint2= {0.7, 0.12, 0.45, 0.75}

  stream_tint_stomper = {0.6, 0.582, 0.517, 1}
  splash_tint_stomper = {0.6, 0.512, 0.592, 1}
  sticker_tint_stomper = {r = 0.314, g =  0.291, b =0.269, a = 0.745}
  data:extend(
  {
    acid_stream({
      name = prefix .. "acid-stream-stomper",
      scale = scale_spitter_behemoth * scale,
      tint = stream_tint_stomper,
      corpse_name = prefix .. "acid-splash-stomper",
      spit_radius = stream_radius_spitter_behemoth * scale,
      particle_spawn_interval = 1,
      particle_spawn_timeout = 6,
      splash_fire_name = prefix .. "acid-splash-fire-stomper",
      sticker_name = prefix .. "acid-sticker-stomper"
    }),
    acid_splash_fire({
      name = prefix .. "acid-splash-fire-stomper",
      scale = scale_spitter_behemoth * scale,
      tint = splash_tint_stomper,
      ground_patch_scale = scale_spitter_behemoth * ground_patch_scale_modifier * scale,
      patch_tint_multiplier = patch_opacity,
      splash_damage_per_tick = damage_splash_spitter_behemoth * damage,
      sticker_name = prefix .. "acid-sticker-stomper"
    }),
    acid_sticker({
      name = prefix .. "acid-sticker-stomper",
      tint = sticker_tint_stomper,
      slow_player_movement = 0.6,
      slow_vehicle_speed = 0.3,
      slow_vehicle_friction = 1.5,
      damage_interval = 10,
      damage_per_tick = 10,
      slow_seconds = 2
    })
  })

  local stomper_graphics_definitions =
  {
    icon = "__space-age__/graphics/icons/" .. prefix .. "stomper.png",
    body =
    {
      base_animation =
      {
        layers =
        {
          {
            filename = "__space-age__/graphics/entity/stomper/torso/stomper-body-bottom.png",
            width = 126,
            height = 106,
            line_length = 1,
            direction_count = 1,
            scale = 0.0 * stomper_scale,
            shift = util.by_pixel(0 * stomper_scale, 0 * stomper_scale),
            tint = tint_body,
            surface = "gleba",
            usage = "enemy"
          }
        }
      },
      shadow_base_animation =
      {
        filename = "__space-age__/graphics/entity/stomper/torso/stomper-body-bottom-shadow.png",
        width = 144,
        height = 96,
        line_length = 1,
        direction_count = 1,
        scale = 0.0 * stomper_scale,
        draw_as_shadow = true,
        shift = util.by_pixel(-1 * stomper_scale, -1 * stomper_scale),
        surface = "gleba",
        usage = "enemy"
      },
      animation =
      {
        layers =
        {
          util.sprite_load("__space-age__/graphics/entity/stomper/torso/head-main",
          {
            scale=0.5*stomper_head_size*stomper_scale,
            direction_count=64,
            --multiply_shift=0.0,
            shift = util.by_pixel( 0, -32.0),
            tint_as_overlay = true,
            tint = tint_body,
            surface = "gleba",
            usage = "enemy"
          }),
          util.sprite_load("__space-age__/graphics/entity/stomper/torso/head-mask",
          {
            scale=0.5*stomper_head_size*stomper_scale,
            direction_count=64,
            --multiply_shift=0.0,
            shift = util.by_pixel( 0, -32.0),
            tint_as_overlay = true,
            tint = tint_mask,
            surface = "gleba",
            usage = "enemy"
          }),
        }
      },
      shadow_animation =
      {
      layers =
        {
          util.sprite_load("__space-age__/graphics/entity/stomper/torso/head-shadow",
          {
            scale=0.5*stomper_head_size*stomper_scale,
            direction_count=64,
            --multiply_shift=0.0,
            shift = util.by_pixel( 0, -22.0),
            surface = "gleba",
            usage = "enemy"
          }),
        }
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__space-age__/graphics/entity/stomper/torso/stomper-body-water-reflection.png",
          width = 448,
          height = 448,
          variation_count = 1,
          scale = 0.5 * stomper_scale,
          shift = util.by_pixel(0 * stomper_scale, 0 * stomper_scale)
        }
      },
      render_layer = stomper_head_render_layer,
      base_render_layer = "higher-object-above",
    },
    leg_lower_part =
    {
      layers = stomper_leg_part_template_layers,

      graphics_properties =
      {
        middle_offset_from_top = stomper_parts_offset_upper, -- offset length in tiles (= px / 32)
        middle_offset_from_bottom = stomper_parts_offset_upper,
        top_end_offset = 0,
        bottom_end_offset = -0.5,
        -- if sum of top_end_length and bottom_end_length is greater than length of leg segment, sprites will start to get squashed
        top_end_length = 0.3,
        bottom_end_length = 0.1
      },

      top_end =
      util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-shin-knee",
      {
        scale=0.0,
        direction_count=16,
        multiply_shift=0,
        tint_as_overlay = true,
        tint = tint_body,
        surface = "gleba",
        usage = "enemy"
      }),

      middle =
      util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-shin",
      {
        scale=0.25,
        direction_count=32,
        multiply_shift=0,
        tint_as_overlay = true,
        tint = tint_body,
        surface = "gleba",
        usage = "enemy"
      }),

      middle_shadow =
      util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-shin-shadow",
      {
        scale=0.25,
        direction_count=32,
        multiply_shift=0,
        surface = "gleba",
        usage = "enemy"
      }),

      middle_tint =
      util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-shin-mask",
      {
        scale=0.25,
        direction_count=32,
        multiply_shift=0,
        tint_as_overlay=true,
        tint = tint_mask,
        surface = "gleba",
        usage = "enemy"
      }),

      bottom_end =
      util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-shin-foot",
      {
        scale=0.25,
        direction_count=32,
        multiply_shift=0,
        tint_as_overlay = true,
        tint = tint_body,
        surface = "gleba",
        usage = "enemy"
      }),
      bottom_end_tint =
      util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-shin-foot-mask",
      {
        scale=0.25,
        direction_count=32,
        multiply_shift=0,
        tint_as_overlay = true,
        tint = tint_mask,
        surface = "gleba",
        usage = "enemy"
      }),

      reflection_top_end =
      {
        filename = "__space-age__/graphics/entity/stomper/legs/stomper-legs-lower-end-A-water-reflection.png",
        width = 56,
        height = 110,
        line_length = 1,
        direction_count = 1,
        scale = 0.0,
        shift = util.by_pixel(1 * 0.5, 34 * 0.5),
        surface = "gleba",
        usage = "enemy"
      },

      reflection_middle =
      {
        filename = "__space-age__/graphics/entity/stomper/legs/stomper-legs-lower-stretchable-water-reflection.png",
        width = 144,
        height = 384,
        line_length = 1,
        direction_count = 1,
        scale = 0.25,
        shift = util.by_pixel(1 * 0.5, 0),
        surface = "gleba",
        usage = "enemy"
      },

      reflection_bottom_end =
      {
        filename = "__space-age__/graphics/entity/stomper/legs/stomper-legs-lower-end-B-water-reflection.png",
        width = 52,
        height = 104,
        line_length = 1,
        direction_count = 1,
        scale = 0.0,
        shift = util.by_pixel(0, -38 * 0.5),
        surface = "gleba",
        usage = "enemy"
      }
    },
    leg_upper_part =
    {
      layers = stomper_leg_part_template_layers,

      graphics_properties =
      {
        middle_offset_from_top = stomper_parts_offset_lower, -- offset length in tiles (= px / 32)
        middle_offset_from_bottom = stomper_parts_offset_lower,
        top_end_offset = -0.5,
        bottom_end_offset = 0,
        -- if sum of top_end_length and bottom_end_length is greater than length of leg segment, sprites will start to get squashed
        top_end_length = 0.4,
        bottom_end_length = 0.1
      },

      top_end =
      util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-thigh-body",
      {
        scale=0.25,
        direction_count=32,
        multiply_shift=0,
        tint_as_overlay = true,
        tint = tint_body_thigh,
        surface = "gleba",
        usage = "enemy"
      }),
      top_end_shadow =
      util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-thigh-body-shadow",
      {
        scale=0.0,
        direction_count=32,
        multiply_shift=0,
        surface = "gleba",
        usage = "enemy"
      }),
      top_end_tint =
      util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-thigh-body-mask",
      {
        scale=0.0,
        direction_count=32,
        multiply_shift=0,
        tint_as_overlay = true,
        tint = tint_mask_thigh,
        surface = "gleba",
        usage = "enemy"
      }),

      middle =
      util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-thigh",
      {
        scale=0.25,
        direction_count=32,
        multiply_shift=0,
        tint_as_overlay = true,
        tint = tint_body_thigh,
        surface = "gleba",
        usage = "enemy"
      }),

      middle_shadow =
      util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-thigh-shadow",
      {
        scale=0.25,
        direction_count=32,
        multiply_shift=0,
        surface = "gleba",
        usage = "enemy"
      }),

      middle_tint =
      util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-thigh-mask",
      {
        scale=0.25,
        direction_count=32,
        multiply_shift=0,
        tint_as_overlay = true,
        tint = tint_mask_thigh,
        surface = "gleba",
        usage = "enemy"
      }),

      bottom_end =
      util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-thigh-knee",
      {
        scale=0.0,
        direction_count=16,
        multiply_shift=0,
        tint_as_overlay = true,
        tint = tint_body,
        surface = "gleba",
        usage = "enemy"
      }),

      reflection_top_end =
      {
        filename = "__space-age__/graphics/entity/stomper/legs/stomper-legs-upper-end-A-water-reflection.png",
        width = 64,
        height = 96,
        line_length = 1,
        direction_count = 1,
        scale = 0.0,
        shift = util.by_pixel(1 * 0.5, 31 * 0.5),
        surface = "gleba",
        usage = "enemy"
      },

      reflection_middle =
      {
        filename = "__space-age__/graphics/entity/stomper/legs/stomper-legs-upper-stretchable-water-reflection.png",
        width = 146,
        height = 359,
        line_length = 1,
        direction_count = 1,
        scale = 0.25,
        shift = util.by_pixel(-4 * 0.5, 0),
        surface = "gleba",
        usage = "enemy"
      },

      reflection_bottom_end =
      {
        filename = "__space-age__/graphics/entity/stomper/legs/stomper-legs-upper-end-B-water-reflection.png",
        width = 56,
        height = 74,
        line_length = 1,
        direction_count = 1,
        scale = 0.0,
        shift = util.by_pixel(1 * 0.5, -14 * 0.5),
        surface = "gleba",
        usage = "enemy"
      }
    },

    joint_render_layer = stomper_head_render_layer,
-- these have some nuts function for a defenition which makes it very hard to add extra layers or change the rendering behaviour - I will leave as is for now
    leg_joint =
    util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-knee",
    {
      scale=0.25,
      direction_count=32,
      multiply_shift=0,
      tint_as_overlay = true,
      tint = tint_body,
      surface = "gleba",
      usage = "enemy"
    }),
    leg_joint_tint =
    util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-knee-mask",
    {
      scale=0.25,
      direction_count=32,
      multiply_shift=0,
      tint_as_overlay = true,
      tint = tint_mask,
      surface = "gleba",
      usage = "enemy"
    }),
    leg_joint_shadow =
    util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-knee",
    {
      scale=0.25,
      direction_count=32,
      multiply_shift=0,
      surface = "gleba",
      usage = "enemy"
    }),

    foot =
    util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-foot",
    {
      scale=0.25,
      direction_count=32,
      multiply_shift=0,
      --shift = util.by_pixel(0, 4),
      tint_as_overlay = true,
      tint = tint_body,
      surface = "gleba",
      usage = "enemy"
    }),
    foot_tint =
    util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-foot-mask",
    {
      scale=0.25,
      direction_count=32,
      multiply_shift=0,
      --shift = util.by_pixel(0, 4),
      tint_as_overlay = true,
      tint = tint_mask,
      surface = "gleba",
      usage = "enemy"
    }),
    foot_shadow =
    util.sprite_load("__space-age__/graphics/entity/stomper/legs/leg-foot-shadow",
    {
      scale=0.25,
      direction_count=32,
      multiply_shift=0,
      surface = "gleba",
      usage = "enemy"
    })
  }

  data:extend{
    {
      type = "spider-unit",
      name = prefix .. "stomper-pentapod",
      icon = stomper_graphics_definitions.icon,
      collision_box = {{-1.5 * scale, -1.5 * scale}, {1.5 * scale, 1.5 * scale}},
      sticker_box = {{-1.5 * scale, -1.5 * scale}, {1.5 * scale, 1.5 * scale}},
      selection_box = {{-2.5 * scale, -2.5 * scale}, {2.5 * scale, 2.5 * scale}},
      drawing_box_vertical_extension = 3,
      torso_bob_speed = 0.15,
      flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
      max_health = health,
      factoriopedia_simulation = factoriopedia_simulation,
      order = "gleba-c-stomper-"..tostring(scale),
      subgroup = "enemies",
      impact_category = "organic",
      resistances = util.table.deepcopy(stomper_resistances),
      healing_per_tick = health/500/60,
      distraction_cooldown = 300,
      min_pursue_time = 10 * 60,
      --max_pursue_time = 60 * 60,
      max_pursue_distance = 50,
      attack_parameters = spitter_behemoth_attack_parameters(
      {
        acid_stream_name = prefix .. "acid-stream-stomper",
        range = 6.5 * scale, -- similar to leg reach for stomp + radius
        min_attack_distance = 4 * scale,
        cooldown = 60,
        cooldown_deviation = 0.15,
        damage_modifier = damage,
        scale = scale_spitter_behemoth,
        tint1 = tint_body,
        tint2 = tint_mask,
        roarvolume = 0.8,
        range_mode = "bounding-box-to-bounding-box"
      }),
      vision_distance = 30,
      ai_settings = util.merge(
      {
        gleba_ai_settings,
        {
          strafe_settings =
          {
            max_distance = math.abs(stomper_leg_ground_position[2]) + 3,
            ideal_distance = math.abs(stomper_leg_ground_position[2]),
            ideal_distance_tolerance = 1,
            ideal_distance_variance = 1,
            ideal_distance_importance = 0.5,
            ideal_distance_importance_variance = 0.1,
            face_target = true
          }
        }
      }),
      absorptions_to_join_attack = { spores = 25 },
      corpse = prefix .. "stomper-corpse",
      dying_explosion = prefix .. "stomper-pentapod-die",
      dying_trigger_effect =
      {
        {
          type = "create-entity",
          check_buildability = true,
          entity_name = prefix .. "stomper-shell",
          offsets = {{0, -0.94}}
        },
        {
          type = "create-entity",
          entity_name = prefix .. "wriggler-pentapod-premature",
          find_non_colliding_position = true,
          offsets =
          {
            util.rotate_position({0,1}, 0.1),
            util.rotate_position({0,1}, 0.3),
            util.rotate_position({0,1}, 0.5),
            util.rotate_position({0,1}, 0.7),
            util.rotate_position({0,1}, 0.9),
            --[[util.rotate_position({0,2}, 0.0),
            util.rotate_position({0,2}, 0.05),
            util.rotate_position({0,2}, 0.1),
            util.rotate_position({0,2}, 0.15),
            util.rotate_position({0,2}, 0.2),
            util.rotate_position({0,2}, 0.25),
            util.rotate_position({0,2}, 0.3),
            util.rotate_position({0,2}, 0.35),
            util.rotate_position({0,2}, 0.4),
            util.rotate_position({0,2}, 0.45),
            util.rotate_position({0,2}, 0.5),
            util.rotate_position({0,2}, 0.55),
            util.rotate_position({0,2}, 0.6),
            util.rotate_position({0,2}, 0.65),
            util.rotate_position({0,2}, 0.7),
            util.rotate_position({0,2}, 0.75),
            util.rotate_position({0,2}, 0.8),
            util.rotate_position({0,2}, 0.85),
            util.rotate_position({0,2}, 0.9),
            util.rotate_position({0,2}, 0.95),]]
          }
        },
      },
      dying_sound = sounds.dying_sound,
      damaged_trigger_effect = gleba_hit_effects(),
      is_military_target = true,
      working_sound = sounds.working_sound,
      warcry = sounds.warcry,
      height = 0.7,
      torso_rotation_speed = 0.01,
      graphics_set = stomper_graphics_definitions.body,
      spider_engine =
      {
        walking_group_overlap = 0.6,
        legs =
        {
          {
            leg = prefix .. "stomper-pentapod-leg",
            mount_position = util.rotate_position(stomper_leg_mount_position, stomper_leg_orientations[1]),
            ground_position = util.rotate_position(stomper_leg_ground_position, stomper_leg_orientations[1]),
            walking_group = 1,
            leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
            leg_hit_the_ground_when_attacking_trigger = get_leg_hit_the_ground_when_attacking_trigger(stomper_stomp_radius, stomper_stomp_damage_multiplier * damage, sounds.stomp),
          },
          {
            leg = prefix .. "stomper-pentapod-leg",
            mount_position = util.rotate_position(stomper_leg_mount_position, stomper_leg_orientations[2]),
            ground_position = util.rotate_position(stomper_leg_ground_position, stomper_leg_orientations[2]),
            walking_group = 3,
            leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
            leg_hit_the_ground_when_attacking_trigger = get_leg_hit_the_ground_when_attacking_trigger(stomper_stomp_radius, stomper_stomp_damage_multiplier * damage, sounds.stomp),
          },
          {
            leg = prefix .. "stomper-pentapod-leg",
            mount_position = util.rotate_position(stomper_leg_mount_position, stomper_leg_orientations[3]),
            ground_position = util.rotate_position(stomper_leg_ground_position, stomper_leg_orientations[3]),
            walking_group = 5,
            leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
            leg_hit_the_ground_when_attacking_trigger = get_leg_hit_the_ground_when_attacking_trigger(stomper_stomp_radius, stomper_stomp_damage_multiplier * damage, sounds.stomp),
          },
          {
            leg = prefix .. "stomper-pentapod-leg",
            mount_position = util.rotate_position(stomper_leg_mount_position, stomper_leg_orientations[4]),
            ground_position = util.rotate_position(stomper_leg_ground_position, stomper_leg_orientations[4]),
            walking_group = 2,
            leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
            leg_hit_the_ground_when_attacking_trigger = get_leg_hit_the_ground_when_attacking_trigger(stomper_stomp_radius, stomper_stomp_damage_multiplier * damage, sounds.stomp),
          },
          {
            leg = prefix .. "stomper-pentapod-leg",
            mount_position = util.rotate_position(stomper_leg_mount_position, stomper_leg_orientations[5]),
            ground_position = util.rotate_position(stomper_leg_ground_position, stomper_leg_orientations[5]),
            walking_group = 4,
            leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
            leg_hit_the_ground_when_attacking_trigger = get_leg_hit_the_ground_when_attacking_trigger(stomper_stomp_radius, stomper_stomp_damage_multiplier * damage, sounds.stomp),
          },
        },
      }
    },
    {
      type = "corpse",
      name = prefix .. "stomper-corpse",
      icon = stomper_graphics_definitions.icon,
      flags = {"placeable-neutral", "not-on-map"},
      hidden_in_factoriopedia = true,
      subgroup = "corpses",
      final_render_layer = "corpse",
      --animation_render_layer = "entity",
      order = "a-l-a",
      selection_box = {{-3, -3}, {3, 3}},
      collision_box = {{-2, -2}, {2, 2}},
      tile_width = 3,
      tile_height = 3,
      selectable_in_game = false,
      time_before_removed = 60 * 60 * 1, -- 3 minutes
      remove_on_tile_placement = true,
      decay_frame_transition_duration = 50,
      use_decay_layer = true,
    animation = {
      layers = {
        util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-1",
        {
          frame_count = 1,
          scale = 0.4 * stomper_scale,
          shift = util.by_pixel(0, 0),
          direction_count = 1,
          surface = "gleba",
          usage = "enemy"
        }
      ),
      util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-1-mask",
      {
        frame_count = 1,
        scale = 0.4 * stomper_scale,
        shift = util.by_pixel(0, 0),
        direction_count = 1,
        tint = tint_mask,
        tint_as_overlay = true,
        surface = "gleba",
        usage = "enemy"
      }),
      },
      layers = {
        util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-2",
        {
          frame_count = 1,
          scale = 0.4 * stomper_scale,
          shift = util.by_pixel(0, 0),
          direction_count = 1,
          surface = "gleba",
          usage = "enemy"
        }
      ),
      util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-2-mask",
      {
        frame_count = 1,
        scale = 0.4 * stomper_scale,
        shift = util.by_pixel(0, 0),
        direction_count = 1,
        tint = tint_mask,
        tint_as_overlay = true,
        surface = "gleba",
        usage = "enemy"
      }),
      },
      layers = {
        util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-3",
        {
          frame_count = 1,
          scale = 0.4 * stomper_scale,
          shift = util.by_pixel(0, 0),
          direction_count = 1,
          surface = "gleba",
          usage = "enemy"
        }
      ),
      util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-3-mask",
      {
        frame_count = 1,
        scale = 0.4 * stomper_scale,
        shift = util.by_pixel(0, 0),
        direction_count = 1,
        tint = tint_mask,
        tint_as_overlay = true,
        surface = "gleba",
        usage = "enemy"
      }),
      }
    },
      decay_animation ={
        layers ={
          util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-1",
          {
            frame_count = 16,
                        scale = 0.4 * stomper_scale,
            shift = util.by_pixel(0, 0),
            direction_count = 1,
            flags = {"corpse-decay"},
            surface = "gleba",
            usage = "corpse-decay"
          }),
          util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-1-mask",
          {
            frame_count = 16,
                        scale = 0.4 * stomper_scale,
            shift = util.by_pixel(0, 0),
            direction_count = 1,
            tint = tint_mask,
            tint_as_overlay = true,
            flags = {"corpse-decay"},
            surface = "gleba",
            usage = "corpse-decay"
          }),
        },
        layers ={
          util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-2",
          {
            frame_count = 16,
                        scale = 0.4 * stomper_scale,
            shift = util.by_pixel(0, 0),
            direction_count = 1,
            flags = {"corpse-decay"},
            surface = "gleba",
            usage = "corpse-decay"
          }),
          util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-2-mask",
          {
            frame_count = 16,
                        scale = 0.4 * stomper_scale,
            shift = util.by_pixel(0, 0),
            direction_count = 1,
            tint = tint_mask,
            tint_as_overlay = true,
            flags = {"corpse-decay"},
            surface = "gleba",
            usage = "corpse-decay"
          }),
        },
        layers ={
          util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-3",
          {
            frame_count = 16,
                        scale = 0.4 * stomper_scale,
            shift = util.by_pixel(0, 0),
            direction_count = 1,
            flags = {"corpse-decay"},
            surface = "gleba",
            usage = "corpse-decay"
          }),
          util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-3-mask",
          {
            frame_count = 16,
                        scale = 0.4 * stomper_scale,
            shift = util.by_pixel(0, 0),
            direction_count = 1,
            tint = tint_mask,
            tint_as_overlay = true,
            flags = {"corpse-decay"},
            surface = "gleba",
            usage = "corpse-decay"
          }),
        }

      }
    },
    {
      type = "simple-entity",
      name = prefix .. "stomper-shell",
      flags = {"placeable-neutral", "placeable-off-grid"},
      icon = stomper_graphics_definitions.icon,
      subgroup = "grass",
      order = "b[decorative]-l[rock]-f[big-volcanic-rock]",
      collision_mask = {layers = {item=true, object=true, player=true, is_object=true, is_lower_object=true, ghost=true}},
      collision_box = {{-1.8 * stomper_scale, -1.45 * stomper_scale}, {1.8 * stomper_scale, 1.45 * stomper_scale}},
      selection_box = {{-1.85 * stomper_scale, -1.5 * stomper_scale}, {1.85 * stomper_scale, 1.5 * stomper_scale}},
      damaged_trigger_effect = hit_effects.rock(),
      render_layer = "object",
      max_health = health/10,
      resistances =
      {
        {
          type = "poison",
          percent = 100
        },
        {
          type = "fire",
          percent = 100
        }
      },
      created_effect =
      { -- If the shell is created then the original corpse gets removed by entity creation. Put it back.
        type = "direct",
        action_delivery = {
          type = "instant",
          source_effects = {
            {
              type = "create-entity",
              check_buildability = false,
              entity_name = prefix .. "stomper-corpse",
              offsets = {{0, 0}}
            }
          }
        }
      },
      minable =
      {
        mining_particle = "stone-particle",
        mining_time = 2,
        results =
        {
          {type = "item", name = "stone", amount_min = 1, amount_max = 10},
          {type = "item", name = "spoilage", amount_min = 1, amount_max = 10},
          {type = "item", name = "pentapod-egg", amount_min = 0, amount_max = 1, percent_spoiled = 0.5},
        }
      },
      map_color = {129, 105, 78},
      count_as_rock_for_filtered_deconstruction = true,
      mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
      impact_category = "stone",
      pictures =
      {
        {
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-head",
            {
              scale = 0.5 * stomper_scale,
              shift = util.by_pixel(0,0),
              surface = "gleba",
              usage = "enemy"
            }),
            util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-head-mask",
            {
              scale = 0.5 * stomper_scale,
              shift = util.by_pixel(0,0),
              tint = tint_mask,
              tint_as_overlay = true,
              surface = "gleba",
              usage = "enemy"
            })
          }
        },
        {
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-head",
            {
              scale = 0.5 * stomper_scale,
              shift = util.by_pixel(0,0),
              y = 332,
              surface = "gleba",
              usage = "enemy"
            }),
            util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-head-mask",
            {
              scale = 0.5 * stomper_scale,
              shift = util.by_pixel(0,0),
              tint = tint_mask,
              tint_as_overlay = true,
              y = 330,
              surface = "gleba",
              usage = "enemy"
            })
          }
        },
        {
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-head",
            {
              scale = 0.5 * stomper_scale,
              shift = util.by_pixel(0,0),
              y = 332 * 2,
              surface = "gleba",
              usage = "enemy"
            }),
            util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-head-mask",
            {
              scale = 0.5 * stomper_scale,
              shift = util.by_pixel(0,0),
              tint = tint_mask,
              tint_as_overlay = true,
              y = 330 * 2,
              surface = "gleba",
              usage = "enemy"
            })
          }
        },
        {
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-head",
            {
              scale = 0.5 * stomper_scale,
              shift = util.by_pixel(0,0),
              y = 332 * 3,
              surface = "gleba",
              usage = "enemy"
            }),
            util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-head-mask",
            {
              scale = 0.5 * stomper_scale,
              shift = util.by_pixel(0,0),
              tint = tint_mask,
              tint_as_overlay = true,
              y = 330 * 3,
              surface = "gleba",
              usage = "enemy"
            })
          }
        },
      }
    },
    make_leg(prefix .. "stomper-pentapod-leg", stomper_scale, stomper_leg_thickness, stomper_speed, stomper_graphics_definitions, sounds,
    {
      hip_flexibility = stomper_hip_flexibility,
      knee_height = stomper_knee_height, -- distance from torso, as multiplier of leg length
      knee_distance_factor = stomper_knee_distance_factor, -- tiles, in screen space, above the ground that the knee naturally rests at
      ankle_height = stomper_ankle_height, -- tiles, in screen space, above the ground, the point at which the leg connects to the foot
      upper_leg_dying_trigger_effects = make_pentapod_leg_dying_trigger_effects(prefix .. "stomper-pentapod-leg-die", pentapod_upper_leg_dying_trigger_effect_positions),
      lower_leg_dying_trigger_effects = make_pentapod_leg_dying_trigger_effects(prefix .. "stomper-pentapod-leg-die", pentapod_lower_leg_dying_trigger_effect_positions),
      resistances = util.table.deepcopy(stomper_resistances)
    }),
    make_particle
    {
      name = prefix .. "stomper-skin-particle-extra-small",
      life_time = 200,
      pictures = particle_animations.get_pentpod_skin_particles_small({ tint = lerp_color(tint_mask, {255,255,255,255}, 0.7) }),
      shadows = particle_animations.get_pentpod_skin_particles_small({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
      ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
      render_layer_when_on_ground = "lower-object-above-shadow"
    },
    make_particle
    {
      name = prefix .. "stomper-skin-particle-small",
      life_time = 250,
      pictures = particle_animations.get_pentpod_skin_particles_small({ scale = 1 * stomper_scale, tint = lerp_color(tint_mask, {255,255,255,255}, 0.7) }),
      shadows = particle_animations.get_pentpod_skin_particles_small({ scale = 1 * stomper_scale, tint = shadowtint(), shift = util.by_pixel (1,0)}),
      ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
      render_layer_when_on_ground = "lower-object-above-shadow"
    },
    make_particle
    {
      name = prefix .. "stomper-skin-particle-medium",
      life_time = 230,
      pictures = particle_animations.get_pentpod_skin_particles_medium({ scale = 1 * stomper_scale, tint = lerp_color(tint_mask, {255,255,255,255}, 0.7)}),
      shadows = particle_animations.get_pentpod_skin_particles_medium({ scale = 1 * stomper_scale, tint = shadowtint(), shift = util.by_pixel (1,0)}),
      ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
      render_layer_when_on_ground = "lower-object-above-shadow"
    },
    make_particle
    {
      name = prefix .. "stomper-skin-particle-big",
      life_time = 200,
      pictures = particle_animations.get_pentpod_skin_particles_big({ scale = 1.2 * stomper_scale, tint = lerp_color(tint_mask, {255,255,255,255}, 0.7)}),
      shadows = particle_animations.get_pentpod_skin_particles_big({ scale = 1.2 * stomper_scale, tint = shadowtint(), shift = util.by_pixel (1,0)}),
      ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
      render_layer_when_on_ground = "lower-object-above-shadow"
    },
    make_particle
    {
      name = prefix .. "stomper-shell-particle-small",
      life_time = 200,
      pictures = particle_animations.get_pentpod_shell_particles_small({ tint = lerp_color(tint_mask, {255,255,255,255}, 0.9)}),
      shadows = particle_animations.get_pentpod_shell_particles_small({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
      ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
      render_layer_when_on_ground = "lower-object-above-shadow"
    },
    make_particle
    {
      name = prefix .. "stomper-shell-particle-medium",
      life_time = 200,
      pictures = particle_animations.get_pentpod_shell_particles_small({ scale = 1 * stomper_scale, tint = lerp_color(tint_mask, {255,255,255,255}, 0.9)}),
      shadows = particle_animations.get_pentpod_shell_particles_small({ scale = 1 * stomper_scale, tint = shadowtint(), shift = util.by_pixel (1,0)}),
      ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
      render_layer_when_on_ground = "lower-object-above-shadow"
    },
    make_particle
    {
      name = prefix .. "stomper-shell-particle-big",
      life_time = 200,
      pictures = particle_animations.get_pentpod_shell_particles_big({ scale = 1 * stomper_scale, tint = lerp_color(tint_mask, {255,255,255,255}, 0.9)}),
      shadows = particle_animations.get_pentpod_shell_particles_big({ scale = 1 * stomper_scale, tint = shadowtint(), shift = util.by_pixel (1,0)}),
      ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
      render_layer_when_on_ground = "lower-object-above-shadow"
    },
    {
      type = "explosion",
      name = prefix.."stomper-pentapod-die",
      created_effect = {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-trivial-smoke",
              repeat_count = 12,
              smoke_name = "stomper-steamy-gas",
              offset_deviation = { { -1.4, -1.4 }, { 1.4, 1.4 } },
              initial_height = 0.8,
              speed_from_center = 0.03,
              speed_from_center_deviation = 0.04
            },
            {
              type = "create-particle",
              repeat_count = 22,
              repeat_count_deviation = 3,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = "gleba-blood-particle-small",
              offsets =
              {
                { 0, -0.4 },
                { 0, 0.5 },
                { 0, 0.6 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 0.5,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.1,
              initial_vertical_speed_deviation = 0.1,
              speed_from_center = 0.15,
              speed_from_center_deviation = 0.15,
              frame_speed = 1,
              frame_speed_deviation = 0,
              tail_length = 52,
              tail_length_deviation = 25,
              tail_width = 3,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 5,
              repeat_count_deviation = 0,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = "pentapod-entrails-particle-medium",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 0.5,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.07,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.07,
              speed_from_center_deviation = 0,
              frame_speed = 0.5,
              frame_speed_deviation = 0,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 6,
              repeat_count_deviation = 0,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = "pentapod-entrails-particle-big",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 0.5,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.07,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.07,
              speed_from_center_deviation = 0,
              frame_speed = 0.5,
              frame_speed_deviation = 0,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 10,
              repeat_count_deviation = 1,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "stomper-skin-particle-extra-small",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 1.2,
              initial_height_deviation = 0,
              initial_vertical_speed = 0.01,
              initial_vertical_speed_deviation = 0.01,
              speed_from_center = 0.07,
              speed_from_center_deviation = 0.1,
              frame_speed = 1,
              frame_speed_deviation = 0.2,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 6,
              repeat_count_deviation = 1,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "stomper-skin-particle-small",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 1.3,
              initial_height_deviation = 0,
              initial_vertical_speed = 0.01,
              initial_vertical_speed_deviation = 0.01,
              speed_from_center = 0.07,
              speed_from_center_deviation = 0,
              frame_speed = 0.5,
              frame_speed_deviation = 0.2,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 4,
              repeat_count_deviation = 0,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "stomper-skin-particle-medium",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 1.4,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.078,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.07,
              speed_from_center_deviation = 0.1,
              frame_speed = 0.5,
              frame_speed_deviation = 0.2,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 3,
              repeat_count_deviation = 0,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "stomper-skin-particle-big",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 1.5,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.078,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.07,
              speed_from_center_deviation = 0.1,
              frame_speed = 1,
              frame_speed_deviation = 0.1,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 15,
              repeat_count_deviation = 1,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "stomper-shell-particle-small",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.6, -0.6 }, { 0.6, 0.6 } },
              initial_height = 1.6,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.078,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.06,
              speed_from_center_deviation = 0.2,
              frame_speed = 1,
              frame_speed_deviation = 0.2,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 12,
              repeat_count_deviation = 0,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "stomper-shell-particle-medium",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 1.5,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.078,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.07,
              speed_from_center_deviation = 0,
              frame_speed = 0.5,
              frame_speed_deviation = 0.2,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 6,
              repeat_count_deviation = 0,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "stomper-shell-particle-big",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.2, -0.2 }, { 0.2, 0.2 } },
              initial_height = 1.5,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.07,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.05,
              speed_from_center_deviation = 0.1,
              frame_speed = 0.5,
              frame_speed_deviation = 0.2,
              rotate_offsets = false
            },
            {
              type = "play-sound",
              sound = base_sounds.behemoth_gore
            }
          }
        }
      },
      icon = "__base__/graphics/icons/biter-spawner-corpse.png",
      order = "a[corpse]-b[biter-spawner]",
      flags = {"not-on-map"},
      hidden = true,
      subgroup = "enemy-death-explosions",
      animations = util.empty_sprite(),
    },
    {
      type = "explosion",
      name = prefix.."stomper-pentapod-leg-die",
      created_effect = {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-particle",
              repeat_count = 4,
              repeat_count_deviation = 3,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = "gleba-blood-particle-small",
              offsets =
              {
                { 0, -0.4 },
                { 0, 0.5 },
                { 0, 0.6 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 0.5,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.02,
              initial_vertical_speed_deviation = 0.015,
              speed_from_center = 0.05,
              speed_from_center_deviation = 0.05,
              frame_speed = 1,
              frame_speed_deviation = 0,
              tail_length = 52,
              tail_length_deviation = 25,
              tail_width = 3,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 8,
              repeat_count_deviation = 1,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "stomper-skin-particle-extra-small",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 0.5,
              initial_height_deviation = 0,
              initial_vertical_speed = 0.01,
              initial_vertical_speed_deviation = 0.01,
              speed_from_center = 0.02,
              speed_from_center_deviation = 0.01,
              frame_speed = 0.5,
              frame_speed_deviation = 0.2,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 5,
              repeat_count_deviation = 1,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "stomper-skin-particle-small",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 0.5,
              initial_height_deviation = 0,
              initial_vertical_speed = 0.01,
              initial_vertical_speed_deviation = 0.01,
              speed_from_center = 0.02,
              speed_from_center_deviation = 0.01,
              frame_speed = 0.5,
              frame_speed_deviation = 0.2,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 2,
              repeat_count_deviation = 1,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "stomper-skin-particle-medium",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 0.5,
              initial_height_deviation = 0,
              initial_vertical_speed = 0.01,
              initial_vertical_speed_deviation = 0.01,
              speed_from_center = 0.01,
              speed_from_center_deviation = 0.01,
              frame_speed = 0.5,
              frame_speed_deviation = 0.2,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 1,
              repeat_count_deviation = 1,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "stomper-skin-particle-big",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 0.5,
              initial_height_deviation = 0,
              initial_vertical_speed = 0.01,
              initial_vertical_speed_deviation = 0.01,
              speed_from_center = 0.01,
              speed_from_center_deviation = 0.01,
              frame_speed = 0.5,
              frame_speed_deviation = 0.2,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 2,
              repeat_count_deviation = 1,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "stomper-shell-particle-small",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 0.5,
              initial_height_deviation = 0,
              initial_vertical_speed = 0.01,
              initial_vertical_speed_deviation = 0.01,
              speed_from_center = 0.01,
              speed_from_center_deviation = 0.01,
              frame_speed = 1,
              frame_speed_deviation = 0.2,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 1,
              repeat_count_deviation = 1,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "stomper-shell-particle-medium",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 0.5,
              initial_height_deviation = 0,
              initial_vertical_speed = 0.01,
              initial_vertical_speed_deviation = 0.01,
              speed_from_center = 0.01,
              speed_from_center_deviation = 0.01,
              frame_speed = 1,
              frame_speed_deviation = 0.2,
              rotate_offsets = false
            }
          }
        }
      },
      icon = "__base__/graphics/icons/biter-spawner-corpse.png",
      order = "a[corpse]-b[biter-spawner]",
      flags = {"not-on-map"},
      hidden = true,
      subgroup = "enemy-death-explosions",
      animations = util.empty_sprite(),
    }
  }
end

function make_strafer(prefix, scale, health, damage, speed, ideal_strafe_distance, max_range, max_strafe_distance, tints, factoriopedia_simulation, sounds)
  local tint_mask = tints.mask
  local tint_mask_thigh = tints.mask_thigh or tint_mask
  local tint_body = tints.body
  local tint_body_thigh = tints.body_thigh or tint_body
  local tint_projectile = tints.projectile
  local tint_projectile_mask = tints.projectile_mask

  local strafer_scale = 1 * scale
  local strafer_head_size = 0.6
  local strafer_leg_thickness = 0.8
  local strafer_leg_ground_position = {0, -5 * scale}
  local strafer_leg_mount_position = {0, -0.25 * scale}
  local strafer_hip_flexibility = 1
  local strafer_knee_distance_factor = 0.5
  local strafer_knee_height = 1
  local strafer_ankle_height = 0
  local strafer_leg_orientations = {0.15, 0.35, 0.55, 0.75, 0.95}
  local strafer_speed = speed
  local strafer_resistances =
  {
    {
      type = "physical",
      decrease = 2,
      percent = 10
    },
    {
      type = "laser",
      percent = 50
    }
  }

  local strafer_graphics_definitions =
  {
    icon = "__space-age__/graphics/icons/".. prefix .."strafer.png",
    body =
    {
      base_animation =
      {
        layers =
        {
          util.sprite_load("__space-age__/graphics/entity/strafer/torso/torso-main",
          {
            scale=0.5*strafer_head_size*strafer_scale,
            direction_count=64,
            multiply_shift=0.0,
            shift = util.by_pixel( 0, -0.0),
            tint_as_overlay = true,
            tint = tint_body,
            surface = "gleba",
            usage = "enemy"
          }),
          util.sprite_load("__space-age__/graphics/entity/strafer/torso/torso-main",
          {
            scale=0.5*strafer_head_size*strafer_scale*0.5,
            direction_count=64,
            multiply_shift=0.0,
            shift = util.by_pixel( 0, -0.0),
            tint_as_overlay = true,
            tint = tint_mask,
            surface = "gleba",
            usage = "enemy"
          }),
        }
      },
      shadow_base_animation =
      {
        filename = "__space-age__/graphics/entity/strafer/torso/strafer-body-bottom-shadow.png",
        width = 144,
        height = 96,
        line_length = 1,
        direction_count = 1,
        scale = 0.5 * strafer_scale,
        draw_as_shadow = true,
        shift = util.by_pixel(-1 * strafer_scale, -1 * strafer_scale),
        surface = "gleba",
        usage = "enemy"
      },
      animation =
      {
        layers =
        {
          util.sprite_load("__space-age__/graphics/entity/strafer/torso/head-main",
          {
            scale=0.5*strafer_head_size*strafer_scale,
            direction_count=64,
            --multiply_shift=0.0,
            shift = util.by_pixel( 0, -22.0),
            tint_as_overlay = true,
            tint = tint_body,
            surface = "gleba",
            usage = "enemy"
          }),
          util.sprite_load("__space-age__/graphics/entity/strafer/torso/head-main-mask",
          {
            scale=0.5*strafer_head_size*strafer_scale,
            direction_count=64,
            --multiply_shift=0.0,
            shift = util.by_pixel( 0, -22.0),
            tint_as_overlay = true,
            tint = tint_mask,
            surface = "gleba",
            usage = "enemy"
          }),
        }
      },
      shadow_animation =
      {
        filename = "__space-age__/graphics/entity/strafer/torso/strafer-body-shadow.png",
        width = 192,
        height = 94,
        line_length = 8,
        direction_count = 64,
        scale = 0.5 * strafer_scale,
        draw_as_shadow = true,
        shift = util.by_pixel(26 * strafer_scale, 0.5 * strafer_scale),
        surface = "gleba",
        usage = "enemy"
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__space-age__/graphics/entity/strafer/torso/strafer-body-water-reflection.png",
          width = 448,
          height = 448,
          variation_count = 1,
          scale = 0.5 * strafer_scale,
          shift = util.by_pixel(0 * strafer_scale, 0 * strafer_scale)
        }
      },
      render_layer = "under-elevated",
      base_render_layer = "higher-object-above",
    },
    leg_lower_part =
    {
      layers = strafer_leg_part_template_layers,

      graphics_properties =
      {
        middle_offset_from_top = 0.01, -- offset length in tiles (= px / 32)
        middle_offset_from_bottom = 0.01
      },

      middle =
      util.sprite_load("__space-age__/graphics/entity/strafer/legs/leg-shin",
      {
        scale=0.5,
        direction_count=32,
        multiply_shift=0,
        tint_as_overlay = true,
        tint = tint_body,
        surface = "gleba",
        usage = "enemy"
      }),

      middle_shadow =
      util.sprite_load("__space-age__/graphics/entity/strafer/legs/leg-shin-shadow",
      {
        scale=0.5,
        direction_count=32,
        multiply_shift=0,
        surface = "gleba",
        usage = "enemy"
      }),

      middle_tint =
      util.sprite_load("__space-age__/graphics/entity/strafer/legs/leg-shin-mask",
      {
        scale=0.5,
        direction_count=32,
        multiply_shift=0,
        tint=tint_mask,
        surface = "gleba",
        usage = "enemy"
      }),

      reflection_middle =
      {
        filename = "__space-age__/graphics/entity/strafer/legs/strafer-legs-lower-stretchable-water-reflection.png",
        width = 72,
        height = 384,
        line_length = 1,
        direction_count = 1,
        scale = 0.25,
        shift = util.by_pixel(1 * 0.5, 0)
      }
    },
    leg_upper_part =
    {
      layers = strafer_leg_part_template_layers,

      graphics_properties =
      {
        middle_offset_from_top = 0.01, -- offset length in tiles (= px / 32)
        middle_offset_from_bottom = 0.01
      },

      middle =
      util.sprite_load("__space-age__/graphics/entity/strafer/legs/leg-thigh",
      {
        scale=0.5,
        direction_count=32,
        multiply_shift=0,
        tint_as_overlay = true,
        tint = tint_body_thigh,
        surface = "gleba",
        usage = "enemy"
      }),

      middle_shadow =
      util.sprite_load("__space-age__/graphics/entity/strafer/legs/leg-thigh-shadow",
      {
        scale=0.5,
        direction_count=32,
        multiply_shift=0,
        surface = "gleba",
        usage = "enemy"
      }),
      middle_tint =
      util.sprite_load("__space-age__/graphics/entity/strafer/legs/leg-thigh-mask",
      {
        scale=0.5,
        direction_count=32,
        multiply_shift=0,
        tint=tint_mask_thigh,
        surface = "gleba",
        usage = "enemy"
      }),

      reflection_middle =
      {
        filename = "__space-age__/graphics/entity/strafer/legs/strafer-legs-upper-stretchable-water-reflection.png",
        width = 80,
        height = 256,
        line_length = 1,
        direction_count = 1,
        scale = 0.25,
        shift = util.by_pixel(-4 * 0.5, 0),
        surface = "gleba",
        usage = "enemy"
      }
    },
    leg_joint =
    util.sprite_load("__space-age__/graphics/entity/strafer/legs/leg-knee",
    {
      scale=0.5,
      direction_count=32,
      multiply_shift=0,
      tint_as_overlay = true,
      tint = tint_body,
      surface = "gleba",
      usage = "enemy"
    }),
    leg_joint_tint =
    util.sprite_load("__space-age__/graphics/entity/strafer/legs/leg-knee-mask",
    {
      scale=0.5,
      direction_count=32,
      multiply_shift=0,
      tint_as_overlay = true,
      tint = tint_mask,
      surface = "gleba",
      usage = "enemy"
    }),
    leg_joint_shadow =
    util.sprite_load("__space-age__/graphics/entity/strafer/legs/leg-knee",
    {
      scale=0.5,
      direction_count=32,
      multiply_shift=0,
      draw_as_shadow = true,
      surface = "gleba",
      usage = "enemy"
    })
  }

  data:extend{
    {
      type = "projectile",
      name = prefix .. "strafer-projectile",
      hidden = true,
      flags = {"not-on-map"},
      acceleration = 0.001,
      turn_speed = 0.002,
      max_speed = 1,
      turning_speed_increases_exponentially_with_projectile_speed = true,
      hit_collision_mask = {layers={player=true, train=true, is_object=true}, not_colliding_with_itself=true},
      force_condition = "not-friend", --don't hit allies or trees, rocks, etc
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "invoke-tile-trigger",
              repeat_count = 1
            },
            {
              type = "create-entity",
              entity_name = prefix .. "wriggler-pentapod-premature",
              check_buildability = true,
              find_non_colliding_position = true
            },
            {
              type = "nested-result",
              action =
              {
                type = "area",
                radius = 1,
                force = "enemy",
                ignore_collision_condition = true,
                action_delivery =
                {
                  type = "instant",
                  target_effects =
                  {
                    {
                      type = "damage",
                      damage = {amount = 90 * damage, type = "explosion"}
                    },
                    {
                      type = "create-sticker",
                      sticker = "strafer-sticker"
                    },
                    {
                      type = "play-sound",
                      sound = sounds.projectile_impact,
                    },
                    {
                      type = "create-entity",
                      entity_name = "small-spitter-die"
                    }
                  }
                }
              }
            }
          }
        }
      },
      animation =
      {
        layers = {

          util.sprite_load("__space-age__/graphics/entity/wriggler/wriggler-projectile",
          {
            frame_count = 4,
            scale = 0.36 * scale,
            tint_as_overlay = true,
            rotate_shift = true,
            tint = tint_projectile
          }),
          util.sprite_load("__space-age__/graphics/entity/wriggler/wriggler-projectile-tint",
          {
            frame_count = 4,
            scale = 0.36 * scale,
            tint_as_overlay = true,
            rotate_shift = true,
            tint = tint_projectile_mask
          }),
        }
      },
      shadow = util.sprite_load("__space-age__/graphics/entity/wriggler/wriggler-projectile",
      {
        frame_count = 4,
        scale = 0.36 * scale,
        rotate_shift = true,
        draw_as_shadow = true
      }),
      smoke =
      {
        {
          name = "smoke-fast",
          deviation = {0.15, 0.15},
          frequency = 1,
          position = {0, 1},
          starting_frame = 3,
          starting_frame_deviation = 5
        }
      },
      working_sound = sounds.projectile_working_sound,
    },
    {
      type = "spider-unit",
      name = prefix .. "strafer-pentapod",
      icon = strafer_graphics_definitions.icon,
      collision_box = {{-1 * scale, -1 * scale}, {1 * scale, 1 * scale}},
      sticker_box = {{-1.0 * scale, -1.0 * scale}, {1.0 * scale , 1.0 * scale}},
      selection_box = {{-1.5 * scale, -1.5 * scale}, {1.5 * scale, 1.5 * scale}},
      drawing_box_vertical_extension = 3,
      flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
      max_health = health,
      factoriopedia_simulation = factoriopedia_simulation,
      order = "gleba-b-strafer-"..tostring(scale),
      subgroup = "enemies",
      impact_category = "organic",
      resistances = util.table.deepcopy(strafer_resistances),
      healing_per_tick = health/500/60,
      distraction_cooldown = 30,
      min_pursue_time = 10 * 60,
      --max_pursue_time = 60 * 60,
      max_pursue_distance = 50,
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "biological",
        cooldown = 120,
        range = max_range,
        use_shooter_direction = true,
        sound = space_age_sounds.strafer_projectile,
        ammo_type =
        {
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = prefix .. "strafer-projectile",
              starting_speed = 0.2,
              max_range = max_range * 5
            }
          }
        },
      },
      vision_distance = 40,
      ai_settings = util.merge(
      {
        gleba_ai_settings,
        {
          strafe_settings =
          {
            max_distance = max_strafe_distance,
            ideal_distance = ideal_strafe_distance,
            ideal_distance_tolerance = 2.5,
            ideal_distance_variance = 1,
            ideal_distance_importance = 0.25,
            ideal_distance_importance_variance = 0.1,
            face_target = true
          }
        }
      }),
      absorptions_to_join_attack = { spores = 20 },
      corpse = prefix .. "strafer-corpse",
      dying_explosion = prefix .. "strafer-pentapod-die",
      dying_trigger_effect =
      {
        {
          type = "create-entity",
          entity_name = prefix .. "wriggler-pentapod-premature",
          offsets =
          {
            util.rotate_position({0,1}, 0.1),
            util.rotate_position({0,1}, 0.3),
            util.rotate_position({0,1}, 0.5),
            util.rotate_position({0,1}, 0.7),
            util.rotate_position({0,1}, 0.9),
          }
        },
      },
      dying_sound = sounds.dying_sound,
      damaged_trigger_effect = gleba_hit_effects(),
      is_military_target = true,
      working_sound = sounds.working_sound,
      warcry = sounds.warcry,
      height = 1.5,
      torso_rotation_speed = 0.005,
      graphics_set = strafer_graphics_definitions.body,
      spider_engine =
      {
        walking_group_overlap = 0.6,
        legs =
        {
          {
            leg = prefix .. "strafer-pentapod-leg",
            mount_position = util.rotate_position(strafer_leg_mount_position, strafer_leg_orientations[1]),
            ground_position = util.rotate_position(strafer_leg_ground_position, strafer_leg_orientations[1]),
            walking_group = 1,
            leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
          },
          {
            leg = prefix .. "strafer-pentapod-leg",
            mount_position = util.rotate_position(strafer_leg_mount_position, strafer_leg_orientations[2]),
            ground_position = util.rotate_position(strafer_leg_ground_position, strafer_leg_orientations[2]),
            walking_group = 3,
            leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
          },
          {
            leg = prefix .. "strafer-pentapod-leg",
            mount_position = util.rotate_position(strafer_leg_mount_position, strafer_leg_orientations[3]),
            ground_position = util.rotate_position(strafer_leg_ground_position, strafer_leg_orientations[3]),
            walking_group = 5,
            leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
          },
          {
            leg = prefix .. "strafer-pentapod-leg",
            mount_position = util.rotate_position(strafer_leg_mount_position, strafer_leg_orientations[4]),
            ground_position = util.rotate_position(strafer_leg_ground_position, strafer_leg_orientations[4]),
            walking_group = 2,
            leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
          },
          {
            leg = prefix .. "strafer-pentapod-leg",
            mount_position = util.rotate_position(strafer_leg_mount_position, strafer_leg_orientations[5]),
            ground_position = util.rotate_position(strafer_leg_ground_position, strafer_leg_orientations[5]),
            walking_group = 4,
            leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
          },
        },
      }
    },
    {
      type = "corpse",
      name = prefix .. "strafer-corpse",
      icon = strafer_graphics_definitions.icon,
      flags = {"placeable-neutral", "not-on-map"},
      hidden_in_factoriopedia = true,
      subgroup = "corpses",
      final_render_layer = "corpse",
      --animation_render_layer = "entity",
      order = "a-l-a",
      selection_box = {{-3, -3}, {3, 3}},
      collision_box = {{-2, -2}, {2, 2}},
      tile_width = 3,
      tile_height = 3,
      selectable_in_game = false,
      time_before_removed = 60 * 60 * 1, -- 3 minutes
      remove_on_tile_placement = true,
      decay_frame_transition_duration = 50,
      animation = {
        layers = {
          util.sprite_load("__space-age__/graphics/entity/strafer/strafer-corpse",
          {
            frame_count = 1,
            scale = 0.5 * strafer_scale,
            shift = util.by_pixel(0, 0),
            direction_count = 1,
            flags = {"corpse-decay"},
            tint = tint_body,
            tint_as_overlay = true,
            surface = "gleba",
            usage = "corpse-decay"
          }),
          util.sprite_load("__space-age__/graphics/entity/strafer/strafer-corpse-mask",
          {
            frame_count = 1,
            scale = 0.5 * strafer_scale,
            shift = util.by_pixel(0, 0),
            direction_count = 1,
            flags = {"corpse-decay"},
            tint = tint_mask,
            tint_as_overlay = true,
            surface = "gleba",
            usage = "corpse-decay"
          })
        }
      },
     --[[ decay_animation ={
        layers ={
          variations = {
          util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse",
          {
            frame_count = 16,
            scale = 0.5,
            shift = util.by_pixel(0, 0),
            direction_count = 1,
            flags = {"corpse-decay"},
            surface = "gleba",
            usage = "corpse-decay"
          }
        ),
        util.sprite_load("__space-age__/graphics/entity/stomper/stomper-corpse-2",
        {
          frame_count = 16,
          scale = 0.5,
          shift = util.by_pixel(0, 0),
          direction_count = 1,
          flags = {"corpse-decay"},
          surface = "gleba",
          usage = "corpse-decay"
        }
      )}}
      }]]
    },

    make_leg(prefix .. "strafer-pentapod-leg", strafer_scale, strafer_leg_thickness, strafer_speed, strafer_graphics_definitions, sounds,
    {
      hip_flexibility = strafer_hip_flexibility,
      knee_height = strafer_knee_height, -- tiles, in screen space, above the ground that the knee naturally rests at
      knee_distance_factor = strafer_knee_distance_factor, -- distance from torso, as multiplier of leg length
      ankle_height = 0, -- tiles, in screen space, above the ground, the point at which the leg connects to the foot
      upper_leg_dying_trigger_effects = make_pentapod_leg_dying_trigger_effects(prefix .. "strafer-pentapod-leg-die", pentapod_upper_leg_dying_trigger_effect_positions),
      lower_leg_dying_trigger_effects = make_pentapod_leg_dying_trigger_effects(prefix .. "strafer-pentapod-leg-die", pentapod_lower_leg_dying_trigger_effect_positions),
      resistances = util.table.deepcopy(strafer_resistances),
    }),
    make_particle
    {
      name = prefix .. "strafer-skin-particle-extra-small",
      life_time = 200,
      pictures = particle_animations.get_pentpod_skin_particles_small({ tint = lerp_color(tint_mask, {255,255,255,255}, 0.7)}),
      shadows = particle_animations.get_pentpod_skin_particles_small({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
      ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
      render_layer_when_on_ground = "lower-object-above-shadow"
    },
    make_particle
    {
      name = prefix .. "strafer-skin-particle-small",
      life_time = 250,
      pictures = particle_animations.get_pentpod_skin_particles_small({ scale = 1.2 * strafer_scale, tint = lerp_color(tint_mask, {255,255,255,255}, 0.7)}),
      shadows = particle_animations.get_pentpod_skin_particles_small({ scale = 1.2 * strafer_scale, tint = shadowtint(), shift = util.by_pixel (1,0)}),
      ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
      render_layer_when_on_ground = "lower-object-above-shadow"
    },
    make_particle
    {
      name = prefix .. "strafer-skin-particle-medium",
      life_time = 300,
      pictures = particle_animations.get_pentpod_skin_particles_medium({ scale = 1 * strafer_scale, tint = lerp_color(tint_mask, {255,255,255,255}, 0.7)}),
      shadows = particle_animations.get_pentpod_skin_particles_medium({ scale = 1 * strafer_scale, tint = shadowtint(), shift = util.by_pixel (1,0)}),
      ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
      render_layer_when_on_ground = "lower-object-above-shadow"
    },
    {
      type = "explosion",
      name = prefix.."strafer-pentapod-die",
      created_effect = {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-trivial-smoke",
              repeat_count = 6,
              smoke_name = "strafer-steamy-gas",
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 0.8,
              speed_from_center = 0.03,
              speed_from_center_deviation = 0.04
            },
            {
              type = "create-particle",
              repeat_count = 12,
              repeat_count_deviation = 3,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = "gleba-blood-particle-small",
              offsets =
              {
                { 0, -0.4 },
                { 0, 0.5 },
                { 0, 0.6 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 0.5,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.075,
              initial_vertical_speed_deviation = 0.075,
              speed_from_center = 0.1,
              speed_from_center_deviation = 0.1,
              frame_speed = 1,
              frame_speed_deviation = 0,
              tail_length = 52,
              tail_length_deviation = 25,
              tail_width = 3,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 3,
              repeat_count_deviation = 0,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = "pentapod-entrails-particle-medium",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 1.5,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.07,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.07,
              speed_from_center_deviation = 0,
              frame_speed = 1,
              frame_speed_deviation = 0,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 15,
              repeat_count_deviation = 0,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "strafer-skin-particle-extra-small",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 1.2,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.078,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.05,
              speed_from_center_deviation = 0.01,
              frame_speed = 1,
              frame_speed_deviation = 0,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 15,
              repeat_count_deviation = 0,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "strafer-skin-particle-small",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 1.5,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.078,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.04,
              speed_from_center_deviation = 0.02,
              frame_speed = 1,
              frame_speed_deviation = 0,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 5,
              repeat_count_deviation = 0,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "strafer-skin-particle-medium",
              offsets =
              {
                { 0, -0.4 }
              },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 1.5,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.078,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.07,
              speed_from_center_deviation = 0.1,
              frame_speed = 1,
              frame_speed_deviation = 0,
              rotate_offsets = false
            },
            {
              type = "play-sound",
              sound = base_sounds.behemoth_gore
            }
          }
        }
      },
      icon = "__base__/graphics/icons/biter-spawner-corpse.png",
      order = "a[corpse]-b[biter-spawner]",
      flags = {"not-on-map"},
      hidden = true,
      subgroup = "enemy-death-explosions",
      animations = util.empty_sprite(),
    },
    {
      type = "explosion",
      name = prefix.."strafer-pentapod-leg-die",
      created_effect = {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-particle",
              repeat_count = 6,
              repeat_count_deviation = 3,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = "gleba-blood-particle-small",
              offsets = { { 0, 0.5 } },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              initial_height = 0.5,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.02,
              initial_vertical_speed_deviation = 0.01,
              speed_from_center = 0.05,
              speed_from_center_deviation = 0.05,
              frame_speed = 1,
              frame_speed_deviation = 0,
              tail_length = 20,
              tail_length_deviation = 10,
              tail_width = 2,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 3,
              repeat_count_deviation = 0,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "strafer-skin-particle-extra-small",
              offsets = { { 0, 0.5 } },
              offset_deviation = { { -0.05, -0.05 }, { 0.05, 0.05 } },
              initial_height = 0.5,
              initial_height_deviation = 0,
              initial_vertical_speed = 0.01,
              initial_vertical_speed_deviation = 0.002,
              speed_from_center = 0.01,
              speed_from_center_deviation = 0,
              frame_speed = 1,
              frame_speed_deviation = 0,
              rotate_offsets = false
            },
            {
              type = "create-particle",
              repeat_count = 2,
              repeat_count_deviation = 0,
              probability = 1,
              affects_target = false,
              show_in_tooltip = false,
              particle_name = prefix .. "strafer-skin-particle-small",
              offsets = { { 0, 0.5 } },
              offset_deviation = { { -0.05, -0.05 }, { 0.05, 0.05 } },
              initial_height = 0.5,
              initial_height_deviation = 0,
              initial_vertical_speed = 0.01,
              initial_vertical_speed_deviation = 0.002,
              speed_from_center = 0.01,
              speed_from_center_deviation = 0,
              frame_speed = 1,
              frame_speed_deviation = 0,
              rotate_offsets = false
            },
          }
        }
      },
      icon = "__base__/graphics/icons/biter-spawner-corpse.png",
      order = "a[corpse]-b[biter-spawner]",
      flags = {"not-on-map"},
      hidden = true,
      subgroup = "enemy-death-explosions",
      animations = util.empty_sprite(),
    }
  }
end

function make_wriggler(prefix, scale, health, damage, tints, factoriopedia_simulation, factoriopedia_simulation_premature, sounds)
  -- Premature version loses health so that the swarm will get removed (more efficient).
  -- Spawner-spawned versions are stable so that the area is not full of corpses.
  local tint_mask = tints.mask
  local tint_body = tints.body

  local function attack_parameters(lifesteal)
    local cooldown = 26
    return {
      ammo_category = "melee",
      ammo_type =
      {
        target_type = "entity",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
              lifesteal and {
              {
                type = "damage",
                damage = { amount = -health/50/60*cooldown * 1.1, type = "poison"} -- offsets negative regeneration when attacking
              }
            } or nil,
            target_effects =
            {
              {
                type = "damage",
                damage = { amount = 5 * damage, type = "physical"}
              },
              {
                type = "damage",
                damage = { amount = 5 * damage, type = "poison"}
              }
            }
          }
        }
      },
      animation =
      {
        layers=
        {
          wriggler_spritesheet("attack", 19, 0.48, scale, tint_body),
          wriggler_spritesheet("attack-tint", 19, 0.48, scale, tint_mask),
          wriggler_spritesheet("attack-shadow", 19, 0.48, scale),
        }
      },
      cooldown = cooldown,
      cooldown_deviation = 0.1,
      range = 1.8 * scale,
      range_mode = "bounding-box-to-bounding-box",
      sound = sounds.attack_sound,
      type = "projectile"
    }
  end

  local wriggler = {
    type = "unit",
    name = prefix .. "wriggler-pentapod-premature",
    icon = "__space-age__/graphics/icons/".. prefix .."wriggler.png",
    subgroup = "enemies",
    order = "gleba-a-wriggler-"..tostring(scale),
    factoriopedia_simulation = factoriopedia_simulation_premature,
    collision_box = {{-0.2 * scale, -0.2 * scale} , {0.2 * scale, 0.2 * scale}},
    sticker_box = {{-0.5 * scale, -0.5 * scale} , {0.5 * scale, 0.5 * scale}},
    selection_box = {{-0.9 * scale, -0.9 * scale} , {0.9 * scale, 0.9 * scale}},
    collision_mask = {layers={player=true, train=true, is_object=true}, not_colliding_with_itself=true},
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    absorptions_to_join_attack = { spores = 0 },
    ai_settings = {
      allow_try_return_to_spawner = true,
      destroy_when_commands_fail = true
    },
    attack_parameters = attack_parameters(true),
    corpse = prefix .. "wriggler-pentapod-corpse",
    damaged_trigger_effect = gleba_hit_effects(),
    distance_per_frame = 0.125,
    distraction_cooldown = 300,
    dying_explosion = prefix .. "wriggler-die",
    dying_sound = sounds.dying_sound,
    healing_per_tick = -health/50/60,
    impact_category = "organic",
    max_health = health,
    max_pursue_distance = 50,
    min_pursue_time = 600,
    movement_speed = 0.2 * (1 + (scale - 1) / 2),
    resistances =
    {
      {
        percent = 50,
        type = "laser"
      }
    },
    run_animation =
    {
      layers =
      {
        wriggler_spritesheet("run", 21, 0.48, scale, tint_body),
        wriggler_spritesheet("run-tint", 21, 0.48, scale, tint_mask),
        wriggler_spritesheet("run-shadow", 21, 0.48, scale),
      }
    },
    running_sound_animation_positions = {2},
    vision_distance = 20,
    water_reflection =
    {
      orientation_to_variation = false,
      rotate = true,
      pictures =
      {
        filename = "__base__/graphics/entity/biter/biter-reflection.png",
        height = 28,
        priority = "extra-high",
        scale = 2.5 * scale,
        shift = {0.15625, 0.46875},
        variation_count = 1,
        width = 20
      }
    },
    walking_sound = sounds.walking_sound,
    working_sound = sounds.working_sound,
    warcry = sounds.warcry,
  }

  local wriggler_stable = table.deepcopy(wriggler)
  wriggler_stable.name = prefix .. "wriggler-pentapod"
  wriggler_stable.factoriopedia_simulation = factoriopedia_simulation
  wriggler_stable.healing_per_tick = health/500/60
  wriggler_stable.absorptions_to_join_attack = { spores = 2 }
  wriggler_stable.attack_parameters = attack_parameters(false)

  local wriggler_coprse =
  {
    type = "corpse",
    name = prefix .. "wriggler-pentapod-corpse",
    icon = "__space-age__/graphics/icons/" .. prefix .. "wriggler-corpse.png",
    subgroup = "corpses",
    order = "c[corpse]-d[gleba-enemies-corpses]-d[wriggler]"..tostring(scale),
    hidden_in_factoriopedia = true,
    selection_box = {{-0.8,-0.8},{0.8,0.8}},
    selectable_in_game = false,
    animation =
    {
      layers=
      {
        wriggler_corpse_spritesheet("death", 17, 0.48, scale, tint_body),
        wriggler_corpse_spritesheet("death-tint", 17, 0.48, scale, tint_mask),
        wriggler_corpse_spritesheet("death-shadow", 17, 0.48, scale),
      }
    },
    decay_animation =
    {
      layers=
      {
        wriggler_corpse_spritesheet("decay", 9, nil, scale, tint_body),
        wriggler_corpse_spritesheet("decay-tint", 9, nil, scale, tint_mask),
        wriggler_corpse_spritesheet("decay-shadow", 9, nil, scale),
      }
    },
    dying_speed = 0.015 / scale,
    decay_frame_transition_duration = 150,
    time_before_removed = 1 * 60 * 60, -- 1 minute
    use_decay_layer = true,

    direction_shuffle = {{1,2,3,16},{4,5,6,7},{8,9,10,11},{12,13,14,15}},
    shuffle_directions_at_frame = 0,
    final_render_layer = "lower-object-above-shadow",
    flags = {
      "placeable-neutral",
      "placeable-off-grid",
      "building-direction-8-way",
      "not-repairable",
      "not-on-map"
    },
    ground_patch =
    {
      sheet =
        util.sprite_load("__space-age__/graphics/entity/wriggler/blood-puddle-var-main",
          {
            flags = { "low-object" },
            variation_count = 4,
            scale = 0.4 * scale,
            multiply_shift = 0.125,
          }
        )
    },
    ground_patch_fade_in_delay = 20,
    ground_patch_fade_in_speed = 0.002,
    ground_patch_fade_out_duration = 50 * 60 / 7.5,
    ground_patch_fade_out_start = 50 * 60 / 7.5,
    ground_patch_render_layer = "decals"
  }

  local wrigger_explosion =
  {
    type = "explosion",
    name = prefix .. "wriggler-die",
    scale = 0.25,
    icon = "__space-age__/graphics/icons/medium-wriggler-corpse.png",
    order = "a[corpse]-f[wriggler]",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "enemy-death-explosions",
    animations = util.empty_sprite(),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 13,
            repeat_count_deviation = 1,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "gleba-blood-particle-small",
            offsets = { { 0, 0 } },
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.1,
            initial_vertical_speed = 0.009,
            initial_vertical_speed_deviation = 0.009,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0,
            tail_length = 5,
            tail_length_deviation = 5,
            tail_width = 3,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 12,
            repeat_count_deviation = 3,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "gleba-blood-particle-small",
            offsets =
            {
              { 0, -0.4 },
              { 0, 0.5 },
              { 0, 0.6 }
            },
            offset_deviation = { { -0.25, -0.25 }, { 0.25, 0.25 } },
            initial_height = 0.1,
            initial_height_deviation = 0.1,
            initial_vertical_speed = 0.055,
            initial_vertical_speed_deviation = 0.075,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.03,
            frame_speed = 1,
            frame_speed_deviation = 0,
            tail_length = 52,
            tail_length_deviation = 25,
            tail_width = 3,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 2,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "pentapod-entrails-particle-small",
            offsets =
            {
              { 0, -0.4 }
            },
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.1,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.07,
            speed_from_center_deviation = 0,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 10,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = prefix .. "wriggler-skin-particle",
            offsets =
            {
              { 0, -0.4 }
            },
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.1,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.02,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.1,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "play-sound",
            sound = base_sounds.medium_gore
          },
        }
      }
    }
  }

  data:extend{
    wriggler,
    wriggler_stable,
    wriggler_coprse,
    wrigger_explosion,
    make_particle
    {
      name = prefix .. "wriggler-skin-particle",
      life_time = 300,
      pictures = particle_animations.get_pentpod_skin_particles_small({ scale = 1 * scale, tint = lerp_color(tint_mask, {255,255,255,255}, 0.7) }),
      shadows = particle_animations.get_pentpod_skin_particles_small({ scale = 1 * scale, tint = shadowtint(), shift = util.by_pixel (1,0)}),
      ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
      render_layer_when_on_ground = "lower-object-above-shadow"
    },
  }
end

data:extend(
{
  {
    type = "sticker",
    name = "strafer-sticker",
    hidden = true,
    animation =
    {
      filename = "__base__/graphics/entity/slowdown-sticker/slowdown-sticker.png",
      line_length = 5,
      width = 42,
      height = 48,
      frame_count = 50,
      animation_speed = 0.5,
      tint = {0.63, 0.62, 0.47, 0.7}, -- a29f7a
      shift = util.by_pixel(2, -0.5),
      scale = 0.5
    },
    duration_in_ticks = 40,
    target_movement_modifier = 0.5
  },
  {
    type = "unit-spawner",
    name = "gleba-spawner",
    icon = "__space-age__/graphics/icons/gleba-spawner.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable", "placeable-off-grid"},
    max_health = 500,
    order="s-d-b",
    subgroup="enemies",
    working_sound =
    {
      sound = { filename = "__base__/sound/creatures/spawner-spitter.ogg", volume = 0.6, modifiers = volume_multiplier("main-menu", 0.7) },
      max_sounds_per_type = 3,
    },
    dying_sound = sound_variations("__base__/sound/creatures/spawner-death", 5, 0.7, volume_multiplier("main-menu", 1.21) ),
    impact_category = "organic",
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 15
      },
      {
        type = "explosion",
        decrease = 5,
        percent = 15
      },
      {
        type = "fire",
        decrease = 3,
        percent = 60
      }
    },
    healing_per_tick = 10/60,
    collision_box = {{-2.35, -2.35}, {2.35, 2.35}},
    collision_mask = {layers={player=true, object=true, ground_tile=true, is_object=true, is_lower_object=true}}, -- can go in shallow water
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    hit_visualization_box = {{-1, -0.75}, {1, 0.75}},
    absorptions_per_second = { spores = { absolute = 20, proportional = 0.01 } },
    corpse = "gleba-spawner-corpse",
    dying_explosion = "spitter-spawner-die",
    dying_trigger_effect =
    {
      {
        type = "create-entity",
        entity_name = "small-wriggler-pentapod-premature",
        as_enemy = true,
        offsets =
        {
          util.rotate_position({0,1}, 0.1),
          util.rotate_position({0,1}, 0.3),
          util.rotate_position({0,1}, 0.5),
          util.rotate_position({0,1}, 0.7),
          util.rotate_position({0,1}, 0.9),
          util.rotate_position({0,2}, 0.0),
          util.rotate_position({0,2}, 0.05),
          util.rotate_position({0,2}, 0.1),
          util.rotate_position({0,2}, 0.15),
          util.rotate_position({0,2}, 0.2),
          util.rotate_position({0,2}, 0.25),
          util.rotate_position({0,2}, 0.3),
          util.rotate_position({0,2}, 0.35),
          util.rotate_position({0,2}, 0.4),
          util.rotate_position({0,2}, 0.45),
          util.rotate_position({0,2}, 0.5),
          util.rotate_position({0,2}, 0.55),
          util.rotate_position({0,2}, 0.6),
          util.rotate_position({0,2}, 0.65),
          util.rotate_position({0,2}, 0.7),
          util.rotate_position({0,2}, 0.75),
          util.rotate_position({0,2}, 0.8),
          util.rotate_position({0,2}, 0.85),
          util.rotate_position({0,2}, 0.9),
          util.rotate_position({0,2}, 0.95),
        }
      }
    },
    damaged_trigger_effect = gleba_hit_effects(),
    max_count_of_owned_units = 1,
    max_friends_around_to_spawn = 2,
    graphics_set =
    {
      animations =
      {
        {
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-upper-1",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              shift = util.by_pixel(12, -20)
            }),
            util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-shadow-1",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              shift = util.by_pixel(12, -20)
            }),
          }
        },
       --[[ {
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-upper-2",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
            }),
            util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-shadow-2",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
            }),
          }
        },]]
        {
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-upper-3",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              shift = util.by_pixel(0, -8)
            }),
            util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-shadow-3",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              shift = util.by_pixel(0, -8)
            }),
          }
        },
        {
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-upper-4",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              shift = util.by_pixel(28, 32)
            }),
            util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-shadow-4",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              shift = util.by_pixel(28, 32)
            }),
          }
        },
      },
      underwater_animations =
      {
        util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-patch-1",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
            shift = util.by_pixel(12, -20)
        }),
        --[[
        util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-patch-2",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
        }),
        ]]
        util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-patch-3",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(0, -8)
        }),
        util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-patch-4",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(28, 32)
        }),
      },
      water_effect_map_animations =
      {
        util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-effect-map-1",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(12, -20)
          --shift = util.by_pixel( -0.0, 64.0),
          --tint = tint,
          --flags = { "mask" },
          --y = variation * 230 * 2,
        }),
        --[[
        util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-effect-map-2",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
        }),]]
        util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-effect-map-3",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(0, -8)
        }),
        util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-effect-map-4",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
            shift = util.by_pixel(28, 32)
        }),
      },

      --[[
      water_reflection =
      {
        pictures =
        {
          {
            filename = "__space-age__/graphics/entity/gleba-spawner/spawner-effect-map-3.png",
            width = 364,
            height = 266,
            shift = util.by_pixel( -0.0,  0.0),
            scale = 0.5
          },
          {
            filename = "__space-age__/graphics/entity/gleba-spawner/spawner-effect-map-3.png",
            width = 364,
            height = 266,
            shift = util.by_pixel( -0.0, 0.0),
            scale = 0.5
          },
          util.sprite_load("__space-age__/graphics/entity/gleba-spawner/spawner-effect-map-3",
          {
            frame_count = 16,
            scale = 0.5,
            animation_speed = 0.1,
            run_mode = "forward-then-backward",
            shift = util.by_pixel( -0.0, 64.0),
            --tint = tint,
            --flags = { "mask" },
            --y = variation * 230 * 2,
          }
          ),
          {
            filename = "__space-age__/graphics/entity/gleba-spawner/spawner-effect-map-3.png",
            width = 364,
            height = 266,
            shift = util.by_pixel( -0.0, 0.0),
            scale = 0.5
          },
        }
      }
      --]]
    },
    result_units =
    {
      {"small-wriggler-pentapod", {{0.0, 0.4}, {0.1, 0.4}, {0.6, 0}}},
      {"small-strafer-pentapod", {{0.0, 0.4}, {0.1, 0.4}, {0.6, 0}}},
      {"small-stomper-pentapod", {{0.0, 0.2}, {0.1, 0.2}, {0.6, 0}}},
      {"medium-wriggler-pentapod", {{0.1, 0}, {0.6, 0.4}, {0.95, 0}}},
      {"medium-strafer-pentapod", {{0.1, 0}, {0.6, 0.4}, {0.95, 0}}},
      {"medium-stomper-pentapod", {{0.1, 0}, {0.6, 0.2}, {0.95, 0}}},
      {"big-wriggler-pentapod", {{0.6, 0}, {0.95, 0.4}, {1, 0.4}}},
      {"big-strafer-pentapod", {{0.6, 0}, {0.95, 0.4}, {1, 0.4}}},
      {"big-stomper-pentapod", {{0.6, 0}, {0.95, 0.2}, {1, 0.2}}},
    },
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {360, 150},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    call_for_help_radius = 50,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "gleba-spawner-slime",
        spawn_min = 3,
        spawn_max = 3,
        spawn_min_radius = 0,
        spawn_max_radius = 6
      }
    },
    -- also add to yumako areas
    autoplace = space_enemy_autoplace.gleba_spawner_autoplace("gleba_spawner", "b[enemy]-c[spawner]-a[large]"),
    loot = {{item = "pentapod-egg", probability = 1, count_min = 9, count_max = 9}}
  },
  {
    type = "unit-spawner",
    name = "gleba-spawner-small",
    icon = "__space-age__/graphics/icons/gleba-spawner-small.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable", "placeable-off-grid"},
    max_health = 100,
    order="s-d-b",
    subgroup="enemies",
    working_sound =
    {
      sound = { filename = "__base__/sound/creatures/spawner-spitter.ogg", volume = 0.6, modifiers = volume_multiplier("main-menu", 0.7) },
      max_sounds_per_type = 3,
    },
    dying_sound = sound_variations("__base__/sound/creatures/spawner-death", 5, 0.7, volume_multiplier("main-menu", 1.21) ),
    impact_category = "organic",
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 15
      },
      {
        type = "explosion",
        decrease = 5,
        percent = 15
      },
      {
        type = "fire",
        decrease = 3,
        percent = 60
      }
    },
    healing_per_tick = 5/60,
    map_generator_bounding_box = {{-2.35, -2.35}, {2.35, 2.35}}, -- stop shallows bias
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    collision_mask = {layers={player=true, object=true, ground_tile=true, is_object=true, is_lower_object=true}}, -- can go in shallow water
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    hit_visualization_box = {{-0.5, -0.25}, {0.5, 0.25}},
    absorptions_per_second = { spores = { absolute = 4, proportional = 0.002 } },
    corpse = "gleba-spawner-corpse-small",
    dying_explosion = "spitter-spawner-die",
    dying_trigger_effect =
    {
      {
        type = "create-entity",
        entity_name = "small-wriggler-pentapod-premature",
        as_enemy = true,
        offsets =
        {
          util.rotate_position({0,1}, 0.1),
          util.rotate_position({0,1}, 0.3),
          util.rotate_position({0,1}, 0.5),
          util.rotate_position({0,1}, 0.7),
          util.rotate_position({0,1}, 0.9),
        }
      }
    },
    damaged_trigger_effect = gleba_hit_effects(),
    max_count_of_owned_units = 1,
    max_friends_around_to_spawn = 2,
    graphics_set =
    {
      animations =
      {
        {
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/gleba-spawner/small/spawner-upper-small-1",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              shift = util.by_pixel(8, 0)
            }),
            util.sprite_load("__space-age__/graphics/entity/gleba-spawner/small/spawner-shadow-small-1",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              shift = util.by_pixel(8, 0)
            })
          }
        },
        {
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/gleba-spawner/small/spawner-upper-small-2",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
            }),
            util.sprite_load("__space-age__/graphics/entity/gleba-spawner/small/spawner-shadow-small-2",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
            })
          },
        },
      },
      underwater_animations =
      {
        util.sprite_load("__space-age__/graphics/entity/gleba-spawner/small/spawner-patch-small-1",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(8, 0)
        }),
        util.sprite_load("__space-age__/graphics/entity/gleba-spawner/small/spawner-patch-small-2",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
        }),
      },
      water_effect_map_animations =
      {
        util.sprite_load("__space-age__/graphics/entity/gleba-spawner/small/spawner-effect-map-small-1",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(8, 0)
          --shift = util.by_pixel( -0.0, 64.0),
          --tint = tint,
          --flags = { "mask" },
          --y = variation * 230 * 2,
        }),
        util.sprite_load("__space-age__/graphics/entity/gleba-spawner/small/spawner-effect-map-small-2",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
          --shift = util.by_pixel( -0.0, 64.0),
          --tint = tint,
          --flags = { "mask" },
          --y = variation * 230 * 2,
        }),
      },
    },
    result_units =
    { -- allowes to spawn close to starting area so prevent strafer and stomper from spawning
      {"small-wriggler-pentapod", {{0.0, 0.9}, {0.1, 0.9}, {0.6, 0}}},
      {"medium-wriggler-pentapod", {{0.1, 0}, {0.6, 0.9}, {0.95, 0}}},
      {"big-wriggler-pentapod", {{0.6, 0}, {0.95, 0.9}, {1, 0.9}}},
    },
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {360, 150},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    call_for_help_radius = 50,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "gleba-spawner-slime",
        spawn_min = 2,
        spawn_max = 2,
        spawn_min_radius = 0,
        spawn_max_radius = 4
      }
    },
    -- also add to yumako areas
    autoplace = space_enemy_autoplace.gleba_spawner_autoplace("gleba_spawner_small", "b[enemy]-c[spawner]-b[small]"),
    loot = {{item = "pentapod-egg", probability = 1, count_min = 1, count_max = 3}}
  },

  {
    type = "corpse",
    name = "gleba-spawner-corpse",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__space-age__/graphics/icons/gleba-spawner.png",
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    collision_mask = {layers={}, colliding_with_tiles_only=true}, -- can go in water
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selectable_in_game = false,
    dying_speed = 0.015,
    time_before_removed = 15 * 60 * 60,
    subgroup="corpses",
    order = "c[corpse]-d[gleba-enemies-corpses]-a[spawner]",
    animation =
    {
      filename = "__space-age__/graphics/entity/gleba-spawner/gleba-spawner-corpse.png",
      frame_count = 1,
      direction_count = 1,
      width = 448,
      height = 448,
      scale = 0.9
    }
  },
  {
    type = "corpse",
    name = "gleba-spawner-corpse-small",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__space-age__/graphics/icons/gleba-spawner.png",
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    collision_mask = {layers={}, colliding_with_tiles_only=true}, -- can go in water
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selectable_in_game = false,
    dying_speed = 0.015,
    time_before_removed = 15 * 60 * 60,
    subgroup="corpses",
    order = "c[corpse]-d[gleba-enemies-corpses]-a[spawner]-a[small]",
    animation =
    {
      filename = "__space-age__/graphics/entity/gleba-spawner/gleba-spawner-corpse.png",
      frame_count = 1,
      direction_count = 1,
      width = 448,
      height = 448,
      scale = 0.3,
      surface = "gleba",
      usage = "corpse-decay"
    }
  },
  make_particle
  {
    name = "pentapod-entrails-particle-small",
    life_time = 300,
    pictures = particle_animations.get_pentpod_entrails_particles({ scale = 0.6}),
    shadows = particle_animations.get_pentpod_entrails_particles({ scale = 0.6, tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
  },
  make_particle
  {
    name = "pentapod-entrails-particle-medium",
    life_time = 300,
    pictures = particle_animations.get_pentpod_entrails_particles({ scale = 0.8}),
    shadows = particle_animations.get_pentpod_entrails_particles({ scale = 0.8, tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },
  make_particle
  {
    name = "pentapod-entrails-particle-big",
    life_time = 300,
    pictures = particle_animations.get_pentpod_entrails_particles({ scale = 1}),
    shadows = particle_animations.get_pentpod_entrails_particles({ scale = 1, tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  }
})


-- mask tint is vibrant and only on the mask
-- body tint applies to the whole body and should be near 127 grey, just adds a hint of saturation
local gleba_small_mask_tint = {103, 151, 11, 255}
local gleba_small_mask2_tint = {173, 211, 11, 255} -- thighs
local gleba_small_body_tint = {125, 124, 111, 255}
local small_wriggler_mask_tint = fade(lerp_color(gleba_small_mask_tint, {255, 200, 0, 255}, 0.1), 0.2)
local small_wriggler_body_tint = grey_overlay(lerp_color(gleba_small_body_tint, {255, 0, 0, 255}, 0.1), 0.2)
make_strafer("small-", 0.9, 800, 0.75, 3.75, 20, 25, 30,
  {
    mask = fade(gleba_small_mask_tint, 0.2),
    mask_thigh = fade(gleba_small_mask2_tint, 0.4),
    body = gleba_small_body_tint,
    projectile_mask = small_wriggler_mask_tint, -- same as wriggler mask tint
    projectile = small_wriggler_body_tint,  -- same as wriggler body tint
  }, simulations.factoriopedia_gleba_enemy_small_strafer, space_age_sounds.strafer_pentapod.small)
make_stomper("small-", 0.9, 3500, 0.5, 1.8,
  {
    mask = fade(gleba_small_mask_tint, 0.2),
    mask_thigh = fade(gleba_small_mask2_tint, 0.3),
    mask_head = fade(lerp_color(gleba_small_mask_tint, {0,255,127,255}, 0.15), 0.1), -- more vibrant green
    body = gleba_small_body_tint,
    body_thigh = lerp_color(gleba_small_body_tint, grey_overlay({0,255,127,255}, 0.7), 0.3) -- reduce red
  }, simulations.factoriopedia_gleba_enemy_small_stomper, space_age_sounds.stomper_pentapod.small)
make_wriggler("small-", 0.6, 100, 0.75,
  {
    mask = small_wriggler_mask_tint,
    body = small_wriggler_body_tint
  }, simulations.factoriopedia_gleba_enemy_small_wriggler, simulations.factoriopedia_gleba_enemy_small_wriggler_premature, space_age_sounds.wriggler_pentapod.small)

-- strafer and wriggler are a bit more yellow, stomper leans more to orange
local gleba_medium_mask_tint = {250,118,0,255}
local gleba_medium_mask2_tint = {250,250,0,255}
local gleba_medium_body_tint = {115,122,114,255}
local medium_wriggler_mask_tint = fade(gleba_medium_mask_tint, 0.3)
local medium_wriggler_body_tint = gleba_medium_body_tint
make_strafer("medium-", 1.2, 1400, 1, 4.5, 23, 28, 33,
  {
    mask = fade(lerp_color(gleba_medium_mask_tint, gleba_medium_mask2_tint, 0.5), 0.3),
    mask_thigh = fade(lerp_color(gleba_medium_mask_tint, gleba_medium_mask2_tint, 0.7), 0.2),
    body = gleba_medium_body_tint,
    projectile_mask = medium_wriggler_mask_tint, -- same as wriggler mask tint
    projectile = medium_wriggler_body_tint  -- same as wriggler body tint
  }, simulations.factoriopedia_gleba_enemy_medium_strafer, space_age_sounds.strafer_pentapod.medium)
make_stomper("medium-", 1.2, 8000, 1, 2.3,
  {
    mask = fade(gleba_medium_mask_tint, 0.3),
    mask_thigh = fade(gleba_medium_mask2_tint, 0.4),
    body = lerp_color(gleba_medium_body_tint, grey_overlay({127,255,0,255}, 0.5), 0.05) -- more green
  }, simulations.factoriopedia_gleba_enemy_medium_stomper, space_age_sounds.stomper_pentapod.medium)
make_wriggler("medium-", 0.8, 200, 1.1,
  {
    mask = medium_wriggler_mask_tint,
    body = medium_wriggler_body_tint
  }, simulations.factoriopedia_gleba_enemy_medium_wriggler, simulations.factoriopedia_gleba_enemy_medium_wriggler_premature, space_age_sounds.wriggler_pentapod.medium)

local gleba_big_mask_tint  = {216,0,35,255}
local gleba_big_mask2_tint  = {216,100,35,255}
local gleba_big_body_tint = {117,116,104,255}
local big_wriggler_mask_tint = fade(gleba_big_mask_tint, 0.4)
local big_wriggler_body_tint = gleba_big_body_tint
make_strafer("big-", 1.6, 2400, 1.6, 5.5, 26, 31, 36,
  {
    mask = fade(gleba_big_mask_tint, 0.4),
    mask_thigh = fade(gleba_big_mask2_tint, 0.2),
    body = grey_overlay(gleba_big_body_tint, 0.1),
    projectile_mask = big_wriggler_mask_tint, -- same as wriggler mask tint
    projectile = big_wriggler_body_tint  -- same as wriggler body tint
  }, simulations.factoriopedia_gleba_enemy_big_strafer, space_age_sounds.strafer_pentapod.big)
make_stomper("big-", 1.6, 15000, 1.6, 2.8,
  {
    mask = fade(gleba_big_mask_tint, 0.4),
    mask_thigh = fade(gleba_big_mask2_tint, 0.3),
    body = grey_overlay(gleba_big_body_tint, 0.1),
    body_thigh = lerp_color(gleba_big_body_tint, grey_overlay({250,108,0,255}, 0.7), 0.1) -- more orange/yellow
  }, simulations.factoriopedia_gleba_enemy_big_stomper, space_age_sounds.stomper_pentapod.big)
make_wriggler("big-", 1.0, 400, 1.8,
  {
    mask = fade(gleba_big_mask_tint, 0.5),
    body = gleba_big_body_tint
  }, simulations.factoriopedia_gleba_enemy_big_wriggler, simulations.factoriopedia_gleba_enemy_big_wriggler_premature, space_age_sounds.wriggler_pentapod.big)


-- With a few damage and rate of fire upgrades the engineer can easily be at 60 DPS if Vulcanus is the first new planet.
make_demolisher("small-demolisher", "s-h", 0.5, 1, 30000, 40, 0.55, simulations.factoriopedia_vulcanus_enemy_small_demolisher, space_age_sounds.demolisher.small)
make_demolisher("medium-demolisher", "s-i", 0.75, 1.5, 100000, 130, 0.6, simulations.factoriopedia_vulcanus_enemy_medium_demolisher, space_age_sounds.demolisher.medium)
make_demolisher("big-demolisher", "s-j", 1.0, 2.5, 300000, 400, 0.65, simulations.factoriopedia_vulcanus_enemy_big_demolisher, space_age_sounds.demolisher.big)

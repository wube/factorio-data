local explosion_animations = require("prototypes.entity.demo-explosion-animations")
local smoke_animations = require("prototypes.entity.demo-smoke-animations")
local smoke_animations = require("prototypes.entity.demo-smoke-animations")
local sounds = require("prototypes.entity.demo-sounds")

local max_nuke_shockwave_movement_distance_deviation = 2

local max_nuke_shockwave_movement_distance = 19 + max_nuke_shockwave_movement_distance_deviation / 6

local nuke_shockwave_starting_speed_deviation = 0.075

data:extend({

  -----------------------------------------------------------------------
  -- SMOKE
  -----------------------------------------------------------------------
  {
    type = "trivial-smoke",
    name = "nuclear-smoke",
    spread_duration = 100,
    duration = 30,
    fade_in_duration = 10,
    fade_away_duration = 20,
    start_scale = 2,
    -- scale_deviation = 0.5, -- FIXME: add support for scale deviation to trivial-smoke?
    end_scale = 0.2,
    render_layer = "higher-object-under",
    color = {r = 0.627, g = 0.478, b = 0.345, a = 0.500},
    affected_by_wind = true,
    cyclic =  true,
    animation = smoke_animations.trivial_smoke_fast
    {
      animation_speed = 1 / 6,
      scale = 2.5,
      flags = { "smoke", "linear-magnification" },
    },
  },

  -----------------------------------------------------------------------
  -- PARTICLES
  -----------------------------------------------------------------------
  {
    type = "particle-source",
    name = "nuclear-smouldering-smoke-source",
    subgroup = "particles",
    time_to_live = 60 * 60,
    time_to_live_deviation = 30 * 60,
    time_before_start = 90,
    time_before_start_deviation = 60,
    height = 0.4,
    height_deviation = 0.1,
    vertical_speed = 0,
    vertical_speed_deviation = 0,
    horizontal_speed = 0,
    horizontal_speed_deviation = 0,
    smoke =
    {
      {
        name = "soft-fire-smoke",
        frequency = 0.10, --0.25,
        position = {0.0, 0}, -- -0.8},
        starting_frame_deviation = 60,
        starting_vertical_speed = 0.01,
        starting_vertical_speed_deviation = 0.005,
        vertical_speed_slowdown = 1, -- 0.99
      }
    }
  },

  -----------------------------------------------------------------------
  -- SHOCKWAVE projectiles
  -----------------------------------------------------------------------
  {
    type = "projectile",
    name = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
    flags = {"not-on-map"},
    acceleration = 0,
    speed_modifier = { 1, 0.707 },
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
              type = "create-explosion",
              entity_name = "atomic-nuke-shockwave",
              max_movement_distance = max_nuke_shockwave_movement_distance,
              max_movement_distance_deviation = max_nuke_shockwave_movement_distance_deviation,
              inherit_movement_distance_from_projectile = true,
              cycle_while_moving = true,
            }
          }
        }
      },
    },
    animation = nil,
    shadow = nil
  },

  {
    type = "projectile",
    name = "atomic-bomb-wave-spawns-nuclear-smoke",
    flags = {"not-on-map"},
    acceleration = 0,
    speed_modifier = { 1.000, 0.707 },
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
              repeat_count = 10,
              type = "create-trivial-smoke",
              smoke_name = "nuclear-smoke",
              offset_deviation = {{-2, -2}, {2, 2}},
              starting_frame = 10,
              starting_frame_deviation = 20,
              starting_frame_speed = 0,
              starting_frame_speed_deviation = 5,
              speed_from_center = 0.035
            },
          }
        }
      },
    },
    animation = nil,
    shadow = nil
  },

  {
    type = "projectile",
    name = "atomic-bomb-wave-spawns-fire-smoke-explosion",
    flags = {"not-on-map"},
    acceleration = 0,
    speed_modifier = { 1, 0.707 },
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
              type = "create-explosion",
              entity_name = "atomic-fire-smoke",
              max_movement_distance = max_nuke_shockwave_movement_distance,
              max_movement_distance_deviation = max_nuke_shockwave_movement_distance_deviation,
              inherit_movement_distance_from_projectile = true,
              cycle_while_moving = true,
            }
          }
        }
      },
    },
    animation = nil,
    shadow = nil
  },

  {
    type = "projectile",
    name = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
    flags = {"not-on-map"},
    acceleration = 0.001,
    speed_modifier = { 1.0, 0.707 },
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
              entity_name = "cluster-nuke-explosion",
              -- following properties are recognized only be "create-explosion" trigger
              --max_movement_distance = max_nuke_shockwave_movement_distance,
              --max_movement_distance_deviation = max_nuke_shockwave_movement_distance_deviation,
              --inherit_movement_distance_from_projectile = true,
            }
          }
        }
      },
    },
    animation = nil,
    shadow = nil
  },

  {
    type = "projectile",
    name = "atomic-bomb-wave",
    flags = {"not-on-map"},
    acceleration = 0,
    speed_modifier = { 1.0, 0.707 },
    action =
    {
      {
        type = "area",
        radius = 3,
        ignore_collision_condition = true,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "damage",
            vaporize = false,
            lower_distance_threshold = 0,
            upper_distance_threshold = 35,
            lower_damage_modifier = 1,
            upper_damage_modifier = 0.1,
            damage = {amount = 400, type = "explosion"}
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  },

  {
    type = "projectile",
    name = "atomic-bomb-ground-zero-projectile",
    flags = {"not-on-map"},
    acceleration = 0,
    speed_modifier = { 1.0, 0.707 },
    action =
    {
      {
        type = "area",
        radius = 3,
        ignore_collision_condition = true,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "damage",
            vaporize = true,
            lower_distance_threshold = 0,
            upper_distance_threshold = 35,
            lower_damage_modifier = 1,
            upper_damage_modifier = 0.01,
            damage = {amount = 100, type = "explosion"}
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  },

  -----------------------------------------------------------------------
  -- EXPLOSIONS
  -----------------------------------------------------------------------

  {
    type = "explosion",
    name = "atomic-fire-smoke",
    fade_out_duration = 40,
    scale_out_duration = 50,
    scale_in_duration = 10,
    scale_initial = 0.1,
    scale = 1.5,
    scale_deviation = 0.2,
    scale_increment_per_tick = 0.005,
    correct_rotation = true,
    scale_animation_speed = true,
    animations =
    {
      {
        width = 152,
        height = 120,
        line_length = 5,
        frame_count = 60,
        shift = {-0.53125, -0.4375},
        priority = "high",
        animation_speed = 0.50,
        tint = {r = 0.627, g = 0.478, b = 0.345, a = 0.500},
        filename = "__base__/graphics/entity/smoke/smoke.png",
        flags = { "smoke" }
      },
    }
  },

  {
    type = "explosion",
    name = "atomic-nuke-shockwave",
    icon = "__base__/graphics/icons/destroyer.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "explosions",
    height = 1.4,
    rotate = true,
    correct_rotation = true,
    fade_out_duration = 30,
    scale_out_duration = 40,
    scale_in_duration = 10,
    scale_initial = 0.1,
    scale = 1,
    scale_deviation = 0.2,
    scale_end = 0.5,
    scale_increment_per_tick = 0.005,
    scale_animation_speed = true,

    animations = explosion_animations.nuke_shockwave(),
  },

  {
    type = "explosion",
    name = "cluster-nuke-explosion",
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = smoke_animations.trivial_nuke_smoke({
      tint = {r = 0.627, g = 0.478, b = 0.345, a = 0.500},
      scale = 2.5,
      fade_in_duration = 10,
      duration = 20,
      fade_away_duration = 20,
      spread_duration = 100,
      start_scale = 2.5,
      end_scale = 1.5,}),
    light = {intensity = 1, size = 20, color = {r=1.0, g=1.0, b=1.0}},
    scale_increment_per_tick = 0.002,
    fade_out_duration = 30,
    scale_out_duration = 20,
    scale_in_duration = 10,
    scale_initial = 0.1,
    correct_rotation = true,
    scale_animation_speed = true,
    --smoke = "smoke-fast",
    --smoke_count = 2,
    --smoke_slow_down_factor = 1,
    -- sound = sounds.small_explosion(0.5)
  },

  -----------------------------------------------------------------------
  -- Rocket PROJECTILE
  -----------------------------------------------------------------------
  {
    type = "projectile",
    name = "atomic-rocket",
    flags = {"not-on-map"},
    acceleration = 0.005,
    turn_speed = 0.003,
    turning_speed_increases_exponentially_with_projectile_speed = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "set-tile",
            tile_name = "nuclear-ground",
            radius = 12,
            apply_projection = true,
            tile_collision_mask = { "water-tile" },
          },
          {
            type = "destroy-cliffs",
            radius = 9,
            explosion = "explosion"
          },
          {
            type = "create-entity",
            entity_name = "nuke-explosion"
          },
          {
            type = "camera-effect",
            effect = "screen-burn",
            duration = 60,
            ease_in_duration = 5,
            ease_out_duration = 60,
            delay = 0,
            strength = 6,
            full_strength_max_distance = 200,
            max_distance = 800
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion(0.9),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
            -- volume_modifier = 1,
            audible_distance_modifier = 3
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
            -- volume_modifier = 1,
            audible_distance_modifier = 3
          },
          {
            type = "damage",
            damage = {amount = 400, type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "huge-scorchmark",
            check_buildability = true,
          },
          {
            type = "invoke-tile-trigger",
            repeat_count = 1,
          },
          {
            type = "destroy-decoratives",
            include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
            include_decals = true,
            invoke_decorative_trigger = true,
            decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
            radius = 14 -- large radius for demostrative purposes
          },
          {
            type = "create-decorative",
            decorative = "nuclear-ground-patch",
            spawn_min_radius = 11.5,
            spawn_max_radius = 12.5,
            spawn_min = 30,
            spawn_max = 40,
            apply_projection = true,
            spread_evenly = true
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 1000,
              radius = 7,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-ground-zero-projectile",
                starting_speed = 0.6 * 0.8,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 1000,
              radius = 35,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave",
                starting_speed = 0.5 * 0.7,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 1000,
              radius = 26,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                starting_speed = 0.5 * 0.7,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 700,
              radius = 4,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-fire-smoke-explosion",
                starting_speed = 0.5 * 0.65,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 1000,
              radius = 8,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
                starting_speed = 0.5 * 0.65,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 300,
              radius = 26,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-nuclear-smoke",
                starting_speed = 0.5 * 0.65,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 10,
              radius = 8,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "create-entity",
                    entity_name = "nuclear-smouldering-smoke-source",
                    tile_collision_mask = { "water-tile" }
                  }
                }
              }
            }
          }
        }
      }
    },
    light = {intensity = 0.8, size = 15},
    animation =
    {
      filename = "__base__/graphics/entity/rocket/rocket.png",
      frame_count = 8,
      line_length = 8,
      width = 9,
      height = 35,
      shift = {0, 0},
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
      frame_count = 1,
      width = 7,
      height = 24,
      priority = "high",
      shift = {0, 0}
    },
    smoke =
    {
      {
        name = "smoke-fast",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, 1},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    }
  }

})

-- check existence of pre-1.0 entities; maybe removed after 1.0
assert(data.raw["projectile"]["atomic-rocket"])
assert(data.raw["projectile"]["atomic-bomb-wave"])
assert(data.raw["trivial-smoke"]["nuclear-smoke"])

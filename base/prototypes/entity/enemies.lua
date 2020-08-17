require ("prototypes.entity.demo-spawner-animation")
require ("prototypes.entity.demo-biter-animations")
require ("prototypes.entity.demo-spitter-animations")
enemy_autoplace = require ("prototypes.entity.demo-enemy-autoplace-utils")
require ("prototypes.entity.demo-biter-ai-settings")

local hit_effects = require ("prototypes.entity.demo-hit-effects")
local sounds = require("prototypes.entity.demo-sounds")

spitter_spawner_tint = {r=0.99, g=0.09, b=0.09, a=1}

medium_biter_scale = 0.7
medium_biter_tint1 = {r=0.49, g=0.46, b=0.51, a=1}
medium_biter_tint2 = {r=0.93, g=0.72, b=0.72, a=1}

big_biter_scale = 1.0
big_biter_tint1 = {r=0.37, g=0.40, b=0.72, a=1}
big_biter_tint2 = {r=0.55, g=0.76, b=0.75, a=1}

behemoth_biter_scale = 1.2
behemoth_biter_tint1 = {r=0.21, g=0.19, b=0.25, a=1}
behemoth_biter_tint2 = {r = 0.657, g = 0.95, b = 0.432, a = 1.000}

data:extend(
{
  {
    type = "unit",
    name = "medium-biter",
    icon = "__base__/graphics/icons/medium-biter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 75,
    order="b-a-b",
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 4,
        percent = 10
      },
      {
        type = "explosion",
        percent = 10
      }
    },
    healing_per_tick = 0.01,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    attack_parameters =
    {
      type = "projectile",
      ammo_type = make_unit_melee_ammo_type(15),
      range = 1,
      cooldown = 35,
      cooldown_deviation = 0.15,
      sound = sounds.biter_roars_mid(0.73),
      animation = biterattackanimation(medium_biter_scale, medium_biter_tint1, medium_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.24,
    distance_per_frame = 0.188,
    -- in pu
    pollution_to_join_attack = 20,
    corpse = "medium-biter-corpse",
    dying_explosion = "medium-biter-die",
    working_sound = sounds.biter_calls(0.87),
    dying_sound = sounds.biter_dying(0.6),
    run_animation = biterrunanimation(medium_biter_scale, medium_biter_tint1, medium_biter_tint2),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.biter_walk(0.4),
    ai_settings = biter_ai_settings,
    water_reflection = biter_water_reflection(medium_biter_scale)
  },

  {
    type = "unit",
    name = "big-biter",
    order="b-a-c",
    icon = "__base__/graphics/icons/big-biter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 375,
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 8,
        percent = 10
      },
      {
        type = "explosion",
        percent = 10
      }
    },
    spawning_time_modifier = 3,
    healing_per_tick = 0.02,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.6, -0.8}, {0.6, 0}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    attack_parameters =
    {
      type = "projectile",
      range = 1.5,
      cooldown = 35,
      cooldown_deviation = 0.15,
      ammo_type = make_unit_melee_ammo_type(30),
      sound =  sounds.biter_roars_big(0.37),
      animation = biterattackanimation(big_biter_scale, big_biter_tint1, big_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.23,
    distance_per_frame = 0.30,
    -- in pu
    pollution_to_join_attack = 80,
    corpse = "big-biter-corpse",
    dying_explosion = "big-biter-die",
    working_sound = sounds.biter_calls_big(0.67),
    dying_sound = sounds.biter_dying_big(0.45),
    run_animation = biterrunanimation(big_biter_scale, big_biter_tint1, big_biter_tint2),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.biter_walk_big(0.7),
    ai_settings = biter_ai_settings,
    water_reflection = biter_water_reflection(big_biter_scale)
  },

  {
    type = "unit",
    name = "behemoth-biter",
    order="b-a-d",
    icon = "__base__/graphics/icons/behemoth-biter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 3000,
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 12,
        percent = 10
      },
      {
        type = "explosion",
        decrease = 12,
        percent = 10
      }
    },
    spawning_time_modifier = 12,
    healing_per_tick = 0.1,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.6, -0.8}, {0.6, 0}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    attack_parameters =
    {
      type = "projectile",
      range = 1.5,
      cooldown = 50,
      cooldown_deviation = 0.15,
      ammo_type = make_unit_melee_ammo_type(90),
      sound =  sounds.biter_roars_behemoth(0.65),
      animation = biterattackanimation(behemoth_biter_scale, behemoth_biter_tint1, behemoth_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.3,
    distance_per_frame = 0.32,
    -- in pu
    pollution_to_join_attack = 400,
    corpse = "behemoth-biter-corpse",
    dying_explosion = "behemoth-biter-die",
    working_sound = sounds.biter_calls_behemoth(0.97),
    dying_sound = sounds.biter_dying_big(0.52),
    run_animation = biterrunanimation(behemoth_biter_scale, behemoth_biter_tint1, behemoth_biter_tint2),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.biter_walk_big(0.78),
    ai_settings = biter_ai_settings,
    water_reflection = biter_water_reflection(behemoth_biter_scale)
  },

  {
    type = "unit",
    name = "small-spitter",
    icon = "__base__/graphics/icons/small-spitter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 10,
    order="b-b-a",
    subgroup="enemies",
    resistances = {},
    healing_per_tick = 0.01,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,

    alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
    attack_parameters = spitter_attack_parameters(
    {
      acid_stream_name = "acid-stream-spitter-small",
      range = range_spitter_small,
      min_attack_distance = 10,
      cooldown = 100,
      cooldown_deviation = 0.15,
      damage_modifier = damage_modifier_spitter_small,
      scale = scale_spitter_small,
      tint1 = tint_1_spitter_small,
      tint2 = tint_2_spitter_small,
      roarvolume = 0.4
    }),
    vision_distance = 30,
    movement_speed = 0.185,

    distance_per_frame = 0.04,
    -- in pu
    pollution_to_join_attack = 4,
    corpse = "small-spitter-corpse",
    dying_explosion = "small-spitter-die",
    working_sound = sounds.spitter_calls(0.44),
    dying_sound = sounds.spitter_dying(0.45),
    run_animation = spitterrunanimation(scale_spitter_small, tint_1_spitter_small, tint_2_spitter_small),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.spitter_walk(0.3),
    ai_settings = biter_ai_settings,
    water_reflection = spitter_water_reflection(scale_spitter_small)
  },

  {
    type = "unit",
    name = "medium-spitter",
    icon = "__base__/graphics/icons/medium-spitter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 50,
    order="b-b-b",
    subgroup="enemies",
    resistances =
    {
      {
        type = "explosion",
        percent = 10
      }
    },
    healing_per_tick = 0.01,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.7}, {0.5, 0.7}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
    attack_parameters = spitter_mid_attack_parameters(
    {
      acid_stream_name = "acid-stream-spitter-medium",
      range = range_spitter_medium,
      min_attack_distance = 10,
      cooldown = 100,
      cooldown_deviation = 0.15,
      damage_modifier = damage_modifier_spitter_medium,
      scale = scale_spitter_medium,
      tint1 = tint_1_spitter_medium,
      tint2 = tint_2_spitter_medium,
      roarvolume = 0.5
    }),
    vision_distance = 30,
    movement_speed = 0.165,
    distance_per_frame = 0.055,
    -- in pu
    pollution_to_join_attack = 12,
    corpse = "medium-spitter-corpse",
    dying_explosion = "medium-spitter-die",
    working_sound = sounds.spitter_calls_med(0.53),
    dying_sound = sounds.spitter_dying_mid(0.65),
    run_animation = spitterrunanimation(scale_spitter_medium, tint_1_spitter_medium, tint_2_spitter_medium),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.spitter_walk(0.6),
    ai_settings = biter_ai_settings,
    water_reflection = spitter_water_reflection(scale_spitter_medium)
  },

  {
    type = "unit",
    name = "big-spitter",
    icon = "__base__/graphics/icons/big-spitter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 200,
    order="b-b-c",
    subgroup="enemies",
    resistances =
    {
      {
        type = "explosion",
        percent = 15
      }
    },
    spawning_time_modifier = 3,
    healing_per_tick = 0.01,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
    attack_parameters = spitter_big_attack_parameters(
    {
      acid_stream_name = "acid-stream-spitter-big",
      range = range_spitter_big,
      min_attack_distance = 10,
      cooldown = 100,
      cooldown_deviation = 0.15,
      damage_modifier = damage_modifier_spitter_big,
      scale = scale_spitter_big,
      tint1 = tint_1_spitter_big,
      tint2 = tint_2_spitter_big,
      roarvolume = 0.6
    }),
    vision_distance = 30,
    movement_speed = 0.15,
    distance_per_frame = 0.07,
    -- in pu
    pollution_to_join_attack = 30,
    corpse = "big-spitter-corpse",
    dying_explosion = "big-spitter-die",
    working_sound = sounds.spitter_calls_big(0.46),
    dying_sound = sounds.spitter_dying_big(0.71),
    run_animation = spitterrunanimation(scale_spitter_big, tint_1_spitter_big, tint_2_spitter_big),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.spitter_walk_big(0.5),
    ai_settings = biter_ai_settings,
    water_reflection = spitter_water_reflection(scale_spitter_big)
  },

  scale_worm_behemoth = 1.2,
  tint_worm_behemoth = {r=0.53, g=0.89, b=0.61, a=1},

  {
    type = "unit",
    name = "behemoth-spitter",
    icon = "__base__/graphics/icons/behemoth-spitter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 1500,
    order="b-b-d",
    subgroup="enemies",
    resistances =
    {
      {
        type = "explosion",
        percent = 30
      }
    },
    spawning_time_modifier = 12,
    healing_per_tick = 0.1,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
    attack_parameters = spitter_behemoth_attack_parameters(
    {
      acid_stream_name = "acid-stream-spitter-behemoth",
      range = range_spitter_behemoth,
      min_attack_distance = 10,
      cooldown = 100,
      cooldown_deviation = 0.15,
      damage_modifier = damage_modifier_spitter_behemoth,
      scale = scale_spitter_behemoth,
      tint1 = tint_1_spitter_behemoth,
      tint2 = tint_2_spitter_behemoth,
      roarvolume = 0.8
    }),
    vision_distance = 30,
    movement_speed = 0.15,
    distance_per_frame = 0.084,
    pollution_to_join_attack = 200,
    corpse = "behemoth-spitter-corpse",
    dying_explosion = "behemoth-spitter-die",
    working_sound = sounds.spitter_calls_big(0.6),
    dying_sound = sounds.spitter_dying_behemoth(0.70),
    run_animation = spitterrunanimation(scale_spitter_behemoth, tint_1_spitter_behemoth, tint_2_spitter_behemoth),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.spitter_walk_big(0.6),
    ai_settings = biter_ai_settings,
    water_reflection = spitter_water_reflection(scale_spitter_behemoth)
  },

  add_biter_die_animation(medium_biter_scale, medium_biter_tint1, medium_biter_tint2,
  {
    type = "corpse",
    name = "medium-biter-corpse",
    icon = "__base__/graphics/icons/medium-biter-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-a[biter]-b[medium]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"}
  }),

  add_biter_die_animation(big_biter_scale, big_biter_tint1, big_biter_tint2,
  {
    type = "corpse",
    name = "big-biter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-a[biter]-c[big]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"}
  }),

  add_biter_die_animation(behemoth_biter_scale, behemoth_biter_tint1, behemoth_biter_tint2,
  {
    type = "corpse",
    name = "behemoth-biter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-a[biter]-c[big]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"}
  }),

  add_spitter_die_animation(scale_spitter_small, tint_1_spitter_small, tint_2_spitter_small,
  {
    type = "corpse",
    name = "small-spitter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-b[spitter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
  }),

  add_spitter_die_animation(scale_spitter_medium, tint_1_spitter_medium, tint_2_spitter_medium,
  {
    type = "corpse",
    name = "medium-spitter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-b[spitter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
  }),

  add_spitter_die_animation(scale_spitter_big, tint_1_spitter_big, tint_2_spitter_big,
  {
    type = "corpse",
    name = "big-spitter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-b[spitter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
  }),

  add_spitter_die_animation(scale_spitter_behemoth, tint_1_spitter_behemoth, tint_2_spitter_behemoth,
  {
    type = "corpse",
    name = "behemoth-spitter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-b[spitter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
  }),

  {
    type = "unit-spawner",
    name = "spitter-spawner",
    icon = "__base__/graphics/icons/spitter-spawner.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 350,
    order="b-d-b",
    subgroup="enemies",
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/creatures/spawner-spitter.ogg",
          volume = 0.6
        }
      },
    },
    dying_sound =
    {
      {
        filename = "__base__/sound/creatures/spawner-death-1.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/creatures/spawner-death-2.ogg",
        volume = 1.0
      }
    },
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
    healing_per_tick = 0.02,
    collision_box = {{-3.2, -2.2}, {2.2, 2.2}},
    map_generator_bounding_box = {{-4.2, -3.2}, {3.2, 3.2}},
    selection_box = {{-3.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.biter(),
    pollution_absorption_absolute = 20,
    pollution_absorption_proportional = 0.01,
    corpse = "spitter-spawner-corpse",
    dying_explosion = "spitter-spawner-die",
    max_count_of_owned_units = 7,
    max_friends_around_to_spawn = 5,
    animations =
    {
      spawner_idle_animation(0, spitter_spawner_tint),
      spawner_idle_animation(1, spitter_spawner_tint),
      spawner_idle_animation(2, spitter_spawner_tint),
      spawner_idle_animation(3, spitter_spawner_tint)
    },
    integration = spawner_integration(),
    result_units = (function()
                     local res = {}
                     res[1] = {"small-biter", {{0.0, 0.3}, {0.35, 0}}}
                     res[2] = {"small-spitter", {{0.25, 0.0}, {0.5, 0.3}, {0.7, 0.0}}}
                     res[3] = {"medium-spitter", {{0.4, 0.0}, {0.7, 0.3}, {0.9, 0.1}}}
                     res[4] = {"big-spitter", {{0.5, 0.0}, {1.0, 0.4}}}
                     res[5] = {"behemoth-spitter", {{0.9, 0.0}, {1.0, 0.3}}}
                     return res
                   end)(),
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {360, 150},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    -- distance_factor used to be 1, but Twinsen says:
    -- "The number or spitter spwners should be roughly equal to the number of biter spawners(regardless of difficulty)."
    -- (2018-12-07)
    autoplace = enemy_autoplace.enemy_spawner_autoplace(0),
    call_for_help_radius = 50,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "light-mud-decal",
        spawn_min = 0,
        spawn_max = 2,
        spawn_min_radius = 2,
        spawn_max_radius = 5,
      },
      {
        decorative = "dark-mud-decal",
        spawn_min = 0,
        spawn_max = 3,
        spawn_min_radius = 2,
        spawn_max_radius = 6,
      },
      {
        decorative = "enemy-decal",
        spawn_min = 3,
        spawn_max = 5,
        spawn_min_radius = 2,
        spawn_max_radius = 7,
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 4,
        spawn_max = 20,
        spawn_min_radius = 2,
        spawn_max_radius = 14,
        radius_curve = 0.9
      },
      {
        decorative = "muddy-stump",
        spawn_min = 2,
        spawn_max = 5,
        spawn_min_radius = 3,
        spawn_max_radius = 6,
      },
      {
        decorative = "red-croton",
        spawn_min = 2,
        spawn_max = 8,
        spawn_min_radius = 3,
        spawn_max_radius = 6,
      },
      {
        decorative = "red-pita",
        spawn_min = 1,
        spawn_max = 5,
        spawn_min_radius = 3,
        spawn_max_radius = 6,
      },
      {
        decorative = "lichen-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 2,
        spawn_max_radius = 7
      },
    }
  },

  {
    type = "corpse",
    name = "spitter-spawner-corpse",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/biter-spawner-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    collision_box = {{-2, -2}, {2, 2}},
    selection_box = {{-2, -2}, {2, 2}},
    selectable_in_game = false,
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    subgroup="corpses",
    order = "c[corpse]-c[spitter-spawner]",
    final_render_layer = "remnants",
    animation =
    {
      spawner_die_animation(0, spitter_spawner_tint),
      spawner_die_animation(1, spitter_spawner_tint),
      spawner_die_animation(2, spitter_spawner_tint),
      spawner_die_animation(3, spitter_spawner_tint)
    },
    ground_patch =
    {
      sheet = spawner_integration()
    }
  }
})

require ("prototypes.entity.demo-spawner-animation")
require ("prototypes.entity.demo-biter-animations")
require ("prototypes.entity.demo-enemy-sounds")
require ("prototypes.entity.spitter-animations")

spitter_spawner_tint = {r=0.99, g=0.09, b=0.09, a=1}

function spitterattackparameters(data)
  return
  {
    type = "projectile",
    ammo_category = "rocket",
    cooldown = data.cooldown,
    range = data.range,
    projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    ammo_type =
    {
      category = "biological",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "acid-projectile-purple",
          starting_speed = 0.5
        }
      }
    },
    sound = make_spitter_roars(data.roarvolume),
    animation = spitterattackanimation(data.scale, data.tint),
  }
end

smallspitterscale = 0.5
smallspittertint =  {r=0.68, g=0.4, b=0, a=1}

mediumspitterscale = 0.7
mediumspittertint =  {r=0.83, g=0.39, b=0.36, a=0.75}

bigspitterscale = 1
bigspittertint = {r=0.54, g=0.58, b=0.85, a=0.6}

behemothspitterscale = 1.2
behemothspittertint = {r=0.3, g=0.9, b=0.3, a=0.75}

mediumbiterscale = 0.7
medium_biter_tint1 = {r=0.78, g=0.15, b=0.15, a=0.6}
medium_biter_tint2 = {r=0.9, g=0.3, b=0.3, a=0.75}

bigbiterscale = 1.0
big_biter_tint1 = {r=0.34, g=0.68, b=0.90, a=0.6}
big_biter_tint2 = {r=0.31, g=0.61, b=0.95, a=0.85}

behemothbiterscale = 1.2
behemoth_biter_tint1 = {r=0.3, g=0.9, b=0.3, a=0.75}
behemoth_biter_tint2 = {r=0.88, g=0.24, b=0.24, a=0.9}

data:extend(
{
  {
    type = "unit",
    name = "medium-biter",
    icon = "__base__/graphics/icons/medium-biter.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 75,
    order="b-b-b",
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 4,
      },
      {
        type = "explosion",
        percent = 10
      }
    },
    healing_per_tick = 0.01,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(15),
      range = 1,
      cooldown = 35,
      sound = make_biter_roars(0.7),
      animation = biterattackanimation(mediumbiterscale, medium_biter_tint1, medium_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.185,
    distance_per_frame = 0.15,
    -- in pu
    pollution_to_join_attack = 1000,
    corpse = "medium-biter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.8),
    dying_sound = make_biter_dying_sounds(1.0),
    run_animation = biterrunanimation(mediumbiterscale, medium_biter_tint1, medium_biter_tint2)
  },

  {
    type = "unit",
    name = "big-biter",
    order="b-b-c",
    icon = "__base__/graphics/icons/big-biter.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 375,
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 8,
      },
      {
        type = "explosion",
        percent = 10
      }
    },
    spawning_time_modifier = 2,
    healing_per_tick = 0.02,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    sticker_box = {{-0.6, -0.8}, {0.6, 0}},
    distraction_cooldown = 300,
    attack_parameters =
    {
      type = "projectile",
      range = 1.5,
      cooldown = 35,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(30),
      sound =  make_biter_roars(0.6),
      animation = biterattackanimation(bigbiterscale, big_biter_tint1, big_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.17,
    distance_per_frame = 0.2,
    -- in pu
    pollution_to_join_attack = 4000,
    corpse = "big-biter-corpse",
    dying_explosion = "blood-explosion-big",
    working_sound = make_biter_calls(0.9),
    dying_sound = make_biter_dying_sounds(1.0),
    run_animation = biterrunanimation(bigbiterscale, big_biter_tint1, big_biter_tint2)
  },

  {
    type = "unit",
    name = "behemoth-biter",
    order="b-b-d",
    icon = "__base__/graphics/icons/behemoth-biter.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 5000,
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 8,
        percent = 20
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 20
      }
    },
    spawning_time_modifier = 8,
    healing_per_tick = 0.1,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    sticker_box = {{-0.6, -0.8}, {0.6, 0}},
    distraction_cooldown = 300,
    attack_parameters =
    {
      type = "projectile",
      range = 1.5,
      cooldown = 50,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(100),
      sound =  make_biter_roars(0.8),
      animation = biterattackanimation(behemothbiterscale, behemoth_biter_tint1, behemoth_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.17,
    distance_per_frame = 0.2,
    -- in pu
    pollution_to_join_attack = 20000,
    corpse = "behemoth-biter-corpse",
    dying_explosion = "blood-explosion-big",
    working_sound = make_biter_calls(1.2),
    dying_sound = make_biter_dying_sounds(1.0),
    run_animation = biterrunanimation(behemothbiterscale, behemoth_biter_tint1, behemoth_biter_tint2)
  },

  {
    type = "unit",
    name = "small-spitter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 10,
    order="b-b-d",
    subgroup="enemies",
    healing_per_tick = 0.01,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = spitterattackparameters({range=15,
                                                 cooldown=100,
                                                 damage_modifier=1,
                                                 scale=smallspitterscale,
                                                 tint=smallspittertint,
                                                 roarvolume=0.7}),
    vision_distance = 30,
    movement_speed = 0.185,
    distance_per_frame = 0.04,
    -- in pu
    pollution_to_join_attack = 200,
    corpse = "small-spitter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.65),
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(smallspitterscale, smallspittertint)
  },

  {
    type = "unit",
    name = "medium-spitter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 50,
    order="b-b-e",
    subgroup="enemies",
    resistances =
    {
      {
        type = "explosion",
        percent = 15
      }
    },
    healing_per_tick = 0.01,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.7}, {0.5, 0.7}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = spitterattackparameters({range=15,
                                                 cooldown=100,
                                                 damage_modifier=2,
                                                 scale=mediumspitterscale,
                                                 tint=mediumspittertint,
                                                 roarvolume=0.85}),
    vision_distance = 30,
    movement_speed = 0.165,
    distance_per_frame = 0.055,
    -- in pu
    pollution_to_join_attack = 600,
    corpse = "medium-spitter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.75),
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(mediumspitterscale, mediumspittertint)
  },

  {
    type = "unit",
    name = "big-spitter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 200,
    order="b-b-f",
    subgroup="enemies",
    resistances =
    {
      {
        type = "explosion",
        percent = 30
      }
    },
    spawning_time_modifier = 2,
    healing_per_tick = 0.01,
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = spitterattackparameters({range=15,
                                                 cooldown=100,
                                                 damage_modifier=3,
                                                 scale=bigspitterscale,
                                                 tint=bigspittertint,
                                                 roarvolume=0.95}),
    vision_distance = 30,
    movement_speed = 0.15,
    distance_per_frame = 0.07,
    -- in pu
    pollution_to_join_attack = 1500,
    corpse = "big-spitter-corpse",
    dying_explosion = "blood-explosion-big",
    working_sound = make_biter_calls(0.9),
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(bigspitterscale, bigspittertint)
  },

  {
    type = "unit",
    name = "behemoth-spitter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 2000,
    order="b-b-f",
    subgroup="enemies",
    resistances =
    {
      {
        type = "explosion",
        percent = 35
      }
    },
    spawning_time_modifier = 8,
    healing_per_tick = 0.1,
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = spitterattackparameters({range=15,
                                                 cooldown=100,
                                                 damage_modifier=5,
                                                 scale=behemothspitterscale,
                                                 tint=behemothspittertint}),
    vision_distance = 30,
    movement_speed = 0.15,
    distance_per_frame = 0.084,
    pollution_to_join_attack = 10000,
    corpse = "behemoth-spitter-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(behemothspitterscale, behemothspittertint)
  },

  {
    type = "corpse",
    name = "medium-biter-corpse",
    icon = "__base__/graphics/icons/medium-biter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
    subgroup="corpses",
    order = "c[corpse]-a[biter]-b[medium]",
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = biterdieanimation(mediumbiterscale, medium_biter_tint1, medium_biter_tint2)
  },

  {
    type = "corpse",
    name = "big-biter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-a[biter]-c[big]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = biterdieanimation(bigbiterscale, big_biter_tint1, big_biter_tint2)
  },

  {
    type = "corpse",
    name = "behemoth-biter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-a[biter]-c[big]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
    dying_speed = 0.02,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = biterdieanimation(behemothbiterscale, behemoth_biter_tint1, behemoth_biter_tint2)
  },

  {
    type = "corpse",
    name = "small-spitter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-b[spitter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = spitterdyinganimation(smallspitterscale, smallspittertint),
  },

  {
    type = "corpse",
    name = "medium-spitter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-b[spitter]-b[medium]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = spitterdyinganimation(mediumspitterscale, mediumspittertint),
  },

  {
    type = "corpse",
    name = "big-spitter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    selectable_in_game = false,
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.7, -1}, {0.7, 1}},
    subgroup="corpses",
    order = "c[corpse]-b[spitter]-c[big]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = spitterdyinganimation(bigspitterscale, bigspittertint),
  },

  {
    type = "corpse",
    name = "behemoth-spitter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    selectable_in_game = false,
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.7, -1}, {0.7, 1}},
    subgroup="corpses",
    order = "c[corpse]-b[spitter]-d[behemoth]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = spitterdyinganimation(behemothspitterscale, behemothspittertint),
  },

  {
    type = "unit-spawner",
    name = "spitter-spawner",
    icon = "__base__/graphics/icons/biter-spawner.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 350,
    order="b-b-h",
    subgroup="enemies",
    working_sound = {
      sound =
      {
        {
          filename = "__base__/sound/creatures/spawner.ogg",
          volume = 1.0
        }
      },
      apparent_volume = 2
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
      },
      {
        type = "explosion",
        decrease = 5,
        percent = 15,
      }
    },
    healing_per_tick = 0.02,
    collision_box = {{-3.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-3.5, -2.5}, {2.5, 2.5}},
    pollution_absorbtion_absolute = 20,
    pollution_absorbtion_proportional = 0.01,
    corpse = "spitter-spawner-corpse",
    dying_explosion = "blood-explosion-huge",
    loot =
    {
      {
        count_max = 15,
        count_min = 5,
        item = "alien-artifact",
        probability = 1
      }
    },
    max_count_of_owned_units = 7,
    max_friends_around_to_spawn = 5,
    animations =
    {
      spawner_idle_animation(0, spitter_spawner_tint),
      spawner_idle_animation(1, spitter_spawner_tint),
      spawner_idle_animation(2, spitter_spawner_tint),
      spawner_idle_animation(3, spitter_spawner_tint)
    },

    result_units = (function()
                     local res = {}
                     res[1] = {"small-biter", {{0.0, 0.3}, {0.35, 0}}}
                     res[2] = {"small-spitter", {{0.25, 0.0}, {0.5, 0.3}, {0.7, 0.0}}}
                     res[3] = {"medium-spitter", {{0.5, 0.0}, {0.7, 0.3}, {0.9, 0.1}}}
                     res[4] = {"big-spitter", {{0.6, 0.0}, {1.0, 0.4}}}
                     res[5] = {"behemoth-spitter", {{0.99, 0.0}, {1.0, 0.3}}}
                     return res
                   end)(),
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {360, 150},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    autoplace =
    {
      sharpness = 0.4,
      control = "enemy-base",
      order = "b[enemy]-a[spitter-spawner]",
      richness_multiplier = 1,
      richness_base = 0,
      force = "enemy",
      peaks =
      {
        {
          influence = 0,
          richness_influence = 100,
          tier_from_start_optimal = 20,
          tier_from_start_top_property_limit = 20,
          tier_from_start_max_range = 40,
        },
        {
          influence = -10.0,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = 0.42,
          noise_layer = "enemy-base",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
        },
        -- increase the size when moving further away
        {
          influence = 0.55,
          noise_layer = "enemy-base",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
          tier_from_start_optimal = 20,
          tier_from_start_top_property_limit = 20,
          tier_from_start_max_range = 40,
        },
      }
    }
  },

  {
    type = "corpse",
    name = "spitter-spawner-corpse",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map", "not-on-map"},
    icon = "__base__/graphics/icons/biter-spawner-corpse.png",
    collision_box = {{-2, -2}, {2, 2}},
    selection_box = {{-2, -2}, {2, 2}},
    selectable_in_game = false,
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    subgroup="corpses",
    order = "c[corpse]-c[spitter-spawner]",
    final_render_layer = "corpse",
    animation =
    {
      spawner_die_animation(0, spitter_spawner_tint),
      spawner_die_animation(1, spitter_spawner_tint),
      spawner_die_animation(2, spitter_spawner_tint),
      spawner_die_animation(3, spitter_spawner_tint)
    }
  },
})

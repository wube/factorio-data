require ("prototypes.entity.demo-spawner-animation")
require ("prototypes.entity.demo-biter-animations")
require ("prototypes.entity.spitter-animations")

spitter_spawner_tint = {r=0.99, g=0.09, b=0.09, a=1}

function enemydyingsound()
  return
  {
    {
      filename = "__base__/sound/creatures/creeper-death-1.ogg",
      volume = 0.7
    },
    {
      filename = "__base__/sound/creatures/creeper-death-2.ogg",
      volume = 0.7
    },
    {
      filename = "__base__/sound/creatures/creeper-death-3.ogg",
      volume = 0.7
    },
    {
      filename = "__base__/sound/creatures/creeper-death-4.ogg",
      volume = 0.7
    }
  }
end

function spitterattackparameters(data)
  return
  {
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
    animation = spitterattackanimation(data.scale, data.tint),
  }
end

smallspitterscale = 0.5
smallspittertint =  {r=0.68, g=0.4, b=0, a=1}

mediumspitterscale = 0.7
mediumspittertint =  {r=0.83, g=0.39, b=0.36, a=0.75}

bigspitterscale = 1
bigspittertint = {r=0.54, g=0.58, b=0.85, a=0.6}

mediumbiterscale = 0.7
medium_biter_tint1 = {r=0.78, g=0.15, b=0.15, a=0.6}
medium_biter_tint2 = {r=0.9, g=0.3, b=0.3, a=0.75}

bigbiterscale = 1.0
big_biter_tint1 = {r=0.34, g=0.68, b=0.90, a=0.6}
big_biter_tint2 = {r=0.31, g=0.61, b=0.95, a=0.85}

data:extend(
{
  {
    type = "unit",
    name = "medium-biter",
    icon = "__base__/graphics/icons/creeper.png",
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
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(15),
      range = 1,
      cooldown = 35,
      sound =
      {
        {
          filename = "__base__/sound/creatures/biter-roar-medium-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/creatures/biter-roar-medium-2.ogg",
          volume = 0.8
        }
      },
      animation = biterattackanimation(mediumbiterscale, medium_biter_tint1, medium_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.185,
    distance_per_frame = 0.15,
    -- in pu
    pollution_to_join_attack = 1000,
    corpse = "medium-biter-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound = enemydyingsound(),
    run_animation = biterrunanimation(mediumbiterscale, medium_biter_tint1, medium_biter_tint2)
  },

  {
    type = "unit",
    name = "big-biter",
    order="b-b-c",
    icon = "__base__/graphics/icons/creeper.png",
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
    healing_per_tick = 0.02,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    sticker_box = {{-0.6, -0.8}, {0.6, 0}},
    distraction_cooldown = 300,
    attack_parameters =
    {
      range = 1.5,
      cooldown = 35,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(30),
      sound =
      {
        {
          filename = "__base__/sound/creatures/biter-roar-long-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/creatures/biter-roar-long-2.ogg",
          volume = 0.8
        }
      },
      animation = biterattackanimation(bigbiterscale, big_biter_tint1, big_biter_tint2)
    },
    vision_distance = 30,
    movement_speed = 0.17,
    distance_per_frame = 0.2,
    -- in pu
    pollution_to_join_attack = 1000,
    corpse = "big-biter-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = enemydyingsound(),
    run_animation = biterrunanimation(bigbiterscale, big_biter_tint1, big_biter_tint2)
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
                                                 tint=smallspittertint}),
    vision_distance = 30,
    movement_speed = 0.185,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 200,
    corpse = "small-spitter-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound = enemydyingsound(),
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
    attack_parameters = spitterattackparameters({range=17,
                                                 cooldown=100,
                                                 damage_modifier=2,
                                                 scale=mediumspitterscale,
                                                 tint=mediumspittertint}),
    vision_distance = 30,
    movement_speed = 0.165,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 600,
    corpse = "medium-spitter-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound = enemydyingsound(),
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
    healing_per_tick = 0.01,
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = spitterattackparameters({range=20,
                                                 cooldown=100,
                                                 damage_modifier=3,
                                                 scale=bigspitterscale,
                                                 tint=bigspittertint}),
    vision_distance = 30,
    movement_speed = 0.15,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 600,
    corpse = "big-spitter-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = enemydyingsound(),
    run_animation = spitterrunanimation(bigspitterscale, bigspittertint)
  },

  {
    type = "corpse",
    name = "medium-biter-corpse",
    icon = "__base__/graphics/icons/medium-biter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way"},
    subgroup="corpses",
    order = "c[corpse]-a[biter]-b[medium]",
    dying_speed = 0.04,
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
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way"},
    dying_speed = 0.04,
    final_render_layer = "corpse",
    animation = biterdieanimation(bigbiterscale, big_biter_tint1, big_biter_tint2)
  },

  {
    type = "corpse",
    name = "small-spitter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup="corpses",
    order = "c[corpse]-b[spitter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way"},
    dying_speed = 0.04,
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
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way"},
    dying_speed = 0.04,
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
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way"},
    dying_speed = 0.04,
    final_render_layer = "corpse",
    animation = spitterdyinganimation(bigspitterscale, bigspittertint),
  },

  {
    type = "unit-spawner",
    name = "spitter-spawner",
    icon = "__base__/graphics/icons/biter-spawner.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 350,
    order="b-b-h",
    subgroup="enemies",
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
    -- in ticks per 1 pu
    pollution_cooldown = 10,
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
                     res[1] = {unit = "small-biter", spawn_points = {{evolution_factor=0, spawn_weight=0.3},
                                                                     {evolution_factor=0.25, spawn_weight=0}}}
                     res[2] = {"small-spitter", {{0.25, 0.3}}}
                     res[3] = {"medium-spitter", {{0.5, 0.0}, {0.7, 0.3}}}
                     res[4] = {"big-spitter", {{0.6, 0.0}, {1.0, 0.4}}}
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
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/biter-spawner-corpse.png",
    collision_box = {{-2, -2}, {2, 2}},
    selection_box = {{-2, -2}, {2, 2}},
    selectable_in_game = false,
    dying_speed = 0.04,
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

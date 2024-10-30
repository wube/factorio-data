require("sound-util")
local sounds = {}

--asteroid collisions into space platform
sounds.asteroid_collision_carbonic_small =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-collision-carbonic-small", 6, 0.3),
    aggregation = {max_count = 3, remove = true, count_already_playing = true},
    audible_distance_modifier = 0.75
  }
sounds.asteroid_collision_metallic_small =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-collision-metallic-small", 7, 0.3),
    aggregation = {max_count = 3, remove = true, count_already_playing = true},
    audible_distance_modifier = 0.75
  }
  sounds.asteroid_collision_interstellar_small =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-collision-interstellar-small", 6, 0.3),
    aggregation = {max_count = 3, remove = true, count_already_playing = true},
    audible_distance_modifier = 0.75
  }
  sounds.asteroid_collision_oxide_small =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-collision-oxide-small", 6, 0.25),
    aggregation = {max_count = 3, remove = true, count_already_playing = true},
    audible_distance_modifier = 0.75
  }
-- asteroids take damage
sounds.asteroid_damage_metallic_small =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-metallic-small", 6, 0.5),
    aggregation = {max_count = 3, remove = true, count_already_playing = true},
    audible_distance_modifier = 0.75
  }
  sounds.asteroid_damage_metallic_medium =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-metallic-medium", 5, 0.45),
    aggregation = {max_count = 3, remove = true, count_already_playing = true},
  }
  sounds.asteroid_damage_metallic_big =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-metallic-big", 7, 0.5),
    aggregation = {max_count = 2, remove = true, count_already_playing = true},
  }
  sounds.asteroid_damage_metallic_huge =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-metallic-huge", 3, 0.7),
    aggregation = {max_count = 2, remove = true, count_already_playing = true},
    audible_distance_modifier = 2
  }
  sounds.asteroid_damage_carbonic_small =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-carbonic-small", 7, 0.4),
    aggregation = {max_count = 3, remove = true, count_already_playing = true},
  }
  sounds.asteroid_damage_carbonic_medium =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-carbonic-medium", 7, 0.5),
    aggregation = {max_count = 3, remove = true, count_already_playing = true},
  }
  sounds.asteroid_damage_carbonic_big =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-carbonic-big", 5, 0.5),
    aggregation = {max_count = 2, remove = true, count_already_playing = true},
  }
  sounds.asteroid_damage_carbonic_huge =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-carbonic-huge", 4, 0.7),
    aggregation = {max_count = 2, remove = true, count_already_playing = true},
    audible_distance_modifier = 2
  }
  sounds.asteroid_damage_oxide_small =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-oxide-small", 7, 0.3),
    aggregation = {max_count = 3, remove = true, count_already_playing = true},
    audible_distance_modifier = 0.7
  }
  sounds.asteroid_damage_oxide_medium =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-oxide-medium", 6, 0.5),
    aggregation = {max_count = 3, remove = true, count_already_playing = true},
  }
  sounds.asteroid_damage_oxide_big =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-oxide-big", 6, 0.5),
    aggregation = {max_count = 2, remove = true, count_already_playing = true},
  }
  sounds.asteroid_damage_oxide_huge =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-oxide-huge", 4, 0.9),
    aggregation = {max_count = 2, remove = true, count_already_playing = true},
    audible_distance_modifier = 2
  }
  sounds.asteroid_damage_interstellar_small =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-interstellar-small", 7, 0.3),
    aggregation = {max_count = 3, remove = true, count_already_playing = true},
    audible_distance_modifier = 0.7
  }
  sounds.asteroid_damage_interstellar_medium =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-interstellar-medium", 6, 0.5),
    aggregation = {max_count = 3, remove = true, count_already_playing = true},
  }
  sounds.asteroid_damage_interstellar_big =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-interstellar-big", 6, 0.5),
    aggregation = {max_count = 2, remove = true, count_already_playing = true},
  }
  sounds.asteroid_damage_interstellar_huge =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-interstellar-huge", 4, 0.9),
    aggregation = {max_count = 2, remove = true, count_already_playing = true},
    audible_distance_modifier = 2
  }

sounds.electromagnetic_plant =
{
  main_sounds =
  {
    {
      sound = {filename = "__space-age__/sound/entity/electromagnetic-plant/electromagnetic-plant-warmup.ogg", volume = 0.6},
      play_for_working_visualisations = {"warm-up"},
    },
    {
      sound = {filename = "__space-age__/sound/entity/electromagnetic-plant/electromagnetic-plant-loop.ogg", volume = 0.6},
      play_for_working_visualisations = {"rotation", "rotation-continue"},
      fade_in_ticks = 4,
      fade_out_ticks = 20,
    },
    {
      sound = {filename = "__space-age__/sound/entity/electromagnetic-plant/electromagnetic-plant-cooldown.ogg", volume = 0.8},
      play_for_working_visualisations = {"cool-down"},
    },
  },
  sound_accents =
  {
    {
      sound = {filename = "__space-age__/sound/entity/electromagnetic-plant/emp-arm-retract.ogg", volume = 0.35},
      play_for_working_visualisation = "warm-up",
      frame = 11,
      audible_distance_modifier = 0.4
    },
    {
      sound = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-coil", 2, 0.6),
      play_for_working_visualisation = "rotation",
      frame = 1,
      audible_distance_modifier = 0.4
    },
    {
      sound = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-coil", 2, 0.6),
      play_for_working_visualisation = "rotation",
      frame = 40,
      audible_distance_modifier = 0.4
    },
    {
      sound = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-coil", 2, 0.4),
      play_for_working_visualisation = "rotation",
      frame = 102,
      audible_distance_modifier = 0.4
    },
    {
      sound = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-riser-stop", 2, 0.6),
      play_for_working_visualisation = "rotation",
      frame = 93,
      audible_distance_modifier = 0.4
    },
    {
      sound = {filename = "__space-age__/sound/entity/electromagnetic-plant/emp-bridge-close.ogg", volume = 0.4},
      play_for_working_visualisation = "rotation",
      frame = 33,
      audible_distance_modifier = 0.4
    },
    {
      sound = {filename = "__space-age__/sound/entity/electromagnetic-plant/emp-bridge-open.ogg", volume = 0.4},
      play_for_working_visualisation = "rotation",
      frame = 50,
      audible_distance_modifier = 0.4
    },
    {
      sound = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-electric", 5, 0.4),
      play_for_working_visualisation = "rotation",
      frame = 35, --electric sparks to match bridge section close
      audible_distance_modifier = 0.4
    },
    {
      sound = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-electric", 5, 0.5),
      play_for_working_visualisation = "rotation",
      frame = 58,
      audible_distance_modifier = 0.5
    },
    {
      sound = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-slide-stop", 2, 0.4),
      play_for_working_visualisation = "rotation",
      frame = 102,
      audible_distance_modifier = 0.4
    },
    {
      sound = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-riser-stop", 2, 0.4),
      play_for_working_visualisation = "rotation-continue",
      frame = 14,
      audible_distance_modifier = 0.4
    },
    {
      sound = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-slide-stop", 2, 0.4),
      play_for_working_visualisation = "rotation-continue",
      frame = 3,
      audible_distance_modifier = 0.4
    },
    {
      sound = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-riser-stop", 2, 0.2),
      play_for_working_visualisation = "cool-down",
      frame = 31,
      audible_distance_modifier = 0.4
    },
    {
      sound = {filename = "__space-age__/sound/entity/electromagnetic-plant/emp-arm-stop.ogg", volume = 0.45},
      play_for_working_visualisation = "cool-down",
      frame = 12,
      audible_distance_modifier = 0.4
    },
    {
      sound = {filename = "__space-age__/sound/entity/electromagnetic-plant/emp-arm-extend.ogg", volume = 0.5},
      play_for_working_visualisation = "cool-down",
      frame = 1,
      audible_distance_modifier = 0.4
    },
    {
      sound = {filename = "__space-age__/sound/entity/electromagnetic-plant/emp-arm-weld.ogg", volume = 0.9},
      play_for_working_visualisation = "cool-down-lights",
      frame = 12,
      audible_distance_modifier = 0.4
    },
  },
  audible_distance_modifier = 0.6,
  max_sounds_per_type = 2
}
sounds.railgun_gunshot = sound_variations("__space-age__/sound/entity/railgun/railgun-gunshot", 5, 0.8, volume_multiplier("main-menu", 0.9))

sounds.railgun_turret_gunshot = sound_variations("__space-age__/sound/entity/railgun-turret/railgun-turret-gunshot", 5, 0.55, volume_multiplier("main-menu", 0.9))
sounds.railgun_turret_activate =
{
  variations = sound_variations("__space-age__/sound/entity/railgun-turret/railgun-turret-activate", 1, 0.7),
  aggregation = {max_count = 2, remove = true, count_already_playing = true},
  advanced_volume_control =
  {
    fades = {fade_in = {curve_type = "S-curve", from = {control = 0.5, volume_percentage = 0.0}, to = {2, 100.0}}},
  }
}
sounds.railgun_turret_deactivate =
{
  variations = sound_variations("__space-age__/sound/entity/railgun-turret/railgun-turret-deactivate", 1, 0.7),
  aggregation = {max_count = 2, remove = true, count_already_playing = true},
  advanced_volume_control =
  {
    fades = {fade_in = {curve_type = "S-curve", from = {control = 0.5, volume_percentage = 0.0}, to = {2, 100.0}}},
  }
}
sounds.railgun_turret_rotate =
{
  sound =
  {
    filename = "__space-age__/sound/entity/railgun-turret/railgun-turret-rotation-loop.ogg", volume = 0.35,
    aggregation = {max_count = 2, remove = true, count_already_playing = true},
    advanced_volume_control =
    {
      fades = {fade_in = {curve_type = "S-curve", from = {control = 0.5, volume_percentage = 0.0 }, to = {1.5, 100.0}}},
    }
  },
  minimal_change_per_tick = 0.001,
  stopped_sound = {filename = "__space-age__/sound/entity/railgun-turret/railgun-turret-rotation-stop.ogg", volume = 0.5},
  minimal_sound_duration_for_stopped_sound = 5
}
sounds.tesla_turret_rotate =
{
  sound =
  {
    filename = "__space-age__/sound/entity/tesla-turret/tesla-turret-rotation-loop.ogg", volume = 0.7,
    aggregation = {max_count = 2, remove = true, count_already_playing = true},
    advanced_volume_control =
    {
      fades = {fade_in = {curve_type = "S-curve", from = {control = 0.5, volume_percentage = 0.0 }, to = {1.5, 100.0}}},
    }
  },
  stopped_sound = {filename = "__space-age__/sound/entity/tesla-turret/tesla-turret-rotation-stop.ogg", volume = 0.7},
  minimal_change_per_tick = 0.001,
  minimal_sound_duration_for_stopped_sound = 5
}
sounds.tesla_turret_activate =
{
  filename = "__space-age__/sound/entity/tesla-turret/tesla-turret-activate.ogg", volume = 0.8,
  aggregation = {max_count = 2, remove = true, count_already_playing = true},
  advanced_volume_control =
  {
    fades = {fade_in = {curve_type = "S-curve", from = {control = 0.5, volume_percentage = 0.0}, to = {2, 100.0}}},
  }
}
sounds.tesla_turret_deactivate =
{
  filename = "__space-age__/sound/entity/tesla-turret/tesla-turret-deactivate.ogg", volume = 0.5,
  aggregation = {max_count = 2, remove = true, count_already_playing = true},
  advanced_volume_control =
  {
    fades = {fade_in = {curve_type = "S-curve", from = {control = 0.5, volume_percentage = 0.0}, to = {2, 100.0}}},
  }
}
sounds.tesla_turret_beam_deflect =
{
  variations = sound_variations("__space-age__/sound/entity/tesla-turret/tesla-turret-beam-deflection", 6, 0.6),
  aggregation = {max_count = 2, remove = true, count_already_playing = true},
  advanced_volume_control =
  {
    fades = {fade_in = {curve_type = "S-curve", from = {control = 0.5, volume_percentage = 0.5}, to = {1, 100.0}}},
  }
}
sounds.fissure_explosion =
{
  aggregation =
  {
    max_count = 2,
    remove = true
  },
  variations = sound_variations("__space-age__/sound/explosions/fissure-explosion", 5, 0.4)
}
sounds.ash_cloud_explosion =
{
  filename = "__space-age__/sound/explosions/ash-cloud-explosion.ogg",
  aggregation = {max_count = 1, remove = true, count_already_playing = true, priority = "oldest"},
  advanced_volume_control =
  {
    attenuation = "exponential",
    fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 50.0}, to = {2.0, 100.0 }}},
  },
}
sounds.demolisher =
{
  small =
  {
    roar =
    {
      category = "enemy",
      variations = sound_variations("__space-age__/sound/enemies/demolisher/demolisher-roar", 10, 0.8,volume_multiplier("main-menu", 2)),
      advanced_volume_control =
      {
        attenuation = "exponential",
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 40.0}, to = {2.0, 100.0 }}},
      },
      audible_distance_modifier = 2.5,
    },
    roar_probability = 1 / (12 * 60), -- average pause between roars is 12 seconds
    hurt_roar =
    {
      variations = sound_variations("__space-age__/sound/enemies/demolisher/demolisher-hurt-roar", 5, 1.0),
      advanced_volume_control =
      {
        attenuation = "exponential",
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 40.0}, to = {2.0, 100.0 }}},
      },
      audible_distance_modifier = 2.5,
    },
    hurt_thresholds = {0.9, 0.75, 0.5, 0.25, 0.1},

    segment_working_sound =
    {
      sound =
      {
        category = "enemy",
        filename = "__space-age__/sound/enemies/demolisher/demolisher-moves.ogg",
        volume = 0.25,
        advanced_volume_control = {attenuation = "exponential"},
      },
      max_sounds_per_type = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    tail_working_sound =
    {
      sound =
      {
        category = "enemy",
        filename = "__space-age__/sound/enemies/demolisher/demolisher-tail-rumble.ogg", volume = 0.3,
        advanced_volume_control =
        {
          attenuation = "exponential",
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 20.0}, to = {2.0, 100.0 }}},
        },
      },
      max_sounds_per_type = 2,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    dying_sound_volume_modifier = 0.6,
  },

  medium =
  {
    roar =
    {
      category = "enemy",
      variations = sound_variations("__space-age__/sound/enemies/demolisher/demolisher-roar", 10, 0.8),
      advanced_volume_control =
      {
        attenuation = "exponential",
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 50.0}, to = {2.0, 100.0 }}},
      },
      audible_distance_modifier = 2.5,
    },
    roar_probability = 1 / (12 * 60), -- average pause between roars is 12 seconds
    hurt_roar =
    {
      variations = sound_variations("__space-age__/sound/enemies/demolisher/demolisher-hurt-roar", 5, 1.0),
      advanced_volume_control =
      {
        attenuation = "exponential",
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 50.0}, to = {2.0, 100.0 }}},
      },
      audible_distance_modifier = 2.5,
    },
    hurt_thresholds = {0.9, 0.75, 0.5, 0.25, 0.1},

    segment_working_sound =
    {
      sound =
      {
        category = "enemy",
        filename = "__space-age__/sound/enemies/demolisher/demolisher-moves.ogg",
        volume = 0.4,
        advanced_volume_control = {attenuation = "exponential"},
      },
      max_sounds_per_type = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    tail_working_sound =
    {
      sound =
      {
        category = "enemy",
        filename = "__space-age__/sound/enemies/demolisher/demolisher-tail-rumble.ogg", volume = 0.3,
        advanced_volume_control =
        {
          attenuation = "exponential",
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 20.0}, to = {2.0, 100.0 }}},
        },
      },
      max_sounds_per_type = 2,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    dying_sound_volume_modifier = 0.8,
  },

  big =
  {
    roar =
    {
      category = "enemy",
      variations = sound_variations("__space-age__/sound/enemies/demolisher/demolisher-roar", 10, 0.8),
      advanced_volume_control =
      {
        attenuation = "exponential",
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 60.0}, to = {2.0, 100.0 }}},
      },
      audible_distance_modifier = 2.5,
    },
    roar_probability = 1 / (12 * 60), -- average pause between roars is 12 seconds
    hurt_roar =
    {
      variations = sound_variations("__space-age__/sound/enemies/demolisher/demolisher-hurt-roar", 5, 1.0),
      advanced_volume_control =
      {
        attenuation = "exponential",
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 60.0}, to = {2.0, 100.0 }}},
      },
      audible_distance_modifier = 2.5,
    },
    hurt_thresholds = {0.9, 0.75, 0.5, 0.25, 0.1},

    segment_working_sound =
    {
      sound =
      {
        category = "enemy",
        filename = "__space-age__/sound/enemies/demolisher/demolisher-moves.ogg",
        volume = 0.5,
        advanced_volume_control = {attenuation = "exponential"},
      },
      max_sounds_per_type = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    tail_working_sound =
    {
      sound =
      {
        category = "enemy",
        filename = "__space-age__/sound/enemies/demolisher/demolisher-tail-rumble.ogg", volume = 0.3,
        advanced_volume_control =
        {
          attenuation = "exponential",
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 20.0}, to = {2.0, 100.0 }}},
        },
      },
      max_sounds_per_type = 2,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    dying_sound_volume_modifier = 1.0,
  }
}

sounds.strafer_projectile =
{
  variations = sound_variations("__space-age__/sound/enemies/strafer/fly-projectile-shoot", 5, 0.45),
  aggregation = { max_count = 2, remove = true, count_already_playing = true}
}
sounds.strafer_pentapod =
{
  small =
  {
    working_sound =
    {
      sound = {category = "enemy", variations = sound_variations("__space-age__/sound/enemies/strafer/strafer-idle", 10, 0.25)},
      probability = 1 / (8 * 60), -- average pause between the sound is 8 seconds
    },
    walking_sound_volume_modifier = 0.8,
    walking_sound_speed_modifier = 0.75,
    dying_sound = sound_variations("__space-age__/sound/enemies/strafer/strafer-death", 5, 0.35, volume_multiplier("main-menu", 1.21)),
    warcry =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/enemies/strafer/strafer-warcry", 6, 0.4, 0.6, volume_multiplier("main-menu", 2.9)),
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    },
    projectile_working_sound = {category = "enemy", filename = "__space-age__/sound/enemies/strafer/strafer-fly.ogg", volume = 0.25},
    projectile_impact = sound_variations("__space-age__/sound/enemies/strafer/fly-impact", 5, 0.35),
  },

  medium =
  {
    working_sound =
    {
      sound = {category = "enemy", variations = sound_variations("__space-age__/sound/enemies/strafer/strafer-idle", 10, 0.35)},
      probability = 1 / (8 * 60), -- average pause between the sound is 8 seconds
    },
    walking_sound_volume_modifier = 1.1,
    walking_sound_speed_modifier = 0.6,
    dying_sound = sound_variations("__space-age__/sound/enemies/strafer/strafer-death", 5, 0.7, volume_multiplier("main-menu", 1.21)),
    warcry =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/enemies/strafer/strafer-warcry", 6, 0.4, 0.8, volume_multiplier("main-menu", 2.9)),
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    },
    projectile_working_sound = {category = "enemy", filename = "__space-age__/sound/enemies/strafer/strafer-fly.ogg", volume = 0.35},
    projectile_impact = sound_variations("__space-age__/sound/enemies/strafer/fly-impact", 5, 0.6),
  },

  big =
  {
    working_sound =
    {
      sound = {category = "enemy", variations = sound_variations("__space-age__/sound/enemies/strafer/strafer-idle-big", 10, 0.6)},
      probability = 1 / (8 * 60), -- average pause between the sound is 8 seconds
    },
    walking_sound_volume_modifier = 1.2,
    walking_sound_speed_modifier = 0.5,
    dying_sound = sound_variations("__space-age__/sound/enemies/strafer/strafer-death-big", 5, 1.0, volume_multiplier("main-menu", 1.21)),
    warcry =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/enemies/strafer/strafer-warcry-big", 6, 0.4, 1.0, volume_multiplier("main-menu", 2.9)),
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    },
    projectile_working_sound = {category = "enemy", filename = "__space-age__/sound/enemies/strafer/strafer-fly.ogg", volume = 0.5},
    projectile_impact = sound_variations("__space-age__/sound/enemies/strafer/fly-impact-big", 5, 0.8),
  },
}

sounds.stomper_pentapod =
{
  small =
  {
    working_sound =
    {
      sound = {category = "enemy", variations = sound_variations("__space-age__/sound/enemies/stomper/stomper-idle", 10, 0.4)},
      probability = 1 / (12 * 60), -- average pause between the sound is 12 seconds
    },
    walking_sound_volume_modifier = 1.5,
    walking_sound_speed_modifier = 0.5,
    dying_sound = sound_variations("__space-age__/sound/enemies/stomper/stomper-death", 10, 0.4, volume_multiplier("main-menu", 1.21)),
    warcry =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/enemies/stomper/stomper-warcry", 7, 0.2, 0.4, volume_multiplier("main-menu", 2.9)),
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    },
    stomp =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/enemies/stomper/stomper-stomp", 5, 0.25, 0.35),
      aggregation = {max_count = 3, remove = true, count_already_playing = true}
    },
  },

  medium =
  {
    working_sound =
    {
      sound = {category = "enemy", variations = sound_variations("__space-age__/sound/enemies/stomper/stomper-idle", 10, 0.6)},
      probability = 1 / (12 * 60), -- average pause between the sound is 12 seconds
    },
    walking_sound_volume_modifier = 2.0,
    walking_sound_speed_modifier = 0.4,
    dying_sound = sound_variations("__space-age__/sound/enemies/stomper/stomper-death", 10, 0.7, volume_multiplier("main-menu", 1.21)),
    warcry =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/enemies/stomper/stomper-warcry", 7, 0.4, 0.7, volume_multiplier("main-menu", 2.9)),
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    },
    stomp =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/enemies/stomper/stomper-stomp", 5, 0.3, 0.4),
      aggregation = {max_count = 3, remove = true, count_already_playing = true}
    },
  },

  big =
  {
    working_sound =
    {
      sound = {category = "enemy", variations = sound_variations("__space-age__/sound/enemies/stomper/stomper-idle-big", 10, 1.0)},
      probability = 1 / (12 * 60), -- average pause between the sound is 12 seconds
    },
    walking_sound_volume_modifier = 2.5,
    walking_sound_speed_modifier = 0.3,
    dying_sound = sound_variations("__space-age__/sound/enemies/stomper/stomper-death-big", 10, 0.9, volume_multiplier("main-menu", 1.21)),
    warcry =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/enemies/stomper/stomper-warcry-big", 5, 0.7, 0.9, volume_multiplier("main-menu", 2.9)),
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    },
    stomp =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/enemies/stomper/stomper-stomp", 5, 0.3, 0.5),
      aggregation = {max_count = 3, remove = true, count_already_playing = true}
    },
  },
}

sounds.wriggler_pentapod =
{
  small =
  {
    working_sound =
    {
      sound = sound_variations("__space-age__/sound/enemies/wriggler/wriggler-idle", 9, 0.5, volume_multiplier("main-menu", 0.7)),
      probability = 1 / (10 * 60), -- average pause between the sound is 10 seconds
      max_sounds_per_type = 2
    },
    walking_sound =
    {
      variations = sound_variations("__space-age__/sound/enemies/wriggler/wriggler-walk", 6, 0.2, volume_multiplier("main-menu", 0.7)),
      aggregation = {max_count = 3, remove = true, count_already_playing = true}
    },
    dying_sound =
    {
      variations = sound_variations("__space-age__/sound/enemies/wriggler/wriggler-death", 8, 1.0, volume_multiplier("main-menu", 0.7)),
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    },
    warcry =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/enemies/wriggler/wriggler-warcry", 6, 0.6, 0.8, volume_multiplier("main-menu", 0.7)),
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    },
    attack_sound =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/enemies/wriggler/wriggler-attack", 9, 0.25, 0.7, volume_multiplier("main-menu", 0.7)),
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    },
  },

  medium =
  {
    working_sound =
    {
      sound = sound_variations("__space-age__/sound/enemies/wriggler/wriggler-idle", 9, 0.5, volume_multiplier("main-menu", 0.7)),
      probability = 1 / (10 * 60), -- average pause between the sound is 10 seconds
      max_sounds_per_type = 2
    },
    walking_sound =
    {
      variations = sound_variations("__space-age__/sound/enemies/wriggler/wriggler-walk", 6, 0.2, volume_multiplier("main-menu", 0.7)),
      aggregation = {max_count = 3, remove = true, count_already_playing = true}
    },
    dying_sound =
    {
      variations = sound_variations("__space-age__/sound/enemies/wriggler/wriggler-death", 8, 1.0, volume_multiplier("main-menu", 0.7)),
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    },
    warcry =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/enemies/wriggler/wriggler-warcry", 6, 0.6, 0.8, volume_multiplier("main-menu", 0.7)),
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    },
    attack_sound =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/enemies/wriggler/wriggler-attack", 9, 0.25, 0.7, volume_multiplier("main-menu", 0.7)),
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    },
  },

  big =
  {
    working_sound =
    {
      sound = sound_variations("__space-age__/sound/enemies/wriggler/wriggler-idle", 9, 0.5, volume_multiplier("main-menu", 1)),
      probability = 1 / (10 * 60), -- average pause between the sound is 10 seconds
      max_sounds_per_type = 2
    },
    walking_sound =
    {
      variations = sound_variations("__space-age__/sound/enemies/wriggler/wriggler-walk", 6, 0.2, volume_multiplier("main-menu", 2)),
      aggregation = {max_count = 3, remove = true, count_already_playing = true}
    },
    dying_sound =
    {
      variations = sound_variations("__space-age__/sound/enemies/wriggler/wriggler-death", 8, 1.0, volume_multiplier("main-menu", 1.5)),
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    },
    warcry =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/enemies/wriggler/wriggler-warcry", 6, 0.6, 0.8, volume_multiplier("main-menu", 0.5)),
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    },
    attack_sound =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/enemies/wriggler/wriggler-attack", 9, 0.25, 0.7, volume_multiplier("main-menu", 0.7)),
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    },
  },
}

sounds.cargo_bay_hatch_opening_sound =
{
  sound =
  {
    filename = "__space-age__/sound/entity/cargo-hatch/cargo-bay-hatch-opening-loop.ogg",
    volume = 0.6,
    aggregation = {max_count = 1, remove = true, count_already_playing = true}
  },
  stopped_sound =
  {
    filename = "__space-age__/sound/entity/cargo-hatch/cargo-bay-hatch-opening-stop.ogg",
    volume = 0.35,
    aggregation = {max_count = 1, remove = true, count_already_playing = true}
  },
  minimal_sound_duration_for_stopped_sound = 25,
}
sounds.cargo_bay_hatch_closing_sound =
{
  sound =
  {
    filename = "__space-age__/sound/entity/cargo-hatch/cargo-bay-hatch-closing-loop.ogg",
    volume = 0.6,
    aggregation = {max_count = 1, remove = true, count_already_playing = true}
  },
  stopped_sound =
  {
    filename = "__space-age__/sound/entity/cargo-hatch/cargo-bay-hatch-closing-stop.ogg",
    volume = 0.35,
    aggregation = {max_count = 1, remove = true, count_already_playing = true}
  }
}

return sounds

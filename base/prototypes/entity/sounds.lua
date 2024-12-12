require("sound-util")
local sounds = {}

function sound_trigger(filename_string, variations, volume_parameter, category, modifiers)
return
  {
    type = "play-sound",
    sound =
    {
      category = category or nil,
      variations = sound_variations(filename_string, variations, volume_parameter, modifiers),
      aggregation = {max_count = 4, remove = true, count_already_playing = true}
    }
  }
end

sounds.plant = sound_variations("__base__/sound/walking/plant/plant", 5, 0.4)
sounds.big_bush = sound_variations("__base__/sound/walking/plant/bush-big", 7, 0.3)
sounds.small_bush = sound_variations("__base__/sound/walking/plant/bush-small", 7, 0.6)
sounds.pebble = sound_variations("__base__/sound/walking/pebble/stones", 9, 0.6)
sounds.hairy_grass = sound_variations("__base__/sound/walking/decorative-grass", 10, 0.3)
sounds.carpet_grass = sound_variations("__base__/sound/walking/decorative-grass", 10, 0.2)
sounds.mud = sound_variations("__base__/sound/walking/decorative-mud", 10, 0.3)
sounds.ore = sound_variations("__base__/sound/walking/resources/ore", 10, 0.7)
sounds.oil = sound_variations("__base__/sound/walking/resources/oil", 7, 0.7)
sounds.rails = sound_variations("__base__/sound/walking/rails/rails", 12, 0.6)
sounds.tree_leaves = sound_variations("__base__/sound/particles/tree-leaves", 5, 0.35)
sounds.mine_fish = sound_variations("__core__/sound/mine-fish", 5, 0.8)
sounds.eat_fish = sound_variations("__base__/sound/eat", 5, 0.6)
sounds.deconstruct_bricks = function(volume)
  return
  {
    switch_vibration_data =
    {
      gain = 0.32,
      filename = "__core__/sound/deconstruct-bricks.bnvib"
    },
    variations =
    {
      {
        filename = "__base__/sound/deconstruct-bricks.ogg",
        volume = volume
      }
    }
  }
end

sounds.deconstruct_small = function(volume)
  return
  {
    switch_vibration_data =
    {
      filename = "__core__/sound/deconstruct-small.bnvib",
      gain = 0.25
    },
    variations =
    {
      {
        filename = "__core__/sound/deconstruct-small.ogg",
        volume = volume
      }
    }
  }
end

sounds.deconstruct_medium = function(volume)
  return
  {
    switch_vibration_data =
    {
      filename = "__core__/sound/deconstruct-medium.bnvib",
      gain = 0.25
    },
    variations =
    {
      {
        filename = "__core__/sound/deconstruct-medium.ogg",
        volume = volume
      }
    }
  }
end

sounds.deconstruct_large = function(volume)
  return
  {
    switch_vibration_data =
    {
      filename = "__core__/sound/deconstruct-large.bnvib",
      gain = 0.25
    },
    variations =
    {
      {
        filename = "__core__/sound/deconstruct-large.ogg",
        volume = volume
      }
    }
  }
end

sounds.inserter_basic =
{
  match_progress_to_activity = true,
  sound = sound_variations("__base__/sound/inserter-basic", 5, 0.5, { volume_multiplier("main-menu", 2), volume_multiplier("tips-and-tricks", 1.8) } ),
  audible_distance_modifier = 0.3
}

sounds.inserter_fast =
{
  match_progress_to_activity = true,
  sound = sound_variations("__base__/sound/inserter-fast", 5, 0.5, { volume_multiplier("main-menu", 1.6), volume_multiplier("tips-and-tricks", 2) } ),
  audible_distance_modifier = 0.3
}

sounds.inserter_long_handed =
{
  match_progress_to_activity = true,
  sound = sound_variations("__base__/sound/inserter-long-handed", 5, 0.3, volume_multiplier("tips-and-tricks", 1.8)),
  audible_distance_modifier = 0.5
}

sounds.tree_mined = sound_variations("__base__/sound/particles/tree-mined", 5, 0.4)
sounds.tree_ambient =
{
  sound =
  {
    variations = sound_variations("__base__/sound/world/day/world-tree-critters-day", 6, 0.35),
    advanced_volume_control =
    {
      fades = { fade_in = { curve_type = "S-curve", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } },
      darkness_threshold = -0.3
    }
  },
  radius = 10,
  min_entity_count = 10,
  max_entity_count = 15,
  entity_to_sound_ratio = 0.1,
  average_pause_seconds = 10
}
sounds.tree_ambient_night =
{
  sound =
  {
    variations = sound_variations("__base__/sound/world/night/world-tree-critters-night", 9, 0.5),
    advanced_volume_control =
    {
      fades = { fade_in = { curve_type = "S-curve", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } },
      darkness_threshold = 0.3
    }
  },
  radius = 10,
  min_entity_count = 10,
  max_entity_count = 15,
  entity_to_sound_ratio = 0.1,
  average_pause_seconds = 13
}
sounds.tree_insects_night =
{
  sound =
  {
    variations = sound_variations("__base__/sound/world/night/world-tree-insects-night", 8, 0.7),
    advanced_volume_control =
    {
      fades = { fade_in = { curve_type = "S-curve", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } },
      darkness_threshold = 0.3
    }
  },
  radius = 10,
  min_entity_count = 10,
  max_entity_count = 15,
  entity_to_sound_ratio = 0.1,
  average_pause_seconds = 11
}

sounds.tree_ambient_leaves =
{
  sound =
  {
    variations = sound_variations("__base__/sound/world/trees/tree-ambient-leaves", 5, 0.45),
    advanced_volume_control =
    {
      fades = { fade_in = { curve_type = "S-curve", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } }
    }
  },
  radius = 7,
  min_entity_count = 3,
  max_entity_count = 5,
  entity_to_sound_ratio = 1,
  average_pause_seconds = 5,
}

sounds.splitter =
{
  sound = sound_variations("__base__/sound/splitters/splitter", 6, 0.2, volume_multiplier("tips-and-tricks", 1.44)),
  max_sounds_per_type = 3,
  audible_distance_modifier = 0.45
}

sounds.fast_splitter =
{
  sound = sound_variations("__base__/sound/splitters/fast-splitter", 5, 0.2),
  max_sounds_per_type = 3,
  audible_distance_modifier = 0.45
}

sounds.express_splitter =
{
  sound = sound_variations("__base__/sound/splitters/express-splitter", 5, 0.2),
  max_sounds_per_type = 3,
  audible_distance_modifier = 0.45
}

sounds.loader =
{
  sound = { filename = "__base__/sound/transport-belt.ogg", volume = 0.3 },
  max_sounds_per_type = 3,
  audible_distance_modifier = 0.45
}

sounds.fast_loader =
{
  sound = { filename = "__base__/sound/fast-transport-belt.ogg", volume = 0.3 },
  max_sounds_per_type = 3,
  audible_distance_modifier = 0.45
}

sounds.express_loader =
{
  sound = { filename = "__base__/sound/express-transport-belt.ogg", volume = 0.3 },
  max_sounds_per_type = 3,
  audible_distance_modifier = 0.45
}

sounds.spidertron_leg = sound_variations("__base__/sound/spidertron/spidertron-leg", 5, 0.1, volume_multiplier("main-menu", 7.5))
sounds.pipe =
{
  sound = { filename = "__base__/sound/pipe.ogg", volume = 0.45 },
  persistent = true,
  fade_in_ticks = 10,
  fade_out_ticks = 20,
  volume_smoothing_window_size = 20,
}
sounds.train_brakes =
{
  filename = "__base__/sound/train-breaks.ogg",
  volume = 0.3,
  aggregation = {max_count = 1, remove = true},
  modifiers = {volume_multiplier("main-menu", 2.8), volume_multiplier("driving", 1.2)},
}
sounds.train_brake_screech =
{
  variations = sound_variations("__base__/sound/train-brake-screech", 2, 0.3, volume_multiplier("driving", 1.15)),
  aggregation = {max_count = 1, remove = true},
}
sounds.train_wagon_wheels =
{
  sound =
  {
    filename = "__base__/sound/train-wagon-wheels.ogg",
    volume = 0.6,
    modifiers = {volume_multiplier("main-menu", 2), volume_multiplier("driving", 0.5)}
  },
  match_volume_to_activity = true,
  activity_to_volume_modifiers =
  {
    multiplier = 1.5,
    minimum = 0.5,
    maximum = 1.0,
  },
  match_speed_to_activity = true,
  activity_to_speed_modifiers =
  {
    multiplier = 0.6,
    minimum = 1.0,
    maximum = 1.2,
    offset = -0.8,
  },
  fade_in_ticks = 10,
  fade_out_ticks = 20,
  max_sounds_per_type = 2,
}

--Entities open close

sounds.ammo_open = { filename = "__base__/sound/open-close/ammo-large-open.ogg", volume = 0.57 }
sounds.ammo_close = { filename = "__base__/sound/open-close/ammo-large-close.ogg", volume = 0.6 }
sounds.artillery_open = { filename = "__base__/sound/artillery-open.ogg", volume = 0.57 }
sounds.artillery_close = { filename = "__base__/sound/artillery-close.ogg", volume = 0.6 }
sounds.cargo_wagon_open = { filename = "__base__/sound/cargo-wagon-open.ogg", volume = 0.55 }
sounds.cargo_wagon_close = { filename = "__base__/sound/cargo-wagon-close.ogg", volume = 0.54 }
sounds.combinator_open = { filename = "__base__/sound/open-close/combinator-open.ogg", volume = 0.55 }
sounds.combinator_close = { filename = "__base__/sound/open-close/combinator-close.ogg", volume = 0.54 }
sounds.drill_open = { filename = "__base__/sound/open-close/drill-open.ogg", volume = 0.6 }
sounds.drill_close = { filename = "__base__/sound/open-close/drill-close.ogg", volume = 0.6 }
sounds.electric_network_open = { filename = "__base__/sound/electric-network-open.ogg", volume = 0.6 }
sounds.electric_network_close = { filename = "__base__/sound/electric-network-close.ogg", volume = 0.6 }
sounds.electric_large_open = { filename = "__base__/sound/open-close/electric-large-open.ogg", volume = 0.6 }
sounds.electric_large_close = { filename = "__base__/sound/open-close/electric-large-close.ogg", volume = 0.6 }
sounds.inserter_open = { filename = "__base__/sound/open-close/inserter-open.ogg", volume = 0.6 }
sounds.inserter_close = { filename = "__base__/sound/open-close/inserter-close.ogg", volume = 0.5 }
sounds.machine_open = { filename = "__base__/sound/machine-open.ogg", volume = 0.5 }
sounds.machine_close = { filename = "__base__/sound/machine-close.ogg", volume = 0.5 }
sounds.metal_small_open = { filename = "__base__/sound/open-close/metal-small-open.ogg", volume = 0.8 }
sounds.metal_small_close = { filename = "__base__/sound/open-close/metal-small-close.ogg", volume = 0.8 }
sounds.metal_large_open = { filename = "__base__/sound/open-close/metal-large-open.ogg", volume = 0.8 }
sounds.metal_large_close = { filename = "__base__/sound/open-close/metal-large-close.ogg", volume = 0.7 }
sounds.rail_signal_open = { filename = "__base__/sound/open-close/rail-signal-open.ogg", volume = 0.6 }
sounds.rail_signal_close = { filename = "__base__/sound/open-close/rail-signal-close.ogg", volume = 0.6 }
sounds.steam_open = { filename = "__base__/sound/open-close/steam-open.ogg", volume = 0.57 }
sounds.steam_close = { filename = "__base__/sound/open-close/steam-close.ogg", volume = 0.5 }
sounds.transport_belt_open = { filename = "__base__/sound/open-close/transport-belt-open.ogg", volume = 0.7 }
sounds.transport_belt_close = { filename = "__base__/sound/open-close/transport-belt-close.ogg", volume = 0.6 }

sounds.roboport_door_open =
{
  {
    type = "play-sound",
    sound =
    {
      filename = "__base__/sound/roboport-door.ogg",
      volume = 0.3,
      min_speed = 1,
      max_speed = 1.5,
      aggregation = {max_count = 1, remove = true},
    }
  }
}

sounds.roboport_door_close =
{
  {
    type = "play-sound",
    sound =
    {
      filename = "__base__/sound/roboport-door-close.ogg",
      volume = 0.2,
      min_speed = 1,
      max_speed = 1.5,
      aggregation = {max_count = 1, remove = true},
    }
  }
}

sounds.flying_robot = function(volume)
  return
  {
    sound =
    {
      { filename = "__base__/sound/construction-robot-11.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/construction-robot-12.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/construction-robot-13.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/construction-robot-14.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/construction-robot-15.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/construction-robot-16.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/construction-robot-17.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/construction-robot-18.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/construction-robot-19.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/flying-robot-1.ogg", volume = 0.43, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/flying-robot-2.ogg", volume = 0.43, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/flying-robot-3.ogg", volume = 0.43, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/flying-robot-4.ogg", volume = 0.43, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/flying-robot-5.ogg", volume = 0.43, modifiers = volume_multiplier("main-menu", 1.3) },
    },
    max_sounds_per_type = 20,
    audible_distance_modifier = 1,
    fade_in_ticks = 8,
    fade_out_ticks = 10,
    probability = 1 / (10 * 60) -- average pause between the sound is 10 seconds
  }
end

sounds.construction_robot = function(volume)
  return
  {
    sound =
    {
      { filename = "__base__/sound/construction-robot-1.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/construction-robot-2.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/construction-robot-3.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/construction-robot-4.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/construction-robot-5.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/construction-robot-6.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/construction-robot-7.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/construction-robot-8.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/construction-robot-9.ogg", volume = volume, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/flying-robot-1.ogg", volume = 0.43, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/flying-robot-2.ogg", volume = 0.43, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/flying-robot-3.ogg", volume = 0.43, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/flying-robot-4.ogg", volume = 0.43, modifiers = volume_multiplier("main-menu", 1.3) },
      { filename = "__base__/sound/flying-robot-5.ogg", volume = 0.43, modifiers = volume_multiplier("main-menu", 1.3) },
    },
    max_sounds_per_type = 20,
    audible_distance_modifier = 1,
    fade_in_ticks = 8,
    fade_out_ticks = 8,
    probability = 1 / (10 * 60) -- average pause between the sound is 10 seconds
  }
end

sounds.robot_charging =
{
  sound =
  {
    variations = sound_variations("__base__/sound/robot-charging", 7, 1.0),
    aggregation = {max_count = 3, remove = true, count_already_playing = true}
  }
}
sounds.robot_die_whoosh = sound_variations("__base__/sound/fight/robot-die-whoosh", 3, 0.5)
sounds.robot_die_vox = sound_variations("__base__/sound/fight/robot-die-vox", 6, 0.5)
sounds.robot_selfdestruct = sound_variations("__base__/sound/fight/robot-selfdestruct", 3, 0.4)
sounds.robot_die_impact = sound_variations("__base__/sound/fight/robot-die-impact", 3, 0.7)
sounds.laser_turret_activate =
{
  variations = sound_variations("__base__/sound/fight/laser-turret-activate", 3, 0.3, volume_multiplier("main-menu", 0.9)),
  aggregation = {max_count = 3, remove = true, count_already_playing = true}
}
sounds.laser_turret_deactivate =
{
  variations = sound_variations("__base__/sound/fight/laser-turret-deactivate", 4, 0.3, volume_multiplier("main-menu", 0.9)),
  aggregation = {max_count = 3, remove = true, count_already_playing = true}
}
sounds.gun_turret_activate =
{
  variations = sound_variations("__base__/sound/fight/gun-turret-activate", 4, 0.3, volume_multiplier("main-menu", 0.9)),
  aggregation = {max_count = 3, remove = true, count_already_playing = true}
}
sounds.gun_turret_deactivate =
{
  variations = sound_variations("__base__/sound/fight/gun-turret-deactivate", 4, 0.3, volume_multiplier("main-menu", 0.9)),
  aggregation = {max_count = 3, remove = true, count_already_playing = true}
}
sounds.flamethrower_turret_activate = sound_variations("__base__/sound/fight/flamethrower-turret-activate", 4, 0.3)
sounds.flamethrower_turret_deactivate = sound_variations("__base__/sound/fight/flamethrower-turret-deactivate", 4, 0.2)
sounds.heavy_gunshot =
{
  switch_vibration_data =
  {
    filename = "__base__/sound/fight/heavy-gunshot.bnvib",
    gain = 0.7
  },
  game_controller_vibration_data =
  {
    high_frequency_vibration_intensity = 0.6,
    duration = 50
  },
  variations = sound_variations("__base__/sound/fight/heavy-gunshot", 4, 0.4),
  priority = 64
}
sounds.gun_turret_gunshot =
{
  variations = sound_variations("__base__/sound/fight/gun-turret-gunshot", 4, 0.4, {volume_multiplier("main-menu", 0.9), volume_multiplier("space-platform", 0.5)}),
  aggregation = {max_count = 8, remove = true, count_already_playing = true, priority = "newest"}
}
sounds.light_gunshot =
{
  switch_vibration_data =
  {
    filename = "__base__/sound/fight/light-gunshot.bnvib",
  },
  game_controller_vibration_data =
  {
    high_frequency_vibration_intensity = 0.4,
    duration = 40
  },
  variations = sound_variations("__base__/sound/fight/light-gunshot", 7, 0.6),
  priority = 64
}
sounds.defender_gunshot = sound_variations("__base__/sound/fight/defender-gunshot", 3, 0.65)
sounds.submachine_gunshot =
{
  switch_vibration_data =
  {
    filename = "__base__/sound/fight/submachine-gunshot.bnvib",
  },
  game_controller_vibration_data =
  {
    high_frequency_vibration_intensity = 0.4,
    duration = 30
  },
  variations = sound_variations("__base__/sound/fight/submachine-gunshot", 3, 0.6, volume_multiplier("main-menu", 1.4)),
  priority = 64
}
sounds.shotgun =
{
  switch_vibration_data =
  {
    filename = "__base__/sound/fight/pump-shotgun.bnvib",
  },
  game_controller_vibration_data =
  {
    duration = 100,
    high_frequency_vibration_intensity = 0.6,
  },
  variations = sound_variations("__base__/sound/fight/pump-shotgun", 5, 0.37),
  priority = 64
}
sounds.tank_gunshot =
{
  switch_vibration_data =
  {
    filename = "__base__/sound/fight/tank-cannon.bnvib",
  },
  game_controller_vibration_data =
  {
    low_frequency_vibration_intensity = 0.9,
    duration = 200
  },
  variations = sound_variations("__base__/sound/fight/tank-cannon", 5, 0.57),
  priority = 64
}
sounds.throw_projectile =
{
  category = "weapon",
  switch_vibration_data =
  {
    filename = "__base__/sound/fight/throw-projectile.bnvib",
  },
  variations = sound_variations("__base__/sound/fight/throw-projectile", 6, 0.4),
  priority = 64
}
sounds.throw_grenade =
{
  category = "weapon",
  variations = sound_variations("__base__/sound/fight/throw-grenade", 5, 0.4),
  priority = 64
}

sounds.poison_capsule_explosion =
{
  category = "weapon",
  aggregation = { max_count = 1, remove = true },
  switch_vibration_data =
  {
    filename = "__base__/sound/fight/poison-capsule-explosion.bnvib",
    gain = 0.3,
    play_for = "everything"
  },
  game_controller_vibration_data =
  {
    high_frequency_vibration_intensity = 0.4,
    duration = 50,
    play_for = "everything"
  },
  variations = { filename = "__base__/sound/fight/poison-capsule-explosion-1.ogg", volume = 0.3 }
}

sounds.slowdown_capsule_explosion =
{
  aggregation =
  {
    max_count = 1,
    remove = true
  },
  variations = sound_variations("__base__/sound/fight/slowdown-capsule-explosion", 5, 1)
}

sounds.small_explosion =
{
  aggregation =
  {
    max_count = 1,
    remove = true
  },
  variations = sound_variations_with_volume_variations("__base__/sound/small-explosion", 5, 0.25, 0.5, volume_multiplier("main-menu", 1.2))
}

sounds.medium_explosion =
{
  aggregation =
  {
    max_count = 1,
    remove = true
  },
  switch_vibration_data =
  {
    filename = "__base__/sound/fight/medium-explosion.bnvib",
    gain = 0.4
  },
  audible_distance_modifier = 0.7,
  variations = sound_variations_with_volume_variations("__base__/sound/fight/medium-explosion", 5, 0.3, 0.4, volume_multiplier("main-menu", 1.2))
}

sounds.robot_explosion =
{
  aggregation =
  {
    max_count = 1,
    remove = true
  },
  variations = sound_variations_with_volume_variations("__base__/sound/fight/robot-explosion", 5, 0.3, 0.5)
}

sounds.car_explosion =
{
  aggregation =
  {
    max_count = 1,
    remove = true
  },
  variations = sound_variations_with_volume_variations("__base__/sound/fight/car-explosion", 5, 0.4, 0.5)
}

sounds.tank_explosion =
{
  aggregation =
  {
    max_count = 1,
    remove = true
  },
  variations = sound_variations_with_volume_variations("__base__/sound/fight/tank-explosion", 5, 0.5, 0.8)
}

sounds.spidertron_explosion =
{
  aggregation =
  {
    max_count = 1,
    remove = true
  },
  variations = sound_variations_with_volume_variations("__base__/sound/fight/spidertron-explosion", 5, 0.5, 0.6)
}

sounds.large_explosion = function(min_volume, max_volume)
  return
  {
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
    variations = sound_variations_with_volume_variations("__base__/sound/fight/large-explosion", 2, min_volume, max_volume or min_volume, volume_multiplier("main-menu", 0.6) )
  }
end

sounds.nuclear_explosion = function(volume)
  return
  {
    category = "explosion",
    aggregation =
    {
      max_count = 1,
      remove = true
    },
    switch_vibration_data =
    {
      filename = "__base__/sound/fight/nuclear-explosion.bnvib",
      play_for = "everything"
    },
    game_controller_vibration_data =
    {
      low_frequency_vibration_intensity = 1,
      duration = 800,
      play_for = "everything"
    },
    variations = sound_variations("__base__/sound/fight/nuclear-explosion", 3, volume)
  }
end

sounds.nuclear_explosion_aftershock = function(volume)
  return
  {
    category = "explosion",
    aggregation =
    {
      max_count = 1,
      remove = true
    },
    variations = {{ filename = "__base__/sound/fight/nuclear-explosion-aftershock.ogg", volume = volume }}
  }
end

--bullet impacts

if not bullet_impacts_loaded then
  bullet_impacts_loaded = true
  data:extend
  {
    {
      type = "deliver-impact-combination",
      name = "bullet-default",
      deliver_category = "bullet",
      impact_category = "default",
      trigger_effect_item = sound_trigger("__base__/sound/bullets/bullet-impact", 5, 0.5, "weapon", volume_multiplier("space-platform", 0.5))
    },
    {
      type = "deliver-impact-combination",
      name = "bullet-organic",
      deliver_category = "bullet",
      impact_category = "organic",
      trigger_effect_item = sound_trigger("__base__/sound/bullets/bullet-impact-organic", 5, 0.3, "weapon")
    },
    {
      type = "deliver-impact-combination",
      name = "bullet-glass",
      deliver_category = "bullet",
      impact_category = "glass",
      trigger_effect_item = sound_trigger("__base__/sound/bullets/bullet-impact-glass", 5, 0.4, "weapon")
    },
    {
      type = "deliver-impact-combination",
      name = "bullet-metal",
      deliver_category = "bullet",
      impact_category = "metal",
      trigger_effect_item = sound_trigger("__base__/sound/bullets/bullet-impact-metal", 5, 0.4, "weapon")
    },
    {
      type = "deliver-impact-combination",
      name = "bullet-metal-large",
      deliver_category = "bullet",
      impact_category = "metal-large",
      trigger_effect_item = sound_trigger("__base__/sound/bullets/bullet-impact-metal-large", 5, 0.4, "weapon")
    },
    {
      type = "deliver-impact-combination",
      name = "bullet-wood",
      deliver_category = "bullet",
      impact_category = "wood",
      trigger_effect_item = sound_trigger("__base__/sound/bullets/bullet-impact-wood", 5, 0.5, "weapon")
    },
    { -- same as bullet wood, the tree/wood differentiation is only for vehicle impact
      type = "deliver-impact-combination",
      name = "bullet-tree",
      deliver_category = "bullet",
      impact_category = "tree",
      trigger_effect_item = sound_trigger("__base__/sound/bullets/bullet-impact-wood", 5, 0.5, "weapon")
    },
    {
      type = "deliver-impact-combination",
      name = "bullet-stone",
      deliver_category = "bullet",
      impact_category = "stone",
      trigger_effect_item = sound_trigger("__base__/sound/bullets/bullet-impact-stone", 5, 0.5, "weapon")
    },
    {
      type = "deliver-impact-combination",
      name = "vehicle-default",
      deliver_category = "vehicle",
      impact_category = "default",
      trigger_effect_item =
      {
        type = "play-sound",
        sound =
        {
          switch_vibration_data =
          {
            filename = "__base__/sound/car-metal-impact.bnvib"
          },
          game_controller_vibration_data =
          {
            low_frequency_vibration_intensity = 0.9,
            duration = 150
          },
          variations = sound_variations("__base__/sound/car-metal-impact", 5, 1)
        }
      }
    },
    { -- same as default, as we don't have vehicle->metal sound impact yet
      type = "deliver-impact-combination",
      name = "vehicle-metal",
      deliver_category = "vehicle",
      impact_category = "metal",
      trigger_effect_item =
      {
        type = "play-sound",
        sound =
        {
          switch_vibration_data =
          {
            filename = "__base__/sound/car-metal-impact.bnvib"
          },
          game_controller_vibration_data =
          {
            low_frequency_vibration_intensity = 0.9,
            duration = 150
          },
          variations = sound_variations("__base__/sound/car-metal-impact", 5, 0.5)
        }
      }
    },
    {
      type = "deliver-impact-combination",
      name = "vehicle-metal-large",
      deliver_category = "vehicle",
      impact_category = "metal-large",
      trigger_effect_item = sound_trigger("__base__/sound/car-metal-large-impact", 5, 0.7)
    },
    {
      type = "deliver-impact-combination",
      name = "vehicle-glass",
      deliver_category = "vehicle",
      impact_category = "glass",
      trigger_effect_item = sound_trigger("__base__/sound/car-glass-impact", 5, 0.7)
    },
    {
      type = "deliver-impact-combination",
      name = "vehicle-stone",
      deliver_category = "vehicle",
      impact_category = "stone",
      trigger_effect_item =
      {
        type = "play-sound",
        sound =
        {
          switch_vibration_data =
          {
            filename = "__base__/sound/car-stone-impact.bnvib"
          },
          game_controller_vibration_data =
          {
            low_frequency_vibration_intensity = 0.9,
            duration = 150
          },
          variations = sound_variations("__base__/sound/car-stone-impact", 5, 0.7)
        }
      }
    },
    {
      type = "deliver-impact-combination",
      name = "vehicle-wood",
      deliver_category = "vehicle",
      impact_category = "wood",
      trigger_effect_item =
      {
        type = "play-sound",
        sound =
        {
          switch_vibration_data =
          {
            filename = "__base__/sound/car-wood-impact.bnvib",
            gain = 0.7
          },
          game_controller_vibration_data =
          {
            low_frequency_vibration_intensity = 0.63,
            duration = 150
          },
          variations = sound_variations("__base__/sound/car-wood-impact", 5, 0.7)
        }
      }
    },
    {
      type = "deliver-impact-combination",
      name = "vehicle-tree",
      deliver_category = "vehicle",
      impact_category = "tree",
      trigger_effect_item =
      {
        type = "play-sound",
        sound =
        {
          switch_vibration_data =
          {
            filename = "__base__/sound/car-tree-wood-impact.bnvib",
            gain = 0.6
          },
          game_controller_vibration_data =
          {
            low_frequency_vibration_intensity = 0.6,
            duration = 110
          },
          variations = sound_variations("__base__/sound/car-tree-wood-impact", 4, 0.7)
        }
      }
    }
  }
end

--debris

sounds.car_debris = sound_variations_with_volume_variations("__base__/sound/particles/car-debris", 5, 0.35, 0.55)
sounds.tank_debris = sound_variations_with_volume_variations("__base__/sound/particles/tank-debris", 5, 0.4, 0.6)
sounds.spidertron_debris = sound_variations_with_volume_variations("__base__/sound/particles/spidertron-debris", 5, 0.5, 0.6)
sounds.spidertron_die_vox = sound_variations_with_volume_variations("__base__/sound/spidertron/spidertron-die-vox", 5, 0.3, 0.4)
sounds.small_splash = sound_variations("__base__/sound/particles/small-splash", 5, 0.7)
sounds.small_gore =
{
  category = "enemy",
  variations = sound_variations("__base__/sound/particles/small-gore", 6, 0.7, volume_multiplier("main-menu", 0.7) ),
  aggregation = { max_count = 1, remove = true, count_already_playing = true },
  audible_distance_modifier = 0.5,
}
sounds.medium_gore =
{
  category = "enemy",
  variations = sound_variations("__base__/sound/particles/medium-gore", 5, 0.8, volume_multiplier("main-menu", 0.7) ),
  aggregation = { max_count = 1, remove = true, count_already_playing = true },
  audible_distance_modifier = 0.5,
}
sounds.big_gore =
{
  category = "enemy",
  variations = sound_variations("__base__/sound/particles/big-gore", 5, 0.6, volume_multiplier("main-menu", 0.7) ),
  aggregation = { max_count = 1, remove = true, count_already_playing = true },
  audible_distance_modifier = 0.5,
}
sounds.behemoth_gore =
{
  category = "enemy",
  variations = sound_variations("__base__/sound/particles/behemoth-gore", 5, 0.6, volume_multiplier("main-menu", 0.7) ),
  aggregation = { max_count = 1, remove = true, count_already_playing = true },
}
sounds.small_gore_worm =
{
  category = "enemy",
  variations = sound_variations("__base__/sound/particles/small-gore-worm", 5, 0.7, volume_multiplier("main-menu", 0.7) ),
  aggregation = { max_count = 1, remove = true, count_already_playing = true },
}
sounds.medium_gore_worm =
{
  category = "enemy",
  variations = sound_variations("__base__/sound/particles/medium-gore-worm", 5, 0.8, volume_multiplier("main-menu", 0.7) ),
  aggregation = { max_count = 1, remove = true, count_already_playing = true },
}
sounds.big_gore_worm =
{
  category = "enemy",
  variations = sound_variations("__base__/sound/particles/big-gore-worm", 5, 0.8, volume_multiplier("main-menu", 0.7) ),
  aggregation = { max_count = 1, remove = true, count_already_playing = true },
}
sounds.behemoth_gore_worm =
{
  category = "enemy",
  variations = sound_variations("__base__/sound/particles/behemoth-gore-worm", 5, 0.8, volume_multiplier("main-menu", 0.7) ),
  aggregation = { max_count = 1, remove = true, count_already_playing = true },
}
sounds.spawner_gore =
{
  category = "enemy",
  variations = sound_variations("__base__/sound/particles/spawner-gore", 5, 0.7, volume_multiplier("main-menu", 0.6) ),
  aggregation = { max_count = 2, remove = true, count_already_playing = true },
}
sounds.manual_repair = sound_variations("__base__/sound/manual-repair-simple", 5, 0.5)
sounds.logistics_chest_open =
{
  variations = sound_variations("__base__/sound/passive-provider-chest-open", 5, 0.3),
  aggregation = {max_count = 1, remove = true}
}
sounds.gate_open =
{
  variations = sound_variations("__base__/sound/gate-open", 5, 0.55, volume_multiplier("main-menu", 2.6)),
  aggregation = {max_count = 3, remove = true}
}
sounds.gate_close =
{
  variations = sound_variations("__base__/sound/gate-close", 5, 0.55, volume_multiplier("main-menu", 2.6)),
  aggregation = {max_count = 3, remove = true}
}

--enemies
sounds.biter_roars = function(volume)
  return
  {
    category = "enemy",
    variations = sound_variations("__base__/sound/creatures/biter-roar", 6, volume, volume_multiplier("main-menu", 0.7) ),
    aggregation = { max_count = 2, remove = true, count_already_playing = true }
  }
end
sounds.biter_roars_mid = function(volume)
  return
  {
    category = "enemy",
    variations = sound_variations("__base__/sound/creatures/biter-roar-mid", 7, volume, volume_multiplier("main-menu", 0.7) ),
    aggregation = { max_count = 2, remove = true, count_already_playing = true }
  }
end
sounds.biter_roars_big = function(volume)
  return
  {
    category = "enemy",
    variations = sound_variations("__base__/sound/creatures/biter-roar-big", 5, volume, volume_multiplier("main-menu", 0.7) ),
    aggregation = { max_count = 1, remove = true, count_already_playing = true }
  }
end
sounds.biter_roars_behemoth = function(volume)
  return
  {
    category = "enemy",
    variations = sound_variations("__base__/sound/creatures/biter-roar-behemoth", 9, volume, volume_multiplier("main-menu", 0.7) ),
    aggregation = { max_count = 1, remove = true, count_already_playing = true }
  }
end
sounds.biter_dying = function(volume)
  return
  {
    category = "enemy",
    variations = sound_variations("__base__/sound/creatures/biter-death", 5, volume, volume_multiplier("main-menu", 1.4) ),
    aggregation = { max_count = 3, remove = true, count_already_playing = true }
  }
end
sounds.biter_dying_big = function(volume)
  return
  {
    category = "enemy",
    variations = sound_variations("__base__/sound/creatures/biter-death-big", 5, volume, volume_multiplier("main-menu", 0.8) ),
    aggregation = { max_count = 3, remove = true, count_already_playing = true }
  }
end

sounds.biter_calls = function(min_volume, max_volume)
  return
  {
    sound =
    {
      category = "enemy",
      variations = sound_variations_with_volume_variations("__base__/sound/creatures/biter-call", 5, min_volume, max_volume or min_volume)
    },
    probability = 1 / (12 * 60), -- average pause between the sound is 12 seconds
    max_sounds_per_type = 2
  }
end

sounds.biter_calls_big = function(min_volume, max_volume)
  return
  {
    sound =
    {
      category = "enemy",
      variations = sound_variations_with_volume_variations("__base__/sound/creatures/biter-call-big", 6, min_volume, max_volume or min_volume)
    },
    probability = 1 / (4 * 60), -- average pause between the sound is 4 seconds
    max_sounds_per_type = 2
  }
end

sounds.biter_calls_behemoth = function(min_volume, max_volume)
  return
  {
    sound =
    {
      category = "enemy",
      variations = sound_variations_with_volume_variations("__base__/sound/creatures/biter-call-behemoth", 6, min_volume, max_volume or min_volume)
    },
    probability = 1 / (4 * 60), -- average pause between the sound is 4 seconds
    max_sounds_per_type = 2
  }
end

sounds.biter_walk = function(min_volume, max_volume)
  return
  {
    aggregation =
    {
      max_count = 3,
      remove = true,
      count_already_playing = true
    },
    variations = sound_variations_with_volume_variations("__base__/sound/creatures/biter-walk", 7, min_volume, max_volume or min_volume, volume_multiplier("main-menu", 1.8)),
    priority = 192
  }
end

sounds.biter_walk_big = function(min_volume, max_volume)
  return
  {
    aggregation =
    {
      max_count = 3,
      remove = true,
      count_already_playing = true
    },
    variations = sound_variations_with_volume_variations("__base__/sound/creatures/biter-walk-big", 10, min_volume, max_volume or min_volume, volume_multiplier("main-menu", 0.6)),
    priority = 192
  }
end

sounds.spitter_walk = function(min_volume, max_volume)
  return
  {
    aggregation =
    {
      max_count = 2,
      remove = true,
      count_already_playing = true
    },
    variations = sound_variations_with_volume_variations("__base__/sound/creatures/spitter-walk", 10, min_volume, max_volume or min_volume, volume_multiplier("main-menu", 0.6)),
    priority = 192
  }
end

sounds.spitter_walk_big = function(min_volume, max_volume)
  return
  {
    aggregation =
    {
      max_count = 2,
      remove = true,
      count_already_playing = true
    },
    variations = sound_variations_with_volume_variations("__base__/sound/creatures/spitter-walk-big", 10, min_volume, max_volume or min_volume, volume_multiplier("main-menu", 0.6)),
    priority = 192
  }
end

sounds.spitter_calls = function(min_volume, max_volume)
  return
  {
    sound =
    {
      category = "enemy",
      variations = sound_variations_with_volume_variations("__base__/sound/creatures/spitter-call-small", 9, min_volume, max_volume or min_volume, volume_multiplier("main-menu", 0.5))
    },
    probability = 1 / (4 * 60), -- average pause between the sound is 4 seconds
    max_sounds_per_type = 2
  }
end

sounds.spitter_calls_med = function(min_volume, max_volume)
  return
  {
    sound =
    {
      category = "enemy",
      variations = sound_variations_with_volume_variations("__base__/sound/creatures/spitter-call-med", 10, min_volume, max_volume or min_volume)
    },
    probability = 1 / (8 * 60), -- average pause between the sound is 8 seconds
    max_sounds_per_type = 2
  }
end

sounds.spitter_calls_big = function(min_volume, max_volume)
  return
  {
    sound =
    {
      category = "enemy",
      variations = sound_variations_with_volume_variations("__base__/sound/creatures/spitter-call-big", 5, min_volume, max_volume or min_volume)
    },
    probability = 1 / (4 * 60), -- average pause between the sound is 4 seconds
    max_sounds_per_type = 2
  }
end

sounds.spitter_roars = function(volume)
  return
  {
    layers =
    {
      [0] =
      {
        {
          filename = "__base__/sound/creatures/Spiters_1_1.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_2_1.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_3_1.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_4_1.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_5_1.ogg",
          volume = volume
        }
      },
      [1] =
      {
        {
          filename = "__base__/sound/creatures/Spiters_1_2.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_2_2.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_3_2.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_4_2.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_5_2.ogg",
          volume = volume
        }
      }
    }
  }
end

sounds.spitter_dying = function(volume)
  return
  {
    category = "enemy",
    variations = sound_variations("__base__/sound/creatures/spitter-death", 5, volume, volume_multiplier("main-menu", 0.6) ),
    aggregation = { max_count = 3, remove = true, count_already_playing = true }
  } end

sounds.spitter_dying_mid = function(volume)
  return
  {
    category = "enemy",
    variations = sound_variations("__base__/sound/creatures/spitter-death-mid", 7, volume, volume_multiplier("main-menu", 0.6) ),
    aggregation = { max_count = 2, remove = true, count_already_playing = true }
  } end

sounds.spitter_dying_big = function(volume)
  return
  {
    category = "enemy",
    variations = sound_variations("__base__/sound/creatures/spitter-death-big", 7, volume, volume_multiplier("main-menu", 0.6) ),
    aggregation = { max_count = 2, remove = true, count_already_playing = true }
  } end

sounds.spitter_dying_behemoth = function(volume)
  return
  {
    category = "enemy",
    variations = sound_variations("__base__/sound/creatures/spitter-death-behemoth", 7, volume, volume_multiplier("main-menu", 0.6) ),
    aggregation = { max_count = 2, remove = true, count_already_playing = true }
  } end

sounds.worm_roars = function(min_volume, max_volume)
  return
  {
    category = "enemy",
    variations = sound_variations_with_volume_variations("__base__/sound/creatures/worm-roar", 4, min_volume, max_volume or min_volume, volume_multiplier("main-menu", 0.9) ),
    audible_distance_modifier = 1.5,
    aggregation = { max_count = 3, remove = true, count_already_playing = true }
  }
end

sounds.worm_roars_big = function(min_volume, max_volume)
  return
  {
    category = "enemy",
    variations = sound_variations_with_volume_variations("__base__/sound/creatures/worm-roar-big", 5, min_volume, max_volume or min_volume, volume_multiplier("main-menu", 0.9) ),
    audible_distance_modifier = 1.3,
    aggregation = { max_count = 3, remove = true, count_already_playing = true }
  }
end

sounds.worm_roar_alternative = function(min_volume, max_volume)
  return
  {
    category = "enemy",
    variations = sound_variations_with_volume_variations("__base__/sound/creatures/worm-roar-alt", 5, min_volume, max_volume or min_volume, volume_multiplier("main-menu", 0.9) ),
    audible_distance_modifier = 2.0,
    aggregation = { max_count = 3, remove = true, count_already_playing = true }
  }
end

sounds.worm_roar_alternative_big = function(min_volume, max_volume)
  return
  {
    category = "enemy",
    variations = sound_variations_with_volume_variations("__base__/sound/creatures/worm-roar-alt-big", 5, min_volume, max_volume or min_volume, volume_multiplier("main-menu", 0.9) ),
    audible_distance_modifier = 1.8,
    aggregation = { max_count = 3, remove = true, count_already_playing = true }
  }
end

sounds.worm_breath = function(min_volume, max_volume)
  return
  {
    category = "enemy",
    variations = sound_variations_with_volume_variations("__base__/sound/creatures/worm-breathe", 8, min_volume, max_volume or min_volume),
    aggregation = { max_count = 2, remove = true, count_already_playing = true },
    audible_distance_modifier = 1.2
  }
end

sounds.worm_breath_big = function(min_volume, max_volume)
  return
  {
    category = "enemy",
    variations = sound_variations_with_volume_variations("__base__/sound/creatures/worm-breathe-big", 8, min_volume, max_volume or min_volume),
    aggregation = { max_count = 2, remove = true, count_already_playing = true },
    audible_distance_modifier = 1.5
  }
end

sounds.worm_dying_small = function(volume)
  return
  {
    category = "enemy",
    variations = sound_variations("__base__/sound/creatures/worm-death-small", 4, volume, volume_multiplier("main-menu", 0.9) ),
    aggregation = { max_count = 3, remove = true, count_already_playing = true },
    audible_distance_modifier = 1.5
  }
  end

sounds.worm_dying = function(volume)
  return
  {
    category = "enemy",
    variations = sound_variations("__base__/sound/creatures/worm-death", 7, volume),
    aggregation = { max_count = 2, remove = true, count_already_playing = true },
    audible_distance_modifier = 2.5
  }
  end

sounds.worm_dying_big = function(volume)
  return
  {
    category = "enemy",
    variations = sound_variations("__base__/sound/creatures/worm-death-big", 7, volume),
    aggregation = { max_count = 2, remove = true, count_already_playing = true },
    audible_distance_modifier = 2
  }
end
sounds.worm_dying_behemoth = function(volume)
  return
  {
    category = "enemy",
    variations = sound_variations("__base__/sound/creatures/worm-death-behemoth", 5, volume),
    aggregation = { max_count = 2, remove = true, count_already_playing = true },
    audible_distance_modifier = 2
  }
end

sounds.worm_fold = function(volume)
  return
  {
    category = "enemy",
    variations = sound_variations("__base__/sound/creatures/worm-folding", 3, volume)
  }
end
sounds.worm_standup = function(volume)
  return
  {
     category = "enemy",
     variations = sound_variations("__base__/sound/creatures/worm-standup", 5, volume),
     aggregation = { max_count = 2, remove = true, count_already_playing = true },
  }
end

sounds.worm_standup_small = function(volume)
  return
  {
    category = "enemy",
    variations = sound_variations("__base__/sound/creatures/worm-standup-small", 3, volume),
    aggregation = { max_count = 2, remove = true, count_already_playing = true },
  }
end

sounds.upper_giga_hatch_opening_sound =
{
  sound =
  {
    filename = "__base__/sound/entity/cargo-hatch/upper-giga-hatch-opening-loop.ogg",
    volume = 0.8,
    aggregation = {max_count = 1, remove = true, count_already_playing = true}
  },
  stopped_sound =
  {
    filename = "__base__/sound/entity/cargo-hatch/upper-giga-hatch-opening-stop.ogg",
    volume = 0.4,
    aggregation = {max_count = 1, remove = true, count_already_playing = true}
  },
  minimal_sound_duration_for_stopped_sound = 25,
}
sounds.upper_giga_hatch_closing_sound =
{
  sound =
  {
    filename = "__base__/sound/entity/cargo-hatch/upper-giga-hatch-closing-loop.ogg",
    volume = 0.4,
    aggregation = {max_count = 1, remove = true, count_already_playing = true}
  },
  stopped_sound =
  {
    filename = "__base__/sound/entity/cargo-hatch/upper-giga-hatch-closing-stop.ogg",
    volume = 0.5,
    aggregation = {max_count = 1, remove = true, count_already_playing = true}
  },
}
sounds.lower_giga_hatch_opening_sound =
{
  sound =
  {
    filename = "__base__/sound/entity/cargo-hatch/lower-giga-hatch-opening-loop.ogg",
    volume = 0.5,
    aggregation = {max_count = 1, remove = true, count_already_playing = true}
  },
  stopped_sound =
  {
    filename = "__base__/sound/entity/cargo-hatch/lower-giga-hatch-opening-stop.ogg",
    volume = 0.5,
    aggregation = {max_count = 1, remove = true, count_already_playing = true}
  },
  minimal_sound_duration_for_stopped_sound = 25,
}
sounds.lower_giga_hatch_closing_sound =
{
  sound =
  {
    filename = "__base__/sound/entity/cargo-hatch/lower-giga-hatch-closing-loop.ogg",
    volume = 0.5,
    aggregation = {max_count = 1, remove = true, count_already_playing = true}
  },
  stopped_sound =
  {
    filename = "__base__/sound/entity/cargo-hatch/lower-giga-hatch-closing-stop.ogg",
    volume = 0.35,
    aggregation = {max_count = 1, remove = true, count_already_playing = true}
  },
}

return sounds

local tile_sounds = {}

local walking_sounds = {}
walking_sounds.semi_wet =
{
  variations = sound_variations("__space-age__/sound/walking/semi-wet-rock", 10, 0.7),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.semi_dry =
{
  variations = sound_variations("__space-age__/sound/walking/semi-dry-rock", 10, 0.8),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.soft_bark =
{
  variations = sound_variations("__space-age__/sound/walking/soft-bark", 10, 0.8),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.dry_rock =
{
  variations = sound_variations("__space-age__/sound/walking/dry-rock", 10, 0.8),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.slime =
{
  variations = sound_variations("__space-age__/sound/walking/slime", 10, 0.8),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.wetland =
{
  variations = sound_variations("__space-age__/sound/walking/wetland", 10, 0.6),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.rugged_stone = function(parameters)
  return
  {
    variations = sound_variations("__space-age__/sound/walking/rugged-stone", 10, 0.8, parameters.modifiers),
    advanced_volume_control = default_tile_sounds_advanced_volume_control(),
  }
end
walking_sounds.rocky_stone = function(parameters)
  return
  {
    variations = sound_variations("__space-age__/sound/walking/rocky-stone", 10, 0.8, parameters.modifiers),
    advanced_volume_control = default_tile_sounds_advanced_volume_control(),
  }
end
walking_sounds.soft_sand = function(parameters)
  return
  {
    variations = sound_variations("__space-age__/sound/walking/soft-sand", 10, parameters.volume or 1, parameters.modifiers),
    advanced_volume_control = default_tile_sounds_advanced_volume_control(),
  }
end
walking_sounds.warm_stone =
{
  variations = sound_variations("__space-age__/sound/walking/warm-stone", 10, 1),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.scraps =
{
  variations = sound_variations("__space-age__/sound/walking/scraps", 7, 0.4, volume_multiplier("main-menu", 1.5)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.oil_deep =
{
  variations = sound_variations("__space-age__/sound/walking/oil-deep", 10, 0.35, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.snow =
{
  variations = sound_variations("__space-age__/sound/walking/snow", 10, 0.8, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.icy_snow =
{
  variations = sound_variations("__space-age__/sound/walking/icy-snow", 10, 0.8, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.ice =
{
  variations = sound_variations("__space-age__/sound/walking/ice", 10, 0.8, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.smooth_ice =
{
  variations = sound_variations("__space-age__/sound/walking/smooth-ice", 9, 0.8),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.frozen_concrete =
{
  variations = sound_variations("__space-age__/sound/walking/frozen-concrete", 11, 0.8),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
tile_sounds.walking = walking_sounds

local driving_sounds = {}
driving_sounds.wetland =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-water-shallow.ogg", volume = 0.6,
    advanced_volume_control = default_tile_sounds_advanced_volume_control(),
  },
  fade_ticks = 6
}
driving_sounds.uneven_stone =
{
  sound =
  {
    filename = "__space-age__/sound/driving/vehicle-surface-uneven-stone.ogg", volume = 0.8,
    advanced_volume_control = default_tile_sounds_advanced_volume_control(),
  },
  fade_ticks = 6
}
driving_sounds.metal_rock =
{
  sound =
  {
    filename = "__space-age__/sound/driving/vehicle-surface-metal-rock.ogg", volume = 0.6,
    advanced_volume_control = default_tile_sounds_advanced_volume_control(),
  },
  fade_ticks = 6,
}
driving_sounds.snow =
{
  sound =
  {
    filename = "__space-age__/sound/driving/vehicle-surface-snow.ogg", volume = 0.8,
    advanced_volume_control = default_tile_sounds_advanced_volume_control(),
  },
  fade_ticks = 6,
}
driving_sounds.ice =
{
  sound =
  {
    filename = "__space-age__/sound/driving/vehicle-surface-ice.ogg", volume = 0.5,
    advanced_volume_control = default_tile_sounds_advanced_volume_control(),
  },
  fade_ticks = 6
}
tile_sounds.driving = driving_sounds

local building_sounds = {}
building_sounds.space_platform =
{
  small = sound_variations("__core__/sound/build-concrete-small", 6, 0.4), -- used in editor
  medium = sound_variations("__core__/sound/build-concrete-medium", 6, 0.5), -- used in editor
  large =  sound_variations("__core__/sound/build-concrete-large", 6, 0.5), -- used in editor
  animated =
  {
    variations = sound_variations("__space-age__/sound/terrain/space-platform-tile-build", 7, 0.5),
    aggregation = {max_count = 3, remove = true, count_already_playing = true, priority = "oldest", progress_threshold = 0.6},
  },
}
tile_sounds.building = building_sounds

local landing_sounds = {}
landing_sounds.wet =
{
  variations = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-wet", 3, 0.6, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
landing_sounds.semi_wet =
{
  variations = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-semi-wet", 3, 1.0, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
landing_sounds.rock =
{
  variations = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-rock", 3, 1.0, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
landing_sounds.bark =
{
  variations = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-bark", 3, 1.0, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
landing_sounds.snow =
{
  variations = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-snow", 3, 1.0, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
landing_sounds.ice =
{
  variations = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-ice", 3, 0.5, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
landing_sounds.sand =
{
  variations = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-sand", 3, 1.0, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
landing_sounds.concrete =
{
  variations = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-concrete", 3, 1.0, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
landing_sounds.grass =
{
  variations = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-grass", 3, 1.0, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
landing_sounds.scraps =
{
  variations = sound_variations("__space-age__/sound/walking/scraps", 7, 1.0, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
landing_sounds.oil =
{
  variations = sound_variations("__base__/sound/walking/resources/oil", 7, 1, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
tile_sounds.landing = landing_sounds

local ambient_sounds = {}
ambient_sounds.waterlap =
{
  sound =
  {
    variations = sound_variations("__base__/sound/world/water/waterlap", 10, 0.4),
    advanced_volume_control = default_tile_sounds_advanced_volume_control()
  },
  radius = 7.5,
  min_entity_count = 10,
  max_entity_count = 30,
  entity_to_sound_ratio = 0.1,
  average_pause_seconds = 8,
}
ambient_sounds.rain_on_water =
{
  sound =
  {
    variations = sound_variations("__space-age__/sound/world/tiles/rain-on-water", 10, 0.2),
    advanced_volume_control = default_tile_sounds_advanced_volume_control()
  },
  min_entity_count = 10,
  max_entity_count = 25,
  entity_to_sound_ratio = 0.1,
  average_pause_seconds = 5,
}
ambient_sounds.insects_deep_mud = function(parameters)
  return
  {
    sound =
    {
      variations = sound_variations("__space-age__/sound/world/tiles/insects-deep-mud", 8, parameters.volume or 0.4),
      advanced_volume_control = default_tile_sounds_advanced_volume_control()
    },
    radius = parameters.radius or 7.5,
    min_entity_count = parameters.min_entity_count or 10,
    max_entity_count = parameters.max_entity_count or 15,
    entity_to_sound_ratio = parameters.entity_to_sound_ratio or 0.1,
    average_pause_seconds = parameters.average_pause_seconds or 3,
  }
end
ambient_sounds.night_frogs =
{
  sound =
  {
    variations = sound_variations("__space-age__/sound/world/tiles/night-frogs", 10, 0.3),
    advanced_volume_control =
    {
      fades = {fade_in = {curve_type = "cosine", from = {0.5, 0.0}, to = {1.5, 100.0}}},
      darkness_threshold = 0.85,
    }
  },
  min_entity_count = 20,
  max_entity_count = 25,
  entity_to_sound_ratio = 0.1,
  average_pause_seconds = 8,
}
ambient_sounds.night_insects =
{
  sound =
  {
    variations = sound_variations("__space-age__/sound/world/tiles/night-insects", 10, 0.3),
    advanced_volume_control =
    {
      fades = {fade_in = {curve_type = "cosine", from = {0.5, 0.0}, to = {1.5, 100.0}}},
      darkness_threshold = 0.85
    }
  },
  min_entity_count = 10,
  max_entity_count = 15,
  entity_to_sound_ratio = 0.1,
  average_pause_seconds = 5,
}
ambient_sounds.lava =
{
  sound =
  {
    variations = sound_variations("__space-age__/sound/world/tiles/lava", 10, 0.5 ),
    advanced_volume_control = default_tile_sounds_advanced_volume_control()
  },
  radius = 7.5,
  min_entity_count = 10,
  max_entity_count = 30,
  entity_to_sound_ratio = 0.1,
  average_pause_seconds = 3,
}
ambient_sounds.magma =
{
  sound =
  {
    variations = sound_variations("__space-age__/sound/world/tiles/magma", 10, 0.7 ),
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {0.5, 0.0 }, to = {1.5, 100.0}}}}
  },
  radius = 7.5,
  min_entity_count = 10,
  max_entity_count = 30,
  entity_to_sound_ratio = 0.1,
  average_pause_seconds = 3,
}
ambient_sounds.sand =
{
  sound =
  {
    variations = sound_variations("__space-age__/sound/world/semi-persistent/sand-wind-gust", 5, 0.8),
    advanced_volume_control = {fades = {fade_in = {curve_type = "S-curve", from = {0.5, 0.0}, to = {1.5, 100.0}}}}
  },
  radius = 7.5,
  min_entity_count = 10,
  max_entity_count = 30,
  entity_to_sound_ratio = 0.1,
  average_pause_seconds = 15,
}
ambient_sounds.oil_deep =
{
  sound =
  {
    variations = sound_variations("__space-age__/sound/world/tiles/oil-gloop", 10, 0.15),
    advanced_volume_control = {fades = {fade_in = {curve_type = "S-curve", from = {0.5, 0.0}, to = {1.5, 100.0}}}}
  },
  radius = 7.5,
  min_entity_count = 10,
  max_entity_count = 30,
  entity_to_sound_ratio = 0.1,
  average_pause_seconds = 15,
}
tile_sounds.ambient = ambient_sounds

return tile_sounds

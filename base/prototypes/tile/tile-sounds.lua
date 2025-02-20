local tile_sounds = {}

local walking_sounds = {}
walking_sounds.grass =
{
  variations = sound_variations("__base__/sound/walking/grass", 10, 0.8, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.sand =
{
  variations = sound_variations("__base__/sound/walking/sand", 9, 0.8, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.concrete =
{
  variations = sound_variations("__base__/sound/walking/concrete", 11, 0.5),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.refined_concrete =
{
  variations = sound_variations("__base__/sound/walking/refined-concrete", 11, 0.5),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.shallow_water =
{
  variations = sound_variations("__base__/sound/walking/shallow-water", 7, 1, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.dirt =
{
  variations = sound_variations("__base__/sound/walking/dirt-1", 10, 0.8, volume_multiplier("main-menu", 2.9)),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.plant =
{
  variations = sound_variations("__base__/sound/walking/plant/plant", 5, 0.4),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.big_bush =
{
  variations = sound_variations("__base__/sound/walking/plant/bush-big", 7, 0.3),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.small_bush =
{
  variations = sound_variations("__base__/sound/walking/plant/bush-small", 7, 0.6),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.pebble =
{
  variations = sound_variations("__base__/sound/walking/pebble/stones", 9, 0.6),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.hairy_grass =
{
  variations = sound_variations("__base__/sound/walking/decorative-grass", 10, 0.3),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.carpet_grass =
{
  variations = sound_variations("__base__/sound/walking/decorative-grass", 10, 0.2),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.mud =
{
  variations = sound_variations("__base__/sound/walking/decorative-mud", 10, 0.3),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.ore =
{
  variations = sound_variations("__base__/sound/walking/resources/ore", 10, 0.7),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
walking_sounds.oil = function(parameters)
  return
  {
    variations = sound_variations("__base__/sound/walking/resources/oil", 7, parameters.volume or 0.7, parameters.modifiers),
    advanced_volume_control = default_tile_sounds_advanced_volume_control(),
  }
end
walking_sounds.rails =
{
  variations = sound_variations("__base__/sound/walking/rails/rails", 12, 0.6),
  advanced_volume_control = default_tile_sounds_advanced_volume_control(),
}
tile_sounds.walking = walking_sounds

local driving_sounds = {}
driving_sounds.stone =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-stone.ogg", volume = 0.8,
    advanced_volume_control = default_tile_sounds_advanced_volume_control(),
  },
  fade_ticks = 6
}
driving_sounds.grass =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-grass.ogg", volume = 0.5,
    advanced_volume_control = default_tile_sounds_advanced_volume_control(),
  },
  fade_ticks = 6
}
driving_sounds.sand =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-sand.ogg", volume = 0.8,
    advanced_volume_control = default_tile_sounds_advanced_volume_control(),
  },
  fade_ticks = 6
}
driving_sounds.concrete =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-concrete.ogg", volume = 0.8,
    advanced_volume_control = default_tile_sounds_advanced_volume_control(),
  },
  fade_ticks = 6
}
driving_sounds.shallow_water =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-water-shallow.ogg", volume = 0.8,
    advanced_volume_control = default_tile_sounds_advanced_volume_control(),
  },
  fade_ticks = 6
}
driving_sounds.oil =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-oil.ogg", volume = 0.6,
    advanced_volume_control = default_tile_sounds_advanced_volume_control(),
  },
  fade_ticks = 6
}
tile_sounds.driving = driving_sounds

building_sounds = {}
building_sounds.landfill =
{
  small =
  {
    switch_vibration_data =
    {
      gain = 0.25,
      filename = "__core__/sound/landfill-small.bnvib"
    },
    variations = sound_variations("__core__/sound/landfill-small", 6, 1)
  },
  medium =
  {
    switch_vibration_data =
    {
      gain = 0.25,
      filename = "__core__/sound/landfill-medium.bnvib"
    },
    variations = sound_variations("__core__/sound/landfill-medium", 6,  0.8)
  },
  large =
  {
    switch_vibration_data =
    {
      gain = 0.25,
      filename = "__core__/sound/landfill-large.bnvib"
    },
    variations = sound_variations("__core__/sound/landfill-large", 6, 0.5)
  }
}
building_sounds.concrete =
{
  small =
  {
    switch_vibration_data =
    {
      gain = 0.25,
      filename = "__core__/sound/build-concrete-small.bnvib"
    },
    variations = sound_variations("__core__/sound/build-concrete-small", 6, 0.4)
  },
  medium =
  {
    switch_vibration_data =
    {
      gain = 0.15,
      filename = "__core__/sound/build-concrete-medium.bnvib"
    },
    variations = sound_variations("__core__/sound/build-concrete-medium", 6, 0.5)
  },
  large =
  {
    switch_vibration_data =
    {
      gain = 0.15,
      filename = "__core__/sound/build-concrete-large.bnvib"
    },
    variations = sound_variations("__core__/sound/build-concrete-large", 6, 0.5)
  }
}
tile_sounds.building = building_sounds

local ambient_sounds = {}
ambient_sounds.water = function(parameters)
  return
  {
    sound =
    {
      variations = sound_variations("__base__/sound/world/water/waterlap", 10, parameters.volume or 0.4),
      advanced_volume_control =
      {
        fades =
        {
          fade_in =
          {
            curve_type = "S-curve",
            from = {control = 0.5, volume_percentage = 0.0},
            to = {control = 1.5, volume_percentage = 100.0},
          }
        }
      }
    },
    radius = 7.5,
    min_entity_count = 10,
    max_entity_count = 30,
    entity_to_sound_ratio = 0.1,
    average_pause_seconds = parameters.average_pause_seconds or 3,
  }
end
tile_sounds.ambient = ambient_sounds

return tile_sounds

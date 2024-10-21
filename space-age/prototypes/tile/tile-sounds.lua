local tile_sounds = {}

local landing_sounds = {}
landing_sounds.wet = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-wet", 3, 0.6, volume_multiplier("main-menu", 2.9))
landing_sounds.semi_wet = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-semi-wet", 3, 1.0, volume_multiplier("main-menu", 2.9))
landing_sounds.rock = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-rock", 3, 1.0, volume_multiplier("main-menu", 2.9))
landing_sounds.bark = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-bark", 3, 1.0, volume_multiplier("main-menu", 2.9))
landing_sounds.snow = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-snow", 3, 1.0, volume_multiplier("main-menu", 2.9))
landing_sounds.ice = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-ice", 3, 0.5, volume_multiplier("main-menu", 2.9))
landing_sounds.sand = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-sand", 3, 1.0, volume_multiplier("main-menu", 2.9))
landing_sounds.concrete = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-concrete", 3, 1.0, volume_multiplier("main-menu", 2.9))
landing_sounds.grass = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-land-grass", 3, 1.0, volume_multiplier("main-menu", 2.9))
tile_sounds.landing = landing_sounds;

local walking_sounds = {}
tile_sounds.walking = walking_sounds;

return tile_sounds;

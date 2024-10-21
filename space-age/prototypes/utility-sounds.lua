require("sound-util")

data.raw["utility-sounds"]["default"].segment_dying_sound =
{
  category = "enemy",
  variations = sound_variations("__space-age__/sound/enemies/demolisher/demolisher-death", 2, 1.0, volume_multiplier("main-menu", 0.5)),
  aggregation = {max_count = 1, remove = true, count_already_playing = true}
}

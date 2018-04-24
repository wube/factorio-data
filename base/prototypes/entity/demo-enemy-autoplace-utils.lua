function enemy_autoplace(distance, order, is_turret)
  local optimal_tier = 13 + 2.6 * distance
  local ret = {
    sharpness = 0.4,
    control = "enemy-base",
    order = order,
    richness_multiplier = 1,
    richness_base = 0,
    --richness_multiplier_distance_bonus = 1,
    force = "enemy",
    random_probability_penalty = 0.05,
    peaks =
    {
      {
        influence = 0,
        richness_influence = 100,
        tier_from_start_optimal = optimal_tier,
        tier_from_start_top_property_limit = optimal_tier,
        tier_from_start_max_range = 2 * optimal_tier,
      },
      {
        influence = -10.0,
        starting_area_weight_optimal = 1,
        starting_area_weight_range = 0,
        starting_area_weight_max_range = 2,
      },
      {
        influence = 0.223,
        noise_layer = "enemy-base",
        noise_octaves_difference = -1.8,
        noise_persistence = 0.5,
      },
      -- increase the size when moving further away
      {
        influence = 0.333,
        noise_layer = "enemy-base",
        noise_octaves_difference = -1.8,
        noise_persistence = 0.5,
        tier_from_start_optimal = optimal_tier,
        tier_from_start_top_property_limit = optimal_tier,
        tier_from_start_max_range = 2 * optimal_tier,
      },
      {
        influence = 0.001 * distance -- tieberaker
      }
    }
  }

  for i, resource in ipairs({"copper-ore", "iron-ore", "coal", "stone"}) do
    -- Prefer bases on resources
    ret.peaks[#ret.peaks + 1] = {
        influence = 0.03,
        noise_layer = resource,
        noise_octaves_difference = -2,
        noise_persistence = 0.3,
        min_influence = 0,
      }
  end

  if data.is_demo then
    ret.peaks[#ret.peaks + 1] = {
        influence = 0.04,
        noise_layer = "crude-oil",
        noise_octaves_difference = -1,
        noise_persistence = 0.4,
        min_influence = 0,
      }
  end

  if is_turret then
    ret.max_probability = 0.2;
  end

  return ret
end

function enemy_spawner_autoplace(distance)
  return enemy_autoplace(distance, "b[enemy]-a[spawner]", false)
end

function enemy_worm_autoplace(distance)
  return enemy_autoplace(distance, "b[enemy]-b[worm]", true)
end

--[[
Objectives:
Deep water lakes
Lowland: Shallow water swamp with patches of solid land (dirt), surrounding the lakes, bordering midland. Has mud and coal in the water and dirt. Has most of the oil-processing plants.
Midland: A narow shelf of grassland bordering the lowland and highland, the main area for rails and agriculture. Has most of the tree-like plants.
Highland: Plateus of desert, the main place for metals, better for base building. Has a few plants too.

Elevation strategy:
Inverted billows (ridge) is the main distribution of lakes, swamps, and ridges of midland.
Cones noise defines highland and a ring of midland.
The 2 are maxed together.

below 0 is deep water.
0-2 is shallows
2-20 is lowland.
20-120 is midland
120+ is highland

IMPORTANT: If the elevation ranges are changed the fullowing need to be updated:
  gleba_moisture
  high-mid-low selection ranges

]]

data:extend{
  {
    type = "noise-expression",
    name = "gleba_water_frequency",
    expression = "slider_rescale(control:gleba_water:frequency, 2)"
  },
  {
    type = "noise-function",
    name = "gleba_pos_peak",
    parameters = {"input", "point", "range"},
    expression = "max(0, 1 - abs(input - point) / range)"
  },
  {
    type = "noise-function",
    name = "gleba_select", -- for range max-min 0-1, adds an external falloff with the width of the slope
    parameters = {"input", "from", "to", "slope", "min", "max"},
    expression = "clamp(min(input - (from - slope), to + slope - input) / slope, min, max)"
  },
  {
    type = "noise-expression",
    name = "gleba_wobble_x", -- only add to input X or Y
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 2000, octaves = 3, input_scale = 1/20}"
  },
  {
    type = "noise-expression",
    name = "gleba_wobble_y", -- only add to input X or Y
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 3000, octaves = 3, input_scale = 1/20}"
  },
  {
    type = "noise-expression",
    name = "gleba_wobble_small_x", -- only add to input X or Y
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 2000, octaves = 2, input_scale = 1/6}"
  },
  {
    type = "noise-expression",
    name = "gleba_wobble_small_y", -- only add to input X or Y
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 3000, octaves = 2, input_scale = 1/6}"
  },
  {
    type = "noise-expression",
    name = "gleba_cliffiness",
    expression = "max(0.95 * cliffiness_basic, 0.99 * (gleba_rockpools > 0))"
  },
  {
    type = "noise-expression",
    name = "gleba_aux",
    --intended_property = "aux",
    expression = "clamp(0.5 + 0.5 * lerp(aux_mutated, starting_aux, starting_radius) - min(0.2, gleba_rockpools), 0, 1)",
    local_expressions = {
      aux_pattern = "multioctave_noise{x = x + gleba_wobble_x * 15 + gleba_wobble_small_x * 5, y = y + gleba_wobble_y * 15 + gleba_wobble_small_y * 5, persistence = 0.75, octaves = 7, input_scale = 1/70, seed0 = map_seed, seed1 = 7000}",
      starting_radius = "clamp(1 - distance / gleba_starting_area_multiplier / 900, 0, 0.9)",
      starting_aux = "clamp(-starting_rotated_y / gleba_starting_area_multiplier / 200, -2, 2)",
      aux_angle = "gleba_starting_angle - gleba_starting_direction * (distance / 20 / gleba_starting_area_multiplier - 15)",
      starting_rotated_y = "rotate_y(x_from_start, y_from_start, aux_angle) + gleba_wobble_x * 10",
      aux_mutator_large = "multioctave_noise{x = x, y = y, persistence = 0.75, octaves = 4, input_scale = 1/30, seed0 = map_seed, seed1 = 8000}",
      aux_mutator_small = "gleba_cover_noise",
      aux_mutator = "aux_mutator_large + 0.1 * aux_mutator_small",
      aux_mutator_multiplier = "1 + 4 * gleba_select(aux_mutator, 1.4, 3, 0.5, 0, 1) - 0.9 * gleba_select(aux_mutator, -3, -1.4, 0.5, 0, 1)",
      aux_mutated = "clamp(aux_pattern * aux_mutator_multiplier, -3, 3)" -- makes invader pockets on middle aux, or magnfied aux.
    }
  },
  {
    type = "noise-expression",
    name = "gleba_moisture",
    --intended_property = "moisture",
    -- moisture follows elevation but makes the biome progression more linear. in elevation lowland is a small elevation range (20) compared to the 200+ total range.
    -- for moisture 1-0.75 is water, 0.75-0.5 is lowland, 0.5-0.25 is midland, 0.25- is highland
    -- this range is moer useful for gradual decorative blending
    -- Don't use gleba_elevation as it has a compressed low-mid transition, gleba_elevation_common is smoother
    expression = "lerp(clamp(1 - min(0.25 + (gleba_elevation_common / 80), 0.5 + (gleba_elevation_common - 20) / 400), 0, 1), 0.35, min(1, gleba_rockpools_pitrock * 5))"
  },
  {
    type = "noise-expression",
    name = "gleba_temperature", -- used for biome health. Lower temperature is more pale, hot more vibrant
    --intended_property = "temperature",
    expression = "10 + gleba_temperature_normalised * 10"
  },
  {
    type = "noise-expression",
    name = "gleba_temperature_normalised", -- used for biome health. Lower temperature is more pale, hot more vibrant
    expression = "clamp(0.8 * multioctave_noise{x = x + gleba_wobble_x * 6, y = y + gleba_wobble_y * 6, persistence = 0.65, octaves = 4, input_scale = 1/4, seed0 = map_seed, seed1 = 18000}, -1, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_tri_ridge", -- from Space Exploration
    expression = "0.5 * ((tri_bc < tri_a) * (tri_a - tri_bc) + (tri_ac < tri_b) * (tri_b - tri_ac) + (tri_ab < tri_c) * (tri_c - tri_ab))",
    local_expressions =
    {
      tri_a = "1 + multioctave_noise{x = wobble_x, y = wobble_y, persistence = 0.65, octaves = 3, input_scale = 1/300*control:gleba_water:frequency, seed0 = map_seed, seed1 = 10000}",
      tri_b = "1 + multioctave_noise{x = wobble_x, y = wobble_y, persistence = 0.65, octaves = 3, input_scale = 1/300*control:gleba_water:frequency, seed0 = map_seed, seed1 = 20000}",
      tri_c = "1 + multioctave_noise{x = wobble_x, y = wobble_y, persistence = 0.65, octaves = 3, input_scale = 1/300*control:gleba_water:frequency, seed0 = map_seed, seed1 = 30000}",
      tri_ab = "max(tri_a, tri_b)",
      tri_ac = "max(tri_a, tri_c)",
      tri_bc = "max(tri_b, tri_c)",
      wobble_x = "x + gleba_wobble_x * 6",
      wobble_y = "y + gleba_wobble_y * 6"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_starting_direction",
    expression = "-1 + 2 * (map_seed_small & 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_starting_angle",
    expression = "map_seed_normalized * 3600"
  },
  {
    type = "noise-expression",
    name = "gleba_starting_area_multiplier",
    expression = "0.7"
  },
  {
    type = "noise-expression",
    name = "gleba_elevation_common",
    expression = "lerp(starting_main_blend, -1, enemies_water_knockout)",
    local_expressions =
    {
      enemies_water_knockout = "clamp(max(gleba_starting_enemies_safe, gleba_starting_enemies) * 2, 0, 1)",
      rockpool_elevation = "lerp(lerp(20, 80, gleba_rockpools < 0.3), 250, gleba_rockpools < 0.01)",
      starting_main_blend = "min(rockpool_elevation, lerp(terraces_combined, starting_area, clamp(1.7 - (distance / gleba_starting_area_multiplier / 500), 0, 1))) + 3 * (0.5 - abs(high_frequency))",
      starting_area = "max(-30 * clamp(starting_lakes * 2, 0, 1), 5 * min(gleba_starting_lowlands * 2, 1), 130 * min(starting_highlands * 2, 1), 80 * min(starting_midlands * 2, 1), 70 * min((starting_bridges - 0.5) * 3, 1)) + 6 * ridges_small_noise",
      spiral_angle = "gleba_starting_angle - gleba_starting_direction * (distance / gleba_starting_area_multiplier / 16 - 15)",
      starting_rotated_x = "rotate_x(x_from_start, y_from_start, spiral_angle) + gleba_wobble_x * 10",
      starting_rotated_y = "rotate_y(x_from_start, y_from_start, spiral_angle) + gleba_wobble_y * 10",
      starting_bridge = "min(1 - abs(starting_rotated_x / gleba_starting_area_multiplier - gleba_starting_direction * sin(starting_rotated_y / 64 / gleba_starting_area_multiplier) * 64 * gleba_starting_area_multiplier) / 110, 2 - distance / gleba_starting_area_multiplier / 700)",
      spiral_angle_b = "gleba_starting_angle + gleba_starting_direction * (distance / gleba_starting_area_multiplier / 16 - 15)", -- other direction
      starting_rotated_b_x = "rotate_x(x_from_start, y_from_start, spiral_angle_b) + gleba_wobble_x * 10",
      starting_rotated_b_y = "rotate_y(x_from_start, y_from_start, spiral_angle_b) + gleba_wobble_y * 10",
      --starting_bridge = "min(1 - abs(starting_rotated_x + sin(starting_rotated_y / 64) * 64) / 96, 1 - starting_rotated_y/32, 2 + starting_rotated_y/512)",
      starting_bridge_b = "min(1 - abs(starting_rotated_b_x / gleba_starting_area_multiplier - gleba_starting_direction * sin(starting_rotated_b_y / 64 / gleba_starting_area_multiplier) * 64 * gleba_starting_area_multiplier) / 110, 2 - distance / gleba_starting_area_multiplier / 700)",
      starting_bridges = "max(starting_bridge, starting_bridge_b)",
      high_frequency = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1, octaves = 3, input_scale = 1/18}",
      --peaks = "max(starting_highlands, multioctave_noise{x = x + gleba_wobble_x * 10, y = y + gleba_wobble_y * 10, persistence = 0.7, seed0 = map_seed, seed1 = 1000000, octaves = 3, input_scale = 1/60} + ridges)",
      peaks = "multioctave_noise{x = x + gleba_wobble_x * 10, y = y + gleba_wobble_y * 10, persistence = 0.7, seed0 = map_seed, seed1 = 1000000, octaves = 3, input_scale = 1/60*slider_rescale(gleba_water_frequency, 3)} + ridges",
      peaks_terrace = "terrace{value = min(150, -25 + peaks * 250), offset = 40, width = 20, strength = 0.2}",
      ridges_small_noise = "abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1000000, octaves = 3, input_scale = 1/60})",
      --ridges = "lerp(max(-gleba_tri_ridge, starting_bridge - 0.8, -0.1 + starting_midlands / 2) * 2.3, 0, min(1, starting_lowlands * 8)) + 0.2 * ridges_small_noise - clamp(starting_lakes * 4, 0, 1)",
      --ridges = "max(-gleba_tri_ridge, starting_bridge - 0.8) * 2.3 + 0.2 * ridges_small_noise",
      --ridges = "max(-gleba_tri_ridge, starting_bridges - 0.8) * 2.3 + 0.2 * ridges_small_noise", -- bridge extends out of starting area.
      ridges = "max(-gleba_tri_ridge * (0.6 + var('control:gleba_water:size') / 3), starting_bridges - 0.8) * 2.4 + 0.2 * ridges_small_noise", -- bridge extends out of starting area.
      ridge_terrace = "terrace{value = min(80, 110 + ridges * 500), offset = 40, width = 20, strength = 0.2}",
      terraces_combined = "max(ridge_terrace, peaks_terrace, 25 + 22 * ridges)",
      starting_highlands = "max(starting_highland_main, starting_highland_small)",
      starting_highland_main = "starting_spot_at_angle{ angle = gleba_starting_angle + 95 * gleba_starting_direction,\z
                                                        distance = 100 * gleba_starting_area_multiplier,\z
                                                        radius = 130 * gleba_starting_area_multiplier,\z
                                                        x_distortion = gleba_wobble_x * 15,\z
                                                        y_distortion = gleba_wobble_x * 15}",
      starting_highland_small = "starting_spot_at_angle{angle = gleba_starting_angle + 40 * gleba_starting_direction,\z
                                                        distance = 130 * gleba_starting_area_multiplier,\z
                                                        radius = 65 * gleba_starting_area_multiplier,\z
                                                        x_distortion = gleba_wobble_x * 15,\z
                                                        y_distortion = gleba_wobble_x * 15}",
      starting_midlands = "max(starting_midland_landing, starting_midland_iron, starting_midland_copper)",
      starting_midland_landing = "starting_spot_at_angle{ angle = gleba_starting_angle + 265 * gleba_starting_direction,\z
                                                          distance = 10 * gleba_starting_area_multiplier,\z
                                                          radius = 80 * gleba_starting_area_multiplier,\z
                                                          x_distortion = gleba_wobble_x * 15,\z
                                                          y_distortion = gleba_wobble_x * 15}",
      starting_midland_iron = "starting_spot_at_angle{angle = gleba_starting_angle + 180 * gleba_starting_direction,\z
                                                      distance = 120 * gleba_starting_area_multiplier,\z
                                                      radius = 130 * gleba_starting_area_multiplier,\z
                                                      x_distortion = gleba_wobble_x * 15,\z
                                                      y_distortion = gleba_wobble_x * 15}",
      starting_midland_copper = "starting_spot_at_angle{angle = gleba_starting_angle + 340 * gleba_starting_direction,\z
                                                        distance = 100 * gleba_starting_area_multiplier,\z
                                                        radius = 80 * gleba_starting_area_multiplier,\z
                                                        x_distortion = gleba_wobble_x * 15,\z
                                                        y_distortion = gleba_wobble_x * 15}",
      starting_lakes = "max(starting_stone_lake, starting_opposite_lake, starting_opposite_small_lake)",
      starting_stone_lake = "starting_spot_at_angle{angle = gleba_starting_angle + 90 * gleba_starting_direction,\z
                                                    distance = 500 * gleba_starting_area_multiplier,\z
                                                    radius = 350 * gleba_starting_area_multiplier,\z
                                                    x_distortion = gleba_wobble_x * 15,\z
                                                    y_distortion = gleba_wobble_x * 15}",
      starting_opposite_lake = "starting_spot_at_angle{ angle = gleba_starting_angle + 270 * gleba_starting_direction,\z
                                                        distance = 500 * gleba_starting_area_multiplier,\z
                                                        radius = 450 * gleba_starting_area_multiplier,\z
                                                        x_distortion = gleba_wobble_x * 15,\z
                                                        y_distortion = gleba_wobble_x * 15}",
      starting_opposite_small_lake = "starting_spot_at_angle{ angle = gleba_starting_angle + 265 * gleba_starting_direction,\z
                                                              distance = 50 * gleba_starting_area_multiplier,\z
                                                              radius = 50 * gleba_starting_area_multiplier,\z
                                                              x_distortion = gleba_wobble_x * 15,\z
                                                              y_distortion = gleba_wobble_x * 15}"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_starting_lowlands",
    expression = "max(starting_lowland_yumako, starting_lowland_jellynut)",
    local_expressions =
    {
      starting_lowland_yumako = "starting_spot_at_angle{angle = gleba_starting_angle + 235 * gleba_starting_direction,\z
                                                        distance = 300 * gleba_starting_area_multiplier,\z
                                                        radius = 140 * gleba_starting_area_multiplier,\z
                                                        x_distortion = gleba_wobble_x * 15,\z
                                                        y_distortion = gleba_wobble_x * 15}",
      starting_lowland_jellynut = "starting_spot_at_angle{angle = gleba_starting_angle + 65 * gleba_starting_direction,\z
                                                          distance = 290 * gleba_starting_area_multiplier,\z
                                                          radius = 100 * gleba_starting_area_multiplier,\z
                                                          x_distortion = gleba_wobble_x * 15,\z
                                                          y_distortion = gleba_wobble_x * 15}",
    }
  },
  {
    type = "noise-expression",
    name = "gleba_starting_fertile",
    expression = "max(starting_lowland_yumako, starting_lowland_jellynut)",
    local_expressions =
    {
      starting_lowland_yumako = "starting_spot_at_angle{angle = gleba_starting_angle + 235 * gleba_starting_direction,\z
                                                        distance = 310 * gleba_starting_area_multiplier,\z
                                                        radius = 40 * gleba_starting_area_multiplier,\z
                                                        x_distortion = gleba_wobble_x * 15,\z
                                                        y_distortion = gleba_wobble_x * 15}",
      starting_lowland_jellynut = "starting_spot_at_angle{angle = gleba_starting_angle + 65 * gleba_starting_direction,\z
                                                          distance = 310 * gleba_starting_area_multiplier,\z
                                                          radius = 40 * gleba_starting_area_multiplier,\z
                                                          x_distortion = gleba_wobble_x * 15,\z
                                                          y_distortion = gleba_wobble_x * 15}",
    }
  },
  {
    type = "noise-expression",
    name = "gleba_starting_enemies_safe",
    expression = "starting_spot_at_angle{ angle = gleba_starting_angle + 40 * gleba_starting_direction,\z
                                          distance = 210 * gleba_starting_area_multiplier,\z
                                          radius = 30 * gleba_starting_area_multiplier,\z
                                          x_distortion = gleba_wobble_x * 20,\z
                                          y_distortion = gleba_wobble_x * 20}"
  },
  {
    type = "noise-expression",
    name = "gleba_starting_enemies",
    expression = "max(starting_lowland_yumako, starting_lowland_jellynut)",
    local_expressions =
    {
      starting_lowland_yumako = "starting_spot_at_angle{angle = gleba_starting_angle + 210 * gleba_starting_direction,\z
                                                        distance = 410 * gleba_starting_area_multiplier,\z
                                                        radius = 30 * gleba_starting_area_multiplier,\z
                                                        x_distortion = gleba_wobble_x * 20,\z
                                                        y_distortion = gleba_wobble_x * 20}",
      starting_lowland_jellynut = "starting_spot_at_angle{angle = gleba_starting_angle + 30 * gleba_starting_direction,\z
                                                          distance = 410 * gleba_starting_area_multiplier,\z
                                                          radius = 30 * gleba_starting_area_multiplier,\z
                                                          x_distortion = gleba_wobble_x * 20,\z
                                                          y_distortion = gleba_wobble_x * 20}",
    }
  },
  {
    type = "noise-expression",
    name = "gleba_spawner",
    expression = "max(0.01 * gleba_starting_enemies, max(min(0.02, enemy_autoplace_base(0, 8)), min(0.001, gleba_fertile_spots_coastal * 5000 - gleba_biome_mask_green * 25000)) * (distance > 500 * gleba_starting_area_multiplier)) * gleba_above_deep_water_mask"
  },
  {
    type = "noise-expression",
    name = "gleba_spawner_small",
    expression = "max(0.02 * gleba_starting_enemies, 0.02 * gleba_starting_enemies_safe, min(0.02, enemy_autoplace_base(0, 8)), min(0.001, gleba_fertile_spots_coastal * 5000 - gleba_biome_mask_green * 25000)) * gleba_above_deep_water_mask"
  },
  {
    type = "noise-expression",
    name = "gleba_rockpools",
    expression = "clamp(1 - 2 * abs(multioctave_noise{x = x, y = y, persistence = 0.75, seed0 = map_seed, seed1 = 1000000, octaves = 4, input_scale = 1/45}), 0, 1)\z
                  * gleba_select(rockpools_mask_noise + min(0, distance / 150 - 2) - max(0, gleba_fertile_spots_coastal_raw), 1.4, 3, 0.4, 0, 1) * (1 + (rockpools_mask_noise - 1) / 10)",
    local_expressions = {
      rockpools_mask_noise = "abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1000000, octaves = 3, input_scale = 1/75})"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_rockpools_deepwater",
    expression = "gleba_select(gleba_rockpools, 1.1, 2, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_rockpools_bluewater",
    expression = "gleba_select(gleba_rockpools, 0.8, 1.1, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_rockpools_shallow",
    expression = "gleba_select(gleba_rockpools, 0.6, 0.8, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_rockpools_pitrock",
    expression = "gleba_select(gleba_rockpools, 0.05, 0.6, 0.05, 0, 1) * (elevation > 20)"
  },
  {
    type = "noise-expression",
    name = "gleba_elevation",
    --intended_property = "elevation",
    expression = "lerp(gleba_elevation_common, lowland_elevation, lowland_mask)",
    local_expressions =
    {
      aux_high_contrast = "clamp(10 * (gleba_aux - 0.5) + 0.5, 0, 1)",
      aux_adjustment_peak = "gleba_pos_peak(aux_high_contrast, 0.5, 0.5)",
      --lowland_elevation = "clamp(gleba_elevation_common * 0.5 + transition_adjusted_mud_noise, 0.1, 19.9)",
      lowland_elevation = "clamp(gleba_elevation_common * 0.5 + transition_adjusted_mud_noise, -1.5, 19.9) + 0.15 * transition_adjusted_mud_noise",
      lowland_mask = "gleba_select(gleba_elevation_common, -5, 20, 1, 0, 1)",
      mixed_mud_noise = "lerp(-8 + 16 * gleba_mud_basins, -12 + 16 * gleba_mud_channels, aux_high_contrast)",
      transition_adjusted_mud_noise = "mixed_mud_noise * (1 + 0.3 * aux_adjustment_peak) + 0.1 * aux_adjustment_peak"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_deep_water_level",
    expression = "-10"
  },
  {
    type = "noise-expression",
    name = "gleba_above_deep_water_mask",
    expression = "elevation > gleba_deep_water_level"
  },
  {
    type = "noise-expression",
    name = "gleba_mud_basins",
    expression = "1 - abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1000000, octaves = 3, input_scale = 1/10})"
  },
  {
    type = "noise-expression",
    name = "gleba_mud_channels",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.5, seed0 = map_seed, seed1 = 1000000, octaves = 3, input_scale = 1/9})"
  },
  {
    type = "noise-expression",
    name = "gleba_highland",
    expression = "gleba_select(gleba_elevation, 120, 1000, 0.5, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_midland",
    expression = "gleba_select(gleba_elevation, 20, 120, 0.5, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_midland_aux_1",
    expression = "gleba_midland * gleba_select(gleba_aux, 0, 0.45, 0.0025, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_midland_aux_2",
    expression = "gleba_midland * gleba_select(gleba_aux, 0.45, 0.55, 0.0025, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_midland_aux_3",
    expression = "gleba_midland * gleba_select(gleba_aux, 0.55, 1, 0.0025, 0, 1)"
  },

  {
    type = "noise-expression",
    name = "gleba_lowland",
    expression = "gleba_select(gleba_elevation, 1, 20, 0.5, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_lowland_aux_1",
    expression = "gleba_lowland * gleba_select(gleba_aux, 0, 0.3, 0.005, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_lowland_aux_2",
    expression = "gleba_lowland * gleba_select(gleba_aux, 0.3, 0.7, 0.005, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_lowland_aux_3",
    expression = "gleba_lowland * gleba_select(gleba_aux, 0.7, 1, 0.005, 0, 1)"
  },

  {
    type = "noise-expression",
    name = "gleba_shallows_edge",
    expression = "gleba_select(gleba_elevation, -2, 2, 0.5, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_shallows_edge_aux_1",
    expression = "gleba_shallows_edge * gleba_select(gleba_aux, 0, 0.3, 0.005, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_shallows_edge_aux_2",
    expression = "gleba_shallows_edge * gleba_select(gleba_aux, 0.3, 0.7, 0.005, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_shallows_edge_aux_3",
    expression = "gleba_shallows_edge * gleba_select(gleba_aux, 0.7, 1, 0.005, 0, 1)"
  },

  {
    type = "noise-expression",
    name = "gleba_shallows",
    expression = "gleba_select(gleba_elevation, -5, -2, 0.5, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_shallows_aux_1",
    expression = "gleba_shallows * gleba_select(gleba_aux, 0, 0.3, 0.005, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_shallows_aux_2",
    expression = "gleba_shallows * gleba_select(gleba_aux, 0.3, 0.7, 0.005, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_shallows_aux_3",
    expression = "gleba_shallows * gleba_select(gleba_aux, 0.7, 1, 0.005, 0, 1)"
  },


  {
    type = "noise-expression",
    name = "gleba_water_plant_ramp",
    expression = "clamp((0.8 - gleba_moisture) * 20, 0, 1)" -- 0 near deep water, 1 at coast edge
  },

  --- Fertile mud / growing spots
  {
    type = "noise-expression",
    name = "gleba_fertile_spots_coastal_raw",
    expression = "spot_noise{ x = x + wobble_noise_x * 15,\z
                              y = y + wobble_noise_y * 15,\z
                              seed0 = map_seed,\z
                              seed1 = 1,\z
                              candidate_spot_count = 80,\z
                              suggested_minimum_candidate_point_spacing = 128,\z
                              skip_span = 1,\z
                              skip_offset = 0,\z
                              region_size = 1024,\z
                              density_expression = 80,\z
                              spot_quantity_expression = 1000,\z
                              spot_radius_expression = 32,\z
                              hard_region_target_quantity = 0,\z
                              spot_favorability_expression = 60,\z
                              basement_value = -0.5,\z
                              maximum_spot_basement_radius = 128}",
    local_expressions =
    {
      wobble_noise_x = "multioctave_noise{x = x, y = y, persistence = 0.5, seed0 = map_seed, seed1 = 3000000, octaves = 2, input_scale = 1/20}",
      wobble_noise_y = "multioctave_noise{x = x, y = y, persistence = 0.5, seed0 = map_seed, seed1 = 4000000, octaves = 2, input_scale = 1/20}"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_fertile_spots_coastal",
    expression = "max(min(1, gleba_starting_fertile * 4),\z
                      min(exclude_middle, gleba_fertile_spots_coastal_raw) - max(0, -(elevation + 2) / 5) - max(0, (elevation - 10) / 5))",
    local_expressions =
    {
      exclude_middle = "(distance / gleba_starting_area_multiplier / 150) - 2.2"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_fertile_solid",
    expression = "2 * abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 2000000, octaves = 2, input_scale = 1/16})\z
                  * gleba_fertile_spots_coastal"
  },
  {
    type = "noise-expression",
    name = "gleba_biome_mask_green",
    expression = "aux > 0.375"
  },
  {
    type = "noise-expression",
    name = "gleba_biome_mask_red",
    expression = "aux < 0.625"
  },

--- Decoratives general
  {
    type = "noise-function",
    name = "grpi", -- gleba_random_penalty_inverse, add for knockout effect
    parameters = {"survival"},
    expression = "random_penalty{x = x, y = y, seed = 1, source = 1, amplitude = 1/survival} - 1"
  },
  {
    type = "noise-expression",
    name = "gleba_decorative_knockout", -- small wavelength noise (5 tiles-ish) to make decoratives patchy
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1300000, octaves = 2, input_scale = 1/3}"
  },
  {
    type = "noise-expression",
    name = "gleba_decorative_subtype_mixer", -- small wavelength noise (1 tiles-ish) to make decoratives patchy
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1300000, octaves = 2, input_scale = 1/1}"
  },
  {
    type = "noise-expression",
    name = "gleba_decal_noise", -- positive has ridge bias, mainly for ground decals, mycelium, veins
    expression = "0.6 * multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1500, octaves = 2, input_scale = 1/16, output_scale = 0.5}\z
      + 0.3 - abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 2500, octaves = 2, input_scale = 1/20})"
  },
  {
    type = "noise-expression",
    name = "gleba_bush_noise", -- positive has ridge bias, mainly for bush-scale stalks, sceptres, cups, pita
    expression = "0.6 * multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 5500, octaves = 2, input_scale = 1/12, output_scale = 0.5}\z
      + 0.3 - abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 6500, octaves = 2, input_scale = 1/12})"
  },
  {
    type = "noise-expression",
    name = "gleba_cover_noise", -- positive has ridge bias, mainly for thicker ground cover, lettuce, splitgill
    expression = "0.6 * multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 3500, octaves = 2, input_scale = 1/10, output_scale = 0.5}\z
      + 0.3 - abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 4500, octaves = 2, input_scale = 1/16})"
  },
  {
    type = "noise-expression",
    name = "gleba_scrub_noise", -- positive has ridge bias, mainly for smaller scatter plants, cronton, wisp, desert bush
    expression = "0.6 * multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 7500, octaves = 2, input_scale = 1/8, output_scale = 0.5}\z
      + 0.3 - abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 8500, octaves = 2, input_scale = 1/8})"
  },
  {
    type = "noise-expression",
    name = "gleba_small_cover_noise",
    expression = "0.6 * multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 7500, octaves = 2, input_scale = 1/6, output_scale = 0.5}\z
      + 0.3 - abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 8500, octaves = 2, input_scale = 1/6})"
  },

  --- Plant / tree regions
  -- region_box plateau potential should be: -10 to 0

  {
    type = "noise-expression",
    name = "gleba_funnel_trunk_region",
    expression = "max(main_probability, invasion_middle_probability)",
    local_expressions =
    { -- plateau potential: -10 to 0
      main_box = "min(gleba_select(gleba_aux, 0, 0.4, 0.05, -10, 1), gleba_select(gleba_moisture, 0.5, 0.75, 0.01, -10, 1)) - 1",
      main_probability = "min(0.08, 0.15 * (main_box + gleba_plants_noise_b - 0.25) * control:gleba_plants:size)", -- bigger patches, denser
      invasion_middle_box = "min(gleba_select(gleba_aux, 0, 0.55, 0.05, -10, 1), gleba_select(gleba_moisture, 0.4, 0.6, 0.01, -10, 1)) - 1",
      invasion_middle_probability = "min(0.01, 0.1 * (invasion_middle_box + gleba_plants_noise_b - 0.5) * control:gleba_plants:size)", -- smaller patches, sparser
    }
  },
  {
    type = "noise-expression",
    name = "gleba_boompuff_region",
    expression = "max(main_probability, invasion_tall_probability)",
    local_expressions =
    { -- plateau potential: -10 to 0
      main_box = "min(gleba_select(gleba_aux, 0.5, 1, 0.05, -10, 1), gleba_select(gleba_moisture, 0.25, 0.5, 0.01, -10, 1)) - 1",
      main_probability = "min(0.1, 0.15 * (main_box + gleba_plants_noise - 0.45) * control:gleba_plants:size)", -- bigger patches, denser
      invasion_tall_box = "min(gleba_select(gleba_aux,  0.55, 1, 0.15, -10, 1), gleba_select(gleba_moisture, 0.1, 0.6, 0.01, -10, 1)) - 1",
      invasion_tall_probability = "min(0.05, 0.1 * (invasion_tall_box + gleba_plants_noise - 0.55) * control:gleba_plants:size)", -- smaller patches, sparser
    }
  },
  {
    type = "noise-expression",
    name = "gleba_teflilly_region",
    expression = "max(main_probability, invasion_middle_probability)",
    local_expressions =
    { -- plateau potential: -10 to 0
      main_box = "min(gleba_select(gleba_aux, 0.3, 0.7, 0.15, -10, 1), gleba_select(gleba_moisture, 0.5, 0.75, 0.01, -10, 1)) - 1",
      main_probability = "min(0.1, 0.15 * (main_box + gleba_plants_noise_b - 0.3) * control:gleba_plants:size)", -- bigger patches, denser
      invasion_middle_box = "min(gleba_select(gleba_aux, 0.55, 0.85, 0.15, -10, 1), gleba_select(gleba_moisture, 0.4, 0.7, 0.01, -10, 1)) - 1",
      invasion_middle_probability = "min(0.05, 0.15 * (invasion_middle_box + gleba_plants_noise_b - 0.55) * control:gleba_plants:size)", -- smaller patches, sparser
    }
  },

  --- Decorative regions
  -- region_box plateau potential should be: -10 to 0
  -- decal groups

  -- mycelium a
  -- veins a
  -- barnacles a
  -- grey-cracked-mud b
  -- cracked-mud b
  -- light-mud b
  -- dark-mud b

  -- A-pattern (ridge)
  {
    type = "noise-expression",
    name = "gleba_mycelium",
    expression = "region_box + gleba_decal_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, -1, 0.4, 0.05, -10, 1), gleba_select(gleba_moisture, 0.2, 0.45, 0.01, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_white_grass",
    expression = "region_box + gleba_decal_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, -1, 0.35, 0.1, -10, 1), gleba_select(gleba_moisture, 0.25, 0.4, 0.05, -10, 1)) - 1" -- like gleba_mycelium
    }
  },
  {
    type = "noise-expression",
    name = "gleba_veins",
    expression = "region_box + gleba_decal_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.6, 2, 0.05, -10, 1), gleba_select(gleba_moisture, 0.5, 0.75, 0.01, -10, 1)) - 1"
    }
  },
  -- B-pattern (billows)
  {
    type = "noise-expression",
    name = "gleba_grey_cracked_mud",
    expression = "max(region_box_a, region_box_b) - gleba_decal_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box_a = "gleba_select(gleba_moisture, 0, 0.20, 0.05, -10, 1) - 1",
      region_box_b = "min(gleba_select(gleba_aux, -1, 0.4, 0.05, -10, 1), gleba_select(gleba_moisture, 0, 0.45, 0.05, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_cracked_mud",
    expression = "region_box - gleba_decal_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.7, 2, 0.1, -10, 1), gleba_select(gleba_moisture, 0.55, 0.6, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_cracked_mud_probability",
    expression = "grpi(0.05) + gleba_select(gleba_cracked_mud - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_light_mud",
    expression = "region_box - gleba_decal_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.6, 2, 0.05, -10, 1), gleba_select(gleba_moisture, 0.28, 0.47, 0.02, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_light_mud_probability",
    expression = "grpi(0.05) + gleba_select(gleba_light_mud - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_dark_mud",
    expression = "max(region_box_a, region_box_b) - gleba_decal_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box_a = "min(gleba_select(gleba_aux, -1, 0.6, 0.05, -10, 1), gleba_select(gleba_moisture, 0.5, 0.75, 0.1, -10, 1)) - 1",
      region_box_b = "min(gleba_select(gleba_aux, 0.45, 0.55, 0.05, -10, 1), gleba_select(gleba_moisture, 0.3, 0.75, 0.05, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_dark_mud_probability",
    expression = "grpi(0.05) + gleba_select(gleba_dark_mud - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_barnacles",
    expression = "region_box - gleba_decal_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.1, 0.4, 0.1, -10, 1), gleba_select(gleba_moisture, 0, 0.2, 0.02, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_barnacle_solo",
    expression = "region_box - gleba_decal_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0, 0.45, 0.1, -10, 1), gleba_select(gleba_moisture, 0, 0.5, 0.02, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_polycephalum",
    expression = "max(region_box_a, 0.9 * region_box_b) - gleba_decal_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box_a = "min(gleba_select(gleba_aux, 0.25, 0.65, 0.2, -10, 1), gleba_select(gleba_moisture, 0.5, 0.7, 0.05, -10, 1)) - 1",
      region_box_b = "min(gleba_select(gleba_aux, 0.5, 0.75, 0.2, -10, 1), gleba_select(gleba_moisture, 0.35, 0.6, 0.05, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_coral_stunted_grey",
    expression = "gleba_select(gleba_aux, 0.45, 0.65, 0.1, -10, 1) - (gleba_elevation - 2) / 5 + 0.25 * gleba_decorative_knockout - 0.8",
  },
  {
    type = "noise-expression",
    name = "gleba_coral_stunted",
    expression = "gleba_select(gleba_aux, 0.65, 1, 0.1, -10, 1) - (gleba_elevation - 2) / 5 + 0.25 * gleba_decorative_knockout - 0.8",
  },

  -- cover groups

  -- yellow lettuce a
  -- lichen-decal a
  -- split-gill a
  -- lichen b
  -- shroom b
  -- green lettuce b
  -- brown cups  b

  -- A-pattern (ridge)
  {
    type = "noise-expression",
    name = "gleba_yellow_lettuce",
    expression = "region_box + 0.3 * gleba_cover_noise + 0.75 * gleba_small_cover_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.55, 2, 0.05, -10, 1), gleba_select(gleba_moisture, 0.3, 0.5, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_yellow_lettuce_cups",
    expression = "region_box + gleba_cover_noise",
    local_expressions =
    {
      region_box = "min(gleba_select(gleba_aux, 0.5, 2, 0.1, -10, 1), gleba_select(gleba_moisture, 0.2, 0.6, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_purple_cups",
    expression = "max(region_box_a, region_box_b) + gleba_cover_noise",
    local_expressions =
    {
      region_box_a = "min(gleba_select(gleba_aux, 0.2, 0.8, 0.15, -10, 1), gleba_select(gleba_moisture, 0.5, 0.75, 0.05, -10, 1)) - 1",
      region_box_b = "min(gleba_select(gleba_aux, 0.6, 1, 0.15, -10, 1), gleba_select(gleba_moisture, 0.35, 0.85, 0.05, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_split_gill_dying",
    expression = "region_box + 0.5 * gleba_cover_noise + 0.6 * gleba_small_cover_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.5, 0.6, 0.1, -10, 1), gleba_select(gleba_moisture, 0.51, 0.75, 0.01, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_split_gill",
    expression = "region_box + 0.5 * gleba_cover_noise + 0.6 * gleba_small_cover_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.6, 0.85, 0.2, -10, 1), gleba_select(gleba_moisture, 0.51, 0.75, 0.01, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_split_gill_red",
    expression = "region_box + 0.5 * gleba_cover_noise + 0.6 * gleba_small_cover_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.85, 1, 0.1, -10, 1), gleba_select(gleba_moisture, 0.51, 0.75, 0.01, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_pink_lichen", -- old enemy "lichen"
    expression = "region_box + gleba_cover_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.6, 2, 0.05, -10, 1), gleba_select(gleba_moisture, 0.45, 0.75, 0.05, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_pink_lichen_probability",
    expression = "grpi(0.5) + gleba_select(gleba_pink_lichen - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_yellow_coral",
    expression = "region_box + gleba_cover_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0, 0.3, 0.1, -10, 1), gleba_select(gleba_moisture, 0.5, 0.75, 0.02, -10, 1)) - 1"
    }
  },

  -- B-pattern (billows)
  {
    type = "noise-expression",
    name = "gleba_carpet_shroom", -- old enemy "shroom"
    expression = "region_box - gleba_cover_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.85, 2, 0.05, -10, 1), gleba_select(gleba_moisture, 0.6, 0.75, 0.05, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_carpet_shroom_probability",
    expression = "grpi(0.25) + gleba_select(gleba_carpet_shroom - clamp(gleba_decorative_knockout, 0, 1), 0.1, 2, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_orange_lichen", -- old enemy "lichen"
    expression = "region_box - gleba_cover_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.8, 2, 0.05, -10, 1), gleba_select(gleba_moisture, 0.4, 0.55, 0.05, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_orange_lichen_probability", -- old enemy "lichen"
    expression = "grpi(0.25) + gleba_select(gleba_orange_lichen - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_red_lichen",
    expression = "region_box - gleba_cover_noise + gleba_temperature_normalised",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.65, 1, 0.005, -10, 1), gleba_select(gleba_moisture, 0.55, 0.75, 0.05, -10, 1), gleba_select(gleba_temperature_normalised, 0.65, 1, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_green_lettuce",
    expression = "region_box - 0.5 * gleba_cover_noise + 0.7 * gleba_small_cover_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, -1, 0.25, 0.15, -10, 1), gleba_select(gleba_moisture, 0.5, 0.75, 0.05, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_pale_lettuce",
    expression = "region_box - 0.5 * gleba_cover_noise + 0.7 * gleba_small_cover_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.25, 0.55, 0.1, -10, 1), gleba_select(gleba_moisture, 0.5, 0.75, 0.05, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_brown_cup",
    expression = "max(region_box_a, region_box_b) - gleba_cover_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box_a = "min(gleba_select(gleba_aux, -1, 0.55, 0.1, -10, 1), gleba_select(gleba_moisture, 0, 0.3, 0.05, -10, 1)) - 1",
      region_box_b = "min(gleba_select(gleba_aux, 0.1, 0.4, 0.1, -10, 1), gleba_select(gleba_moisture, 0, 0.5, 0.05, -10, 1)) - 1"
    }
  },

  -- bush groups

  -- honeycomb a
  -- brambles a
  -- grapes a
  -- pink-phalanges a
  -- green pita a
  -- red pita b
  -- fuchia pita b
  -- green cups b
  -- black scepter b

  -- A-pattern (ridge)
  {
    type = "noise-expression",
    name = "gleba_honeycomb",
    expression = "region_box + gleba_bush_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.8, 2, 0.1, -10, 1), gleba_select(gleba_moisture, 0.1, 0.35, 0.05, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_bramble_vines",
    expression = "region_box + gleba_bush_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.6, 2, 0.1, -10, 1), gleba_select(gleba_moisture, 0.4, 0.65, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_bramble_grapes",
    expression = "region_box + gleba_bush_noise",
    local_expressions =
    { -- plateau potential: -10 to 00
      region_box = "min(gleba_select(gleba_aux, 0.65, 2, 0.1, -10, 1), gleba_select(gleba_moisture, 0.35, 0.55, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_bramble_grapes_vibrant",
    expression = "region_box + gleba_bush_noise",
    local_expressions =
    { -- plateau potential: -10 to 00
      region_box = "min(gleba_select(gleba_aux, 0.65, 2, 0.1, -10, 1), gleba_select(gleba_moisture, 0.55, 0.75, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_pink_phalanges",
    expression = "region_box + gleba_bush_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.30, 0.8, 0.2, -10, 1), gleba_select(gleba_moisture, 0.5, 0.75, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_green_pita",
    expression = "region_box + gleba_bush_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, -1, 0.5, 0.1, -10, 1), gleba_select(gleba_moisture, 0.35, 0.5, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_green_pita_probability",
    expression = "grpi(0.5) + gleba_select(gleba_green_pita - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
  },

  -- B-pattern (billows)
  {
    type = "noise-expression",
    name = "gleba_red_pita",
    expression = "region_box - gleba_bush_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.6, 0.7, 0.1, -10, 1), gleba_select(gleba_moisture, 0.25, 0.35, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_red_pita_probability",
    expression = "grpi(0.5) + gleba_select(gleba_red_pita - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_fuchsia_pita",
    expression = "grpi(0.5) + max(gleba_teflilly_region, region_box - gleba_bush_noise)",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.35, 0.75, 0.05, -10, 1), gleba_select(gleba_moisture, 0.5, 0.75, 0.05, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_black_sceptre",
    expression = "max(region_box_a, region_box_b) - gleba_bush_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box_a = "min(gleba_select(gleba_aux, -1, 0.35, 0.1, -10, 1), gleba_select(gleba_moisture, 0.2, 0.55, 0.05, -10, 1)) - 1",
      region_box_b = "min(gleba_select(gleba_aux, -1, 0.5, 0.05, -10, 1), gleba_select(gleba_moisture, 0.25, 0.5, 0.05, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_green_cup",
    expression = "region_box - gleba_bush_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, -1, 0.35, 0.1, -10, 1), gleba_select(gleba_moisture, 0.45, 0.75, 0.15, -10, 1)) - 1"
    }
  },

  -- scrub groups

  -- cronton a
  -- green bush mini a
  -- wispy-lichen a
  -- red desert bush a
  -- white desert bush b
  -- corals b
  -- green pita mini b
  -- red asterisk b

  -- A-pattern (ridge)
  {
    type = "noise-expression",
    name = "gleba_green_cronton",
    expression = "region_box + gleba_scrub_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.25, 0.45, 0.1, -10, 1), gleba_select(gleba_moisture, 0.5, 0.75, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_green_cronton_probability",
    expression = "grpi(0.5) + gleba_select(gleba_green_cronton - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_green_bush",
    expression = "region_box + gleba_scrub_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, -1, 0.3, 0.1, -10, 1), gleba_select(gleba_moisture, 0.5, 0.75, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_green_bush_probability",
    expression = "grpi(0.5) + gleba_select(gleba_green_bush - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_wispy_lichen",
    expression = "region_box + gleba_scrub_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, -1, 0.4, 0.1, -10, 1), gleba_select(gleba_moisture, 0.25, 0.45, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_red_desert_bush",
    expression = "region_box + gleba_scrub_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.4, 0.8, 0.1, -10, 1), gleba_select(gleba_moisture, 0.2, 0.45, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_red_desert_bush_probability",
    expression = "grpi(0.5) + gleba_select(gleba_red_desert_bush - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
  },

  -- B-pattern (billows)
  {
    type = "noise-expression",
    name = "gleba_white_desert_bush",
    expression = "max(region_box_a, region_box_b) - gleba_scrub_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box_a = "min(gleba_select(gleba_aux, 0.35, 2, 0.1, -10, 1), gleba_select(gleba_moisture, 0, 0.25, 0.05, -10, 1)) - 1",
      region_box_b = "min(gleba_select(gleba_aux, 0.35, 0.55, 0.1, -10, 1), gleba_select(gleba_moisture, 0.25, 0.55, 0.05, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_white_desert_bush_probability",
    expression = "grpi(0.5) + gleba_select(gleba_white_desert_bush - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_corals",
    expression = "region_box - gleba_scrub_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.65, 2, 0.35, -10, 1), gleba_select(gleba_moisture, 0.65, 0.8, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_green_pita_mini",
    expression = "region_box - gleba_scrub_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, -1, 0.5, 0.1, -10, 1), gleba_select(gleba_moisture, 0.2, 0.4, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_green_pita_mini_probability",
    expression = "grpi(0.5) + gleba_select(gleba_green_pita_mini - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_red_asterisk",
    expression = "region_box - gleba_scrub_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.85, 2, 0.1, -10, 1), gleba_select(gleba_moisture, 0.1, 0.55, 0.1, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_curly_orange_roots",
    expression = "max(region_box_a - gleba_temperature_normalised, region_box_b + gleba_plants_noise_b)",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box_a = "min(gleba_select(gleba_aux, 0.75, 2, 0.1, -10, 1), gleba_select(gleba_moisture, 0.3, 0.5, 0.05, -10, 1)) - 1",
      region_box_b = "min(gleba_select(gleba_aux, 0.6, 0.75, 0.15, -10, 1), gleba_select(gleba_moisture, 0.5, 0.75, 0.05, -10, 1)) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_nerve_veins",
    expression = "region_box + gleba_temperature_normalised",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "min(gleba_select(gleba_aux, 0.7, 2, 0.1, -10, 1), gleba_select(gleba_moisture, 0.5, 0.75, 0.05, -10, 1)) - 1",
    }
  },

  {
    type = "noise-expression",
    name = "gleba_clubnub_grass",
    expression = "region_box + gleba_plants_noise",
    local_expressions =
    {
      region_box = "min(gleba_select(gleba_aux, 0, 0.3, 0.15, -10, 1), gleba_water_plant_ramp, gleba_elevation < 2) - 1",
    }
  },
  {
    type = "noise-expression",
    name = "gleba_green_carpet_grass_probability",
    expression = "grpi(0.3) + 0.3 * gleba_select(gleba_clubnub_grass, 0.7, 2, 0.2, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_green_hairy_grass_probability",
    expression = "grpi(0.5) + 0.8 * gleba_select(gleba_clubnub_grass, 0.8, 2, 0.2, 0, 1)"
  },


  -- B-pattern (billows)
  {
    type = "noise-expression",
    name = "gleba_iron_stromatolite",
    expression = "region_box - gleba_scrub_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "gleba_select(gleba_aux, 0.6, 2, 0.1, -10, 1) - 1"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_copper_stromatolite",
    expression = "region_box - gleba_scrub_noise",
    local_expressions =
    { -- plateau potential: -10 to 0
      region_box = "gleba_select(gleba_aux, -1, 0.4, 0.1, -10, 1) - 1"
    }
  },

}

--- GLEBA resources
-- Gleba has very little stone to encourage building on high/medium ground and less blanket landfilling the swamps.
-- Gleba metal resource patches are small size but extreme richness so they are unlikely to run out in a normal game.
data:extend({
  {
    type = "noise-function",
    name = "gleba_simple_spot",
    parameters = {"seed1", "radius", "spacing", "favorability"},
    expression = "spot_noise{\z
      x = x + gleba_wobble_small_x * 0.5 * radius,\z
      y = y + gleba_wobble_small_y * 0.5 * radius,\z
      seed0 = map_seed,\z
      seed1 = seed1,\z
      skip_span = 1,\z
      skip_offset = 1,\z
      region_size = spacing * 5,\z
      density_expression = favorability,\z
      spot_favorability_expression = favorability,\z
      candidate_spot_count = 22,\z
      suggested_minimum_candidate_point_spacing = spacing,\z
      spot_quantity_expression = radius * radius,\z
      spot_radius_expression = radius,\z
      hard_region_target_quantity = 0,\z
      basement_value = -1,\z
      maximum_spot_basement_radius = radius * 2\z
    }"
  },
  {
    type = "noise-expression",
    name = "gleba_stone_richness",
    expression = "4000 * max(starting, gleba_simple_spot(1000, 6 * size ^ 0.5, 80 / frequency ^ 0.5, gleba_highland) * max(gleba_highland, gleba_midland_aux_2)) * richness / size",
    local_expressions =
    {
      richness = "control:gleba_stone:richness",
      frequency = "control:gleba_stone:frequency",
      size = "control:gleba_stone:size",
      starting = "starting_spot_at_angle{ angle = gleba_starting_angle + 85 * gleba_starting_direction,\z
                                          distance = 80 * gleba_starting_area_multiplier,\z
                                          radius = 7 * size ^ 0.5,\z
                                          x_distortion = gleba_wobble_x * 8,\z
                                          y_distortion = gleba_wobble_x * 8}"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_stone_probability",
    expression = "(control:gleba_stone:size > 0) * (gleba_stone_richness > 1)"
  },
  {
    type = "noise-expression",
    name = "gleba_iron_ore_richness",
    expression = "250000 * max(starting, gleba_simple_spot(2000, 10 * size ^ 0.5, 180 / frequency ^ 0.5, gleba_midland_aux_1) * gleba_midland_aux_1) * richness / size",
    local_expressions =
    {
      richness = "var('control:iron-ore:richness')",
      frequency = "var('control:iron-ore:frequency')",
      size = "var('control:iron-ore:size')",
      starting = "starting_spot_at_angle{ angle = gleba_starting_angle + 180 * gleba_starting_direction,\z
                                          distance = 60 * gleba_starting_area_multiplier,\z
                                          radius = 11 * size ^ 0.5,\z
                                          x_distortion = gleba_wobble_x * 10,\z
                                          y_distortion = gleba_wobble_x * 10}"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_iron_ore_probability",
    expression = "gleba_iron_ore_richness > 1"
  },
  {
    type = "noise-expression",
    name = "gleba_copper_ore_richness",
    expression = "250000 * max(starting, gleba_simple_spot(3000, 9 * size ^ 0.5, 180 / frequency ^ 0.5, gleba_midland_aux_3) * gleba_midland_aux_3) * richness / size",
    local_expressions =
    {
      richness = "var('control:copper-ore:richness')",
      frequency = "var('control:copper-ore:frequency')",
      size = "var('control:copper-ore:size')",
      starting = "starting_spot_at_angle{ angle = gleba_starting_angle + 340 * gleba_starting_direction,\z
                                          distance = 80 * gleba_starting_area_multiplier,\z
                                          radius = 10 * size ^ 0.5,\z
                                          x_distortion = gleba_wobble_x * 10,\z
                                          y_distortion = gleba_wobble_x * 10}"
    }
  },
  {
    type = "noise-expression",
    name = "gleba_copper_ore_probability",
    expression = "gleba_copper_ore_richness > 1"
  },
  {
    type = "noise-expression",
    name = "gleba_enemy_base_radius",
    expression = "sqrt(control:gleba_enemy_base:size) * (15 + 4 * enemy_base_intensity)"
  },
  {
    type = "noise-expression",
    name = "gleba_enemy_base_frequency",
    -- bases_per_km2 = 10 + 3 * enemy_base_intensity
    expression = "(0.00002 + 0.000006 * enemy_base_intensity) * control:gleba_enemy_base:frequency"
  }
})
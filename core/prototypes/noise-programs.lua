-- 'x' variables are shifted to avoid 'fractal similarity' of noise programs.

data:extend{

  -- temperature
  {
    type = "noise-expression",
    name = "temperature",
    --intended_property = "temperature",
    expression = "temperature_basic",
    localised_name = {"noise-expression.temperature_basic"}
  },
  {
    type = "noise-expression",
    name = "temperature_basic",
    --intended_property = "temperature", --removed as an option as it is the default
    expression = "clamp(sea_level_temperature + var('control:temperature:bias') + \z
                        quick_multioctave_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 5,\z
                                                octaves = 4,\z
                                                input_scale = var('control:temperature:frequency') / 32,\z
                                                output_scale = 1/20,\z
                                                offset_x = 40000 / var('control:temperature:frequency'),\z
                                                octave_output_scale_multiplier = 3,\z
                                                octave_input_scale_multiplier = 1/3},\z
                        -20, 50)",
    local_expressions = {sea_level_temperature = 15}
  },


  -- moisture
  {
    type = "noise-expression",
    name = "moisture",
    --intended_property = "moisture",
    expression = "moisture_nauvis",
    localised_name = {"noise-expression.moisture_nauvis"}
  },
  {
    type = "noise-expression",
    name = "moisture_noise",
    expression = "quick_multioctave_noise{x = x,\z
                                          y = y,\z
                                          seed0 = map_seed,\z
                                          seed1 = 6,\z
                                          octaves = 4,\z
                                          input_scale = var('control:moisture:frequency') / 256,\z
                                          output_scale = 0.125,\z
                                          offset_x = 30000 / var('control:moisture:frequency'),\z
                                          octave_output_scale_multiplier = 1.5,\z
                                          octave_input_scale_multiplier = 1/3}",
  },
  {
    type = "noise-expression",
    name = "moisture_basic",
    --intended_property = "moisture",
    expression = "clamp(0.45 + moisture_adjusted_bias + moisture_noise, 0, 1)",
  },
  {
    type = "noise-expression",
    name = "moisture_adjusted_bias",
    expression = "lerp(base_bias, starting_bias, starting_bias_region)",
    local_expressions =
    {
      base_bias = "var('control:moisture:bias')",
      starting_bias = "lerp(base_bias, starting_bias_change, starting_bias_magnitude * 1.1)",
      starting_bias_change = "slider_to_linear(var('control:starting_area_moisture:size'), -0.5, 0.5)",
      starting_bias_magnitude = "abs(2 * starting_bias_change)",
      starting_bias_region = "clamp(2 - var('control:starting_area_moisture:frequency') / 400 * distance, 0, 1)"
    }
  },
  {
    type = "noise-expression",
    name = "moisture_nauvis",
    --intended_property = "moisture", --removed as an option as it is the default
    -- dirt trails on forest paths, don't affect arid terrain (i.e. grass to dirt, not dirt to sand)
    expression = "max(min(moisture_main, 0.45), moisture_main - 0.2 * max(0, 1 - trees_forest_path_cutout * 1.5))",
    local_expressions =
    {
      moisture_main = "clamp(0.4 + moisture_adjusted_bias + moisture_noise\z
                             - 0.08 * (nauvis_plateaus - 0.6),\z
                             0, 1)"
    }
  },


  -- aux
  {
    type = "noise-expression",
    name = "aux",
    --intended_property = "aux",
    expression = "aux_nauvis",
    localised_name = {"noise-expression.aux_nauvis"}
  },
  {
    type = "noise-expression",
    name = "aux_noise",
    expression = "quick_multioctave_noise{x = x,\z
                                          y = y,\z
                                          seed0 = map_seed,\z
                                          seed1 = 7,\z
                                          octaves = 4,\z
                                          input_scale = var('control:aux:frequency') / 2048,\z
                                          output_scale = 0.25,\z
                                          offset_x = 20000 / var('control:aux:frequency'),\z
                                          octave_output_scale_multiplier = 0.5,\z
                                          octave_input_scale_multiplier = 3}"
  },
  {
    type = "noise-expression",
    name = "aux_basic",
    --intended_property = "aux",
    expression = "clamp(0.5 + var('control:aux:bias') + aux_noise, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "aux_nauvis",
    --intended_property = "aux", --removed as an option as it is the default
    -- same as aux_basic but canyons are more sandy and plateaus are more red rock
    expression = "clamp(0.5 + var('control:aux:bias') \z
                        + 0.06 * (nauvis_plateaus - 0.4)\z
                        + aux_noise,\z
                        0, 1)"
  },


  -- elevation
  {
    type = "noise-expression",
    name = "elevation",
    --intended_property = "elevation",
    expression = "elevation_nauvis",
    localised_name = {"noise-expression.elevation_nauvis"}
  },
  {
    type = "noise-function",
    name = "make_0_12like_lakes",
    parameters = {"x", "y", "bias", "terrain_octaves", "segmentation_multiplier"},
    expression = "max(bias + variable_persistence_multioctave_noise{x = x,\z
                                                                    y = y,\z
                                                                    seed0 = map_seed,\z
                                                                    seed1 = 1,\z
                                                                    input_scale = input_scale,\z
                                                                    output_scale = 0.125,\z
                                                                    offset_x = offset_x,\z
                                                                    octaves = terrain_octaves,\z
                                                                    persistence = persistence},\z
                      20 + water_level - 0.1 * segmentation_multiplier * distance + \z
                      variable_persistence_multioctave_noise{x = x,\z
                                                             y = y,\z
                                                             seed0 = map_seed,\z
                                                             seed1 = 2,\z
                                                             input_scale = input_scale,\z
                                                             output_scale = 0.125,\z
                                                             offset_x = offset_x,\z
                                                             octaves = 6,\z
                                                             persistence = persistence})",
    local_expressions =
    {
      input_scale = "segmentation_multiplier / 2",
      offset_x = "10000 / segmentation_multiplier",
      persistence = "clamp(amplitude_corrected_multioctave_noise{x = x,\z
                                                                 y = y,\z
                                                                 seed0 = map_seed,\z
                                                                 seed1 = 1,\z
                                                                 octaves = terrain_octaves - 2,\z
                                                                 input_scale = input_scale,\z
                                                                 offset_x = offset_x,\z
                                                                 persistence = 0.7,\z
                                                                 amplitude = 0.5} + 0.3,\z
                          0.1, 0.9)"
    }
  },
  {
    type = "noise-function",
    name = "finish_elevation",
    parameters = {"elevation", "segmentation_multiplier"},
    expression = "min((elevation - water_level) / segmentation_multiplier,\z
                      basis_noise{x = x, y = y, seed0 = map_seed, seed1 = 123, input_scale = 1/8, output_scale = 1.5} + \z
                      starting_lake_distance / 4 - 4,\z
                      -1 + (starting_lake_distance + starting_lake_noise) / 16,\z
                      max(2, 2 + starting_lake_distance / 16 + starting_lake_noise / 2))",
    local_expressions =
    {
      starting_lake_distance = "distance_from_nearest_point{x = x, y = y, points = starting_lake_positions, maximum_distance = 1024}",
      starting_lake_noise = "quick_multioctave_noise_persistence{x = x,\z
                                                                 y = y,\z
                                                                 seed0 = map_seed,\z
                                                                 seed1 = 14,\z
                                                                 input_scale = 1/8,\z
                                                                 output_scale = 1,\z
                                                                 octaves = 5,\z
                                                                 octave_input_scale_multiplier = 0.5,\z
                                                                 persistence = 0.75}"
    }
  },
  {
    type = "noise-expression",
    name = "elevation_nauvis",
    --intended_property = "elevation", --removed as an option as it is the default
    expression = "elevation_nauvis_function(nauvis_hills_plateaus)"
  },
  {
    type = "noise-expression",
    name = "elevation_nauvis_no_cliff",
    --intended_property = "elevation", --removed as an option as it is the default
    expression = "elevation_nauvis_function(0)"
  },
  {
    type = "noise-function",
    name = "elevation_nauvis_function",
    expression = "min(wlc_elevation, starting_lake)",
    parameters = {"added_cliff_elevation"},
    local_expressions =
    {
      elevation_magnitude = 20,
      wlc_amplitude = 2,
      wlc_elevation = "max(nauvis_main - water_level * wlc_amplitude, starting_island)",
      nauvis_main = "elevation_magnitude * (lerp(0.5 * added_cliff_elevation - 0.6,\z
                                                1.9 * added_cliff_elevation + 1.6,\z
                                                0.1 + 0.5 * nauvis_bridges)\z
                                           + 0.25 * nauvis_detail\z
                                           + 3 * nauvis_macro * starting_macro_multiplier)",
      -- if most of the world is flooded make sure starting areas still have land
      starting_island = "nauvis_main + elevation_magnitude * (2.5 - distance * segmentation_multiplier / 200)",
      starting_macro_multiplier = "clamp(distance * nauvis_segmentation_multiplier / 2000, 0, 1)",
      starting_lake = "elevation_magnitude * (-3 + (starting_lake_distance + starting_lake_noise) / 8) / 8",
      starting_lake_distance = "distance_from_nearest_point{x = x, y = y, points = starting_lake_positions, maximum_distance = 1024}",
      starting_lake_noise = "quick_multioctave_noise_persistence{x = x,\z
                                                                 y = y,\z
                                                                 seed0 = map_seed,\z
                                                                 seed1 = 14,\z
                                                                 input_scale = 1/8,\z
                                                                 output_scale = 0.8,\z
                                                                 octaves = 4,\z
                                                                 octave_input_scale_multiplier = 0.5,\z
                                                                 persistence = 0.68}"
    }
  },
  {
    type = "noise-expression",
    name = "elevation_lakes",
    --intended_property = "elevation",
    -- Large lakes similar to those from Factorio 0.12
    expression = "finish_elevation{elevation = make_0_12like_lakes{x = x,\z
                                                                   y = y,\z
                                                                   bias = 20,\z
                                                                   terrain_octaves = 8,\z
                                                                   segmentation_multiplier = segmentation_multiplier},\z
                                   segmentation_multiplier = segmentation_multiplier}"
  },
  {
    type = "noise-expression",
    name = "elevation_island",
    --intended_property = "elevation",
    -- A large island surrounded by an endless ocean
    expression = "finish_elevation{elevation = make_0_12like_lakes{x = x,\z
                                                                   y = y,\z
                                                                   bias = -1000,\z
                                                                   terrain_octaves = 8,\z
                                                                   segmentation_multiplier = segmentation_mult},\z
                                   segmentation_multiplier = segmentation_mult}",
    local_expressions = {segmentation_mult = "segmentation_multiplier / 4"}
  },


  -- cliff_elevation
  {
    type = "noise-expression",
    name = "cliff_elevation",
    --intended_property = "cliff_elevation",
    expression = "cliff_elevation_nauvis",
    localised_name = {"noise-expression.cliff_elevation_nauvis"}
  },
  {
    type = "noise-expression",
    name = "cliff_elevation_from_elevation",
    --intended_property = "cliff_elevation",
    expression = "elevation"
  },
  {
    type = "noise-expression",
    name = "cliff_elevation_nauvis",
    --intended_property = "cliff_elevation", --removed as an option as it is the default
    expression = "10 + 30 * (nauvis_hills - nauvis_hills_cliff_level)"
  },


  -- cliffiness
  {
    type = "noise-expression",
    name = "cliffiness",
    --intended_property = "cliffiness",
    expression = "cliffiness_nauvis",
    localised_name = {"noise-expression.cliffiness_nauvis"}
  },
  {
    type = "noise-expression",
    name = "cliffiness_basic",
    --intended_property = "cliffiness",
    -- Elevation function determines general placement of 'mountainey' areas.
    -- Cliffiness only determines small-scale placement to ensure that there are passages through any sufficiently long cliff face.
    expression = "clamp(0.5 * log2(cliff_richness) + \z
                        quick_multioctave_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 123,\z
                                                input_scale = 1/32,\z
                                                output_scale = 1,\z
                                                octaves = 2,\z
                                                octave_output_scale_multiplier = 1,\z
                                                octave_input_scale_multiplier = 1/3},\z
                        0, 1) + 0.5"
  },
  {
    type = "noise-expression",
    name = "cliffiness_nauvis",
    --intended_property = "cliffiness", --removed as an option as it is the default
    expression = "(main_cliffiness >= cliff_cutoff) * 10",
    -- values are so that main_cliffiness has a debug range from 0-2 being the range that is selected from by cliff_cutoff
    -- i.e. red+ cliffs are only shwon at high cliff richness, green+ are always shown
    local_expressions =
    {
      cliff_cutoff = "2 * cliff_gap_size ^ 1.5",
      cliff_gap_size = "0.5 - 0.5 * slider_to_linear(cliff_richness, -1, 1)",
      main_cliffiness = "min( base_cliffiness,\z
                              forest_path_cliffiness,\z
                              bridge_path_cliffiness,\z
                              elevation_cliffiness,\z
                              starting_area_cliffiness,\z
                              4 * low_frequency_cliffiness)",
      -- compnents to min
      base_cliffiness = "(nauvis_cliff_ringbreak - 0.01) * 60",
      forest_path_cliffiness = "(forest_path_billows - 0.03) * 12",
      bridge_path_cliffiness = "(nauvis_bridge_billows - 0.05) * 15", -- not required if elevation is there
      elevation_cliffiness = "(elevation_nauvis_no_cliff - 4) / 2",
      starting_area_cliffiness = "-2 + distance * segmentation_multiplier / 120",
      -- when frequency is below 100% then it won't remove the final cliff band.
      -- Vertical frequency can't change below 1, so use the rest of the slider to reduce large-scale horizontal frequency
      low_frequency_cliffiness = "1.5\z
                                  + basis_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 86883,\z
                                                input_scale = nauvis_segmentation_multiplier/500,\z
                                                output_scale = 0.51}\z
                                  + min(slider_to_linear(cliff_frequency, -1.7, 1.7),\z
                                        slider_to_linear(cliff_richness, -1, 1))",

      -- misc
      cliff_frequency = "40 / cliff_elevation_interval"
    }
  },

  -- Nauvis Mesas underlying expressions
  {
    type = "noise-expression",
    name = "nauvis_segmentation_multiplier",
    expression = "1.5 * control:water:frequency"
  },
  {
    type = "noise-expression",
    name = "nauvis_persistance",
    expression = "clamp(amplitude_corrected_multioctave_noise{x = x,\z
                                                              y = y,\z
                                                              seed0 = map_seed,\z
                                                              seed1 = 500,\z
                                                              octaves = 5,\z
                                                              input_scale = nauvis_segmentation_multiplier / 2,\z
                                                              offset_x = 10000 / nauvis_segmentation_multiplier,\z
                                                              persistence = 0.7,\z
                                                              amplitude = 0.5} + 0.55,\z
                      0.5, 0.65)"
  },
  {
    type = "noise-expression",
    name = "nauvis_detail", -- the small scale details with variable persistance for a mix of smooth and jagged coastline
    expression = "variable_persistence_multioctave_noise{x = x,\z
                                                         y = y,\z
                                                         seed0 = map_seed,\z
                                                         seed1 = 600,\z
                                                         input_scale = nauvis_segmentation_multiplier / 14,\z
                                                         output_scale = 0.03,\z
                                                         offset_x = 10000 / nauvis_segmentation_multiplier,\z
                                                         octaves = 5,\z
                                                         persistence = nauvis_persistance}"
  },
  {
    type = "noise-expression",
    name = "forest_path_billows",  -- an extra set of cutouts for trees and cliffs
    expression = "abs(multioctave_noise{x = x,\z
                                            y = y,\z
                                            persistence = 0.5,\z
                                            seed0 = map_seed,\z
                                            seed1 = 1800,\z
                                            octaves = 4,\z
                                            input_scale = nauvis_segmentation_multiplier / 100})"
  },
  {
    type = "noise-expression",
    name = "forest_paths",
    expression = "(forest_path_billows - 0.07) * 3"
  },
  {
    type = "noise-expression",
    name = "nauvis_hills_paths",
    expression = "(nauvis_hills - 0.1) * 3"
  },
  {
    type = "noise-expression",
    name = "nauvis_bridge_paths", -- cut paths out of trees and cliffs if elevation is low (e.g. on a land bridge)
    expression = "(nauvis_bridge_billows - 0.07) * 5"
  },
  {
    type = "noise-expression",
    name = "tree_small_noise",
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    persistence = 0.75,\z
                                    seed0 = map_seed,\z
                                    seed1 = 'tree-small',\z
                                    octaves = 3,\z
                                    input_scale = 0.2,\z
                                    output_scale = 0.5}"
  },
  {
    type = "noise-expression",
    name = "trees_forest_path_cutout",
    expression = "min(nauvis_bridge_paths, nauvis_hills_paths, forest_paths)"
  },
  {
    type = "noise-expression",
    name = "trees_forest_path_cutout_faded",
    expression = "trees_forest_path_cutout * 0.3 + tree_small_noise * 0.1" -- make the path edges more sparse and fuzzy instead of a hard line.
  },
  {
    type = "noise-expression",
    name = "nauvis_bridge_billows", -- large scale land-bridges for land connectivity
    expression = "abs(multioctave_noise{x = x,\z
                                        y = y,\z
                                        persistence = 0.5,\z
                                        seed0 = map_seed,\z
                                        seed1 = 700,\z
                                        octaves = 4,\z
                                        input_scale = nauvis_segmentation_multiplier / 150})"
  },

  {
    type = "noise-expression",
    name = "nauvis_bridges", -- large scale land-bridges for land connectivity
    expression = "1 - 0.1 * nauvis_bridge_billows - 0.9 * max(0, -0.1 + nauvis_bridge_billows)"
  },
  {
    type = "noise-expression",
    name = "nauvis_hills_offset_raw_x",
    expression = "basis_noise{x = x,\z
                              y = y,\z
                              seed0 = map_seed,\z
                              seed1 = 'nauvis_offset_x',\z
                              input_scale = nauvis_segmentation_multiplier / 500}"
  },
  {
    type = "noise-expression",
    name = "nauvis_hills_offset_raw_y",
    expression = "basis_noise{x = x,\z
                              y = y,\z
                              seed0 = map_seed,\z
                              seed1 = 'nauvis_offset_y',\z
                              input_scale = nauvis_segmentation_multiplier / 500}"
  },
  {
    type = "noise-function",
    name = "normalize",
    parameters = {"primary", "secondary", "bias"},
    expression = "primary / sqrt(bias + (primary*primary)+(secondary*secondary))"
  },
  {
    type = "noise-expression",
    name = "nauvis_hills_offset_normalized_x",
    expression = "normalize(nauvis_hills_offset_raw_x, nauvis_hills_offset_raw_y, 0.001)"
  },
  {
    type = "noise-expression",
    name = "nauvis_hills_offset_normalized_y",
    expression = "normalize(nauvis_hills_offset_raw_y, nauvis_hills_offset_raw_x, 0.001)"
  },
  {
    type = "noise-expression",
    name = "nauvis_hills", -- The medium-scale hills for plateaus that act as cliff forts in normal play, or 'islands' in high-water settings.
    expression = "abs(multioctave_noise{x = x,\z
                                        y = y,\z
                                        persistence = 0.5,\z
                                        seed0 = map_seed,\z
                                        seed1 = 900,\z
                                        octaves = 4,\z
                                        input_scale = nauvis_segmentation_multiplier / 90})"
  },
  {
    type = "noise-expression",
    name = "nauvis_hills_offset",
    -- A duplicate of nauvis_hills but with an offset to allow ring-breaking.
    -- By comparing the nauvis_hills and nauvis_hills_offset, there's a low difference band perpendicular to the offset direction.
    -- which can be used to break small ring features.
    expression = "abs(multioctave_noise{x = x + 12 * nauvis_hills_offset_normalized_x,\z
                                        y = y + 12 * nauvis_hills_offset_normalized_y,\z
                                        persistence = 0.5,\z
                                        seed0 = map_seed,\z
                                        seed1 = 900,\z
                                        octaves = 4,\z
                                        input_scale = nauvis_segmentation_multiplier / 90})"
  },
  {
    type = "noise-expression",
    name = "nauvis_cliff_ringbreak",
    expression = "abs(nauvis_hills - nauvis_hills_offset)"
  },
  {
    type = "noise-expression",
    name = "nauvis_plateaus", -- make the hills to plateaus
    expression = "0.5 + clamp((nauvis_hills - nauvis_hills_cliff_level) * 10, -0.5, 0.5)"
  },
  {
    type = "noise-expression",
    name = "nauvis_hills_plateaus", -- make the hills to plateaus
    expression = "0.1 * nauvis_hills + 0.8 * nauvis_plateaus"
  },
  {
    type = "noise-expression",
    name = "nauvis_hills_cliff_level", -- make the hills to plateaus
    expression = "clamp(0.65 + basis_noise{x = x,\z
                                          y = y,\z
                                          seed0 = map_seed,\z
                                          seed1 = 99584,\z
                                          input_scale = nauvis_segmentation_multiplier/500,\z
                                          output_scale = 0.6}, 0.15, 1.15)"
  },
  {
    type = "noise-expression",
    name = "nauvis_macro",
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    persistence = 0.6,\z
                                    seed0 = map_seed,\z
                                    seed1 = 1000,\z
                                    octaves = 2,\z
                                    input_scale = nauvis_segmentation_multiplier / 1600}\z
                  * max(0, multioctave_noise{x = x,\z
                                    y = y,\z
                                    persistence = 0.6,\z
                                    seed0 = map_seed,\z
                                    seed1 = 1100,\z
                                    octaves = 1,\z
                                    input_scale = nauvis_segmentation_multiplier / 1600})",
  },

  -- Variables used by autoplace:
  {
    type = "noise-expression",
    name = "distance",
    expression = "distance_from_nearest_point{x = x, y = y, points = starting_positions}"
  },
  {
    type = "noise-expression",
    name = "tier_from_start",
    expression = "max(0, distance - starting_area_radius) / starting_area_radius"
  },
  {
    type = "noise-expression",
    name = "starting_area_weight",
    expression = "1 - min(1, 0.5 * tier_from_start)"
  },
  {
    type = "noise-expression",
    name = "water_level",
    expression = "10 * log2(control:water:size)"
  },
  {
    type = "noise-expression",
    name = "segmentation_multiplier",
    expression = "control:water:frequency"
  }
}

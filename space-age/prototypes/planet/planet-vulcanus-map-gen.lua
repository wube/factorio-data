data:extend{
  ---- Constants
  {
    type = "noise-expression",
    name = "vulcanus_ore_spacing",
    expression = 128
  },
  {
    type = "noise-expression",
    name = "vulcanus_shared_influence",
    expression = 105 * 3
  },
  {
    type = "noise-expression",
    name = "vulcanus_biome_contrast",
    expression = 2 -- higher values mean sharper transitions
  },
  {
    type = "noise-expression",
    name = "vulcanus_cracks_scale",
    expression = 0.325
  },
  --used to be segmenataion_multiplier
  {
    type = "noise-expression",
    name = "vulcanus_segment_scale",
    expression = 1
  },
  {
    --functions more like a cliffiness multiplier as all the mountain tiles have it offset.
    type = "noise-expression",
    name = "vulcanus_mountains_elevation_multiplier",
    expression = 1.5
  },

  ---- HELPERS
  {
    type = "noise-expression",
    name = "vulcanus_starting_area_multiplier",
    -- reduced richness for starting resources
    expression = "lerp(1, 0.06, clamp(0.5 + vulcanus_starting_circle, 0, 1))"
  },
  {
    type = "noise-expression",
    name = "vulcanus_richness_multiplier",
    expression = "6 + distance / 10000"
  },
  {
    type = "noise-expression",
    name = "vulcanus_scale_multiplier",
    expression = "slider_rescale(control:vulcanus_volcanism:frequency, 3)"
  },
  {
    type = "noise-function",
    name = "vulcanus_detail_noise",
    parameters = {"seed1", "scale", "octaves", "magnitude"},
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    seed0 = map_seed,\z
                                    seed1 = seed1 + 12243,\z
                                    octaves = octaves,\z
                                    persistence = 0.6,\z
                                    input_scale = 1 / 50 / scale,\z
                                    output_scale = magnitude}"
  },
  {
    type = "noise-function",
    name = "vulcanus_plasma",
    parameters = {"seed", "scale", "scale2", "magnitude1", "magnitude2"},
    expression = "abs(basis_noise{x = x,\z
                                  y = y,\z
                                  seed0 = map_seed,\z
                                  seed1 = 12643,\z
                                  input_scale = 1 / 50 / scale,\z
                                  output_scale = magnitude1}\z
                      - basis_noise{x = x,\z
                                    y = y,\z
                                    seed0 = map_seed,\z
                                    seed1 = 13423 + seed,\z
                                    input_scale = 1 / 50 / scale2,\z
                                    output_scale = magnitude2})"
  },
  {
    type = "noise-function",
    name = "vulcanus_threshold",
    parameters = {"value", "threshold"},
    expression = "(value - (1 - threshold)) * (1 / threshold)"
  },
  {
    type = "noise-function",
    name = "vulcanus_contrast",
    parameters = {"value", "c"},
    expression = "clamp(value, c, 1) - c"
  },

  ---- ELEVATION
  {
    type = "noise-expression",
    name = "vulcanus_elevation",
    --intended_property = "elevation",
    expression = "max(-500, vulcanus_elev)"
  },
  ---- TEMPERATURE: Used to place hot vs cold tilesets, e.g. cold - warm - hot cracks.
  {
    type = "noise-expression",
    name = "vulcanus_temperature",
    --intended_property = "temperature",
    expression = "100\z
                  + 100 * var('control:temperature:bias')\z
                  - min(vulcanus_elev, vulcanus_elev / 100)\z
                  - 2 * vulcanus_moisture\z
                  - 1 * vulcanus_aux\z
                  - 20 * vulcanus_ashlands_biome\z
                  + 200 * max(0, mountain_volcano_spots - 0.6)"
  },
  ---- AUX (0-1): On vulcanus this is Rockiness.
  ---- 0 is flat and arranged as paths through rocks.
  ---- 1 are rocky "islands" for rock clusters, chimneys, etc.
  {
    type = "noise-expression",
    name = "vulcanus_aux",
    --intended_property = "aux",
    expression = "clamp(min(abs(multioctave_noise{x = x,\z
                                                  y = y,\z
                                                  seed0 = map_seed,\z
                                                  seed1 = 2,\z
                                                  octaves = 5,\z
                                                  persistence = 0.6,\z
                                                  input_scale = 0.2,\z
                                                  output_scale = 0.6}),\z
                            0.3 - 0.6 * vulcanus_flood_paths), 0, 1)"
  },
  ---- MOISTURE (0-1): On vulcanus used for vegetation clustering.
  ---- 0 is no vegetation, such as ash bowels in the ashlands.
  ---- 1 is vegetation pathches (mainly in ashlands).
  ---- As this drives the ash bowls, it also has an impact on small rock & pebble placement.
  {
    type = "noise-expression",
    name = "vulcanus_moisture",
    --intended_property = "moisture",
    expression = "clamp(1\z
                        - abs(multioctave_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 4,\z
                                                octaves = 2,\z
                                                persistence = 0.6,\z
                                                input_scale = 0.025,\z
                                                output_scale = 0.25})\z
                        - abs(multioctave_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 400,\z
                                                octaves = 3,\z
                                                persistence = 0.62,\z
                                                input_scale = 0.051144353,\z
                                                output_scale = 0.25})\z
                        - 0.2 * vulcanus_flood_cracks_a, 0, 1)"
  },

  ---- Starting Area blobs
  {
    type = "noise-expression",
    name = "vulcanus_starting_area_radius",
    expression = "0.7 * 0.75"
  },
  {
    type = "noise-expression",
    name = "vulcanus_starting_direction",
    expression = "-1 + 2 * (map_seed_small & 1)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_ashlands_angle",
    expression = "map_seed_normalized * 3600"
  },
  {
    type = "noise-expression",
    name = "vulcanus_mountains_angle",
    expression = "vulcanus_ashlands_angle + 120 * vulcanus_starting_direction"
  },
  {
    type = "noise-expression",
    name = "vulcanus_basalts_angle",
    expression = "vulcanus_ashlands_angle + 240 * vulcanus_starting_direction"
  },
  {
    type = "noise-expression",
    name = "vulcanus_ashlands_start",
    -- requires more influence because it is smaller and has no mountain boost
    expression = "4 * starting_spot_at_angle{ angle = vulcanus_ashlands_angle,\z
                                              distance = 170 * vulcanus_starting_area_radius,\z
                                              radius = 350 * vulcanus_starting_area_radius,\z
                                              x_distortion = 0.1 * vulcanus_starting_area_radius * (vulcanus_wobble_x + vulcanus_wobble_large_x + vulcanus_wobble_huge_x),\z
                                              y_distortion = 0.1 * vulcanus_starting_area_radius * (vulcanus_wobble_y + vulcanus_wobble_large_y + vulcanus_wobble_huge_y)}"
  },
  {
    type = "noise-expression",
    name = "vulcanus_basalts_start",
    expression = "2 * starting_spot_at_angle{ angle = vulcanus_basalts_angle,\z
                                              distance = 250,\z
                                              radius = 550 * vulcanus_starting_area_radius,\z
                                              x_distortion = 0.1 * vulcanus_starting_area_radius * (vulcanus_wobble_x + vulcanus_wobble_large_x + vulcanus_wobble_huge_x),\z
                                              y_distortion = 0.1 * vulcanus_starting_area_radius * (vulcanus_wobble_y + vulcanus_wobble_large_y + vulcanus_wobble_huge_y)}"
  },
  {
    type = "noise-expression",
    name = "vulcanus_mountains_start",
    expression = "2 * starting_spot_at_angle{ angle = vulcanus_mountains_angle,\z
                                              distance = 250 * vulcanus_starting_area_radius,\z
                                              radius = 500 * vulcanus_starting_area_radius,\z
                                              x_distortion = 0.05 * vulcanus_starting_area_radius * (vulcanus_wobble_x + vulcanus_wobble_large_x + vulcanus_wobble_huge_x),\z
                                              y_distortion = 0.05 * vulcanus_starting_area_radius * (vulcanus_wobble_y + vulcanus_wobble_large_y + vulcanus_wobble_huge_y)}"
  },
  {
    type = "noise-expression",
    name = "vulcanus_starting_area", -- used for biome blending
    expression = "clamp(max(vulcanus_basalts_start, vulcanus_mountains_start, vulcanus_ashlands_start), 0, 1)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_starting_circle", -- Used to push random ores away. No not clamp.
    -- 600-650 circle
    expression = "1 + vulcanus_starting_area_radius * (300 - distance) / 50"
  },

  ---- BIOME NOISE

  {
    type = "noise-function",
    name = "vulcanus_biome_noise",
    parameters = {"seed1", "scale"},
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    persistence = 0.65,\z
                                    seed0 = map_seed,\z
                                    seed1 = seed1,\z
                                    octaves = 5,\z
                                    input_scale = vulcanus_scale_multiplier / scale}"
  },
  {
    type = "noise-function",
    name = "vulcanus_biome_multiscale",
    parameters = {"seed1", "scale", "bias"},
    expression = "bias + lerp(vulcanus_biome_noise(seed1, scale * 0.5),\z
                              vulcanus_biome_noise(seed1 + 1000, scale),\z
                              clamp(distance / 10000, 0, 1))"
  },
  {
    type = "noise-expression",
    name = "vulcanus_mountains_biome_noise",
    expression = "vulcanus_biome_multiscale{seed1 = 342,\z
                                            scale = 60,\z
                                            bias = 0}"
  },
  {
    type = "noise-expression",
    name = "vulcanus_ashlands_biome_noise",
    expression = "vulcanus_biome_multiscale{seed1 = 12416,\z
                                            scale = 40,\z
                                            bias = 0}"
  },
  {
    type = "noise-expression",
    name = "vulcanus_basalts_biome_noise",
    expression = "vulcanus_biome_multiscale{seed1 = 42416,\z
                                            scale = 80,\z
                                            bias = 0}"
  },


  {
    type = "noise-expression",
    name = "vulcanus_ashlands_raw",
    expression = "lerp(vulcanus_ashlands_biome_noise, starting_weights, clamp(2 * vulcanus_starting_area, 0, 1))",
    local_expressions =
    {
      starting_weights = "-vulcanus_mountains_start + vulcanus_ashlands_start - vulcanus_basalts_start"
    }
  },
  {
    type = "noise-expression",
    name = "vulcanus_basalts_raw",
    expression = "lerp(vulcanus_basalts_biome_noise, starting_weights, clamp(2 * vulcanus_starting_area, 0, 1))",
    local_expressions =
    {
      starting_weights = "-vulcanus_mountains_start - vulcanus_ashlands_start + vulcanus_basalts_start"
    }
  },

  {
    type = "noise-expression",
    name = "vulcanus_mountains_raw_pre_volcano",
    expression = "lerp(vulcanus_mountains_biome_noise, starting_weights, clamp(2 * vulcanus_starting_area, 0, 1))",
    local_expressions =
    {
      starting_weights = "vulcanus_mountains_start - vulcanus_ashlands_start - vulcanus_basalts_start"
    }
  },
  {
    type = "noise-expression",
    name = "vulcanus_mountains_biome_full_pre_volcano",
    expression = "vulcanus_mountains_raw_pre_volcano - max(vulcanus_ashlands_raw, vulcanus_basalts_raw)"
  },

  {
    type = "noise-expression",
    name = "mountain_volcano_spots",
    expression = "max(vulcanus_starting_volcano_spot, raw_spots - starting_protector)",
    local_expressions =
    {
      starting_protector = "clamp(starting_spot_at_angle{ angle = vulcanus_mountains_angle + 180 * vulcanus_starting_direction,\z
                                                          distance = (400 * vulcanus_starting_area_radius) / 2,\z
                                                          radius = 800 * vulcanus_starting_area_radius,\z
                                                          x_distortion = vulcanus_wobble_x/2 + vulcanus_wobble_large_x/12 + vulcanus_wobble_huge_x/80,\z
                                                          y_distortion = vulcanus_wobble_y/2 + vulcanus_wobble_large_y/12 + vulcanus_wobble_huge_y/80}, 0, 1)",
      raw_spots = "spot_noise{x = x + vulcanus_wobble_x/2 + vulcanus_wobble_large_x/12 + vulcanus_wobble_huge_x/80,\z
                              y = y + vulcanus_wobble_y/2 + vulcanus_wobble_large_y/12 + vulcanus_wobble_huge_y/80,\z
                              seed0 = map_seed,\z
                              seed1 = 1,\z
                              candidate_spot_count = 1,\z
                              suggested_minimum_candidate_point_spacing = volcano_spot_spacing,\z
                              skip_span = 1,\z
                              skip_offset = 0,\z
                              region_size = 256,\z
                              density_expression = volcano_area / volcanism_sq,\z
                              spot_quantity_expression = volcano_spot_radius * volcano_spot_radius,\z
                              spot_radius_expression = volcano_spot_radius,\z
                              hard_region_target_quantity = 0,\z
                              spot_favorability_expression = volcano_area,\z
                              basement_value = 0,\z
                              maximum_spot_basement_radius = volcano_spot_radius}",
      volcano_area = "lerp(vulcanus_mountains_biome_full_pre_volcano, 0, vulcanus_starting_area)",
      volcano_spot_radius = "200 * volcanism",
      volcano_spot_spacing = "1500 * volcanism",
      volcanism = "0.3 + 0.7 * slider_rescale(control:vulcanus_volcanism:size, 3) / slider_rescale(vulcanus_scale_multiplier, 3)",
      volcanism_sq = "volcanism * volcanism"
    }
  },
  {
    type = "noise-expression",
    name = "vulcanus_starting_volcano_spot",
    expression = "clamp(starting_spot_at_angle{ angle = vulcanus_mountains_angle,\z
                                                distance = 400 * vulcanus_starting_area_radius,\z
                                                radius = 200,\z
                                                x_distortion = vulcanus_wobble_x/2 + vulcanus_wobble_large_x/12 + vulcanus_wobble_huge_x/80,\z
                                                y_distortion = vulcanus_wobble_y/2 + vulcanus_wobble_large_y/12 + vulcanus_wobble_huge_y/80}, 0, 1)"
  },

  {
    type = "noise-expression",
    name = "vulcanus_mountains_raw_volcano",
    -- moderate influence for the outer 1/3 of the volcano, ramp to high influence for the middle third, and maxed for the innter third
    expression = "0.5 * vulcanus_mountains_raw_pre_volcano + max(2 * mountain_volcano_spots, 10 * clamp((mountain_volcano_spots - 0.33) * 3, 0, 1))"
  },

  -- full range biomes with no clamping, good for away-from-edge targeting.
  {
    type = "noise-expression",
    name = "vulcanus_mountains_biome_full",
    expression = "vulcanus_mountains_raw_volcano - max(vulcanus_ashlands_raw, vulcanus_basalts_raw)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_ashlands_biome_full",
    expression = "vulcanus_ashlands_raw - max(vulcanus_mountains_raw_volcano, vulcanus_basalts_raw)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_basalts_biome_full",
    expression = "vulcanus_basalts_raw - max(vulcanus_mountains_raw_volcano, vulcanus_ashlands_raw)"
  },

  -- clamped 0-1 biomes
  {
    type = "noise-expression",
    name = "vulcanus_mountains_biome",
    expression = "clamp(vulcanus_mountains_biome_full * vulcanus_biome_contrast, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_ashlands_biome",
    expression = "clamp(vulcanus_ashlands_biome_full * vulcanus_biome_contrast, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_basalts_biome",
    expression = "clamp(vulcanus_basalts_biome_full * vulcanus_biome_contrast, 0, 1)"
  },


  {
    type = "noise-expression",
    name = "vulcanus_resource_penalty",
    expression = "random_penalty_inverse(2.5, 1)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_wobble_x",
    expression = "vulcanus_detail_noise{seed1 = 10, scale = 1/8, octaves = 2, magnitude = 4}"
  },
  {
    type = "noise-expression",
    name = "vulcanus_wobble_y",
    expression = "vulcanus_detail_noise{seed1 = 1010, scale = 1/8, octaves = 2, magnitude = 4}"
  },
  {
    type = "noise-expression",
    name = "vulcanus_wobble_large_x",
    expression = "vulcanus_detail_noise{seed1 = 20, scale = 1/2, octaves = 2, magnitude = 50}"
  },
  {
    type = "noise-expression",
    name = "vulcanus_wobble_large_y",
    expression = "vulcanus_detail_noise{seed1 = 1020, scale = 1/2, octaves = 2, magnitude = 50}"
  },
  {
    type = "noise-expression",
    name = "vulcanus_wobble_huge_x",
    expression = "vulcanus_detail_noise{seed1 = 30, scale = 2, octaves = 2, magnitude = 800}"
  },
  {
    type = "noise-expression",
    name = "vulcanus_wobble_huge_y",
    expression = "vulcanus_detail_noise{seed1 = 1030, scale = 2, octaves = 2, magnitude = 800}"
  },

  {
    type = "noise-expression",
    name = "mountain_basis_noise",
    expression = "basis_noise{x = x,\z
                              y = y,\z
                              seed0 = map_seed,\z
                              seed1 = 13423,\z
                              input_scale = 1 / 500,\z
                              output_scale = 250}"
  },
  {
    type = "noise-expression",
    name = "mountain_plasma",
    expression = "vulcanus_plasma(102, 2.5, 10, 125, 625)"
  },
  {
    type = "noise-expression",
    name = "mountain_elevation",
    expression = "lerp(max(clamp(mountain_plasma, -100, 10000), mountain_basis_noise),\z
                       mountain_plasma,\z
                       clamp(0.7 * mountain_basis_noise, 0, 1))\z
                  * (1 - clamp(vulcanus_plasma(13, 2.5, 10, 0.15, 0.75), 0, 1))",
  },
  {
    type = "noise-expression",
    name = "mountain_lava_spots",
    expression = "clamp(vulcanus_threshold(mountain_volcano_spots * 1.95 - 0.95,\z
                                           0.4 * clamp(vulcanus_threshold(vulcanus_mountains_biome, 0.5), 0, 1))\z
                                           * vulcanus_threshold(clamp(vulcanus_plasma(17453, 0.2, 0.4, 10, 20) / 20, 0, 1), 1.8),\z
                        0, 1)"
  },
  {
    type = "noise-function",
    name = "volcano_inverted_peak",
    parameters = {"spot", "inversion_point"},
    expression = "(inversion_point - abs(spot - inversion_point)) / inversion_point"
  },
  {
    type = "noise-expression",
    name = "vulcanus_mountains_func",
    expression = "lerp(mountain_elevation, 700 * volcano_inverted_peak(mountain_volcano_spots, 0.65), clamp(mountain_volcano_spots * 3, 0, 1))\z
     + 200 * (aux - 0.5) * (mountain_volcano_spots + 0.5)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_ashlands_func",
    expression = "300 + 0.001 * min(basis_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 12643,\z
                                                input_scale = vulcanus_scale_multiplier / 50 / scale,\z
                                                output_scale = 150},\z
                                    basis_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 12643,\z
                                                input_scale = vulcanus_scale_multiplier / 50 / scale,\z
                                                output_scale = 150})",
    local_expressions = {scale = 3}
  },
  {
    type = "noise-expression",
    name = "vulcanus_hairline_cracks",
    expression = "vulcanus_plasma(15223, 0.3 * vulcanus_cracks_scale, 0.6 * vulcanus_cracks_scale, 0.6, 1)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_flood_cracks_a",
    expression = "lerp(min(vulcanus_plasma(7543, 2.5 * vulcanus_cracks_scale, 4 * vulcanus_cracks_scale, 0.5, 1),\z
                           vulcanus_plasma(7443, 1.5 * vulcanus_cracks_scale, 3.5 * vulcanus_cracks_scale, 0.5, 1)),\z
                       1,\z
                       clamp(vulcanus_detail_noise(241, 2 * vulcanus_cracks_scale, 2, 0.25), 0, 1))"
  },
  {
    type = "noise-expression",
    name = "vulcanus_flood_cracks_b",
    expression = "lerp(1,\z
                       min(vulcanus_plasma(12223, 2 * vulcanus_cracks_scale, 3 * vulcanus_cracks_scale, 0.5, 1),\z
                           vulcanus_plasma(152, 1 * vulcanus_cracks_scale, 1.5 * vulcanus_cracks_scale, 0.25, 0.5)) - 0.5,\z
                       clamp(0.2 + vulcanus_detail_noise(821, 6 * vulcanus_cracks_scale, 2, 0.5), 0, 1))"
  },
  {
    type = "noise-expression",
    name = "vulcanus_flood_paths",
    -- make paths through the lava cracks, get walkable areas above 0, the first value is the path height
    expression = "0.4\z
                  - vulcanus_plasma(1543, 1.5 * vulcanus_cracks_scale, 3 * vulcanus_cracks_scale, 0.5, 1)\z
                  + min(0, vulcanus_detail_noise(121, vulcanus_cracks_scale * 4, 2, 0.5))",
  },
  {
    type = "noise-expression",
    name = "vulcanus_flood_basalts_func",
    -- add hairline cracks to break up edges, crop hearilyie cracks peaks so it is more of a plates + cracks pattern
    -- lava level should be 0 and below, solid ground above 0
    expression = "min(max(vulcanus_flood_cracks_a - 0.125, vulcanus_flood_paths), vulcanus_flood_cracks_b) + 0.3 * min(0.5, vulcanus_hairline_cracks)"
  },

  {
    type = "noise-expression",
    name = "vulcanus_elevation_offset",
    expression = "0"
  },
  {
    type = "noise-function",
    name = "vulcanus_biome_blend",
    parameters = {"fade", "noise", "offset"},
    expression = "fade * (noise - offset)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_elev",
    expression = "vulcanus_elevation_offset\z
                  + lerp(lerp(120 * vulcanus_basalt_lakes_multisample,\z
                              20 + vulcanus_mountains_func * vulcanus_mountains_elevation_multiplier,\z
                              vulcanus_mountains_biome),\z
                         vulcanus_ashlands_func,\z
                         vulcanus_ashlands_biome)",
    local_expressions =
    {
      vulcanus_basalt_lakes_multisample = "min(multisample(vulcanus_basalt_lakes, 0, 0),\z
                                               multisample(vulcanus_basalt_lakes, 1, 0),\z
                                               multisample(vulcanus_basalt_lakes, 0, 1),\z
                                               multisample(vulcanus_basalt_lakes, 1, 1))"
    }
  },
  {
    type = "noise-expression",
    name = "vulcanus_basalt_lakes",
    expression = "min(1,\z
                      -0.2 + vulcanus_flood_basalts_func\z
                      - 0.35 * clamp(vulcanus_contrast(vulcanus_detail_noise(837, 1/40, 4, 1.25), 0.95)\z
                                     * vulcanus_contrast(vulcanus_detail_noise(234, 1/50, 4, 1), 0.95)\z
                                     * vulcanus_detail_noise(643, 1/70, 4, 0.7),\z
                                     0, 3))"
  },

  ---- RESOURCES
  -- metals in lowlands lava rivers
  -- sulfuric acid, and calcite on highlands mountains.
  -- coal and lichen/trees on ashlands_biome deserts.

  {
    type = "noise-expression",
    name = "vulcanus_resource_wobble_x",
    expression = "vulcanus_wobble_x + 0.25 * vulcanus_wobble_large_x"
  },
  {
    type = "noise-expression",
    name = "vulcanus_resource_wobble_y",
    expression = "vulcanus_wobble_y + 0.25 * vulcanus_wobble_large_y"
  },
  {
    type = "noise-expression",
    name = "vulcanus_starting_tungsten", -- don't use the slider for radius becuase it can make tungsten in the safe area
    expression = "starting_spot_at_angle{ angle = vulcanus_basalts_angle - 10 * vulcanus_starting_direction,\z
                                          distance = 450 * vulcanus_starting_area_radius,\z
                                          radius = 30 / 1.5,\z
                                          x_distortion = 0.5 * vulcanus_resource_wobble_x,\z
                                          y_distortion = 0.5 * vulcanus_resource_wobble_y}"
  },
  {
    type = "noise-expression",
    name = "vulcanus_starting_coal",
    expression = "starting_spot_at_angle{ angle = vulcanus_ashlands_angle + 15 * vulcanus_starting_direction,\z
                                          distance = 180 * vulcanus_starting_area_radius,\z
                                          radius = 30 * vulcanus_coal_size,\z
                                          x_distortion = 0.5 * vulcanus_resource_wobble_x,\z
                                          y_distortion = 0.5 * vulcanus_resource_wobble_y}"
  },
  {
    type = "noise-expression",
    name = "vulcanus_starting_calcite",
    expression = "starting_spot_at_angle{ angle = vulcanus_mountains_angle - 20 * vulcanus_starting_direction,\z
                                          distance = 350 * vulcanus_starting_area_radius,\z
                                          radius = 35 / 1.5 * vulcanus_calcite_size,\z
                                          x_distortion = 0.5 * vulcanus_resource_wobble_x,\z
                                          y_distortion = 0.5 * vulcanus_resource_wobble_y}"
  },
  {
    type = "noise-expression",
    name = "vulcanus_starting_sulfur",
    expression = "max(starting_spot_at_angle{ angle = vulcanus_mountains_angle + 10 * vulcanus_starting_direction,\z
                                              distance = 590 * vulcanus_starting_area_radius,\z
                                              radius = 30,\z
                                              x_distortion = 0.75 * vulcanus_resource_wobble_x,\z
                                              y_distortion = 0.75 * vulcanus_resource_wobble_y},\z
                      starting_spot_at_angle{ angle = vulcanus_mountains_angle + 30 * vulcanus_starting_direction,\z
                                              distance = 200 * vulcanus_starting_area_radius,\z
                                              radius = 25 * vulcanus_sulfuric_acid_geyser_size,\z
                                              x_distortion = 0.75 * vulcanus_resource_wobble_x,\z
                                              y_distortion = 0.75 * vulcanus_resource_wobble_y})"
  },
  {
    type = "noise-function",
    name = "vulcanus_spot_noise",
    parameters = {"seed", "count", "spacing", "span", "offset", "region_size", "density", "quantity", "radius", "favorability"},
    expression = "spot_noise{x = x + vulcanus_resource_wobble_x,\z
                             y = y + vulcanus_resource_wobble_y,\z
                             seed0 = map_seed,\z
                             seed1 = seed,\z
                             candidate_spot_count = count,\z
                             suggested_minimum_candidate_point_spacing = 128,\z
                             skip_span = span,\z
                             skip_offset = offset,\z
                             region_size = region_size,\z
                             density_expression = density,\z
                             spot_quantity_expression = quantity,\z
                             spot_radius_expression = radius,\z
                             hard_region_target_quantity = 0,\z
                             spot_favorability_expression = favorability,\z
                             basement_value = -1,\z
                             maximum_spot_basement_radius = 128}"
  },
  {
    type = "noise-expression",
    name = "vulcanus_basalts_resource_favorability",
    expression = "clamp(((vulcanus_basalts_biome_full * (vulcanus_starting_area < 0.01)) - buffer) * contrast, 0, 1)",
    local_expressions =
    {
      buffer = 0.3, -- push ores away from biome edges.
      contrast = 2
    }
  },
  {
    type = "noise-expression",
    name = "vulcanus_mountains_resource_favorability",
    expression = "clamp(main_region - (mountain_volcano_spots > 0.78), 0, 1)",
    local_expressions =
    {
      buffer = 0.4, -- push ores away from biome edges.
      contrast = 2,
      main_region = "clamp(((vulcanus_mountains_biome_full * (vulcanus_starting_area < 0.01)) - buffer) * contrast, 0, 1)"
    }
  },
  {
    type = "noise-expression",
    name = "vulcanus_mountains_sulfur_favorability",
    expression = "clamp(((vulcanus_mountains_biome_full * (vulcanus_starting_area < 0.01)) - buffer) * contrast, 0, 1)",
    local_expressions =
    {
      buffer = 0.3, -- push ores away from biome edges.
      contrast = 2
    }
  },
  {
    type = "noise-expression",
    name = "vulcanus_ashlands_resource_favorability",
    expression = "clamp(((vulcanus_ashlands_biome_full * (vulcanus_starting_area < 0.01)) - buffer) * contrast, 0, 1)",
    local_expressions =
    {
      buffer = 0.3, -- push ores away from biome edges.
      contrast = 2
    }
  },
  {
    type = "noise-function",
    name = "vulcanus_place_metal_spots",
    parameters = {"seed", "count", "offset", "size", "freq", "favor_biome"},
    expression = "min(clamp(-1 + 4 * favor_biome, -1, 1), metal_spot_noise - vulcanus_hairline_cracks / 30000)",
    local_expressions =
    {
      metal_spot_noise = "vulcanus_spot_noise{seed = seed,\z
                                              count = count,\z
                                              spacing = vulcanus_ore_spacing,\z
                                              span = 3,\z
                                              offset = offset,\z
                                              region_size = 500 + 500 / freq,\z
                                              density = favor_biome * 4,\z
                                              quantity = size * size,\z
                                              radius = size,\z
                                              favorability = favor_biome > 0.9}"
    }
  },
  {
    type = "noise-function",
    name = "vulcanus_place_sulfur_spots",
    parameters = {"seed", "count", "offset", "size", "freq", "favor_biome"},
    expression = "min(2 * favor_biome - 1, vulcanus_spot_noise{seed = seed,\z
                                                               count = count,\z
                                                               spacing = vulcanus_ore_spacing,\z
                                                               span = 3,\z
                                                               offset = offset,\z
                                                               region_size = 450 + 450 / freq,\z
                                                               density = favor_biome * 4,\z
                                                               quantity = size * size,\z
                                                               radius = size,\z
                                                               favorability = favor_biome > 0.9})"
  },
  {
    type = "noise-function",
    name = "vulcanus_place_non_metal_spots",
    parameters = {"seed", "count", "offset", "size", "freq", "favor_biome"},
    expression = "min(2 * favor_biome - 1, vulcanus_spot_noise{seed = seed,\z
                                                               count = count,\z
                                                               spacing = vulcanus_ore_spacing,\z
                                                               span = 3,\z
                                                               offset = offset,\z
                                                               region_size = 400 + 400 / freq,\z
                                                               density = favor_biome * 4,\z
                                                               quantity = size * size,\z
                                                               radius = size,\z
                                                               favorability = favor_biome > 0.9})"
  },

  {
    type = "noise-expression",
    name = "vulcanus_tungsten_ore_size",
    expression = "slider_rescale(control:tungsten_ore:size, 2)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_tungsten_ore_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(vulcanus_starting_tungsten,\z
                      min(1 - vulcanus_starting_circle,\z
                          vulcanus_place_metal_spots(789, 15, 2,\z
                                                     vulcanus_tungsten_ore_size * min(1.2, vulcanus_ore_dist) * 25,\z
                                                     control:tungsten_ore:frequency,\z
                                                     vulcanus_basalts_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "vulcanus_tungsten_ore_probability",
    expression = "(control:tungsten_ore:size > 0) * (1000 * ((1 + vulcanus_tungsten_ore_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "vulcanus_tungsten_ore_richness",
    expression = "vulcanus_tungsten_ore_region * random_penalty_between(0.9, 1, 1)\z
                  * 10000 * vulcanus_starting_area_multiplier\z
                  * control:tungsten_ore:richness / vulcanus_tungsten_ore_size"
  },

  {
    type = "noise-expression",
    name = "vulcanus_coal_size",
    expression = "slider_rescale(control:vulcanus_coal:size, 2)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_coal_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(vulcanus_starting_coal,\z
                      min(1 - vulcanus_starting_circle,\z
                          vulcanus_place_non_metal_spots(782349, 12, 1,\z
                                                         vulcanus_coal_size * min(1.2, vulcanus_ore_dist) * 25,\z
                                                         control:vulcanus_coal:frequency,\z
                                                         vulcanus_ashlands_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "vulcanus_coal_probability",
    expression = "(control:vulcanus_coal:size > 0) * (1000 * ((1 + vulcanus_coal_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "vulcanus_coal_richness",
    expression = "vulcanus_coal_region * random_penalty_between(0.9, 1, 1)\z
                  * 18000 * vulcanus_starting_area_multiplier\z
                  * control:vulcanus_coal:richness / vulcanus_coal_size"
  },

  {
    type = "noise-expression",
    name = "vulcanus_calcite_size",
    expression = "slider_rescale(control:calcite:size, 2)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_calcite_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(vulcanus_starting_calcite,\z
                      min(1 - vulcanus_starting_circle,\z
                          vulcanus_place_non_metal_spots(749, 12, 1,\z
                                                         vulcanus_calcite_size * min(1.2, vulcanus_ore_dist) * 25,\z
                                                         control:calcite:frequency,\z
                                                         vulcanus_mountains_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "vulcanus_calcite_probability",
    expression = "(control:calcite:size > 0) * (1000 * ((1 + vulcanus_calcite_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "vulcanus_calcite_richness",
    expression = "vulcanus_calcite_region * random_penalty_between(0.9, 1, 1)\z
                  * 24000 * vulcanus_starting_area_multiplier\z
                  * control:calcite:richness / vulcanus_calcite_size"
  },

  {
    type = "noise-expression",
    name = "vulcanus_sulfuric_acid_geyser_size",
    expression = "slider_rescale(control:sulfuric_acid_geyser:size, 2)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_sulfuric_acid_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(vulcanus_starting_sulfur,\z
                      min(1 - vulcanus_starting_circle,\z
                          vulcanus_place_sulfur_spots(759, 9, 0,\z
                                                      vulcanus_sulfuric_acid_geyser_size * min(1.2, vulcanus_ore_dist) * 25,\z
                                                      control:sulfuric_acid_geyser:frequency,\z
                                                      vulcanus_mountains_sulfur_favorability)))"
  },
  {
    type = "noise-expression",
    name = "vulcanus_sulfuric_acid_patches",
    -- small wavelength noise (5 tiles-ish) to make geyser placement patchy but consistent between resources and decoratives
    expression = "0.8 * abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 21000, octaves = 2, input_scale = 1/3})"
  },
  {
    type = "noise-expression",
    name = "vulcanus_sulfuric_acid_region_patchy",
    expression = "(1 + vulcanus_sulfuric_acid_region) * (0.5 + 0.5 * vulcanus_sulfuric_acid_patches) - 1"
  },
  {
    type = "noise-expression",
    name = "vulcanus_sulfuric_acid_geyser_probability",
    expression = "(control:sulfuric_acid_geyser:size > 0) * (0.025 * ((vulcanus_sulfuric_acid_region_patchy > 0) + 2 * vulcanus_sulfuric_acid_region_patchy))"
  },
  {
    type = "noise-expression",
    name = "vulcanus_sulfuric_acid_geyser_richness",
    expression = "(vulcanus_sulfuric_acid_region > 0) * random_penalty_between(0.5, 1, 1)\z
                  * 80000 * 40 * vulcanus_richness_multiplier * vulcanus_starting_area_multiplier\z
                  * control:sulfuric_acid_geyser:richness / vulcanus_sulfuric_acid_geyser_size"
  },
  {
    type = "noise-expression",
    name = "vulcanus_ore_dist",
    expression = "max(1, distance / 4000)"
  },

  -- DECORATIVES
  {
    type = "noise-expression",
    name = "vulcanus_decorative_knockout", -- small wavelength noise (5 tiles-ish) to make decoratives patchy
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1300000, octaves = 2, input_scale = 1/3}"
  },
  {
    type = "noise-expression",
    name = "vulcanus_rock_noise",
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    seed0 = map_seed,\z
                                    seed1 = 137,\z
                                    octaves = 4,\z
                                    persistence = 0.65,\z
                                    input_scale = 0.1,\z
                                    output_scale = 0.4}"
    -- 0.1 / slider_rescale(var('control:rocks:frequency'), 2),\z
  },

  {
    type = "noise-expression",
    name = "vulcanus_tree",
    expression = "min(10 * (vulcanus_ashlands_biome - 0.9),\z
                      -1.5 + 1.5 * moisture + 0.5 * (moisture > 0.9) - 0.5 * aux + 0.5 * vulcanus_decorative_knockout)"
  },

  -- Demolishers
  {
    type = "noise-expression",
    name = "demolisher_territory_radius",
    expression = 384
  },
  {
    type = "noise-expression",
    name = "demolisher_territory_expression",
    expression = "voronoi_cell_id{x = x + 1000 * demolisher_territory_radius,\z
                                  y = y + 1000 * demolisher_territory_radius,\z
                                  seed0 = map_seed,\z
                                  seed1 = 0,\z
                                  grid_size = demolisher_territory_radius,\z
                                  distance_type = 'manhattan',\z
                                  jitter = 1} - demolisher_starting_area"
  },
  {
    type = "noise-expression",
    name = "demolisher_starting_area",
    expression = "0 < starting_spot_at_angle{angle = vulcanus_mountains_angle - 5 * vulcanus_starting_direction,\z
                                                  distance = 100 * vulcanus_starting_area_radius + 32,\z
                                                  radius = 7 * 32,\z
                                                  x_distortion = 0,\z
                                                  y_distortion = 0}"
  },
  {
    type = "noise-expression",
    name = "demolisher_variation_expression",
    expression = "floor(clamp(distance / (18 * 32) - 0.25, 0, 4)) + (-99 * no_enemies_mode)" -- negative number means no demolisher
  }
}


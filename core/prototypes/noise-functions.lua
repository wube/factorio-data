data:extend{
  {
    type = "noise-function",
    name = "lerp",
    parameters = {"a", "b", "alpha"},
    expression = "a + (b - a) * alpha",
  },
  {
    type = "noise-function", -- takes the non-linear slider output of 1/6 to 6 and maps it to a linear range.
    name = "slider_to_linear",
    parameters = {"slider_value", "min", "max"},
    expression = "min + 0.5 * (max - min) * (1 + log2(slider_value) / log2(6))"
  },
  {
    type = "noise-function", -- takes the non-linear slider output of 1/6 to 6 and maps it to a range of 1/n to n
    name = "slider_rescale",
    parameters = {"slider_value", "n"},
    expression = "2^(log2(slider_value)/log2(6)*log2(n))"
  },
  {
    type = "noise-function",
    name = "spot_at_angle",
    parameters = {"angle", "distance", "radius", "x_distortion", "y_distortion"},
    expression = "1 - (delta_x * delta_x + delta_y * delta_y) ^ 0.5 / radius",
    local_expressions =
    {
      angle_rad = "angle / 180 * pi",
      delta_x = "distance * sin(angle_rad) - x + x_distortion",
      delta_y = "-distance * cos(angle_rad) - y + y_distortion"
    }
  },
  {
    type = "noise-function",
    name = "starting_spot_at_angle",
    parameters = {"angle", "distance", "radius", "x_distortion", "y_distortion"},
    expression = "1 - (delta_x * delta_x + delta_y * delta_y) ^ 0.5 / radius",
    local_expressions =
    {
      angle_rad = "angle / 180 * pi",
      delta_x = "distance * sin(angle_rad) - x_from_start + x_distortion",
      delta_y = "-distance * cos(angle_rad) - y_from_start + y_distortion"
    }
  },
  {
    type = "noise-function",
    name = "rotate_x",
    parameters = {"x", "y", "angle"},
    expression = "x * cos(angle_rad) + y * sin(angle_rad)",
    local_expressions =
    {
      angle_rad = "angle / 180 * pi",
    }
  },
  {
    type = "noise-function",
    name = "rotate_y",
    parameters = {"x", "y", "angle"},
    expression = "y * cos(angle_rad) - x * sin(angle_rad)",
    local_expressions =
    {
      angle_rad = "angle / 180 * pi",
    }
  },
  {
    type = "noise-function",
    name = "noise_layer_noise",
    parameters = {"seed"},
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = seed, octaves = 4, input_scale = 1/6, output_scale = 2/3}"
  },
  {
    type = "noise-function",
    name = "random",
    parameters = {"amplitude", "seed"},
    expression = "1 - random_penalty{x = x, y = y, seed = seed, source = 1, amplitude = amplitude}" -- Note: source must be > 0
  },
  {
    type = "noise-function",
    name = "random_penalty_at",
    parameters = {"value", "seed"},
    expression = "random_penalty{x = x, y = y, seed = seed, source = value, amplitude = value}"
  },
  {
    type = "noise-function",
    name = "random_penalty_between",
    parameters = {"from", "to", "seed"},
    expression = "random_penalty{x = x, y = y, seed = seed, source = to, amplitude = to - from}"
  },
  {
    type = "noise-function",
    name = "random_penalty_inverse",
    parameters = {"penalty", "seed"},
    expression = "random_penalty{x = x, y = y, seed = seed, source = 1, amplitude = 1 / penalty}"
  },
  {
    type = "noise-function",
    name = "range_select",
    -- Selects the specified from-to range with a value of 1 or above, with an external falloff slope.
    -- For min-max range of 0-1, the from-to area will be 1 and the external area will descend to 0 at the slope rate.
    -- If max is above 1 then the slope will continue inwards from the from-to boundry until it reaches max.
    parameters = {"input", "from", "to", "slope", "min", "max"},
    expression = "clamp(min(input - (from - slope), to + slope - input) / slope, min, max)"
  },
  {
    type = "noise-function",
    name = "range_select_base",
    -- Selects the specified from-to range with a value of 0 or above, with a slope crossing 0 at the from-to markers and ascending inside at the slope rate
    -- For min-max range of 0-1, the from-to points will be 0 and the middle may be up to 1 IF there is enough space for the slope to reach that high.
    -- If min is below 0 then the slope continues to descend outside of the from-to range
    parameters = {"input", "from", "to", "slope", "min", "max"},
    expression = "clamp(min(input - from, to - input) / slope, min, max)"
  },
  {
    type = "noise-function",
    name = "asymmetric_ramps",
    -- Makes a ramp with output values from -1 to 1 over the input _bottom and _top ranges.
    -- The _tops are where the output crosses 0 (if at all).
    -- The _bottoms are where the output crosses -1.
    -- The max output depends on the distance between from_top and to_top, so it can be positive if they are apart,
    -- or negative if they go passed each other.
    -- Designed to be used with a group of asymmetric_ramps inside a shared min(), so there's no built-in max limit.
    -- Useful for things like trees where a new tree is gradually introduced in moist areas, but abruptly ends when meeting desert.
    parameters = {"input", "from_bottom", "from_top", "to_top", "to_bottom"},
    expression = "min((input - from_top) / (from_top - from_bottom), (to_top - input) / (to_bottom - to_top))"
  },
  {
    type = "noise-function",
    name = "place_every_n",
    -- uses an off-axis grid with an interference pattern similar to rotated hex distribution
    -- irrational number approximations are important to avoid grid repeats
    -- valid spaces are actually diamond shaped
    parameters = {"x_spacing", "y_spacing", "x_offset", "y_offset"},
    expression = "min(((o_x + o_y * 0.93819) / 1.41983 % x_spacing) <= 1,\z
                       ((o_x / 4.1875839 - o_y) * 0.913853883 % y_spacing) <= 1)",
    local_expressions =
    {
      o_x = "x + x_offset",
      o_y = "y + y_offset"
    }
  },
  {
    type = "noise-function",
    name = "quick_multioctave_noise_persistence",
    parameters = {"x", "y", "seed0", "seed1", "input_scale", "output_scale", "octaves", "octave_input_scale_multiplier", "persistence"},
    expression = "quick_multioctave_noise{x = x,\z
                                          y = y,\z
                                          seed0 = seed0,\z
                                          seed1 = seed1,\z
                                          input_scale = input_scale * octave_input_scale_multiplier ^ (octaves - 1),\z
                                          output_scale = output_scale * 2 ^ (octaves - 1),\z
                                          octaves = octaves,\z
                                          octave_output_scale_multiplier = persistence,\z
                                          octave_input_scale_multiplier = 1 / octave_input_scale_multiplier}"
  },
  {
    type = "noise-function",
    name = "amplitude_corrected_multioctave_noise",
    parameters = {"x", "y", "seed0", "seed1", "input_scale", "offset_x", "octaves", "persistence", "amplitude"},
    expression = "variable_persistence_multioctave_noise{x = x,\z
                                                         y = y,\z
                                                         seed0 = seed0,\z
                                                         seed1 = seed1,\z
                                                         input_scale = input_scale,\z
                                                         output_scale = (1 - persistence) / 2 ^ octaves / (1 - persistence ^ octaves) * amplitude,\z
                                                         offset_x = offset_x,\z
                                                         octaves = octaves,\z
                                                         persistence = persistence}"
  },
  {
    type = "noise-function",
    name = "resource_autoplace_all_patches",
    parameters =
    {
      "base_density",
      "base_spots_per_km2",
      "candidate_spot_count",
      "frequency_multiplier",
      "has_starting_area_placement",
      "random_spot_size_minimum",
      "random_spot_size_maximum",
      "regular_blob_amplitude_multiplier", -- Amplitude of spot 'blob noise' relative to typical spot amplitude
      "regular_patch_set_count",
      "regular_patch_set_index",
      "regular_rq_factor", -- rq_factor is the ratio of the radius of a patch to the cube root of its quantity,
                           -- i.e. radius of a quantity=1 patch; higher values = fatter, shallower patches
      "seed1",
      "size_multiplier",
      "starting_blob_amplitude_multiplier",
      "starting_patch_set_count",
      "starting_patch_set_index",
      "starting_rq_factor"
    },
    expression = "if(has_starting_area_placement == 1, max(starting_patches, regular_patches), regular_patches)",
    local_expressions =
    {
      -- Since starting and regular spots get maxed together, the basement value should be the lower of the two.
      -- This value needs to be low enough that any noise added to it is still below zero, so that we don't get bits of ores
      -- sticking out between spot noise spots. It also needs to be constant because that's how the spot noise op works.
      -- Simply using -infinity would work, but calculating it based on blob amplitude:
      --   a) looks nicer if you render the value on a map preview
      --   b) acts as a check on our blob_amplitude calculations
      basement_value = "-6 * max(regular_blob_amplitude_at(regular_blob_amplitude_maximum_distance), starting_blob_amplitude)",

      blobs0 = "basis_noise{x = x, y = y, seed0 = map_seed, seed1 = seed1, input_scale = 1/8, output_scale = 1} + \z
                basis_noise{x = x, y = y, seed0 = map_seed, seed1 = seed1, input_scale = 1/24, output_scale = 1}",
      double_density_distance = 1300, -- Distance at which patches have twice as much stuff in them.
      regular_patch_fade_in_distance = 300,
      starting_resource_placement_radius = 120, -- The starting area size option should not affect regular ore placement, so it is hard-coded.
      starting_patches_split = 0.5, -- Lower numbers decrease the likelihood that the starting patches get split.

      -- Starting patches
      starting_patches = "spot_noise{x = x,\z
                                     y = y,\z
                                     density_expression = starting_amount / (pi * starting_resource_placement_radius * starting_resource_placement_radius) * \z
                                                          starting_modulation,\z
                                     spot_quantity_expression = starting_area_spot_quantity,\z
                                     spot_radius_expression = starting_rq_factor * starting_area_spot_quantity ^ (1/3),\z
                                     spot_favorability_expression = clamp((elevation_lakes - 1) / 10, 0, 1) * starting_modulation * 2 - \z
                                                                    distance / starting_resource_placement_radius + random_penalty_at(0.5, 1),\z
                                     seed0 = map_seed,\z
                                     seed1 = seed1 + 1,\z
                                     skip_span = starting_patch_set_count,\z
                                     skip_offset = starting_patch_set_index,\z
                                     region_size = starting_resource_placement_radius * 2,\z
                                     candidate_spot_count = 32,\z
                                     suggested_minimum_candidate_point_spacing = 32,\z
                                     hard_region_target_quantity = 1,\z
                                     basement_value = basement_value,\z
                                     maximum_spot_basement_radius = 128} + \z
                          (blobs0 - 0.25) * starting_blob_amplitude",
      starting_amount = "20000 * base_density * (frequency_multiplier + 1) * size_multiplier",
      starting_area_spot_quantity = "starting_amount / starting_patches_split / frequency_multiplier",
      starting_blob_amplitude = "starting_blob_amplitude_multiplier / (pi/3 * starting_rq_factor ^ 2) * starting_area_spot_quantity ^ (1/3)",
      starting_modulation = "starting_resource_placement_radius > distance",

      -- Regular patches
      regular_patches = "spot_noise{x = x,\z
                                    y = y,\z
                                    density_expression = regular_density_at(distance),\z
                                    spot_quantity_expression = regular_spot_quantity_expression,\z
                                    spot_radius_expression = min(32, regular_rq_factor * regular_spot_quantity_expression ^ (1/3)),\z
                                    spot_favorability_expression = 1,\z
                                    seed0 = map_seed,\z
                                    seed1 = seed1,\z
                                    region_size = 1024,\z
                                    candidate_spot_count = candidate_spot_count,\z
                                    suggested_minimum_candidate_point_spacing = 45.254833995939045,\z
                                    skip_span = regular_patch_set_count,\z
                                    skip_offset = regular_patch_set_index,\z
                                    hard_region_target_quantity = 0,\z
                                    basement_value = basement_value,\z
                                    maximum_spot_basement_radius = 128} + \z
                         (blobs0 + basis_noise{x = x, y = y, seed0 = map_seed, seed1 = seed1, input_scale = 1/64, output_scale = 1.5} - 1/3) * \z
                         regular_blob_amplitude_at(distance)",
      regular_blob_amplitude_maximum_distance = "if(has_starting_area_placement == -1,\z
                                                    double_density_distance,\z
                                                    double_density_distance + regular_patch_fade_in_distance)",
      regular_spot_quantity_expression = "random_penalty_between(random_spot_size_minimum, random_spot_size_maximum, 1) * \z
                                          regular_spot_quantity_base_at(distance)"
    },
    local_functions =
    {
      size_effective_distance_at =
      {
        parameters = {"distance"},
        expression = "if(has_starting_area_placement == -1, distance, distance - regular_patch_fade_in_distance)"
      },
      regular_density_at =
      {
        parameters = {"distance"},
        expression = "base_density * frequency_multiplier * size_multiplier * \z
                      if(has_starting_area_placement == -1, 1, clamp((distance - starting_resource_placement_radius) / regular_patch_fade_in_distance, 0, 1)) * \z
                      (1 + clamp(size_effective_distance_at(distance) / double_density_distance, 0, 1))"
      },
      regular_spot_quantity_base_at =
      {
        parameters = {"distance"},
        expression = "1000000 / base_spots_per_km2 / frequency_multiplier * regular_density_at(distance)"
      },
      regular_spot_height_typical_at =
      {
        parameters = {"distance"},
        expression = "((random_spot_size_minimum + random_spot_size_maximum) / 2 * regular_spot_quantity_base_at(distance)) ^ (1/3) / (pi/3 * regular_rq_factor ^ 2)"
      },
      regular_blob_amplitude_at =
      {
        parameters = {"distance"},
        expression = "regular_blob_amplitude_multiplier * min(regular_spot_height_typical_at(regular_blob_amplitude_maximum_distance),\z
                                                              regular_spot_height_typical_at(distance))"
      }
    }
  }
}

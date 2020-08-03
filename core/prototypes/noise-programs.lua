local noise = require("noise")
local util = require("util")
local tne = noise.to_noise_expression

local enable_debug_expressions = false
local function debug_property(propname)
  if enable_debug_expressions then
    return propname
  end
  return nil
end

local function make_basis_noise_function(seed0,seed1,outscale0,inscale0)
  outscale0 = outscale0 or 1
  inscale0 = inscale0 or 1/outscale0
  return function(x,y,inscale,outscale)
    return tne
    {
      type = "function-application",
      function_name = "factorio-basis-noise",
      arguments =
      {
        x = tne(x),
        y = tne(y),
        seed0 = tne(seed0),
        seed1 = tne(seed1),
        input_scale = tne((inscale or 1) * inscale0),
        output_scale = tne((outscale or 1) * outscale0)
      }
    }
  end
end

local function multioctave_noise(params)
  local x = params.x or noise.var("x")
  local y = params.y or noise.var("y")
  local seed0 = params.seed0 or 1
  local seed1 = params.seed1 or 1
  local octave_count = params.octave_count or 1
  local octave0_output_scale = params.octave0_output_scale or 1
  local octave0_input_scale = params.octave0_input_scale or 1
  if params.persistence and params.octave_output_scale_multiplier then
    error("Both persistence and octave_output_scale_multiplier were provided to multioctave_noise, which makes no sense!")
  end
  local octave_output_scale_multiplier = params.octave_output_scale_multiplier or 2
  local octave_input_scale_multiplier = params.octave_input_scale_multiplier or 1/2
  local basis_noise_function = params.basis_noise_function or make_basis_noise_function(seed0, seed1)

  if params.persistence then
    octave_output_scale_multiplier = params.persistence
    -- invert everything so that we can multiply by persistence every time
    -- first octave is the largest instead of the smallest
    octave0_input_scale = octave0_input_scale * math.pow(octave_input_scale_multiplier, octave_count - 1)
    -- 'persistence' implies that the octaves would otherwise have been powers of 2, I think
    octave0_output_scale = octave0_output_scale * math.pow(2, octave_count - 1)
    octave_input_scale_multiplier = 1 / octave_input_scale_multiplier
  end

  return tne{
    type = "function-application",
    function_name = "factorio-quick-multioctave-noise",
    arguments =
    {
      x = tne(x),
      y = tne(y),
      seed0 = tne(seed0),
      seed1 = tne(seed1),
      input_scale = tne(octave0_input_scale),
      output_scale = tne(octave0_output_scale),
      octaves = tne(octave_count),
      octave_output_scale_multiplier = tne(octave_output_scale_multiplier),
      octave_input_scale_multiplier = tne(octave_input_scale_multiplier)
    }
  }
end

-- Multioctave noise that's constructed in a simple way and knows about 'persistence'.
-- It doesn't *have* to be variable,
-- but this construction allows for it.
local function simple_variable_persistence_multioctave_noise(params)
  local x = params.x or noise.var("x")
  local y = params.y or noise.var("y")
  local seed0 = params.seed0 or 1
  local seed1 = params.seed1 or 1
  local octave_count = params.octave_count or 1
  local octave0_output_scale = params.octave0_output_scale or 1
  local octave0_input_scale = params.octave0_input_scale or 1
  local persistence = params.persistence or 1/2

  local terms = {}
  -- Start at the 'large' octave (assuming powers of 2 size increases)
  -- and work inwards, doubling the frequency and mulitplying amplitude by persistence.
  -- 'octave0' is the smallest octave.
  local largest_octave_scale = (2 ^ octave_count)
  local inscale = octave0_input_scale / largest_octave_scale
  local outscale = octave0_output_scale * largest_octave_scale
  for oct=1,octave_count do
    terms[oct] = tne{
      type = "function-application",
      function_name = "factorio-basis-noise",
      arguments = {
        x = tne(x),
        y = tne(y),
        seed0 = tne(seed0),
        seed1 = tne(seed1),
        input_scale = tne(inscale),
        output_scale = tne(1), -- Since outscale is variable, need to multiply separately
      }
    } * outscale
    inscale = inscale * 2 -- double frequency
    outscale = outscale * persistence -- lower amplitude (unless persistence is >1, which would be weird but okay)
  end
  return tne{
    type = "function-application",
    function_name = "add",
    arguments = terms
  }
end

-- Accounts for multiple octaves to return an expression whose amplitude maxes out at about +-1
-- (or +-octave0_input_scale, if that's passed in).
-- Parameters are the same as for simple_variable_persistence_multioctave_noise.
local function simple_amplitude_corrected_multioctave_noise(params)
  local amplitide = params.amplitude or 1
  local persistence = params.persistence or 0.5
  local octave_count = params.octave_count or 1
  -- 0.12's ImprovedNoise would do like:
  -- output = total / ((1 - amplitude) / (1 - persistence)) -- where amplitude is persistence ^ octaves
  -- output = total * (1 - persistence) / (1 - persistence ^ octaves)
  -- So use (1 - persistence) / (1 - persistence ^ octaves) as the output multiplier
  -- but it also uses 1 as the amplitude of the largest octave, whereas
  -- simple_variable_persistence_multioctave_noise uses 2^octave_count.
  -- So divide by that, too:
  local multiplier = (1 - persistence) / (2^octave_count) / (1 - persistence ^ octave_count)

  if params.octave0_output_scale then
    error("Don't pass octave0_output_scale to simple_amplitude_corrected_multioctave_noise; pass amplitude, instead")
  end
  return simple_variable_persistence_multioctave_noise(util.merge{params, {octave0_output_scale = multiplier * amplitide}})
end

local function make_multioctave_noise_function(seed0,seed1,octaves,octave_output_scale_multiplier,octave_input_scale_multiplier,output_scale0,input_scale0)
  octave_output_scale_multiplier = octave_output_scale_multiplier or 2
  octave_input_scale_multiplier = octave_input_scale_multiplier or 1 / octave_output_scale_multiplier
  return function(x,y,inscale,outscale)
    return tne{
      type = "function-application",
      function_name = "factorio-quick-multioctave-noise",
      arguments =
      {
        x = tne(x),
        y = tne(y),
        seed0 = tne(seed0),
        seed1 = tne(seed1),
        input_scale = tne((inscale or 1) * (input_scale0 or 1)),
        output_scale = tne((outscale or 1) * (output_scale0 or 1)),
        octaves = tne(octaves),
        octave_output_scale_multiplier = tne(octave_output_scale_multiplier),
        octave_input_scale_multiplier = tne(octave_input_scale_multiplier)
      }
    }
  end
end

-- Returns a multioctave noise function where each octave's noise is multiplied by some other noise
-- by default 'some other noise' is the basis noise at 17x lower frequency,
-- normalized around 0.5 and clamped between 0 and 1
local function make_multioctave_modulated_noise_function(params)
  local seed0 = params.seed0 or 1
  local seed1 = params.seed1 or 1
  local octave_count = params.octave_count or 1
  local octave0_output_scale = params.octave0_output_scale or 1
  local octave0_input_scale = params.octave0_input_scale or 1
  local octave_output_scale_multiplier = params.octave_output_scale_multiplier or 2
  local octave_input_scale_multiplier = params.octave_input_scale_multiplier or 1/2
  local basis_noise_function = params.basis_noise_function or make_basis_noise_function(seed0, seed1)
  local modulation_noise_function = params.modulation_noise_function or function(x,y)
    return noise.clamp(basis_noise_function(x,y)+0.5, 0, 1)
  end
  -- input scale of modulation relative to each octave's base input scale
  local mris = params.modulation_relative_input_scale or 1/17

  return function(x,y)
    local outscale = octave0_output_scale
    local inscale = octave0_input_scale
    local result = 0

    for i=1,octave_count do
      local noise = basis_noise_function(x*inscale, y*inscale)
      local modulation = modulation_noise_function(x*(inscale*mris), y*(inscale*mris))
      result = result + (outscale * noise * modulation)

      outscale = outscale * octave_output_scale_multiplier
      inscale = inscale * octave_input_scale_multiplier
    end

    return result
  end
end

local standard_starting_lake_elevation_expression = noise.define_noise_function( function(x,y,tile,map)
  local starting_lake_distance = noise.distance_from(x, y, noise.var("starting_lake_positions"), 1024)
  local minimal_starting_lake_depth = 4
  local minimal_starting_lake_bottom =
    starting_lake_distance / 4 - minimal_starting_lake_depth +
    make_basis_noise_function(map.seed, 123, 1.5, 1/8)(x,y)

  -- Starting cone ensures a more random (but not ~too~ random, because people don't like 'swampy lakes')
  -- valley outside the starting lake:
  local starting_cone_slope = noise.fraction(1, 16)
  local starting_cone_offset = -1
  local starting_cone_noise_multiplier = noise.var("starting-lake-noise-amplitude")/16
  -- Second cone is intended to provide a more gradual slope and more noise
  -- outside of the first cone in order to prevent obvious circles of cliffs.
  -- Its bottom is clamped to a positive value so that it will only affect cliffs,
  -- not water.
  local second_cone_slope = noise.fraction(1, 16)
  local second_cone_offset = 2
  local second_cone_noise_multiplier = noise.var("starting-lake-noise-amplitude")/2

  local starting_lake_noise = multioctave_noise{
    x = x,
    y = y,
    seed0 = map.seed,
    seed1 = 14, -- CorePrototypes::elevationNoiseLayer->getID().getIndex()
    octave0_input_scale = 1/8, -- We don't want the starting lake to scale along with the rest of the map
    octave0_output_scale = 1,
    octave_count = 5,
    persistence = 0.75
  }
  return noise.ident(noise.min(
    minimal_starting_lake_bottom,
    starting_cone_offset + starting_cone_slope * starting_lake_distance + starting_cone_noise_multiplier * starting_lake_noise,
    noise.max(
      second_cone_offset,
      second_cone_offset + second_cone_slope * starting_lake_distance + second_cone_noise_multiplier * starting_lake_noise
    )
  ))
end)

local function water_level_correct(to_be_corrected, map)
  return noise.ident(noise.max(
    map.wlc_elevation_minimum,
    to_be_corrected + map.wlc_elevation_offset
  ))
end

local cliff_terracing_enabled = false

local function finish_elevation(elevation, map)
  local elevation = water_level_correct(elevation, map)
  elevation = elevation / map.segmentation_multiplier
  elevation = noise.min(elevation, standard_starting_lake_elevation_expression)
  if cliff_terracing_enabled then
    elevation = noise.terrace_for_cliffs(elevation, nil, map)
  end
  return elevation
end

local function make_0_12like_lakes(x, y, tile, map, options)
  options = options or {}
  local terrain_octaves = options.terrain_octaves or 8
  local amplitude_multiplier = 1/8
  local roughness_persistence = 0.7
  local bias = options.bias or 20 -- increase average elevation level by this much
  local starting_plateau_bias = 20
  local starting_plateau_octaves = 6

  local roughness = simple_amplitude_corrected_multioctave_noise{
    x = x,
    y = y,
    seed0 = map.seed,
    seed1 = 1,
    octave_count = terrain_octaves - 2,
    amplitude = 1/2,
    octave0_input_scale = 1/2,
    persistence = roughness_persistence
  }
  local persistence = noise.clamp(roughness + 0.3, 0.1, 0.9)
  local lakes = simple_variable_persistence_multioctave_noise{
    x = x,
    y = y,
    seed0 = map.seed,
    seed1 = 1,
    octave_count = terrain_octaves,
    octave0_input_scale = 1/2,
    octave0_output_scale = amplitude_multiplier,
    persistence = persistence
  }
  local starting_plateau_basis = simple_variable_persistence_multioctave_noise{
    x = x,
    y = y,
    seed0 = map.seed,
    seed1 = 2,
    octave_count = starting_plateau_octaves,
    octave0_input_scale = 1/2,
    octave0_output_scale = amplitude_multiplier,
    persistence = persistence
  }
  local starting_plateau = starting_plateau_basis + starting_plateau_bias + map.finite_water_level - tile.distance * map.segmentation_multiplier / 10
  return noise.max(lakes + bias, starting_plateau)
end

local average_sea_level_temperature = 15
local elevation_temperature_gradient = 0 -- -0.5 might be a good value to start with if you want to try correlating temperature with elevation

local function clamp_moisture(raw_moisture)
  -- Clamping logic originally from tilePropertiesProvider
  -- "also can you remove the indirect influence of temperature over tiles? unless there's some reason for it?"
  -- -- Twinsen, 2019-01-25
  --local max_saturation = noise.clamp(
  --  (noise.var"temperature" + 20) / 40,
  --  0, 1
  --)
  local max_saturation = 1
  return noise.clamp(raw_moisture, 0, max_saturation)
end

local function clamp_temperature(raw_temperature)
  return noise.clamp(raw_temperature, -20, 50)
end

local function clamp_aux(raw_aux)
  return noise.clamp(raw_aux, 0, 1)
end

data:extend{
  {
    type = "noise-expression",
    name = "temperature",
    intended_property = "temperature",
    expression = noise.define_noise_function( function(x,y,tile,map)
      x = x * noise.var("control-setting:temperature:frequency:multiplier") + 40000 -- Move the point where 'fractal similarity' is obvious off into the boonies
      y = y * noise.var("control-setting:temperature:frequency:multiplier")
      local base_temp =
        average_sea_level_temperature +
        make_multioctave_noise_function(map.seed, 5, 4, 3)(x,y,1/32,1/20) +
        noise.var("control-setting:temperature:bias")
      local elevation_adjusted_temperature = base_temp + noise.var("elevation") * elevation_temperature_gradient
      return noise.ident(clamp_temperature(elevation_adjusted_temperature))
    end)
  },
  {
    type = "noise-expression",
    name = "debug-temperature",
    intended_property = debug_property("temperature"),
    expression = noise.define_noise_function( function(x,y,tile,map)
      return noise.ident(clamp_temperature(x * (1 / 4)))
    end)
  },
  {
    type = "noise-expression",
    name = "moisture",
    intended_property = "moisture",
    expression = noise.define_noise_function( function(x,y,tile,map)
      x = x * noise.var("control-setting:moisture:frequency:multiplier") + 30000 -- Move the point where 'fractal similarity' is obvious off into the boonies
      y = y * noise.var("control-setting:moisture:frequency:multiplier")
      local raw_moisture =
        3/8 +
        make_multioctave_noise_function(map.seed, 6, 4, 1.5, 1/3)(x,y,1/256,1/8) +
        noise.var("control-setting:moisture:bias")
      return noise.ident(clamp_moisture(raw_moisture))
    end)
  },
  {
    type = "noise-expression",
    name = "debug-moisture",
    intended_property = debug_property("moisture"),
    expression = noise.define_noise_function( function(x,y,tile,map)
      return noise.ident(clamp_moisture(y * (1 / 400)))
    end)
  },
  {
    type = "noise-expression",
    name = "aux",
    intended_property = "aux",
    expression = noise.define_noise_function( function(x,y,tile,map)
      x = x * noise.var("control-setting:aux:frequency:multiplier") + 20000 -- Move the point where 'fractal similarity' is obvious off into the boonies
      y = y * noise.var("control-setting:aux:frequency:multiplier")
      local raw_aux =
        0.5 +
        make_multioctave_noise_function(map.seed, 7, 4, 1/2, 3)(x,y,1/2048,1/4) +
        noise.var("control-setting:aux:bias")
      return noise.ident(clamp_aux(raw_aux))
    end)
  },
  {
    type = "noise-expression",
    name = "debug-aux",
    intended_property = debug_property("aux"),
    expression = noise.define_noise_function( function(x,y,tile,map)
      -- Tile peaks tend to be based on aux+water,
      -- so let's use the same dimension as temperature for aux
      return noise.ident(clamp_aux(x * (1 / 400)))
    end)
  },
  {
    type = "noise-expression",
    name = "rings",
    expression = noise.define_noise_function( function(x,y,tile,map)
      return noise.ident(noise.ridge(tile.distance / 4, -32, 32))
    end)
  },
  {
    type = "noise-expression",
    name = "0_17-lakes-elevation",
    -- Large lakes similar to those from Factorio 0.12
    expression = noise.define_noise_function( function(x,y,tile,map)
      x = x * map.segmentation_multiplier + 10000 -- Move the point where 'fractal similarity' is obvious off into the boonies
      y = y * map.segmentation_multiplier
      return finish_elevation(make_0_12like_lakes(x, y, tile, map), map)
    end),
  },
  {
    type = "noise-expression",
    name = "0_17-starting-plateau",
    intended_property = debug_property("elevation"),
    -- The starting area plateau surrounded by an endless ociean
    expression = noise.define_noise_function( function(x,y,tile,map)
      x = x * map.segmentation_multiplier + 10000 -- Move the point where 'fractal similarity' is obvious off into the boonies
      y = y * map.segmentation_multiplier
      options =
      {
        bias = -1000
      }
      return finish_elevation(make_0_12like_lakes(x, y, tile, map, options), map)
    end),
  },
  {
    type = "noise-expression",
    name = "0_17-island",
    intended_property = "elevation",
    -- A large island surrounded by an endless ociean
    expression = noise.define_noise_function( function(x,y,tile,map)
      map = util.merge
      {
        map,
        { segmentation_multiplier = map.segmentation_multiplier / 4 }
      }
      x = x * map.segmentation_multiplier + 10000 -- Move the point where 'fractal similarity' is obvious off into the boonies
      y = y * map.segmentation_multiplier
      options =
      {
        bias = -1000,
      }
      return finish_elevation(make_0_12like_lakes(x, y, tile, map, options), map)
    end),
  },
  {
    type = "noise-expression",
    name = "0_17-islands+continents",
    intended_property = debug_property("elevation"),
    --Similar to lakes, but with a negative bias instead of a positive one
    expression = noise.define_noise_function( function(x,y,tile,map)
      x = x * map.segmentation_multiplier + 10000 -- Move the point where 'fractal similarity' is obvious off into the boonies
      y = y * map.segmentation_multiplier
      options =
      {
        bias = -80,
        terrain_octaves = 10
      }
      return finish_elevation(make_0_12like_lakes(x, y, tile, map, options), map)
    end),
  },
  {
    type = "noise-expression",
    name = "endless-plateau-with-starting-area-elevation",
    intended_property = debug_property("elevation"),
    -- A big plateau, except for the starting area
    expression = noise.define_noise_function( function(x,y,tile,map)
      return finish_elevation(100, map)
    end),
  },
  {
    type = "noise-expression",
    name = "0_16-elevation",
    intended_property = debug_property("elevation"),
    -- Elevation function often described as 'swampy' from 0.16
    expression = noise.define_noise_function( function(x,y,tile,map)
      local plateau_octaves = 3
      local lf_octaves = 6
      -- Everyone except TOGoS (apparently) likes there to not be much water
      -- when water-level = 'normal', so shift the elevation up everywhere.
      -- Set water-level = 'high' if you like oceans.
      local global_bias = 6

      -- Sometimes we want to use actual coordinates,
      -- not the warped-to-compensate-for-fractal-similarity ones
      local map_x = x
      local map_y = y

      x = x * map.segmentation_multiplier + 10000 -- Move the point where 'fractal similarity' is obvious off into the boonies
      y = y * map.segmentation_multiplier
      local rdi = tile.tier / 8 -- ridge distance-based influcence
      local high_ridge =  16 + rdi + noise.clamp(rdi, 0, 2) * make_multioctave_noise_function(map.seed, 7, 2, 3)(x,y,1/256,1)
      local low_ridge  = -16 - rdi

      local plateau_noise = make_multioctave_noise_function(map.seed, 9, plateau_octaves, 1/3, 3, 4, 1/128)
      local plateaus = noise.max(make_basis_noise_function(map.seed, 10, 8, 1/1024)(x,y) - 8, 1 - tile.tier)

      local high_freq_noise = make_multioctave_modulated_noise_function{
        seed0 = map.seed,
        seed1 = 11,
        octave_count = 6,
        octave0_output_scale = 1/8,
        octave0_input_scale = 1/4,
        octave_output_scale_multiplier = 2,
        octave_input_scale_multiplier = 1/3
      }
      local low_freq_noise = make_multioctave_modulated_noise_function{
        seed0 = map.seed,
        seed1 = 8,
        octave_count = lf_octaves,
        octave0_output_scale = 1,
        octave0_input_scale = 1/8
      }
      local very_low_freq_noise = make_basis_noise_function(map.seed, 9, 20, 1/1024)
      local basis = low_freq_noise(x,y) + very_low_freq_noise(x,y)
      local ridged1 = noise.ridge(basis, low_ridge, high_ridge)

      local normal = noise.max(ridged1 + high_freq_noise(x,y), plateaus + plateau_noise(x,y)) + global_bias

      -- Multily elevation by low-frequency noise to make hilly and non-hilly areas
      local hill_modulation = noise.clamp(make_multioctave_noise_function(map.seed, 12, 4, 2, 1/3)(x,y,1/256,3/4) - 2, 0.1, 1.0)

      -- Elevation below which hill modulation has no effect.
      -- Set to slightly above the water level so that flat plains don't all become a giant beach/sandbar thing.
      -- To do its job it just has to be lower than the first row of cliffs.
      local hill_modulation_identity = 3 - map.wlc_elevation_offset

      local hill_modulated = noise.min(
        normal,
        hill_modulation * (normal - hill_modulation_identity) + hill_modulation_identity
      )

      return noise.ident(finish_elevation(hill_modulated, map))
    end),
  },
  {
    type = "noise-expression",
    name = "elevation",
    intended_property = "elevation",
    expression = noise.var("0_17-lakes-elevation")
  },
  {
    type = "noise-expression",
    name = "cliffiness",
    expression = noise.define_noise_function( function(x,y,tile,map)
      -- Idea is that elevation function determines general placement of 'mountainey' areas.
      -- 'cliffiness' only determines small-scale placement, to ensure that there are passages
      -- through any sufficiently long cliff face.
      return 0.5 + noise.clamp(
        make_multioctave_noise_function(map.seed, 123, 2, 1, 1/3)(x,y,1/32,1) +
        noise.log2(noise.var("control-setting:cliffs:richness:multiplier")) / 2,
        0, 1)
    end)
  },

  -- Variables used by autoplace:

  {
    type = "noise-expression",
    name = "distance",
    expression = noise.distance_from(noise.var("x"), noise.var("y"), noise.var("starting_positions"))
  },
  {
    type = "noise-expression",
    name = "tier_from_start",
    expression = noise.define_noise_function( function(x,y,tile,map)
      return noise.max(0.0, tile.distance - map.starting_area_radius) / map.starting_area_radius;
    end)
  },
  {
    type = "noise-expression",
    name = "tier",
    expression = noise.var("tier_from_start")
  },
  {
    type = "noise-expression",
    name = "starting_area_weight",
    expression = noise.define_noise_function( function(x,y,tile,map)
      return 1 - noise.min(1.0, tile.tier / 2.0)
    end)
  }
}

local function add_climate_control_defaults(control_name)
  data:extend
  {
    {
      type = "noise-expression",
      name = "control-setting:" .. control_name .. ":frequency:multiplier",
      expression = noise.to_noise_expression(1)
    },
    {
      type = "noise-expression",
      name = "control-setting:" .. control_name .. ":bias",
      expression = noise.to_noise_expression(0)
    },
  }
end

-- Generate a bunch of options for a property
-- Do like data:extend(fractional_options("some-noise-property"))
local function fractional_options(property)
  local opts = {}
  local den = 4
  local next_non_default_order = 3000
  for i, num in ipairs({1,2,3,4,6,8,12,16}) do
    if num == den then
      order = 2000 -- Default value should be 1
    else
      order = next_non_default_order
      next_non_default_order = next_non_default_order + 1
    end
    opts[#opts+1] =
    {
      type = "noise-expression",
      name = property .. "-" .. num .. "-" .. den,
      intended_property = property,
      order = order,
      expression = noise.fraction(num, den)
    }
  end
  return opts
end

data:extend
{
  {
    type = "noise-expression",
    name = "starting-lake-noise-amplitude",
    expression = noise.to_noise_expression(1)
  }
}

if enable_debug_expressions then
  data:extend(fractional_options("starting-lake-noise-amplitude"))
end

add_climate_control_defaults("temperature")
add_climate_control_defaults("moisture")
add_climate_control_defaults("aux")
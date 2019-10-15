local noise = require("noise")
local autoplace_utils = require("autoplace_utils")
local bvu = require("biome-visualization-utils")

local tile_noise_enabled = true
local tile_noise_persistence = 0.7

local tile_noise_influence = 2/3
local size_control_influence = 1
local rectangle_influence = 1
local beach_influence = 5

local out_of_map_pollution_absorption = 0.00001
local water_pollution_absorption = 0.000005
local grass_pollution_absorption = 0.0000075
local dirt_pollution_absorption = 0.0000066
local sand_pollution_absorption = 0.0000058
local red_desert_pollution_absorption = 0.0000066

local function noise_layer_expression(noise_name)
  if tile_noise_enabled == false then return noise.to_noise_expression(0) end
  return noise.function_application("factorio-multioctave-noise",
    {
      x = noise.var("x"),
      y = noise.var("y"),
      persistence = tile_noise_persistence,
      seed0 = noise.var("map_seed"),
      seed1 = noise.noise_layer_name_to_id(noise_name),
      input_scale = noise.fraction(1, 6),
      output_scale = tile_noise_influence,
      octaves = 4,
    }
  )
end

local function peak_to_noise_expression(variable, optimal, range)
  local distance_from_optimal = noise.ridge(variable - optimal, 0, math.huge)
  -- Idea is to have a plateau in the center of the rectangle,
  -- edges that taper off at a consistent slope for all rectangles (so that interactions between rectangles are predictable),
  return range - distance_from_optimal
end
local function rectangle_peak_to_noise_expression(variable, optimal, range)
  -- Clamp rectangle-based peaks so that large rectangles don't become
  -- super powerful at their centers, because we want to be able to override
  -- them e.g. with beach peaks or whatever
  return noise.min(peak_to_noise_expression(variable, optimal, range) * 20, 1) * rectangle_influence
end

local function extend_left_rectangle_edge(left)
  if left == 0 then return -10 end
  return left
end
local function extend_right_rectangle_edge(right)
  if right == 1 then return 11 end
  return right
end

local function extend_edge_rectangle(rectangle)
  return
  {
    { extend_left_rectangle_edge(rectangle[1][1]),  extend_left_rectangle_edge(rectangle[1][2])},
    {extend_right_rectangle_edge(rectangle[2][1]), extend_right_rectangle_edge(rectangle[2][2])},
  }
end

local function auxwater_rect_to_noise_expression(rectangle)
  rectangle = extend_edge_rectangle(rectangle)

  local aux_center = (rectangle[2][1] + rectangle[1][1]) / 2
  local aux_range = math.abs(rectangle[2][1] - rectangle[1][1]) / 2
  local water_center = (rectangle[2][2] + rectangle[1][2]) / 2
  local water_range = math.abs(rectangle[2][2] - rectangle[1][2]) / 2

  local water_fitness = rectangle_peak_to_noise_expression(noise.var("moisture"), water_center, water_range)
  local aux_fitness   = rectangle_peak_to_noise_expression(noise.var("aux"), aux_center, aux_range)

  return noise.min(water_fitness, aux_fitness)
end

-- 'rectangles' indicate
-- {{minimum aux, minimum water}, {maximum aux, maximum water}}
local function autoplace_settings(noise_name, control_name, ...)
  local rectangles = {...}
  local probability_expression = noise.to_noise_expression(-math.huge)
  for i,rectangle in ipairs(rectangles) do
    if type(rectangle) == "table" then
      bvu.log_rectangle(noise_name, {
        aux      = {min = rectangle[1][1], max = rectangle[2][1]},
        moisture = {min = rectangle[1][2], max = rectangle[2][2]},
      })
      probability_expression = noise.max(probability_expression, auxwater_rect_to_noise_expression(rectangle))
    elseif type(rectangle) == "function" then
      probability_expression = rectangle(probability_expression)
    else
      error("Non-table, non-function passed as rectangle to autoplace_settings")
    end
  end

  -- local size_multiplier = noise.get_control_setting(control_name).size_multiplier
  -- local size_log = noise.log2(size_multiplier)
  -- local size_control_term = size_log * size_control_influence
  local size_control_term = 0
  probability_expression = probability_expression + noise_layer_expression(noise_name) + size_control_term

  return {
    probability_expression = probability_expression
  }
end

function tile_variations_template(normal_res_picture, normal_res_transition, high_res_picture, high_res_transition, options)
  local function main_variation(size_)
    local y_ = ((size_ == 1) and 0) or ((size_ == 2) and 64) or ((size_ == 4) and 160) or 320
    local ret =
    {
      picture = normal_res_picture,
      count = 16,
      size = size_,
      y = y_,
      line_length = (size_ == 8) and 8 or 16,
      hr_version =
      {
        picture = high_res_picture,
        count = 16,
        size = size_,
        y = 2 * y_,
        line_length = (size_ == 8) and 8 or 16,
        scale = 0.5
      }
    }

    if options[size_] then
      for k, v in pairs(options[size_]) do
        ret[k] = v
        ret.hr_version[k] = v
      end
    end

    return ret
  end

  local function make_transition_variation(x_, line_len_, cnt_)
    return
    {
      picture = normal_res_transition,
      count = cnt_ or 8,
      line_length = line_len_ or 8,
      x = x_,
      hr_version=
      {
        picture = high_res_transition,
        count = cnt_ or 8,
        line_length = line_len_ or 8,
        x = 2 * x_,
        scale = 0.5
      }
    }
  end

  local main_ =
  {
    main_variation(1),
    main_variation(2),
    main_variation(4)
  }
  if (options.max_size == 8) then
    table.insert(main_, main_variation(8))
  end

  if options.empty_transitions then
    return
    {
      main = main_,
      empty_transitions = true
    }
  end

  return
  {
    main = main_,
    inner_corner_mask = make_transition_variation(0),
    outer_corner_mask = make_transition_variation(288),
    side_mask         = make_transition_variation(576),
    u_transition_mask = make_transition_variation(864, 1, 1),
    o_transition_mask = make_transition_variation(1152, 2, 1)
  }
end


local function make_tile_transition_from_template_variation(src_x, src_y, cnt_, line_len_, is_tall, normal_res_transition, high_res_transition)
  return
  {
    picture = normal_res_transition,
    count = cnt_,
    line_length = line_len_,
    x = src_x,
    y = src_y,
    tall = is_tall,
    hr_version =
    {
      picture = high_res_transition,
      count = cnt_,
      line_length = line_len_,
      x = 2 * src_x,
      y = 2 * (src_y or 0),
      tall = is_tall,
      scale = 0.5
    }
  }
end

function water_transition_template(to_tiles, normal_res_transition, high_res_transition, options)
  return make_generic_transition_template(to_tiles, water_transition_group_id, nil, normal_res_transition, high_res_transition, options, true, true, true)
end

function make_water_transition_template(to_tiles, normal_res_transition, high_res_transition, options, base_layer, background, mask)
  return make_generic_transition_template(to_tiles, water_transition_group_id, nil, normal_res_transition, high_res_transition, options, base_layer, background, mask)
end

function out_of_map_transition_template(to_tiles, normal_res_transition, high_res_transition, options)
  return make_generic_transition_template(to_tiles, out_of_map_transition_group_id, nil, normal_res_transition, high_res_transition, options, true, true, true)
end

function make_out_of_map_transition_template(to_tiles, normal_res_transition, high_res_transition, options, base_layer, background, mask)
  return make_generic_transition_template(to_tiles, out_of_map_transition_group_id, nil, normal_res_transition, high_res_transition, options, base_layer, background, mask)
end

function generic_transition_between_transitions_template(group1, group2, normal_res_transition, high_res_transition, options)
  return make_generic_transition_template(nil, group1, group2, normal_res_transition, high_res_transition, options, true, true, true)
end

function make_generic_transition_template(to_tiles, group1, group2, normal_res_transition, high_res_transition, options, base_layer, background, mask)
  local t = options.base or {}
  t.to_tiles = to_tiles
  t.transition_group = group1
  t.transition_group1 = group2 and group1 or nil
  t.transition_group2 = group2
  local default_count = options.count or 16
  for k,y in pairs({inner_corner = 0, outer_corner = 288, side = 576, u_transition = 864, o_transition = 1152}) do
    local count = options[k .. "_count"] or default_count
    if count > 0 and type(y) == "number" then
      local line_length = options[k .. "_line_length"] or count
      local is_tall = true
      if (options[k .. "_tall"] == false) then
        is_tall = false
      end
      if base_layer == true then
        t[k] = make_tile_transition_from_template_variation(0, y, count, line_length, is_tall, normal_res_transition, high_res_transition)
      end
      if background == true then
        t[k .. "_background"] = make_tile_transition_from_template_variation(544, y, count, line_length, is_tall, normal_res_transition, high_res_transition)
      end
      if mask == true then
        t[k .. "_mask"] = make_tile_transition_from_template_variation(1088, y, count, line_length, nil, normal_res_transition, high_res_transition)
      end
    end
  end
  return t
end

default_transition_group_id = 0
water_transition_group_id = 1
out_of_map_transition_group_id = 2

local grass_vehicle_speed_modifier = 1.6
local dirt_vehicle_speed_modifier = 1.4
local sand_vehicle_speed_modifier = 1.8
local stone_path_vehicle_speed_modifier = 1.1
local concrete_vehicle_speed_modifier = 0.8

-- An 'infinity-like' number used to give water an elevation range that
-- is effectively unbounded on the low end
local water_inflike = 4096

function make_water_autoplace_settings(max_elevation, influence)
  local elevation = noise.var("elevation")
  local fitness = max_elevation - elevation
  -- Adjust fitness to allow higher-influence (usually deeper) water to override shallower water,
  -- even at elevations where they both have >0 fitness
  local adjusted_fitness = influence * noise.min(fitness, 1)
  return {
    -- If fitness is < 0, probability will be -infinity,
    -- so that water doesn't override the default walkable tile (in case no other tile is placed).
    -- Otherwise probability is adjusted_fitness:
    probability_expression = noise.min(fitness * math.huge, adjusted_fitness)
  }
end

water_tile_type_names = { "water", "deepwater", "water-green", "deepwater-green", "water-shallow", "water-mud" }
patch_for_inner_corner_of_transition_between_transition =
{
  filename = "__base__/graphics/terrain/water-transitions/water-patch.png",
  width = 32,
  height = 32,
  hr_version =
  {
    filename = "__base__/graphics/terrain/water-transitions/hr-water-patch.png",
    scale = 0.5,
    width = 64,
    height = 64
  }
}

--local water_transitions_between_transitions =
--{
--  generic_transition_between_transitions_template
--  (
--      default_transition_group_id,
--      out_of_map_transition_group_id,
--      "__base__/graphics/terrain/water-transitions/grass-transition.png",
--      "__base__/graphics/terrain/water-transitions/hr-grass-transition.png",
--      {
--        inner_corner_tall = true,
--        inner_corner_count = 3,
--        outer_corner_count = 3,
--        side_count = 3,
--        u_transition_count = 1,
--        o_transition_count = 0,
--        base = { background_layer_offset = 7, }
--      }
--  ),
--}

function init_transition_between_transition_common_options(base)
  local t = base or {}

  t.background_layer_offset = t.background_layer_offset or 1
  t.background_layer_group = t.background_layer_group or "zero"
  if (t.offset_background_layer_by_tile_layer == nil) then
    t.offset_background_layer_by_tile_layer = true
  end

  return t
end

function create_water_transitions_between_transitions(normal_res_transition, high_res_transition)
  return make_generic_transition_template
  (
      nil,
      default_transition_group_id,
      out_of_map_transition_group_id,
      normal_res_transition,
      high_res_transition,
      {
        inner_corner_tall = true,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = init_transition_between_transition_common_options()
      },
      false,
      true,
      true
  )
end

local water_transitions_between_transitions =
{
  make_generic_transition_template
  (
      nil,
      default_transition_group_id,
      out_of_map_transition_group_id,
      "__base__/graphics/terrain/water-transitions/grass-transition.png",
      "__base__/graphics/terrain/water-transitions/hr-grass-transition.png",
      {
        inner_corner_tall = true,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = init_transition_between_transition_common_options()
      },
      false,
      true,
      true
  )
}

local deepwater_transitions_between_transitions =
{
  create_water_transitions_between_transitions(
    "__base__/graphics/terrain/out-of-map-transition/deepwater-out-of-map-transition-to-water.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-deepwater-out-of-map-transition-to-water.png"
  )
}

local water_shallow_transitions_between_transitions =
{
  create_water_transitions_between_transitions(
      "__base__/graphics/terrain/out-of-map-transition/water-shallow-out-of-map-transition-to-water.png",
      "__base__/graphics/terrain/out-of-map-transition/hr-water-shallow-out-of-map-transition-to-water.png"
  )
}

local water_mud_transitions_between_transitions =
{
  create_water_transitions_between_transitions(
      "__base__/graphics/terrain/out-of-map-transition/water-shallow-out-of-map-transition-to-water.png",
      "__base__/graphics/terrain/out-of-map-transition/hr-water-shallow-out-of-map-transition-to-water.png"
  )
}

local deepwater_green_transitions_between_transitions =
{
  create_water_transitions_between_transitions(
    "__base__/graphics/terrain/out-of-map-transition/deepwater-green-out-of-map-transition-to-water.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-deepwater-green-out-of-map-transition-to-water.png"
  )
}

local water_green_transitions_between_transitions =
{
  create_water_transitions_between_transitions(
    "__base__/graphics/terrain/out-of-map-transition/water-green-out-of-map-transition-to-water.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-water-green-out-of-map-transition-to-water.png"
  )
}

local water_out_of_map_transition =
  make_out_of_map_transition_template
  (
    { "out-of-map" },
    "__base__/graphics/terrain/out-of-map-transition/water-out-of-map-transition.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-water-out-of-map-transition.png",
    {
      o_transition_tall = false,
      side_count = 8,
      inner_corner_count = 4,
      outer_corner_count = 4,
      u_transition_count = 1,
      o_transition_count = 1,
      base = init_transition_between_transition_common_options()
    },
    false,
    true,
    true
  )

local deepwater_out_of_map_transition =
  make_out_of_map_transition_template
  (
    { "out-of-map" },
    "__base__/graphics/terrain/out-of-map-transition/deepwater-out-of-map-transition.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-deepwater-out-of-map-transition.png",
    {
      o_transition_tall = false,
      side_count = 8,
      inner_corner_count = 4,
      outer_corner_count = 4,
      u_transition_count = 1,
      o_transition_count = 1,
      base = init_transition_between_transition_common_options()
    },
    false,
    true,
    true
  )

local deepwater_green_out_of_map_transition =
  make_out_of_map_transition_template
  (
    { "out-of-map" },
    "__base__/graphics/terrain/out-of-map-transition/deepwater-green-out-of-map-transition.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-deepwater-green-out-of-map-transition.png",
    {
      o_transition_tall = false,
      side_count = 8,
      inner_corner_count = 4,
      outer_corner_count = 4,
      u_transition_count = 1,
      o_transition_count = 1,
      base = init_transition_between_transition_common_options()
    },
    false,
    true,
    true
  )

local water_green_out_of_map_transition =
  make_out_of_map_transition_template
  (
    { "out-of-map" },
    "__base__/graphics/terrain/out-of-map-transition/water-green-out-of-map-transition.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-water-green-out-of-map-transition.png",
    {
      o_transition_tall = false,
      side_count = 8,
      inner_corner_count = 4,
      outer_corner_count = 4,
      u_transition_count = 1,
      o_transition_count = 1,
      base = init_transition_between_transition_common_options()
    },
    false,
    true,
    true
  )

local water_shallow_out_of_map_transition =
  make_out_of_map_transition_template
  (
    { "out-of-map" },
    "__base__/graphics/terrain/out-of-map-transition/water-shallow-out-of-map-transition.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-water-shallow-out-of-map-transition.png",
    {
      o_transition_tall = false,
      side_count = 8,
      inner_corner_count = 4,
      outer_corner_count = 4,
      u_transition_count = 1,
      o_transition_count = 1,
      base = init_transition_between_transition_common_options()
    },
    false,
    true,
    true
  )

local out_of_map_transition =
  make_out_of_map_transition_template
  (
    { "out-of-map" },
    "__base__/graphics/terrain/out-of-map-transition/out-of-map-transition.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-out-of-map-transition.png",
    {
      o_transition_tall = false,
      side_count = 8,
      inner_corner_count = 4,
      outer_corner_count = 4,
      u_transition_count = 1,
      o_transition_count = 1,
      base = init_transition_between_transition_common_options()
    },
    false,
    true,
    true
  )

local concrete_out_of_map_transition =
  out_of_map_transition_template
  (
    { "out-of-map" },
    "__base__/graphics/terrain/out-of-map-transition/concrete-out-of-map-transition.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-concrete-out-of-map-transition.png",
    {
      o_transition_tall = false,
      side_count = 8,
      inner_corner_count = 4,
      outer_corner_count = 4,
      u_transition_count = 1,
      o_transition_count = 1,
      base = init_transition_between_transition_common_options()
    }
  )

local stone_path_out_of_map_transition =
  make_out_of_map_transition_template
  (
    { "out-of-map" },
    "__base__/graphics/terrain/out-of-map-transition/stone-path-out-of-map-transition.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-stone-path-out-of-map-transition.png",
    {
      o_transition_tall = false,
      side_count = 8,
      inner_corner_count = 4,
      outer_corner_count = 4,
      u_transition_count = 1,
      o_transition_count = 1,
      base = init_transition_between_transition_common_options()
    },
    true,
    true,
    false
  )

local sand_transitions =
{
  water_transition_template
  (
    water_tile_type_names,
    "__base__/graphics/terrain/water-transitions/sand.png",
    "__base__/graphics/terrain/water-transitions/hr-sand.png",
    {
      o_transition_tall = false,
      u_transition_tall = false,
      side_tall = false,
      inner_corner_tall = false,
      outer_corner_tall = false,
      u_transition_count = 4,
      o_transition_count = 8,
      --base = init_transition_between_transition_common_options()
    }
  ),
  out_of_map_transition
}

local sand_transitions_between_transitions =
{
  generic_transition_between_transitions_template
  (
    default_transition_group_id,
    water_transition_group_id,
    "__base__/graphics/terrain/water-transitions/sand-transition.png",
    "__base__/graphics/terrain/water-transitions/hr-sand-transition.png",
    {
      side_tall = false,
      inner_corner_tall = false,
      outer_corner_tall = false,
      inner_corner_count = 3,
      outer_corner_count = 3,
      side_count = 3,
      u_transition_count = 1,
      o_transition_count = 0,
      base = { water_patch = patch_for_inner_corner_of_transition_between_transition, }
    }
  ),
  make_generic_transition_template
  (
    nil,
    default_transition_group_id,
    out_of_map_transition_group_id,
    "__base__/graphics/terrain/out-of-map-transition/sand-out-of-map-transition.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-sand-out-of-map-transition.png",
    {
      inner_corner_tall = true,
      inner_corner_count = 3,
      outer_corner_count = 3,
      side_count = 3,
      u_transition_count = 1,
      o_transition_count = 0,
      base = init_transition_between_transition_common_options()
    },
    false,
    true,
    true
  ),
  generic_transition_between_transitions_template
  (
      water_transition_group_id,
      out_of_map_transition_group_id,
      "__base__/graphics/terrain/out-of-map-transition/sand-shore-out-of-map-transition.png",
      "__base__/graphics/terrain/out-of-map-transition/hr-sand-shore-out-of-map-transition.png",
      {
        o_transition_tall = false,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = init_transition_between_transition_common_options({ water_patch = patch_for_inner_corner_of_transition_between_transition, })
      }
  ),
}

local grass_transitions =
{
  water_transition_template
  (
    water_tile_type_names,
    "__base__/graphics/terrain/water-transitions/grass.png",
    "__base__/graphics/terrain/water-transitions/hr-grass.png",
    {
      o_transition_tall = false,
      u_transition_count = 4,
      o_transition_count = 8,
      base =
      {
        side_weights = { 1, 1, 1, 1,  0.25, 0.25, 1, 1,  1, 1, 0.125, 0.25,  1, 1, 1, 1 }
      }
    }
  ),
  out_of_map_transition
}

local grass_transitions_between_transitions =
{
  generic_transition_between_transitions_template
  (
      default_transition_group_id,
      water_transition_group_id,
      "__base__/graphics/terrain/water-transitions/grass-transition.png",
      "__base__/graphics/terrain/water-transitions/hr-grass-transition.png",
      {
        inner_corner_tall = true,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = { water_patch = patch_for_inner_corner_of_transition_between_transition, }
      }
  ),
  make_generic_transition_template
  (
    nil,
    default_transition_group_id,
    out_of_map_transition_group_id,
    "__base__/graphics/terrain/out-of-map-transition/grass-out-of-map-transition.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-grass-out-of-map-transition.png",
    {
      inner_corner_tall = true,
      inner_corner_count = 3,
      outer_corner_count = 3,
      side_count = 3,
      u_transition_count = 1,
      o_transition_count = 0,
      base = init_transition_between_transition_common_options()
    },
    false,
    true,
    true
  ),

  generic_transition_between_transitions_template
  (
      water_transition_group_id,
      out_of_map_transition_group_id,
      "__base__/graphics/terrain/out-of-map-transition/grass-shore-out-of-map-transition.png",
      "__base__/graphics/terrain/out-of-map-transition/hr-grass-shore-out-of-map-transition.png",
      {
        o_transition_tall = false,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = init_transition_between_transition_common_options({ water_patch = patch_for_inner_corner_of_transition_between_transition, })
      }
  ),
}

local dirt_out_of_map_transition =
  make_generic_transition_template
  (
    nil,
    default_transition_group_id,
    out_of_map_transition_group_id,
    "__base__/graphics/terrain/out-of-map-transition/dirt-out-of-map-transition.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-dirt-out-of-map-transition.png",
    {
      inner_corner_tall = true,
      inner_corner_count = 3,
      outer_corner_count = 3,
      side_count = 3,
      u_transition_count = 1,
      o_transition_count = 0,
      base = init_transition_between_transition_common_options()
    },
    false,
    true,
    true
  )

local dry_dirt_transitions =
{
  water_transition_template
  (
    water_tile_type_names,
    "__base__/graphics/terrain/water-transitions/dry-dirt.png",
    "__base__/graphics/terrain/water-transitions/hr-dry-dirt.png",
    {
      o_transition_tall = false,
      u_transition_count = 2,
      o_transition_count = 4,
      side_count = 8,
      outer_corner_count = 8,
      inner_corner_count = 8
    }
  ),
  out_of_map_transition
}

local dry_dirt_transitions_between_transitions =
{
  generic_transition_between_transitions_template
  (
      default_transition_group_id,
      water_transition_group_id,
      "__base__/graphics/terrain/water-transitions/dry-dirt-transition.png",
      "__base__/graphics/terrain/water-transitions/hr-dry-dirt-transition.png",
      {
        o_transition_tall = false,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = { water_patch = patch_for_inner_corner_of_transition_between_transition, }
      }
  ),
  dirt_out_of_map_transition,
  generic_transition_between_transitions_template
  (
      water_transition_group_id,
      out_of_map_transition_group_id,
      "__base__/graphics/terrain/out-of-map-transition/dry-dirt-shore-out-of-map-transition.png",
      "__base__/graphics/terrain/out-of-map-transition/hr-dry-dirt-shore-out-of-map-transition.png",
      {
        o_transition_tall = false,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = init_transition_between_transition_common_options({ water_patch = patch_for_inner_corner_of_transition_between_transition, })
      }
  ),
}

local dark_dirt_transitions =
{
  water_transition_template
  (
      water_tile_type_names,
      "__base__/graphics/terrain/water-transitions/dark-dirt.png",
      "__base__/graphics/terrain/water-transitions/hr-dark-dirt.png",
      {
        o_transition_tall = false,
        u_transition_count = 2,
        o_transition_count = 4,
        side_count = 8,
        outer_corner_count = 8,
        inner_corner_count = 8
      }
  ),
  out_of_map_transition
}

local dark_dirt_transitions_between_transitions =
{
  generic_transition_between_transitions_template
  (
      default_transition_group_id,
      water_transition_group_id,
      "__base__/graphics/terrain/water-transitions/dark-dirt-transition.png",
      "__base__/graphics/terrain/water-transitions/hr-dark-dirt-transition.png",
      {
        o_transition_tall = false,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = { water_patch = patch_for_inner_corner_of_transition_between_transition, }
      }
  ),
  dirt_out_of_map_transition,
  generic_transition_between_transitions_template
  (
      water_transition_group_id,
      out_of_map_transition_group_id,
      "__base__/graphics/terrain/out-of-map-transition/dark-dirt-shore-out-of-map-transition.png",
      "__base__/graphics/terrain/out-of-map-transition/hr-dark-dirt-shore-out-of-map-transition.png",
      {
        o_transition_tall = false,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = init_transition_between_transition_common_options({ water_patch = patch_for_inner_corner_of_transition_between_transition, })
      }
  ),
}

local landfill_transitions =
{
  water_transition_template
  (
      water_tile_type_names,
      "__base__/graphics/terrain/water-transitions/landfill.png",
      "__base__/graphics/terrain/water-transitions/hr-landfill.png",
      {
        o_transition_tall = false,
        u_transition_count = 2,
        o_transition_count = 4,
        side_count = 8,
        outer_corner_count = 8,
        inner_corner_count = 8
      }
  ),
  out_of_map_transition
}

local landfill_transitions_between_transitions =
{
  generic_transition_between_transitions_template
  (
      default_transition_group_id,
      water_transition_group_id,
      "__base__/graphics/terrain/water-transitions/landfill-transition.png",
      "__base__/graphics/terrain/water-transitions/hr-landfill-transition.png",
      {
        o_transition_tall = false,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = { water_patch = patch_for_inner_corner_of_transition_between_transition, }
      }
  ),
  dirt_out_of_map_transition,
  generic_transition_between_transitions_template
  (
      water_transition_group_id,
      out_of_map_transition_group_id,
      "__base__/graphics/terrain/out-of-map-transition/landfill-shore-out-of-map-transition.png",
      "__base__/graphics/terrain/out-of-map-transition/hr-landfill-shore-out-of-map-transition.png",
      {
        o_transition_tall = false,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = init_transition_between_transition_common_options({ water_patch = patch_for_inner_corner_of_transition_between_transition, })
      }
  ),
}

local concrete_transitions =
{
  water_transition_template
  (
      water_tile_type_names,
      "__base__/graphics/terrain/water-transitions/concrete.png",
      "__base__/graphics/terrain/water-transitions/hr-concrete.png",
      {
        o_transition_tall = false,
        u_transition_count = 4,
        o_transition_count = 4,
        side_count = 8,
        outer_corner_count = 8,
        inner_corner_count = 8,
        --base = { layer = 40 }
      }
  ),
  concrete_out_of_map_transition
}

local concrete_transitions_between_transitions =
{
  generic_transition_between_transitions_template
  (
      default_transition_group_id,
      water_transition_group_id,
      "__base__/graphics/terrain/water-transitions/concrete-transitions.png",
      "__base__/graphics/terrain/water-transitions/hr-concrete-transitions.png",
      {
        inner_corner_tall = true,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0
      }
  ),
  make_generic_transition_template
  (
    nil,
    default_transition_group_id,
    out_of_map_transition_group_id,
    "__base__/graphics/terrain/out-of-map-transition/concrete-out-of-map-transition-b.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-concrete-out-of-map-transition-b.png",
    {
      inner_corner_tall = true,
      inner_corner_count = 3,
      outer_corner_count = 3,
      side_count = 3,
      u_transition_count = 1,
      o_transition_count = 0,
      base = init_transition_between_transition_common_options()
    },
    true,
    true,
    true
  ),
  generic_transition_between_transitions_template
  (
      water_transition_group_id,
      out_of_map_transition_group_id,
      "__base__/graphics/terrain/out-of-map-transition/concrete-shore-out-of-map-transition.png",
      "__base__/graphics/terrain/out-of-map-transition/hr-concrete-shore-out-of-map-transition.png",
      {
        o_transition_tall = false,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = init_transition_between_transition_common_options({ water_patch = patch_for_inner_corner_of_transition_between_transition, })
      }
  ),
}

local stone_path_transitions =
{
  water_transition_template
  (
      water_tile_type_names,
      "__base__/graphics/terrain/water-transitions/stone-path.png",
      "__base__/graphics/terrain/water-transitions/hr-stone-path.png",
      {
        o_transition_tall = false,
        u_transition_count = 4,
        o_transition_count = 4,
        side_count = 8,
        outer_corner_count = 8,
        inner_corner_count = 8,
        --base = { layer = 40 }
      }
  ),
  stone_path_out_of_map_transition
}

local stone_path_transitions_between_transitions =
{
  generic_transition_between_transitions_template
  (
      default_transition_group_id,
      water_transition_group_id,
      "__base__/graphics/terrain/water-transitions/stone-path-transitions.png",
      "__base__/graphics/terrain/water-transitions/hr-stone-path-transitions.png",
      {
        inner_corner_tall = true,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0
      }
  ),
  make_generic_transition_template
  (
    nil,
    default_transition_group_id,
    out_of_map_transition_group_id,
    "__base__/graphics/terrain/out-of-map-transition/stone-path-out-of-map-transition-b.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-stone-path-out-of-map-transition-b.png",
    {
      inner_corner_tall = true,
      inner_corner_count = 3,
      outer_corner_count = 3,
      side_count = 3,
      u_transition_count = 1,
      o_transition_count = 0,
      base = init_transition_between_transition_common_options()
    },
    true,
    true,
    false
  ),

  generic_transition_between_transitions_template
  (
      water_transition_group_id,
      out_of_map_transition_group_id,
      "__base__/graphics/terrain/out-of-map-transition/stone-path-shore-out-of-map-transition.png",
      "__base__/graphics/terrain/out-of-map-transition/hr-stone-path-shore-out-of-map-transition.png",
      {
        o_transition_tall = false,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = init_transition_between_transition_common_options({ water_patch = patch_for_inner_corner_of_transition_between_transition, })
      },
      true,
      true,
      false
  ),
}

local function define_tiles(tile_prototypes)
  data:extend(tile_prototypes)
  if bvu.rectangle_logging_enabled then
    for k,v in ipairs(tile_prototypes) do
      if v.map_color then
        log("Biome color: "..v.name.." r:"..v.map_color.r.." g:"..v.map_color.g.." b:"..v.map_color.b)
      end
    end
  end
end

define_tiles
{
  {
    name = "out-of-map",
    type = "tile",
    collision_mask =
    {
      "ground-tile",
      "water-tile",
      "resource-layer",
      "floor-layer",
      "item-layer",
      "object-layer",
      "player-layer",
      "doodad-layer"
    },
    layer_group = "zero",
    layer = 0,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/out-of-map.png",
          count = 1,
          size = 1
        }
      },
      empty_transitions = true
    },
    map_color = {r=0, g=0, b=0},
    pollution_absorption_per_second = out_of_map_pollution_absorption
  },
  {
    name = "deepwater",
    type = "tile",
    collision_mask =
    {
      "water-tile",
      "resource-layer",
      "item-layer",
      "player-layer",
      "doodad-layer"
    },
    autoplace = make_water_autoplace_settings(-2, 200),
    draw_in_water_layer = true,
    layer = 3,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater1.png",
          count = 8,
          size = 1,
          hr_version =
          {
            picture = "__base__/graphics/terrain/deepwater/hr-deepwater1.png",
            count = 8,
            scale = 0.5,
            size = 1
          }
        },
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater2.png",
          count = 8,
          size = 2,
          hr_version =
          {
            picture = "__base__/graphics/terrain/deepwater/hr-deepwater2.png",
            count = 8,
            scale = 0.5,
            size = 2
          }
        },
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater4.png",
          count = 8,
          size = 4,
          hr_version =
          {
            picture = "__base__/graphics/terrain/deepwater/hr-deepwater4.png",
            count = 8,
            scale = 0.5,
            size = 4
          }
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/deepwater/deepwater-inner-corner.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/deepwater/hr-deepwater-inner-corner.png",
          count = 6,
          scale = 0.5
        }
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/deepwater/deepwater-outer-corner.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/deepwater/hr-deepwater-outer-corner.png",
          count = 6,
          scale = 0.5
        }
      },
      side =
      {
        picture = "__base__/graphics/terrain/deepwater/deepwater-side.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/deepwater/hr-deepwater-side.png",
          count = 6,
          scale = 0.5
        }
      },
      u_transition =
      {
        picture = "__base__/graphics/terrain/deepwater/deepwater-u.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/deepwater/hr-deepwater-u.png",
          count = 1,
          scale = 0.5
        }
      },
      o_transition =
      {
        picture = "__base__/graphics/terrain/deepwater/deepwater-o.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/deepwater/hr-deepwater-o.png",
          count = 1,
          scale = 0.5
        }
      }
    },
    transitions = { deepwater_out_of_map_transition },
    transitions_between_transitions = deepwater_transitions_between_transitions,
    allowed_neighbors = { "water" },
    map_color={r=38, g=64, b=73},
    pollution_absorption_per_second = water_pollution_absorption
  },
  {
    name = "deepwater-green",
    type = "tile",
    collision_mask =
    {
      "water-tile",
      "resource-layer",
      "item-layer",
      "player-layer",
      "doodad-layer"
    },
    draw_in_water_layer = true,
    layer = 4,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/deepwater-green/deepwater-green1.png",
          count = 8,
          size = 1,
          hr_version =
          {
            picture = "__base__/graphics/terrain/deepwater-green/hr-deepwater-green1.png",
            count = 8,
            scale = 0.5,
            size = 1
          }
        },
        {
          picture = "__base__/graphics/terrain/deepwater-green/deepwater-green2.png",
          count = 8,
          size = 2,
          hr_version =
          {
            picture = "__base__/graphics/terrain/deepwater-green/hr-deepwater-green2.png",
            count = 8,
            scale = 0.5,
            size = 2
          }
        },
        {
          picture = "__base__/graphics/terrain/deepwater-green/deepwater-green4.png",
          count = 8,
          size = 4,
          hr_version =
          {
            picture = "__base__/graphics/terrain/deepwater-green/hr-deepwater-green4.png",
            count = 8,
            scale = 0.5,
            size = 4
          }
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/deepwater-green/deepwater-green-inner-corner.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/deepwater-green/hr-deepwater-green-inner-corner.png",
          count = 6,
          scale = 0.5
        }
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/deepwater-green/deepwater-green-outer-corner.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/deepwater-green/hr-deepwater-green-outer-corner.png",
          count = 6,
          scale = 0.5
        }
      },
      side =
      {
        picture = "__base__/graphics/terrain/deepwater-green/deepwater-green-side.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/deepwater-green/hr-deepwater-green-side.png",
          count = 6,
          scale = 0.5
        }
      },
      u_transition =
      {
        picture = "__base__/graphics/terrain/deepwater-green/deepwater-green-u.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/deepwater-green/hr-deepwater-green-u.png",
          count = 1,
          scale = 0.5
        }
      },
      o_transition =
      {
        picture = "__base__/graphics/terrain/deepwater-green/deepwater-green-o.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/deepwater-green/hr-deepwater-green-o.png",
          count = 1,
          scale = 0.5
        }
      }
    },
    transitions = { deepwater_green_out_of_map_transition },
    transitions_between_transitions = deepwater_green_transitions_between_transitions,
    allowed_neighbors = { "water-green" },
    map_color={r=0.0941, g=0.149, b=0.066},
    pollution_absorption_per_second = water_pollution_absorption
  },

  {
    name = "water",
    type = "tile",
    collision_mask =
    {
      "water-tile",
      "item-layer",
      "resource-layer",
      "player-layer",
      "doodad-layer"
    },
    autoplace = make_water_autoplace_settings(0, 100),
    draw_in_water_layer = true,
    layer = 1,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/water/water1.png",
          count = 8,
          size = 1,
          hr_version =
          {
            picture = "__base__/graphics/terrain/water/hr-water1.png",
            count = 8,
            scale = 0.5,
            size = 1
          }
        },
        {
          picture = "__base__/graphics/terrain/water/water2.png",
          count = 8,
          size = 2,
          hr_version =
          {
            picture = "__base__/graphics/terrain/water/hr-water2.png",
            count = 8,
            scale = 0.5,
            size = 2
          }
        },
        {
          picture = "__base__/graphics/terrain/water/water4.png",
          count = 8,
          size = 4,
          hr_version =
          {
            picture = "__base__/graphics/terrain/water/hr-water4.png",
            count = 8,
            scale = 0.5,
            size = 4
          }
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/water/water-inner-corner.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water/hr-water-inner-corner.png",
          count = 6,
          scale = 0.5
        }
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/water/water-outer-corner.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water/hr-water-outer-corner.png",
          count = 6,
          scale = 0.5
        }
      },
      side =
      {
        picture = "__base__/graphics/terrain/water/water-side.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water/hr-water-side.png",
          count = 6,
          scale = 0.5
        }
      },
      u_transition =
      {
        picture = "__base__/graphics/terrain/water/water-u.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water/hr-water-u.png",
          count = 1,
          scale = 0.5
        }
      },
      o_transition =
      {
        picture = "__base__/graphics/terrain/water/water-o.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water/hr-water-o.png",
          count = 1,
          scale = 0.5
        }
      },
    },
    transitions = { water_out_of_map_transition },
    --transitions_between_transitions = water_transitions_between_transitions,
    --allowed_neighbors = { "deepwater" },
    map_color={r=51, g=83, b=95},
    pollution_absorption_per_second = water_pollution_absorption
  },

  {
    name = "water-green",
    type = "tile",
    collision_mask =
    {
      "water-tile",
      "item-layer",
      "resource-layer",
      "player-layer",
      "doodad-layer"
    },
    draw_in_water_layer = true,
    layer = 2,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/water-green/water-green1.png",
          count = 8,
          size = 1,
          hr_version =
          {
            picture = "__base__/graphics/terrain/water-green/hr-water-green1.png",
            count = 8,
            scale = 0.5,
            size = 1
          }
        },
        {
          picture = "__base__/graphics/terrain/water-green/water-green2.png",
          count = 8,
          size = 2,
          hr_version =
          {
            picture = "__base__/graphics/terrain/water-green/hr-water-green2.png",
            count = 8,
            scale = 0.5,
            size = 2
          }
        },
        {
          picture = "__base__/graphics/terrain/water-green/water-green4.png",
          count = 8,
          size = 4,
          hr_version =
          {
            picture = "__base__/graphics/terrain/water-green/hr-water-green4.png",
            count = 8,
            scale = 0.5,
            size = 4
          }
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/water-green/water-green-inner-corner.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water-green/hr-water-green-inner-corner.png",
          count = 6,
          scale = 0.5
        }
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/water-green/water-green-outer-corner.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water-green/hr-water-green-outer-corner.png",
          count = 6,
          scale = 0.5
        }
      },
      side =
      {
        picture = "__base__/graphics/terrain/water-green/water-green-side.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water-green/hr-water-green-side.png",
          count = 6,
          scale = 0.5
        }
      },
      u_transition =
      {
        picture = "__base__/graphics/terrain/water-green/water-green-u.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water-green/hr-water-green-u.png",
          count = 1,
          scale = 0.5
        }
      },
      o_transition =
      {
        picture = "__base__/graphics/terrain/water-green/water-green-o.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water-green/hr-water-green-o.png",
          count = 1,
          scale = 0.5
        }
      }
    },
    transitions = { water_green_out_of_map_transition },
    transitions_between_transitions = water_green_transitions_between_transitions,
    allowed_neighbors = { "water" },
    map_color={r=31, g=48, b=18},
    pollution_absorption_per_second = water_pollution_absorption
  },

  {
    name = "water-shallow",
    type = "tile",
    collision_mask =
    {
      -- Character collides only with player-layer and train-layer,
      -- this can have any tile collision masks it doesn't matter for being walkable by character but not buildable.
      -- Having water-tile prevents placing paths, ground-tile prevents placing landfill.
      -- Not sure what other side effects could different combinations of tile masks cause.
      "water-tile",
      "ground-tile",
      "item-layer",
      "resource-layer",
      "object-layer"
      --"doodad-layer"
    },
    draw_in_water_layer = true,
    layer = 6,
    walking_speed_modifier = 0.8,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/water-shallow/water-shallow1.png",
          count = 8,
          size = 1,
          hr_version =
          {
            picture = "__base__/graphics/terrain/water-shallow/hr-water-shallow1.png",
            count = 8,
            scale = 0.5,
            size = 1
          }
        },
        {
          picture = "__base__/graphics/terrain/water-shallow/water-shallow2.png",
          count = 8,
          size = 2,
          hr_version =
          {
            picture = "__base__/graphics/terrain/water-shallow/hr-water-shallow2.png",
            count = 8,
            scale = 0.5,
            size = 2
          }
        },
        {
          picture = "__base__/graphics/terrain/water-shallow/water-shallow4.png",
          count = 8,
          size = 4,
          hr_version =
          {
            picture = "__base__/graphics/terrain/water-shallow/hr-water-shallow4.png",
            count = 8,
            scale = 0.5,
            size = 4
          }
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/water-shallow/water-shallow-inner-corner.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water-shallow/hr-water-shallow-inner-corner.png",
          count = 6,
          scale = 0.5
        }
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/water-shallow/water-shallow-outer-corner.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water-shallow/hr-water-shallow-outer-corner.png",
          count = 6,
          scale = 0.5
        }
      },
      side =
      {
        picture = "__base__/graphics/terrain/water-shallow/water-shallow-side.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water-shallow/hr-water-shallow-side.png",
          count = 6,
          scale = 0.5
        }
      },
      u_transition =
      {
        picture = "__base__/graphics/terrain/water-shallow/water-shallow-u.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water-shallow/hr-water-shallow-u.png",
          count = 1,
          scale = 0.5
        }
      },
      o_transition =
      {
        picture = "__base__/graphics/terrain/water-shallow/water-shallow-o.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water-shallow/hr-water-shallow-o.png",
          count = 1,
          scale = 0.5
        }
      }
    },
    transitions = { water_shallow_out_of_map_transition },
    transitions_between_transitions = water_shallow_transitions_between_transitions,
    allowed_neighbors = { "water-mud" },
    map_color={r=82, g=98, b=92},
    pollution_absorption_per_second = water_pollution_absorption
  },
  {
    name = "water-mud",
    type = "tile",
    collision_mask =
    {
      -- Player collides only with player-layer and train-layer,
      -- this can have any tile collision masks it doesn't matter for being walkable by player but not buildable.
      -- Having water-tile prevents placing paths, ground-tile prevents placing landfill.
      -- Not sure what other side effects could different combinations of tile masks cause.
      "water-tile",
      "ground-tile",
      "item-layer",
      "resource-layer",
      "object-layer"
      --"doodad-layer"
    },
    draw_in_water_layer = true,
    layer = 15,
    walking_speed_modifier = 0.7,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/water-mud/water-mud1.png",
          count = 8,
          size = 1,
          hr_version =
          {
            picture = "__base__/graphics/terrain/water-mud/hr-water-mud1.png",
            count = 8,
            scale = 0.5,
            size = 1
          }
        },
        {
          picture = "__base__/graphics/terrain/water-mud/water-mud2.png",
          count = 8,
          size = 2,
          hr_version =
          {
            picture = "__base__/graphics/terrain/water-mud/hr-water-mud2.png",
            count = 8,
            scale = 0.5,
            size = 2
          }
        },
        {
          picture = "__base__/graphics/terrain/water-mud/water-mud4.png",
          count = 8,
          size = 4,
          hr_version =
          {
            picture = "__base__/graphics/terrain/water-mud/hr-water-mud4.png",
            count = 8,
            scale = 0.5,
            size = 4
          }
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/water-mud/water-mud-inner-corner.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water-mud/hr-water-mud-inner-corner.png",
          count = 6,
          scale = 0.5
        }
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/water-mud/water-mud-outer-corner.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water-mud/hr-water-mud-outer-corner.png",
          count = 6,
          scale = 0.5
        }
      },
      side =
      {
        picture = "__base__/graphics/terrain/water-mud/water-mud-side.png",
        count = 6,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water-mud/hr-water-mud-side.png",
          count = 6,
          scale = 0.5
        }
      },
      u_transition =
      {
        picture = "__base__/graphics/terrain/water-mud/water-mud-u.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water-mud/hr-water-mud-u.png",
          count = 1,
          scale = 0.5
        }
      },
      o_transition =
      {
        picture = "__base__/graphics/terrain/water-mud/water-mud-o.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/water-mud/hr-water-mud-o.png",
          count = 1,
          scale = 0.5
        }
      }
    },
    transitions = { water_shallow_out_of_map_transition },
    transitions_between_transitions = water_mud_transitions_between_transitions,
    allowed_neighbors = { "water", "water-shallow" },
    map_color={r=65, g=89, b=90},
    pollution_absorption_per_second = water_pollution_absorption
  },
  -----------//////////////////////////////////////////////////////////////GRASS-1
  {
    name = "grass-1",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("grass-1", "grass", {{0, 0.7}, {1, 1}}),
    layer = 26,
    variants = tile_variations_template(
      "__base__/graphics/terrain/grass-1.png", "__base__/graphics/terrain/masks/transition-3.png",
      "__base__/graphics/terrain/hr-grass-1.png", "__base__/graphics/terrain/masks/hr-transition-3.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 0.91, weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 }, },
        [4] = { probability = 0.91, weights = {0.100, 0.80, 0.80, 0.100, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = grass_transitions,
    transitions_between_transitions = grass_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/grass-01.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=53, g=52, b=27},
    pollution_absorption_per_second = grass_pollution_absorption,
    vehicle_friction_modifier = grass_vehicle_speed_modifier
  },
   -----------//////////////////////////////////////////////////////////////GRASS-2 - potato
  {
    name = "grass-2",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("grass-2", "grass", {{0.45, 0.45}, {1, 0.8}}),
    layer = 28,
    variants = tile_variations_template(
      "__base__/graphics/terrain/grass-2.png", "__base__/graphics/terrain/masks/transition-3.png",
      "__base__/graphics/terrain/hr-grass-2.png", "__base__/graphics/terrain/masks/hr-transition-3.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 0.91, weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 }, },
        [4] = { probability = 0.75, weights = {0.085, 0.085, 0.085, 0.075, 0.057, 0.055, 0.085, 0.075, 0.035, 0.015, 0.001, 0.025, 0.005, 0.025, 0.045, 0.045 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = grass_transitions,
    transitions_between_transitions = grass_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/grass-01.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=57, g=54, b=35},
    pollution_absorption_per_second = grass_pollution_absorption,
    vehicle_friction_modifier = grass_vehicle_speed_modifier,
    can_be_part_of_blueprint = false
  },
  -----------//////////////////////////////////////////////////////////////GRASS-3
  {
    name = "grass-3",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("grass-3", "grass", {{0, 0.6}, {0.65, 0.9}}),
    layer = 29,
    variants = tile_variations_template(
      "__base__/graphics/terrain/grass-3.png", "__base__/graphics/terrain/masks/transition-3.png",
      "__base__/graphics/terrain/hr-grass-3.png", "__base__/graphics/terrain/masks/hr-transition-3.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = grass_transitions,
    transitions_between_transitions = grass_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/grass-01.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=59, g=56, b=41},
    pollution_absorption_per_second = grass_pollution_absorption,
    vehicle_friction_modifier = grass_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////GRASS-4
  {
    name = "grass-4",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("grass-4", "grass", {{0, 0.5}, {0.55, 0.7}}),
    layer = 30,
    variants = tile_variations_template(
      "__base__/graphics/terrain/grass-4.png", "__base__/graphics/terrain/masks/transition-3.png",
      "__base__/graphics/terrain/hr-grass-4.png", "__base__/graphics/terrain/masks/hr-transition-3.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.5, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = grass_transitions,
    transitions_between_transitions = grass_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/grass-01.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=54, g=47, b=35},
    pollution_absorption_per_second = grass_pollution_absorption,
    vehicle_friction_modifier = grass_vehicle_speed_modifier
  },

-----------//////////////////////////////////////////////////////////////DRY-DIRT
  {
    name = "dry-dirt",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("dry-dirt", "dirt", {{0.45, 0}, {0.55, 0.35}}),
    layer = 18,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dry-dirt.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-dry-dirt.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = dry_dirt_transitions,
    transitions_between_transitions = dry_dirt_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/dirt-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=108, g=92, b=71},
    pollution_absorption_per_second = dirt_pollution_absorption,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////DIRT
  {
    name = "dirt-1",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("dirt-1", "dirt", {{0, 0.25}, {0.45, 0.3}}, {{0.4, 0}, {0.45, 0.25}}),
    layer = 19,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-1.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-dirt-1.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = dry_dirt_transitions,
    transitions_between_transitions = dry_dirt_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/dirt-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=119, g=104, b=85},
    pollution_absorption_per_second = dirt_pollution_absorption,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////DIRT-2
  {
    name = "dirt-2",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("dirt-2", "dirt", {{0, 0.3}, {0.45, 0.35}}),
    layer = 20,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-2.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-dirt-2.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = dry_dirt_transitions,
    transitions_between_transitions = dry_dirt_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/dirt-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=109, g=94, b=75},
    pollution_absorption_per_second = dirt_pollution_absorption,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////DIRT-3
  {
    name = "dirt-3",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("dirt-3", "dirt", {{0, 0.35}, {0.55, 0.4}}),
    layer = 21,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-3.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-dirt-3.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = dry_dirt_transitions,
    transitions_between_transitions = dry_dirt_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/dirt-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=99, g=85, b=65},
    pollution_absorption_per_second = dirt_pollution_absorption,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////DIRT-4
  {
    name = "dirt-4",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("dirt-4", "dirt", {{0.55, 0}, {0.6, 0.35}}, {{0.6, 0.3}, {1, 0.35}}),
    layer = 22,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-4.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-dirt-4.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = dark_dirt_transitions,
    transitions_between_transitions = dark_dirt_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/dirt-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=89, g=74, b=57},
    pollution_absorption_per_second = dirt_pollution_absorption,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////DIRT-5
  {
    name = "dirt-5",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("dirt-5", "dirt", {{0, 0.4}, {0.55, 0.45}}),
    layer = 23,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-5.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-dirt-5.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = dark_dirt_transitions,
    transitions_between_transitions = dark_dirt_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/dirt-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=97, g=83, b=67},
    pollution_absorption_per_second = dirt_pollution_absorption,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////DIRT-6
  {
    name = "dirt-6",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("dirt-6", "dirt", {{0, 0.45}, {0.55, 0.5}}),
    layer = 24,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-6.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-dirt-6.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = dark_dirt_transitions,
    transitions_between_transitions = dark_dirt_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/dirt-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=77, g=65, b=53},
    pollution_absorption_per_second = dirt_pollution_absorption,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////DIRT-7
  {
    name = "dirt-7",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("dirt-7", "dirt", {{0, 0.5}, {0.55, 0.55}}),
    layer = 25,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-7.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-dirt-7.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = dark_dirt_transitions,
    transitions_between_transitions = dark_dirt_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/dirt-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=60, g=51, b=41},
    pollution_absorption_per_second = dirt_pollution_absorption,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////SAND-1
  {
    name = "sand-1",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("sand-1", "sand", {{0, 0}, {0.25, 0.15}}, function(prob)
      local beach_peak = beach_influence * noise.min(
        peak_to_noise_expression(noise.var("elevation"), 0, 1.5),
        peak_to_noise_expression(noise.var("aux"), 0.75, 0.25)
      )
      return noise.max(prob, beach_peak)
    end),
    layer = 8,

    variants = tile_variations_template(
      "__base__/graphics/terrain/sand-1.png", "__base__/graphics/terrain/masks/transition-4.png",
      "__base__/graphics/terrain/hr-sand-1.png", "__base__/graphics/terrain/masks/hr-transition-4.png",
      {
        max_size = 8,
        [2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020} },
        [4] = { probability = 0.20, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
        [8] = { probability = 0.10, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = sand_transitions,
    transitions_between_transitions = sand_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/sand-01.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/sand-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/sand-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/sand-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=145, g=129, b=104},
    pollution_absorption_per_second = sand_pollution_absorption,
    vehicle_friction_modifier = sand_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////SAND-2
  {
    name = "sand-2",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("sand-2", "sand", {{0, 0.15}, {0.3, 0.2}}, {{0.25, 0}, {0.3, 0.15}}),
    layer = 9,

    variants = tile_variations_template(
      "__base__/graphics/terrain/sand-2.png", "__base__/graphics/terrain/masks/transition-4.png",
      "__base__/graphics/terrain/hr-sand-2.png", "__base__/graphics/terrain/masks/hr-transition-4.png",
      {
        max_size = 8,
        [2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020} },
        [4] = { probability = 0.20, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
        [8] = { probability = 0.10, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = sand_transitions,
    transitions_between_transitions = sand_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/sand-01.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/sand-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/sand-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/sand-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=130, g=114, b=90},
    pollution_absorption_per_second = sand_pollution_absorption,
    vehicle_friction_modifier = sand_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////SAND-3
  {
    name = "sand-3",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("sand-3", "sand", {{0, 0.2}, {0.4, 0.25}}, {{0.3, 0}, {0.4, 0.2}}),
    layer = 10,
    variants = tile_variations_template(
      "__base__/graphics/terrain/sand-3.png", "__base__/graphics/terrain/masks/transition-4.png",
      "__base__/graphics/terrain/hr-sand-3.png", "__base__/graphics/terrain/masks/hr-transition-4.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020}, },
        [4] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020}, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = sand_transitions,
    transitions_between_transitions = sand_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/sand-01.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/sand-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/sand-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/sand-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=124, g=108, b=86},
    pollution_absorption_per_second = sand_pollution_absorption,
    vehicle_friction_modifier = sand_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////RED-DESERT-0 //potato-gate//
  {
    name = "red-desert-0",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("red-desert-0", "desert", {{0.55, 0.35}, {1, 0.5}}),
    layer = 31,
    variants = tile_variations_template(
      "__base__/graphics/terrain/red-desert-0.png", "__base__/graphics/terrain/masks/transition-3.png",
      "__base__/graphics/terrain/hr-red-desert-0.png", "__base__/graphics/terrain/masks/hr-transition-3.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        -- [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = grass_transitions,
    transitions_between_transitions = grass_transitions_between_transitions,
    --transitions = sand_transitions,
    --transitions_between_transitions = sand_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/grass-01.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=91, g=74, b=56},
    pollution_absorption_per_second = red_desert_pollution_absorption,
    vehicle_friction_modifier = grass_vehicle_speed_modifier,
    can_be_part_of_blueprint = false
  },
-----------//////////////////////////////////////////////////////////////RED-DESERT-1
  {
    name = "red-desert-1",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("red-desert-1", "desert", {{0.6, 0}, {0.7, 0.3}}, {{0.7, 0.25}, {1, 0.3}}),
    layer = 14,
    variants = tile_variations_template(
      "__base__/graphics/terrain/red-desert-1.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-red-desert-1.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        -- [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = dry_dirt_transitions,
    transitions_between_transitions = dry_dirt_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/grass-01.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=107, g=87, b=71},
    pollution_absorption_per_second = red_desert_pollution_absorption,
    vehicle_friction_modifier = grass_vehicle_speed_modifier,
    can_be_part_of_blueprint = false
  },
-----------//////////////////////////////////////////////////////////////RED-DESERT-2
  {
    name = "red-desert-2",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("red-desert-2", "desert", {{0.7, 0}, {0.8, 0.25}}, {{0.8, 0.2}, {1, 0.25}}),
    layer = 15,
    variants = tile_variations_template(
      "__base__/graphics/terrain/red-desert-2.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-red-desert-2.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = dry_dirt_transitions,
    transitions_between_transitions = dry_dirt_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/grass-01.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=120, g=94, b=78},
    pollution_absorption_per_second = red_desert_pollution_absorption,
    vehicle_friction_modifier = grass_vehicle_speed_modifier,
    can_be_part_of_blueprint = false
  },
-----------//////////////////////////////////////////////////////////////RED-DESERT-3
  {
    name = "red-desert-3",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("red-desert-3", "desert", {{0.8, 0}, {1, 0.2}}),
    layer = 16,
    variants = tile_variations_template(
      "__base__/graphics/terrain/red-desert-3.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-red-desert-3.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = dry_dirt_transitions,
    transitions_between_transitions = dry_dirt_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/grass-01.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=114, g=86, b=75},
    pollution_absorption_per_second = red_desert_pollution_absorption,
    vehicle_friction_modifier = grass_vehicle_speed_modifier
  },
  -----------//////////////////////////////////////////////////////////////STONE-PATH
  {
    type = "tile",
    name = "stone-path",
    needs_correction = false,
    minable = {mining_time = 0.1, result = "stone-brick"},
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = {"ground-tile"},
    walking_speed_modifier = 1.3,
    layer = 60,
    decorative_removal_probability = 0.15,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/stone-path/stone-path-1.png",
          count = 16,
          size = 1,
          hr_version =
          {
            picture = "__base__/graphics/terrain/stone-path/hr-stone-path-1.png",
            count = 16,
            size = 1,
            scale = 0.5
          }
        },
        {
          picture = "__base__/graphics/terrain/stone-path/stone-path-2.png",
          count = 16,
          size = 2,
          probability = 0.39,
          hr_version =
          {
            picture = "__base__/graphics/terrain/stone-path/hr-stone-path-2.png",
            count = 16,
            size = 2,
            probability = 0.39,
            scale = 0.5
          }
        },
        {
          picture = "__base__/graphics/terrain/stone-path/stone-path-4.png",
          count = 16,
          size = 4,
          probability = 1,
          hr_version =
          {
            picture = "__base__/graphics/terrain/stone-path/hr-stone-path-4.png",
            count = 16,
            size = 4,
            probability = 1,
            scale = 0.5
          }
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/stone-path/stone-path-inner-corner.png",
        count = 16,
        tall = true,
        hr_version =
        {
          picture = "__base__/graphics/terrain/stone-path/hr-stone-path-inner-corner.png",
          count = 16,
          tall = true,
          scale = 0.5
        }
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/stone-path/stone-path-outer-corner.png",
        count = 8,
        tall = true,
        hr_version =
        {
          picture = "__base__/graphics/terrain/stone-path/hr-stone-path-outer-corner.png",
          count = 8,
          tall = true,
          scale = 0.5
        }
      },
      side =
      {
        picture = "__base__/graphics/terrain/stone-path/stone-path-side.png",
        count = 16,
        tall = true,
        hr_version =
        {
          picture = "__base__/graphics/terrain/stone-path/hr-stone-path-side.png",
          count = 16,
          tall = true,
          scale = 0.5
        }
      },
      u_transition =
      {
        picture = "__base__/graphics/terrain/stone-path/stone-path-u.png",
        count = 8,
        tall = true,
        hr_version =
        {
          picture = "__base__/graphics/terrain/stone-path/hr-stone-path-u.png",
          count = 8,
          tall = true,
          scale = 0.5
        }
      },
      o_transition =
      {
        picture = "__base__/graphics/terrain/stone-path/stone-path-o.png",
        count = 4,
        hr_version =
        {
          picture = "__base__/graphics/terrain/stone-path/hr-stone-path-o.png",
          count = 4,
          scale = 0.5
        }
      }
    },
    transitions = stone_path_transitions,
    transitions_between_transitions = stone_path_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.0
      }
    },
    map_color={r=50, g=50, b=50},
    pollution_absorption_per_second = 0,
    vehicle_friction_modifier = stone_path_vehicle_speed_modifier
  },
  {
    type = "tile",
    name = "lab-dark-1",
    collision_mask = {"ground-tile"},
    layer = 70,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/lab-tiles/lab-dark-1.png",
          count = 1,
          size = 1
        }
      },
      empty_transitions = true
    },
    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.0
      }
    },
    map_color={r=0, g=0, b=0},
    pollution_absorption_per_second = 0
  },
  {
    type = "tile",
    name = "lab-dark-2",
    collision_mask = {"ground-tile"},
    layer = 70,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/lab-tiles/lab-dark-2.png",
          count = 1,
          size = 1
        }
      },
      empty_transitions = true
    },
    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.0
      }
    },
    map_color={r=0.2, g=0.2, b=0.2},
    pollution_absorption_per_second = 0
  },
  {
    type = "tile",
    name = "lab-white",
    collision_mask = {"ground-tile"},
    layer = 70,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/lab-tiles/lab-white.png",
          count = 1,
          size = 1
        }
      },
      empty_transitions = true
    },
    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.0
      }
    },
    map_color={r=1, g=1, b=1},
    pollution_absorption_per_second = 0
  },
  {
    type = "tile",
    name = "tutorial-grid",
    collision_mask = {"ground-tile"},
    layer = 75,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/tutorial-grid/tutorial-grid1.png",
          count = 16,
          size = 1,
          hr_version =
          {
            picture = "__base__/graphics/terrain/tutorial-grid/hr-tutorial-grid1.png",
            count = 16,
            scale = 0.5,
            size = 1
          }
        },
        {
          picture = "__base__/graphics/terrain/tutorial-grid/tutorial-grid2.png",
          count = 16,
          size = 2,
          hr_version =
          {
            picture = "__base__/graphics/terrain/tutorial-grid/hr-tutorial-grid2.png",
            count = 16,
            scale = 0.5,
            size = 2
          }
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/tutorial-grid/tutorial-grid-inner-corner.png",
        count = 4,
        tall = true,
        hr_version =
        {
          picture = "__base__/graphics/terrain/tutorial-grid/hr-tutorial-grid-inner-corner.png",
          count = 4,
          tall = true,
          scale = 0.5
        }
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/tutorial-grid/tutorial-grid-outer-corner.png",
        count = 4,
        tall = true,
        hr_version =
        {
          picture = "__base__/graphics/terrain/tutorial-grid/hr-tutorial-grid-outer-corner.png",
          count = 4,
          tall = true,
          scale = 0.5
        }
      },
      side =
      {
        picture = "__base__/graphics/terrain/tutorial-grid/tutorial-grid-side.png",
        count = 16,
        tall = true,
        hr_version =
        {
          picture = "__base__/graphics/terrain/tutorial-grid/hr-tutorial-grid-side.png",
          count = 16,
          tall = true,
          scale = 0.5
        }
      },
      u_transition =
      {
        picture = "__base__/graphics/terrain/tutorial-grid/tutorial-grid-u.png",
        count = 2,
        tall = true,
        hr_version =
        {
          picture = "__base__/graphics/terrain/tutorial-grid/hr-tutorial-grid-u.png",
          count = 2,
          tall = true,
          scale = 0.5
        }
      },
      o_transition =
      {
        picture = "__base__/graphics/terrain/tutorial-grid/tutorial-grid-o.png",
        count = 2,
        hr_version =
        {
          picture = "__base__/graphics/terrain/tutorial-grid/hr-tutorial-grid-o.png",
          count = 2,
          scale = 0.5
        }
      }
    },
    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.0
      }
    },
    map_color={r=0, g=0, b=0},
    pollution_absorption_per_second = 0
  },

  {
    type = "tile",
    name = "concrete",
    needs_correction = false,
    minable = (not data.is_demo) and {mining_time = 0.1, result = "concrete"} or nil,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = {"ground-tile"},
    walking_speed_modifier = 1.4,
    layer = 61,
    transition_overlay_layer_offset = 2, -- need to render border overlay on top of hazard-concrete
    decorative_removal_probability = 0.25,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 2,
          probability = 0.39
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 4,
          probability = 1
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-inner-corner.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner.png",
          count = 16,
          scale = 0.5
        }
      },
      inner_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-inner-corner-mask.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner-mask.png",
          count = 16,
          scale = 0.5
        }
      },

      outer_corner =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-outer-corner.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner.png",
          count = 8,
          scale = 0.5
        }
      },
      outer_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner-mask.png",
          count = 8,
          scale = 0.5
        }
      },

      side =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-side.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-side.png",
          count = 16,
          scale = 0.5
        }
      },
      side_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-side-mask.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-side-mask.png",
          count = 16,
          scale = 0.5
        }
      },

      u_transition =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-u.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-u.png",
          count = 8,
          scale = 0.5
        }
      },
      u_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-u-mask.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-u-mask.png",
          count = 8,
          scale = 0.5
        }
      },

      o_transition =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-o.png",
        count = 4,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-o.png",
          count = 4,
          scale = 0.5
        }
      },
      o_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-o-mask.png",
        count = 4,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-o-mask.png",
          count = 4,
          scale = 0.5
        }
      },


      material_background =
      {
        picture = "__base__/graphics/terrain/concrete/concrete.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete.png",
          count = 8,
          scale = 0.5
        }
      }
    },

    transitions = concrete_transitions,
    transitions_between_transitions = concrete_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.0
      }
    },
    map_color={r=100, g=100, b=100},
    pollution_absorption_per_second = 0,
    vehicle_friction_modifier = concrete_vehicle_speed_modifier
  },
  {
    type = "tile",
    name = "hazard-concrete-left",
    needs_correction = false,
    next_direction = "hazard-concrete-right",
    transition_merges_with_tile = "concrete",
    minable = (not data.is_demo) and {mining_time = 0.1, result = "hazard-concrete"} or nil,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = {"ground-tile"},
    walking_speed_modifier = 1.4,
    layer = 62,
    decorative_removal_probability = 0.25,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 2,
          probability = 0.39
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 4,
          probability = 1
        }
      },

      inner_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-inner-corner-mask.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-inner-corner-mask.png",
          count = 1,
          scale = 0.5
        }
      },
      outer_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-outer-corner-mask.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-outer-corner-mask.png",
          count = 1,
          scale = 0.5
        }
      },

      side_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-side-mask.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-side-mask.png",
          count = 1,
          scale = 0.5
        }
      },

      u_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-u-mask.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-u-mask.png",
          count = 1,
          scale = 0.5
        }
      },

      o_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-o-mask.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-o-mask.png",
          count = 1,
          scale = 0.5
        }
      },

      material_background =
      {
        picture = "__base__/graphics/terrain/hazard-concrete-left/hazard-concrete-left.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/hazard-concrete-left/hr-hazard-concrete-left.png",
          count = 8,
          scale = 0.5
        }
      }
    },
    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.0
      }
    },
    map_color={r=0.5, g=0.5, b=0},
    pollution_absorption_per_second = 0,
    vehicle_friction_modifier = concrete_vehicle_speed_modifier
  },
  {
    type = "tile",
    name = "hazard-concrete-right",
    needs_correction = false,
    next_direction = "hazard-concrete-left",
    transition_merges_with_tile = "concrete",
    minable = (not data.is_demo) and {mining_time = 0.1, result = "hazard-concrete"} or nil,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = {"ground-tile"},
    walking_speed_modifier = 1.4,
    layer = 62,
    decorative_removal_probability = 0.25,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 2,
          probability = 0.39
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 4,
          probability = 1
        }
      },
      inner_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-inner-corner-mask.png",
        count = 1
      },
      outer_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-outer-corner-mask.png",
        count = 1
      },

      side_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-side-mask.png",
        count = 1
      },

      u_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-u-mask.png",
        count = 1
      },

      o_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-o-mask.png",
        count = 1
      },

      material_background =
      {
        picture = "__base__/graphics/terrain/hazard-concrete-right/hazard-concrete-right.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/hazard-concrete-right/hr-hazard-concrete-right.png",
          count = 8,
          scale = 0.5
        }
      }
    },
    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.0
      }
    },
    map_color={r=0.5, g=0.5, b=0},
    pollution_absorption_per_second = 0,
    vehicle_friction_modifier = concrete_vehicle_speed_modifier
  },

  {
    type = "tile",
    name = "refined-concrete",
    needs_correction = false,
    minable = (not data.is_demo) and {mining_time = 0.1, result = "refined-concrete"} or nil,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = {"ground-tile"},
    walking_speed_modifier = 1.5,
    layer = 64,
    transition_overlay_layer_offset = 2, -- need to render border overlay on top of hazard-concrete
    decorative_removal_probability = 0.25,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 2,
          probability = 0.39
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 4,
          probability = 1
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-inner-corner.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner.png",
          count = 16,
          scale = 0.5
        }
      },
      inner_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-inner-corner-mask.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner-mask.png",
          count = 16,
          scale = 0.5
        }
      },

      outer_corner =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-outer-corner.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner.png",
          count = 8,
          scale = 0.5
        }
      },
      outer_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner-mask.png",
          count = 8,
          scale = 0.5
        }
      },

      side =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-side.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-side.png",
          count = 16,
          scale = 0.5
        }
      },
      side_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-side-mask.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-side-mask.png",
          count = 16,
          scale = 0.5
        }
      },

      u_transition =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-u.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-u.png",
          count = 8,
          scale = 0.5
        }
      },
      u_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-u-mask.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-u-mask.png",
          count = 8,
          scale = 0.5
        }
      },

      o_transition =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-o.png",
        count = 4,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-o.png",
          count = 4,
          scale = 0.5
        }
      },
      o_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-o-mask.png",
        count = 4,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-o-mask.png",
          count = 4,
          scale = 0.5
        }
      },


      material_background =
      {
        picture = "__base__/graphics/terrain/concrete/refined-concrete.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-refined-concrete.png",
          count = 8,
          scale = 0.5
        }
      }
    },

    transitions = concrete_transitions,
    transitions_between_transitions = concrete_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.0
      }
    },
    map_color={r=100, g=100, b=100},
    pollution_absorption_per_second = 0,
    vehicle_friction_modifier = concrete_vehicle_speed_modifier
  },
  {
    type = "tile",
    name = "refined-hazard-concrete-left",
    needs_correction = false,
    next_direction = "refined-hazard-concrete-right",
    transition_merges_with_tile = "refined-concrete",
    minable = (not data.is_demo) and {mining_time = 0.1, result = "refined-hazard-concrete"} or nil,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = {"ground-tile"},
    walking_speed_modifier = 1.5,
    layer = 65,
    decorative_removal_probability = 0.25,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 2,
          probability = 0.39
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 4,
          probability = 1
        }
      },

      inner_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-inner-corner-mask.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-inner-corner-mask.png",
          count = 1,
          scale = 0.5
        }
      },
      outer_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-outer-corner-mask.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-outer-corner-mask.png",
          count = 1,
          scale = 0.5
        }
      },

      side_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-side-mask.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-side-mask.png",
          count = 1,
          scale = 0.5
        }
      },

      u_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-u-mask.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-u-mask.png",
          count = 1,
          scale = 0.5
        }
      },

      o_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-o-mask.png",
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-o-mask.png",
          count = 1,
          scale = 0.5
        }
      },

      material_background =
      {
        picture = "__base__/graphics/terrain/hazard-concrete-left/refined-hazard-concrete-left.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/hazard-concrete-left/hr-refined-hazard-concrete-left.png",
          count = 8,
          scale = 0.5
        }
      }
    },
    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.0
      }
    },
    map_color={r=0.5, g=0.5, b=0},
    pollution_absorption_per_second = 0,
    vehicle_friction_modifier = concrete_vehicle_speed_modifier
  },
  {
    type = "tile",
    name = "refined-hazard-concrete-right",
    needs_correction = false,
    next_direction = "refined-hazard-concrete-left",
    transition_merges_with_tile = "refined-concrete",
    minable = (not data.is_demo) and {mining_time = 0.1, result = "refined-hazard-concrete"} or nil,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = {"ground-tile"},
    walking_speed_modifier = 1.5,
    layer = 65,
    decorative_removal_probability = 0.25,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 2,
          probability = 0.39
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 4,
          probability = 1
        }
      },
      inner_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-inner-corner-mask.png",
        count = 1
      },
      outer_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-outer-corner-mask.png",
        count = 1
      },

      side_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-side-mask.png",
        count = 1
      },

      u_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-u-mask.png",
        count = 1
      },

      o_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/hazard-concrete-o-mask.png",
        count = 1
      },

      material_background =
      {
        picture = "__base__/graphics/terrain/hazard-concrete-right/refined-hazard-concrete-right.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/hazard-concrete-right/hr-refined-hazard-concrete-right.png",
          count = 8,
          scale = 0.5
        }
      }
    },
    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.0
      }
    },
    map_color={r=0.5, g=0.5, b=0},
    pollution_absorption_per_second = 0,
    vehicle_friction_modifier = concrete_vehicle_speed_modifier
  },
  {
    type = "tile",
    name = "landfill",
    collision_mask = {"ground-tile"},
    layer = 57,

    transitions = landfill_transitions,
    transitions_between_transitions = landfill_transitions_between_transitions,

    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 2,
          probability = 0.39
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 4,
          probability = 1
        }
      },

      inner_corner_mask =
      {
        picture = "__base__/graphics/terrain/masks/transition-1.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/masks/hr-transition-1.png",
          count = 8,
          scale = 0.5
        }
      },

      outer_corner_mask =
      {
        picture = "__base__/graphics/terrain/masks/transition-1.png",
        x = 32 * 9,
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/masks/hr-transition-1.png",
          x = 64 * 9,
          count = 8,
          scale = 0.5
        }
      },

      side_mask =
      {
        picture = "__base__/graphics/terrain/masks/transition-1.png",
        x = 32 * 18,
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/masks/hr-transition-1.png",
          x = 64 * 18,
          count = 8,
          scale = 0.5
        }
      },

      u_transition_mask =
      {
        picture = "__base__/graphics/terrain/masks/transition-1.png",
        x = 32 * 27,
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/masks/hr-transition-1.png",
          x = 64 * 27,
          count = 1,
          scale = 0.5
        }
      },

      o_transition_mask =
      {
        picture = "__base__/graphics/terrain/masks/transition-1.png",
        x = 32 * 36,
        count = 1,
        hr_version =
        {
          picture = "__base__/graphics/terrain/masks/hr-transition-1.png",
          x = 64 * 36,
          count = 1,
          scale = 0.5
        }
      },


      material_background =
      {
        picture = "__base__/graphics/terrain/landfill.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/hr-landfill.png",
          count = 8,
          scale = 0.5
        }
      }
    },

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/dirt-02.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-03.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-04.ogg",
        volume = 0.8
      }
    },
    map_color={r=54, g=46, b=37},
    pollution_absorption_per_second = 0
  },
}

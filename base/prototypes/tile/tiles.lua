local autoplace_utils = require("autoplace_utils")

local function noise_layer_peak(noise_name)
  return {
    influence = 0.5,
    noise_layer = noise_name,
    noise_persistence = 0.7,
    octaves_difference = -6,
    noise_scale = 3
  }
end

local function add_peaks(autoplace, more_peaks)
  for _, peak in ipairs(more_peaks) do
    autoplace.peaks[#autoplace.peaks + 1] = peak
  end
  return autoplace
end

-- 'rectangles' indicate
-- {{aux0, water0}, {aux1, water1}}
local function autoplace_settings(noise_name, control, rectangle, rectangle2)
  local peaks = {
    noise_layer_peak(noise_name)
  }

  local aux_center = (rectangle[2][1] + rectangle[1][1]) / 2
  local aux_range = math.abs(rectangle[2][1] - rectangle[1][1]) / 2
  local water_center = (rectangle[2][2] + rectangle[1][2]) / 2
  local water_range = math.abs(rectangle[2][2] - rectangle[1][2]) / 2

  -- fadeout too small and you'll get gaps between biomes.
  -- too large and placement get unpredictable
  local fadeout = 0.15

  peaks[#peaks + 1] = {
    aux_optimal = aux_center,
    aux_range = aux_range,
    aux_max_range = aux_range + fadeout,

    water_optimal = water_center,
    water_range = water_range,
    water_max_range = water_range + fadeout,
  }

  if rectangle2 ~= nil then
    aux_center = (rectangle2[2][1] + rectangle2[1][1]) / 2
    aux_range = math.abs(rectangle2[2][1] - rectangle2[1][1]) / 2
    water_center = (rectangle[2][2] + rectangle2[1][2]) / 2
    water_range = math.abs(rectangle2[2][2] - rectangle2[1][2]) / 2

    peaks[#peaks + 1] = {
      aux_optimal = aux_center,
      aux_range = aux_range,
      aux_max_range = aux_range + fadeout,

      water_optimal = water_center,
      water_range = water_range,
      water_max_range = water_range + fadeout,
    }
  end

  return { peaks = peaks, control = control }
end

function tile_variations_template(normal_res_picture, normal_res_transition, high_res_picture, high_res_transition, options)
  local function main_variation(size_)
    local y_ = ((size_ == 1) and 0) or ((size_ == 2) and 64) or ((size_ == 4) and 160) or 320
    local ret = {
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
        scale = 0.5,
      }
    }
  end

  local main_ =
  {
    main_variation(1),
    main_variation(2),
    main_variation(4),
  }
  if (options.max_size == 8) then
    table.insert(main_, main_variation(8))
  end

  return
  {
    main = main_,
    inner_corner_mask = make_transition_variation(0),
    outer_corner_mask = make_transition_variation(288),
    side_mask         = make_transition_variation(576),
    u_transition_mask = make_transition_variation(864, 1, 1),
    o_transition_mask = make_transition_variation(1152, 2, 1),
  }
end


function water_transition_template(to_tiles, normal_res_transition, high_res_transition, options)
  local function make_transition_variation(src_x, src_y, cnt_, line_len_, is_tall)
    return
    {
      picture = normal_res_transition,
      count = cnt_,
      line_length = line_len_,
      x = src_x,
      y = src_y,
      tall = is_tall,
      hr_version=
      {
        picture = high_res_transition,
        count = cnt_,
        line_length = line_len_,
        x = 2 * src_x,
        y = 2 * (src_y or 0),
        tall = is_tall,
        scale = 0.5,
      }
    }
  end

  local t = options.base or {}
  t.to_tiles = to_tiles
  local default_count = options.count or 16
  for k,y in pairs({inner_corner = 0, outer_corner = 288, side = 576, u_transition = 864, o_transition = 1152}) do
    local count = options[k .. "_count"] or default_count
    if count > 0 and type(y) == "number" then
      local line_length = options[k .. "_line_length"] or count
      local is_tall = true
      if (options[k .. "_tall"] == false) then
        is_tall = false
      end
      t[k] = make_transition_variation(0, y, count, line_length, is_tall)
      t[k .. "_background"] = make_transition_variation(544, y, count, line_length, is_tall)
      t[k .. "_mask"] = make_transition_variation(1088, y, count, line_length)
    end
  end

  return t
end


local grass_vehicle_speed_modifier = 1.6
local dirt_vehicle_speed_modifier = 1.4
local sand_vehicle_speed_modifier = 1.8
local stone_path_vehicle_speed_modifier = 1.1
local concrete_vehicle_speed_modifier = 0.8

-- An 'infinity-like' number used to give water an elevation range that
-- is effectively unbounded on the low end
local water_inflike = 4096

function water_autoplace_settings(from_depth, rectangles)
  local ret =
  {
    {
      -- Water and deep water have absolute priority. We simulate this by giving
      -- them absurdly large influence
      influence = 1e3 + from_depth,
      elevation_optimal = -water_inflike - from_depth,
      elevation_range = water_inflike,
      elevation_max_range = water_inflike, -- everywhere below elevation 0 and nowhere else
    }
  }

  -- if rectangles == nil then
  --   ret[2] = { influence = 1 }
  -- end

  -- autoplace_utils.peaks(rectangles, ret)

  return { peaks = ret }
end

water_tile_type_names = { "water", "deepwater", "water-green", "deepwater-green" }
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
        base = { background_layer_offset = -1 }
      }
  ),
}

local sand_transitions_between_transitions =
{
  water_transition_template
  (
      water_tile_type_names,
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
        base = { water_patch = patch_for_inner_corner_of_transition_between_transition, },
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
}

local grass_transitions_between_transitions =
{
  water_transition_template
  (
      water_tile_type_names,
      "__base__/graphics/terrain/water-transitions/grass-transition.png",
      "__base__/graphics/terrain/water-transitions/hr-grass-transition.png",
      {
        inner_corner_tall = true,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = { water_patch = patch_for_inner_corner_of_transition_between_transition, },
      }
  ),
}

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
        inner_corner_count = 8,
      }
  ),
}

local dry_dirt_transitions_between_transitions =
{
  water_transition_template
  (
      water_tile_type_names,
      "__base__/graphics/terrain/water-transitions/dry-dirt-transition.png",
      "__base__/graphics/terrain/water-transitions/hr-dry-dirt-transition.png",
      {
        o_transition_tall = false,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = { water_patch = patch_for_inner_corner_of_transition_between_transition, },
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
        inner_corner_count = 8,
      }
  ),
}

local dark_dirt_transitions_between_transitions =
{
  water_transition_template
  (
      water_tile_type_names,
      "__base__/graphics/terrain/water-transitions/dark-dirt-transition.png",
      "__base__/graphics/terrain/water-transitions/hr-dark-dirt-transition.png",
      {
        o_transition_tall = false,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = { water_patch = patch_for_inner_corner_of_transition_between_transition, },
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
}

local concrete_transitions_between_transitions =
{
  water_transition_template
  (
      water_tile_type_names,
      "__base__/graphics/terrain/water-transitions/concrete-transitions.png",
      "__base__/graphics/terrain/water-transitions/hr-concrete-transitions.png",
      {
        inner_corner_tall = true,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
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
}

local stone_path_transitions_between_transitions =
{
  water_transition_template
  (
      water_tile_type_names,
      "__base__/graphics/terrain/water-transitions/stone-path-transitions.png",
      "__base__/graphics/terrain/water-transitions/hr-stone-path-transitions.png",
      {
        inner_corner_tall = true,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
      }
  ),
}

data:extend(
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
    layer = 70,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/out-of-map.png",
          count = 1,
          size = 1
        },
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/out-of-map-inner-corner.png",
        count = 0
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/out-of-map-outer-corner.png",
        count = 0
      },
      side =
      {
        picture = "__base__/graphics/terrain/out-of-map-side.png",
        count = 0
      }
    },
    map_color={r=0, g=0, b=0},
    ageing=0.0006
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
    autoplace = water_autoplace_settings(2),
    draw_in_water_layer = true,
    layer = 4,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater1.png",
          count = 8,
          size = 1,
          hr_version = {
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
          hr_version = {
            picture = "__base__/graphics/terrain/deepwater/hr-deepwater2.png",
            count = 8,
            scale = 0.5,
            size = 2
          }
        },
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater4.png",
          count = 6,
          size = 4,
          hr_version = {
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
        hr_version = {
          picture = "__base__/graphics/terrain/deepwater/hr-deepwater-inner-corner.png",
          count = 6,
          scale = 0.5
        }
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/deepwater/deepwater-outer-corner.png",
        count = 6,
        hr_version = {
          picture = "__base__/graphics/terrain/deepwater/hr-deepwater-outer-corner.png",
          count = 6,
          scale = 0.5
        }
      },
      side =
      {
        picture = "__base__/graphics/terrain/deepwater/deepwater-side.png",
        count = 8,
        hr_version = {
          picture = "__base__/graphics/terrain/deepwater/hr-deepwater-side.png",
          count = 8,
          scale = 0.5
        }
      }
    },
    allowed_neighbors = { "water" },
    map_color={r=38, g=64, b=73},
    ageing=0.0006
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
    autoplace = water_autoplace_settings(5, {{{35, 1}, {15, 0.7}}}),
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
          hr_version = {
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
          hr_version = {
            picture = "__base__/graphics/terrain/deepwater-green/hr-deepwater-green2.png",
            count = 8,
            scale = 0.5,
            size = 2
          }
        },
        {
          picture = "__base__/graphics/terrain/deepwater-green/deepwater-green4.png",
          count = 6,
          size = 4,
          hr_version = {
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
        hr_version = {
          picture = "__base__/graphics/terrain/deepwater-green/hr-deepwater-green-inner-corner.png",
          count = 6,
          scale = 0.5
        }
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/deepwater-green/deepwater-green-outer-corner.png",
        count = 6,
        hr_version = {
          picture = "__base__/graphics/terrain/deepwater-green/hr-deepwater-green-outer-corner.png",
          count = 6,
          scale = 0.5
        }
      },
      side =
      {
        picture = "__base__/graphics/terrain/deepwater-green/deepwater-green-side.png",
        count = 8,
        hr_version = {
          picture = "__base__/graphics/terrain/deepwater-green/hr-deepwater-green-side.png",
          count = 8,
          scale = 0.5
        }
      }
    },
    allowed_neighbors = { "water-green" },
    map_color={r=0.0941, g=0.149, b=0.066},
    ageing=0.0005
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
    autoplace = water_autoplace_settings(0),
    draw_in_water_layer = true,
    layer = 2,
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
          },
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
          },
        },
        {
          picture = "__base__/graphics/terrain/water/water4.png",
          count = 6,
          size = 4,
          hr_version =
          {
            picture = "__base__/graphics/terrain/water/hr-water4.png",
            count = 8,
            scale = 0.5,
            size = 4
          },
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/water/water-inner-corner.png",
        count = 0
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/water/water-outer-corner.png",
        count = 0
      },
      side =
      {
        picture = "__base__/graphics/terrain/water/water-side.png",
        count = 0
      }
    },
    --allowed_neighbors = { "grass-1" },
    map_color={r=51, g=83, b=95},
    ageing=0.0006
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
    autoplace = water_autoplace_settings(0, {{{35, 1}, {15, 0.7}}}),
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
          hr_version = {
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
          hr_version = {
            picture = "__base__/graphics/terrain/water-green/hr-water-green2.png",
            count = 8,
            scale = 0.5,
            size = 2
          }
        },
        {
          picture = "__base__/graphics/terrain/water-green/water-green4.png",
          count = 6,
          size = 4,
          hr_version = {
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
        count = 0
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/water-green/water-green-outer-corner.png",
        count = 0
      },
      side =
      {
        picture = "__base__/graphics/terrain/water-green/water-green-side.png",
        count = 0
      }
    },
    --allowed_neighbors = { "grass-1" },
    map_color={r=31, g=48, b=18},
    ageing=0.0005
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
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.00045,
    vehicle_friction_modifier = grass_vehicle_speed_modifier,
    can_be_part_of_blueprint = false
  },
   -----------//////////////////////////////////////////////////////////////GRASS-2 - potato
  {
    name = "grass-2",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("grass-2", "grass", {{.45, .55}, {1, 0.9}}),
    layer = 27,
    variants = tile_variations_template(
      "__base__/graphics/terrain/grass-2.png", "__base__/graphics/terrain/masks/transition-3.png",
      "__base__/graphics/terrain/hr-grass-2.png", "__base__/graphics/terrain/masks/hr-transition-3.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 0.91, weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 }, },
        [4] = { probability = 0.75, weights = {0.085, 0.085, 0.085, 0.075, 0.057, 0.055, 0.085, 0.075, 0.035, 0.015, 0.001, 0.025, 0.005, 0.025, 0.045, 0.045 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.00045,
    vehicle_friction_modifier = grass_vehicle_speed_modifier,
    can_be_part_of_blueprint = false
  },
  -----------//////////////////////////////////////////////////////////////GRASS-3
  {
    name = "grass-3",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("grass-3", "grass", {{0, 0.65}, {0.65, 0.95}}),
    layer = 28,
    variants = tile_variations_template(
      "__base__/graphics/terrain/grass-3.png", "__base__/graphics/terrain/masks/transition-3.png",
      "__base__/graphics/terrain/hr-grass-3.png", "__base__/graphics/terrain/masks/hr-transition-3.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.0004,
    vehicle_friction_modifier = grass_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////GRASS-4
  {
    name = "grass-4",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("grass-4", "grass", {{0, 0.55}, {0.55, 0.8}}),
    layer = 29,
    variants = tile_variations_template(
      "__base__/graphics/terrain/grass-4.png", "__base__/graphics/terrain/masks/transition-3.png",
      "__base__/graphics/terrain/hr-grass-4.png", "__base__/graphics/terrain/masks/hr-transition-3.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.5, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.0004,
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
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.00045,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////DIRT
  {
    name = "dirt-1",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("dirt-1", "dirt", {{0, 0.25}, {0.45, 0.3}}, {{0.35, 0.25}, {0.45, 0.25}}),
    layer = 19,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-1.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-dirt-1.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.00045,
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
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.00045,
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
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.00045,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////DIRT-4
  {
    name = "dirt-4",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("dirt-4", "dirt", {{0.55, 0}, {0.6, 0.4}}, {{0.6, 0.3}, {1, 0.4}}),
    layer = 22,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-4.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-dirt-4.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.00045,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////DIRT-5
  {
    name = "dirt-5",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("dirt-5", "dirt", {{0, 0.4}, {0.45, 0.45}}),
    layer = 23,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-5.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-dirt-5.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.00045,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////DIRT-6
  {
    name = "dirt-6",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("dirt-6", "dirt", {{0, 0.45}, {0.45, 0.5}}),
    layer = 24,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-6.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-dirt-6.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.00045,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////DIRT-7
  {
    name = "dirt-7",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("dirt-7", "dirt", {{0, 0.5}, {0.4, 0.55}}),
    layer = 25,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-7.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-dirt-7.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.00045,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////SAND-1
  {
    name = "sand-1",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = add_peaks(
      autoplace_settings("sand-1", "sand", {{0, 0}, {0.25, 0.15}}),
      {
	{
	  -- Sand at elevation 0-1.5 to make beaches
	  influence = 1,
	  elevation_optimal = 0.75,
	  elevation_range = 0.75,
	  elevation_max_range = 0.75,
	  water_optimal = 0,
	  water_range = 0.25,
	  water_max_range = 0.5, -- Avoid large sandbars in humid areas!
	  min_influence = 0,
	}
      }
    ),
    layer = 8,

    variants = tile_variations_template(
      "__base__/graphics/terrain/sand-1.png", "__base__/graphics/terrain/masks/transition-4.png",
      "__base__/graphics/terrain/hr-sand-1.png", "__base__/graphics/terrain/masks/hr-transition-4.png",
      {
        max_size = 8,
        [2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020} },
        [4] = { probability = 0.20, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
        [8] = { probability = 0.10, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.00025,
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
        [8] = { probability = 0.10, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.00025,
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
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.0002,
    vehicle_friction_modifier = sand_vehicle_speed_modifier
  },
-----------//////////////////////////////////////////////////////////////RED-DESERT-0 //potato-gate//
  {
    name = "red-desert-0",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("red-desert-0", "desert", {{0.55, 0.4}, {1, 0.7}}),
    layer = 30,
    variants = tile_variations_template(
      "__base__/graphics/terrain/red-desert-0.png", "__base__/graphics/terrain/masks/transition-3.png",
      "__base__/graphics/terrain/hr-red-desert-0.png", "__base__/graphics/terrain/masks/hr-transition-3.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        -- [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    map_color={r=91, g=74, b=56},
    ageing=0.00045,
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
        -- [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.00045,
    vehicle_friction_modifier = grass_vehicle_speed_modifier,
    can_be_part_of_blueprint = false
  },
-----------//////////////////////////////////////////////////////////////RED-DESERT-2
  {
    name = "red-desert-2",
    type = "tile",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("red-desert-2", "desert", {{0.7, 0}, {0.8, 0.25}}, {{0.7, 0.2}, {1, 0.25}}),
    layer = 15,
    variants = tile_variations_template(
      "__base__/graphics/terrain/red-desert-2.png", "__base__/graphics/terrain/masks/transition-1.png",
      "__base__/graphics/terrain/hr-red-desert-2.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.00045,
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
        [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
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
    ageing=0.0004,
    vehicle_friction_modifier = grass_vehicle_speed_modifier
  },
  -----------//////////////////////////////////////////////////////////////STONE-PATH
  {
    type = "tile",
    name = "stone-path",
    needs_correction = false,
    minable = {hardness = 0.2, mining_time = 0.5, result = "stone-brick"},
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
          hr_version = {
            picture = "__base__/graphics/terrain/stone-path/hr-stone-path-1.png",
            count = 16,
            size = 1,
            scale = 0.5
          }
        },
        {
          picture = "__base__/graphics/terrain/stone-path/stone-path-2.png",
          count = 4,
          size = 2,
          probability = 0.39,
          hr_version = {
            picture = "__base__/graphics/terrain/stone-path/hr-stone-path-2.png",
            count = 16,
            size = 2,
            probability = 0.39,
            scale = 0.5
          }
        },
        {
          picture = "__base__/graphics/terrain/stone-path/stone-path-4.png",
          count = 4,
          size = 4,
          probability = 1,
          hr_version = {
            picture = "__base__/graphics/terrain/stone-path/hr-stone-path-4.png",
            count = 16,
            size = 4,
            probability = 1,
            scale = 0.5
          }
        },
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/stone-path/stone-path-inner-corner.png",
        count = 16,
        tall = true,
        hr_version = {
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
        hr_version = {
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
        hr_version = {
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
        hr_version = {
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
        hr_version = {
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
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.2
      }
    },
    map_color={r=50, g=50, b=50},
    ageing=0,
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
        },
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/out-of-map-inner-corner.png",
        count = 0
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/out-of-map-outer-corner.png",
        count = 0
      },
      side =
      {
        picture = "__base__/graphics/terrain/out-of-map-side.png",
        count = 0
      }
    },
    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.2
      }
    },
    map_color={r=0, g=0, b=0},
    ageing=0.0006
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
        },
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/out-of-map-inner-corner.png",
        count = 0
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/out-of-map-outer-corner.png",
        count = 0
      },
      side =
      {
        picture = "__base__/graphics/terrain/out-of-map-side.png",
        count = 0
      }
    },
    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.2
      }
    },
    map_color={r=0.2, g=0.2, b=0.2},
    ageing=0.0006
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
        },
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/out-of-map-inner-corner.png",
        count = 0
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/out-of-map-outer-corner.png",
        count = 0
      },
      side =
      {
        picture = "__base__/graphics/terrain/out-of-map-side.png",
        count = 0
      }
    },
    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.2
      }
    },
    map_color={r=1, g=1, b=1},
    ageing=0.0006
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
          hr_version = {
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
          hr_version = {
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
        hr_version = {
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
        hr_version = {
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
        hr_version = {
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
        hr_version = {
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
        hr_version = {
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
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.2
      }
    },
    map_color={r=0, g=0, b=0},
    ageing=0.0006
  },
})

if not data.is_demo then
  data:extend(
  {
    {
      type = "tile",
      name = "concrete",
      needs_correction = false,
      minable = {hardness = 0.2, mining_time = 0.5, result = "concrete"},
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
          },
        },
        inner_corner =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-inner-corner.png",
          count = 16,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner.png",
            count = 16,
            scale = 0.5
          },
        },
        inner_corner_mask =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-inner-corner-mask.png",
          count = 16,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner-mask.png",
            count = 16,
            scale = 0.5
          },
        },

        outer_corner =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-outer-corner.png",
          count = 8,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner.png",
            count = 8,
            scale = 0.5
          },
        },
        outer_corner_mask =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
          count = 8,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner-mask.png",
            count = 8,
            scale = 0.5
          },
        },

        side =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-side.png",
          count = 16,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-side.png",
            count = 16,
            scale = 0.5
          },
        },
        side_mask =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-side-mask.png",
          count = 16,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-side-mask.png",
            count = 16,
            scale = 0.5
          },
        },

        u_transition =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-u.png",
          count = 8,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-u.png",
            count = 8,
            scale = 0.5
          },
        },
        u_transition_mask =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-u-mask.png",
          count = 8,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-u-mask.png",
            count = 8,
            scale = 0.5
          },
        },

        o_transition =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-o.png",
          count = 4,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-o.png",
            count = 4,
            scale = 0.5
          },
        },
        o_transition_mask =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-o-mask.png",
          count = 4,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-o-mask.png",
            count = 4,
            scale = 0.5
          },
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
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-02.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-03.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-04.ogg",
          volume = 1.2
        }
      },
      map_color={r=100, g=100, b=100},
      ageing=0,
      vehicle_friction_modifier = concrete_vehicle_speed_modifier
    },
    {
      type = "tile",
      name = "hazard-concrete-left",
      needs_correction = false,
      next_direction = "hazard-concrete-right",
      transition_merges_with_tile = "concrete",
      minable = {hardness = 0.2, mining_time = 0.5, result = "hazard-concrete"},
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
          },
        },

        inner_corner_mask =
        {
          picture = "__base__/graphics/terrain/concrete/hazard-concrete-inner-corner-mask.png",
          count = 1,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-inner-corner-mask.png",
            count = 1,
            scale = 0.5
          }
        },
        outer_corner_mask =
        {
          picture = "__base__/graphics/terrain/concrete/hazard-concrete-outer-corner-mask.png",
          count = 1,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-outer-corner-mask.png",
            count = 1,
            scale = 0.5
          }
        },

        side_mask =
        {
          picture = "__base__/graphics/terrain/concrete/hazard-concrete-side-mask.png",
          count = 1,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-side-mask.png",
            count = 1,
            scale = 0.5
          }
        },

        u_transition_mask =
        {
          picture = "__base__/graphics/terrain/concrete/hazard-concrete-u-mask.png",
          count = 1,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-u-mask.png",
            count = 1,
            scale = 0.5
          }
        },

        o_transition_mask =
        {
          picture = "__base__/graphics/terrain/concrete/hazard-concrete-o-mask.png",
          count = 1,
          hr_version = {
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
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-02.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-03.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-04.ogg",
          volume = 1.2
        }
      },
      map_color={r=0.5, g=0.5, b=0},
      ageing=0,
      vehicle_friction_modifier = concrete_vehicle_speed_modifier
    },
    {
      type = "tile",
      name = "hazard-concrete-right",
      needs_correction = false,
      next_direction = "hazard-concrete-left",
      transition_merges_with_tile = "concrete",
      minable = {hardness = 0.2, mining_time = 0.5, result = "hazard-concrete"},
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
          },
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
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-02.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-03.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-04.ogg",
          volume = 1.2
        }
      },
      map_color={r=0.5, g=0.5, b=0},
      ageing=0,
      vehicle_friction_modifier = concrete_vehicle_speed_modifier
    },
    
    {
      type = "tile",
      name = "refined-concrete",
      needs_correction = false,
      minable = {hardness = 0.2, mining_time = 0.5, result = "refined-concrete"},
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
          },
        },
        inner_corner =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-inner-corner.png",
          count = 16,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner.png",
            count = 16,
            scale = 0.5
          },
        },
        inner_corner_mask =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-inner-corner-mask.png",
          count = 16,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner-mask.png",
            count = 16,
            scale = 0.5
          },
        },

        outer_corner =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-outer-corner.png",
          count = 8,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner.png",
            count = 8,
            scale = 0.5
          },
        },
        outer_corner_mask =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
          count = 8,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner-mask.png",
            count = 8,
            scale = 0.5
          },
        },

        side =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-side.png",
          count = 16,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-side.png",
            count = 16,
            scale = 0.5
          },
        },
        side_mask =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-side-mask.png",
          count = 16,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-side-mask.png",
            count = 16,
            scale = 0.5
          },
        },

        u_transition =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-u.png",
          count = 8,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-u.png",
            count = 8,
            scale = 0.5
          },
        },
        u_transition_mask =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-u-mask.png",
          count = 8,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-u-mask.png",
            count = 8,
            scale = 0.5
          },
        },

        o_transition =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-o.png",
          count = 4,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-o.png",
            count = 4,
            scale = 0.5
          },
        },
        o_transition_mask =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-o-mask.png",
          count = 4,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-concrete-o-mask.png",
            count = 4,
            scale = 0.5
          },
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
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-02.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-03.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-04.ogg",
          volume = 1.2
        }
      },
      map_color={r=100, g=100, b=100},
      ageing=0,
      vehicle_friction_modifier = concrete_vehicle_speed_modifier
    },
    {
      type = "tile",
      name = "refined-hazard-concrete-left",
      needs_correction = false,
      next_direction = "refined-hazard-concrete-right",
      transition_merges_with_tile = "refined-concrete",
      minable = {hardness = 0.2, mining_time = 0.5, result = "refined-hazard-concrete"},
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
          },
        },

        inner_corner_mask =
        {
          picture = "__base__/graphics/terrain/concrete/hazard-concrete-inner-corner-mask.png",
          count = 1,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-inner-corner-mask.png",
            count = 1,
            scale = 0.5
          }
        },
        outer_corner_mask =
        {
          picture = "__base__/graphics/terrain/concrete/hazard-concrete-outer-corner-mask.png",
          count = 1,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-outer-corner-mask.png",
            count = 1,
            scale = 0.5
          }
        },

        side_mask =
        {
          picture = "__base__/graphics/terrain/concrete/hazard-concrete-side-mask.png",
          count = 1,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-side-mask.png",
            count = 1,
            scale = 0.5
          }
        },

        u_transition_mask =
        {
          picture = "__base__/graphics/terrain/concrete/hazard-concrete-u-mask.png",
          count = 1,
          hr_version = {
            picture = "__base__/graphics/terrain/concrete/hr-hazard-concrete-u-mask.png",
            count = 1,
            scale = 0.5
          }
        },

        o_transition_mask =
        {
          picture = "__base__/graphics/terrain/concrete/hazard-concrete-o-mask.png",
          count = 1,
          hr_version = {
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
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-02.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-03.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-04.ogg",
          volume = 1.2
        }
      },
      map_color={r=0.5, g=0.5, b=0},
      ageing=0,
      vehicle_friction_modifier = concrete_vehicle_speed_modifier
    },
    {
      type = "tile",
      name = "refined-hazard-concrete-right",
      needs_correction = false,
      next_direction = "refined-hazard-concrete-left",
      transition_merges_with_tile = "refined-concrete",
      minable = {hardness = 0.2, mining_time = 0.5, result = "refined-hazard-concrete"},
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
          },
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
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-02.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-03.ogg",
          volume = 1.2
        },
        {
          filename = "__base__/sound/walking/concrete-04.ogg",
          volume = 1.2
        }
      },
      map_color={r=0.5, g=0.5, b=0},
      ageing=0,
      vehicle_friction_modifier = concrete_vehicle_speed_modifier
    }
  })
end

local autoplace_utils = require("autoplace_utils")

local function autoplace_settings(noise_layer, rectangles)
  local ret = {}

  if noise_layer then
    ret = {
      {
        influence = 0.1,
        noise_layer = noise_layer,
        noise_persistence = 0.7,
        octaves_difference = -1
      }
    }
  end

  autoplace_utils.peaks(rectangles, ret)

  return { peaks = ret }
end

local grass_vehicle_speed_modifier = 1.6
local dirt_vehicle_speed_modifer = 1.4
local sand_vehicle_speed_modifier = 1.8
local stone_path_vehicle_speed_modifier = 1.1
local concrete_vehicle_speed_modifier = 0.8

function water_autoplace_settings(from_depth, rectangles)
  local ret =
  {
    {
      -- Water and deep water have absolute priority. We simulate this by giving
      -- them absurdly large influence
      influence = 1e3 + from_depth,
      elevation_optimal = -5000 - from_depth,
      elevation_range = 5000,
      elevation_max_range = 5000, -- everywhere below elevation 0 and nowhere else
    }
  }

  if rectangles == nil then
    ret[2] = { influence = 1 }
  end

  autoplace_utils.peaks(rectangles, ret)

  return { peaks = ret }
end

data:extend(
{
  {
    type = "tile",
    name = "out-of-map",
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
    type = "tile",
    name = "deepwater",
    collision_mask =
    {
      "water-tile",
      "resource-layer",
      "item-layer",
      "player-layer",
      "doodad-layer"
    },
    autoplace = water_autoplace_settings(250),
    layer = 45,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater1.png",
          count = 8,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater2.png",
          count = 8,
          size = 2
        },
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater4.png",
          count = 6,
          size = 4
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/deepwater/deepwater-inner-corner.png",
        count = 6
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/deepwater/deepwater-outer-corner.png",
        count = 6
      },
      side =
      {
        picture = "__base__/graphics/terrain/deepwater/deepwater-side.png",
        count = 8
      }
    },
    allowed_neighbors = { "water" },
    map_color={r=0.0941, g=0.2823, b=0.345},
    ageing=0.0006
  },

  {
    type = "tile",
    name = "deepwater-green",
    collision_mask =
    {
      "water-tile",
      "resource-layer",
      "item-layer",
      "player-layer",
      "doodad-layer"
    },
    autoplace = water_autoplace_settings(250, {{{35, 1}, {15, 0.7}}}),
    layer = 45,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/deepwater-green/deepwater-green1.png",
          count = 8,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/deepwater-green/deepwater-green2.png",
          count = 8,
          size = 2
        },
        {
          picture = "__base__/graphics/terrain/deepwater-green/deepwater-green4.png",
          count = 6,
          size = 4
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/deepwater-green/deepwater-green-inner-corner.png",
        count = 6
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/deepwater-green/deepwater-green-outer-corner.png",
        count = 6
      },
      side =
      {
        picture = "__base__/graphics/terrain/deepwater-green/deepwater-green-side.png",
        count = 8
      }
    },
    allowed_neighbors = { "water-green" },
    map_color={r=0.0941, g=0.149, b=0.066},
    ageing=0.0005
  },

  {
    type = "tile",
    name = "water",
    collision_mask =
    {
      "water-tile",
      "item-layer",
      "resource-layer",
      "player-layer",
      "doodad-layer"
    },
    autoplace = water_autoplace_settings(0),
    layer = 40,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/water/water1.png",
          count = 8,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/water/water2.png",
          count = 8,
          size = 2
        },
        {
          picture = "__base__/graphics/terrain/water/water4.png",
          count = 6,
          size = 4
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/water/water-inner-corner.png",
        count = 6
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/water/water-outer-corner.png",
        count = 6
      },
      side =
      {
        picture = "__base__/graphics/terrain/water/water-side.png",
        count = 8
      }
    },
    allowed_neighbors = { "grass" },
    map_color={r=0.0941, g=0.3568, b=0.4196},
    ageing=0.0006
  },

  {
    type = "tile",
    name = "water-green",
    collision_mask =
    {
      "water-tile",
      "item-layer",
      "resource-layer",
      "player-layer",
      "doodad-layer"
    },
    autoplace = water_autoplace_settings(0, {{{35, 1}, {15, 0.7}}}),
    layer = 40,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/water-green/water-green1.png",
          count = 8,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/water-green/water-green2.png",
          count = 8,
          size = 2
        },
        {
          picture = "__base__/graphics/terrain/water-green/water-green4.png",
          count = 6,
          size = 4
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/water-green/water-green-inner-corner.png",
        count = 6
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/water-green/water-green-outer-corner.png",
        count = 6
      },
      side =
      {
        picture = "__base__/graphics/terrain/water-green/water-green-side.png",
        count = 8
      }
    },
    allowed_neighbors = { "grass" },
    map_color={r=31, g=48, b=18},
    ageing=0.0005
  },

  {
    type = "tile",
    name = "grass",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("grass", {{{35, 0.8}, {0, 0.4}}}),
    layer = 20,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/grass/grass1.png",
          count = 16,
          size = 1,
        },
        {
          picture = "__base__/graphics/terrain/grass/grass2.png",
          count = 20,
          size = 2,
          probability = 0.91,
          weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 },
        },
        {
          picture = "__base__/graphics/terrain/grass/grass4.png",
          count = 20,
          line_length = 10,
          size = 4,
          probability = 1,
          weights = {0.100, 0.80, 0.80, 0.100, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01 }
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/grass/grass-inner-corner.png",
        count = 8
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/grass/grass-outer-corner.png",
        count = 8
      },
      side =
      {
        picture = "__base__/graphics/terrain/grass/grass-side.png",
        count = 8
      }
    },
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
    map_color={r=61, g=51, b=17},
    ageing=0.00045,
    vehicle_friction_modifier = grass_vehicle_speed_modifier
  },

  {
    type = "tile",
    name = "grass-medium",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("grass-medium", {{{35, 1}, {10, 0.7}}}),
    layer = 5,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/grass-medium/grass-medium1.png",
          count = 8,
          size = 1,
        },
        {
          picture = "__base__/graphics/terrain/grass-medium/grass-medium2.png",
          count = 20,
          size = 2,
          probability = 0.91,
          weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 },
        },
        {
          picture = "__base__/graphics/terrain/grass-medium/grass-medium4.png",
          count = 20,
          line_length = 10,
          size = 4,
          probability = 1,
          weights = {0.100, 0.80, 0.80, 0.100, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01 }
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/grass-medium/grass-medium-inner-corner.png",
        count = 8
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/grass-medium/grass-medium-outer-corner.png",
        count = 8
      },
      side =
      {
        picture = "__base__/graphics/terrain/grass-medium/grass-medium-side.png",
        count = 8
      }
    },
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
    map_color={r=58, g=47, b=19},
    ageing=0.00045,
    vehicle_friction_modifier = grass_vehicle_speed_modifier
  },

  {
    type = "tile",
    name = "grass-dry",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("grass-dry", {{{35, 0.5}, {10, 0.3}}, {{5, 0.6}, {-10, 0.1}}}),
    layer = 4,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/grass-dry/grass-dry1.png",
          count = 8,
          size = 1,
        },
        {
          picture = "__base__/graphics/terrain/grass-dry/grass-dry2.png",
          count = 16,
          size = 2,
          probability = 0.91,
          weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 },
        },
        {
          picture = "__base__/graphics/terrain/grass-dry/grass-dry4.png",
          count = 20,
          line_length = 10,
          size = 4,
          probability = 1,
          weights = {0.100, 0.80, 0.80, 0.100, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01 }
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/grass-dry/grass-dry-inner-corner.png",
        count = 8
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/grass-dry/grass-dry-outer-corner.png",
        count = 8
      },
      side =
      {
        picture = "__base__/graphics/terrain/grass-dry/grass-dry-side.png",
        count = 8
      }
    },
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
    map_color={r=53, g=38, b=14},
    ageing=0.0004,
    vehicle_friction_modifier = grass_vehicle_speed_modifier
  },

  {
    type = "tile",
    name = "dirt",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("dirt", {{{35, 0.4}, {-10, 0}, 0.95}}),
    layer = 25,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/dirt/dirt1.png",
          count = 22,
          size = 1,
          weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045, 0.005, 0.005, 0.005, 0.005, 0.003, 0.005 }
        },
        {
          picture = "__base__/graphics/terrain/dirt/dirt2.png",
          count = 30,
          size = 2,
          probability = 1,
          weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027, 0.022, 0.032, 0.020, 0.020, 0.030, 0.005, 0.010, 0.002, 0.013, 0.007, 0.007, 0.010, 0.030, 0.030 }
        },
        {
          picture = "__base__/graphics/terrain/dirt/dirt4.png",
          count = 21,
          line_length = 11,
          size = 4,
          probability = 1,
          weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070, 0.070, 0.050, 0.050, 0.050, 0.050 }
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/dirt/dirt-inner-corner.png",
        count = 8
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/dirt/dirt-outer-corner.png",
        count = 8
      },
      side =
      {
        picture = "__base__/graphics/terrain/dirt/dirt-side.png",
        count = 8
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
    map_color={r=132, g=91, b=34},
    ageing=0.00045,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier
  },
  {
    type = "tile",
    name = "dirt-dark",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("dirt-dark", {{{35, 0.4}, {-10, 0}, 0.5}}),
    layer = 26,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/dirt-dark/dirt-dark1.png",
          count = 22,
          size = 1,
          weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045, 0.005, 0.005, 0.005, 0.005, 0.003, 0.005 }
        },
        {
          picture = "__base__/graphics/terrain/dirt-dark/dirt-dark2.png",
          count = 30,
          size = 2,
          probability = 0.94,
          weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027, 0.022, 0.032, 0.020, 0.020, 0.030, 0.005, 0.010, 0.002, 0.013, 0.007, 0.007, 0.010, 0.030, 0.030 }
        },
        {
          picture = "__base__/graphics/terrain/dirt-dark/dirt-dark4.png",
          count = 21,
          line_length = 11,
          size = 4,
          probability = 1,
          weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070, 0.070, 0.050, 0.050, 0.050, 0.050 }
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/dirt-dark/dirt-dark-inner-corner.png",
        count = 8
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/dirt-dark/dirt-dark-outer-corner.png",
        count = 8
      },
      side =
      {
        picture = "__base__/graphics/terrain/dirt-dark/dirt-dark-side.png",
        count = 8
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
    map_color={r=115, g=80, b=29},
    ageing=0.00045,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier
  },

  {
    type = "tile",
    name = "sand",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("sand", {{{35, 0.2}, {0, 0}}}),
    layer = 35,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/sand/sand1.png",
          count = 16,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/sand/sand2.png",
          count = 16,
          size = 2,
          probability = 0.39,
          weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020}
        },
        {
          picture = "__base__/graphics/terrain/sand/sand4.png",
          count = 22,
          line_length = 11,
          size = 4,
          probability = 1,
          weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020, 0.010, 0.100, 0.025, 0.100, 0.100, 0.100}
        },
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/sand/sand-inner-corner.png",
        count = 8
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/sand/sand-outer-corner.png",
        count = 8
      },
      side =
      {
        picture = "__base__/graphics/terrain/sand/sand-side.png",
        count = 8
      }
    },
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
    map_color={r=160, g=126, b=54},
    ageing=0.00025,
    vehicle_friction_modifier = sand_vehicle_speed_modifier
  },

  {
    type = "tile",
    name = "sand-dark",
    collision_mask = {"ground-tile"},
    autoplace = autoplace_settings("sand-dark", {{{35, 0.3}, {-5, 0.1}}}),
    layer = 36,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/sand-dark/sand-dark1.png",
          count = 16,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/sand-dark/sand-dark2.png",
          count = 16,
          size = 2,
          probability = 0.39,
          weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020}
        },
        {
          picture = "__base__/graphics/terrain/sand-dark/sand-dark4.png",
          count = 22,
          line_length = 11,
          size = 4,
          probability = 1,
          weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020, 0.010, 0.100, 0.025, 0.100, 0.100, 0.100}
        },
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/sand-dark/sand-dark-inner-corner.png",
        count = 8
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/sand-dark/sand-dark-outer-corner.png",
        count = 8
      },
      side =
      {
        picture = "__base__/graphics/terrain/sand-dark/sand-dark-side.png",
        count = 8
      }
    },
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
    map_color={r=139, g=104, b=39},
    ageing=0.0002,
    vehicle_friction_modifier = sand_vehicle_speed_modifier
  },
  {
    type = "tile",
    name = "stone-path",
    needs_correction = false,
    minable = {hardness = 0.2, mining_time = 0.5, result = "stone-brick"},
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = {"ground-tile"},
    walking_speed_modifier = 1.3,
    layer = 60,
    decorative_removal_probability = 0.6,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/stone-path/stone-path-1.png",
          count = 16,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/stone-path/stone-path-2.png",
          count = 4,
          size = 2,
          probability = 0.39,
        },
        {
          picture = "__base__/graphics/terrain/stone-path/stone-path-4.png",
          count = 4,
          size = 4,
          probability = 1,
        },
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/stone-path/stone-path-inner-corner.png",
        count = 8
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/stone-path/stone-path-outer-corner.png",
        count = 1
      },
      side =
      {
        picture = "__base__/graphics/terrain/stone-path/stone-path-side.png",
        count = 10
      },
      u_transition =
      {
        picture = "__base__/graphics/terrain/stone-path/stone-path-u.png",
        count = 10
      },
      o_transition =
      {
        picture = "__base__/graphics/terrain/stone-path/stone-path-o.png",
        count = 10
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
    map_color={r=50, g=50, b=50},
    ageing=0,
    vehicle_friction_modifier = stone_path_vehicle_speed_modifier
  }
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
      decorative_removal_probability = 0.9,
      variants =
      {
        main =
        {
          {
            picture = "__base__/graphics/terrain/concrete/concrete1.png",
            count = 16,
            size = 1
          },
          {
            picture = "__base__/graphics/terrain/concrete/concrete2.png",
            count = 4,
            size = 2,
            probability = 0.39,
          },
          {
            picture = "__base__/graphics/terrain/concrete/concrete4.png",
            count = 4,
            size = 4,
            probability = 1,
          },
        },
        inner_corner =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-inner-corner.png",
          count = 8
        },
        outer_corner =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-outer-corner.png",
          count = 8
        },
        side =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-side.png",
          count = 8
        },
        u_transition =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-u.png",
          count = 8
        },
        o_transition =
        {
          picture = "__base__/graphics/terrain/concrete/concrete-o.png",
          count = 1
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
      map_color={r=100, g=100, b=100},
      ageing=0,
      vehicle_friction_modifier = concrete_vehicle_speed_modifier
    }
  })
end

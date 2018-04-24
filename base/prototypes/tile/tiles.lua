function water_autoplace_peaks(from_depth, dark)
  local influence = 1e6

  local add
  if from_depth > 0 then
    add = -1.05 * influence
  else
    add = -1.05 * influence - 10000
  end

  return
  {
    {
      -- Water and deep water have absolute priority. We simulate this by giving
      -- them absurdly large influence
      influence = influence,
      noise_persistence = 0.7,
      elevation_optimal = -5000 - from_depth,
      elevation_range = 5000,
      elevation_max_range = 5000, -- everywhere below elevation 0 and nowhere else
    },
    {
      influence = add,
    },
    {
      influence = dark and influence or -influence,
      noise_layer = "terrain-dark",
      noise_persistence = 0.7,
      noise_octaves_difference = 2,
    }
  }
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
      "player-layer"
    },
    layer = 60,
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
    map_color={r=0, g=0, b=0}
  },
  {
    type = "tile",
    name = "deepwater",
    collision_mask =
    {
      "water-tile",
      "resource-layer",
      "item-layer",
      "player-layer"
    },
    autoplace = {
      peaks = water_autoplace_peaks(250, false)
    },
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
    map_color={r=0.0941, g=0.2823, b=0.345}
  },

  {
    type = "tile",
    name = "deepwater-green",
    collision_mask =
    {
      "water-tile",
      "resource-layer",
      "item-layer",
      "player-layer"
    },
    autoplace = {
      peaks = water_autoplace_peaks(250, true)
    },
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
    map_color={r=0.0941, g=0.149, b=0.066}
  },

  {
    type = "tile",
    name = "water",
    collision_mask =
    {
      "water-tile",
      "item-layer",
      "resource-layer",
      "player-layer"
    },
    autoplace = {
      peaks = water_autoplace_peaks(0, false);
    },
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
    map_color={r=0.0941, g=0.3568, b=0.4196}
  },

  {
    type = "tile",
    name = "water-green",
    collision_mask =
    {
      "water-tile",
      "item-layer",
      "resource-layer",
      "player-layer"
    },
    autoplace = {
      peaks = water_autoplace_peaks(0, true)
    },
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
    map_color={r=31, g=48, b=18}
  },

  {
    type = "tile",
    name = "grass",
    collision_mask = {"ground-tile"},
    autoplace =
    {
      control = "grass",
      peaks =
      {
        {
          influence = 1,
          noise_layer = "grass",
          noise_persistence = 0.6,
        },
        {
          influence = -1,
          noise_layer = "terrain-dark",
          noise_persistence = 0.5,
          noise_octaves_difference = -1,
        },
        {
          influence = 0.3,
          min_influence = 0,
          available_water_optimal = 1,
          available_water_range = 0,
          available_water_max_range = 0.5,
        }
      }
    },
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
        filename = "__base__/sound/walking/grass-01.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-02.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-03.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-04.wav",
        volume = 0.8
      }
    },
    map_color={r=61, g=51, b=17}
  },

  {
    type = "tile",
    name = "grass-medium",
    collision_mask = {"ground-tile"},
    autoplace =
    {
      control = "grass",
      peaks =
      {
        {
          influence = 1,
          noise_layer = "grass",
          noise_persistence = 0.6,
        },
        {
          influence = 1,
          noise_layer = "terrain-dark",
          noise_persistence = 0.5,
          noise_octaves_difference = -1,
        },
      }
    },
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
        filename = "__base__/sound/walking/grass-01.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-02.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-03.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-04.wav",
        volume = 0.8
      }
    },
    map_color={r=58, g=47, b=19}
  },

  {
    type = "tile",
    name = "grass-dry",
    collision_mask = {"ground-tile"},
    autoplace =
    {
      control = "grass",
      peaks =
      {
        {
          influence = 1,
          noise_layer = "grass-dry",
          noise_persistence = 0.6,
        },
      }
    },
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
        filename = "__base__/sound/walking/grass-01.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-02.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-03.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/grass-04.wav",
        volume = 0.8
      }
    },
    map_color={r=53, g=38, b=14}
  },

  {
    type = "tile",
    name = "dirt",
    collision_mask = {"ground-tile"},
    autoplace =
    {
      control = "dirt",
      peaks =
      {
        {
          noise_layer = "dirt",
        },
        {
          influence = -1,
          noise_layer = "terrain-dark",
          noise_persistence = 0.5,
          noise_octaves_difference = -1,
        },
      }
    },
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
        filename = "__base__/sound/walking/dirt-02.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-03.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-04.wav",
        volume = 0.8
      }
    },
    map_color={r=132, g=91, b=34}
  },
  {
    type = "tile",
    name = "dirt-dark",
    collision_mask = {"ground-tile"},
    autoplace =
    {
      control = "dirt",
      peaks =
      {
        {
          noise_layer = "dirt",
        },
        {
          influence = 1,
          noise_layer = "terrain-dark",
          noise_persistence = 0.5,
          noise_octaves_difference = -1,
        },
      }
    },
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
        filename = "__base__/sound/walking/dirt-02.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-03.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/dirt-04.wav",
        volume = 0.8
      }
    },
    map_color={r=115, g=80, b=29}
  },

  {
    type = "tile",
    name = "sand",
    collision_mask = {"ground-tile"},
    autoplace =
    {
      control = "sand",
      peaks =
      {
        {
          noise_layer = "sand",
        },
        {
          influence = -1,
          noise_layer = "terrain-dark",
          noise_persistence = 0.5,
          noise_octaves_difference = -1,
        },
      }
    },
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
        filename = "__base__/sound/walking/sand-01.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/sand-02.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/sand-03.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/sand-04.wav",
        volume = 0.8
      }
    },
    map_color={r=160, g=126, b=54}
  },

  {
    type = "tile",
    name = "sand-dark",
    collision_mask = {"ground-tile"},
    autoplace =
    {
      control = "sand",
      peaks =
      {
        {
          influence = 1,
          noise_layer = "sand",
        },
        {
          influence = 1,
          noise_layer = "terrain-dark",
          noise_persistence = 0.5,
          noise_octaves_difference = -1,
        },
      }
    },
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
        filename = "__base__/sound/walking/sand-01.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/sand-02.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/sand-03.wav",
        volume = 0.8
      },
      {
        filename = "__base__/sound/walking/sand-04.wav",
        volume = 0.8
      }
    },
    map_color={r=139, g=104, b=39}
  }
}
)

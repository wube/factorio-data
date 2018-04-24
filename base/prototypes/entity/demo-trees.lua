local autoplace_utils = require("autoplace_utils")

local function autoplace_settings(rectangles, more)
  local ret =
  {
    sharpness = 0.4,
    order = "a[tree]-b[forest]",
    peaks =
    {
      {
        influence = -0.1
      },
      {
        influence = 0.4,
        noise_layer = "trees",
        noise_persistence = 0.5,
        noise_octaves_difference = -1
      }
    },
  }

  autoplace_utils.peaks(rectangles, ret.peaks, 0.3)

  if more ~= nil then
    for k,v in pairs(more) do ret[k] = v end
  end

  return ret
end

data:extend(
{
  {
    type = "noise-layer",
    name = "trees"
  },

  {
    type = "tree",
    name = "dead-tree",
    icon = "__base__/graphics/icons/dead-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 1,
      result = "raw-wood",
      count = 2
    },
    emissions_per_tick = -0.0001,
    max_health = 20,
    collision_box = {{-0.6, -0.6}, {0.6, 0.6}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    subgroup = "trees",
    order = "a[tree]-d[dead-tree]",
    autoplace =
    {
      order = "b[tree]-a[random]",
      peaks =
      {
        {
          influence = 0.0005
        },
        {
          influence = 0.004,
          min_influence = 0, -- get forrest bonus, but have no penalty for being outside.
          max_influence = 0.003,
          noise_layer = "trees",
          noise_persistence = 0.5,
        }
      }
    },
    pictures =
    {
      {
        filename = "__base__/graphics/entity/tree/dead-tree/dead-tree-01.png",
        width = 108,
        height= 114
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree/dead-tree-02.png",
        width = 155,
        height= 97,
        shift = {0.2, 0.2}
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree/dead-tree-03.png",
        width = 138,
        height= 124,
        shift = {0.4, -0.3}
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree/dead-tree-04.png",
        width = 112,
        height= 123,
        shift = {0, -0.4}
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree/dead-tree-05.png",
        width = 111,
        height= 113,
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree/dead-tree-06.png",
        width = 78,
        height= 83,
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree/dead-tree-07.png",
        width = 90,
        height= 105,
      }
    }
  },

  {
    type = "tree",
    name = "dark-thin-tree",
    icon = "__base__/graphics/icons/dark-thin-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 2,
      result = "raw-wood",
      count = 4
    },
    emissions_per_tick = -0.0001,
    max_health = 20,
    collision_box = {{-0.4, -0.7}, {0.4, 0.9}},
    selection_box = {{-0.9, -2.2}, {0.9, 0.9}},
    subgroup = "trees",
    order = "a[tree]-a[thin-tree]-d[dark]",
    autoplace = autoplace_settings({{{30, 0.4}, {10, 0.3}}},
                                   {
                                    tile_restriction =
                                    {
                                      "dirt",
                                      "dirt-dark",
                                      "sand",
                                      "sand-dark"
                                    }
                                   }),
    pictures =
    {
      {
        filename = "__base__/graphics/entity/tree/dark-thin-tree/dark-thin-tree-01.png",
        width = 197,
        height= 148,
        shift = {1.7, -0.4}

      },
      {
        filename = "__base__/graphics/entity/tree/dark-thin-tree/dark-thin-tree-02.png",
        width = 186,
        height= 138,
        shift = {1.55, -0.1}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-thin-tree/dark-thin-tree-03.png",
        width = 170,
        height= 148,
        shift = {1.25, -0.05}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-thin-tree/dark-thin-tree-04.png",
        width = 184,
        height= 148,
        shift = {1.2, -0.4}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-thin-tree/dark-thin-tree-05.png",
        width = 172,
        height= 170,
        shift = {0.80, -0.3}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-thin-tree/dark-thin-tree-06.png",
        width = 174,
        height= 170,
        shift = {1.0, -0.7}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-thin-tree/dark-thin-tree-07.png",
        width = 238,
        height= 186,
        shift = {2.05, -0.4}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-thin-tree/dark-thin-tree-08.png",
        width = 185,
        height= 162,
        shift = {0.85, -0.15}
      }
    }
  },

  {
    type = "tree",
    name = "dry-tree",
    icon = "__base__/graphics/icons/dry-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      count = 4,
      mining_particle = "wooden-particle",
      mining_time = 1,
      result = "raw-wood"
    },
    emissions_per_tick = -0.0001,
    max_health = 20,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
    selection_box = {{-0.6, -1.5}, {0.6, 0.3}},
    subgroup = "trees",
    order = "a[tree]-e[dry-tree]",
    autoplace =
    {
      order = "b[tree]-a[random]",
      peaks = autoplace_utils.peaks({{{35, 0.3}, {5, 0}, 0.001}},
                                    {
                                      {
                                        influence = 0.0002,
                                        noise_layer = "trees",
                                        noise_persistence = 0.5,
                                      }
                                    })
    },
    pictures =
    {
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-01.png",
        width = 121,
        height= 127,
        shift = {0, -1}
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-02.png",
        width = 150,
        height= 125,
        shift = {1, -1.6}
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-03.png",
        width = 129,
        height= 125,
        shift = {1.3, -1.5}
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-04.png",
        width = 135,
        height= 129,
        shift = {1.7, -0.15}
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-05.png",
        width = 112,
        height= 145,
        shift = {1.2, -1}
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-06.png",
        width = 129,
        height= 104,
        shift = {1.1, -1}
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-07.png",
        width = 199,
        height= 146,
        shift = {1.5, -1.5}
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-08.png",
        width = 157,
        height= 137,
        shift = {1, -0.8}
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-09.png",
        width = 165,
        height= 132,
        shift = {1.5, -1.5}
      },
      {
        filename = "__base__/graphics/entity/tree//dry-tree/dry-tree-10.png",
        width = 139,
        height= 125,
        shift = {0.5, -0.5}
      },
      {
        filename = "__base__/graphics/entity/tree//dry-tree/dry-tree-11.png",
        width = 169,
        height= 101,
        shift = {1, -0.9}
      },
      {
        filename = "__base__/graphics/entity/tree//dry-tree/dry-tree-12.png",
        width = 126,
        height= 99,
        shift = {0.8, -0.7}
      },
      {
        filename = "__base__/graphics/entity/tree//dry-tree/dry-tree-13.png",
        width = 117,
        height= 109,
        shift = {0.4, -0.1}
      },
      {
        filename = "__base__/graphics/entity/tree//dry-tree/dry-tree-14.png",
        width = 136,
        height= 108,
        shift = {0.4, -1.2}
      },
      {
        filename = "__base__/graphics/entity/tree//dry-tree/dry-tree-15.png",
        width = 121,
        height= 117,
        shift = {1, -1.5}
      },
      {
        filename = "__base__/graphics/entity/tree//dry-tree/dry-tree-16.png",
        width = 109,
        height= 110,
        shift = {1.2, -0.6}
      },
      {
        filename = "__base__/graphics/entity/tree//dry-tree/dry-tree-17.png",
        width = 178,
        height= 129,
        shift = {2, -0.1}
      }
    }
  },

  {
    type = "tree",
    name = "green-thin-tree",
    icon = "__base__/graphics/icons/green-thin-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      count = 5,
      mining_particle = "wooden-particle",
      mining_time = 2,
      result = "raw-wood"
    },
    max_health = 50,
    collision_box = {{-0.4, -0.7}, {0.4, 0.9}},
    selection_box = {{-0.9, -2.2}, {0.9, 0.9}},
    drawing_box = {{-0.7, -2.3}, {2, 0.9}},
    emissions_per_tick = -0.0005,
    subgroup = "trees",
    order = "a[tree]-a[thin-tree]-a[green]",
    autoplace = autoplace_settings({{{35, 1}, {0, 0.5}}}),
    pictures =
    {
      {
        filename = "__base__/graphics/entity/tree/green-thin-tree/green-thin-tree-01.png",
        width = 197,
        height= 148,
        shift = {1.7, -0.4}
      },
      {
        filename = "__base__/graphics/entity/tree/green-thin-tree/green-thin-tree-02.png",
        width = 186,
        height= 138,
        shift = {1.55, -0.1}
      },
      {
        filename = "__base__/graphics/entity/tree/green-thin-tree/green-thin-tree-03.png",
        width = 170,
        height= 148,
        shift = {1.25, -0.05}
      },
      {
        filename = "__base__/graphics/entity/tree/green-thin-tree/green-thin-tree-04.png",
        width = 184,
        height= 148,
        shift = {1.2, -0.4}
      },
      {
        filename = "__base__/graphics/entity/tree/green-thin-tree/green-thin-tree-05.png",
        width = 172,
        height= 170,
        shift = {0.80, -0.3}
      },
      {
        filename = "__base__/graphics/entity/tree/green-thin-tree/green-thin-tree-06.png",
        width = 174,
        height= 170,
        shift = {1.0, -0.7}
      },
      {
        filename = "__base__/graphics/entity/tree/green-thin-tree/green-thin-tree-07.png",
        width = 238,
        height= 186,
        shift = {2.05, -0.4}
      },
      {
        filename = "__base__/graphics/entity/tree/green-thin-tree/green-thin-tree-08.png",
        width = 185,
        height= 162,
        shift = {0.85, -0.15}
      }
    },
  },

  {
    type = "tree",
    name = "dark-green-thin-tree",
    icon = "__base__/graphics/icons/dark-green-thin-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      count = 5,
      mining_particle = "wooden-particle",
      mining_time = 2,
      result = "raw-wood"
    },
    max_health = 50,
    collision_box = {{-0.4, -0.7}, {0.4, 0.9}},
    selection_box = {{-0.9, -2.2}, {0.9, 0.9}},
    drawing_box = {{-0.7, -2.3}, {2, 0.9}},
    emissions_per_tick = -0.0005,
    subgroup = "trees",
    order = "a[tree]-a[thin-tree]-b[dark-green]",
    autoplace = autoplace_settings({{{35, 1}, {-5, 0.3}}}),
    pictures =
    {
      {
        filename = "__base__/graphics/entity/tree/dark-green-thin-tree/dark-green-thin-tree-01.png",
        width = 197,
        height= 148,
        shift = {1.7, -0.35}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-green-thin-tree/dark-green-thin-tree-02.png",
        width = 186,
        height= 138,
        shift = {1.55, -0.1}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-green-thin-tree/dark-green-thin-tree-03.png",
        width = 170,
        height= 148,
        shift = {1.3, -0.05}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-green-thin-tree/dark-green-thin-tree-04.png",
        width = 184,
        height= 148,
        shift = {1.25, -0.4}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-green-thin-tree/dark-green-thin-tree-05.png",
        width = 172,
        height= 170,
        shift = {0.85, -0.25}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-green-thin-tree/dark-green-thin-tree-06.png",
        width = 174,
        height= 170,
        shift = {1.0, -0.65}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-green-thin-tree/dark-green-thin-tree-07.png",
        width = 238,
        height= 186,
        shift = {2.05, -0.4}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-green-thin-tree/dark-green-thin-tree-08.png",
        width = 185,
        height= 162,
        shift = {0.85, -0.15}
      }
    },
  },

  {
    type = "tree",
    name = "red-thin-tree",
    icon = "__base__/graphics/icons/red-thin-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      count = 5,
      mining_particle = "wooden-particle",
      mining_time = 2,
      result = "raw-wood"
    },
    max_health = 50,
    collision_box = {{-0.4, -0.7}, {0.4, 0.9}},
    selection_box = {{-0.9, -2.2}, {0.9, 0.9}},
    drawing_box = {{-0.7, -2.3}, {2, 0.9}},
    emissions_per_tick = -0.0005,
    subgroup = "trees",
    order = "a[tree]-a[thin-tree]-c[red]",
    autoplace = autoplace_settings({{{5, 0.5}, {0, 0.2}}}),
    pictures =
    {
      {
        filename = "__base__/graphics/entity/tree/red-thin-tree/red-thin-tree-01.png",
        width = 197,
        height= 148,
        shift = {1.7, -0.3}
      },
      {
        filename = "__base__/graphics/entity/tree/red-thin-tree/red-thin-tree-02.png",
        width = 186,
        height= 138,
        shift = {1.6, -0.1}
      },
      {
        filename = "__base__/graphics/entity/tree/red-thin-tree/red-thin-tree-03.png",
        width = 170,
        height= 148,
        shift = {1.3, 0}
      },
      {
        filename = "__base__/graphics/entity/tree/red-thin-tree/red-thin-tree-04.png",
        width = 184,
        height= 148,
        shift = {1.25, -0.35}
      },
      {
        filename = "__base__/graphics/entity/tree/red-thin-tree/red-thin-tree-05.png",
        width = 172,
        height= 170,
        shift = {0.8, -0.3}
      },
      {
        filename = "__base__/graphics/entity/tree/red-thin-tree/red-thin-tree-06.png",
        width = 174,
        height= 170,
        shift = {0.9, -0.6}
      },
      {
        filename = "__base__/graphics/entity/tree/red-thin-tree/red-thin-tree-07.png",
        width = 238,
        height= 186,
        shift = {2.0, -0.4}
      },
      {
        filename = "__base__/graphics/entity/tree/red-thin-tree/red-thin-tree-08.png",
        width = 185,
        height= 162,
        shift = {0.85, -0.1}
      }
    },
  },

  {
    type = "tree",
    name = "green-tree",
    icon = "__base__/graphics/icons/green-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      count = 5,
      mining_particle = "wooden-particle",
      mining_time = 2,
      result = "raw-wood"
    },
    max_health = 50,
    collision_box = {{-0.4, -0.7}, {0.4, 0.9}},
    selection_box = {{-0.9, -2.2}, {0.9, 0.9}},
    drawing_box = {{-0.7, -2.3}, {2, 0.9}},
    emissions_per_tick = -0.0005,
    subgroup = "trees",
    order = "a[tree]-b[normal]-a[green]",
    autoplace = autoplace_settings({{{30, 0.7}, {10, 0.4}}}),
    pictures =
    {
      {
        filename = "__base__/graphics/entity/tree/green-tree/green-tree-01.png",
        width = 108,
        height= 101,
        shift = {0.8, 0.1}
      },
      {
        filename = "__base__/graphics/entity/tree/green-tree/green-tree-02.png",
        width = 147,
        height= 133,
        shift = {0.95, -0.15}
      },
      {
        filename = "__base__/graphics/entity/tree/green-tree/green-tree-03.png",
        width = 148,
        height= 132,
        shift = {0.8, 0}
      },
      {
        filename = "__base__/graphics/entity/tree/green-tree/green-tree-04.png",
        width = 151,
        height= 128,
        shift = {0.9, -0.2}
      },
      {
        filename = "__base__/graphics/entity/tree/green-tree/green-tree-05.png",
        width = 156,
        height= 133,
        shift = {0.8, -0.2}
      },
      {
        filename = "__base__/graphics/entity/tree/green-tree/green-tree-06.png",
        width = 163,
        height= 129,
        shift = {1.1, -0.3}
      },
      {
        filename = "__base__/graphics/entity/tree/green-tree/green-tree-07.png",
        width = 151,
        height= 135,
        shift = {0.9, -0.3}
      }
    },
  },

  {
    type = "tree",
    name = "dark-green-tree",
    icon = "__base__/graphics/icons/dark-green-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      count = 5,
      mining_particle = "wooden-particle",
      mining_time = 2,
      result = "raw-wood"
    },
    max_health = 50,
     collision_box = {{-0.4, -0.7}, {0.4, 0.9}},
    selection_box = {{-0.9, -2.2}, {0.9, 0.9}},
    drawing_box = {{-0.7, -2.3}, {2, 0.9}},
    emissions_per_tick = -0.0005,
    subgroup = "trees",
    order = "a[tree]-b[normal]-b[dark]",
    autoplace = autoplace_settings({{{30, 0.8}, {15, 0.5}}}),
    pictures =
    {
      {
        filename = "__base__/graphics/entity/tree/dark-green-tree/dark-green-tree-01.png",
        width = 165,
        height= 138,
        shift = {0.6, -0.05}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-green-tree/dark-green-tree-02.png",
        width = 167,
        height= 141,
        shift = {0.7, -0.2}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-green-tree/dark-green-tree-03.png",
        width = 167,
        height= 138,
        shift = {0.9, -0.2}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-green-tree/dark-green-tree-04.png",
        width = 165,
        height= 137,
        shift = {1.05, -0.3}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-green-tree/dark-green-tree-05.png",
        width = 169,
        height= 138,
        shift = {1.3, -0.3}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-green-tree/dark-green-tree-06.png",
        width = 151,
        height= 122,
        shift = {1.1, -0.3}
      },
      {
        filename = "__base__/graphics/entity/tree/dark-green-tree/dark-green-tree-07.png",
        width = 150,
        height= 126,
        shift = {0.55, -0.35}
      }
    },
  },

  {
    type = "tree",
    name = "red-tree",
    icon = "__base__/graphics/icons/red-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      count = 5,
      mining_particle = "wooden-particle",
      mining_time = 2,
      result = "raw-wood"
    },
    max_health = 50,
    collision_box = {{-0.4, -0.7}, {0.4, 0.9}},
    selection_box = {{-0.9, -2.2}, {0.9, 0.9}},
    drawing_box = {{-0.7, -2.3}, {2, 0.9}},
    emissions_per_tick = -0.0005,
    subgroup = "trees",
    order = "a[tree]-c[red-tree]",
    autoplace = autoplace_settings({{{20, 0.5}, {5, 0.3}}}),
    pictures =
    {
      {
        filename = "__base__/graphics/entity/tree/red-tree/red-tree-01.png",
        width = 173,
        height= 206,
        shift = {0.95, -0.2}
      },
      {
        filename = "__base__/graphics/entity/tree/red-tree/red-tree-02.png",
        width = 180,
        height= 218,
       shift = {0.95, -0.25}
      },
      {
        filename = "__base__/graphics/entity/tree/red-tree/red-tree-03.png",
        width = 173,
        height= 240,
        shift = {1.15, -0.5}
      },
      {
        filename = "__base__/graphics/entity/tree/red-tree/red-tree-04.png",
        width = 222,
        height= 232,
        shift = {2.2, -0.15}
      },
      {
        filename = "__base__/graphics/entity/tree/red-tree/red-tree-05.png",
        width = 204,
        height= 210,
        shift = {1.65, -0.35}
      },
    },
  },

  {
    type = "tree",
    name = "root-tree",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    icon = "__base__/graphics/icons/root-tree.png",
    minable =
    {
      count = 5,
      mining_particle = "wooden-particle",
      mining_time = 2,
      result = "raw-wood"
    },
    max_health = 50,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
    selection_box = {{-0.6, -1.5}, {0.6, 0.3}},
    drawing_box = {{-0.7, -2.3}, {2, 0.9}},
    emissions_per_tick = -0.0001,
    subgroup = "trees",
    order = "a[tree]-e[root-tree]",
    autoplace = autoplace_settings({{{35, 1}, {15, 0.7}}},
                                   {
                                     sharpness = 0.2,
                                     max_probability = 0.2
                                   }),
    pictures =
    {
      {
        filename = "__base__/graphics/entity/tree/root-tree/root-tree-01.png",
        width = 148,
        height= 104,
        shift = {0, -0.5}
      },
      {
        filename = "__base__/graphics/entity/tree/root-tree/root-tree-02.png",
        width = 163,
        height= 122,
        shift = {0.8, -0.5}
      },
      {
        filename = "__base__/graphics/entity/tree/root-tree/root-tree-03.png",
        width = 179,
        height= 92,
        shift = {0.7, -0.5}
      },
      {
        filename = "__base__/graphics/entity/tree/root-tree/root-tree-04.png",
        width = 139,
        height= 96,
        shift = {1.0, -0.6}
      },
      {
        filename = "__base__/graphics/entity/tree/root-tree/root-tree-05.png",
        width = 175,
        height= 110,
        shift = {0.4, -0.5}
      },
      {
        filename = "__base__/graphics/entity/tree/root-tree/root-tree-06.png",
        width = 133,
        height= 100,
        shift = {0.4, -0.6}
      },
      {
        filename = "__base__/graphics/entity/tree/root-tree/root-tree-07.png",
        width = 174,
        height= 99,
        shift = {1.6, -0.8}
      },
      {
        filename = "__base__/graphics/entity/tree/root-tree/root-tree-08.png",
        width = 143,
        height= 111,
        shift = {1.25, -0.85}
      },
      {
        filename = "__base__/graphics/entity/tree/root-tree/root-tree-09.png",
        width = 165,
        height= 103,
        shift = {1.0, -0.2}
      },
      {
        filename = "__base__/graphics/entity/tree/root-tree/root-tree-10.png",
        width = 147,
        height= 104,
        shift = {0.8, -0.7}
      },
      {
        filename = "__base__/graphics/entity/tree/root-tree/root-tree-11.png",
        width = 133,
        height= 82,
        shift = {0.8, -0.5}
      },
      {
        filename = "__base__/graphics/entity/tree/root-tree/root-tree-12.png",
        width = 136,
        height= 113,
        shift = {1.0, -0.9}
      }
    }
  },

  {
    type = "tree",
    name = "green-coral",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    icon = "__base__/graphics/icons/green-coral.png",
    minable =
    {
      count = 1,
      mining_particle = "wooden-particle",
      mining_time = 2,
      result = "raw-wood"
    },
    max_health = 50,
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    drawing_box = {{-0.5, -0.5}, {0.5, 0.5}},
    emissions_per_tick = 0,
    subgroup = "trees",
    order = "a[tree]-f[coral]",
    autoplace = autoplace_settings({{{35, 0.4}, {20, 0.2}}}),
    pictures =
    {
      {
        filename = "__base__/graphics/entity/tree/green-coral/green-coral-01.png",
        width = 58,
        height = 69,
        shift = {0.4, -0.4}
      },
      {
        filename = "__base__/graphics/entity/tree/green-coral/green-coral-02.png",
        width = 77,
        height = 97,
        shift = {0.7, -0.05}
      },
      {
        filename = "__base__/graphics/entity/tree/green-coral/green-coral-03.png",
        width = 41,
        height = 54,
        shift = {0.2, 0}
      },
      {
        filename = "__base__/graphics/entity/tree/green-coral/green-coral-04.png",
        width = 63,
        height = 61,
        shift = {0.7, 0.3}
      },
      {
        filename = "__base__/graphics/entity/tree/green-coral/green-coral-05.png",
        width = 63,
        height = 85,
        shift = {-0.1, 0.5}
      },
      {
        filename = "__base__/graphics/entity/tree/green-coral/green-coral-06.png",
        width = 67,
        height = 71
      },
      {
        filename = "__base__/graphics/entity/tree/green-coral/green-coral-07.png",
        width = 89,
        height = 77,
        shift = {-0.2, -0.4}
      }
    }
  },

  {
    type = "tree",
    name = "dead-grey-trunk",
    icon = "__base__/graphics/icons/dead-grey-trunk.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 1,
      result = "raw-wood",
      count = 2
    },
    emissions_per_tick = -0.0001,
    max_health = 20,
    collision_box = {{-0.6, -0.6}, {0.6, 0.6}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    subgroup = "trees",
    order = "wwwwwwwa[tree]-d[dead-tree]",
    autoplace =
    {
      order = "b[tree]-a[random]",
      peaks =
      {
        {
          influence = 0.0005
        },
        {
          influence = 0.004,
          min_influence = 0, -- get forrest bonus, but have no penalty for being outside.
          max_influence = 0.003,
          noise_layer = "trees",
          noise_persistence = 0.5,
        }
      }
    },
    pictures =
    {
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-01.png",
        width = 105,
        height= 96,
    shift = {0.75, -0.46}
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-02.png",
        width = 67,
        height= 87,
    shift = {0.4, 0.43}
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-03.png",
        width = 114,
        height= 67,
    shift = {0.56, -0.25}
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-04.png",
        width = 95,
        height= 85,
        shift = {0.62, 0.21}
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-05.png",
        width = 100,
        height= 112,
    shift = {0.84, -0.84}
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-06.png",
        width = 96,
        height= 82,
    shift = {0.0, -0.5}
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-07.png",
        width = 143,
        height= 55,
    shift = {-0.46, 0.0}
      },
    }
  },

  {
    type = "tree",
    name = "dry-hairy-tree",
    icon = "__base__/graphics/icons/dry-hairy-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 1,
      result = "raw-wood",
      count = 2
    },
    emissions_per_tick = -0.0001,
    max_health = 20,
    collision_box = {{-0.6, -0.6}, {0.6, 0.6}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    subgroup = "trees",
    order = "a[tree]-d[dead-tree]",
    autoplace =
    {
      order = "b[tree]-a[random]",
      peaks =
      {
        {
          influence = 0.0005
        },
        {
          influence = 0.004,
          min_influence = 0, -- get forrest bonus, but have no penalty for being outside.
          max_influence = 0.003,
          noise_layer = "trees",
          noise_persistence = 0.5,
        }
      }
    },
    pictures =
    {
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-01.png",
        width = 201,
        height= 242,
        shift = {1.9, -0.68}
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-02.png",
        width = 307,
        height= 256,
        shift = {2.62, -0.68}
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-03.png",
        width = 286,
        height= 240,
        shift = {0.56, -1.5}
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-04.png",
        width = 291,
        height= 229,
        shift = {3.5, -2.0}
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-05.png",
        width = 265,
        height= 264,
        shift = {3.2, -0.46}
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-06.png",
        width = 312,
        height= 267,
        shift = {2.59, -1.34}
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-07.png",
        width = 294,
        height= 213,
        shift = {3.37, -0.25}
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-08.png",
        width = 284,
        height= 217,
        shift = {2.28, -1.25}
      }
    }
  },

  {
    type = "tree",
    name = "dead-dry-hairy-tree",
    icon = "__base__/graphics/icons/dead-dry-hairy-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 1,
      result = "raw-wood",
      count = 2
    },
    emissions_per_tick = -0.0001,
    max_health = 20,
    collision_box = {{-0.6, -0.6}, {0.6, 0.6}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    subgroup = "trees",
    order = "a[tree]-d[dead-tree]",
    autoplace =
    {
      order = "b[tree]-a[random]",
      peaks =
      {
        {
          influence = 0.0005
        },
        {
          influence = 0.004,
          min_influence = 0, -- get forrest bonus, but have no penalty for being outside.
          max_influence = 0.003,
          noise_layer = "trees",
          noise_persistence = 0.5,
        }
      }
    },
    pictures =
    {
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-01.png",
        width = 220,
        height= 126,
        shift = {-1.78, 0.93}
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-02.png",
        width = 214,
        height= 144,
        shift = {-0.93, -1.25}
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-03.png",
        width = 195,
        height= 173,
        shift = {1.78, -1.56}
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-04.png",
        width = 241,
        height= 114,
        shift = {2.81, 0.25}
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-05.png",
        width = 188,
        height= 147,
        shift = {2.06, 2.09}
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-06.png",
        width = 166,
        height= 150,
        shift = {-1.56, 1.25}
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-07.png",
        width = 227,
        height= 99,
        shift = {-2.18, -0.87}
      },
    }
  },


})

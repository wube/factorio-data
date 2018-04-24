local autoplace_utils = require("autoplace_utils")
local function autoplace_settings(noise_layer, max_probability, rectangles, more)
  local ret =
  {
    order = "a[doodad]-z[other]",
    max_probability = max_probability,
    peaks = {}
  }

  if noise_layer ~= nil then
    ret["sharpness"] = 0.3
    ret.peaks[#ret.peaks + 1] =
    {
      influence = 0.4,
      noise_layer = noise_layer,
      noise_persistence = 0.9,
      noise_octaves_difference = -2,
    }
    ret.peaks[#ret.peaks + 1] =
    {
      influence = -0.3,
    }
  end

  if rectangles == nil then
    ret.peaks[#ret.peaks + 1] =
    {
      influence = 0.5,
    }
  else
    autoplace_utils.peaks(rectangles, ret.peaks, 0.5)
  end

  if more ~= nil then
    for k,v in pairs(more) do ret[k] = v end
  end

  return ret
end

local grass_peaks =
{
  {{30, 0.9}, {20, 0.8}, 0.6},
  {{15, 0.5}, {10, 0.4}, 0.6},
  {{20, 0.2}, {15, 0.1}, 0.6}
}

data:extend(
{
  {
    type = "noise-layer",
    name = "pita"
  },
  {
    type = "noise-layer",
    name = "pita-mini"
  },
  {
    type = "noise-layer",
    name = "brown-cane"
  },
  {
    type = "noise-layer",
    name = "coral"
  },
  {
    type = "noise-layer",
    name = "fluff"
  },
  {
    type = "noise-layer",
    name = "garballo"
  },
  {
    type = "noise-layer",
    name = "garballo-mini"
  },
  {
    type = "noise-layer",
    name = "garballo-mini"
  },
  {
    type = "noise-layer",
    name = "grass1"
  },
  {
    type = "noise-layer",
    name = "grass2"
  },

  {
    type = "optimized-decorative",
    name = "brown-asterisk",
    icon = "__base__/graphics/icons/brown-asterisk.png",
    subgroup = "grass",
    order = "b[decorative]-b[asterisk]-a[brown]",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    render_layer = "decorative",
    autoplace = autoplace_settings(nil, 0.02, {{{35, 0.5}, {-15, 0.1}}}),
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-01.png",
        width = 30,
        height = 26,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-02.png",
        width = 24,
        height = 27,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-03.png",
        width = 27,
        height = 23,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-04.png",
        width = 35,
        height = 26,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-05.png",
        width = 30,
        height = 25,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-06.png",
        width = 46,
        height = 32,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-07.png",
        width = 46,
        height = 31,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-08.png",
        width = 18,
        height = 15,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-09.png",
        width = 21,
        height = 14,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-10.png",
        width = 16,
        height = 17,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-11.png",
        width = 20,
        height = 18,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-12.png",
        width = 21,
        height = 18,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-13.png",
        width = 22,
        height = 19,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-14.png",
        width = 28,
        height = 22,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-15.png",
        width = 30,
        height = 21,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-16.png",
        width = 26,
        height = 22,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-17.png",
        width = 22,
        height = 15,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-18.png",
        width = 21,
        height = 27,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-19.png",
        width = 21,
        height = 20,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-20.png",
        width = 71,
        height = 58,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-21.png",
        width = 78,
        height = 59,
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-22.png",
        width = 56,
        height = 49,
      },
    }
  },

  {
    type = "optimized-decorative",
    name = "green-asterisk",
    icon = "__base__/graphics/icons/green-asterisk.png",
    subgroup = "grass",
    order = "b[decorative]-b[asterisk]-b[green]",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    render_layer = "decorative",
    autoplace = autoplace_settings(nil, 0.05, {{{35, 1}, {0, 0.7}}}),
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-01.png",
        width = 25,
        height = 24,
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-02.png",
        width = 25,
        height = 22,
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-03.png",
        width = 29,
        height = 21,
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-04.png",
        width = 27,
        height = 23,
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-05.png",
        width = 38,
        height = 24,
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-06.png",
        width = 32,
        height = 22,
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-07.png",
        width = 40,
        height = 21,
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-08.png",
        width = 40,
        height = 29,
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-09.png",
        width = 33,
        height = 26,
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-10.png",
        width = 24,
        height = 14,
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-11.png",
        width = 22,
        height = 28,
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-12.png",
        width = 20,
        height = 20,
      },
    }
  },
  {
    type = "optimized-decorative",
    name = "red-asterisk",
    icon = "__base__/graphics/icons/red-asterisk.png",
    subgroup = "grass",
    order = "b[decorative]-b[asterisk]-c[red]",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    render_layer = "decorative",
    autoplace = autoplace_settings(nil, 0.05, {{{35, 0.7}, {-5, 0.4}}}),
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-01.png",
        width = 31,
        height = 29,
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-02.png",
        width = 24,
        height = 27,
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-03.png",
        width = 28,
        height = 24,
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-04.png",
        width = 36,
        height = 24,
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-05.png",
        width = 30,
        height = 28,
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-06.png",
        width = 32,
        height = 21,
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-07.png",
        width = 29,
        height = 26,
      },
    }
  },
  {
    type = "optimized-decorative",
    name = "green-pita",
    icon = "__base__/graphics/icons/green-pita.png",
    subgroup = "grass",
    order = "b[decorative]-c[pita]-a[green]",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "object",
    selectable_in_game = false,
    autoplace =
    {
      sharpness = 0.9,
      order = "a[doodad]-b[pita]",
      peaks = autoplace_utils.peaks(
      {
        {
          {20, 0.3},
          {0, 0.1},
          0.5
        }
      },
      {
        {
          influence = -0.3
        },
        {
          influence = 0.7,
          noise_layer = "pita",
          noise_persistence = 0.5,
          noise_octaves_difference = -2
        },
        {
          influence = -0.01,
          noise_layer = "pita-mini",
          noise_persistence = 0.9,
          noise_octaves_difference = -3
        },
      })
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-01.png",
        width = 60,
        height = 49,
        shift = {0, 0.25}
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-02.png",
        width = 62,
        height = 46,
        shift = {0, 0.25}
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-03.png",
        width = 57,
        height = 56,
        shift = {0, 0.25}
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-04.png",
        width = 60,
        height = 54,
        shift = {0, 0.25}
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-05.png",
        width = 60,
        height = 49,
        shift = {0, 0.25}
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-06.png",
        width = 57,
        height = 47,
        shift = {0, 0.25}
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-07.png",
        width = 59,
        height = 51,
        shift = {0, 0.25}
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-08.png",
        width = 60,
        height = 46,
        shift = {0, 0.25}
      }
    }
  },
  {
    type = "optimized-decorative",
    name = "green-pita-mini",
    icon = "__base__/graphics/icons/green-pita-mini.png",
    subgroup = "grass",
    order = "b[decorative]-d[pita-mini]-a[green]",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "decorative",
    selectable_in_game = false,
    autoplace =
    {
      sharpness = 0.9,
      order = "a[doodad]-b[pita]",
      peaks = autoplace_utils.peaks(
      {
        {
          {20, 0.3},
          {0, 0},
          0.5
        }
      },
      {
        {
          influence = -0.3
        },
        {
          influence = 0.7,
          noise_layer = "pita",
          noise_persistence = 0.5,
          noise_octaves_difference = -2
        },
        {
          influence = 0.01,
          noise_layer = "pita-mini",
          noise_persistence = 0.9,
          noise_octaves_difference = -3
        },
      })
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-01.png",
        width = 32,
        height = 29
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-02.png",
        width = 37,
        height = 28
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-03.png",
        width = 35,
        height = 28
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-04.png",
        width = 32,
        height = 28
      }
    }
  },
  {
    type = "optimized-decorative",
    name = "brown-cane-cluster",
    icon = "__base__/graphics/icons/brown-cane-cluster.png",
    subgroup = "grass",
    order = "b[decorative]-e[cane]-a[cluster]-a[brown]",
    collision_box = {{-1.5, -0.7}, {1.5, 0.7}},
    selection_box = {{-1.3, -0.7}, {1.3, 0.7}},
    render_layer = "object",
    selectable_in_game = false,
    autoplace =
    {
      order = "a[doodad]-c[cane]",
      max_probability = 0.1,
      sharpness = 1,
      peaks = autoplace_utils.peaks(
      {
        {
          {35, 0.7},
          {10, 0.7}
        }
      },
      {
        {
          influence = 1,
          noise_layer = "brown-cane",
          noise_persistence = 0.5,
          noise_octaves_difference = -2
        },
        {
          influence = -0.5,
        },
      })
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/brown-cane-cluster/brown-cane-cluster-01.png",
        width = 131,
        height = 146,
        shift = {0.5, -0.3}
      },
      {
        filename = "__base__/graphics/decorative/brown-cane-cluster/brown-cane-cluster-02.png",
        width = 154,
        height = 176,
        shift = {0.6, -0.4}
      },
      {
        filename = "__base__/graphics/decorative/brown-cane-cluster/brown-cane-cluster-03.png",
        width = 264,
        height = 156,
        shift = {0.7, -0.2}
      },
      {
        filename = "__base__/graphics/decorative/brown-cane-cluster/brown-cane-cluster-04.png",
        width = 119,
        height = 138,
        shift = {0.4, -0.3}
      },
      {
        filename = "__base__/graphics/decorative/brown-cane-cluster/brown-cane-cluster-05.png",
        width = 140,
        height = 230,
        shift = {0.4, 0}
      }
    }
  },
  {
    type = "optimized-decorative",
    name = "brown-cane-single",
    icon = "__base__/graphics/icons/brown-cane-single.png",
    subgroup = "grass",
    order = "b[decorative]-e[cane]-b[single]-a[brown]",
    collision_box = {{-0.9, -0.7}, {0.9, 0.7}},
    selection_box = {{-0.7, -0.5}, {0.7, 0.5}},
    render_layer = "object",
    selectable_in_game = false,
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/brown-cane-single/brown-cane-single-01.png",
        width = 56,
        height = 60,
        shift = {0.6, -0.4}
      },
      {
        filename = "__base__/graphics/decorative/brown-cane-single/brown-cane-single-02.png",
        width = 44,
        height = 43,
        shift = {0.3, 0}
      },
      {
        filename = "__base__/graphics/decorative/brown-cane-single/brown-cane-single-03.png",
        width = 48,
        height = 51,
        shift = {0.3, 0}
      },
      {
        filename = "__base__/graphics/decorative/brown-cane-single/brown-cane-single-04.png",
        width = 45,
        height = 37
      },
      {
        filename = "__base__/graphics/decorative/brown-cane-single/brown-cane-single-05.png",
        width = 81,
        height = 57,
        shift = {0.9, -0.4}
      },
      {
        filename = "__base__/graphics/decorative/brown-cane-single/brown-cane-single-06.png",
        width = 31,
        height = 94,
        shift = {0.1, 0.4}
      }
    }
  },
  {
    type = "optimized-decorative",
    name = "green-coral-mini",
    icon = "__base__/graphics/icons/green-coral-mini.png",
    subgroup = "grass",
    order = "b[decorative]-f[coral]-b[mini]-a[green]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "object",
    selectable_in_game = false,
    autoplace = autoplace_settings("coral", 0.15, {{{35, 0.4}, {30, 0.2}}}),
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/green-coral-mini/green-coral-mini-01.png",
        width = 52,
        height = 57,
        shift = {0, 0.3}
      },
      {
        filename = "__base__/graphics/decorative/green-coral-mini/green-coral-mini-02.png",
        width = 20,
        height = 27
      },
      {
        filename = "__base__/graphics/decorative/green-coral-mini/green-coral-mini-03.png",
        width = 37,
        height = 39,
        shift = {0.2, 0}
      },
      {
        filename = "__base__/graphics/decorative/green-coral-mini/green-coral-mini-04.png",
        width = 46,
        height = 49,
        shift = {0.4, 0.3}
      },
      {
        filename = "__base__/graphics/decorative/green-coral-mini/green-coral-mini-05.png",
        width = 33,
        height = 54,
        shift = {0.2, 0.2}
      },
      {
        filename = "__base__/graphics/decorative/green-coral-mini/green-coral-mini-06.png",
        width = 34,
        height = 41,
        shift = {-0.1, 0}
      }
    }
  },
  {
    type = "optimized-decorative",
    name = "brown-coral-mini",
    icon = "__base__/graphics/icons/brown-coral-mini.png",
    subgroup = "grass",
    order = "b[decorative]-f[coral]-b[mini]-b[brown]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "object",
    selectable_in_game = false,
    autoplace = autoplace_settings("coral", 0.1, {{{30, 0.2}, {10, 0.1}}}),
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/brown-coral-mini/brown-coral-mini-01.png",
        width = 39,
        height = 40
      },
      {
        filename = "__base__/graphics/decorative/brown-coral-mini/brown-coral-mini-02.png",
        width = 18,
        height = 23
      }
    }
  },
  {
    type = "optimized-decorative",
    name = "orange-coral-mini",
    icon = "__base__/graphics/icons/orange-coral-mini.png",
    subgroup = "grass",
    order = "b[decorative]-f[coral]-b[mini]-c[orange]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "object",
    selectable_in_game = false,
    autoplace = autoplace_settings("coral", 0.15, {{{35, 0.4}, {20, 0.2}}}),
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/orange-coral-mini/orange-coral-mini-01.png",
        width = 50,
        height = 58,
        shift = {0, 0.3}
      },
      {
        filename = "__base__/graphics/decorative/orange-coral-mini/orange-coral-mini-02.png",
        width = 21,
        height = 28,
        shift = {0.1, 0}
      },
      {
        filename = "__base__/graphics/decorative/orange-coral-mini/orange-coral-mini-03.png",
        width = 39,
        height = 39,
        shift = {0.3, 0}
      },
      {
        filename = "__base__/graphics/decorative/orange-coral-mini/orange-coral-mini-04.png",
        width = 47,
        height = 50,
        shift = {0.6, 0.35}
      },
      {
        filename = "__base__/graphics/decorative/orange-coral-mini/orange-coral-mini-05.png",
        width = 33,
        height = 55,
        shift = {0.25, 0.2}
      },
      {
        filename = "__base__/graphics/decorative/orange-coral-mini/orange-coral-mini-06.png",
        width = 36,
        height = 42
      }
    }
  },
  {
    type = "optimized-decorative",
    name = "brown-fluff",
    icon = "__base__/graphics/icons/brown-fluff.png",
    subgroup = "grass",
    order = "b[decorative]-g[fluff]-a[normal]-a[brown]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    autoplace =
    {
      order = "a[doodad]-d[fluff]",
      sharpness = 1,
      placement_density = 3,
      peaks = autoplace_utils.peaks({{{35, 0.7}, {-5, 0.4}, 0.5}},
      {
        {
          influence = 0.7,
          noise_layer = "fluff",
          noise_octaves_difference = -2,
          noise_persistence = 0.9
        },
        {
          influence = -0.25
        },
      }),
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-01.png",
        width = 21,
        height = 21
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-02.png",
        width = 30,
        height = 17
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-03.png",
        width = 27,
        height = 21
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-04.png",
        width = 23,
        height = 19
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-05.png",
        width = 28,
        height = 21
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-06.png",
        width = 32,
        height = 20
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-07.png",
        width = 22,
        height = 21
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-08.png",
        width = 27,
        height = 32
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-09.png",
        width = 27,
        height = 32
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-10.png",
        width = 22,
        height = 19
      }
    }
  },
  {
    type = "optimized-decorative",
    name = "brown-fluff-dry",
    icon = "__base__/graphics/icons/brown-fluff-dry.png",
    subgroup = "grass",
    order = "b[decorative]-g[fluff]-b[dry]-a[brown]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    autoplace =
    {
      order = "a[doodad]-d[fluff]",
      sharpness = 1,
      placement_density = 3,
      peaks = autoplace_utils.peaks({{{35, 0.5}, {-15, 0.1}, 0.5}},
      {
        {
          influence = 0.7,
          noise_layer = "fluff",
          noise_octaves_difference = -2,
          noise_persistence = 0.9
        },
        {
          influence = -0.3
        },
      }),
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-01.png",
        width = 19,
        height = 21
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-02.png",
        width = 31,
        height = 17
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-03.png",
        width = 27,
        height = 23
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-04.png",
        width = 24,
        height = 23
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-05.png",
        width = 25,
        height = 29
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-06.png",
        width = 25,
        height = 20
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-07.png",
        width = 31,
        height = 20
      }
    }
  },
  {
    type = "optimized-decorative",  
    name = "garballo",
    icon = "__base__/graphics/icons/garballo.png",
    subgroup = "grass",
    order = "b[decorative]-i[garballo]-a[normal]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "object",
    selectable_in_game = false,
    autoplace =
    {
      order = "a[doodad]-e[garballo]",
      sharpness = 1,
      max_probability = 0.8,
      peaks = autoplace_utils.peaks(
      {
        {{30, 0.5}, {20, 0.3}, 0.4}
      },
      {
        {
          influence = 0.47,
          noise_layer = "garballo",
          noise_octaves_difference = -2,
          noise_persistence = 0.8
        },
        {
          influence = 0.3,
          min_influence = 0,
          elevation_optimal = 5,
          elevation_range = 0,
          elevation_max_range = 10,
        },
        {
          influence = -0.01,
          noise_layer = "garballo-mini",
          noise_persistence = 0.9,
          noise_octaves_difference = -3
        },
      }),
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/garballo/garballo-01.png",
        width = 50,
        height = 39
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-02.png",
        width = 53,
        height = 40
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-03.png",
        width = 29,
        height = 34
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-04.png",
        width = 44,
        height = 43,
        shift = {0.2, 0}
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-05.png",
        width = 48,
        height = 46
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-06.png",
        width = 59,
        height = 49
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-07.png",
        width = 54,
        height = 58,
        shift = {0.3, 0.2}
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-08.png",
        width = 42,
        height = 36
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-09.png",
        width = 58,
        height = 45
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-10.png",
        width = 58,
        height = 39
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-11.png",
        width = 71,
        height = 54,
        shift = {0.3, 0.2}
      },
    }
  },
  {
    type = "optimized-decorative",
    name = "garballo-mini-dry",
    icon = "__base__/graphics/icons/garballo-mini-dry.png",
    subgroup = "grass",
    order = "b[decorative]-i[garballo]-a[mini-dry]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "object",
    selectable_in_game = false,
    autoplace =
    {
      order = "a[doodad]-e[garballo]",
      sharpness = 1,
      max_probability = 0.8,
      peaks = autoplace_utils.peaks(
      {
        {{30, 0.5}, {20, 0.3}, 0.3}
      },
      {
        {
          influence = 0.57,
          noise_layer = "garballo",
          noise_octaves_difference = -2,
          noise_persistence = 0.8
        },
        {
          influence = 0.3,
          min_influence = 0,
          elevation_optimal = 10,
          elevation_range = 0,
          elevation_max_range = 10,
        },
        {
          influence = 0.01,
          noise_layer = "garballo-mini",
          noise_persistence = 0.9,
          noise_octaves_difference = -3
        },
      }),
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-01.png",
        width = 18,
        height = 25
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-02.png",
        width = 27,
        height = 25
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-03.png",
        width = 31,
        height = 21
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-04.png",
        width = 31,
        height = 25
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-05.png",
        width = 31,
        height = 24
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-06.png",
        width = 21,
        height = 27
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-07.png",
        width = 25,
        height = 28
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-08.png",
        width = 26,
        height = 32
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-09.png",
        width = 23,
        height = 24
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-10.png",
        width = 29,
        height = 26
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-11.png",
        width = 43,
        height = 34
      }
    }
  },
  {
    type = "optimized-decorative",
    name = "green-bush-mini",
    icon = "__base__/graphics/icons/green-bush-mini.png",
    subgroup = "grass",
    order = "b[decorative]-j[bush]-a[mini]-a[green]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    autoplace =
    {
      order = "a[doodad]-e[garballo]",
      sharpness = 1,
      max_probability = 0.8,
      peaks = autoplace_utils.peaks(
      {
        {{30, 0.5}, {20, 0.3}, 0.3}
      },
      {
        {
          influence = 0.57,
          noise_layer = "garballo",
          noise_octaves_difference = -2,
          noise_persistence = 0.8
        },
        {
          influence = 0.3,
          min_influence = 0,
          elevation_optimal = 5,
          elevation_range = 0,
          elevation_max_range = 10,
        },
        {
          influence = 0.01
        },
        {
          influence = 0.005,
          max_influence = 0,
          noise_layer = "garballo-mini",
          noise_persistence = 0.9,
          noise_octaves_difference = -3
        },
        {
          influence = -0.005,
          max_influence = 0,
          noise_layer = "garballo-mini",
          noise_persistence = 0.9,
          noise_octaves_difference = -3
        },
      }),
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-01.png",
        width = 33,
        height = 24
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-02.png",
        width = 30,
        height = 21
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-03.png",
        width = 50,
        height = 26
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-04.png",
        width = 31,
        height = 22
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-05.png",
        width = 16,
        height = 15
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-06.png",
        width = 17,
        height = 15
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-07.png",
        width = 33,
        height = 18
      }
    }
  },
  {
    type = "optimized-decorative",
    name = "green-hairy-grass",
    icon = "__base__/graphics/icons/green-hairy-grass.png",
    subgroup = "grass",
    order = "b[decorative]-a[grass]-a[hairy]",
    collision_box = {{-1, -1}, {1, 1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    autoplace =
    {
      order = "a[doodad]-f[grass]-b",
      sharpness = 0.2,
      max_probability = 0.01,
      peaks = autoplace_utils.peaks(grass_peaks,
      {
        {
          influence = 0.3,
          noise_layer = "grass2",
          noise_octaves_difference = -2.8,
          noise_persistence = 0.5
        },
      }),
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-01.png",
        width = 87,
        height = 28
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-02.png",
        width = 45,
        height = 26
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-03.png",
        width = 43,
        height = 38
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-04.png",
        width = 49,
        height = 29
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-05.png",
        width = 61,
        height = 29
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-06.png",
        width = 27,
        height = 27
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-07.png",
        width = 33,
        height = 34
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-08.png",
        width = 38,
        height = 30
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-09.png",
        width = 33,
        height = 35
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-10.png",
        width = 39,
        height = 46
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-11.png",
        width = 93,
        height = 47
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-12.png",
        width = 40,
        height = 47
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-13.png",
        width = 52,
        height = 43
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-14.png",
        width = 41,
        height = 42
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-15.png",
        width = 39,
        height = 36
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-16.png",
        width = 41,
        height = 22
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-17.png",
        width = 53,
        height = 18
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-18.png",
        width = 20,
        height = 26
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-19.png",
        width = 29,
        height = 25
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-20.png",
        width = 54,
        height = 31
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-21.png",
        width = 61,
        height = 39
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-22.png",
        width = 29,
        height = 19
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-23.png",
        width = 34,
        height = 23
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-24.png",
        width = 60,
        height = 27
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-25.png",
        width = 93,
        height = 55
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-26.png",
        width = 43,
        height = 30
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-27.png",
        width = 103,
        height = 43
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-28.png",
        width = 40,
        height = 44
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-29.png",
        width = 50,
        height = 29
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-30.png",
        width = 47,
        height = 53
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-31.png",
        width = 60,
        height = 44
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-32.png",
        width = 88,
        height = 40
      }
    }
  },
  {
    type = "optimized-decorative",
    name = "green-carpet-grass",
    icon = "__base__/graphics/icons/green-carpet-grass.png",
    subgroup = "grass",
    order = "b[decorative]-a[grass]-b[carpet]",
    collision_box = {{-2, -2}, {2, 2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selectable_in_game = false,
    autoplace =
    {
      order = "a[doodad]-f[grass]-c",
      sharpness = 0.7,
      max_probability = 0.01,
      peaks = autoplace_utils.peaks(grass_peaks,
      {
        {
          influence = 0.3,
          noise_layer = "grass1",
          noise_octaves_difference = -2.8,
          noise_persistence = 0.5
        },
      }),
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-01.png",
        width = 105,
        height = 73,
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-02.png",
        width = 185,
        height = 164,
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-03.png",
        width = 173,
        height = 171,
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-04.png",
        width = 106,
        height = 172,
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-05.png",
        width = 204,
        height = 186,
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-06.png",
        width = 149,
        height = 138,
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-07.png",
        width = 173,
        height = 160,
      },
    }
  },
  {
    type = "optimized-decorative",
    name = "red-desert-bush",
    icon = "__base__/graphics/icons/brown-fluff.png",
    subgroup = "grass",
    order = "b[decorative]-g[red-desert-bush]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    autoplace =
    {
      order = "a[doodad]-d[fluff]",
      sharpness = 1,
      placement_density = 1,
      peaks = autoplace_utils.peaks({{{5, 0.4}, {-25, 0}, 0.5}},
      {
        {
          influence = 0.7,
          noise_layer = "red-desert",
          noise_octaves_difference = -2,
          noise_persistence = 0.9
        },
        {
          influence = -0.25
        },
        {
          influence = 0.7,
          noise_layer = "red-desert-dark",
          noise_octaves_difference = -2,
          noise_persistence = 0.9
        },
        {
          influence = -0.25
        },
      }),
    },
    pictures =
    {
      sheet =
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bushes.png",
        line_length = 4,
        width = 65,
        height = 43,
        variation_count = 12,
        axially_symmetrical = false,
        direction_count = 1,
        shift = {0.171875, -0.171875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bushes.png",
          line_length = 4,
          width = 128,
          height = 84,
          variation_count = 12,
          axially_symmetrical = false,
          direction_count = 1,
          shift = {0.171875, -0.171875},
          scale = 0.5,
        },
      },
    }
  },
  {
    type = "optimized-decorative",
    name = "green-small-grass",
    icon = "__base__/graphics/icons/green-small-grass.png",
    subgroup = "grass",
    order = "b[decorative]-a[grass]-c[small]",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selection_box = {{-1, -1}, {1, 1}},
    selectable_in_game = false,
    autoplace =
    {
      order = "a[doodad]-f[grass]-d",
      sharpness = 0.2,
      max_probability = 0.01,
      peaks = autoplace_utils.peaks(grass_peaks,
      {
        {
          influence = 0.35,
          noise_layer = "grass1",
          noise_octaves_difference = -2.8,
          noise_persistence = 0.5
        },
      }),
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-01.png",
        width = 91,
        height = 42
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-02.png",
        width = 38,
        height = 36
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-03.png",
        width = 65,
        height = 51
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-04.png",
        width = 65,
        height = 37
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-05.png",
        width = 46,
        height = 31
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-06.png",
        width = 56,
        height = 36
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-07.png",
        width = 27,
        height = 24
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-08.png",
        width = 57,
        height = 27
      }
    }
  },
  {
    type = "optimized-decorative",
    name = "root-A",
    icon = "__base__/graphics/icons/root-a.png",
    subgroup = "grass",
    order = "b[decorative]-h[root]-a[small]",
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selectable_in_game = false,
    autoplace =
    {
      order = "a[doodad]-z[other]",
      influence = 0.01
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/roots/root-A-01.png",
        width = 22,
        height = 10,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-02.png",
        width = 9,
        height = 11,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-03.png",
        width = 11,
        height = 10,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-04.png",
        width = 13,
        height = 17,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-05.png",
        width = 15,
        height = 11,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-06.png",
        width = 14,
        height = 13,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-07.png",
        width = 15,
        height = 13,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-08.png",
        width = 12,
        height = 15,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-09.png",
        width = 22,
        height = 16,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-10.png",
        width = 11,
        height = 10,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-11.png",
        width = 22,
        height = 18,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-12.png",
        width = 26,
        height = 17,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-13.png",
        width = 15,
        height = 13,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-14.png",
        width = 13,
        height = 13,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-15.png",
        width = 22,
        height = 17,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-16.png",
        width = 22,
        height = 16,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-17.png",
        width = 13,
        height = 15,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-18.png",
        width = 14,
        height = 17,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-19.png",
        width = 12,
        height = 10,
      },
      {
        filename = "__base__/graphics/decorative/roots/root-A-20.png",
        width = 13,
        height = 14,
      },
    }
  },
  {
    type = "optimized-decorative",
    name = "root-B",
    icon = "__base__/graphics/icons/root-b.png",
    subgroup = "grass",
    order = "b[decorative]-h[root]-b[big]",
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selectable_in_game = false,
    autoplace =
    {
      order = "a[doodad]-z[other]",
      influence = 0.01
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/roots/root-B-01.png",
        width = 38,
        height = 20
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-02.png",
        width = 32,
        height = 25
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-03.png",
        width = 36,
        height = 34
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-04.png",
        width = 40,
        height = 32
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-05.png",
        width = 29,
        height = 24
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-06.png",
        width = 38,
        height = 32
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-07.png",
        width = 19,
        height = 28
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-08.png",
        width = 46,
        height = 29
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-09.png",
        width = 34,
        height = 23
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-10.png",
        width = 21,
        height = 27
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-11.png",
        width = 29,
        height = 24
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-12.png",
        width = 28,
        height = 14
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-13.png",
        width = 34,
        height = 25
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-14.png",
        width = 33,
        height = 25
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-15.png",
        width = 21,
        height = 16
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-16.png",
        width = 35,
        height = 22
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-17.png",
        width = 35,
        height = 13
      },
      {
        filename = "__base__/graphics/decorative/roots/root-B-18.png",
        width = 33,
        height = 25
      },
    }
  },
  {
    type = "simple-entity",
    name = "stone-rock",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/stone-rock.png",
    subgroup = "grass",
    order = "b[decorative]-k[stone-rock]-a[big]",
    collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    selection_box = {{-1.3, -1.3}, {1.3, 1.3}},
    vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 8,
      result = "stone",
      count = 20
    },
    loot =
    {
      {item = "stone", probability = 1, count_min = 5, count_max = 10}
    },
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    render_layer = "object",
    max_health = 200,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    autoplace =
    {
      order = "a[doodad]-a[rock]",
      peaks =
      {
        {
          influence = 0.0002
        },
        {
          influence = 0.002;
          min_influence = 0,
          elevation_optimal = 30000,
          elevation_range = 23000,
          elevation_max_range = 30000,
        }
      }
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/stone-rock/stone-rock-01.png",
        width = 76,
        height = 60,
        shift = {0.1, 0}
      },
      {
        filename = "__base__/graphics/decorative/stone-rock/stone-rock-02.png",
        width = 83,
        height = 86,
        shift = {0.2, 0}
      },
      {
        filename = "__base__/graphics/decorative/stone-rock/stone-rock-03.png",
        width = 126,
        height = 98,
        shift = {0.7, 0}
      },
      {
        filename = "__base__/graphics/decorative/stone-rock/stone-rock-04.png",
        width = 92,
        height = 108,
        shift = {0.1, 0}
      },
      {
        filename = "__base__/graphics/decorative/stone-rock/stone-rock-05.png",
        width = 140,
        height = 99,
        shift = {0.5, 0}
      }
    }
  },
  {
    type = "simple-entity",
    name = "red-desert-rock-big-01",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/red-desert-rock-big-icon.png",
    subgroup = "grass",
    order = "b[decorative]-k[red-desert-rock]-ab[big-01]",
    localised_name = {"entity-name.red-desert-rock-big"},
    collision_box = {{-1.0, -0.9}, {1.0, 1.0}},
    selection_box = {{-1.2, -1.2}, {1.2, 1.2}},
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 8,
      result = "stone",
      count = 20
    },
    loot =
    {
      {item = "stone", probability = 1, count_min = 10, count_max = 25}
    },
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    render_layer = "object",
    max_health = 500,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    autoplace =
    {
      order = "a[doodad]-a[rock]-b[red-desert]-b[big01]",
      peaks =
      {
        {
          influence = 0.0002
        },
        {
          influence = 0.002;
          min_influence = 0,
          elevation_optimal = 30000,
          elevation_range = 23000,
          elevation_max_range = 30000,
        }
      },
      tile_restriction = {"red-desert", "red-desert-dark"}
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-01.png",
        width = 95,
        height = 65,
        shift = {-0.046875, 0.171875},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-01.png",
          width = 188,
          height = 128,
          scale = 0.5,
          shift = {-0.046875, 0.171875}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-02.png",
        width = 96,
        height = 66,
        shift = {0.4375, 0.125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-02.png",
          width = 191,
          height = 132,
          scale = 0.5,
          shift = {0.445312, 0.125}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-03.png",
        width = 101,
        height = 64,
        shift = {0.484375, 0.0625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-03.png",
          width = 200,
          height = 127,
          scale = 0.5,
          shift = {0.484375, 0.0546875}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-04.png",
        width = 70,
        height = 71,
        shift = {0.21875, 0.046875},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-04.png",
          width = 139,
          height = 141,
          scale = 0.5,
          shift = {0.210938, 0.0390625}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-05.png",
        width = 63,
        height = 52,
        shift = {0.015625, 0.21875},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-05.png",
          width = 125,
          height = 103,
          scale = 0.5,
          shift = {0.0234375, 0.226562}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-06.png",
        width = 80,
        height = 53,
        shift = {0.15625, 0.234375},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-06.png",
          width = 160,
          height = 105,
          scale = 0.5,
          shift = {0.15625, 0.226562}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-07.png",
        width = 73,
        height = 66,
        shift = {0.265625, 0.15625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-07.png",
          width = 145,
          height = 131,
          scale = 0.5,
          shift = {0.257812, 0.148438}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-08.png",
        width = 74,
        height = 55,
        shift = {0.09375, 0.171875},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-08.png",
          width = 147,
          height = 109,
          scale = 0.5,
          shift = {0.0859375, 0.179688}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-09.png",
        width = 91,
        height = 58,
        shift = {0.078125, 0.09375},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-09.png",
          width = 182,
          height = 115,
          scale = 0.5,
          shift = {0.078125, 0.0859375}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-10.png",
        width = 114,
        height = 63,
        shift = {-0.15625, 0.078125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-10.png",
          width = 226,
          height = 125,
          scale = 0.5,
          shift = {-0.15625, 0.0703125}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-11.png",
        width = 91,
        height = 71,
        shift = {0.203125, 0.265625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-11.png",
          width = 181,
          height = 141,
          scale = 0.5,
          shift = {0.195312, 0.257812}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-12.png",
        width = 75,
        height = 66,
        shift = {0.046875, 0.15625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-12.png",
          width = 149,
          height = 132,
          scale = 0.5,
          shift = {0.0390625, 0.15625}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-13.png",
        width = 92,
        height = 74,
        shift = {0.21875, 0.21875},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-13.png",
          width = 183,
          height = 146,
          scale = 0.5,
          shift = {0.226562, 0.21875}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-14.png",
        width = 92,
        height = 78,
        shift = {0.125, 0.0625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-14.png",
          width = 183,
          height = 156,
          scale = 0.5,
          shift = {0.132812, 0.0625}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-15.png",
        width = 88,
        height = 86,
        shift = {0.3125, -0.09375},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-15.png",
          width = 175,
          height = 170,
          scale = 0.5,
          shift = {0.304688, -0.09375}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-16.png",
        width = 104,
        height = 74,
        shift = {0.34375, 0.125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-16.png",
          width = 207,
          height = 147,
          scale = 0.5,
          shift = {0.335938, 0.117188}
        },
      },
      
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-17.png",
        width = 76,
        height = 58,
        shift = {0.25, 0.03125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-17.png",
          width = 150,
          height = 115,
          scale = 0.5,
          shift = {0.25, 0.0390625}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-18.png",
        width = 70,
        height = 63,
        shift = {0.3125, 0.046875},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-18.png",
          width = 139,
          height = 125,
          scale = 0.5,
          shift = {0.304688, 0.0390625}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-19.png",
        width = 87,
        height = 56,
        shift = {0.390625, 0.03125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-19.png",
          width = 174,
          height = 111,
          scale = 0.5,
          shift = {0.390625, 0.0234375}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-big/red-desert-rock-big-20.png",
        width = 59,
        height = 62,
        shift = {0.140625, 0.03125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-big/hr-red-desert-rock-big-20.png",
          width = 117,
          height = 122,
          scale = 0.5,
          shift = {0.148438, 0.03125}
        },
      },
    }
  }, 
 
  {
    type = "simple-entity",
    name = "red-desert-rock-huge-01",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/red-desert-rock-huge-icon.png",
    subgroup = "grass",
    order = "b[decorative]-k[red-desert-rock]-ac[huge-01]",
    localised_name = {"entity-name.red-desert-rock-huge"},
    collision_box = {{-1.5, -1.1}, {1.5, 1.1}},
    selection_box = {{-1.7, -1.3}, {1.7, 1.3}},
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 5,
      results = {{name = "stone", amount_min = 25, amount_max = 50}, {name = "coal", amount_min = 25, amount_max = 50}},
      --count = 200
    },
    loot =
    {
      {item = "stone", probability = 1, count_min = 25, count_max = 50}
    },
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    render_layer = "object",
    max_health = 2000,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    autoplace =
    {
      order = "a[doodad]-a[rock]-b[red-desert]-a[huge01]",
      peaks =
      {
        {
          influence = 0.0002
        },
        {
          influence = 0.002;
          min_influence = 0,
          elevation_optimal = 30000,
          elevation_range = 23000,
          elevation_max_range = 30000,
        }
      },
      tile_restriction = {"red-desert", "red-desert-dark"}
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/red-desert-rock-huge/red-desert-rock-huge-05.png",
        width = 100,
        height = 88,
        shift = {0.25, 0.0625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-huge/hr-red-desert-rock-huge-05.png",
          width = 198,
          height = 176,
          scale = 0.5,
          shift = {0.25, 0.0625}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-huge/red-desert-rock-huge-06.png",
        width = 114,
        height = 85,
        shift = {0.4375, 0.046875},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-huge/hr-red-desert-rock-huge-06.png",
          width = 227,
          height = 168,
          scale = 0.5,
          shift = {0.429688, 0.046875}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-huge/red-desert-rock-huge-07.png",
        width = 119,
        height = 94,
        shift = {0.390625, 0.03125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-huge/hr-red-desert-rock-huge-07.png",
          width = 237,
          height = 188,
          scale = 0.5,
          shift = {0.398438, 0.03125}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-huge/red-desert-rock-huge-08.png",
        width = 107,
        height = 86,
        shift = {0.140625, 0.125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-huge/hr-red-desert-rock-huge-08.png",
          width = 213,
          height = 171,
          scale = 0.5,
          shift = {0.148438, 0.132812}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-huge/red-desert-rock-huge-09.png",
        width = 120,
        height = 104,
        shift = {0.3125, 0.0625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-huge/hr-red-desert-rock-huge-09.png",
          width = 238,
          height = 206,
          scale = 0.5,
          shift = {0.3125, 0.0625}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-huge/red-desert-rock-huge-10.png",
        width = 120,
        height = 95,
        shift = {0.1875, 0.046875},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-huge/hr-red-desert-rock-huge-10.png",
          width = 240,
          height = 188,
          scale = 0.5,
          shift = {0.1875, 0.046875}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-huge/red-desert-rock-huge-11.png",
        width = 123,
        height = 92,
        shift = {0.390625, 0.0625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-huge/hr-red-desert-rock-huge-11.png",
          width = 245,
          height = 183,
          scale = 0.5,
          shift = {0.398438, 0.0546875}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-huge/red-desert-rock-huge-12.png",
        width = 136,
        height = 80,
        shift = {0.34375, 0.03125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-huge/hr-red-desert-rock-huge-12.png",
          width = 270,
          height = 159,
          scale = 0.5,
          shift = {0.34375, 0.0390625}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-huge/red-desert-rock-huge-13.png",
        width = 135,
        height = 86,
        shift = {0.265625, 0.03125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-huge/hr-red-desert-rock-huge-13.png",
          width = 269,
          height = 171,
          scale = 0.5,
          shift = {0.273438, 0.0234375}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-huge/red-desert-rock-huge-14.png",
        width = 121,
        height = 107,
        shift = {0.203125, 0.046875},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-huge/hr-red-desert-rock-huge-14.png",
          width = 241,
          height = 213,
          scale = 0.5,
          shift = {0.195312, 0.0390625}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-huge/red-desert-rock-huge-15.png",
        width = 157,
        height = 90,
        shift = {0.515625, 0.03125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-huge/hr-red-desert-rock-huge-15.png",
          width = 313,
          height = 178,
          scale = 0.5,
          shift = {0.523438, 0.03125}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-huge/red-desert-rock-huge-16.png",
        width = 107,
        height = 111,
        shift = {0.046875, 0.015625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-huge/hr-red-desert-rock-huge-16.png",
          width = 213,
          height = 221,
          scale = 0.5,
          shift = {0.0546875, 0.0234375}
        },
      }
    }
  }, 
  
  {
    type = "simple-entity",
    name = "red-desert-rock-huge-02",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/red-desert-rock-huge-icon.png",
    subgroup = "grass",
    order = "b[decorative]-k[red-desert-rock]-ac[huge-02]",
    localised_name = {"entity-name.red-desert-rock-huge"},
    collision_box = {{-2.0, -1.5}, {2.0, 1.75}},
    selection_box = {{-2.1, -2}, {2.1, 2}},
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 25,
      result = "stone",
      count = 200
    },
    loot =
    {
      {item = "stone", probability = 1, count_min = 25, count_max = 50}
    },
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    render_layer = "object",
    max_health = 2000,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    autoplace =
    {
      order = "a[doodad]-a[rock]-b[red-desert]-a[huge02]",
      peaks =
      {
        {
          influence = 0.0002
        },
        {
          influence = 0.002;
          min_influence = 0,
          elevation_optimal = 30000,
          elevation_range = 23000,
          elevation_max_range = 30000,
        }
      },
      tile_restriction = {"red-desert", "red-desert-dark"}
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/red-desert-rock-huge/red-desert-rock-huge-17.png",
        width = 165,
        height = 113,
        shift = {0.234375, 0.046875},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-huge/hr-red-desert-rock-huge-17.png",
          width = 329,
          height = 226,
          scale = 0.5,
          shift = {0.226562, 0.046875}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-huge/red-desert-rock-huge-18.png",
        width = 143,
        height = 118,
        shift = {0.203125, 0.03125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-huge/hr-red-desert-rock-huge-18.png",
          width = 285,
          height = 235,
          scale = 0.5,
          shift = {0.195312, 0.0390625}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-huge/red-desert-rock-huge-19.png",
        width = 173,
        height = 111,
        shift = {0.609375, 0.015625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-huge/hr-red-desert-rock-huge-19.png",
          width = 346,
          height = 221,
          scale = 0.5,
          shift = {0.609375, 0.0234375}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-huge/red-desert-rock-huge-20.png",
        width = 143,
        height = 124,
        shift = {0.140625, 0.03125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-huge/hr-red-desert-rock-huge-20.png",
          width = 285,
          height = 248,
          scale = 0.5,
          shift = {0.132812, 0.03125}
        },
      }
    }
  }, 
  
  
  {
    type = "optimized-decorative",
    name = "brown-carpet-grass",
    icon = "__base__/graphics/icons/brown-carpet-grass.png",
    subgroup = "grass",
    order = "b[decorative]-a[grass]-b[carpet]",
    collision_box = {{-2, -2}, {2, 2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selectable_in_game = false,
    autoplace =
    {
      order = "a[doodad]-f[grass]-c",
      sharpness = 0.7,
      max_probability = 0.01,
      peaks = autoplace_utils.peaks(grass_peaks,
                                    {
                                      {
                                        influence = 0.3,
                                        noise_layer = "grass1",
                                        noise_octaves_difference = -2.8,
                                        noise_persistence = 0.5
                                      },
                                    }),
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-01.png",
        width = 103,
        height = 70,
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-02.png",
        width = 185,
        height = 164,
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-03.png",
        width = 96,
        height = 176,
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-04.png",
        width = 200,
        height = 179,
      },
    }
  },
  {
    type = "optimized-decorative",
    name = "brown-hairy-grass",
    icon = "__base__/graphics/icons/brown-hairy-grass.png",
    subgroup = "grass",
    order = "b[decorative]-a[grass]-a[hairy]",
    collision_box = {{-1, -1}, {1, 1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "decorative",
    selectable_in_game = false,
    autoplace =
    {
      order = "a[doodad]-f[grass]-b",
      sharpness = 0.2,
      max_probability = 0.01,
      peaks = autoplace_utils.peaks(grass_peaks,
                                    {
                                      {
                                        influence = 0.3,
                                        noise_layer = "grass2",
                                        noise_octaves_difference = -2.8,
                                        noise_persistence = 0.5
                                      },
                                    }),
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-01.png",
        width = 88,
        height = 31
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-02.png",
        width = 39,
        height = 34
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-03.png",
        width = 53,
        height = 29
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-04.png",
        width = 47,
        height = 31
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-05.png",
        width = 56,
        height = 38
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-06.png",
        width = 59,
        height = 28
      },
    }
  },
  {
    type = "optimized-decorative",
    name = "small-rock",
    icon = "__base__/graphics/icons/small-stone-rock.png",
    subgroup = "grass",
    order = "b[decorative]-k[stone-rock]-b[small]",
    selectable_in_game = false,
    collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    selection_box = {{-1.3, -1.3}, {1.3, 1.3}},
    render_layer = "decorative",
    autoplace =
    {
      order = "a[doodad]-a[rock]",
      peaks =
      {
        {
          influence = 0.0002
        },
        {
          influence = 0.002;
          min_influence = 0,
          elevation_optimal = 30000,
          elevation_range = 23000,
          elevation_max_range = 30000,
        }
      }
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-01.png",
        width = 47,
        height = 37,
        shift = {0.21, -0.18}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-02.png",
        width = 46,
        height = 38,
        shift = {0.25, -0.1}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-03.png",
        width = 48,
        height = 42,
        shift = {0.28, -0.21}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-04.png",
        width = 56,
        height = 39,
        shift = {0.28, -0.12}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-05.png",
        width = 54,
        height = 36,
        shift = {0.34, -0.125}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-06.png",
        width = 32,
        height = 26,
        shift = {0.0, 0}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-07.png",
        width = 33,
        height = 28,
        shift = {0.0, 0}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-08.png",
        width = 35,
        height = 26,
        shift = {0.15, 0}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-09.png",
        width = 35,
        height = 23,
        shift = {0.125, 0}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-10.png",
        width = 21,
        height = 21,
        shift = {0.0, 0}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-11.png",
        width = 24,
        height = 16,
        shift = {0.0, 0}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-12.png",
        width = 19,
        height = 17,
        shift = {0.0, 0}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-13.png",
        width = 23,
        height = 15,
        shift = {0.0, 0}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-14.png",
        width = 44,
        height = 42,
        shift = {0.28, -0.18}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-15.png",
        width = 51,
        height = 41,
        shift = {0.31, -0.18}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-16.png",
        width = 55,
        height = 40,
        shift = {0.25, -0.18}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-17.png",
        width = 52,
        height = 44,
        shift = {0.37, -0.21}
      },      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-18.png",
        width = 57,
        height = 39,
        shift = {0.46, -0.15}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-19.png",
        width = 20,
        height = 23,
        shift = {0.0, 0}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-20.png",
        width = 25,
        height = 22,
        shift = {0.0, -0.37}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-21.png",
        width = 31,
        height = 16,
        shift = {0.0, 0.25}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-22.png",
        width = 29,
        height = 16,
        shift = {0.25, -0.25}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-23.png",
        width   = 21,
        height = 20,
        shift = {-0.1, -0.18}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-24.png",
        width = 47,
        height = 29,
        shift = {0.25, 0}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-25.png",
        width = 34,
        height = 33,
        shift = {0.0, -0.12}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-26.png",
        width = 38,
        height = 28,
        shift = {0.06, -0.25}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-27.png",
        width = 31,
        height = 26,
        shift = {0.0, 0}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-28.png",
        width = 45,
        height = 24,
        shift = {0.18, -0.09}
      },
      {
        filename = "__base__/graphics/decorative/small-stone-rock/small-stone-rock-29.png",
        width = 48,
        height = 26,
        shift = {0.21, -0.09}
      }
    }
  },
  
  {
    type = "optimized-decorative",
    name = "red-desert-rock-medium",
    icon = "__base__/graphics/icons/red-desert-rock-medium-icon.png",
    subgroup = "grass",
    order = "b[decorative]-k[red-desert-rock]-bc[medium]",
    selectable_in_game = false,
    collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    --selection_box = {{-1.3, -1.3}, {1.3, 1.3}},
    render_layer = "decorative",
    autoplace =
    {
      order = "a[doodad]-a[rock]-b[red-desert]-c[medium]",
      peaks =
      {
        {
          influence = 0.002
        }
      },
      tile_restriction = {"red-desert", "red-desert-dark"}
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/red-desert-rock-medium/red-desert-rock-medium-01.png",
        width = 43,
        height = 31,
        shift = {0.078125, 0.109375},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-medium/hr-red-desert-rock-medium-01.png",
          width = 84,
          height = 60,
          scale = 0.5,
          shift = {0.078125, 0.109375}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-medium/red-desert-rock-medium-02.png",
        width = 37,
        height = 32,
        shift = {0.015625, 0.125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-medium/hr-red-desert-rock-medium-02.png",
          width = 72,
          height = 63,
          scale = 0.5,
          shift = {0.015625, 0.132812}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-medium/red-desert-rock-medium-03.png",
        width = 45,
        height = 31,
        shift = {0.140625, 0.171875},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-medium/hr-red-desert-rock-medium-03.png",
          width = 89,
          height = 61,
          scale = 0.5,
          shift = {0.148438, 0.179688}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-medium/red-desert-rock-medium-04.png",
        width = 44,
        height = 28,
        shift = {0, 0.1875},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-medium/hr-red-desert-rock-medium-04.png",
          width = 87,
          height = 56,
          scale = 0.5,
          shift = {-0.0078125, 0.1875}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-medium/red-desert-rock-medium-05.png",
        width = 51,
        height = 35,
        shift = {0.203125, 0.171875},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-medium/hr-red-desert-rock-medium-05.png",
          width = 102,
          height = 69,
          scale = 0.5,
          shift = {0.203125, 0.179688}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-medium/red-desert-rock-medium-06.png",
        width = 39,
        height = 40,
        shift = {0.015625, 0.21875},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-medium/hr-red-desert-rock-medium-06.png",
          width = 78,
          height = 78,
          scale = 0.5,
          shift = {0.015625, 0.21875}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-medium/red-desert-rock-medium-07.png",
        width = 54,
        height = 32,
        shift = {0.0625, 0.3125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-medium/hr-red-desert-rock-medium-07.png",
          width = 108,
          height = 62,
          scale = 0.5,
          shift = {0.0625, 0.3125}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-medium/red-desert-rock-medium-08.png",
        width = 37,
        height = 39,
        shift = {0.109375, 0.140625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-medium/hr-red-desert-rock-medium-08.png",
          width = 74,
          height = 77,
          scale = 0.5,
          shift = {0.109375, 0.148438}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-medium/red-desert-rock-medium-09.png",
        width = 47,
        height = 27,
        shift = {0.015625, 0.140625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-medium/hr-red-desert-rock-medium-09.png",
          width = 94,
          height = 54,
          scale = 0.5,
          shift = {0.015625, 0.140625}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-medium/red-desert-rock-medium-10.png",
        width = 44,
        height = 33,
        shift = {0, 0.140625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-medium/hr-red-desert-rock-medium-10.png",
          width = 86,
          height = 65,
          scale = 0.5,
          shift = {0, 0.132812}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-medium/red-desert-rock-medium-11.png",
        width = 52,
        height = 36,
        shift = {-0.03125, 0.125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-medium/hr-red-desert-rock-medium-11.png",
          width = 103,
          height = 70,
          scale = 0.5,
          shift = {-0.0234375, 0.125}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-medium/red-desert-rock-medium-12.png",
        width = 35,
        height = 39,
        shift = {0.078125, -0.015625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-medium/hr-red-desert-rock-medium-12.png",
          width = 70,
          height = 78,
          scale = 0.5,
          shift = {0.078125, -0.015625}
        },
      }
    }
  },
  {
    type = "optimized-decorative",
    name = "red-desert-rock-small",
    icon = "__base__/graphics/icons/small-stone-rock.png",
    subgroup = "grass",
    order = "b[decorative]-k[red-desert-rock]-b[small]",
    selectable_in_game = false,
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    render_layer = "decorative",
    autoplace =
    {
      order = "a[doodad]-a[rock]-b[red-desert]-c[small]",
      peaks =
      {
        {
          influence = 0.02
        }
      },
      tile_restriction = {"red-desert", "red-desert-dark"}
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/red-desert-rock-small/red-desert-rock-small-01.png",
        width = 20,
        height = 14,
        shift = {0.0625, 0.125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-small/hr-red-desert-rock-small-01.png",
          width = 39,
          height = 27,
          scale = 0.5,
          shift = {0.0546875, 0.117188}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-small/red-desert-rock-small-02.png",
        width = 23,
        height = 17,
        shift = {0.046875, 0.078125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-small/hr-red-desert-rock-small-02.png",
          width = 45,
          height = 34,
          scale = 0.5,
          shift = {0.0390625, 0.078125}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-small/red-desert-rock-small-03.png",
        width = 23,
        height = 15,
        shift = {-0.015625, 0.140625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-small/hr-red-desert-rock-small-03.png",
          width = 45,
          height = 29,
          scale = 0.5,
          shift = {-0.0078125, 0.148438}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-small/red-desert-rock-small-04.png",
        width = 21,
        height = 18,
        shift = {0.015625, 0.15625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-small/hr-red-desert-rock-small-04.png",
          width = 41,
          height = 36,
          scale = 0.5,
          shift = {0.0234375, 0.15625}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-small/red-desert-rock-small-05.png",
        width = 25,
        height = 17,
        shift = {0.046875, 0.140625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-small/hr-red-desert-rock-small-05.png",
          width = 49,
          height = 32,
          scale = 0.5,
          shift = {0.0390625, 0.140625}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-small/red-desert-rock-small-06.png",
        width = 20,
        height = 22,
        shift = {-0.03125, 0.09375},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-small/hr-red-desert-rock-small-06.png",
          width = 40,
          height = 42,
          scale = 0.5,
          shift = {-0.03125, 0.09375}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-small/red-desert-rock-small-07.png",
        width = 29,
        height = 19,
        shift = {-0.015625, 0.078125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-small/hr-red-desert-rock-small-07.png",
          width = 56,
          height = 37,
          scale = 0.5,
          shift = {-0.015625, 0.0703125}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-small/red-desert-rock-small-08.png",
        width = 74,
        height = 29,
        shift = {-0.71875, -0.171875},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-small/hr-red-desert-rock-small-08.png",
          width = 148,
          height = 57,
          scale = 0.5,
          shift = {-0.71875, -0.164062}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-small/red-desert-rock-small-09.png",
        width = 30,
        height = 15,
        shift = {-0.09375, 0.109375},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-small/hr-red-desert-rock-small-09.png",
          width = 59,
          height = 29,
          scale = 0.5,
          shift = {-0.0859375, 0.101562}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-small/red-desert-rock-small-10.png",
        width = 20,
        height = 16,
        shift = {0, 0.125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-small/hr-red-desert-rock-small-10.png",
          width = 39,
          height = 32,
          scale = 0.5,
          shift = {0.0078125, 0.125}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-small/red-desert-rock-small-11.png",
        width = 30,
        height = 17,
        shift = {-0.09375, 0.078125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-small/hr-red-desert-rock-small-11.png",
          width = 59,
          height = 32,
          scale = 0.5,
          shift = {-0.0859375, 0.078125}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-small/red-desert-rock-small-12.png",
        width = 25,
        height = 15,
        shift = {0.078125, 0.109375},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-small/hr-red-desert-rock-small-12.png",
          width = 48,
          height = 29,
          scale = 0.5,
          shift = {0.078125, 0.117188}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-small/red-desert-rock-small-13.png",
        width = 20,
        height = 18,
        shift = {0, 0.09375},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-small/hr-red-desert-rock-small-13.png",
          width = 40,
          height = 36,
          scale = 0.5,
          shift = {0, 0.09375}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-small/red-desert-rock-small-14.png",
        width = 19,
        height = 15,
        shift = {0.046875, 0.140625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-small/hr-red-desert-rock-small-14.png",
          width = 36,
          height = 28,
          scale = 0.5,
          shift = {0.046875, 0.140625}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-small/red-desert-rock-small-15.png",
        width = 20,
        height = 15,
        shift = {0, 0.140625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-small/hr-red-desert-rock-small-15.png",
          width = 38,
          height = 28,
          scale = 0.5,
          shift = {0, 0.140625}
        },
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-small/red-desert-rock-small-16.png",
        width = 19,
        height = 16,
        shift = {0.015625, 0.125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-small/hr-red-desert-rock-small-16.png",
          width = 37,
          height = 32,
          scale = 0.5,
          shift = {0.0234375, 0.125}
        },
      }
    }
  },
  {
    type = "optimized-decorative",
    name = "red-desert-rock-tiny",
    icon = "__base__/graphics/icons/small-stone-rock.png",
    subgroup = "grass",
    order = "b[decorative]-k[red-desert-rock]-b[tiny]",
    selectable_in_game = false,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    render_layer = "decorative",
    autoplace =
    {
      order = "a[doodad]-a[rock]-b[red-desert]-c[tiny]",
      peaks =
      {
        {
          influence = 0.2
        }
      },
      tile_restriction = {"red-desert", "red-desert-dark"}
    },
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/red-desert-rock-tiny/red-desert-rock-tiny-01.png",
        width = 12,
        height = 9,
        shift = {0.03125, 0.015625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-tiny/hr-red-desert-rock-tiny-01.png",
          width = 23,
          height = 17,
          scale = 0.5,
          shift = {0.0390625, 0.0234375}
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-tiny/red-desert-rock-tiny-02.png",
        width = 12,
        height = 8,
        shift = {0, 0.03125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-tiny/hr-red-desert-rock-tiny-02.png",
          width = 23,
          height = 15,
          scale = 0.5,
          shift = {0.0078125, 0.0234375}
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-tiny/red-desert-rock-tiny-03.png",
        width = 11,
        height = 9,
        shift = {0.015625, 0.015625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-tiny/hr-red-desert-rock-tiny-03.png",
          width = 21,
          height = 17,
          scale = 0.5,
          shift = {0.0234375, 0.0234375}
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-tiny/red-desert-rock-tiny-04.png",
        width = 12,
        height = 9,
        shift = {0.03125, 0.015625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-tiny/hr-red-desert-rock-tiny-04.png",
          width = 24,
          height = 16,
          scale = 0.5,
          shift = {0.03125, 0.015625}
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-tiny/red-desert-rock-tiny-05.png",
        width = 10,
        height = 11,
        shift = {0, -0.015625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-tiny/hr-red-desert-rock-tiny-05.png",
          width = 20,
          height = 21,
          scale = 0.5,
          shift = {0, -0.0078125}
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-tiny/red-desert-rock-tiny-06.png",
        width = 14,
        height = 10,
        shift = {0, -0.03125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-tiny/hr-red-desert-rock-tiny-06.png",
          width = 28,
          height = 19,
          scale = 0.5,
          shift = {0, -0.0234375}
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-tiny/red-desert-rock-tiny-07.png",
        width = 38,
        height = 15,
        shift = {-0.34375, -0.140625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-tiny/hr-red-desert-rock-tiny-07.png",
          width = 74,
          height = 29,
          scale = 0.5,
          shift = {-0.34375, -0.132812}
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-tiny/red-desert-rock-tiny-08.png",
        width = 16,
        height = 8,
        shift = {-0.03125, 0},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-tiny/hr-red-desert-rock-tiny-08.png",
          width = 30,
          height = 14,
          scale = 0.5,
          shift = {-0.03125, 0}
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-tiny/red-desert-rock-tiny-09.png",
        width = 11,
        height = 9,
        shift = {0.015625, 0.015625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-tiny/hr-red-desert-rock-tiny-09.png",
          width = 21,
          height = 16,
          scale = 0.5,
          shift = {0.0234375, 0.015625}
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-tiny/red-desert-rock-tiny-10.png",
        width = 11,
        height = 8,
        shift = {0.015625, -0.03125},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-tiny/hr-red-desert-rock-tiny-10.png",
          width = 21,
          height = 15,
          scale = 0.5,
          shift = {0.0078125, -0.0234375}
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-tiny/red-desert-rock-tiny-11.png",
        width = 13,
        height = 8,
        shift = {0.046875, 0},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-tiny/hr-red-desert-rock-tiny-11.png",
          width = 24,
          height = 15,
          scale = 0.5,
          shift = {0.046875, 0.0078125}
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-tiny/red-desert-rock-tiny-12.png",
        width = 11,
        height = 10,
        shift = {0.015625, 0},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-tiny/hr-red-desert-rock-tiny-12.png",
          width = 20,
          height = 18,
          scale = 0.5,
          shift = {0.015625, 0}
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-tiny/red-desert-rock-tiny-13.png",
        width = 10,
        height = 7,
        shift = {0.03125, 0.015625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-tiny/hr-red-desert-rock-tiny-13.png",
          width = 18,
          height = 14,
          scale = 0.5,
          shift = {0.03125, 0.015625}
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-tiny/red-desert-rock-tiny-14.png",
        width = 9,
        height = 9,
        shift = {0.015625, 0.015625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-tiny/hr-red-desert-rock-tiny-14.png",
          width = 17,
          height = 17,
          scale = 0.5,
          shift = {0.0078125, 0.0078125}
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-tiny/red-desert-rock-tiny-15.png",
        width = 10,
        height = 7,
        shift = {0, 0.015625},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-tiny/hr-red-desert-rock-tiny-15.png",
          width = 19,
          height = 14,
          scale = 0.5,
          shift = {0.0078125, 0.015625}
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-rock-tiny/red-desert-rock-tiny-16.png",
        width = 10,
        height = 8,
        shift = {0.03125, 0},
        hr_version = {
          filename = "__base__/graphics/decorative/red-desert-rock-tiny/hr-red-desert-rock-tiny-16.png",
          width = 18,
          height = 15,
          scale = 0.5,
          shift = {0.03125, 0.0078125}
        }
      }
    }
  },
  
  {
    type = "optimized-decorative",
    name = "big-ship-wreck-grass",
    icon = "__base__/graphics/icons/ship-wreck/big-ship-wreck-grass.png",
    subgroup = "wrecks",
    order = "d[remnants]-d[ship-wreck-grass]-a[big]",
    collision_box = {{-2.5, -1.5}, {2.5, 1.5}},
    selection_box = {{-2.8, -1.7}, {2.8, 1.7}},
    selectable_in_game = false,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/ship-wreck/big-ship-wreck-grass.png",
        width = 206,
        height = 112,
      }
    },
    render_layer = "decals",
  },
  {
    type = "optimized-decorative",
    name = "small-ship-wreck-grass",
    icon = "__base__/graphics/icons/ship-wreck/small-ship-wreck-grass.png",
    subgroup = "wrecks",
    order = "d[remnants]-d[ship-wreck-grass]-b[small]",
    collision_box = {{-1.5, -0.5}, {1.5, 0.5}},
    selection_box = {{-1.7, -0.6}, {1.7, 0.6}},
    selectable_in_game = false,
    render_layer = "decals",
    pictures =
    {
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-grass-1.png",
        width = 129,
        height = 45
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-grass-2.png",
        width = 121,
        height = 34
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-grass-3.png",
        width = 115,
        height = 37
      }
    }
  },
})

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
    type = "decorative",
    name = "brown-asterisk",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-01.png",
        width = 30,
        height = 26,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-02.png",
        width = 24,
        height = 27,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-03.png",
        width = 27,
        height = 23,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-04.png",
        width = 35,
        height = 26,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-05.png",
        width = 30,
        height = 25,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-06.png",
        width = 46,
        height = 32,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-07.png",
        width = 46,
        height = 31,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-08.png",
        width = 18,
        height = 15,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-09.png",
        width = 21,
        height = 14,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-10.png",
        width = 16,
        height = 17,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-11.png",
        width = 20,
        height = 18,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-12.png",
        width = 21,
        height = 18,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-13.png",
        width = 22,
        height = 19,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-14.png",
        width = 28,
        height = 22,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-15.png",
        width = 30,
        height = 21,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-16.png",
        width = 26,
        height = 22,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-17.png",
        width = 22,
        height = 15,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-18.png",
        width = 21,
        height = 27,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-19.png",
        width = 21,
        height = 20,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-20.png",
        width = 71,
        height = 58,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-21.png",
        width = 78,
        height = 59,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-22.png",
        width = 56,
        height = 49,
      },
    }
  },
  {
    type = "decorative",
    name = "green-asterisk",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/green-asterisk/green-asterisk-01.png",
        width = 25,
        height = 24,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-asterisk/green-asterisk-02.png",
        width = 25,
        height = 22,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-asterisk/green-asterisk-03.png",
        width = 29,
        height = 21,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-asterisk/green-asterisk-04.png",
        width = 27,
        height = 23,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-asterisk/green-asterisk-05.png",
        width = 38,
        height = 24,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-asterisk/green-asterisk-06.png",
        width = 32,
        height = 22,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-asterisk/green-asterisk-07.png",
        width = 40,
        height = 21,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-asterisk/green-asterisk-08.png",
        width = 40,
        height = 29,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-asterisk/green-asterisk-09.png",
        width = 33,
        height = 26,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-asterisk/green-asterisk-10.png",
        width = 24,
        height = 14,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-asterisk/green-asterisk-11.png",
        width = 22,
        height = 28,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-asterisk/green-asterisk-12.png",
        width = 20,
        height = 20,
      },
    }
  },
  {
    type = "decorative",
    name = "red-asterisk",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/red-asterisk/red-asterisk-01.png",
        width = 31,
        height = 29,
      },
      {
        filename = "__base__/graphics/entity/decorative/red-asterisk/red-asterisk-02.png",
        width = 24,
        height = 27,
      },
      {
        filename = "__base__/graphics/entity/decorative/red-asterisk/red-asterisk-03.png",
        width = 28,
        height = 24,
      },
      {
        filename = "__base__/graphics/entity/decorative/red-asterisk/red-asterisk-04.png",
        width = 36,
        height = 24,
      },
      {
        filename = "__base__/graphics/entity/decorative/red-asterisk/red-asterisk-05.png",
        width = 30,
        height = 28,
      },
      {
        filename = "__base__/graphics/entity/decorative/red-asterisk/red-asterisk-06.png",
        width = 32,
        height = 21,
      },
      {
        filename = "__base__/graphics/entity/decorative/red-asterisk/red-asterisk-07.png",
        width = 29,
        height = 26,
      },
    }
  },
  {
    type = "decorative",
    name = "green-pita",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
      peaks = autoplace_utils.peaks({{{20, 0.3}, {0, 0.1}, 0.5}},
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
        filename = "__base__/graphics/entity/decorative/green-pita/green-pita-01.png",
        width = 60,
        height = 49,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-pita/green-pita-02.png",
        width = 62,
        height = 46,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-pita/green-pita-03.png",
        width = 57,
        height = 56,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-pita/green-pita-04.png",
        width = 60,
        height = 54,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-pita/green-pita-05.png",
        width = 60,
        height = 49,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-pita/green-pita-06.png",
        width = 57,
        height = 47,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-pita/green-pita-07.png",
        width = 59,
        height = 51,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-pita/green-pita-08.png",
        width = 60,
        height = 46,
      }
    }
  },
  {
    type = "decorative",
    name = "green-pita-mini",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
      peaks = autoplace_utils.peaks({{{20, 0.3}, {0, 0}, 0.5}},
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
        filename = "__base__/graphics/entity/decorative/green-pita-mini/green-pita-mini-01.png",
        width = 32,
        height = 29
      },
      {
        filename = "__base__/graphics/entity/decorative/green-pita-mini/green-pita-mini-02.png",
        width = 37,
        height = 28
      },
      {
        filename = "__base__/graphics/entity/decorative/green-pita-mini/green-pita-mini-03.png",
        width = 35,
        height = 28
      },
      {
        filename = "__base__/graphics/entity/decorative/green-pita-mini/green-pita-mini-04.png",
        width = 32,
        height = 28
      }
    }
  },
  {
    type = "decorative",
    name = "brown-cane-cluster",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
      peaks = autoplace_utils.peaks({{{35, 0.7}, {10, 0.7}}},
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
        filename = "__base__/graphics/entity/decorative/brown-cane-cluster/brown-cane-cluster-01.png",
        width = 131,
        height = 146,
        shift = {0.5, -0.3}
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-cane-cluster/brown-cane-cluster-02.png",
        width = 154,
        height = 176,
        shift = {0.6, -0.4}
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-cane-cluster/brown-cane-cluster-03.png",
        width = 264,
        height = 156,
        shift = {0.7, -0.2}
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-cane-cluster/brown-cane-cluster-04.png",
        width = 119,
        height = 138,
        shift = {0.4, -0.3}
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-cane-cluster/brown-cane-cluster-05.png",
        width = 140,
        height = 230,
        shift = {0.4, 0}
      }
    }
  },
  {
    type = "decorative",
    name = "brown-cane-single",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/brown-cane-single/brown-cane-single-01.png",
        width = 56,
        height = 60,
        shift = {0.6, -0.4}
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-cane-single/brown-cane-single-02.png",
        width = 44,
        height = 43,
        shift = {0.3, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-cane-single/brown-cane-single-03.png",
        width = 48,
        height = 51,
        shift = {0.3, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-cane-single/brown-cane-single-04.png",
        width = 45,
        height = 37
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-cane-single/brown-cane-single-05.png",
        width = 81,
        height = 57,
        shift = {0.9, -0.4}
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-cane-single/brown-cane-single-06.png",
        width = 31,
        height = 94,
        shift = {0.1, 0.4}
      }
    }
  },
  {
    type = "decorative",
    name = "green-coral-mini",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/green-coral-mini/green-coral-mini-01.png",
        width = 52,
        height = 57,
        shift = {0, 0.3}
      },
      {
        filename = "__base__/graphics/entity/decorative/green-coral-mini/green-coral-mini-02.png",
        width = 20,
        height = 27
      },
      {
        filename = "__base__/graphics/entity/decorative/green-coral-mini/green-coral-mini-03.png",
        width = 37,
        height = 39,
        shift = {0.2, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/green-coral-mini/green-coral-mini-04.png",
        width = 46,
        height = 49,
        shift = {0.4, 0.3}
      },
      {
        filename = "__base__/graphics/entity/decorative/green-coral-mini/green-coral-mini-05.png",
        width = 33,
        height = 54,
        shift = {0.2, 0.2}
      },
      {
        filename = "__base__/graphics/entity/decorative/green-coral-mini/green-coral-mini-06.png",
        width = 34,
        height = 41,
        shift = {-0.1, 0}
      }
    }
  },
  {
    type = "decorative",
    name = "brown-coral-mini",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/brown-coral-mini/brown-coral-mini-01.png",
        width = 39,
        height = 40
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-coral-mini/brown-coral-mini-02.png",
        width = 18,
        height = 23
      }
    }
  },
  {
    type = "decorative",
    name = "orange-coral-mini",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/orange-coral-mini/orange-coral-mini-01.png",
        width = 50,
        height = 58,
        shift = {0, 0.3}
      },
      {
        filename = "__base__/graphics/entity/decorative/orange-coral-mini/orange-coral-mini-02.png",
        width = 21,
        height = 28,
        shift = {0.1, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/orange-coral-mini/orange-coral-mini-03.png",
        width = 39,
        height = 39,
        shift = {0.3, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/orange-coral-mini/orange-coral-mini-04.png",
        width = 47,
        height = 50,
        shift = {0.6, 0.35}
      },
      {
        filename = "__base__/graphics/entity/decorative/orange-coral-mini/orange-coral-mini-05.png",
        width = 33,
        height = 55,
        shift = {0.25, 0.2}
      },
      {
        filename = "__base__/graphics/entity/decorative/orange-coral-mini/orange-coral-mini-06.png",
        width = 36,
        height = 42
      }
    }
  },
  {
    type = "decorative",
    name = "brown-fluff",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/brown-fluff/brown-fluff-01.png",
        width = 21,
        height = 21
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-fluff/brown-fluff-02.png",
        width = 30,
        height = 17
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-fluff/brown-fluff-03.png",
        width = 27,
        height = 21
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-fluff/brown-fluff-04.png",
        width = 23,
        height = 19
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-fluff/brown-fluff-05.png",
        width = 28,
        height = 21
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-fluff/brown-fluff-06.png",
        width = 32,
        height = 20
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-fluff/brown-fluff-07.png",
        width = 22,
        height = 21
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-fluff/brown-fluff-08.png",
        width = 27,
        height = 32
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-fluff/brown-fluff-09.png",
        width = 27,
        height = 32
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-fluff/brown-fluff-10.png",
        width = 22,
        height = 19
      }
    }
  },
  {
    type = "decorative",
    name = "brown-fluff-dry",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/brown-fluff-dry/brown-fluff-dry-01.png",
        width = 19,
        height = 21
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-fluff-dry/brown-fluff-dry-02.png",
        width = 31,
        height = 17
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-fluff-dry/brown-fluff-dry-03.png",
        width = 27,
        height = 23
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-fluff-dry/brown-fluff-dry-04.png",
        width = 24,
        height = 23
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-fluff-dry/brown-fluff-dry-05.png",
        width = 25,
        height = 29
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-fluff-dry/brown-fluff-dry-06.png",
        width = 25,
        height = 20
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-fluff-dry/brown-fluff-dry-07.png",
        width = 31,
        height = 20
      }
    }
  },
  {
    name = "garballo",
    type = "decorative",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
      peaks = autoplace_utils.peaks({{{30, 0.5}, {20, 0.3}, 0.4}},
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
        filename = "__base__/graphics/entity/decorative/garballo/garballo-01.png",
        width = 50,
        height = 39
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo/garballo-02.png",
        width = 53,
        height = 40
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo/garballo-03.png",
        width = 29,
        height = 34
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo/garballo-04.png",
        width = 44,
        height = 43,
        shift = {0.2, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo/garballo-05.png",
        width = 48,
        height = 46
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo/garballo-06.png",
        width = 59,
        height = 49
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo/garballo-07.png",
        width = 54,
        height = 58,
        shift = {0.3, 0.2}
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo/garballo-08.png",
        width = 42,
        height = 36
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo/garballo-09.png",
        width = 58,
        height = 45
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo/garballo-10.png",
        width = 58,
        height = 39
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo/garballo-11.png",
        width = 71,
        height = 54,
        shift = {0.3, 0.2}
      },
    }
  },
  {
    type = "decorative",
    name = "garballo-mini-dry",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
      peaks = autoplace_utils.peaks({{{30, 0.5}, {20, 0.3}, 0.3}},
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
        filename = "__base__/graphics/entity/decorative/garballo-mini-dry/garballo-mini-dry-01.png",
        width = 18,
        height = 25
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo-mini-dry/garballo-mini-dry-02.png",
        width = 27,
        height = 25
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo-mini-dry/garballo-mini-dry-03.png",
        width = 31,
        height = 21
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo-mini-dry/garballo-mini-dry-04.png",
        width = 31,
        height = 25
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo-mini-dry/garballo-mini-dry-05.png",
        width = 31,
        height = 24
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo-mini-dry/garballo-mini-dry-06.png",
        width = 21,
        height = 27
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo-mini-dry/garballo-mini-dry-07.png",
        width = 25,
        height = 28
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo-mini-dry/garballo-mini-dry-08.png",
        width = 26,
        height = 32
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo-mini-dry/garballo-mini-dry-09.png",
        width = 23,
        height = 24
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo-mini-dry/garballo-mini-dry-10.png",
        width = 29,
        height = 26
      },
      {
        filename = "__base__/graphics/entity/decorative/garballo-mini-dry/garballo-mini-dry-11.png",
        width = 43,
        height = 34
      }
    }
  },
  {
    type = "decorative",
    name = "green-bush-mini",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
      peaks = autoplace_utils.peaks({{{30, 0.5}, {20, 0.3}, 0.3}},
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
        filename = "__base__/graphics/entity/decorative/green-bush-mini/green-bush-mini-01.png",
        width = 33,
        height = 24
      },
      {
        filename = "__base__/graphics/entity/decorative/green-bush-mini/green-bush-mini-02.png",
        width = 30,
        height = 21
      },
      {
        filename = "__base__/graphics/entity/decorative/green-bush-mini/green-bush-mini-03.png",
        width = 50,
        height = 26
      },
      {
        filename = "__base__/graphics/entity/decorative/green-bush-mini/green-bush-mini-04.png",
        width = 31,
        height = 22
      },
      {
        filename = "__base__/graphics/entity/decorative/green-bush-mini/green-bush-mini-05.png",
        width = 16,
        height = 15
      },
      {
        filename = "__base__/graphics/entity/decorative/green-bush-mini/green-bush-mini-06.png",
        width = 17,
        height = 15
      },
      {
        filename = "__base__/graphics/entity/decorative/green-bush-mini/green-bush-mini-07.png",
        width = 33,
        height = 18
      }
    }
  },
  {
    type = "decorative",
    name = "green-hairy-grass",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-01.png",
        width = 87,
        height = 28
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-02.png",
        width = 45,
        height = 26
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-03.png",
        width = 43,
        height = 38
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-04.png",
        width = 49,
        height = 29
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-05.png",
        width = 61,
        height = 29
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-06.png",
        width = 27,
        height = 27
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-07.png",
        width = 33,
        height = 34
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-08.png",
        width = 38,
        height = 30
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-09.png",
        width = 33,
        height = 35
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-10.png",
        width = 39,
        height = 46
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-11.png",
        width = 93,
        height = 47
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-12.png",
        width = 40,
        height = 47
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-13.png",
        width = 52,
        height = 43
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-14.png",
        width = 41,
        height = 42
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-15.png",
        width = 39,
        height = 36
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-16.png",
        width = 41,
        height = 22
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-17.png",
        width = 53,
        height = 18
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-18.png",
        width = 20,
        height = 26
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-19.png",
        width = 29,
        height = 25
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-20.png",
        width = 54,
        height = 31
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-21.png",
        width = 61,
        height = 39
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-22.png",
        width = 29,
        height = 19
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-23.png",
        width = 34,
        height = 23
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-24.png",
        width = 60,
        height = 27
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-25.png",
        width = 93,
        height = 55
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-26.png",
        width = 43,
        height = 30
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-27.png",
        width = 103,
        height = 43
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-28.png",
        width = 40,
        height = 44
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-29.png",
        width = 50,
        height = 29
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-30.png",
        width = 47,
        height = 53
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-31.png",
        width = 60,
        height = 44
      },
      {
        filename = "__base__/graphics/entity/decorative/green-hairy-grass/green-hairy-grass-32.png",
        width = 88,
        height = 40
      }
    }
  },
  {
    type = "decorative",
    name = "green-carpet-grass",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/green-carpet-grass/green-carpet-grass-01.png",
        width = 105,
        height = 73,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-carpet-grass/green-carpet-grass-02.png",
        width = 185,
        height = 164,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-carpet-grass/green-carpet-grass-03.png",
        width = 173,
        height = 171,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-carpet-grass/green-carpet-grass-04.png",
        width = 106,
        height = 172,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-carpet-grass/green-carpet-grass-05.png",
        width = 204,
        height = 186,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-carpet-grass/green-carpet-grass-06.png",
        width = 149,
        height = 138,
      },
      {
        filename = "__base__/graphics/entity/decorative/green-carpet-grass/green-carpet-grass-07.png",
        width = 173,
        height = 160,
      },
    }
  },

  {
    type = "decorative",
    name = "green-small-grass",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/green-small-grass/green-small-grass-01.png",
        width = 91,
        height = 42
      },
      {
        filename = "__base__/graphics/entity/decorative/green-small-grass/green-small-grass-02.png",
        width = 38,
        height = 36
      },
      {
        filename = "__base__/graphics/entity/decorative/green-small-grass/green-small-grass-03.png",
        width = 65,
        height = 51
      },
      {
        filename = "__base__/graphics/entity/decorative/green-small-grass/green-small-grass-04.png",
        width = 65,
        height = 37
      },
      {
        filename = "__base__/graphics/entity/decorative/green-small-grass/green-small-grass-05.png",
        width = 46,
        height = 31
      },
      {
        filename = "__base__/graphics/entity/decorative/green-small-grass/green-small-grass-06.png",
        width = 56,
        height = 36
      },
      {
        filename = "__base__/graphics/entity/decorative/green-small-grass/green-small-grass-07.png",
        width = 27,
        height = 24
      },
      {
        filename = "__base__/graphics/entity/decorative/green-small-grass/green-small-grass-08.png",
        width = 57,
        height = 27
      }
    }
  },

  {
    type = "decorative",
    name = "root-A",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/roots/root-A-01.png",
        width = 22,
        height = 10,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-02.png",
        width = 9,
        height = 11,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-03.png",
        width = 11,
        height = 10,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-04.png",
        width = 13,
        height = 17,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-05.png",
        width = 15,
        height = 11,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-06.png",
        width = 14,
        height = 13,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-07.png",
        width = 15,
        height = 13,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-08.png",
        width = 12,
        height = 15,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-09.png",
        width = 22,
        height = 16,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-10.png",
        width = 11,
        height = 10,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-11.png",
        width = 22,
        height = 18,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-12.png",
        width = 26,
        height = 17,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-13.png",
        width = 15,
        height = 13,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-14.png",
        width = 13,
        height = 13,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-15.png",
        width = 22,
        height = 17,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-16.png",
        width = 22,
        height = 16,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-17.png",
        width = 13,
        height = 15,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-18.png",
        width = 14,
        height = 17,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-19.png",
        width = 12,
        height = 10,
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-A-20.png",
        width = 13,
        height = 14,
      },
    }
  },

  {
    type = "decorative",
    name = "root-B",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/roots/root-B-01.png",
        width = 38,
        height = 20
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-02.png",
        width = 32,
        height = 25
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-03.png",
        width = 36,
        height = 34
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-04.png",
        width = 40,
        height = 32
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-05.png",
        width = 29,
        height = 24
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-06.png",
        width = 38,
        height = 32
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-07.png",
        width = 19,
        height = 28
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-08.png",
        width = 46,
        height = 29
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-09.png",
        width = 34,
        height = 23
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-10.png",
        width = 21,
        height = 27
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-11.png",
        width = 29,
        height = 24
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-12.png",
        width = 28,
        height = 14
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-13.png",
        width = 34,
        height = 25
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-14.png",
        width = 33,
        height = 25
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-15.png",
        width = 21,
        height = 16
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-16.png",
        width = 35,
        height = 22
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-17.png",
        width = 35,
        height = 13
      },
      {
        filename = "__base__/graphics/entity/decorative/roots/root-B-18.png",
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
        filename = "__base__/graphics/entity/decorative/stone-rock/stone-rock-01.png",
        width = 76,
        height = 60,
        shift = {0.1, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/stone-rock/stone-rock-02.png",
        width = 83,
        height = 86,
        shift = {0.2, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/stone-rock/stone-rock-03.png",
        width = 126,
        height = 98,
        shift = {0.7, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/stone-rock/stone-rock-04.png",
        width = 92,
        height = 108,
        shift = {0.1, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/stone-rock/stone-rock-05.png",
        width = 140,
        height = 99,
        shift = {0.5, 0}
      }
    }
  },

  {
    type = "decorative",
    name = "brown-carpet-grass",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/brown-carpet-grass/brown-carpet-grass-01.png",
        width = 103,
        height = 70,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-carpet-grass/brown-carpet-grass-02.png",
        width = 185,
        height = 164,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-carpet-grass/brown-carpet-grass-03.png",
        width = 96,
        height = 176,
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-carpet-grass/brown-carpet-grass-04.png",
        width = 200,
        height = 179,
      },
    }
  },

  {
    type = "decorative",
    name = "brown-hairy-grass",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/brown-hairy-grass/brown-hairy-grass-01.png",
        width = 88,
        height = 31
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-hairy-grass/brown-hairy-grass-02.png",
        width = 39,
        height = 34
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-hairy-grass/brown-hairy-grass-03.png",
        width = 53,
        height = 29
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-hairy-grass/brown-hairy-grass-04.png",
        width = 47,
        height = 31
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-hairy-grass/brown-hairy-grass-05.png",
        width = 56,
        height = 38
      },
      {
        filename = "__base__/graphics/entity/decorative/brown-hairy-grass/brown-hairy-grass-06.png",
        width = 59,
        height = 28
      },
    }
  },

  {
    type = "decorative",
    name = "small-rock",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-01.png",
        width = 47,
        height = 37,
        shift = {0.21, -0.18}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-02.png",
        width = 46,
        height = 38,
        shift = {0.25, -0.1}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-03.png",
        width = 48,
        height = 42,
        shift = {0.28, -0.21}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-04.png",
        width = 56,
        height = 39,
        shift = {0.28, -0.12}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-05.png",
        width = 54,
        height = 36,
        shift = {0.34, -0.125}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-06.png",
        width = 32,
        height = 26,
        shift = {0.0, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-07.png",
        width = 33,
        height = 28,
        shift = {0.0, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-08.png",
        width = 35,
        height = 26,
        shift = {0.15, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-09.png",
        width = 35,
        height = 23,
        shift = {0.125, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-10.png",
        width = 21,
        height = 21,
        shift = {0.0, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-11.png",
        width = 24,
        height = 16,
        shift = {0.0, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-12.png",
        width = 19,
        height = 17,
        shift = {0.0, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-13.png",
        width = 23,
        height = 15,
        shift = {0.0, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-14.png",
        width = 44,
        height = 42,
        shift = {0.28, -0.18}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-15.png",
        width = 51,
        height = 41,
        shift = {0.31, -0.18}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-16.png",
        width = 55,
        height = 40,
        shift = {0.25, -0.18}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-17.png",
        width = 52,
        height = 44,
        shift = {0.37, -0.21}
      },      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-18.png",
        width = 57,
        height = 39,
        shift = {0.46, -0.15}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-19.png",
        width = 20,
        height = 23,
        shift = {0.0, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-20.png",
        width = 25,
        height = 22,
        shift = {0.0, -0.37}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-21.png",
        width = 31,
        height = 16,
        shift = {0.0, 0.25}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-22.png",
        width = 29,
        height = 16,
        shift = {0.25, -0.25}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-23.png",
        width   = 21,
        height = 20,
        shift = {-0.1, -0.18}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-24.png",
        width = 47,
        height = 29,
        shift = {0.25, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-25.png",
        width = 34,
        height = 33,
        shift = {0.0, -0.12}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-26.png",
        width = 38,
        height = 28,
        shift = {0.06, -0.25}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-27.png",
        width = 31,
        height = 26,
        shift = {0.0, 0}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-28.png",
        width = 45,
        height = 24,
        shift = {0.18, -0.09}
      },
      {
        filename = "__base__/graphics/entity/decorative/small-stone-rock/small-stone-rock-29.png",
        width = 48,
        height = 26,
        shift = {0.21, -0.09}
      }
    }
  }
})


destroyedrailpictures = function()
  return railpicturesinternal({{"metals", "metals-remnants"}, {"backplates", "metals-remnants"}, {"ties", "ties-remnants"}, {"stone_path", "stone-path"}})
end

data:extend(
{
  {
    type = "corpse",
    name = "big-remnants",
    icon = "__base__/graphics/icons/remnants.png",
    flags = {"placeable-neutral", "not-on-map"},
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    subgroup = "remnants",
    order="d[remnants]-a[generic]-c[big]",
    animation =
    {
      {
        width = 109,
        height = 102,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/remnants/big-remnants.png"
      },
      {
        width = 109,
        height = 102,
        frame_count = 1,
        direction_count = 1,
        x = 109,
        filename = "__base__/graphics/entity/remnants/big-remnants.png"
      },
      {
        width = 109,
        height = 102,
        frame_count = 1,
        direction_count = 1,
        x = 218,
        filename = "__base__/graphics/entity/remnants/big-remnants.png"
      },
      {
        width = 109,
        height = 102,
        frame_count = 1,
        direction_count = 1,
        x = 327,
        filename = "__base__/graphics/entity/remnants/big-remnants.png"
      }
    }
  },

  {
    type = "corpse",
    name = "medium-remnants",
    icon = "__base__/graphics/icons/remnants.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    tile_width = 2,
    tile_height = 2,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation =
    {
      {
        width = 94,
        height = 82,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/remnants/medium-remnants.png"
      },
      {
        width = 94,
        height = 82,
        frame_count = 1,
        direction_count = 1,
        x = 94,
        filename = "__base__/graphics/entity/remnants/medium-remnants.png"
      },
      {
        width = 94,
        height = 82,
        frame_count = 1,
        direction_count = 1,
        x = 188,
        filename = "__base__/graphics/entity/remnants/medium-remnants.png"
      },
      {
        width = 94,
        height = 82,
        frame_count = 1,
        direction_count = 1,
        x = 282,
        filename = "__base__/graphics/entity/remnants/medium-remnants.png"
      }
    }
  },

  {
    type = "corpse",
    name = "small-remnants",
    icon = "__base__/graphics/icons/remnants.png",
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation =
    {
      {
        width = 56,
        height = 42,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/remnants/small-remnants.png"
      },
      {
        width = 56,
        height = 42,
        frame_count = 1,
        direction_count = 1,
        x = 56,
        filename = "__base__/graphics/entity/remnants/small-remnants.png"
      },
      {
        width = 56,
        height = 42,
        frame_count = 1,
        direction_count = 1,
        x = 112,
        filename = "__base__/graphics/entity/remnants/small-remnants.png"
      },
      {
        width = 56,
        height = 42,
        frame_count = 1,
        direction_count = 1,
        x = 168,
        filename = "__base__/graphics/entity/remnants/small-remnants.png"
      }
    }
  },
  {
    type = "rail-remnants",
    name = "straight-rail-remnants",
    icon = "__base__/graphics/icons/straight-rail-remnants.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "remnants",
    order="d[remnants]-b[rail]-a[straight]",
    selection_box = {{-0.6, -0.8}, {0.6, 0.8}},
    selectable_in_game = false,
    tile_width = 2,
    tile_height = 2,
    bending_type = "straight",
    pictures = destroyedrailpictures(),
    time_before_removed = 60 * 60 * 45,
    time_before_shading_off = 60 * 60 * 1
  },
  {
    type = "rail-remnants",
    name = "curved-rail-remnants",
    icon = "__base__/graphics/icons/curved-rail-remnants.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "remnants",
    order="d[remnants]-b[rail]-b[curved]",
    collision_box = {{-1, -1}, {1, 1}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    selectable_in_game = false,
    tile_width = 4,
    tile_height = 8,
    bending_type = "turn",
    pictures = destroyedrailpictures(),
    time_before_removed = 60 * 60 * 45,
    time_before_shading_off = 60 * 60 * 1
  },

  {
    type = "container",
    name = "big-ship-wreck-1",
    enable_inventory_bar = false,
    icon = "__base__/graphics/icons/ship-wreck/big-ship-wreck-1.png",
    flags = {"placeable-neutral"},
    subgroup = "wrecks",
    order = "d[remnants]-d[ship-wreck]-a[big]-a",
    max_health = 50,
    collision_box = {{-2.2, -1.5}, {2.2, 1.5}},
    selection_box = {{-2.7, -1.5}, {2.7, 1.5}},
    inventory_size = 3,
    picture =
    {
      filename = "__base__/graphics/entity/ship-wreck/big-ship-wreck-1.png",
      width = 256,
      height = 212,
      shift = {0.7, 0}
    }
  },

  {
    type = "container",
    name = "big-ship-wreck-2",
    enable_inventory_bar = false,
    icon = "__base__/graphics/icons/ship-wreck/big-ship-wreck-2.png",
    flags = {"placeable-neutral"},
    subgroup = "wrecks",
    order = "d[remnants]-d[ship-wreck]-a[big]-b",
    max_health = 50,
    collision_box = {{-1.4, -1.2}, {1.4, 1.2}},
    selection_box = {{-2, -1.5}, {2, 1.5}},
    inventory_size = 3,
    picture =
    {
      filename = "__base__/graphics/entity/ship-wreck/big-ship-wreck-2.png",
      width = 164,
      height = 129,
      shift = {-0.5, 0.6}
    }
  },

  {
    type = "container",
    name = "big-ship-wreck-3",
    enable_inventory_bar = false,
    icon = "__base__/graphics/icons/ship-wreck/big-ship-wreck-3.png",
    flags = {"placeable-neutral"},
    subgroup = "wrecks",
    order = "d[remnants]-d[ship-wreck]-a[big]-c",
    max_health = 50,
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-2, -1.5}, {2, 1.5}},
    inventory_size = 3,
    picture =
    {
      filename = "__base__/graphics/entity/ship-wreck/big-ship-wreck-3.png",
      width = 165,
      height = 131
    }
  },

  {
    type = "simple-entity",
    name = "medium-ship-wreck",
    icon = "__base__/graphics/icons/ship-wreck/medium-ship-wreck.png",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    subgroup = "wrecks",
    order = "d[remnants]-d[ship-wreck]-b[medium]-a",
    max_health = 200,
    collision_box = {{-1.2, -0.9}, {1.2, 0.9}},
    selection_box = {{-1.5, -1.2}, {1.5, 1.2}},
    render_layer = "object",
    pictures =
    {
      {
        filename = "__base__/graphics/entity/ship-wreck/medium-ship-wreck-1.png",
        width = 120,
        height= 85
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/medium-ship-wreck-2.png",
        width = 126,
        height= 107,
        shift = {0.3, 0.1}
      }
    },
  },

  {
    type = "simple-entity",
    name = "small-ship-wreck",
    icon = "__base__/graphics/icons/ship-wreck/small-ship-wreck.png",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    subgroup = "wrecks",
    order = "d[remnants]-d[ship-wreck]-c[small]-a",
    max_health = 200,
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1.3, -1.1}, {1.3, 1.1}},
    pictures =
    {
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-a.png",
        width = 65,
        height= 68
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-b.png",
        width = 109,
        height= 67
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-c.png",
        width = 63,
        height= 54
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-d.png",
        width = 82,
        height= 67
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-e.png",
        width = 78,
        height= 75,
        shift={0.3, -0.2}
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-f.png",
        width = 58,
        height= 35
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-g.png",
        width = 80,
        height= 72
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-h.png",
        width = 79,
        height= 54
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-i.png",
        width = 56,
        height= 55
      }
    },
    render_layer = "object",
  },

  {
    type = "decorative",
    name = "big-ship-wreck-grass",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
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
    render_layer = "floor",
  },

  {
    type = "decorative",
    name = "small-ship-wreck-grass",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/ship-wreck/small-ship-wreck-grass.png",
    subgroup = "wrecks",
    order = "d[remnants]-d[ship-wreck-grass]-b[small]",
    collision_box = {{-1.5, -0.5}, {1.5, 0.5}},
    selection_box = {{-1.7, -0.6}, {1.7, 0.6}},
    selectable_in_game = false,
    render_layer = "floor",
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
  {
    type = "corpse",
    name = "small-scorchmark",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {"doodad-layer", "not-colliding-with-itself"},
    selection_box = {{-1, -1}, {1, 1}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 10, -- 10 minutes
    final_render_layer = "ground_patch_higher2",
    subgroup = "remnants",
    order="d[remnants]-b[scorchmark]-a[small]",
    animation =
    {
      sheet=
      {
        width = 110,
        height = 90,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/scorchmark/small-scorchmark.png",
        variation_count = 3
      }
    },
    ground_patch =
    {
      sheet =
      {
        width = 110,
        height = 90,
        frame_count = 1,
        direction_count = 1,
        x = 110 * 2,
        filename = "__base__/graphics/entity/scorchmark/small-scorchmark.png",
        variation_count = 3
      }
    },
    ground_patch_higher =
    {
      sheet =
      {
        width = 110,
        height = 90,
        frame_count = 1,
        direction_count = 1,
        x = 110,
        filename = "__base__/graphics/entity/scorchmark/small-scorchmark.png",
        variation_count = 3
      }
    }
  }
}
)

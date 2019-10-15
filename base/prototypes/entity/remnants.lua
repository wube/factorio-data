destroyed_rail_pictures = function()
  return rail_pictures_internal({{"metals", "metals-remnants", mipmap = true, variations = 3, priority = "high"},
                                 {"backplates", "backplates-remnants", mipmap = true, variations = 3, priority = "high"},
                                 {"ties", "ties-remnants", variations = 3, priority = "high"},
                                 {"stone_path", "stone-path-remnants", variations = 3, priority = "high"},
                                 {"stone_path_background", "stone-path-background-remnants", variations = 3, priority = "high"}})
end

data:extend
{
  {
    type = "corpse",
    name = "rocket-silo-generic-remnants",
    icon = "__base__/graphics/icons/rocket-silo.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    tile_width = 9,
    tile_height = 9,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(1,
    {
      filename = "__base__/graphics/entity/rocket-silo/15-remnants/rocket-silo-remnants.png",
      line_length = 1,
      width = 318,
      height = 292,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(3, 1),
      hr_version =
      {
        filename = "__base__/graphics/entity/rocket-silo/15-remnants/hr-rocket-silo-remnants.png",
        line_length = 1,
        width = 634,
        height = 582,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(2.5, 0.5),
        scale = 0.5,
      }
    })
  },

  {
    type = "rail-remnants",
    name = "straight-rail-remnants",
    icon = "__base__/graphics/icons/straight-rail-remnants.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "remnants",
    order="d[remnants]-b[rail]-a[straight]",
    collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selectable_in_game = false,
    tile_width = 2,
    tile_height = 2,
    bending_type = "straight",
    pictures = destroyed_rail_pictures(),
    time_before_removed = 60 * 60 * 45,
    time_before_shading_off = 60 * 60 * 1
  },
  {
    type = "rail-remnants",
    name = "curved-rail-remnants",
    icon = "__base__/graphics/icons/curved-rail-remnants.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "remnants",
    order="d[remnants]-b[rail]-b[curved]",
    collision_box = {{-0.75, -0.55}, {0.75, 1.6}},
    secondary_collision_box = {{-0.65, -2.43}, {0.65, 2.43}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    selectable_in_game = false,
    tile_width = 4,
    tile_height = 8,
    bending_type = "turn",
    pictures = destroyed_rail_pictures(),
    time_before_removed = 60 * 60 * 45,
    time_before_shading_off = 60 * 60 * 1
  },

  {
    type = "corpse",
    name = "rail-chain-signal-remnants",
    icon = "__base__/graphics/icons/rail-chain-signal.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet(1,
    {
      filename = "__base__/graphics/entity/rail-chain-signal/remnants/rail-chain-signal-remnants.png",
      line_length = 1,
      width = 50,
      height = 48,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(-2, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/rail-chain-signal/remnants/hr-rail-chain-signal-remnants.png",
        line_length = 1,
        width = 98,
        height = 94,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(-2, -0.5),
        scale = 0.5,
      }
    })
  },

  {
    type = "corpse",
    name = "steel-chest-remnants",
    icon = "__base__/graphics/icons/steel-chest.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/steel-chest/remnants/steel-chest-remnants.png",
      line_length = 1,
      width = 76,
      height = 44,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(15, -1),
      hr_version =
      {
        filename = "__base__/graphics/entity/steel-chest/remnants/hr-steel-chest-remnants.png",
        line_length = 1,
        width = 150,
        height = 88,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(15, -1),
        scale = 0.5,
      }
    }
  },

  {
    type = "corpse",
    name = "buffer-chest-remnants",
    icon = "__base__/graphics/icons/logistic-chest-buffer.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/logistic-chest/remnants/buffer-chest-remnants.png",
      line_length = 1,
      width = 60,
      height = 42,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(10.5, -2.5),
      hr_version =
      {
        filename = "__base__/graphics/entity/logistic-chest/remnants/hr-buffer-chest-remnants.png",
        line_length = 1,
        width = 116,
        height = 82,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(10, -3),
        scale = 0.5,
      }
    }
  },

  {
    type = "corpse",
    name = "active-provider-chest-remnants",
    icon = "__base__/graphics/icons/logistic-chest-active-provider.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/logistic-chest/remnants/active-provider-chest-remnants.png",
      line_length = 1,
      width = 60,
      height = 42,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(10.5, -2.5),
      hr_version =
      {
        filename = "__base__/graphics/entity/logistic-chest/remnants/hr-active-provider-chest-remnants.png",
        line_length = 1,
        width = 116,
        height = 82,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(10, -3),
        scale = 0.5,
      }
    }
  },

  {
    type = "corpse",
    name = "passive-provider-chest-remnants",
    icon = "__base__/graphics/icons/logistic-chest-passive-provider.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/logistic-chest/remnants/passive-provider-chest-remnants.png",
      line_length = 1,
      width = 60,
      height = 42,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(10.5, -2.5),
      hr_version =
      {
        filename = "__base__/graphics/entity/logistic-chest/remnants/hr-passive-provider-chest-remnants.png",
        line_length = 1,
        width = 116,
        height = 82,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(10, -3),
        scale = 0.5,
      }
    }
  },

  {
    type = "corpse",
    name = "requester-chest-remnants",
    icon = "__base__/graphics/icons/logistic-chest-requester.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/logistic-chest/remnants/requester-chest-remnants.png",
      line_length = 1,
      width = 60,
      height = 42,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(10.5, -2.5),
      hr_version =
      {
        filename = "__base__/graphics/entity/logistic-chest/remnants/hr-requester-chest-remnants.png",
        line_length = 1,
        width = 116,
        height = 82,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(10, -3),
        scale = 0.5,
      }
    }
  },

  {
    type = "corpse",
    name = "storage-chest-remnants",
    icon = "__base__/graphics/icons/logistic-chest-storage.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/logistic-chest/remnants/storage-chest-remnants.png",
      line_length = 1,
      width = 60,
      height = 42,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(10.5, -2.5),
      hr_version =
      {
        filename = "__base__/graphics/entity/logistic-chest/remnants/hr-storage-chest-remnants.png",
        line_length = 1,
        width = 116,
        height = 82,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(10, -3),
        scale = 0.5,
      }
    }
  },

  {
    type = "corpse",
    name = "rail-signal-remnants",
    icon = "__base__/graphics/icons/rail-signal.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet(1,
    {
      filename = "__base__/graphics/entity/rail-signal/remnants/rail-signal-remnants.png",
      line_length = 1,
      width = 46,
      height = 44,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(5, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/rail-signal/remnants/hr-rail-signal-remnants.png",
        line_length = 1,
        width = 90,
        height = 88,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(5, 0),
        scale = 0.5,
      }
    })
  },

  {
    type = "corpse",
    name = "filter-inserter-remnants",
    icon = "__base__/graphics/icons/filter-inserter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__base__/graphics/entity/filter-inserter/remnants/filter-inserter-remnants.png",
      line_length = 1,
      width = 68,
      height = 48,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(4, -2),
      hr_version =
      {
        filename = "__base__/graphics/entity/filter-inserter/remnants/hr-filter-inserter-remnants.png",
        line_length = 1,
        width = 134,
        height = 94,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(3.5, -2),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "stack-inserter-remnants",
    icon = "__base__/graphics/icons/stack-inserter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__base__/graphics/entity/stack-inserter/remnants/stack-inserter-remnants.png",
      line_length = 1,
      width = 66,
      height = 50,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(3, -1),
      hr_version =
      {
        filename = "__base__/graphics/entity/stack-inserter/remnants/hr-stack-inserter-remnants.png",
        line_length = 1,
        width = 132,
        height = 96,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(3, -1.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "stack-filter-inserter-remnants",
    icon = "__base__/graphics/icons/stack-filter-inserter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__base__/graphics/entity/stack-filter-inserter/remnants/stack-filter-inserter-remnants.png",
      line_length = 1,
      width = 66,
      height = 50,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(3, -1),
      hr_version =
      {
        filename = "__base__/graphics/entity/stack-filter-inserter/remnants/hr-stack-filter-inserter-remnants.png",
        line_length = 1,
        width = 132,
        height = 96,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(3, -1.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "fast-transport-belt-remnants",
    icon = "__base__/graphics/icons/fast-transport-belt.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =  make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__base__/graphics/entity/fast-transport-belt/remnants/fast-transport-belt-remnants.png",
      line_length = 1,
      width = 54,
      height = 52,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(1, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/fast-transport-belt/remnants/hr-fast-transport-belt-remnants.png",
        line_length = 1,
        width = 106,
        height = 102,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(1, -0.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "fast-splitter-remnants",
    icon = "__base__/graphics/icons/fast-splitter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    tile_width = 2,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/fast-splitter/remnants/fast-splitter-remnants.png",
      line_length = 1,
      width = 96,
      height = 96,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(4, 1.5),
      hr_version =
      {
        filename = "__base__/graphics/entity/fast-splitter/remnants/hr-fast-splitter-remnants.png",
        line_length = 1,
        width = 190,
        height = 190,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(3.5, 1.5),
        scale = 0.5,
      },
    }
  },

  {
    type = "corpse",
    name = "fast-underground-belt-remnants",
    icon = "__base__/graphics/icons/fast-underground-belt.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map", "building-direction-8-way"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/fast-underground-belt/remnants/fast-underground-belt-remnants.png",
      line_length = 1,
      width = 78,
      height = 72,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 8,
      shift = util.by_pixel(10, 3),
      hr_version =
      {
        filename = "__base__/graphics/entity/fast-underground-belt/remnants/hr-fast-underground-belt-remnants.png",
        line_length = 1,
        width = 156,
        height = 144,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 8,
        shift = util.by_pixel(10.5, 3),
        scale = 0.5,
      },
    }
  },

  {
    type = "corpse",
    name = "express-transport-belt-remnants",
    icon = "__base__/graphics/icons/express-transport-belt.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =  make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__base__/graphics/entity/express-transport-belt/remnants/express-transport-belt-remnants.png",
      line_length = 1,
      width = 54,
      height = 52,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(1, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/express-transport-belt/remnants/hr-express-transport-belt-remnants.png",
        line_length = 1,
        width = 106,
        height = 102,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(1, -0.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "express-splitter-remnants",
    icon = "__base__/graphics/icons/express-splitter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    tile_width = 2,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/express-splitter/remnants/express-splitter-remnants.png",
      line_length = 1,
      width = 96,
      height = 96,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(4, 1.5),
      hr_version =
      {
        filename = "__base__/graphics/entity/express-splitter/remnants/hr-express-splitter-remnants.png",
        line_length = 1,
        width = 190,
        height = 190,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(3.5, 1.5),
        scale = 0.5,
      },
    }
  },

  {
    type = "corpse",
    name = "express-underground-belt-remnants",
    icon = "__base__/graphics/icons/express-underground-belt.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map", "building-direction-8-way"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/express-underground-belt/remnants/express-underground-belt-remnants.png",
      line_length = 1,
      width = 78,
      height = 72,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 8,
      shift = util.by_pixel(10, 3),
      hr_version =
      {
        filename = "__base__/graphics/entity/express-underground-belt/remnants/hr-express-underground-belt-remnants.png",
        line_length = 1,
        width = 156,
        height = 144,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 8,
        shift = util.by_pixel(10.5, 3),
        scale = 0.5,
      },
    }
  },

  {
    type = "corpse",
    name = "substation-remnants",
    icon = "__base__/graphics/icons/substation.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup="remnants",
    order = "d[remnants]-a[generic]-a[small]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/substation/remnants/substation-remnants.png",
      line_length = 1,
      width = 92,
      height = 68,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(3, 1),
      hr_version =
      {
        filename = "__base__/graphics/entity/substation/remnants/hr-substation-remnants.png",
        line_length = 1,
        width = 182,
        height = 134,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(2.5, 0.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "storage-tank-remnants",
    icon = "__base__/graphics/icons/storage-tank.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(1,
    {
      filename = "__base__/graphics/entity/storage-tank/remnants/storage-tank-remnants.png",
      line_length = 1,
      width = 214,
      height = 142,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(27, 21), --shift = util.by_pixel(-3, 10.5),
      hr_version =
      {
        filename = "__base__/graphics/entity/storage-tank/remnants/hr-storage-tank-remnants.png",
        line_length = 1,
        width = 426,
        height = 282,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(27, 21), --shift = util.by_pixel(-2.5, 10.5),
        scale = 0.5,
      }
    })
  },

  {
    type = "corpse",
    name = "oil-refinery-remnants",
    icon = "__base__/graphics/icons/oil-refinery.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    tile_width = 5,
    tile_height = 5,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(1,
    {
      filename = "__base__/graphics/entity/oil-refinery/remnants/refinery-remnants.png",
      line_length = 1,
      width = 234,
      height = 200,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(0, 0), --moved from -8.5 to -4.5
      hr_version =
      {
        filename = "__base__/graphics/entity/oil-refinery/remnants/hr-refinery-remnants.png",
        line_length = 1,
        width = 467,
        height = 415,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(-0.25, -0.25), --moved from -8.5 to -4.5
        scale = 0.5,
      }
    })
  },

  {
    type = "corpse",
    name = "pumpjack-remnants",
    icon = "__base__/graphics/icons/pumpjack.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(2,
    {
      filename = "__base__/graphics/entity/pumpjack/remnants/pumpjack-remnants.png",
      line_length = 1,
      width = 138,
      height = 142,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(0, 3),
      hr_version =
      {
        filename = "__base__/graphics/entity/pumpjack/remnants/hr-pumpjack-remnants.png",
        line_length = 1,
        width = 274,
        height = 284,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(0, 3.5),
        scale = 0.5,
      }
    })
  },

  {
    type = "corpse",
    name = "centrifuge-remnants",
    icon = "__base__/graphics/icons/centrifuge.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup="remnants",
    order = "d[remnants]-a[generic]-a[small]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/centrifuge/remnants/centrifuge-remnants.png",
      line_length = 1,
      width = 144,
      height = 142,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(7, 4),
      hr_version =
      {
        filename = "__base__/graphics/entity/centrifuge/remnants/hr-centrifuge-remnants.png",
        line_length = 1,
        width = 286,
        height = 284,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(7, 4),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "laser-turret-remnants",
    icon = "__base__/graphics/icons/laser-turret.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/remnants/laser-turret-remnants.png",
          line_length = 1,
          width = 100,
          height = 98,
          frame_count = 1,
          variation_count = 1,
          axially_symmetrical = false,
          direction_count = 1,
          shift = util.by_pixel(3, -2),
          hr_version =
          {
            filename = "__base__/graphics/entity/laser-turret/remnants/hr-laser-turret-remnants.png",
            line_length = 1,
            width = 198,
            height = 194,
            frame_count = 1,
            variation_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(2.5, -2),
            scale = 0.5,
          }
        },
        {
          priority = "low",
          filename = "__base__/graphics/entity/laser-turret/remnants/mask/laser-turret-remnants-mask.png",
          width = 58,
          height = 48,
          frame_count = 1,
          --tint = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 },
          apply_runtime_tint = true,
          direction_count = 1,
          shift = util.by_pixel(4, -2),
          hr_version=
          {
            priority = "low",
            filename = "__base__/graphics/entity/laser-turret/remnants/mask/hr-laser-turret-remnants-mask.png",
            width = 114,
            height = 94,
            frame_count = 1,
            --tint = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 },
            apply_runtime_tint = true,
            direction_count = 1,
            shift = util.by_pixel(4, -2.5),
            scale = 0.5,
          }
        }
      }
    })
  },

  {
    type = "corpse",
    name = "flamethrower-turret-remnants",
    icon = "__base__/graphics/icons/flamethrower-turret.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-1, -1.5 }, {1, 1.5}},
    tile_width = 2,
    tile_height = 3,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/flamethrower-turret/remnants/flamethrower-turret-remnants.png",
          line_length = 1,
          width = 152,
          height = 164,
          frame_count = 1,
          variation_count = 1,
          axially_symmetrical = false,
          direction_count = 4,
          shift = util.by_pixel(-1, -4),
          hr_version =
          {
            filename = "__base__/graphics/entity/flamethrower-turret/remnants/hr-flamethrower-turret-remnants.png",
            line_length = 1,
            width = 302,
            height = 326,
            frame_count = 1,
            variation_count = 1,
            axially_symmetrical = false,
            direction_count = 4,
            shift = util.by_pixel(-1.5, -4),
            scale = 0.5,
          }
        },
        {
          priority = "low",
          filename = "__base__/graphics/entity/flamethrower-turret/remnants/mask/flamethrower-turret-remnants-mask.png",
          width = 82,
          height = 82,
          frame_count = 1,
          --tint = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 },
          apply_runtime_tint = true,
          direction_count = 4,
          shift = util.by_pixel(0, -4),
          hr_version=
          {
            priority = "low",
            filename = "__base__/graphics/entity/flamethrower-turret/remnants/mask/hr-flamethrower-turret-remnants-mask.png",
            width = 164,
            height = 164,
            frame_count = 1,
            --tint = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 },
            apply_runtime_tint = true,
            direction_count = 4,
            shift = util.by_pixel(0, -3.5),
            scale = 0.5,
          }
        }
      }
    }
  },

  {
    type = "corpse",
    name = "artillery-turret-remnants",
    icon = "__base__/graphics/icons/artillery-turret.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/artillery-turret/remnants/artillery-turret-remnants.png",
      line_length = 1,
      width = 164,
      height = 146,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(10, 2),
      hr_version =
      {
        filename = "__base__/graphics/entity/artillery-turret/remnants/hr-artillery-turret-remnants.png",
        line_length = 1,
        width = 326,
        height = 290,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(9.5, 1.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "roboport-remnants",
    icon = "__base__/graphics/icons/roboport.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-2, -2}, {2, 2}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__base__/graphics/entity/roboport/remnants/roboport-remnants.png",
      line_length = 1,
      width = 182,
      height = 180,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(2, 8),
      hr_version =
      {
        filename = "__base__/graphics/entity/roboport/remnants/hr-roboport-remnants.png",
        line_length = 1,
        width = 364,
        height = 358,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(2, 8),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "accumulator-remnants",
    icon = "__base__/graphics/icons/accumulator.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/accumulator/remnants/accumulator-remnants.png",
      line_length = 1,
      width = 86,
      height = 74,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(2, 4),
      hr_version =
      {
        filename = "__base__/graphics/entity/accumulator/remnants/hr-accumulator-remnants.png",
        line_length = 1,
        width = 172,
        height = 146,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(2.5, 3.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "steam-turbine-remnants",
    icon = "__base__/graphics/icons/steam-turbine.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    tile_width = 3,
    tile_height = 5,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/steam-turbine/remnants/steam-turbine-remnants.png",
      line_length = 1,
      width = 230,
      height = 204,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(6, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/steam-turbine/remnants/hr-steam-turbine-remnants.png",
        line_length = 1,
        width = 460,
        height = 408,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(6, 0),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "pump-remnants",
    icon = "__base__/graphics/icons/pump.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    tile_width = 1,
    tile_height = 2,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/pump/remnants/pump-remnants.png",
      line_length = 1,
      width = 94,
      height = 94,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(2, 2),
      hr_version =
      {
        filename = "__base__/graphics/entity/pump/remnants/hr-pump-remnants.png",
        line_length = 1,
        width = 188,
        height = 186,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(2, 2),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "heat-exchanger-remnants",
    icon = "__base__/graphics/icons/heat-boiler.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-1.5, -1}, {1.5, 1}},
    tile_width = 3,
    tile_height = 2,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/heat-exchanger/remnants/heat-exchanger-remnants.png",
      line_length = 1,
      width = 136,
      height = 132,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(0, 8),
      hr_version =
      {
        filename = "__base__/graphics/entity/heat-exchanger/remnants/hr-heat-exchanger-remnants.png",
        line_length = 1,
        width = 272,
        height = 262,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(0.5, 8),
        scale = 0.5,
      },
    }
  },

  {
    type = "corpse",
    name = "heat-pipe-remnants",
    icon = "__base__/graphics/icons/heat-pipe.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (6,
    {
      filename = "__base__/graphics/entity/heat-pipe/remnants/heat-pipe-remnants.png",
      line_length = 1,
      width = 62,
      height = 52,
      frame_count = 1,
      direction_count = 2,
      shift = util.by_pixel(1, -1),
      hr_version =
      {
        filename = "__base__/graphics/entity/heat-pipe/remnants/hr-heat-pipe-remnants.png",
        line_length = 1,
        width = 122,
        height = 100,
        frame_count = 1,
        direction_count = 2,
        shift = util.by_pixel(0.5, -1.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "constant-combinator-remnants",
    icon = "__base__/graphics/icons/constant-combinator.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/combinator/remnants/constant/constant-combinator-remnants.png",
      line_length = 1,
      width = 60,
      height = 56,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(0, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/combinator/remnants/constant/hr-constant-combinator-remnants.png",
        line_length = 1,
        width = 118,
        height = 112,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(0, 0),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "arithmetic-combinator-remnants",
    icon = "__base__/graphics/icons/arithmetic-combinator.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    tile_width = 1,
    tile_height = 2,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/combinator/remnants/arithmetic/arithmetic-combinator-remnants.png",
      line_length = 1,
      width = 78,
      height = 78,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(0, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/combinator/remnants/arithmetic/hr-arithmetic-combinator-remnants.png",
        line_length = 1,
        width = 156,
        height = 156,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(0, 0),
        scale = 0.5,
      },
    }
  },

  {
    type = "corpse",
    name = "decider-combinator-remnants",
    icon = "__base__/graphics/icons/decider-combinator.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    tile_width = 1,
    tile_height = 2,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/combinator/remnants/decider/decider-combinator-remnants.png",
      line_length = 1,
      width = 78,
      height = 78,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(0, -1),
      hr_version =
      {
        filename = "__base__/graphics/entity/combinator/remnants/decider/hr-decider-combinator-remnants.png",
        line_length = 1,
        width = 156,
        height = 156,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(0, -0.5),
        scale = 0.5,
      },
    }
  },
  
{
  type = "corpse",
  name = "programmable-speaker-remnants",
  icon = "__base__/graphics/icons/programmable-speaker.png",
  icon_size = 32,
  flags = {"placeable-neutral", "not-on-map"},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  tile_width = 1,
  tile_height = 1,
  selectable_in_game = false,
  subgroup = "remnants",
  order="d[remnants]-a[generic]-a[small]",
  time_before_removed = 60 * 60 * 15, -- 15 minutes
  final_render_layer = "remnants",
  animation_overlay_final_render_layer = "object",
  remove_on_tile_placement = false,
  animation = make_rotated_animation_variations_from_sheet (3,
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/programmable-speaker/remnants/programmable-speaker-base-remnants.png",
        line_length = 1,
        width = 86,
        height = 60,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(12, 0),
        hr_version =
        {
          filename = "__base__/graphics/entity/programmable-speaker/remnants/hr-programmable-speaker-base-remnants.png",
          line_length = 1,
          width = 170,
          height = 120,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(12, 0),
          scale = 0.5,
        }
      }
    },
  }),
  
  animation_overlay = make_rotated_animation_variations_from_sheet (3,
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/programmable-speaker/remnants/programmable-speaker-top-remnants.png",
        line_length = 1,
        width = 38,
        height = 46,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(1, -18),
        hr_version =
        {
          filename = "__base__/graphics/entity/programmable-speaker/remnants/hr-programmable-speaker-top-remnants.png",
          line_length = 1,
          width = 74,
          height = 90,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(0.5, -18),
          scale = 0.5,
        }
      },
    }
  })
 },

{
  type = "corpse",
  name = "train-stop-remnants",
  icon = "__base__/graphics/icons/train-stop.png",
  icon_size = 32,
  flags = {"placeable-neutral", "not-on-map"},
  selection_box = {{-1, -1}, {1, 1}},
  tile_width = 2,
  tile_height = 2,
  selectable_in_game = false,
  subgroup = "remnants",
  order="d[remnants]-a[generic]-a[small]",
  time_before_removed = 60 * 60 * 15, -- 15 minutes
  final_render_layer = "remnants",
  animation_overlay_final_render_layer = "object",
  remove_on_tile_placement = false,
  animation =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/train-stop/remnants/train-stop-base-remnants.png",
        line_length = 1,
        width = 244,
        height = 228,
        frame_count = 1,
        direction_count = 4,
        shift = util.by_pixel(5, 14),
        hr_version =
        {
          filename = "__base__/graphics/entity/train-stop/remnants/hr-train-stop-base-remnants.png",
          line_length = 1,
          width = 486,
          height = 454,
          frame_count = 1,
          shift = util.by_pixel(4.5, 13.5),
          direction_count = 4,
          scale = 0.5,
        }
      },
      {
        priority = "low",
        filename = "__base__/graphics/entity/train-stop/remnants/mask/train-stop-base-remnants-mask.png",
        width = 142,
        height = 108,
        frame_count = 1,
        --tint = { r = 0.94, g = 0.0  , b = 0.0, a = 0.5 },
        apply_runtime_tint = true,
        direction_count = 4,
        shift = util.by_pixel(-1, -1),
        hr_version=
        {
          priority = "low",
          filename = "__base__/graphics/entity/train-stop/remnants/mask/hr-train-stop-base-remnants-mask.png",
          width = 284,
          height = 214,
          frame_count = 1,
          --tint = { r = 0.94, g = 0.0  , b = 0, a = 0.5 },
          apply_runtime_tint = true,
          direction_count = 4,
          shift = util.by_pixel(-1, 0.5),
          scale = 0.5,
        }
      }
    },
  },

  animation_overlay =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/train-stop/remnants/train-stop-top-remnants.png",
        line_length = 1,
        width = 68,
        height = 128,
        frame_count = 1,
        direction_count = 4,
        shift = util.by_pixel(1, -38),
        hr_version =
        {
          filename = "__base__/graphics/entity/train-stop/remnants/hr-train-stop-top-remnants.png",
          line_length = 1,
          width = 136,
          height = 254,
          frame_count = 1,
          shift = util.by_pixel(1.5, -38),
          direction_count = 4,
          scale = 0.5,
        }
      },
    }
  }
 },

  {
    type = "corpse",
    name = "solar-panel-remnants",
    icon = "__base__/graphics/icons/solar-panel.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__base__/graphics/entity/solar-panel/remnants/solar-panel-remnants.png",
      line_length = 1,
      width = 146,
      height = 142,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(4, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/solar-panel/remnants/hr-solar-panel-remnants.png",
        line_length = 1,
        width = 290,
        height = 282,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(3.5, 0),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "nuclear-reactor-remnants",
    icon = "__base__/graphics/icons/nuclear-reactor.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    tile_width = 5,
    tile_height = 5,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/remnants/nuclear-reactor-remnants.png",
      line_length = 1,
      width = 206,
      height = 198,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(7, 4),
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/remnants/hr-nuclear-reactor-remnants.png",
        line_length = 1,
        width = 410,
        height = 396,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(7, 4),
        scale = 0.5,
      },
    }
  },

    {
    type = "corpse",
    name = "chemical-plant-remnants",
    icon = "__base__/graphics/icons/chemical-plant.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/chemical-plant/remnants/chemical-plant-remnants.png",
      line_length = 1,
      width = 224,
      height = 172,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(16, -5),
      hr_version =
      {
        filename = "__base__/graphics/entity/chemical-plant/remnants/hr-chemical-plant-remnants.png",
        line_length = 1,
        width = 446,
        height = 342,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(16, -5.5),
        scale = 0.5,
      }
    }
  },

  {
    type = "corpse",
    name = "tank-remnants",
    icon = "__base__/graphics/icons/tank.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    tile_width = 3,
    tile_height = 5,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/tank/remnants/tank-remnants.png",
          line_length = 1,
          width = 208,
          height = 190,
          frame_count = 1,
          direction_count = 4,
          shift = util.by_pixel(4, 0),
          hr_version =
          {
            filename = "__base__/graphics/entity/tank/remnants/hr-tank-remnants.png",
            line_length = 1,
            width = 414,
            height = 380,
            frame_count = 1,
            direction_count = 4,
            shift = util.by_pixel(4, 0.5),
            scale = 0.5,
          }
        },
        {
          priority = "low",
          filename = "__base__/graphics/entity/tank/remnants/mask/tank-remnants-mask.png",
          width = 126,
          height = 110,
          frame_count = 1,
          --tint = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 },
          apply_runtime_tint = true,
          direction_count = 4,
          shift = util.by_pixel(7, -1),
          hr_version=
          {
            priority = "low",
            filename = "__base__/graphics/entity/tank/remnants/mask/hr-tank-remnants-mask.png",
            width = 250,
            height = 218,
            frame_count = 1,
            --tint = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 },
            apply_runtime_tint = true,
            direction_count = 4,
            shift = util.by_pixel(6.5, -1.5),
            scale = 0.5,
          }
        }
      }
    }
  },

    {
    type = "corpse",
    name = "locomotive-remnants",
    icon = "__base__/graphics/icons/diesel-locomotive.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-1.0, -3.0}, {1.0, 3.0}},
    tile_width = 2,
    tile_height = 6,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/diesel-locomotive/remnants/diesel-locomotive-base-remnants.png",
          line_length = 1,
          width = 230,
          height = 218,
          frame_count = 1,
          direction_count = 8,
          shift = util.by_pixel(4, 0),
          hr_version =
          {
            filename = "__base__/graphics/entity/diesel-locomotive/remnants/hr-diesel-locomotive-base-remnants.png",
            line_length = 1,
            width = 460,
            height = 436,
            frame_count = 1,
            direction_count = 8,
            shift = util.by_pixel(4, 0.5),
            scale = 0.5,
          }
        },
        {
          priority = "low",
          filename = "__base__/graphics/entity/diesel-locomotive/remnants/mask/diesel-locomotive-remnants-mask.png",
          width = 196,
          height = 146,
          frame_count = 1,
          --tint = { r = 0.91, g = 0.06  , b = 0.0, a = 0.35 },
          apply_runtime_tint = true,
          direction_count = 8,
          shift = util.by_pixel(0, 2),
          hr_version=
          {
            priority = "low",
            filename = "__base__/graphics/entity/diesel-locomotive/remnants/mask/hr-diesel-locomotive-remnants-mask.png",
            width = 390,
            height = 292,
            frame_count = 1,
            --tint = { r = 0.91, g = 0.06  , b = 0.00, a = 0.35 },
            apply_runtime_tint = true,
            direction_count = 8,
            shift = util.by_pixel(0, 2),
            scale = 0.5,
          }
        }
      }
    }
  },

  {
    type = "corpse",
    name = "cargo-wagon-remnants",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-1.0, -3.0}, {1.0, 3.0}},
    tile_width = 2,
    tile_height = 6,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/cargo-wagon/remnants/cargo-wagon-remnants.png",
      line_length = 1,
      width = 248,
      height = 242,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 8,
      shift = util.by_pixel(2, 6),
      hr_version =
      {
        filename = "__base__/graphics/entity/cargo-wagon/remnants/hr-cargo-wagon-remnants.png",
        line_length = 1,
        width = 494,
        height = 484,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 8,
        shift = util.by_pixel(1.5, 6),
        scale = 0.5,
      },
    }
  },

  {
    type = "corpse",
    name = "fluid-wagon-remnants",
    icon = "__base__/graphics/icons/fluid-wagon.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-1.0, -3.0}, {1.0, 3.0}},
    tile_width = 2,
    tile_height = 6,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/fluid-wagon/remnants/fluid-wagon-remnants.png",
      line_length = 1,
      width = 246,
      height = 254,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 8,
      shift = util.by_pixel(2, -5),
      hr_version =
      {
        filename = "__base__/graphics/entity/fluid-wagon/remnants/hr-fluid-wagon-remnants.png",
        line_length = 1,
        width = 490,
        height = 504,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 8,
        shift = util.by_pixel(2, -5.5),
        scale = 0.5,
      },
    }
  },

    {
    type = "corpse",
    name = "artillery-wagon-remnants",
    icon = "__base__/graphics/icons/artillery-wagon.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-1.0, -3.0}, {1.0, 3.0}},
    tile_width = 2,
    tile_height = 6,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/artillery-wagon/remnants/artillery-wagon-remnants.png",
      line_length = 1,
      width = 230,
      height = 232,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 8,
      shift = util.by_pixel(2, 6),
      hr_version =
      {
        filename = "__base__/graphics/entity/artillery-wagon/remnants/hr-artillery-wagon-remnants.png",
        line_length = 1,
        width = 458,
        height = 464,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 8,
        shift = util.by_pixel(1, -0.5),
        scale = 0.5,
      },
    }
  },
}

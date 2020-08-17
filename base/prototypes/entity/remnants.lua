destroyed_rail_pictures = function()
  return rail_pictures_internal({{"metals", "metals-remnants", mipmap = true, variations = 3, priority = "high"},
                                 {"backplates", "backplates-remnants", mipmap = true, variations = 3, priority = "high"},
                                 {"ties", "ties-remnants", variations = 3, priority = "high"},
                                 {"stone_path", "stone-path-remnants", variations = 3, priority = "high"},
                                 {"stone_path_background", "stone-path-background-remnants", variations = 3, priority = "high"}})
end

local remnants =
{
  {
    type = "corpse",
    name = "rocket-silo-remnants",
    icon = "__base__/graphics/icons/rocket-silo.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "defensive-structure-remnants",
    order = "a-h-a",
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    tile_width = 9,
    tile_height = 9,
    selectable_in_game = false,
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
    type = "corpse",
    name = "buffer-chest-remnants",
    localised_name = {"remnant-name", {"entity-name.logistic-chest-buffer"}},
    icon = "__base__/graphics/icons/logistic-chest-buffer.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "logistic-network-remnants",
    order = "a-f-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
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
    localised_name = {"remnant-name", {"entity-name.logistic-chest-active-provider"}},
    icon = "__base__/graphics/icons/logistic-chest-active-provider.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "logistic-network-remnants",
    order = "a-c-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
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
    localised_name = {"remnant-name", {"entity-name.logistic-chest-passive-provider"}},
    icon = "__base__/graphics/icons/logistic-chest-passive-provider.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "logistic-network-remnants",
    order = "a-d-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
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
    localised_name = {"remnant-name", {"entity-name.logistic-chest-requester"}},
    icon = "__base__/graphics/icons/logistic-chest-requester.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "logistic-network-remnants",
    order = "a-g-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
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
    localised_name = {"remnant-name", {"entity-name.logistic-chest-storage"}},
    icon = "__base__/graphics/icons/logistic-chest-storage.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "logistic-network-remnants",
    order = "a-e-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
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
    name = "stack-inserter-remnants",
    icon = "__base__/graphics/icons/stack-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "inserter-remnants",
    order = "a-f-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
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
    name = "land-mine-remnants",
    icon = "__base__/graphics/icons/land-mine.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "defensive-structure-remnants",
    order = "a-i-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/land-mine/remnants/land-mine-remnants.png",
      line_length = 1,
      width = 68,
      height = 66,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(2, 5),
      hr_version =
      {
        filename = "__base__/graphics/entity/land-mine/remnants/hr-land-mine-remnants.png",
        line_length = 1,
        width = 134,
        height = 130,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(1.5, 5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "stack-filter-inserter-remnants",
    icon = "__base__/graphics/icons/stack-filter-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "inserter-remnants",
    order = "a-g-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
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
    name = "express-transport-belt-remnants",
    icon = "__base__/graphics/icons/express-transport-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "belt-remnants",
    order = "a-c-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "belt-remnants",
    order = "a-i-a",
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    tile_width = 2,
    tile_height = 1,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "building-direction-8-way"},
    subgroup = "belt-remnants",
    order = "a-f-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "storage-remnants",
    order = "a-d-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "production-machine-remnants",
    order = "a-d-a",
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    tile_width = 5,
    tile_height = 5,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "extraction-machine-remnants",
    order = "a-d-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "production-machine-remnants",
    order = "a-f-a",
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
    name = "flamethrower-turret-remnants",
    icon = "__base__/graphics/icons/flamethrower-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "defensive-structure-remnants",
    order = "a-e-a",
    selection_box = {{-1, -1.5 }, {1, 1.5}},
    tile_width = 2,
    tile_height = 3,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "defensive-structure-remnants",
    order = "a-f-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "logistic-network-remnants",
    order = "a-h-a",
    selection_box = {{-2, -2}, {2, 2}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
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
    name = "logistic-robot-remnants",
    icon = "__base__/graphics/icons/logistic-robot.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/logistic-robot/remnants/logistic-robot-remnants.png",
      line_length = 1,
      width = 58,
      height = 58,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(1, 1),
      hr_version =
      {
        filename = "__base__/graphics/entity/logistic-robot/remnants/hr-logistic-robot-remnants.png",
        line_length = 1,
        width = 116,
        height = 114,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(1, 1),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "construction-robot-remnants",
    icon = "__base__/graphics/icons/construction-robot.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/construction-robot/remnants/construction-robot-remnants.png",
      line_length = 1,
      width = 60,
      height = 58,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(2, 1),
      hr_version =
      {
        filename = "__base__/graphics/entity/construction-robot/remnants/hr-construction-robot-remnants.png",
        line_length = 1,
        width = 120,
        height = 114,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(2, 1),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "distractor-remnants",
    icon = "__base__/graphics/icons/distractor.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/distractor-robot/remnants/distractor-robot-remnants.png",
      line_length = 1,
      width = 56,
      height = 56,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(-1, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/distractor-robot/remnants/hr-distractor-robot-remnants.png",
        line_length = 1,
        width = 112,
        height = 110,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(-0.5, 0),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "destroyer-remnants",
    icon = "__base__/graphics/icons/destroyer.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/destroyer-robot/remnants/destroyer-robot-remnants.png",
      line_length = 1,
      width = 60,
      height = 56,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(1, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/destroyer-robot/remnants/hr-destroyer-robot-remnants.png",
        line_length = 1,
        width = 120,
        height = 108,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(1.5, -0.5), -- was -0.5
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "steam-turbine-remnants",
    icon = "__base__/graphics/icons/steam-turbine.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-remnants",
    order = "a-h-a",
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    tile_width = 3,
    tile_height = 5,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
    selection_box = {{-0.5, -1}, {0.5, 1}},
    tile_width = 1,
    tile_height = 2,
    selectable_in_game = false,
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
    name = "beacon-remnants",
    icon = "__base__/graphics/icons/beacon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
    selection_box = {{-0.5, -1}, {0.5, 1}},
    tile_width = 1,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__base__/graphics/entity/beacon/remnants/beacon-remnants.png",
      line_length = 1,
      width = 106,
      height = 104,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(1, 5),
      hr_version =
      {
        filename = "__base__/graphics/entity/beacon/remnants/hr-beacon-remnants.png",
        line_length = 1,
        width = 212,
        height = 206,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(1, 5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "heat-exchanger-remnants",
    icon = "__base__/graphics/icons/heat-boiler.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-remnants",
    order = "a-g-a",
    selection_box = {{-1.5, -1}, {1.5, 1}},
    tile_width = 3,
    tile_height = 2,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-remnants",
    order = "a-f-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
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
    name = "nuclear-reactor-remnants",
    icon = "__base__/graphics/icons/nuclear-reactor.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-remnants",
    order = "a-e-a",
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    tile_width = 5,
    tile_height = 5,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "production-machine-remnants",
    order = "a-e-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "transport-remnants",
    order = "a-k-a",
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    tile_width = 3,
    tile_height = 5,
    selectable_in_game = false,
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
    name = "fluid-wagon-remnants",
    icon = "__base__/graphics/icons/fluid-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "train-transport-remnants",
    order = "a-h-a",
    selection_box = {{-1.0, -3.0}, {1.0, 3.0}},
    tile_width = 2,
    tile_height = 6,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "train-transport-remnants",
    order = "a-i-a",
    selection_box = {{-1.0, -3.0}, {1.0, 3.0}},
    tile_width = 2,
    tile_height = 6,
    selectable_in_game = false,
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

  {
    type = "corpse",
    name = "assembling-machine-3-remnants",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "production-machine-remnants",
    order = "a-a-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/assembling-machine-3/remnants/assembling-machine-3-remnants.png",
      line_length = 1,
      width = 164,
      height = 142,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(0, 10),
      hr_version =
      {
        filename = "__base__/graphics/entity/assembling-machine-3/remnants/hr-assembling-machine-3-remnants.png",
        line_length = 1,
        width = 328,
        height = 282,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(0, 9.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "spidertron-remnants",
    icon = "__base__/graphics/icons/spidertron.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "transport-remnants",
    order = "a-l-a",
    selection_box = {{-3, -3}, {3, 3}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/spidertron/remnants/spidertron-remnants.png",
          line_length = 1,
          width = 224,
          height = 224,
          frame_count = 1,
          variation_count = 1,
          axially_symmetrical = false,
          direction_count = 1,
          shift = util.by_pixel(0, 0),
          hr_version =
          {
            filename = "__base__/graphics/entity/spidertron/remnants/hr-spidertron-remnants.png",
            line_length = 1,
            width = 448,
            height = 448,
            frame_count = 1,
            variation_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(0, 0),
            scale = 0.5,
          }
        },
        {
          priority = "low",
          filename = "__base__/graphics/entity/spidertron/remnants/mask/spidertron-remnants-mask.png",
          width = 184,
          height = 176,
          frame_count = 1,
         -- tint = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 },
          apply_runtime_tint = true,
          direction_count = 1,
          shift = util.by_pixel(9, 1),
          hr_version=
          {
            priority = "low",
            filename = "__base__/graphics/entity/spidertron/remnants/mask/hr-spidertron-remnants-mask.png",
            width = 366,
            height = 350,
            frame_count = 1,
            --tint = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 },
            apply_runtime_tint = true,
            direction_count = 1,
            shift = util.by_pixel(9, 1),
            scale = 0.5,
          }
        }
      }
    })
  },

  {
    type = "corpse",
    name = "medium-scorchmark",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    collision_mask = {"doodad-layer", "not-colliding-with-itself"},
    selection_box = {{-2, -2}, {2, 2}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 10, -- 10 minutes
    final_render_layer = "ground-patch-higher2",
    subgroup = "scorchmarks",
    order="a-c-a",
    remove_on_entity_placement = false,
    remove_on_tile_placement = true,
    use_tile_color_for_ground_patch_tint = false,
    ground_patch =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/medium-scorchmark.png",
        width = 256,
        height = 176,
        line_length = 2,
        shift = util.by_pixel(0, -2),
        variation_count = 2,
        hr_version =
        {
          filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark.png",
          width = 510,
          height = 352,
          line_length = 2,
          shift = util.by_pixel(0, 0),
          variation_count = 2,
          scale = 0.5,
        }
      }
    },
    ground_patch_higher =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-top.png",
        width = 68,
        height = 50,
        line_length = 2,
        variation_count = 2,
        shift = util.by_pixel(0, 0),
        hr_version =
        {
          filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark-top.png",
          width = 136,
          height = 100,
          line_length = 2,
          shift = util.by_pixel(0, 0),
          variation_count = 2,
          scale = 0.5,
        }
      }
    }
  },

  {
    type = "corpse",
    name = "medium-scorchmark-tintable",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    collision_mask = {"doodad-layer", "not-colliding-with-itself"},
    selection_box = {{-2, -2}, {2, 2}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 10, -- 10 minutes
    final_render_layer = "ground-patch-higher2",
    subgroup = "scorchmarks",
    order="a-d-a",
    remove_on_entity_placement = false,
    remove_on_tile_placement = true,
    use_tile_color_for_ground_patch_tint = true,
    ground_patch =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable.png",
        width = 256,
        height = 176,
        line_length = 2,
        shift = util.by_pixel(0, -2),
        apply_runtime_tint = true,
        variation_count = 2,
        hr_version =
        {
          filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark-tintable.png",
          width = 510,
          height = 352,
          line_length = 2,
          shift = util.by_pixel(0, 0),
          apply_runtime_tint = true,
          variation_count = 2,
          scale = 0.5,
        }
      }
    },
    ground_patch_higher =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable-top.png",
        width = 68,
        height = 50,
        line_length = 2,
        variation_count = 2,
        shift = util.by_pixel(0, 0),
        apply_runtime_tint = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark-tintable-top.png",
          width = 136,
          height = 100,
          line_length = 2,
          shift = util.by_pixel(0, 0),
          apply_runtime_tint = true,
          variation_count = 2,
          scale = 0.5,
        }
      }
    }
  },

  {
    type = "corpse",
    name = "big-scorchmark",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    collision_box = {{-4.5, -4.5}, {4.5, 4.5}},
    collision_mask = {"doodad-layer", "not-colliding-with-itself"},
    selection_box = {{-4, -4}, {4, 4}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 10, -- 10 minutes
    final_render_layer = "ground-patch-higher2",
    subgroup = "scorchmarks",
    order="a-e-a",
    remove_on_entity_placement = false,
    remove_on_tile_placement = true,
    use_tile_color_for_ground_patch_tint = true,
    ground_patch =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/big-scorchmark.png",
        width = 480,
        height = 352,
        line_length = 1,
        shift = util.by_pixel(0, 0),
        dice_y = 2,
        variation_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark.png",
          width = 960,
          height = 704,
          line_length = 1,
          shift = util.by_pixel(0, 0),
          dice_y = 2,
          variation_count = 1,
          scale = 0.5,
        }
      }
    },
    ground_patch_higher =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/big-scorchmark-top.png",
        width = 138,
        height = 96,
        line_length = 1,
        variation_count = 1,
        shift = util.by_pixel(0, 0),
        hr_version =
        {
          filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark-top.png",
          width = 274,
          height = 194,
          line_length = 1,
          shift = util.by_pixel(0, 0),
          variation_count = 1,
          scale = 0.5,
        }
      }
    }
  },

  {
    type = "corpse",
    name = "big-scorchmark-tintable",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    collision_box = {{-4.5, -4.5}, {4.5, 4.5}},
    collision_mask = {"doodad-layer", "not-colliding-with-itself"},
    selection_box = {{-4, -4}, {4, 4}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 10, -- 10 minutes
    final_render_layer = "ground-patch-higher2",
    subgroup = "scorchmarks",
    order="a-f-a",
    remove_on_entity_placement = false,
    remove_on_tile_placement = true,
    use_tile_color_for_ground_patch_tint = true,
    ground_patch =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable.png",
        width = 480,
        height = 352,
        line_length = 1,
        shift = util.by_pixel(0, 0),
        apply_runtime_tint = true,
        dice_y = 2,
        variation_count = 1,
        hr_version =
        {
          filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark-tintable.png",
          width = 960,
          height = 704,
          line_length = 1,
          shift = util.by_pixel(0, 0),
          apply_runtime_tint = true,
          dice_y = 2,
          variation_count = 1,
          scale = 0.5,
        }
      }
    },
    ground_patch_higher =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable-top.png",
        width = 138,
        height = 96,
        line_length = 1,
        variation_count = 1,
        shift = util.by_pixel(0, 0),
        apply_runtime_tint = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark-tintable-top.png",
          width = 274,
          height = 194,
          line_length = 1,
          shift = util.by_pixel(0, 0),
          apply_runtime_tint = true,
          variation_count = 1,
          scale = 0.5,
        }
      }
    }
  },

  {
    type = "corpse",
    name = "huge-scorchmark",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    collision_box = {{-4.5, -4.5}, {4.5, 4.5}},
    collision_mask = {"doodad-layer", "not-colliding-with-itself"},
    selection_box = {{-4, -4}, {4, 4}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 10, -- 10 minutes
    final_render_layer = "ground-patch-higher2",
    subgroup = "scorchmarks",
    order="a-g-a",
    remove_on_entity_placement = false,
    remove_on_tile_placement = true,
    use_tile_color_for_ground_patch_tint = true,
    ground_patch =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark.png",
          width = 480,
          height = 352,
          line_length = 1,
          shift = util.by_pixel(0, -24),
          variation_count = 1,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark.png",
            width = 960,
            height = 704,
            line_length = 1,
            shift = util.by_pixel(0, -24),
            variation_count = 1,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark.png",
          width = 256,
          height = 176,
          line_length = 2,
          shift = util.by_pixel(44, -25),
          variation_count = 2,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark.png",
            width = 510,
            height = 352,
            line_length = 2,
            shift = util.by_pixel(44, -23),
            variation_count = 2,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark.png",
          width = 256,
          height = 176,
          line_length = 2,
          shift = util.by_pixel(-44, -25),
          variation_count = 2,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark.png",
            width = 510,
            height = 352,
            line_length = 2,
            shift = util.by_pixel(-44, -23),
            variation_count = 2,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark.png",
          width = 480,
          height = 352,
          line_length = 1,
          shift = util.by_pixel(32, 0),
          variation_count = 1,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark.png",
            width = 960,
            height = 704,
            line_length = 1,
            shift = util.by_pixel(32, 0),
            variation_count = 1,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark.png",
          width = 480,
          height = 352,
          line_length = 1,
          shift = util.by_pixel(-32, 0),
          variation_count = 1,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark.png",
            width = 960,
            height = 704,
            line_length = 1,
            shift = util.by_pixel(-32, 0),
            variation_count = 1,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark.png",
          width = 256,
          height = 176,
          line_length = 2,
          shift = util.by_pixel(44, 21),
          variation_count = 2,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark.png",
            width = 510,
            height = 352,
            line_length = 2,
            shift = util.by_pixel(44, 23),
            variation_count = 2,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark.png",
          width = 256,
          height = 176,
          line_length = 2,
          shift = util.by_pixel(-44, 21),
          variation_count = 2,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark.png",
            width = 510,
            height = 352,
            line_length = 2,
            shift = util.by_pixel(-44, 23),
            variation_count = 2,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark.png",
          width = 480,
          height = 352,
          line_length = 1,
          shift = util.by_pixel(0, 24),
          variation_count = 1,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark.png",
            width = 960,
            height = 704,
            line_length = 1,
            shift = util.by_pixel(0, 24),
            variation_count = 1,
            scale = 0.5,
          }
        },
      }
    },
    ground_patch_higher =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-top.png",
          width = 138,
          height = 96,
          line_length = 1,
          variation_count = 1,
          shift = util.by_pixel(0, -24),
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark-top.png",
            width = 274,
            height = 194,
            line_length = 1,
            shift = util.by_pixel(0, -24),
            variation_count = 1,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-top.png",
          width = 68,
          height = 50,
          line_length = 2,
          variation_count = 2,
          shift = util.by_pixel(44, -23),
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark-top.png",
            width = 136,
            height = 100,
            line_length = 2,
            shift = util.by_pixel(44, -23),
            variation_count = 2,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-top.png",
          width = 68,
          height = 50,
          line_length = 2,
          variation_count = 2,
          shift = util.by_pixel(-44, -23),
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark-top.png",
            width = 136,
            height = 100,
            line_length = 2,
            shift = util.by_pixel(-44, -23),
            variation_count = 2,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-top.png",
          width = 138,
          height = 96,
          line_length = 1,
          variation_count = 1,
          shift = util.by_pixel(32, 0),
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark-top.png",
            width = 274,
            height = 194,
            line_length = 1,
            shift = util.by_pixel(32, 0),
            variation_count = 1,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-top.png",
          width = 138,
          height = 96,
          line_length = 1,
          variation_count = 1,
          shift = util.by_pixel(-32, 0),
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark-top.png",
            width = 274,
            height = 194,
            line_length = 1,
            shift = util.by_pixel(-32, 0),
            variation_count = 1,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-top.png",
          width = 68,
          height = 50,
          line_length = 2,
          variation_count = 2,
          shift = util.by_pixel(44, 23),
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark-top.png",
            width = 136,
            height = 100,
            line_length = 2,
            shift = util.by_pixel(44, 23),
            variation_count = 2,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-top.png",
          width = 68,
          height = 50,
          line_length = 2,
          variation_count = 2,
          shift = util.by_pixel(-44, 23),
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark-top.png",
            width = 136,
            height = 100,
            line_length = 2,
            shift = util.by_pixel(-44, 23),
            variation_count = 2,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-top.png",
          width = 138,
          height = 96,
          line_length = 1,
          variation_count = 1,
          shift = util.by_pixel(0, 24),
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark-top.png",
            width = 274,
            height = 194,
            line_length = 1,
            shift = util.by_pixel(0, 24),
            variation_count = 1,
            scale = 0.5,
          }
        },
      }
    }
  },

  {
    type = "corpse",
    name = "huge-scorchmark-tintable",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    collision_box = {{-4.5, -4.5}, {4.5, 4.5}},
    collision_mask = {"doodad-layer", "not-colliding-with-itself"},
    selection_box = {{-4, -4}, {4, 4}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 10, -- 10 minutes
    final_render_layer = "ground-patch-higher2",
    subgroup = "scorchmarks",
    order="a-h-a",
    remove_on_entity_placement = false,
    remove_on_tile_placement = true,
    use_tile_color_for_ground_patch_tint = true,
    ground_patch =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable.png",
          width = 480,
          height = 352,
          line_length = 1,
          shift = util.by_pixel(0, -24),
          apply_runtime_tint = true,
          variation_count = 1,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark-tintable.png",
            width = 960,
            height = 704,
            line_length = 1,
            shift = util.by_pixel(0, -24),
            apply_runtime_tint = true,
            variation_count = 1,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable.png",
          width = 256,
          height = 176,
          line_length = 2,
          shift = util.by_pixel(44, -25),
          apply_runtime_tint = true,
          variation_count = 2,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark-tintable.png",
            width = 510,
            height = 352,
            line_length = 2,
            shift = util.by_pixel(44, -23),
            apply_runtime_tint = true,
            variation_count = 2,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable.png",
          width = 256,
          height = 176,
          line_length = 2,
          shift = util.by_pixel(-44, -25),
          apply_runtime_tint = true,
          variation_count = 2,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark-tintable.png",
            width = 510,
            height = 352,
            line_length = 2,
            shift = util.by_pixel(-44, -23),
            apply_runtime_tint = true,
            variation_count = 2,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable.png",
          width = 480,
          height = 352,
          line_length = 1,
          shift = util.by_pixel(32, 0),
          apply_runtime_tint = true,
          variation_count = 1,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark-tintable.png",
            width = 960,
            height = 704,
            line_length = 1,
            shift = util.by_pixel(32, 0),
            apply_runtime_tint = true,
            variation_count = 1,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable.png",
          width = 480,
          height = 352,
          line_length = 1,
          shift = util.by_pixel(-32, 0),
          apply_runtime_tint = true,
          variation_count = 1,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark-tintable.png",
            width = 960,
            height = 704,
            line_length = 1,
            shift = util.by_pixel(-32, 0),
            apply_runtime_tint = true,
            variation_count = 1,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable.png",
          width = 256,
          height = 176,
          line_length = 2,
          shift = util.by_pixel(44, 21),
          apply_runtime_tint = true,
          variation_count = 2,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark-tintable.png",
            width = 510,
            height = 352,
            line_length = 2,
            shift = util.by_pixel(44, 23),
            apply_runtime_tint = true,
            variation_count = 2,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable.png",
          width = 256,
          height = 176,
          line_length = 2,
          shift = util.by_pixel(-44, 21),
          apply_runtime_tint = true,
          variation_count = 2,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark-tintable.png",
            width = 510,
            height = 352,
            line_length = 2,
            shift = util.by_pixel(-44, 23),
            apply_runtime_tint = true,
            variation_count = 2,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable.png",
          width = 480,
          height = 352,
          line_length = 1,
          shift = util.by_pixel(0, 24),
          apply_runtime_tint = true,
          variation_count = 1,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark-tintable.png",
            width = 960,
            height = 704,
            line_length = 1,
            shift = util.by_pixel(0, 24),
            apply_runtime_tint = true,
            variation_count = 1,
            scale = 0.5,
          }
        },
      }
    },
    ground_patch_higher =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable-top.png",
          width = 138,
          height = 96,
          line_length = 1,
          variation_count = 1,
          shift = util.by_pixel(0, -24),
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark-tintable-top.png",
            width = 274,
            height = 194,
            line_length = 1,
            shift = util.by_pixel(0, -24),
            apply_runtime_tint = true,
            variation_count = 1,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable-top.png",
          width = 68,
          height = 50,
          line_length = 2,
          variation_count = 2,
          shift = util.by_pixel(44, -23),
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark-tintable-top.png",
            width = 136,
            height = 100,
            line_length = 2,
            shift = util.by_pixel(44, -23),
            apply_runtime_tint = true,
            variation_count = 2,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable-top.png",
          width = 68,
          height = 50,
          line_length = 2,
          variation_count = 2,
          shift = util.by_pixel(-44, -23),
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark-tintable-top.png",
            width = 136,
            height = 100,
            line_length = 2,
            shift = util.by_pixel(-44, -23),
            apply_runtime_tint = true,
            variation_count = 2,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable-top.png",
          width = 138,
          height = 96,
          line_length = 1,
          variation_count = 1,
          shift = util.by_pixel(32, 0),
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark-tintable-top.png",
            width = 274,
            height = 194,
            line_length = 1,
            shift = util.by_pixel(32, 0),
            apply_runtime_tint = true,
            variation_count = 1,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable-top.png",
          width = 138,
          height = 96,
          line_length = 1,
          variation_count = 1,
          shift = util.by_pixel(-32, 0),
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark-tintable-top.png",
            width = 274,
            height = 194,
            line_length = 1,
            shift = util.by_pixel(-32, 0),
            apply_runtime_tint = true,
            variation_count = 1,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable-top.png",
          width = 68,
          height = 50,
          line_length = 2,
          variation_count = 2,
          shift = util.by_pixel(44, 23),
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark-tintable-top.png",
            width = 136,
            height = 100,
            line_length = 2,
            shift = util.by_pixel(44, 23),
            apply_runtime_tint = true,
            variation_count = 2,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable-top.png",
          width = 68,
          height = 50,
          line_length = 2,
          variation_count = 2,
          shift = util.by_pixel(-44, 23),
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-medium-scorchmark-tintable-top.png",
            width = 136,
            height = 100,
            line_length = 2,
            shift = util.by_pixel(-44, 23),
            apply_runtime_tint = true,
            variation_count = 2,
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable-top.png",
          width = 138,
          height = 96,
          line_length = 1,
          variation_count = 1,
          shift = util.by_pixel(0, 24),
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/scorchmark/hr-big-scorchmark-tintable-top.png",
            width = 274,
            height = 194,
            line_length = 1,
            shift = util.by_pixel(0, 24),
            apply_runtime_tint = true,
            variation_count = 1,
            scale = 0.5,
          }
        },
      }
    }
  },
}

for k, remnant in pairs (remnants) do
  if not remnant.localised_name then
    local name = remnant.name
    if name:find("%-remnants") then
      remnant.localised_name = {"remnant-name", {"entity-name."..name:gsub("%-remnants", "")}}
    end
  end
end

data:extend(remnants)

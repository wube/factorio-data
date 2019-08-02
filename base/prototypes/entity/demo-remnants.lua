require ("util")

function make_rotated_animation_variations_from_sheet(variation_count, sheet) --makes remnants work with more than 1 variation
  local result = {}

  for i = 1,variation_count do
    local variation = util.table.deepcopy(sheet)

    variation.y = variation.height * (i - 1)
    if (variation.hr_version) then
      variation.hr_version.y = variation.hr_version.height * (i - 1)
    end

    table.insert(result, variation)
  end
 return result

end

data:extend(
{
  {
    type = "corpse",
    name = "big-remnants",
    icon = "__base__/graphics/icons/remnants.png",
    icon_size = 32,
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
    remove_on_tile_placement = false,
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
    animation = make_rotated_animation_variations_from_sheet(4,
    {
      filename = "__base__/graphics/entity/remnants/medium-remnants.png",
      line_length = 1,
      width = 118,
      height = 124,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(0, -4),
      hr_version =
      {
        filename = "__base__/graphics/entity/remnants/hr-medium-remnants.png",
        line_length = 1,
        width = 236,
        height = 246,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(0, -4.5),
        scale = 0.5,
      }
    })
  },

  {
    type = "corpse",
    name = "medium-small-remnants",
    icon = "__base__/graphics/icons/remnants.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(2,
    {
      filename = "__base__/graphics/entity/remnants/medium-small-remnants.png",
      line_length = 1,
      width = 84,
      height = 90,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(3, 4),
      hr_version =
      {
        filename = "__base__/graphics/entity/remnants/hr-medium-small-remnants.png",
        line_length = 1,
        width = 166,
        height = 176,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(3, 3.5),
        scale = 0.5,
      }
    })
  },

  {
    type = "corpse",
    name = "small-remnants",
    icon = "__base__/graphics/icons/remnants.png",
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
    animation = make_rotated_animation_variations_from_sheet(2,
    {
      filename = "__base__/graphics/entity/remnants/small-remnants.png",
      line_length = 1,
      width = 56,
      height = 56,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(0, 4),
      hr_version =
      {
        filename = "__base__/graphics/entity/remnants/hr-small-remnants.png",
        line_length = 1,
        width = 112,
        height = 110,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(0, 3.5),
        scale = 0.5,
      }
    })
  },

  {
    type = "corpse",
    name = "small-generic-remnants",
    icon = "__base__/graphics/icons/remnants.png",
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
    animation = make_rotated_animation_variations_from_sheet(1,
    {
      filename = "__base__/graphics/entity/remnants/small-generic-remnants.png",
      line_length = 1,
      width = 50,
      height = 50,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(1, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/remnants/hr-small-generic-remnants.png",
        line_length = 1,
        width = 98,
        height = 100,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(1, 0),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "1x2-remnants",
    icon = "__base__/graphics/icons/remnants.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-0.5, -1}, {0.5, 1}},
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
      filename = "__base__/graphics/entity/remnants/1x2-remnants.png",
      line_length = 1,
      width = 86,
      height = 72,
      frame_count = 1,
      direction_count = 4,
      shift = util.by_pixel(3, 5),
      hr_version =
      {
        filename = "__base__/graphics/entity/remnants/hr-1x2-remnants.png",
        line_length = 1,
        width = 172,
        height = 142,
        frame_count = 1,
        direction_count = 4,
        shift = util.by_pixel(3, 5),
        scale = 0.5,
      },
    }
  },

  {
    type = "corpse",
    name = "boiler-remnants",
    icon = "__base__/graphics/icons/boiler.png",
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
      filename = "__base__/graphics/entity/boiler/remnants/boiler-remnants.png",
      line_length = 1,
      width = 116,
      height = 98,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(-4, 10),
      hr_version =
      {
        filename = "__base__/graphics/entity/boiler/remnants/hr-boiler-remnants.png",
        line_length = 1,
        width = 230,
        height = 194,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(-4, 9.5),
        scale = 0.5,
      },
    }
  },

  {
    type = "corpse",
    name = "burner-inserter-remnants",
    icon = "__base__/graphics/icons/burner-inserter.png",
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
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/burner-inserter/remnants/burner-inserter-remnants.png",
      line_length = 1,
      width = 52,
      height = 42,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(1, 5),
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/remnants/hr-burner-inserter-remnants.png",
        line_length = 1,
        width = 102,
        height = 80,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(0.5, 4.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "inserter-remnants",
    icon = "__base__/graphics/icons/inserter.png",
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
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/inserter/remnants/standard-inserter-remnants.png",
      line_length = 1,
      width = 52,
      height = 42,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(0, 1),
      hr_version =
      {
        filename = "__base__/graphics/entity/inserter/remnants/hr-standard-inserter-remnants.png",
        line_length = 1,
        width = 102,
        height = 80,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(0.5, 4.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "fast-inserter-remnants",
    icon = "__base__/graphics/icons/fast-inserter.png",
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
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/fast-inserter/remnants/fast-inserter-remnants.png",
      line_length = 1,
      width = 52,
      height = 42,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(1, 5),
      hr_version =
      {
        filename = "__base__/graphics/entity/fast-inserter/remnants/hr-fast-inserter-remnants.png",
        line_length = 1,
        width = 102,
        height = 80,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(0.5, 4.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "long-handed-inserter-remnants",
    icon = "__base__/graphics/icons/long-handed-inserter.png",
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
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/long-handed-inserter/remnants/long-handed-inserter-remnants.png",
      line_length = 1,
      width = 52,
      height = 42,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(1, 5),
      hr_version =
      {
        filename = "__base__/graphics/entity/long-handed-inserter/remnants/hr-long-handed-inserter-remnants.png",
        line_length = 1,
        width = 102,
        height = 80,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(0.5, 4.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "transport-belt-remnants",
    icon = "__base__/graphics/icons/transport-belt.png",
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
    animation =  make_rotated_animation_variations_from_sheet (8,
    {
      filename = "__base__/graphics/entity/transport-belt/remnants/transport-belt-remnants.png",
      line_length = 1,
      width = 54,
      height = 52,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(1, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/transport-belt/remnants/hr-transport-belt-remnants.png",
        line_length = 1,
        width = 106,
        height = 102,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(1, -0.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "splitter-remnants",
    icon = "__base__/graphics/icons/splitter.png",
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
      filename = "__base__/graphics/entity/splitter/remnants/splitter-remnants.png",
      line_length = 1,
      width = 86,
      height = 76,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(1, 2),
      hr_version =
      {
        filename = "__base__/graphics/entity/splitter/remnants/hr-splitter-remnants.png",
        line_length = 1,
        width = 172,
        height = 150,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(1, 1.5),
        scale = 0.5,
      },
    }
  },

  {
    type = "corpse",
    name = "underground-belt-remnants",
    icon = "__base__/graphics/icons/underground-belt.png",
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
      filename = "__base__/graphics/entity/underground-belt/remnants/underground-belt-remnants.png",
      line_length = 1,
      width = 60,
      height =50,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 8,
      shift = util.by_pixel(4, 3),
      hr_version =
      {
        filename = "__base__/graphics/entity/underground-belt/remnants/hr-underground-belt-remnants.png",
        line_length = 1,
        width = 116,
        height = 100,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 8,
        shift = util.by_pixel(3.5, 3.5),
        scale = 0.5,
      },
    }
  },

  {
    type = "corpse",
    name = "wall-remnants",
    icon = "__base__/graphics/icons/wall-remnants.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup="remnants",
    order="d[remnants]-c[wall]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (8,
    {
      filename = "__base__/graphics/entity/wall/remnants/wall-remnants.png",
      line_length = 1,
      width = 70,
      height = 58,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(-3, 8),
      hr_version =
      {
        filename = "__base__/graphics/entity/wall/remnants/hr-wall-remnants.png",
        line_length = 1,
        width = 138,
        height = 116,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(-3.5, 8),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "lamp-remnants",
    icon = "__base__/graphics/icons/small-lamp.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup="remnants",
    order = "d[remnants]-a[generic]-a[small]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/small-lamp/remnants/lamp-remnants.png",
      line_length = 1,
      width = 52,
      height = 48,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(-1, 3),
      hr_version =
      {
        filename = "__base__/graphics/entity/small-lamp/remnants/hr-lamp-remnants.png",
        line_length = 1,
        width = 102,
        height = 96,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(-1, 3),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "small-electric-pole-remnants",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup="remnants",
    order = "d[remnants]-a[generic]-a[small]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__base__/graphics/entity/small-electric-pole/remnants/small-electric-pole-remnants.png",
      line_length = 1,
      width = 60,
      height = 44,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(8, -2),
      hr_version =
      {
        filename = "__base__/graphics/entity/small-electric-pole/remnants/hr-small-electric-pole-remnants.png",
        line_length = 1,
        width = 120,
        height = 88,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(8, -1.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "pipe-remnants",
    icon = "__base__/graphics/icons/pipe.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup="remnants",
    order = "d[remnants]-a[generic]-a[small]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__base__/graphics/entity/pipe/remnants/pipe-remnants.png",
      line_length = 1,
      width = 54,
      height = 52,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(1, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/remnants/hr-pipe-remnants.png",
        line_length = 1,
        width = 104,
        height = 104,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(0.5, 0),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "stone-furnace-remnants",
    icon = "__base__/graphics/icons/stone-furnace.png",
    icon_size = 32,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-b[medium]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(1,
    {
      filename = "__base__/graphics/entity/stone-furnace/remnants/stone-furnace-remnants.png",
      line_length = 1,
      width = 78,
      height = 62,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(2, -2),
      hr_version =
      {
        filename = "__base__/graphics/entity/stone-furnace/remnants/hr-stone-furnace-remnants.png",
        line_length = 1,
        width = 152,
        height = 118,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(1.5, -1),
        scale = 0.5,
      }
    })
  },

  {
    type = "corpse",
    name = "burner-mining-drill-remnants",
    icon = "__base__/graphics/icons/burner-mining-drill.png",
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
    animation = make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__base__/graphics/entity/burner-mining-drill/remnants/burner-mining-drill-remnants.png",
      line_length = 1,
      width = 82,
      height = 74,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(1, 1),
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-mining-drill/remnants/hr-burner-mining-drill-remnants.png",
        line_length = 1,
        width = 164,
        height = 148,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(1, 1.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "gun-turret-remnants",
    icon = "__base__/graphics/icons/gun-turret.png",
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
      filename = "__base__/graphics/entity/gun-turret/remnants/gun-turret-remnants.png",
      line_length = 1,
      width = 94,
      height = 74,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(5, -1),
      hr_version =
      {
        filename = "__base__/graphics/entity/gun-turret/remnants/hr-gun-turret-remnants.png",
        line_length = 1,
        width = 186,
        height = 146,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(4.5, -1),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "radar-remnants",
    icon = "__base__/graphics/icons/radar.png",
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
      filename = "__base__/graphics/entity/radar/remnants/radar-remnants.png",
      line_length = 1,
      width = 142,
      height = 106,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(12, 4),
      hr_version =
      {
        filename = "__base__/graphics/entity/radar/remnants/hr-radar-remnants.png",
        line_length = 1,
        width = 282,
        height = 212,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(12, 4.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "steam-engine-remnants",
    icon = "__base__/graphics/icons/steam-engine.png",
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
      filename = "__base__/graphics/entity/steam-engine/remnants/steam-engine-remnants.png",
      line_length = 1,
      width = 168,
      height = 242,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(1, 39),
      hr_version =
      {
        filename = "__base__/graphics/entity/steam-engine/remnants/hr-steam-engine-remnants.png",
        line_length = 1,
        width = 334,
        height = 482,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(0.5, 39),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "lab-remnants",
    icon = "__base__/graphics/icons/lab.png",
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
      filename = "__base__/graphics/entity/lab/remnants/lab-remnants.png",
      line_length = 1,
      width = 134,
      height = 100,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(7, 6),
      hr_version =
      {
        filename = "__base__/graphics/entity/lab/remnants/hr-lab-remnants.png",
        line_length = 1,
        width = 266,
        height = 196,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(7, 5.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "car-remnants",
    icon = "__base__/graphics/icons/car.png",
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
      filename = "__base__/graphics/entity/car/remnants/car-remnants.png",
      line_length = 1,
      width = 116,
      height = 84,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(8, 8),
      hr_version =
      {
        filename = "__base__/graphics/entity/car/remnants/hr-car-remnants.png",
        line_length = 1,
        width = 232,
        height = 166,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(8, 7.5),
        scale = 0.5,
      }
    })
  },

  {
    type = "container",
    name = "big-ship-wreck-1",
    enable_inventory_bar = false,
    icon = "__base__/graphics/icons/ship-wreck/big-ship-wreck-1.png",
    icon_size = 32,
    flags = {"placeable-neutral"},
    subgroup = "wrecks",
    order = "d[remnants]-d[ship-wreck]-a[big]-a",
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
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
    icon_size = 32,
    flags = {"placeable-neutral"},
    subgroup = "wrecks",
    order = "d[remnants]-d[ship-wreck]-a[big]-b",
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
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
    icon_size = 32,
    flags = {"placeable-neutral"},
    subgroup = "wrecks",
    order = "d[remnants]-d[ship-wreck]-a[big]-c",
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
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
    icon_size = 32,
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
    }
  },

  {
    type = "simple-entity",
    name = "small-ship-wreck",
    icon = "__base__/graphics/icons/ship-wreck/small-ship-wreck.png",
    icon_size = 32,
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
    render_layer = "object"
  },
  {
    type = "corpse",
    name = "small-scorchmark",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {"doodad-layer", "not-colliding-with-itself"},
    selection_box = {{-1, -1}, {1, 1}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 10, -- 10 minutes
    final_render_layer = "ground-patch-higher2",
    subgroup = "remnants",
    order="d[remnants]-b[scorchmark]-a[small]",
    remove_on_entity_placement = false,
    remove_on_tile_placement = true,
    animation =
    {
      width = 110,
      height = 90,
      frame_count = 1,
      direction_count = 1,
      filename = "__base__/graphics/entity/scorchmark/small-scorchmark.png"
    },
    ground_patch =
    {
      sheet =
      {
        width = 110,
        height = 90,
        frame_count = 1,
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
        x = 110,
        filename = "__base__/graphics/entity/scorchmark/small-scorchmark.png",
        variation_count = 3
      }
    }
  },

  {
    type = "corpse",
    name = "medium-electric-pole-remnants",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup="remnants",
    order = "d[remnants]-a[generic]-a[small]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/medium-electric-pole/remnants/medium-electric-pole-remnants.png",
      line_length = 1,
      width = 62,
      height = 64,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(12, -9),
      hr_version =
      {
        filename = "__base__/graphics/entity/medium-electric-pole/remnants/hr-medium-electric-pole-remnants.png",
        line_length = 1,
        width = 124,
        height = 126,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(12, -9.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "big-electric-pole-remnants",
    icon = "__base__/graphics/icons/big-electric-pole.png",
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
      filename = "__base__/graphics/entity/big-electric-pole/remnants/big-electric-pole-remnants.png",
      line_length = 1,
      width = 96,
      height = 64,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(12, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/big-electric-pole/remnants/hr-big-electric-pole-remnants.png",
        line_length = 1,
        width = 190,
        height = 128,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(12, 0.5),
        scale = 0.5,
      },
    })
  },
}
)

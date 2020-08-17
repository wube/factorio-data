require ("util")

destroyed_rail_pictures = function()
  return rail_pictures_internal({{"metals", "metals-remnants", mipmap = true, variations = 3, priority = "high"},
                                 {"backplates", "backplates-remnants", mipmap = true, variations = 3, priority = "high"},
                                 {"ties", "ties-remnants", variations = 3, priority = "high"},
                                 {"stone_path", "stone-path-remnants", variations = 3, priority = "high"},
                                 {"stone_path_background", "stone-path-background-remnants", variations = 3, priority = "high"}})
end

function make_rotated_animation_variations_from_sheet(variation_count, sheet) --makes remnants work with more than 1 variation
  local result = {}

  local function set_y_offset(variation, i)
    local frame_count = variation.frame_count or 1
    local line_length = variation.line_length or frame_count
    if (line_length < 1) then
      line_length = frame_count
    end

    local height_in_frames = math.floor((frame_count * variation.direction_count + line_length - 1) / line_length)
    -- if (height_in_frames ~= 1) then
    --   log("maybe broken sheet: h=" .. height_in_frames .. ", vc=" .. variation_count .. ", " .. variation.filename)
    -- end
    variation.y = variation.height * (i - 1) * height_in_frames
  end

  for i = 1,variation_count do
    local variation = util.table.deepcopy(sheet)

    if variation.layers then
      for _, layer in pairs(variation.layers) do
        set_y_offset(layer, i)
        if (layer.hr_version) then
          set_y_offset(layer.hr_version, i)
        end
      end
    else
      set_y_offset(variation, i)
      if (variation.hr_version) then
        set_y_offset(variation.hr_version, i)
      end
    end

    table.insert(result, variation)
  end
 return result
end

local demo_remnants =
{
  {
    type = "corpse",
    name = "big-remnants",
    localised_name = {"entity-name.big-remnants"},
    icon = "__base__/graphics/icons/remnants.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "generic-remnants",
    order = "a-c-a",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
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
    localised_name = {"entity-name.medium-remnants"},
    icon = "__base__/graphics/icons/remnants.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "generic-remnants",
    order = "a-d-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
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
    localised_name = {"entity-name.medium-small-remnants"},
    icon = "__base__/graphics/icons/remnants.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "generic-remnants",
    order = "a-e-a",
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
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
    localised_name = {"entity-name.small-remnants"},
    icon = "__base__/graphics/icons/remnants.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "generic-remnants",
    order = "a-a-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
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
    name = "1x2-remnants",
    localised_name = {"entity-name.1x2-remnants"},
    icon = "__base__/graphics/icons/remnants.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "generic-remnants",
    order = "a-b-a",
    selection_box = {{-0.5, -1}, {0.5, 1}},
    tile_width = 2,
    tile_height = 1,
    selectable_in_game = false,
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
    name = "wooden-chest-remnants",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "storage-remnants",
    order = "a-a-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/wooden-chest/remnants/wooden-chest-remnants.png",
      line_length = 1,
      width = 56,
      height = 38,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(8, -1),
      hr_version =
      {
        filename = "__base__/graphics/entity/wooden-chest/remnants/hr-wooden-chest-remnants.png",
        line_length = 1,
        width = 110,
        height = 74,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(7.5, -1),
        scale = 0.5,
      }
    }
  },

  {
    type = "corpse",
    name = "iron-chest-remnants",
    icon = "__base__/graphics/icons/iron-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "storage-remnants",
    order = "a-b-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/iron-chest/remnants/iron-chest-remnants.png",
      line_length = 1,
      width = 64,
      height = 40,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(12, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/iron-chest/remnants/hr-iron-chest-remnants.png",
        line_length = 1,
        width = 126,
        height = 78,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(12, 0),
        scale = 0.5,
      }
    }
  },

  {
    type = "corpse",
    name = "assembling-machine-1-remnants",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
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
      filename = "__base__/graphics/entity/assembling-machine-1/remnants/assembling-machine-1-remnants.png",
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
        filename = "__base__/graphics/entity/assembling-machine-1/remnants/hr-assembling-machine-1-remnants.png",
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
    name = "assembling-machine-2-remnants",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
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
      filename = "__base__/graphics/entity/assembling-machine-2/remnants/assembling-machine-2-remnants.png",
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
        filename = "__base__/graphics/entity/assembling-machine-2/remnants/hr-assembling-machine-2-remnants.png",
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
    name = "burner-inserter-remnants",
    icon = "__base__/graphics/icons/burner-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "inserter-remnants",
    order = "a-a-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__base__/graphics/entity/burner-inserter/remnants/burner-inserter-remnants.png",
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
        filename = "__base__/graphics/entity/burner-inserter/remnants/hr-burner-inserter-remnants.png",
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
    name = "inserter-remnants",
    icon = "__base__/graphics/icons/inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "inserter-remnants",
    order = "a-b-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__base__/graphics/entity/inserter/remnants/inserter-remnants.png",
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
        filename = "__base__/graphics/entity/inserter/remnants/hr-inserter-remnants.png",
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
    name = "long-handed-inserter-remnants",
    icon = "__base__/graphics/icons/long-handed-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "inserter-remnants",
    order = "a-c-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__base__/graphics/entity/long-handed-inserter/remnants/long-handed-inserter-remnants.png",
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
        filename = "__base__/graphics/entity/long-handed-inserter/remnants/hr-long-handed-inserter-remnants.png",
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
    name = "fast-inserter-remnants",
    icon = "__base__/graphics/icons/fast-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "inserter-remnants",
    order = "a-d-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__base__/graphics/entity/fast-inserter/remnants/fast-inserter-remnants.png",
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
        filename = "__base__/graphics/entity/fast-inserter/remnants/hr-fast-inserter-remnants.png",
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
    name = "filter-inserter-remnants",
    icon = "__base__/graphics/icons/filter-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "inserter-remnants",
    order = "a-e-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
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
    name = "transport-belt-remnants",
    icon = "__base__/graphics/icons/transport-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "belt-remnants",
    order = "a-a-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation =  make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__base__/graphics/entity/transport-belt/remnants/transport-belt-remnants.png",
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
        filename = "__base__/graphics/entity/transport-belt/remnants/hr-transport-belt-remnants.png",
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
    name = "splitter-remnants",
    icon = "__base__/graphics/icons/splitter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "belt-remnants",
    order = "a-g-a",
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    tile_width = 2,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/splitter/remnants/splitter-remnants.png",
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
        filename = "__base__/graphics/entity/splitter/remnants/hr-splitter-remnants.png",
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
    name = "underground-belt-remnants",
    icon = "__base__/graphics/icons/underground-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "building-direction-8-way"},
    subgroup = "belt-remnants",
    order="a-d-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/underground-belt/remnants/underground-belt-remnants.png",
      line_length = 1,
      width = 78,
      height =72,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 8,
      shift = util.by_pixel(10, 3),
      hr_version =
      {
        filename = "__base__/graphics/entity/underground-belt/remnants/hr-underground-belt-remnants.png",
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
    name = "wall-remnants",
    localised_name = {"remnant-name", {"entity-name.stone-wall"}},
    icon = "__base__/graphics/icons/wall.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "defensive-structure-remnants",
    order = "a-a-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(4,
    {
      filename = "__base__/graphics/entity/wall/remnants/wall-remnants.png",
      width = 60,
      height = 58,
      line_length = 1,
      frame_count = 1,
      direction_count = 2,
      shift = util.by_pixel(3, 7.5),
      hr_version =
      {
        filename = "__base__/graphics/entity/wall/remnants/hr-wall-remnants.png",
        width = 118,
        height = 114,
        line_length = 1,
        frame_count = 1,
        direction_count = 2,
        shift = util.by_pixel(3, 7.5), --was 3.5
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "gate-remnants",
    icon = "__base__/graphics/icons/gate.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "defensive-structure-remnants",
    order = "a-b-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      {
        filename = "__base__/graphics/entity/gate/remnants/gate-remnants-var-1.png",
        line_length = 1,
        width = 44,
        height = 42,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(0, 1),
        hr_version =
        {
          filename = "__base__/graphics/entity/gate/remnants/hr-gate-remnants-var-1.png",
          line_length = 1,
          width = 86,
          height = 82,
          frame_count = 1,
          variation_count = 1,
          axially_symmetrical = false,
          direction_count = 4,
          shift = util.by_pixel(0, 1),
          scale = 0.5,
        },
      },
      {
        filename = "__base__/graphics/entity/gate/remnants/gate-remnants-var-2.png",
        line_length = 1,
        width = 42,
        height = 42,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(-1, 0),
        hr_version =
        {
          filename = "__base__/graphics/entity/gate/remnants/hr-gate-remnants-var-2.png",
          line_length = 1,
          width = 84,
          height = 82,
          frame_count = 1,
          variation_count = 1,
          axially_symmetrical = false,
          direction_count = 4,
          shift = util.by_pixel(-0.5, 0),
          scale = 0.5,
        },
      },
      {
        filename = "__base__/graphics/entity/gate/remnants/gate-remnants-var-3.png",
        line_length = 1,
        width = 42,
        height = 42,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(0, 0),
        hr_version =
        {
          filename = "__base__/graphics/entity/gate/remnants/hr-gate-remnants-var-3.png",
          line_length = 1,
          width = 82,
          height = 84,
          frame_count = 1,
          variation_count = 1,
          axially_symmetrical = false,
          direction_count = 4,
          shift = util.by_pixel(0, 0.5),
          scale = 0.5,
        }
      },
    },
  },

  {
    type = "corpse",
    name = "lamp-remnants",
    localised_name = {"remnant-name", {"entity-name.small-lamp"}},
    icon = "__base__/graphics/icons/small-lamp.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "circuit-network-remnants",
    order = "a-a-a",
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-a-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation_overlay_final_render_layer = "object",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (4,
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/small-electric-pole/remnants/small-electric-pole-base-remnants.png",
        line_length = 1,
        width = 90,
        height = 54,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(17, -1),
        hr_version =
        {
          filename = "__base__/graphics/entity/small-electric-pole/remnants/hr-small-electric-pole-base-remnants.png",
          line_length = 1,
          width = 180,
          height = 106,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(17, -1),
          scale = 0.5,
        }
      }
    },
  }),

  animation_overlay = make_rotated_animation_variations_from_sheet (4,
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/small-electric-pole/remnants/small-electric-pole-top-remnants.png",
        line_length = 1,
        width = 44,
        height = 62,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(4 , -21),
        hr_version =
        {
          filename = "__base__/graphics/entity/small-electric-pole/remnants/hr-small-electric-pole-top-remnants.png",
          line_length = 1,
          width = 86,
          height = 120,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(3.5, -21.5),
          scale = 0.5,
        }
      },
    },
  })
 },

  {
    type = "corpse",
    name = "medium-electric-pole-remnants",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-b-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation_overlay_final_render_layer = "object",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(3,
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/medium-electric-pole/remnants/medium-electric-pole-base-remnants.png",
        line_length = 1,
        width = 142,
        height = 70,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(35, -5),
        hr_version =
        {
          filename = "__base__/graphics/entity/medium-electric-pole/remnants/hr-medium-electric-pole-base-remnants.png",
          line_length = 1,
          width = 284,
          height = 140,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(35, -5),
          scale = 0.5,
        }
      }
    }
  }),

  animation_overlay = make_rotated_animation_variations_from_sheet(3,
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/medium-electric-pole/remnants/medium-electric-pole-top-remnants.png",
        line_length = 1,
        width = 50,
        height = 92,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(0 , -39),
        hr_version =
        {
          filename = "__base__/graphics/entity/medium-electric-pole/remnants/hr-medium-electric-pole-top-remnants.png",
          line_length = 1,
          width = 100,
          height = 184,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(0, -38.5),
          scale = 0.5,
        }
      },
    },
  })
 },

  {
    type = "corpse",
    name = "big-electric-pole-remnants",
    icon = "__base__/graphics/icons/big-electric-pole.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-c-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation_overlay_final_render_layer = "object",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (4,
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/big-electric-pole/remnants/big-electric-pole-base-remnants.png",
        line_length = 1,
        width = 184,
        height = 94,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(44, 0),
        hr_version =
        {
          filename = "__base__/graphics/entity/big-electric-pole/remnants/hr-big-electric-pole-base-remnants.png",
          line_length = 1,
          width = 366,
          height = 188,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(43, 0.5),
          scale = 0.5,
        }
      }
    },
  }),

  animation_overlay = make_rotated_animation_variations_from_sheet (4,
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/big-electric-pole/remnants/big-electric-pole-top-remnants.png",
        line_length = 1,
        width = 76,
        height = 126,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(-1, -48),
        hr_version =
        {
          filename = "__base__/graphics/entity/big-electric-pole/remnants/hr-big-electric-pole-top-remnants.png",
          line_length = 1,
          width = 148,
          height = 252,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(-1.5, -48),
          scale = 0.5,
        }
      },
    }
  })
 },

  {
    type = "corpse",
    name = "pipe-remnants",
    icon = "__base__/graphics/icons/pipe.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(2,
    {
      filename = "__base__/graphics/entity/pipe/remnants/pipe-remnants.png",
      width = 62,
      height = 62,
      line_length = 1,
      frame_count = 1,
      direction_count = 2,
      shift = util.by_pixel(2, 3),
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/remnants/hr-pipe-remnants.png",
        width = 122,
        height = 120,
        line_length = 1,
        frame_count = 1,
        direction_count = 2,
        shift = util.by_pixel(1.5, 2.5), -- -0,5
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "pipe-to-ground-remnants",
    icon = "__base__/graphics/icons/pipe-to-ground.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/pipe-to-ground/remnants/pipe-to-ground-remnants.png",
      width = 46,
      height = 40,
      line_length = 1,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(0, -3),
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/remnants/hr-pipe-to-ground-remnants.png",
        width = 90,
        height = 80,
        line_length = 1,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(0.5, -3),
        scale = 0.5,
      },
    }
  },

  {
    type = "corpse",
    name = "stone-furnace-remnants",
    icon = "__base__/graphics/icons/stone-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "smelting-machine-remnants",
    order = "a-a-a",
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(1,
    {
      filename = "__base__/graphics/entity/stone-furnace/remnants/stone-furnace-remnants.png",
      line_length = 1,
      width = 76,
      height = 66,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(0, 10),
      hr_version =
      {
        filename = "__base__/graphics/entity/stone-furnace/remnants/hr-stone-furnace-remnants.png",
        line_length = 1,
        width = 152,
        height = 130,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(0, 9.5),
        scale = 0.5,
      }
    })
  },

  {
    type = "corpse",
    name = "steel-furnace-remnants",
    icon = "__base__/graphics/icons/steel-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "smelting-machine-remnants",
    order = "a-a-a",
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(1,
    {
      filename = "__base__/graphics/entity/steel-furnace/remnants/steel-furnace-remnants.png",
      line_length = 1,
      width = 134,
      height = 120,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(4, 1),
      hr_version =
      {
        filename = "__base__/graphics/entity/steel-furnace/remnants/hr-steel-furnace-remnants.png",
        line_length = 1,
        width = 268,
        height = 238,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(4, 0.5),
        scale = 0.5,
      }
    })
  },

  {
    type = "corpse",
    name = "electric-furnace-remnants",
    icon = "__base__/graphics/icons/electric-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "smelting-machine-remnants",
    order = "a-a-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/electric-furnace/remnants/electric-furnace-remnants.png",
      line_length = 1,
      width = 228,
      height = 224,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(-3, 7),
      hr_version =
      {
        filename = "__base__/graphics/entity/electric-furnace/remnants/hr-electric-furnace-remnants.png",
        line_length = 1,
        width = 454,
        height = 448,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(-3.25, 7.25),
        scale = 0.5,
      }
    }
  },

  {
    type = "corpse",
    name = "burner-mining-drill-remnants",
    icon = "__base__/graphics/icons/burner-mining-drill.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "extraction-machine-remnants",
    order = "a-a-a",
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
      filename = "__base__/graphics/entity/burner-mining-drill/remnants/burner-mining-drill-remnants.png",
      line_length = 1,
      width = 138,
      height = 118,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(0, -4),
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-mining-drill/remnants/hr-burner-mining-drill-remnants.png",
        line_length = 1,
        width = 272,
        height = 234,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(-0.5, -4.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "electric-mining-drill-remnants",
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "extraction-machine-remnants",
    order = "a-a-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__base__/graphics/entity/electric-mining-drill/remnants/electric-mining-drill-remnants.png",
      line_length = 1,
      width = 178,
      height = 166,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(7, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/electric-mining-drill/remnants/hr-electric-mining-drill-remnants.png",
        line_length = 1,
        width = 356,
        height = 328,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(7, -0.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "gun-turret-remnants",
    icon = "__base__/graphics/icons/gun-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "defensive-structure-remnants",
    order = "a-c-a",
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gun-turret/remnants/gun-turret-remnants.png",
          line_length = 1,
          width = 126,
          height = 122,
          frame_count = 1,
          variation_count = 1,
          axially_symmetrical = false,
          direction_count = 1,
          shift = util.by_pixel(3, -1),
          hr_version =
          {
            filename = "__base__/graphics/entity/gun-turret/remnants/hr-gun-turret-remnants.png",
            line_length = 1,
            width = 252,
            height = 242,
            frame_count = 1,
            variation_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(3, -1.5),
            scale = 0.5,
          }
        },
        {
          priority = "low",
          filename = "__base__/graphics/entity/gun-turret/remnants/mask/gun-turret-remnants-mask.png",
          width = 34,
          height = 32,
          frame_count = 1,
          --tint = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 },
          apply_runtime_tint = true,
          direction_count = 1,
          shift = util.by_pixel(-1, -11),
          hr_version=
          {
            priority = "low",
            filename = "__base__/graphics/entity/gun-turret/remnants/mask/hr-gun-turret-remnants-mask.png",
            width = 68,
            height = 64,
            frame_count = 1,
            --tint = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 },
            apply_runtime_tint = true,
            direction_count = 1,
            shift = util.by_pixel(-1, -11),
            scale = 0.5,
          }
        }
      }
    })
  },

  {
    type = "corpse",
    name = "radar-remnants",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "defensive-structure-remnants",
    order = "a-g-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
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
    name = "offshore-pump-remnants",
    icon = "__base__/graphics/icons/offshore-pump.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "extraction-machine-remnants",
    order="a-d-b",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      {
        filename = "__base__/graphics/entity/offshore-pump/remnants/offshore-pump-remnants-variation-1.png",
        line_length = 1,
        width = 74,
        height = 72,
        frame_count = 1,
        direction_count = 4,
        shift = util.by_pixel(2, -2),
        hr_version =
        {
          filename = "__base__/graphics/entity/offshore-pump/remnants/hr-offshore-pump-remnants-variation-1.png",
          line_length = 1,
          width = 146,
          height = 140,
          frame_count = 1,
          direction_count = 4,
          shift = util.by_pixel(2, -2.5),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/entity/offshore-pump/remnants/offshore-pump-remnants-variation-2.png",
        line_length = 1,
        width = 68,
        height = 68,
        frame_count = 1,
        direction_count = 4,
        shift = util.by_pixel(1, 1),
        hr_version =
        {
          filename = "__base__/graphics/entity/offshore-pump/remnants/hr-offshore-pump-remnants-variation-2.png",
          line_length = 1,
          width = 136,
          height = 134,
          frame_count = 1,
          direction_count = 4,
          shift = util.by_pixel(1.5, 0.5),
          scale = 0.5,
        }
      }
    }
  },

  {
    type = "corpse",
    name = "steam-engine-remnants",
    icon = "__base__/graphics/icons/steam-engine.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-remnants",
    order = "a-b-a",
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    tile_width = 3,
    tile_height = 5,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/steam-engine/remnants/steam-engine-remnants.png",
      line_length = 1,
      width = 232,
      height = 194,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(17, 7),
      hr_version =
      {
        filename = "__base__/graphics/entity/steam-engine/remnants/hr-steam-engine-remnants.png",
        line_length = 1,
        width = 462,
        height = 386,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(17, 6.5),
        scale = 0.5,
      },
    })
  },

  {
    type = "corpse",
    name = "lab-remnants",
    icon = "__base__/graphics/icons/lab.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "production-machine-remnants",
    order = "a-g-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
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
    name = "boiler-remnants",
    icon = "__base__/graphics/icons/boiler.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-remnants",
    order = "a-a-a",
    selection_box = {{-1.5, -1}, {1.5, 1}},
    tile_width = 3,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/boiler/remnants/boiler-remnants.png",
      line_length = 1,
      width = 138,
      height = 110,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(0, -3),
      hr_version =
      {
        filename = "__base__/graphics/entity/boiler/remnants/hr-boiler-remnants.png",
        line_length = 1,
        width = 274,
        height = 220,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(-0.5, -3),
        scale = 0.5,
      },
    }
  },

  {
    type = "corpse",
    name = "car-remnants",
    icon = "__base__/graphics/icons/car.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "transport-remnants",
    order = "a-j-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
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
          filename = "__base__/graphics/entity/car/remnants/car-remnants.png",
          line_length = 1,
          width = 152,
          height = 152,
          frame_count = 1,
          direction_count = 4,
          shift = util.by_pixel(0, 6),
          hr_version =
          {
            filename = "__base__/graphics/entity/car/remnants/hr-car-remnants.png",
            line_length = 1,
            width = 302,
            height = 300,
            frame_count = 1,
            direction_count = 4,
            shift = util.by_pixel(0, 4.5),
            scale = 0.5,
          }
        },
        {
          priority = "low",
          filename = "__base__/graphics/entity/car/remnants/mask/car-remnants-mask.png",
          width = 98,
          height = 74,
          frame_count = 1,
          --tint = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 },
          apply_runtime_tint = true,
          direction_count = 4,
          shift = util.by_pixel(0, 6),
          hr_version=
          {
            priority = "low",
            filename = "__base__/graphics/entity/car/remnants/mask/hr-car-remnants-mask.png",
            width = 196,
            height = 146,
            frame_count = 1,
            --tint = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 },
            apply_runtime_tint = true,
            direction_count = 4,
            shift = util.by_pixel(0, 4.5),
            scale = 0.5,
          }
        }
      }
    }
  },

  {
    type = "container",
    name = "big-ship-wreck-1",
    enable_inventory_bar = false,
    icon = "__base__/graphics/icons/ship-wreck/big-ship-wreck-1.png",
    icon_size = 64, icon_mipmaps = 4,
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
    icon_size = 64, icon_mipmaps = 4,
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
    icon_size = 64, icon_mipmaps = 4,
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
    icon_size = 64, icon_mipmaps = 4,
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
    icon_size = 64, icon_mipmaps = 4,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {"doodad-layer", "not-colliding-with-itself"},
    selection_box = {{-1, -1}, {1, 1}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 10, -- 10 minutes
    final_render_layer = "ground-patch-higher2",
    subgroup = "scorchmarks",
    order="a-a-a",
    remove_on_entity_placement = false,
    remove_on_tile_placement = true,
    use_tile_color_for_ground_patch_tint = false,
    ground_patch =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/small-scorchmark.png",
        width = 128,
        height = 92,
        line_length = 4,
        shift = util.by_pixel(0, 2),
        variation_count = 4,
        hr_version =
        {
          filename = "__base__/graphics/entity/scorchmark/hr-small-scorchmark.png",
          width = 256,
          height = 182,
          line_length = 4,
          shift = util.by_pixel(0, 2),
          variation_count = 4,
          scale = 0.5,
        }
      }
    },
    ground_patch_higher =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/small-scorchmark-top.png",
        width = 34,
        height = 28,
        line_length = 4,
        variation_count = 4,
        shift = util.by_pixel(0, -2),
        hr_version =
        {
          filename = "__base__/graphics/entity/scorchmark/hr-small-scorchmark-top.png",
          width = 68,
          height = 54,
          line_length = 4,
          shift = util.by_pixel(0, -2),
          variation_count = 4,
          scale = 0.5,
        }
      }
    }
  },
  {
    type = "corpse",
    name = "small-scorchmark-tintable",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {"doodad-layer", "not-colliding-with-itself"},
    selection_box = {{-1, -1}, {1, 1}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 10, -- 10 minutes
    final_render_layer = "ground-patch-higher2",
    subgroup = "scorchmarks",
    order="a-b-a",
    remove_on_entity_placement = false,
    remove_on_tile_placement = true,
    use_tile_color_for_ground_patch_tint = true,
    ground_patch =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/small-scorchmark-tintable.png",
        width = 128,
        height = 92,
        line_length = 4,
        shift = util.by_pixel(0, 2),
        apply_runtime_tint = true,
        variation_count = 4,
        hr_version =
        {
          filename = "__base__/graphics/entity/scorchmark/hr-small-scorchmark-tintable.png",
          width = 256,
          height = 182,
          line_length = 4,
          shift = util.by_pixel(0, 2),
          apply_runtime_tint = true,
          variation_count = 4,
          scale = 0.5,
        }
      }
    },
    ground_patch_higher =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/small-scorchmark-tintable-top.png",
        width = 34,
        height = 28,
        line_length = 4,
        variation_count = 4,
        shift = util.by_pixel(0, -2),
        apply_runtime_tint = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/scorchmark/hr-small-scorchmark-tintable-top.png",
          width = 68,
          height = 54,
          line_length = 4,
          shift = util.by_pixel(0, -2),
          variation_count = 4,
          apply_runtime_tint = true,
          scale = 0.5,
        }
      }
    }
  },
  {
    type = "rail-remnants",
    name = "straight-rail-remnants",
    icon = "__base__/graphics/icons/straight-rail-remnants.png",
    icon_size = 64, icon_mipmaps = 4,
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
    icon_size = 64, icon_mipmaps = 4,
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
    name = "rail-ending-remnants",
    localised_name = {"entity-name.rail-ending-remnants"},
    icon = "__base__/graphics/icons/curved-rail-remnants.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "remnants",
    order="d[remnants]-b[rail]-c[ending]",
    collision_box = {{-0.75, -0.55}, {0.75, 1.6}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    selectable_in_game = false,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/rail-endings/rail-endings-background.png",
          priority = "high",
          flags = { "low-object" },
          width = 128,
          height = 128,
          direction_count = 8,
          line_length = 8,
          hr_version =
          {
            filename = "__base__/graphics/entity/rail-endings/hr-rail-endings-background.png",
            priority = "high",
            flags = { "low-object" },
            width = 256,
            height = 256,
            direction_count = 8,
            line_length = 8,
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/rail-endings/rail-endings-metals.png",
          priority = "high",
          flags = { "trilinear-filtering" },
          width = 128,
          height = 128,
          direction_count = 8,
          line_length = 8,
          hr_version =
           {
            filename = "__base__/graphics/entity/rail-endings/hr-rail-endings-metals.png",
            priority = "high",
            flags = { "trilinear-filtering" },
            width = 256,
            height = 256,
            direction_count = 8,
            line_length = 8,
            scale = 0.5
          }
        }
      }
    },
    time_before_removed = 60 * 60 * 45,
    time_before_shading_off = 60 * 60 * 1
  },

  {
    type = "corpse",
    name = "rail-chain-signal-remnants",
    icon = "__base__/graphics/icons/rail-chain-signal.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "train-transport-remnants",
    order = "a-e-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "storage-remnants",
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
    name = "rail-signal-remnants",
    icon = "__base__/graphics/icons/rail-signal.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "train-transport-remnants",
    order = "a-d-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
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
    name = "fast-transport-belt-remnants",
    icon = "__base__/graphics/icons/fast-transport-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "belt-remnants",
    order = "a-b-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "belt-remnants",
    order = "a-h-a",
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    tile_width = 2,
    tile_height = 1,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "building-direction-8-way"},
    subgroup = "belt-remnants",
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
    name = "laser-turret-remnants",
    icon = "__base__/graphics/icons/laser-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "defensive-structure-remnants",
    order = "a-d-a",
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
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
    name = "constant-combinator-remnants",
    icon = "__base__/graphics/icons/constant-combinator.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "circuit-network-remnants",
    order = "a-d-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "circuit-network-remnants",
    order = "a-b-a",
    selection_box = {{-0.5, -1}, {0.5, 1}},
    tile_width = 1,
    tile_height = 2,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "circuit-network-remnants",
    order = "a-c-a",
    selection_box = {{-0.5, -1}, {0.5, 1}},
    tile_width = 1,
    tile_height = 2,
    selectable_in_game = false,
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
    name = "power-switch-remnants",
    icon = "__base__/graphics/icons/power-switch.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "circuit-network-remnants",
    order = "a-c-a",
    selection_box = {{-0.5, -1}, {0.5, 1}},
    tile_width = 1,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/power-switch/remnants/power-switch-remnants.png",
      line_length = 1,
      width = 98,
      height = 88,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(5, 11),
      hr_version =
      {
        filename = "__base__/graphics/entity/power-switch/remnants/hr-power-switch-remnants.png",
        line_length = 1,
        width = 194,
        height = 176,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(4.5, 10.5),
        scale = 0.5,
      },
    }
  },

  {
    type = "corpse",
    name = "programmable-speaker-remnants",
    icon = "__base__/graphics/icons/programmable-speaker.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "circuit-network-remnants",
    order = "a-e-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation_overlay_final_render_layer = "object",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(3,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "train-transport-remnants",
    order = "a-c-a",
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
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
          apply_runtime_tint = true,
          direction_count = 4,
          shift = util.by_pixel(-1, 1),
          hr_version=
          {
            priority = "low",
            filename = "__base__/graphics/entity/train-stop/remnants/mask/hr-train-stop-base-remnants-mask.png",
            width = 284,
            height = 214,
            frame_count = 1,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-remnants",
    order = "a-c-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
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
    name = "locomotive-remnants",
    icon = "__base__/graphics/icons/locomotive.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "train-transport-remnants",
    order = "a-f-a",
    selection_box = {{-1.0, -3.0}, {1.0, 3.0}},
    tile_width = 2,
    tile_height = 6,
    selectable_in_game = false,
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
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "train-transport-remnants",
    order = "a-g-a",
    selection_box = {{-1.0, -3.0}, {1.0, 3.0}},
    tile_width = 2,
    tile_height = 6,
    selectable_in_game = false,
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
    name = "accumulator-remnants",
    icon = "__base__/graphics/icons/accumulator.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-remnants",
    order = "a-d-a",
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
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
    name = "defender-remnants",
    icon = "__base__/graphics/icons/defender.png",
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
      filename = "__base__/graphics/entity/defender-robot/remnants/defender-robot-remnants.png",
      line_length = 1,
      width = 50,
      height = 48,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(1, 1),
      hr_version =
      {
        filename = "__base__/graphics/entity/defender-robot/remnants/hr-defender-robot-remnants.png",
        line_length = 1,
        width = 98,
        height = 94,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(0.5, 0.5),
        scale = 0.5,
      },
    })
  },

}

for k, remnant in pairs (demo_remnants) do
  if not remnant.localised_name then
    local name = remnant.name
    if name:find("%-remnants") then
      remnant.localised_name = {"remnant-name", {"entity-name."..name:gsub("%-remnants", "")}}
    end
  end
end

data:extend(demo_remnants)

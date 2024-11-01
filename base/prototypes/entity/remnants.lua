require ("util")

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
      end
    else
      set_y_offset(variation, i)
    end

    table.insert(result, variation)
  end
 return result
end

local remnants =
{
  {
    type = "corpse",
    name = "big-remnants",
    localised_name = {"entity-name.big-remnants"},
    icon = "__base__/graphics/icons/remnants.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "generic-remnants",
    order = "a-c-a",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      {
        width = 109,
        height = 102,
        direction_count = 1,
        filename = "__base__/graphics/entity/remnants/big-remnants.png"
      },
      {
        width = 109,
        height = 102,
        direction_count = 1,
        x = 109,
        filename = "__base__/graphics/entity/remnants/big-remnants.png"
      },
      {
        width = 109,
        height = 102,
        direction_count = 1,
        x = 218,
        filename = "__base__/graphics/entity/remnants/big-remnants.png"
      },
      {
        width = 109,
        height = 102,
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
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "generic-remnants",
    order = "a-d-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(4,
    {
      filename = "__base__/graphics/entity/remnants/medium-remnants.png",
      line_length = 1,
      width = 236,
      height = 246,
      direction_count = 1,
      shift = util.by_pixel(0, -4.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "medium-small-remnants",
    localised_name = {"entity-name.medium-small-remnants"},
    icon = "__base__/graphics/icons/remnants.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "generic-remnants",
    order = "a-e-a",
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(2,
    {
      filename = "__base__/graphics/entity/remnants/medium-small-remnants.png",
      line_length = 1,
      width = 166,
      height = 176,
      direction_count = 1,
      shift = util.by_pixel(3, 3.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "small-remnants",
    localised_name = {"entity-name.small-remnants"},
    icon = "__base__/graphics/icons/remnants.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "generic-remnants",
    order = "a-a-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(2,
    {
      filename = "__base__/graphics/entity/remnants/small-remnants.png",
      line_length = 1,
      width = 112,
      height = 110,
      direction_count = 1,
      shift = util.by_pixel(0, 3.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "1x2-remnants",
    localised_name = {"entity-name.1x2-remnants"},
    icon = "__base__/graphics/icons/remnants.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "generic-remnants",
    order = "a-b-a",
    selection_box = {{-0.5, -1}, {0.5, 1}},
    tile_width = 2,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/remnants/1x2-remnants.png",
      line_length = 1,
      width = 172,
      height = 142,
      direction_count = 4,
      shift = util.by_pixel(3, 5),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "wooden-chest-remnants",
    icon = "__base__/graphics/icons/wooden-chest.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "storage-remnants",
    order = "a-a-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/wooden-chest/remnants/wooden-chest-remnants.png",
      line_length = 1,
      width = 110,
      height = 74,
      direction_count = 1,
      shift = util.by_pixel(7.5, -1),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "iron-chest-remnants",
    icon = "__base__/graphics/icons/iron-chest.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "storage-remnants",
    order = "a-b-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/iron-chest/remnants/iron-chest-remnants.png",
      line_length = 1,
      width = 126,
      height = 78,
      direction_count = 1,
      shift = util.by_pixel(12, 0),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "assembling-machine-1-remnants",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "production-machine-remnants",
    order = "a-a-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/assembling-machine-1/remnants/assembling-machine-1-remnants.png",
      line_length = 1,
      width = 328,
      height = 282,
      direction_count = 1,
      shift = util.by_pixel(0, 9.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "assembling-machine-2-remnants",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "production-machine-remnants",
    order = "a-a-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/assembling-machine-2/remnants/assembling-machine-2-remnants.png",
      line_length = 1,
      width = 328,
      height = 282,
      direction_count = 1,
      shift = util.by_pixel(0, 9.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "burner-inserter-remnants",
    icon = "__base__/graphics/icons/burner-inserter.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "inserter-remnants",
    order = "a-a-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__base__/graphics/entity/burner-inserter/remnants/burner-inserter-remnants.png",
      line_length = 1,
      width = 134,
      height = 94,
      direction_count = 1,
      shift = util.by_pixel(3.5, -2),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "inserter-remnants",
    icon = "__base__/graphics/icons/inserter.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "inserter-remnants",
    order = "a-b-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__base__/graphics/entity/inserter/remnants/inserter-remnants.png",
      line_length = 1,
      width = 134,
      height = 94,
      direction_count = 1,
      shift = util.by_pixel(3.5, -2),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "long-handed-inserter-remnants",
    icon = "__base__/graphics/icons/long-handed-inserter.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "inserter-remnants",
    order = "a-c-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__base__/graphics/entity/long-handed-inserter/remnants/long-handed-inserter-remnants.png",
      line_length = 1,
      width = 134,
      height = 94,
      direction_count = 1,
      shift = util.by_pixel(3.5, -2),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "fast-inserter-remnants",
    icon = "__base__/graphics/icons/fast-inserter.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "inserter-remnants",
    order = "a-d-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__base__/graphics/entity/fast-inserter/remnants/fast-inserter-remnants.png",
      line_length = 1,
      width = 134,
      height = 94,
      direction_count = 1,
      shift = util.by_pixel(3.5, -2),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "transport-belt-remnants",
    icon = "__base__/graphics/icons/transport-belt.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "belt-remnants",
    order = "a-a-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    animation =  make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__base__/graphics/entity/transport-belt/remnants/transport-belt-remnants.png",
      line_length = 1,
      width = 106,
      height = 102,
      direction_count = 4,
      shift = util.by_pixel(1, -0.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "splitter-remnants",
    icon = "__base__/graphics/icons/splitter.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "belt-remnants",
    order = "a-g-a",
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    tile_width = 2,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/splitter/remnants/splitter-remnants.png",
      line_length = 1,
      width = 190,
      height = 190,
      direction_count = 4,
      shift = util.by_pixel(3.5, 1.5),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "underground-belt-remnants",
    icon = "__base__/graphics/icons/underground-belt.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map", "building-direction-8-way"},
    subgroup = "belt-remnants",
    order="a-d-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/underground-belt/remnants/underground-belt-remnants.png",
      line_length = 1,
      width = 156,
      height = 144,
      direction_count = 8,
      shift = util.by_pixel(10.5, 3),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "wall-remnants",
    localised_name = {"remnant-name", {"entity-name.stone-wall"}},
    icon = "__base__/graphics/icons/wall.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "defensive-structure-remnants",
    order = "a-a-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(4,
    {
      filename = "__base__/graphics/entity/wall/remnants/wall-remnants.png",
      width = 118,
      height = 114,
      line_length = 1,
      direction_count = 2,
      shift = util.by_pixel(3, 7.5), --was 3.5
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "gate-remnants",
    icon = "__base__/graphics/icons/gate.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "defensive-structure-remnants",
    order = "a-b-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      {
        filename = "__base__/graphics/entity/gate/remnants/gate-remnants-var-1.png",
        line_length = 1,
        width = 86,
        height = 82,
        direction_count = 4,
        shift = util.by_pixel(0, 1),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/gate/remnants/gate-remnants-var-2.png",
        line_length = 1,
        width = 84,
        height = 82,
        direction_count = 4,
        shift = util.by_pixel(-0.5, 0),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/gate/remnants/gate-remnants-var-3.png",
        line_length = 1,
        width = 82,
        height = 84,
        direction_count = 4,
        shift = util.by_pixel(0, 0.5),
        scale = 0.5
      }
    }
  },

  {
    type = "corpse",
    name = "lamp-remnants",
    localised_name = {"remnant-name", {"entity-name.small-lamp"}},
    icon = "__base__/graphics/icons/small-lamp.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "circuit-network-remnants",
    order = "a-a-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/small-lamp/remnants/lamp-remnants.png",
      line_length = 1,
      width = 102,
      height = 96,
      direction_count = 1,
      shift = util.by_pixel(-1, 3),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "small-electric-pole-remnants",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-a-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
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
        width = 180,
        height = 106,
        direction_count = 1,
        shift = util.by_pixel(17, -1),
        scale = 0.5
      }
    }
  }),

  animation_overlay = make_rotated_animation_variations_from_sheet (4,
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/small-electric-pole/remnants/small-electric-pole-top-remnants.png",
        line_length = 1,
        width = 86,
        height = 120,
        direction_count = 1,
        shift = util.by_pixel(3.5, -21.5),
        scale = 0.5
      }
    }
  })
 },

  {
    type = "corpse",
    name = "medium-electric-pole-remnants",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-b-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
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
        width = 284,
        height = 140,
        direction_count = 1,
        shift = util.by_pixel(35, -5),
        scale = 0.5
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
        width = 100,
        height = 184,
        direction_count = 1,
        shift = util.by_pixel(0, -38.5),
        scale = 0.5
      }
    }
  })
 },

  {
    type = "corpse",
    name = "big-electric-pole-remnants",
    icon = "__base__/graphics/icons/big-electric-pole.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-c-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
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
        width = 366,
        height = 188,
        direction_count = 1,
        shift = util.by_pixel(43, 0.5),
        scale = 0.5
      }
    }
  }),

  animation_overlay = make_rotated_animation_variations_from_sheet (4,
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/big-electric-pole/remnants/big-electric-pole-top-remnants.png",
        line_length = 1,
        width = 148,
        height = 252,
        direction_count = 1,
        shift = util.by_pixel(-1.5, -48),
        scale = 0.5
      }
    }
  })
 },

  {
    type = "corpse",
    name = "pipe-remnants",
    icon = "__base__/graphics/icons/pipe.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(2,
    {
      filename = "__base__/graphics/entity/pipe/remnants/pipe-remnants.png",
      width = 122,
      height = 120,
      line_length = 1,
      direction_count = 2,
      shift = util.by_pixel(1.5, 2.5), -- -0,5
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "pipe-to-ground-remnants",
    icon = "__base__/graphics/icons/pipe-to-ground.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/pipe-to-ground/remnants/pipe-to-ground-remnants.png",
      width = 90,
      height = 80,
      line_length = 1,
      direction_count = 1,
      shift = util.by_pixel(0.5, -3),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "stone-furnace-remnants",
    icon = "__base__/graphics/icons/stone-furnace.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "smelting-machine-remnants",
    order = "a-a-a",
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(1,
    {
      filename = "__base__/graphics/entity/stone-furnace/remnants/stone-furnace-remnants.png",
      line_length = 1,
      width = 152,
      height = 130,
      direction_count = 1,
      shift = util.by_pixel(0, 9.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "steel-furnace-remnants",
    icon = "__base__/graphics/icons/steel-furnace.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "smelting-machine-remnants",
    order = "a-a-a",
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(1,
    {
      filename = "__base__/graphics/entity/steel-furnace/remnants/steel-furnace-remnants.png",
      line_length = 1,
      width = 268,
      height = 238,
      direction_count = 1,
      shift = util.by_pixel(4, 0.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "electric-furnace-remnants",
    icon = "__base__/graphics/icons/electric-furnace.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "smelting-machine-remnants",
    order = "a-a-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/electric-furnace/remnants/electric-furnace-remnants.png",
      line_length = 1,
      width = 454,
      height = 448,
      direction_count = 1,
      shift = util.by_pixel(-3.25, 7.25),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "burner-mining-drill-remnants",
    icon = "__base__/graphics/icons/burner-mining-drill.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "extraction-machine-remnants",
    order = "a-a-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/burner-mining-drill/remnants/burner-mining-drill-remnants.png",
      line_length = 1,
      width = 272,
      height = 234,
      direction_count = 1,
      shift = util.by_pixel(-0.5, -4.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "electric-mining-drill-remnants",
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "extraction-machine-remnants",
    order = "a-a-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__base__/graphics/entity/electric-mining-drill/remnants/electric-mining-drill-remnants.png",
      line_length = 1,
      width = 356,
      height = 328,
      direction_count = 1,
      shift = util.by_pixel(7, -0.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "gun-turret-remnants",
    icon = "__base__/graphics/icons/gun-turret.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "defensive-structure-remnants",
    order = "a-c-a",
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gun-turret/remnants/gun-turret-remnants.png",
          line_length = 1,
          width = 252,
          height = 242,
          direction_count = 1,
          shift = util.by_pixel(3, -1.5),
          scale = 0.5
        },
        {
          priority = "low",
          filename = "__base__/graphics/entity/gun-turret/remnants/mask/gun-turret-remnants-mask.png",
          width = 68,
          height = 64,
          apply_runtime_tint = true,
          direction_count = 1,
          shift = util.by_pixel(-1, -11),
          scale = 0.5
        }
      }
    })
  },

  {
    type = "corpse",
    name = "radar-remnants",
    icon = "__base__/graphics/icons/radar.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "defensive-structure-remnants",
    order = "a-g-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/radar/remnants/radar-remnants.png",
      line_length = 1,
      width = 282,
      height = 212,
      direction_count = 1,
      shift = util.by_pixel(12, 4.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "offshore-pump-remnants",
    icon = "__base__/graphics/icons/offshore-pump.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "extraction-machine-remnants",
    order="a-d-b",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      {
        filename = "__base__/graphics/entity/offshore-pump/remnants/offshore-pump-remnants-variation-1.png",
        line_length = 1,
        width = 146,
        height = 140,
        direction_count = 4,
        shift = util.by_pixel(2, -2.5),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/offshore-pump/remnants/offshore-pump-remnants-variation-2.png",
        line_length = 1,
        width = 136,
        height = 134,
        direction_count = 4,
        shift = util.by_pixel(1.5, 0.5),
        scale = 0.5
      }
    }
  },

  {
    type = "corpse",
    name = "steam-engine-remnants",
    icon = "__base__/graphics/icons/steam-engine.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-remnants",
    order = "a-b-a",
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    tile_width = 3,
    tile_height = 5,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/steam-engine/remnants/steam-engine-remnants.png",
      line_length = 1,
      width = 462,
      height = 386,
      direction_count = 4,
      shift = util.by_pixel(17, 6.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "lab-remnants",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "production-machine-remnants",
    order = "a-g-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__base__/graphics/entity/lab/remnants/lab-remnants.png",
      line_length = 1,
      width = 266,
      height = 196,
      direction_count = 1,
      shift = util.by_pixel(7, 5.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "boiler-remnants",
    icon = "__base__/graphics/icons/boiler.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-remnants",
    order = "a-a-a",
    selection_box = {{-1.5, -1}, {1.5, 1}},
    tile_width = 3,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/boiler/remnants/boiler-remnants.png",
      line_length = 1,
      width = 274,
      height = 220,
      direction_count = 4,
      shift = util.by_pixel(-0.5, -3),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "car-remnants",
    icon = "__base__/graphics/icons/car.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
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
          width = 302,
          height = 300,
          direction_count = 4,
          shift = util.by_pixel(0, 4.5),
          scale = 0.5
        },
        {
          priority = "low",
          filename = "__base__/graphics/entity/car/remnants/mask/car-remnants-mask.png",
          width = 196,
          height = 146,
          apply_runtime_tint = true,
          direction_count = 4,
          shift = util.by_pixel(0, 4.5),
          scale = 0.5
        }
      }
    }
  },

  {
    type = "corpse",
    name = "small-scorchmark",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    hidden_in_factoriopedia = true,
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={doodad=true}, not_colliding_with_itself=true},
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
        width = 256,
        height = 182,
        line_length = 4,
        shift = util.by_pixel(0, 2),
        variation_count = 4,
        scale = 0.5
      }
    },
    ground_patch_higher =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/small-scorchmark-top.png",
        width = 68,
        height = 54,
        line_length = 4,
        shift = util.by_pixel(0, -2),
        variation_count = 4,
        scale = 0.5
      }
    }
  },
  {
    type = "corpse",
    name = "small-scorchmark-tintable",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    hidden_in_factoriopedia = true,
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={doodad=true}, not_colliding_with_itself=true},
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
        width = 256,
        height = 182,
        line_length = 4,
        shift = util.by_pixel(0, 2),
        apply_runtime_tint = true,
        variation_count = 4,
        scale = 0.5
      }
    },
    ground_patch_higher =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/small-scorchmark-tintable-top.png",
        width = 68,
        height = 54,
        line_length = 4,
        shift = util.by_pixel(0, -2),
        variation_count = 4,
        apply_runtime_tint = true,
        scale = 0.5
      }
    }
  },
  {
    type = "rail-remnants",
    name = "legacy-straight-rail-remnants",
    icon = "__base__/graphics/icons/straight-rail-remnants.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "remnants",
    order="d[remnants]-b[rail]-a[straight]",
    collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selectable_in_game = false,
    expires = false,
    tile_width = 2,
    tile_height = 2,
    related_rail = "legacy-straight-rail",
    pictures = legacy_rail_remnants_pictures("legacy_straight_rail"),
    time_before_removed = 60 * 60 * 45,
    time_before_shading_off = 60 * 60 * 1
  },
  {
    type = "rail-remnants",
    name = "legacy-curved-rail-remnants",
    icon = "__base__/graphics/icons/curved-rail-remnants.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "remnants",
    order="d[remnants]-b[rail]-b[curved]",
    collision_box = {{-0.75, -0.55}, {0.75, 1.6}},
    secondary_collision_box = {{-0.65, -2.43}, {0.65, 2.43}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    selectable_in_game = false,
    expires = false,
    tile_width = 4,
    tile_height = 8,
    related_rail = "legacy-curved-rail",
    pictures = legacy_rail_remnants_pictures("legacy_curved_rail"),
    time_before_removed = 60 * 60 * 45,
    time_before_shading_off = 60 * 60 * 1
  },
  {
    type = "rail-remnants",
    name = "straight-rail-remnants",
    icon = "__base__/graphics/icons/straight-rail-remnants.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "remnants",
    order="d[remnants]-b[rail]-a[straight]",
    collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selectable_in_game = false,
    tile_width = 2,
    tile_height = 2,
    related_rail = "straight-rail",
    pictures = new_rail_remnants_pictures("straight"),
    expires = false,
    time_before_removed = 60 * 60 * 45,
    time_before_shading_off = 60 * 60 * 1
  },
  {
    type = "rail-remnants",
    name = "half-diagonal-rail-remnants",
    icon = "__base__/graphics/icons/straight-rail-remnants.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "remnants",
    order="d[remnants]-b[rail]-a[straight]",
    collision_box = {{-0.75, -2.236}, {0.75, 2.236}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    selectable_in_game = false,
    tile_width = 2,
    tile_height = 2,
    related_rail = "half-diagonal-rail",
    pictures = new_rail_remnants_pictures("half-diagonal"),
    expires = false,
    time_before_removed = 60 * 60 * 45,
    time_before_shading_off = 60 * 60 * 1
  },
  {
    type = "rail-remnants",
    name = "curved-rail-a-remnants",
    icon = "__base__/graphics/icons/curved-rail-remnants.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "remnants",
    order="d[remnants]-b[rail]-b[curved]",
    collision_box = {{-0.75, -2.516}, {0.75, 2.516}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    selectable_in_game = false,
    tile_width = 4,
    tile_height = 8,
    related_rail = "curved-rail-a",
    pictures = new_rail_remnants_pictures("curved-a"),
    expires = false,
    time_before_removed = 60 * 60 * 45,
    time_before_shading_off = 60 * 60 * 1
  },
  {
    type = "rail-remnants",
    name = "curved-rail-b-remnants",
    icon = "__base__/graphics/icons/curved-rail-remnants.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "remnants",
    order="d[remnants]-b[rail]-b[curved]",
    collision_box = {{-0.75, -2.441}, {0.75, 2.441}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    selectable_in_game = false,
    tile_width = 4,
    tile_height = 8,
    related_rail = "curved-rail-b",
    pictures = new_rail_remnants_pictures("curved-b"),
    expires = false,
    time_before_removed = 60 * 60 * 45,
    time_before_shading_off = 60 * 60 * 1
  },

  {
    type = "corpse",
    name = "rail-ending-remnants",
    localised_name = {"entity-name.rail-ending-remnants"},
    icon = "__base__/graphics/icons/curved-rail-remnants.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
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
          flags = {"low-object"},
          width = 256,
          height = 256,
          direction_count = 8,
          line_length = 8,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rail-endings/rail-endings-metals.png",
          priority = "high",
          flags = {"trilinear-filtering"},
          width = 256,
          height = 256,
          direction_count = 8,
          line_length = 8,
          scale = 0.5
        }
      }
    },
    expires = false,
    time_before_removed = 60 * 60 * 45,
    time_before_shading_off = 60 * 60 * 1
  },

  {
    type = "corpse",
    name = "rail-chain-signal-remnants",
    icon = "__base__/graphics/icons/rail-chain-signal.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "train-transport-remnants",
    order = "a-e-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet(1,
    {
      filename = "__base__/graphics/entity/rail-chain-signal/remnants/rail-chain-signal-remnants.png",
      line_length = 1,
      width = 98,
      height = 94,
      direction_count = 1,
      shift = util.by_pixel(-2, -0.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "steel-chest-remnants",
    icon = "__base__/graphics/icons/steel-chest.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "storage-remnants",
    order = "a-c-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/steel-chest/remnants/steel-chest-remnants.png",
      line_length = 1,
      width = 150,
      height = 88,
      direction_count = 1,
      shift = util.by_pixel(15, -1),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "rail-signal-remnants",
    icon = "__base__/graphics/icons/rail-signal.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "train-transport-remnants",
    order = "a-d-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet(1,
    {
      filename = "__base__/graphics/entity/rail-signal/remnants/rail-signal-remnants.png",
      line_length = 1,
      width = 90,
      height = 88,
      direction_count = 1,
      shift = util.by_pixel(5, 0),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "fast-transport-belt-remnants",
    icon = "__base__/graphics/icons/fast-transport-belt.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "belt-remnants",
    order = "a-b-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =  make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__base__/graphics/entity/fast-transport-belt/remnants/fast-transport-belt-remnants.png",
      line_length = 1,
      width = 106,
      height = 102,
      direction_count = 4,
      shift = util.by_pixel(1, -0.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "fast-splitter-remnants",
    icon = "__base__/graphics/icons/fast-splitter.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "belt-remnants",
    order = "a-h-a",
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    tile_width = 2,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/fast-splitter/remnants/fast-splitter-remnants.png",
      line_length = 1,
      width = 190,
      height = 190,
      direction_count = 4,
      shift = util.by_pixel(3.5, 1.5),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "fast-underground-belt-remnants",
    icon = "__base__/graphics/icons/fast-underground-belt.png",
    flags = {"placeable-neutral", "not-on-map", "building-direction-8-way"},
    hidden_in_factoriopedia = true,
    subgroup = "belt-remnants",
    order = "a-e-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/fast-underground-belt/remnants/fast-underground-belt-remnants.png",
      line_length = 1,
      width = 156,
      height = 144,
      direction_count = 8,
      shift = util.by_pixel(10.5, 3),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "laser-turret-remnants",
    icon = "__base__/graphics/icons/laser-turret.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "defensive-structure-remnants",
    order = "a-d-a",
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/remnants/laser-turret-remnants.png",
          line_length = 1,
          width = 198,
          height = 194,
          direction_count = 1,
          shift = util.by_pixel(2.5, -2),
          scale = 0.5
        },
        {
          priority = "low",
          filename = "__base__/graphics/entity/laser-turret/remnants/mask/laser-turret-remnants-mask.png",
          width = 114,
          height = 94,
          apply_runtime_tint = true,
          direction_count = 1,
          shift = util.by_pixel(4, -2.5),
          scale = 0.5
        }
      }
    })
  },

  {
    type = "corpse",
    name = "constant-combinator-remnants",
    icon = "__base__/graphics/icons/constant-combinator.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "circuit-network-remnants",
    order = "a-d-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/combinator/remnants/constant/constant-combinator-remnants.png",
      line_length = 1,
      width = 118,
      height = 112,
      direction_count = 4,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "arithmetic-combinator-remnants",
    icon = "__base__/graphics/icons/arithmetic-combinator.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "circuit-network-remnants",
    order = "a-b-a",
    selection_box = {{-0.5, -1}, {0.5, 1}},
    tile_width = 1,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/combinator/remnants/arithmetic/arithmetic-combinator-remnants.png",
      line_length = 1,
      width = 156,
      height = 156,
      direction_count = 4,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "decider-combinator-remnants",
    icon = "__base__/graphics/icons/decider-combinator.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "circuit-network-remnants",
    order = "a-c-a",
    selection_box = {{-0.5, -1}, {0.5, 1}},
    tile_width = 1,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/combinator/remnants/decider/decider-combinator-remnants.png",
      line_length = 1,
      width = 156,
      height = 156,
      direction_count = 4,
      shift = util.by_pixel(0, -0.5),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "power-switch-remnants",
    icon = "__base__/graphics/icons/power-switch.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "circuit-network-remnants",
    order = "a-c-a",
    selection_box = {{-0.5, -1}, {0.5, 1}},
    tile_width = 1,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/power-switch/remnants/power-switch-remnants.png",
      line_length = 1,
      width = 194,
      height = 176,
      direction_count = 1,
      shift = util.by_pixel(4.5, 10.5),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "programmable-speaker-remnants",
    icon = "__base__/graphics/icons/programmable-speaker.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "circuit-network-remnants",
    order = "a-e-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
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
          width = 170,
          height = 120,
          direction_count = 1,
          shift = util.by_pixel(12, 0),
          scale = 0.5
        }
      }
    }),
    animation_overlay = make_rotated_animation_variations_from_sheet (3,
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/programmable-speaker/remnants/programmable-speaker-top-remnants.png",
          line_length = 1,
          width = 74,
          height = 90,
          direction_count = 1,
          shift = util.by_pixel(0.5, -18),
          scale = 0.5
        }
      }
    })
  },

  {
    type = "corpse",
    name = "train-stop-remnants",
    icon = "__base__/graphics/icons/train-stop.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "train-transport-remnants",
    order = "a-c-a",
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
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
          width = 486,
          height = 454,
          shift = util.by_pixel(4.5, 13.5),
          direction_count = 4,
          scale = 0.5
        },
        {
          priority = "low",
          filename = "__base__/graphics/entity/train-stop/remnants/mask/train-stop-base-remnants-mask.png",
          width = 284,
          height = 214,
          apply_runtime_tint = true,
          direction_count = 4,
          shift = util.by_pixel(-1, 0.5),
          scale = 0.5
        }
      }
    },

    animation_overlay =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/train-stop/remnants/train-stop-top-remnants.png",
          line_length = 1,
          width = 136,
          height = 254,
          shift = util.by_pixel(1.5, -38),
          direction_count = 4,
          scale = 0.5
        }
      }
    }
  },

  {
    type = "corpse",
    name = "solar-panel-remnants",
    icon = "__base__/graphics/icons/solar-panel.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-remnants",
    order = "a-c-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__base__/graphics/entity/solar-panel/remnants/solar-panel-remnants.png",
      line_length = 1,
      width = 290,
      height = 282,
      direction_count = 1,
      shift = util.by_pixel(3.5, 0),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "locomotive-remnants",
    icon = "__base__/graphics/icons/locomotive.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
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
          filename = "__base__/graphics/entity/locomotive/remnants/locomotive-base-remnants.png",
          line_length = 1,
          width = 460,
          height = 436,
          direction_count = 8,
          shift = util.by_pixel(4, 0.5),
          scale = 0.5
        },
        {
          priority = "low",
          filename = "__base__/graphics/entity/locomotive/remnants/mask/locomotive-remnants-mask.png",
          width = 390,
          height = 292,
          apply_runtime_tint = true,
          tint_as_overlay = true,
          direction_count = 8,
          shift = util.by_pixel(0, 2),
          scale = 0.5
        }
      }
    }
  },

  {
    type = "corpse",
    name = "cargo-wagon-remnants",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
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
      width = 494,
      height = 484,
      direction_count = 8,
      shift = util.by_pixel(1.5, 6),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "accumulator-remnants",
    icon = "__base__/graphics/icons/accumulator.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-remnants",
    order = "a-d-a",
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/accumulator/remnants/accumulator-remnants.png",
      line_length = 1,
      width = 172,
      height = 146,
      direction_count = 1,
      shift = util.by_pixel(2.5, 3.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "defender-remnants",
    icon = "__base__/graphics/icons/defender.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    hidden_in_factoriopedia = true,
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
      width = 98,
      height = 94,
      direction_count = 1,
      shift = util.by_pixel(0.5, 0.5),
      scale = 0.5
    })
  },
  {
    type = "corpse",
    name = "rocket-silo-remnants",
    icon = "__base__/graphics/icons/rocket-silo.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "defensive-structure-remnants",
    order = "a-h-a",
    collision_box = {{-4.40, -4.40}, {4.40, 4.40}}, -- same as the silo, so it does render properly when on the edge of the screen
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    tile_width = 9,
    tile_height = 9,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(1,
    {
      filename = "__base__/graphics/entity/rocket-silo/15-remnants/rocket-silo-remnants.png",
      dice = 2,
      line_length = 1,
      width = 634,
      height = 582,
      direction_count = 1,
      shift = util.by_pixel(2.5, 0.5),
      scale = 0.5,
      allow_forced_downscale = true,
    })
  },

  {
    type = "corpse",
    name = "buffer-chest-remnants",
    localised_name = {"remnant-name", {"entity-name.buffer-chest"}},
    icon = "__base__/graphics/icons/buffer-chest.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "logistic-network-remnants",
    order = "a-f-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/logistic-chest/remnants/buffer-chest-remnants.png",
      line_length = 1,
      width = 116,
      height = 82,
      direction_count = 1,
      shift = util.by_pixel(10, -3),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "active-provider-chest-remnants",
    localised_name = {"remnant-name", {"entity-name.active-provider-chest"}},
    icon = "__base__/graphics/icons/active-provider-chest.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "logistic-network-remnants",
    order = "a-c-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/logistic-chest/remnants/active-provider-chest-remnants.png",
      line_length = 1,
      width = 116,
      height = 82,
      direction_count = 1,
      shift = util.by_pixel(10, -3),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "passive-provider-chest-remnants",
    localised_name = {"remnant-name", {"entity-name.passive-provider-chest"}},
    icon = "__base__/graphics/icons/passive-provider-chest.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "logistic-network-remnants",
    order = "a-d-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/logistic-chest/remnants/passive-provider-chest-remnants.png",
      line_length = 1,
      width = 116,
      height = 82,
      direction_count = 1,
      shift = util.by_pixel(10, -3),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "requester-chest-remnants",
    localised_name = {"remnant-name", {"entity-name.requester-chest"}},
    icon = "__base__/graphics/icons/requester-chest.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "logistic-network-remnants",
    order = "a-g-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/logistic-chest/remnants/requester-chest-remnants.png",
      line_length = 1,
      width = 116,
      height = 82,
      direction_count = 1,
      shift = util.by_pixel(10, -3),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "storage-chest-remnants",
    localised_name = {"remnant-name", {"entity-name.storage-chest"}},
    icon = "__base__/graphics/icons/storage-chest.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "logistic-network-remnants",
    order = "a-e-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/logistic-chest/remnants/storage-chest-remnants.png",
      line_length = 1,
      width = 116,
      height = 82,
      direction_count = 1,
      shift = util.by_pixel(10, -3),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "bulk-inserter-remnants",
    icon = "__base__/graphics/icons/bulk-inserter.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "inserter-remnants",
    order = "a-f-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__base__/graphics/entity/bulk-inserter/remnants/bulk-inserter-remnants.png",
      line_length = 1,
      width = 132,
      height = 96,
      direction_count = 1,
      shift = util.by_pixel(3, -1.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "land-mine-remnants",
    icon = "__base__/graphics/icons/land-mine.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "defensive-structure-remnants",
    order = "a-i-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/land-mine/remnants/land-mine-remnants.png",
      line_length = 1,
      width = 134,
      height = 130,
      direction_count = 1,
      shift = util.by_pixel(1.5, 5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "express-transport-belt-remnants",
    icon = "__base__/graphics/icons/express-transport-belt.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "belt-remnants",
    order = "a-c-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =  make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__base__/graphics/entity/express-transport-belt/remnants/express-transport-belt-remnants.png",
      line_length = 1,
      width = 106,
      height = 102,
      direction_count = 4,
      shift = util.by_pixel(1, -0.5),
      scale = 0.5
    })
  },
  {
    type = "corpse",
    name = "express-splitter-remnants",
    icon = "__base__/graphics/icons/express-splitter.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "belt-remnants",
    order = "a-i-a",
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    tile_width = 2,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/express-splitter/remnants/express-splitter-remnants.png",
      line_length = 1,
      width = 190,
      height = 190,
      direction_count = 4,
      shift = util.by_pixel(3.5, 1.5),
      scale = 0.5
    }
  },
  {
    type = "corpse",
    name = "express-underground-belt-remnants",
    icon = "__base__/graphics/icons/express-underground-belt.png",
    flags = {"placeable-neutral", "not-on-map", "building-direction-8-way"},
    hidden_in_factoriopedia = true,
    subgroup = "belt-remnants",
    order = "a-f-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/express-underground-belt/remnants/express-underground-belt-remnants.png",
      line_length = 1,
      width = 156,
      height = 144,
      direction_count = 8,
      shift = util.by_pixel(10.5, 3),
      scale = 0.5
    }
  },
  {
    type = "corpse",
    name = "substation-remnants",
    icon = "__base__/graphics/icons/substation.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/substation/remnants/substation-remnants.png",
      line_length = 1,
      width = 182,
      height = 134,
      direction_count = 1,
      shift = util.by_pixel(2.5, 0.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "storage-tank-remnants",
    icon = "__base__/graphics/icons/storage-tank.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "storage-remnants",
    order = "a-d-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(1,
    {
      filename = "__base__/graphics/entity/storage-tank/remnants/storage-tank-remnants.png",
      line_length = 1,
      width = 426,
      height = 282,
      direction_count = 1,
      shift = util.by_pixel(27, 21), --shift = util.by_pixel(-2.5, 10.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "oil-refinery-remnants",
    icon = "__base__/graphics/icons/oil-refinery.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "production-machine-remnants",
    order = "a-d-a",
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    tile_width = 5,
    tile_height = 5,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(1,
    {
      filename = "__base__/graphics/entity/oil-refinery/remnants/refinery-remnants.png",
      line_length = 1,
      width = 467,
      height = 415,
      direction_count = 1,
      shift = util.by_pixel(-0.25, -0.25), --moved from -8.5 to -4.5
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "pumpjack-remnants",
    icon = "__base__/graphics/icons/pumpjack.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "extraction-machine-remnants",
    order = "a-d-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(2,
    {
      filename = "__base__/graphics/entity/pumpjack/remnants/pumpjack-remnants.png",
      line_length = 1,
      width = 274,
      height = 284,
      direction_count = 1,
      shift = util.by_pixel(0, 3.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "centrifuge-remnants",
    icon = "__base__/graphics/icons/centrifuge.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "production-machine-remnants",
    order = "a-f-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/centrifuge/remnants/centrifuge-remnants.png",
      line_length = 1,
      width = 286,
      height = 284,
      direction_count = 1,
      shift = util.by_pixel(7, 4),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "flamethrower-turret-remnants",
    icon = "__base__/graphics/icons/flamethrower-turret.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "defensive-structure-remnants",
    order = "a-e-a",
    selection_box = {{-1, -1.5 }, {1, 1.5}},
    tile_width = 2,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/flamethrower-turret/remnants/flamethrower-turret-remnants.png",
          line_length = 1,
          width = 302,
          height = 326,
          direction_count = 4,
          shift = util.by_pixel(-1.5, -4),
          scale = 0.5
        },
        {
          priority = "low",
          filename = "__base__/graphics/entity/flamethrower-turret/remnants/mask/flamethrower-turret-remnants-mask.png",
          width = 164,
          height = 164,
          apply_runtime_tint = true,
          direction_count = 4,
          shift = util.by_pixel(0, -3.5),
          scale = 0.5
        }
      }
    }
  },

  {
    type = "corpse",
    name = "artillery-turret-remnants",
    icon = "__base__/graphics/icons/artillery-turret.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "defensive-structure-remnants",
    order = "a-f-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/artillery-turret/remnants/artillery-turret-remnants.png",
      line_length = 1,
      width = 326,
      height = 290,
      direction_count = 1,
      shift = util.by_pixel(9.5, 1.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "cargo-landing-pad-remnants",
    icon = "__base__/graphics/icons/cargo-landing-pad.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "logistic-network-remnants",
    order = "a-h-a",
    selection_box = {{-4, -4}, {4, 4}},
    collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
    tile_width = 8,
    tile_height = 8,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-remnants",
    {
      dice = 2,
      direction_count = 1,
      scale = 0.5,
      allow_forced_downscale = true,
    })
  },

  {
    type = "corpse",
    name = "roboport-remnants",
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "logistic-network-remnants",
    order = "a-h-a",
    selection_box = {{-2, -2}, {2, 2}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__base__/graphics/entity/roboport/remnants/roboport-remnants.png",
      line_length = 1,
      width = 364,
      height = 358,
      direction_count = 1,
      shift = util.by_pixel(2, 8),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "logistic-robot-remnants",
    icon = "__base__/graphics/icons/logistic-robot.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    hidden_in_factoriopedia = true,
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
      width = 116,
      height = 114,
      direction_count = 1,
      shift = util.by_pixel(1, 1),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "construction-robot-remnants",
    icon = "__base__/graphics/icons/construction-robot.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    hidden_in_factoriopedia = true,
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
      width = 120,
      height = 114,
      direction_count = 1,
      shift = util.by_pixel(2, 1),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "distractor-remnants",
    icon = "__base__/graphics/icons/distractor.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    hidden_in_factoriopedia = true,
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
      width = 112,
      height = 110,
      direction_count = 1,
      shift = util.by_pixel(-0.5, 0),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "destroyer-remnants",
    icon = "__base__/graphics/icons/destroyer.png",

    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    hidden_in_factoriopedia = true,
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
      width = 120,
      height = 108,
      direction_count = 1,
      shift = util.by_pixel(1.5, -0.5), -- was -0.5
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "steam-turbine-remnants",
    icon = "__base__/graphics/icons/steam-turbine.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-remnants",
    order = "a-h-a",
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    tile_width = 3,
    tile_height = 5,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/steam-turbine/remnants/steam-turbine-remnants.png",
      line_length = 1,
      width = 460,
      height = 408,
      direction_count = 4,
      shift = util.by_pixel(6, 0),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "pump-remnants",
    icon = "__base__/graphics/icons/pump.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
    selection_box = {{-0.5, -1}, {0.5, 1}},
    tile_width = 1,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__base__/graphics/entity/pump/remnants/pump-remnants.png",
      line_length = 1,
      width = 188,
      height = 186,
      direction_count = 4,
      shift = util.by_pixel(2, 2),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "beacon-remnants",
    icon = "__base__/graphics/icons/beacon.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
    selection_box = {{-0.5, -1}, {0.5, 1}},
    tile_width = 1,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__base__/graphics/entity/beacon/remnants/beacon-remnants.png",
      line_length = 1,
      width = 212,
      height = 206,
      direction_count = 1,
      shift = util.by_pixel(1, 5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "heat-exchanger-remnants",
    icon = "__base__/graphics/icons/heat-boiler.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-remnants",
    order = "a-g-a",
    selection_box = {{-1.5, -1}, {1.5, 1}},
    tile_width = 3,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/heat-exchanger/remnants/heat-exchanger-remnants.png",
      line_length = 1,
      width = 272,
      height = 262,
      direction_count = 4,
      shift = util.by_pixel(0.5, 8),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "heat-pipe-remnants",
    icon = "__base__/graphics/icons/heat-pipe.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-remnants",
    order = "a-f-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (6,
    {
      filename = "__base__/graphics/entity/heat-pipe/remnants/heat-pipe-remnants.png",
      line_length = 1,
      width = 122,
      height = 100,
      direction_count = 2,
      shift = util.by_pixel(0.5, -1.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "nuclear-reactor-remnants",
    icon = "__base__/graphics/icons/nuclear-reactor.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-remnants",
    order = "a-e-a",
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    tile_width = 5,
    tile_height = 5,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/remnants/nuclear-reactor-remnants.png",
      line_length = 1,
      width = 410,
      height = 396,
      direction_count = 1,
      shift = util.by_pixel(7, 4),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "chemical-plant-remnants",
    icon = "__base__/graphics/icons/chemical-plant.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "production-machine-remnants",
    order = "a-e-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/chemical-plant/remnants/chemical-plant-remnants.png",
      line_length = 1,
      width = 446,
      height = 342,
      direction_count = 1,
      shift = util.by_pixel(16, -5.5),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "tank-remnants",
    icon = "__base__/graphics/icons/tank.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
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
          width = 414,
          height = 380,
          direction_count = 4,
          shift = util.by_pixel(4, 0.5),
          scale = 0.5
        },
        {
          priority = "low",
          filename = "__base__/graphics/entity/tank/remnants/mask/tank-remnants-mask.png",
          width = 250,
          height = 218,
          apply_runtime_tint = true,
          direction_count = 4,
          shift = util.by_pixel(6.5, -1.5),
          scale = 0.5
        }
      }
    }
  },

  {
    type = "corpse",
    name = "fluid-wagon-remnants",
    icon = "__base__/graphics/icons/fluid-wagon.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
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
      width = 490,
      height = 504,
      direction_count = 8,
      shift = util.by_pixel(2, -5.5),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "artillery-wagon-remnants",
    icon = "__base__/graphics/icons/artillery-wagon.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
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
      width = 458,
      height = 464,
      direction_count = 8,
      shift = util.by_pixel(1, -0.5),
      scale = 0.5
    }
  },

  {
    type = "corpse",
    name = "assembling-machine-3-remnants",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "production-machine-remnants",
    order = "a-a-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/assembling-machine-3/remnants/assembling-machine-3-remnants.png",
      line_length = 1,
      width = 328,
      height = 282,
      direction_count = 1,
      shift = util.by_pixel(0, 9.5),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "spidertron-remnants",
    icon = "__base__/graphics/icons/spidertron.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "transport-remnants",
    order = "a-l-a",
    selection_box = {{-3, -3}, {3, 3}},
    collision_box = {{-2, -2}, {2, 2}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = true,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/spidertron/remnants/spidertron-remnants.png",
          line_length = 1,
          width = 448,
          height = 448,
          direction_count = 1,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        },
        {
          priority = "low",
          filename = "__base__/graphics/entity/spidertron/remnants/mask/spidertron-remnants-mask.png",
          width = 366,
          height = 350,
          apply_runtime_tint = true,
          direction_count = 1,
          shift = util.by_pixel(9, 1),
          scale = 0.5
        }
      }
    })
  },

  {
    type = "corpse",
    name = "medium-scorchmark",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    hidden_in_factoriopedia = true,
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    collision_mask = {layers={doodad=true}, not_colliding_with_itself=true},
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
        width = 510,
        height = 352,
        line_length = 2,
        shift = util.by_pixel(0, 0),
        variation_count = 2,
        scale = 0.5
      }
    },
    ground_patch_higher =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-top.png",
        width = 136,
        height = 100,
        line_length = 2,
        shift = util.by_pixel(0, 0),
        variation_count = 2,
        scale = 0.5
      }
    }
  },

  {
    type = "corpse",
    name = "medium-scorchmark-tintable",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    hidden_in_factoriopedia = true,
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    collision_mask = {layers={doodad=true}, not_colliding_with_itself=true},
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
        width = 510,
        height = 352,
        line_length = 2,
        shift = util.by_pixel(0, 0),
        apply_runtime_tint = true,
        variation_count = 2,
        scale = 0.5
      }
    },
    ground_patch_higher =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable-top.png",
        width = 136,
        height = 100,
        line_length = 2,
        shift = util.by_pixel(0, 0),
        apply_runtime_tint = true,
        variation_count = 2,
        scale = 0.5
      }
    }
  },

  {
    type = "corpse",
    name = "big-scorchmark",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    hidden_in_factoriopedia = true,
    collision_box = {{-4.5, -4.5}, {4.5, 4.5}},
    collision_mask = {layers={doodad=true}, not_colliding_with_itself=true},
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
        width = 960,
        height = 704,
        line_length = 1,
        shift = util.by_pixel(0, 0),
        dice_y = 2,
        variation_count = 1,
        scale = 0.5
      }
    },
    ground_patch_higher =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/big-scorchmark-top.png",
        width = 274,
        height = 194,
        line_length = 1,
        shift = util.by_pixel(0, 0),
        variation_count = 1,
        scale = 0.5
      }
    }
  },

  {
    type = "corpse",
    name = "big-scorchmark-tintable",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    hidden_in_factoriopedia = true,
    collision_box = {{-4.5, -4.5}, {4.5, 4.5}},
    collision_mask = {layers={doodad=true}, not_colliding_with_itself=true},
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
        width = 960,
        height = 704,
        line_length = 1,
        shift = util.by_pixel(0, 0),
        apply_runtime_tint = true,
        dice_y = 2,
        variation_count = 1,
        scale = 0.5
      }
    },
    ground_patch_higher =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable-top.png",
        width = 274,
        height = 194,
        line_length = 1,
        shift = util.by_pixel(0, 0),
        apply_runtime_tint = true,
        variation_count = 1,
        scale = 0.5
      }
    }
  },

  {
    type = "corpse",
    name = "huge-scorchmark",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    hidden_in_factoriopedia = true,
    collision_box = {{-4.5, -4.5}, {4.5, 4.5}},
    collision_mask = {layers={doodad=true}, not_colliding_with_itself=true},
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
          dice_y = 2,
          width = 960,
          height = 704,
          line_length = 1,
          shift = util.by_pixel(0, -24),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark.png",
          width = 510,
          height = 352,
          line_length = 2,
          shift = util.by_pixel(44, -23),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark.png",
          width = 510,
          height = 352,
          line_length = 2,
          shift = util.by_pixel(-44, -23),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark.png",
          dice_y = 2,
          width = 960,
          height = 704,
          line_length = 1,
          shift = util.by_pixel(32, 0),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark.png",
          dice_y = 2,
          width = 960,
          height = 704,
          line_length = 1,
          shift = util.by_pixel(-32, 0),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark.png",
          width = 510,
          height = 352,
          line_length = 2,
          shift = util.by_pixel(44, 23),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark.png",
          width = 510,
          height = 352,
          line_length = 2,
          shift = util.by_pixel(-44, 23),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark.png",
          dice_y = 2,
          width = 960,
          height = 704,
          line_length = 1,
          shift = util.by_pixel(0, 24),
          scale = 0.5
        }
      }
    },
    ground_patch_higher =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-top.png",
          width = 274,
          height = 194,
          line_length = 1,
          shift = util.by_pixel(0, -24),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-top.png",
          width = 136,
          height = 100,
          line_length = 2,
          shift = util.by_pixel(44, -23),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-top.png",
          width = 136,
          height = 100,
          line_length = 2,
          shift = util.by_pixel(-44, -23),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-top.png",
          width = 274,
          height = 194,
          line_length = 1,
          shift = util.by_pixel(32, 0),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-top.png",
          width = 274,
          height = 194,
          line_length = 1,
          shift = util.by_pixel(-32, 0),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-top.png",
          width = 136,
          height = 100,
          line_length = 2,
          shift = util.by_pixel(44, 23),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-top.png",
          width = 136,
          height = 100,
          line_length = 2,
          shift = util.by_pixel(-44, 23),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-top.png",
          width = 274,
          height = 194,
          line_length = 1,
          shift = util.by_pixel(0, 24),
          scale = 0.5
        }
      }
    }
  },

  {
    type = "corpse",
    name = "selector-combinator-remnants",
    icon = "__base__/graphics/icons/selector-combinator.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "circuit-network-remnants",
    order = "a-b-a",
    selection_box = {{-0.5, -1}, {0.5, 1}},
    tile_width = 1,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__base__/graphics/entity/combinator/remnants/selector/selector-combinator-remnants.png",
      line_length = 1,
      width = 156,
      height = 156,
      direction_count = 4,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    }
  },
  {
    type = "corpse",
    name = "cargo-pod-container-remnants",
    hidden_in_factoriopedia = true,
    icon = "__base__/graphics/icons/cargo-pod.png",
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "generic-remnants",
    order = "c[cargo]-p[pod]-c[container]-r[remnants]",
    time_before_removed = 60 * 60 * 5, -- 5 minutes
    selectable_in_game = false,
    final_render_layer = "remnants",
    animation =
    util.sprite_load("__base__/graphics/entity/cargo-pod/pod-corpse",
    {
      scale = 0.5,
      direction_count = 1,
      frame_count = 1
    })
  },

  {
    type = "corpse",
    name = "huge-scorchmark-tintable",
    icon = "__base__/graphics/icons/small-scorchmark.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    hidden_in_factoriopedia = true,
    collision_box = {{-4.5, -4.5}, {4.5, 4.5}},
    collision_mask = {layers={doodad=true}, not_colliding_with_itself=true},
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
          dice_y = 2,
          width = 960,
          height = 704,
          line_length = 1,
          shift = util.by_pixel(0, -24),
          apply_runtime_tint = true,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable.png",
          width = 510,
          height = 352,
          line_length = 2,
          shift = util.by_pixel(44, -23),
          apply_runtime_tint = true,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable.png",
          width = 510,
          height = 352,
          line_length = 2,
          shift = util.by_pixel(-44, -23),
          apply_runtime_tint = true,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable.png",
          dice_y = 2,
          width = 960,
          height = 704,
          line_length = 1,
          shift = util.by_pixel(32, 0),
          apply_runtime_tint = true,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable.png",
          dice_y = 2,
          width = 960,
          height = 704,
          line_length = 1,
          shift = util.by_pixel(-32, 0),
          apply_runtime_tint = true,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable.png",
          width = 510,
          height = 352,
          line_length = 2,
          shift = util.by_pixel(44, 23),
          apply_runtime_tint = true,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable.png",
          width = 510,
          height = 352,
          line_length = 2,
          shift = util.by_pixel(-44, 23),
          apply_runtime_tint = true,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable.png",
          dice_y = 2,
          width = 960,
          height = 704,
          line_length = 1,
          shift = util.by_pixel(0, 24),
          apply_runtime_tint = true,
          scale = 0.5
        }
      }
    },
    ground_patch_higher =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable-top.png",
          width = 274,
          height = 194,
          line_length = 1,
          shift = util.by_pixel(0, -24),
          apply_runtime_tint = true,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable-top.png",
          width = 136,
          height = 100,
          line_length = 2,
          shift = util.by_pixel(44, -23),
          apply_runtime_tint = true,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable-top.png",
          width = 136,
          height = 100,
          line_length = 2,
          shift = util.by_pixel(-44, -23),
          apply_runtime_tint = true,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable-top.png",
          width = 274,
          height = 194,
          line_length = 1,
          shift = util.by_pixel(32, 0),
          apply_runtime_tint = true,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable-top.png",
          width = 274,
          height = 194,
          line_length = 1,
          shift = util.by_pixel(-32, 0),
          apply_runtime_tint = true,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable-top.png",
          width = 136,
          height = 100,
          line_length = 2,
          shift = util.by_pixel(44, 23),
          apply_runtime_tint = true,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-tintable-top.png",
          width = 136,
          height = 100,
          line_length = 2,
          shift = util.by_pixel(-44, 23),
          apply_runtime_tint = true,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/scorchmark/big-scorchmark-tintable-top.png",
          width = 274,
          height = 194,
          line_length = 1,
          shift = util.by_pixel(0, 24),
          apply_runtime_tint = true,
          scale = 0.5
        }
      }
    }
  }
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

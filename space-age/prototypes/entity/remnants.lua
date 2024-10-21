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
    name = "stack-inserter-remnants",
    icon = "__space-age__/graphics/icons/stack-inserter.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "inserter-remnants",
    order = "a-h-a",
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
      filename = "__space-age__/graphics/entity/stack-inserter/remnants/stack-inserter-remnants.png",
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
    name = "turbo-transport-belt-remnants",
    icon = "__space-age__/graphics/icons/turbo-transport-belt.png",
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
      filename = "__space-age__/graphics/entity/turbo-transport-belt/remnants/turbo-transport-belt-remnants.png",
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
    name = "turbo-splitter-remnants",
    icon = "__space-age__/graphics/icons/turbo-splitter.png",
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
      filename = "__space-age__/graphics/entity/turbo-splitter/remnants/turbo-splitter-remnants.png",
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
    name = "turbo-underground-belt-remnants",
    icon = "__space-age__/graphics/icons/turbo-underground-belt.png",
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
      filename = "__space-age__/graphics/entity/turbo-underground-belt/remnants/turbo-underground-belt-remnants.png",
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
    name = "foundry-remnants",
    icon = "__space-age__/graphics/icons/foundry.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "smelting-machine-remnants",
    order = "d[foundry]",
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
      filename = "__space-age__/graphics/entity/foundry/foundry-remnants.png",
      line_length = 1,
      width = 494,
      height = 478,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel( -1.5, -5.5),
      scale = 0.5
    }
  },
  {
    type = "corpse",
    name = "lightning-rod-remnants",
    icon = "__space-age__/graphics/icons/lightning-rod.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "environmental-protection-remnants",
    order = "a-k-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    expires = false,
    animation = util.sprite_load("__space-age__/graphics/entity/lightning-rod/lightning-rod-remnants",
      {
        direction_count = 1,
        scale = 0.5
      }
    )
  },
  {
  type = "corpse",
  name = "lightning-collector-remnants",
  icon = "__space-age__/graphics/icons/lightning-collector.png",
  flags = {"placeable-neutral", "not-on-map"},
  hidden_in_factoriopedia = true,
  subgroup = "environmental-protection-remnants",
  order = "a-l-a",
  selection_box = {{-1, -1}, {1, 1}},
  tile_width = 2,
  tile_height = 2,
  selectable_in_game = false,
  time_before_removed = 60 * 60 * 15, -- 15 minutes
  expires = false,
  final_render_layer = "remnants",
  remove_on_tile_placement = false,
  animation = util.sprite_load("__space-age__/graphics/entity/lightning-collector/lightning-collector-remnants",
      {
        direction_count = 1,
        scale = 0.5
      }
    )
  },
  {
    type = "corpse",
    name = "cargo-bay-remnants",
    icon = "__space-age__/graphics/icons/cargo-bay.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "environmental-protection-remnants",
    order = "a-l-a",
    selection_box = {{-2, -2}, {2, 2}},
    collision_box = {{-1.9, -1.9}, {1.9, 1.9}},
    tile_width = 4,
    tile_height = 4,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (4, util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/planet-bay-remnants",
        {
          direction_count = 1,
          scale = 0.5
        }))
  },
  {
    type = "corpse",
    name = "rocket-turret-remnants",
    icon = "__space-age__/graphics/icons/rocket-turret.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "defensive-structure-remnants",
    order = "a-c-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/rocket-turret/remnants/rocket-turret-remnants",
        {
          line_length = 1,
          direction_count = 1,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        }),
        util.sprite_load("__space-age__/graphics/entity/rocket-turret/remnants/rocket-turret-remnants-mask",
        {
          priority = "low",
          line_length = 1,
          apply_runtime_tint = true,
          direction_count = 1,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        })
      }
    })
  },
  {
    type = "corpse",
    name = "tesla-turret-remnants",
    icon = "__space-age__/graphics/icons/tesla-turret.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "defensive-structure-remnants",
    order = "a-c-a",
    selection_box = {{-2, -2 }, {2, 2}},
    tile_width = 4,
    tile_height = 4,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/tesla-turret/remnant/tesla-turret-remnants",
        {
          line_length = 1,
          direction_count = 1,
          shift = util.by_pixel(0, -26),
          scale = 0.5
        }),
        util.sprite_load("__space-age__/graphics/entity/tesla-turret/remnant/tesla-turret-remnants-mask",
        {
          priority = "low",
          line_length = 1,
          apply_runtime_tint = true,
          direction_count = 1,
          shift = util.by_pixel(0, -26),
          scale = 0.5
        })
      }
    })
  },
  {
    type = "corpse",
    name = "railgun-turret-remnants",
    icon = "__space-age__/graphics/icons/railgun-turret.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "defensive-structure-remnants",
    order = "a-c-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/railgun-turret/remnants/railgun-turret-remnants",
        {
          line_length = 1,
          direction_count = 1,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        }),
        util.sprite_load("__space-age__/graphics/entity/railgun-turret/remnants/railgun-turret-remnants-mask",
        {
          priority = "low",
          line_length = 1,
          apply_runtime_tint = true,
          direction_count = 1,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        })
      }
    })
  },
  {
    type = "corpse",
    name = "agricultural-tower-remnants",
    icon = "__space-age__/graphics/icons/agricultural-tower.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "agriculture-remnants",
    order = "a[agricultural-tower]",
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
      filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-remnants.png",
      line_length = 1,
      width = 250,
      height = 250,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel( 0, 0),
      scale = 0.5
    }
  },
  {
    type = "corpse",
    name = "biochamber-remnants",
    icon = "__space-age__/graphics/icons/biochamber.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "agriculture-remnants",
    order = "b[biochamber]",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = util.sprite_load("__space-age__/graphics/entity/biochamber/biochamber-remnants",
    {
      scale = 0.5,
      frame_count = 1,
      direction_count = 1,
    }),
  },
  {
    type = "corpse",
    name = "electromagnetic-plant-remnants",
    icon = "__space-age__/graphics/icons/electromagnetic-plant.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "production-machine-remnants",
    order = "g[electromagnetic-plant]",
    selection_box = {{-2, -2}, {2, 2}},
    tile_width = 4,
    tile_height = 4,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/remnants/electromagnetic-plant-remnants",
      {
        frame_count = 1,
        direction_count = 1,
        scale = 0.5
      }
    )
    }
  },
  {
    type = "corpse",
    name = "cryogenic-plant-remnants",
    icon = "__space-age__/graphics/icons/cryogenic-plant.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "production-machine-remnants",
    order = "i[cryogenic-plant]",
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    tile_width = 5,
    tile_height = 5,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = util.sprite_load("__space-age__/graphics/entity/cryogenic-plant/remnants/cryogenic-plant-remnants",{
      scale = 0.5,
      direction_count = 1
    })
  },
  {
    type = "corpse",
    name = "heating-tower-remnants",
    icon = "__space-age__/graphics/icons/heating-tower.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "environmental-protection-remnants",
    order = "c[heating-tower]",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-remnants",{
      scale = 0.5,
      direction_count = 1
    })
  },
  {
    type = "corpse",
    name = "fusion-reactor-remnants",
    icon = "__space-age__/graphics/icons/fusion-reactor.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-remnants",
    order = "g[fusion-energy]-a[reactor]",
    selection_box = {{-3, -3}, {3, 3}},
    tile_width = 6,
    tile_height = 6,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = util.sprite_load("__space-age__/graphics/entity/fusion-reactor/fusion-reactor-remnants",{
      scale = 0.5,
      direction_count = 1
    })
  },
  {
    type = "corpse",
    name = "fusion-generator-remnants",
    icon = "__space-age__/graphics/icons/fusion-generator.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-remnants",
    order = "g[fusion-energy]-b[generator]",
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    tile_width = 3,
    tile_height = 5,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = util.sprite_load("__space-age__/graphics/entity/fusion-generator/fusion-generator-remnants",
    {
      scale = 0.5,
      direction_count = 4
    })
  },
  {
    type = "corpse",
    name = "biolab-remnants",
    icon = "__space-age__/graphics/icons/biolab.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "agriculture-remnants",
    order = "c[biolab]",
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    tile_width = 5,
    tile_height = 5,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = util.sprite_load("__space-age__/graphics/entity/biolab/biolab-remnants",
    {
      scale = 0.5,
      direction_count = 1
    })
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

local sounds = require("prototypes.entity.sounds")
local tile_trigger_effects = require("prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__base__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local patch_for_inner_corner_of_transition_between_transition = tile_graphics.patch_for_inner_corner_of_transition_between_transition

base_tiles_util = base_tiles_util or {}
water_tile_type_names = water_tile_type_names or {}
out_of_map_tile_type_names = out_of_map_tile_type_names or {}

default_transition_group_id = default_transition_group_id or 0
water_transition_group_id = water_transition_group_id or 1
out_of_map_transition_group_id = out_of_map_transition_group_id or 2

local grass_vehicle_speed_modifier = 1.6
local dirt_vehicle_speed_modifier = 1.4
local sand_vehicle_speed_modifier = 1.8
local stone_path_vehicle_speed_modifier = 1.1
local concrete_vehicle_speed_modifier = 0.8

-- doesn't matter that much, with Vaclav we thought it would be good if it is less then water but more than concrete (so above zero)
local nuclear_ground_absorptions_per_second = (function()
  local absorptions_per_second = table.deepcopy(tile_pollution.water)
  for pollutant,rate in pairs(absorptions_per_second) do
    absorptions_per_second[pollutant] = rate * 0.5
  end
  return absorptions_per_second
end)()

table.insert(water_tile_type_names, "water")
table.insert(water_tile_type_names, "deepwater")
table.insert(water_tile_type_names, "water-green")
table.insert(water_tile_type_names, "deepwater-green")
table.insert(water_tile_type_names, "water-shallow")
table.insert(water_tile_type_names, "water-mud")
table.insert(water_tile_type_names, "water-wube")
table.insert(out_of_map_tile_type_names, "out-of-map")

local landfill_build_sounds =
{
  small =
  {
    switch_vibration_data =
    {
      gain = 0.25,
      filename = "__core__/sound/landfill-small.bnvib"
    },
    variations = sound_variations("__core__/sound/landfill-small", 6, 1)
  },
  medium =
  {
    switch_vibration_data =
    {
      gain = 0.25,
      filename = "__core__/sound/landfill-medium.bnvib"
    },
    variations = sound_variations("__core__/sound/landfill-medium", 6,  0.8)
  },
  large =
  {
    switch_vibration_data =
    {
      gain = 0.25,
      filename = "__core__/sound/landfill-large.bnvib"
    },
    variations = sound_variations("__core__/sound/landfill-large", 6, 0.5)
  }
}

local concrete_tile_build_sounds =
{
  small =
  {
    switch_vibration_data =
    {
      gain = 0.25,
      filename = "__core__/sound/build-concrete-small.bnvib"
    },
    variations = sound_variations("__core__/sound/build-concrete-small", 6, 0.4)
  },
  medium =
  {
    switch_vibration_data =
    {
      gain = 0.15,
      filename = "__core__/sound/build-concrete-medium.bnvib"
    },
    variations = sound_variations("__core__/sound/build-concrete-medium", 6, 0.5)
  },
  large =
  {
    switch_vibration_data =
    {
      gain = 0.15,
      filename = "__core__/sound/build-concrete-large.bnvib"
    },
    variations = sound_variations("__core__/sound/build-concrete-large", 6, 0.5)
  }
}

local grass_sounds = sound_variations("__base__/sound/walking/grass", 10, 0.8, volume_multiplier("main-menu", 2.9))
local sand_sounds = sound_variations("__base__/sound/walking/sand", 9, 0.8, volume_multiplier("main-menu", 2.9))
local concrete_sounds = sound_variations("__base__/sound/walking/concrete", 11, 0.5)
local refined_concrete_sounds = sound_variations("__base__/sound/walking/refined-concrete", 11, 0.5)
local shallow_water_sound = sound_variations("__base__/sound/walking/shallow-water", 7, 1)
local dirt_sounds = sound_variations("__base__/sound/walking/dirt-1", 10, 0.8, volume_multiplier("main-menu", 2.9))
local tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local stone_driving_sound =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-stone.ogg", volume = 0.8,
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
  },
  fade_ticks = 6
}
local grass_driving_sound =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-grass.ogg", volume = 0.5,
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
  },
  fade_ticks = 6
}
local sand_driving_sound =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-sand.ogg", volume = 0.8,
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
  },
  fade_ticks = 6
}
local concrete_driving_sound =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-concrete.ogg", volume = 0.8,
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
  },
  fade_ticks = 6
}
local shallow_water_driving_sound =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-water-shallow.ogg", volume = 0.8,
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
  },
  fade_ticks = 6
}

function tile_variations_template(high_res_picture, high_res_transition_mask, options)
  local function main_variation(size_)
    local y_ = ((size_ == 1) and 0) or ((size_ == 2) and 128) or ((size_ == 4) and 320) or 640
    local ret =
    {
      picture = high_res_picture,
      count = (options[size_] and options[size_].weights) and #options[size_].weights or 16,
      size = size_,
      y = y_,
      line_length = (size_ == 8) and 8 or 16,
      scale = 0.5
    }

    if options[size_] then
      for k, v in pairs(options[size_]) do
        ret[k] = v
      end
    end

    return ret
  end

  local result =
  {
    main =
    {
      main_variation(1),
      main_variation(2),
      main_variation(4)
    }
  }

  if (options.max_size == 8) then
    table.insert(result.main, main_variation(8))
  end

  if options.empty_transitions then
    result.empty_transitions = true
  else
    result.transition =
    {
      spritesheet = high_res_transition_mask,
      layout =
      {
        scale = 0.5,
        count = (options and options.mask_variations) or 8,
        double_side_count = 0,
        u_transition_count = 1,
        o_transition_count = 1,
        u_transition_line_length = 1,
        o_transition_line_length = 2,
        outer_corner_x = 576,
        side_x = 1152,
        u_transition_x = 1728,
        o_transition_x = 2304,
        mask = { y_offset = 0 }
      }
    }
  end
  return result

end

function tile_variations_template_with_transitions(high_res_picture, options)
  local result = tile_variations_template(high_res_picture, high_res_picture, options)

  if result.transition then
    result.transition.layout =
    {
      scale = 0.5,
      inner_corner_x = 1216 * 2,
      outer_corner_x = 1504 * 2,
      side_x         = 1792 * 2,
      u_transition_x = 1056 * 2,
      o_transition_x = 544 * 2,
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count         = 8,
      u_transition_count = 1,
      o_transition_count = 1,
      u_transition_line_length = 4,
      o_transition_line_length = 4,
      overlay = { x_offset = 0 }
    }
  end

  return result
end

function tile_variations_template_with_transitions_and_light(spritesheet, lightmap_spritesheet, options)
  local result = tile_variations_template_with_transitions(spritesheet, options)

  result.light = tile_variations_template(lightmap_spritesheet, nil, { empty_transitions = true }).main
  if result.transition then
    result.transition.lightmap_layout = { spritesheet = lightmap_spritesheet }
  end
  return result
end

local water_shallow_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/water-shallow-out-of-map-transition-to-water.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    overlay_enabled = false
  }
}

local water_mud_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/water-shallow-out-of-map-transition-to-water.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    overlay_enabled = false
  }
}

local water_to_out_of_map_transition =
{
  to_tiles = out_of_map_tile_type_names,
  transition_group = out_of_map_transition_group_id,

  overlay_layer_group = "zero",
  apply_effect_color_to_overlay = true,

  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,

  spritesheet = "__base__/graphics/terrain/out-of-map-transition/water-out-of-map-transition-tintable.png",
  layout = tile_spritesheet_layout.transition_4_4_8_1_1,
  background_enabled = false,

  apply_waving_effect_on_masks = true,
  waving_effect_time_scale = 0.15 * 0.09,
  mask_enabled = true,
  mask_layout =
  {
    spritesheet = "__base__/graphics/terrain/masks/water-edge-transition.png",
    count = 1,
    double_side_count = 0,
    scale = 0.5,
    outer_corner_x = 64,
    side_x = 128,
    u_transition_x = 192,
    o_transition_x = 256,
    y = 0
  }
}

local water_shallow_to_out_of_map_transition  =
{
  to_tiles = out_of_map_tile_type_names,
  transition_group = out_of_map_transition_group_id,

  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,

  spritesheet = "__base__/graphics/terrain/out-of-map-transition/water-shallow-out-of-map-transition.png",
  layout = tile_spritesheet_layout.transition_4_4_8_1_1,
  overlay_enabled = false
}

local out_of_map_transition = "error"

local ground_to_out_of_map_transition =
{
  to_tiles = out_of_map_tile_type_names,
  transition_group = out_of_map_transition_group_id,

  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,

  spritesheet = "__base__/graphics/terrain/out-of-map-transition/out-of-map-transition.png",
  layout = tile_spritesheet_layout.transition_4_4_8_1_1,
  overlay_enabled = false
}

local concrete_to_out_of_map_transition =
{
  to_tiles = out_of_map_tile_type_names,
  transition_group = out_of_map_transition_group_id,

  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,

  spritesheet = "__base__/graphics/terrain/out-of-map-transition/concrete-out-of-map-transition.png",
  layout = tile_spritesheet_layout.transition_4_4_8_1_1,
}

local stone_path_to_out_of_map_transition =
{
  to_tiles = out_of_map_tile_type_names,
  transition_group = out_of_map_transition_group_id,

  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,

  spritesheet = "__base__/graphics/terrain/out-of-map-transition/stone-path-out-of-map-transition.png",
  layout = tile_spritesheet_layout.transition_4_4_8_1_1,
  mask_enabled = false
}

base_tiles_util.ground_to_out_of_map_transition = ground_to_out_of_map_transition
base_tiles_util.concrete_to_out_of_map_transition = concrete_to_out_of_map_transition
base_tiles_util.stone_path_to_out_of_map_transition = stone_path_to_out_of_map_transition

-- ~~~SAND

local sand_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    background_layer_group = "water",
    background_layer_offset = -5,
    masked_background_layer_offset = 1,
    offset_background_layer_by_tile_layer = false,

    spritesheet = "__base__/graphics/terrain/water-transitions/sand.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_8_short,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-sand-mask.png",
      --tile_height = 2,
      inner_corner_tile_height = 2,
      outer_corner_tile_height = 2,
      side_tile_height = 2,
      u_transition_tile_height = 2,
      o_transition_count = 1
    },
    background_mask_layout = tile_spritesheet_layout.simple_white_mask
  },
  ground_to_out_of_map_transition
}
local sand_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/sand-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0_only_u_tall,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-sand-to-land-mask.png",
      inner_corner_tile_height = 2,
      outer_corner_tile_height = 2,
      side_tile_height = 2,
      o_transition_count = 0
    },
    water_patch = patch_for_inner_corner_of_transition_between_transition,
  },
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/sand-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    overlay_enabled = false
  },
  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_group = "water",
    background_layer_offset = -5,
    masked_background_layer_offset = 1,
    offset_background_layer_by_tile_layer = false,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/sand-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-sand-to-out-of-map-mask.png",
      o_transition_count = 0
    },
    background_mask_layout = tile_spritesheet_layout.simple_3_3_3_1_0_three_way_edge_mask,
    draw_simple_outer_corner_over_diagonal = false,
    apply_waving_effect_on_background_mask = true,
    waving_effect_time_scale = 0.15 * 0.09,
    water_patch = patch_for_inner_corner_of_transition_between_transition
  }
}

-- ~~~GRASS

local grass_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,
    side_weights = { 1, 1, 1, 1,  0.25, 0.25, 1, 1,  1, 1, 0.125, 0.25,  1, 1, 1, 1 },

    spritesheet = "__base__/graphics/terrain/water-transitions/grass.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_8,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-grass-mask.png",
      o_transition_count = 1
    }
  },
  ground_to_out_of_map_transition
}

local grass_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/grass-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-grass-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = patch_for_inner_corner_of_transition_between_transition
  },

  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/grass-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    overlay_enabled = false
  },
  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/grass-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-grass-to-out-of-map-mask.png",
      o_transition_count = 0
    }
  }
}

-- ~~~DIRT_DRY

local dirt_out_of_map_transition =
{
  transition_group1 = default_transition_group_id,
  transition_group2 = out_of_map_transition_group_id,

  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,

  spritesheet = "__base__/graphics/terrain/out-of-map-transition/dirt-out-of-map-transition.png",
  layout = tile_spritesheet_layout.transition_3_3_3_1_0,
  overlay_enabled = false
}

local dry_dirt_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/dry-dirt.png",
    layout = tile_spritesheet_layout.transition_8_8_8_2_4,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      o_transition_count = 1
    }
  },
  ground_to_out_of_map_transition
}

local dry_dirt_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/dry-dirt-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
      o_transition_count = 0
    },

    water_patch = patch_for_inner_corner_of_transition_between_transition,
  },
  dirt_out_of_map_transition,
  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/dry-dirt-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      u_transition_count = 0,
      o_transition_count = 0
    }
  }
}
-- ~~~DIRT_DARK

local dark_dirt_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/dark-dirt.png",
    layout = tile_spritesheet_layout.transition_8_8_8_2_4,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      o_transition_count = 1
    }
  },
  ground_to_out_of_map_transition
}

local dark_dirt_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/dark-dirt-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = patch_for_inner_corner_of_transition_between_transition,
  },
  dirt_out_of_map_transition,
  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/dark-dirt-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      u_transition_count = 0,
      o_transition_count = 0
    }
  }
}

-- ~~~DIRT_LANDFILL

local landfill_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/landfill.png",
    layout = tile_spritesheet_layout.transition_8_8_8_2_4,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      o_transition_count = 1
    }
  },
  ground_to_out_of_map_transition
}

local landfill_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/landfill-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = patch_for_inner_corner_of_transition_between_transition
  },
  dirt_out_of_map_transition,
  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/landfill-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      u_transition_count = 0,
      o_transition_count = 0
    }
  }
}

-- ~~~NUCLEAR_GROUND
local nuclear_ground_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/nuclear-ground.png",
    layout = tile_spritesheet_layout.transition_8_8_8_2_4,
    background_enabled = false,

    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      o_transition_count = 1
    }
  },
  ground_to_out_of_map_transition
}

local nuclear_ground_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/nuclear-ground-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = patch_for_inner_corner_of_transition_between_transition,
  },
  dirt_out_of_map_transition,
  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/nuclear-ground-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      u_transition_count = 0,
      o_transition_count = 0
    }
  }
}

-- ~~~STONE_CONCRETE

local concrete_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/concrete.png",
    layout = tile_spritesheet_layout.transition_8_8_8_4_4,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-stone-mask.png",
      inner_corner_count = 1,
      outer_corner_count = 1,
      side_count = 1,
      u_transition_count = 1,
      o_transition_count = 1
    }
  },
  concrete_to_out_of_map_transition
}

local concrete_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/concrete-transitions.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-stone-to-land-mask.png",
      o_transition_count = 0
    }
  },
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/concrete-out-of-map-transition-b.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
  },
  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/concrete-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-stone-to-out-of-map-mask.png",
      u_transition_count = 0,
      o_transition_count = 0
    }
  }
}

-- ~~~STONE_STONE_PATH

local stone_path_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/stone-path.png",
    layout = tile_spritesheet_layout.transition_8_8_8_4_4,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-stone-mask.png",
      inner_corner_count = 1,
      outer_corner_count = 1,
      side_count = 1,
      u_transition_count = 1,
      o_transition_count = 1
    }
  },
  stone_path_to_out_of_map_transition
}

local stone_path_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/stone-path-transitions.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-stone-to-land-mask.png",
      o_transition_count = 0
    }
  },
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/stone-path-out-of-map-transition-b.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    mask_enabled = false
  },
  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/stone-path-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    mask_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-stone-to-out-of-map-mask.png",
      u_transition_count = 0,
      o_transition_count = 0
    }
  }
}

data:extend
{
  {
    name = "out-of-map",
    type = "tile",
    order = "z[other]-a[out-of-map]",
    subgroup = "special-tiles",
    collision_mask = tile_collision_masks.out_of_map(),
    layer_group = "zero",
    layer = 0,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/out-of-map.png",
          count = 1,
          size = 1
        }
      },
      empty_transitions = true
    },
    map_color = {0, 0, 0},
    absorptions_per_second = tile_pollution.out_of_map
  },
  {
    name = "deepwater",
    type = "tile",
    order = "a[water]-b[deep-water]",
    subgroup = "nauvis-tiles",
    transition_merges_with_tile = "water",
    collision_mask = tile_collision_masks.water(),
    fluid = "water",
    autoplace = {probability_expression = "water_base(-2, 200)"},
    effect = "water",
    effect_color = {0.135, 0.507, 0.583},--{ 23, 111, 129 }, -- { 30, 76, 94 }
    effect_color_secondary = { 45, 68, 25 },
    particle_tints = tile_graphics.deepwater_particle_tints,
    layer_group = "water",
    layer = 3,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater1.png",
          count = 1,
          scale = 0.5,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater2.png",
          count = 1,
          scale = 0.5,
          size = 2
        },
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater4.png",
          count = 1,
          scale = 0.5,
          size = 4
        }
      },
      empty_transitions = true
    },
    --transitions = { deepwater_out_of_map_transition },
    --transitions_between_transitions = deepwater_transitions_between_transitions,
    allowed_neighbors = { "water" },
    map_color={38, 64, 73},
    absorptions_per_second = tile_pollution.water,

    trigger_effect = tile_trigger_effects.water_trigger_effect(),

    default_cover_tile = "landfill",

    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__base__/sound/world/water/waterlap", 10, 0.4 ),
        advanced_volume_control =
        {
          fades = { fade_in = { curve_type = "S-curve", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } }
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 3
    }
  },
  {
    name = "deepwater-green",
    type = "tile",
    order = "a[water]-d[deepwater-green]",
    subgroup = "nauvis-tiles",
    transition_merges_with_tile = "water",
    collision_mask = tile_collision_masks.water(),
    fluid = "water",
    effect = "water",
    effect_color = { 45, 68, 25 },
    particle_tints = tile_graphics.green_water_particle_tints,
    layer_group = "water",
    layer = 3,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/deepwater-green/deepwater-green1.png",
          count = 1,
          scale = 0.5,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/deepwater-green/deepwater-green2.png",
          count = 1,
          scale = 0.5,
          size = 2
        },
        {
          picture = "__base__/graphics/terrain/deepwater-green/deepwater-green4.png",
          count = 1,
          scale = 0.5,
          size = 4
        }
      },
      empty_transitions = true
    },
    allowed_neighbors = { "water-green" },
    map_color={0.0941, 0.149, 0.066},
    absorptions_per_second = tile_pollution.water,

    trigger_effect = tile_trigger_effects.water_trigger_effect(),

    default_cover_tile = "landfill"
  },

  {
    name = "water",
    type = "tile",
    order = "a[water]-a[water]",
    collision_mask = tile_collision_masks.water(),
    subgroup = "nauvis-tiles",
    fluid = "water",
    autoplace = {probability_expression = "water_base(0, 100)"},
    effect = "water",
    effect_color = { 21, 147, 167 },
    effect_color_secondary = { 49, 80, 14 },
    particle_tints = tile_graphics.water_particle_tints,
    layer_group = "water",
    layer = 3,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/water/water1.png",
          count = 1,
          scale = 0.5,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/water/water2.png",
          count = 1,
          scale = 0.5,
          size = 2
        },
        {
          picture = "__base__/graphics/terrain/water/water4.png",
          count = 1,
          scale = 0.5,
          size = 4
        }
      },
      empty_transitions = true
    },
    transitions = { water_to_out_of_map_transition },
    map_color={51, 83, 95},
    absorptions_per_second = tile_pollution.water,

    trigger_effect = tile_trigger_effects.water_trigger_effect(),

    default_cover_tile = "landfill",

    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__base__/sound/world/water/waterlap", 10, 0.6 ),
        advanced_volume_control =
        {
          fades = { fade_in = { curve_type = "S-curve", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } }
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 3
    }
  },

  {
    name = "water-green",
    type = "tile",
    order = "a[water]-c[water-green]",
    subgroup = "nauvis-tiles",
    transition_merges_with_tile = "water",
    collision_mask = tile_collision_masks.water(),
    fluid = "water",
    effect = "water",
    effect_color = { 49, 80, 14 },
    particle_tints = tile_graphics.green_water_particle_tints,
    layer_group = "water",
    layer = 3,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/water-green/water-green1.png",
          count = 1,
          scale = 0.5,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/water-green/water-green2.png",
          count = 1,
          scale = 0.5,
          size = 2
        },
        {
          picture = "__base__/graphics/terrain/water-green/water-green4.png",
          count = 1,
          scale = 0.5,
          size = 4
        }
      },
      empty_transitions = true
    },
    map_color={31, 48, 18},
    absorptions_per_second = tile_pollution.water,

    trigger_effect = tile_trigger_effects.water_trigger_effect(),

    default_cover_tile = "landfill"
  },

  {
    name = "water-shallow",
    type = "tile",
    order = "a[water]-e[water-shallow]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    fluid = "water",
    walking_sound = shallow_water_sound,
    driving_sound = shallow_water_driving_sound,
    layer_group = "water",
    layer = 6,
    walking_speed_modifier = 0.8,
    effect = "water",
    effect_color = { 31 * 0.25, 114 * 0.25, 133 * 0.25, 255 * 0.125 },
    effect_color_secondary = {r = 0.031, g = 0.129, b = 0.031, a = 0.361},
    particle_tints = tile_graphics.shallow_water_particle_tints,

    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/water-shallow/water-shallow1.png",
          count = 8,
          scale = 0.5,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/water-shallow/water-shallow2.png",
          count = 8,
          scale = 0.5,
          size = 2
        },
        {
          picture = "__base__/graphics/terrain/water-shallow/water-shallow4.png",
          count = 8,
          scale = 0.5,
          size = 4
        }
      },
      transition =
      {
        overlay_layout =
        {
          inner_corner =
          {
            spritesheet = "__base__/graphics/terrain/water-shallow/water-shallow-inner-corner.png",
            count = 6,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__base__/graphics/terrain/water-shallow/water-shallow-outer-corner.png",
            count = 6,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__base__/graphics/terrain/water-shallow/water-shallow-side.png",
            count = 6,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__base__/graphics/terrain/water-shallow/water-shallow-u.png",
            count = 1,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__base__/graphics/terrain/water-shallow/water-shallow-o.png",
            count = 1,
            scale = 0.5
          }
        }
      }
    },
    transitions = { water_shallow_to_out_of_map_transition },
    transitions_between_transitions = water_shallow_transitions_between_transitions,
    -- allowed_neighbors = { "water-mud" },
    map_color={82, 98, 92},
    scorch_mark_color={82, 98, 92},
    absorptions_per_second = tile_pollution.water,

    trigger_effect = tile_trigger_effects.water_trigger_effect(),

    default_cover_tile = "landfill",

    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__base__/sound/world/water/waterlap", 10, 0.4 ),
        advanced_volume_control =
        {
          fades = { fade_in = { curve_type = "S-curve", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } }
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 6
    }
  },
  {
    name = "water-mud",
    type = "tile",
    order = "a[water]-g[water-mud]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    fluid = "water",
    -- autoplace = nil, -- set in planet-gleba-mapgen.lua
    walking_sound = shallow_water_sound,
    layer_group = "water",
    layer = 7,
    walking_speed_modifier = 0.7,
    effect = "water",
    effect_color = { 31 * 0.25, 114 * 0.25, 133 * 0.25, 255 * 0.125 },
    effect_color_secondary = {r = 0.031, g = 0.129, b = 0.031, a = 0.361},
    particle_tints = tile_graphics.mud_water_particle_tints,

    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/water-mud/water-mud1.png",
          count = 8,
          scale = 0.5,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/water-mud/water-mud2.png",
          count = 8,
          scale = 0.5,
          size = 2
        },
        {
          picture = "__base__/graphics/terrain/water-mud/water-mud4.png",
          count = 8,
          scale = 0.5,
          size = 4
        }
      },
      transition =
      {
        overlay_layout =
        {
          inner_corner =
          {
            spritesheet = "__base__/graphics/terrain/water-mud/water-mud-inner-corner.png",
            count = 6,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__base__/graphics/terrain/water-mud/water-mud-outer-corner.png",
            count = 6,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__base__/graphics/terrain/water-mud/water-mud-side.png",
            count = 6,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__base__/graphics/terrain/water-mud/water-mud-u.png",
            count = 1,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__base__/graphics/terrain/water-mud/water-mud-o.png",
            count = 1,
            scale = 0.5
          }
        }
      }
    },
    transitions = { water_shallow_to_out_of_map_transition },
    transitions_between_transitions = water_mud_transitions_between_transitions,
    -- allowed_neighbors = { "water-shallow" },
    map_color={65, 89, 90},
    scorch_mark_color={65, 89, 90},
    absorptions_per_second = tile_pollution.water,

    trigger_effect = tile_trigger_effects.water_trigger_effect(),

    default_cover_tile = "landfill"
  },
  -----------//////////////////////////////////////////////////////////////GRASS-1
  {
    name = "grass-1",
    type = "tile",
    order = "b[natural]-a[grass]-a[grass-1]",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'expression_in_range_base(-10, 0.7, 11, 11) + noise_layer_noise(19)'},
    layer = 26,
    variants = tile_variations_template(
      "__base__/graphics/terrain/grass-1.png", "__base__/graphics/terrain/masks/transition-3.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 0.91, weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 }, },
        [4] = { probability = 0.91, weights = {0.100, 0.80, 0.80, 0.100, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    subgroup = "nauvis-tiles",

    transitions = grass_transitions,
    transitions_between_transitions = grass_transitions_between_transitions,

    walking_sound = grass_sounds,
    driving_sound = grass_driving_sound,
    map_color={55, 53, 11},
    scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
    absorptions_per_second = tile_pollution.grass,
    vehicle_friction_modifier = grass_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
   -----------//////////////////////////////////////////////////////////////GRASS-2 - potato
  {
    name = "grass-2",
    type = "tile",
    order = "b[natural]-a[grass]-b[grass-2]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'expression_in_range_base(0.45, 0.45, 11, 0.8) + noise_layer_noise(20)'},
    layer = 28,
    variants = tile_variations_template(
      "__base__/graphics/terrain/grass-2.png", "__base__/graphics/terrain/masks/transition-3.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 0.91, weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 }, },
        [4] = { probability = 0.75, weights = {0.085, 0.085, 0.085, 0.075, 0.057, 0.055, 0.085, 0.075, 0.035, 0.015, 0.001, 0.025, 0.005, 0.025, 0.045, 0.045 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    factoriopedia_alternative = "grass-1",

    transitions = grass_transitions,
    transitions_between_transitions = grass_transitions_between_transitions,

    walking_sound = grass_sounds,
    driving_sound = grass_driving_sound,
    map_color={66, 57, 15},
    scorch_mark_color = {r = 0.361, g = 0.251, b = 0.170, a = 1.000},
    absorptions_per_second = tile_pollution.grass,
    vehicle_friction_modifier = grass_vehicle_speed_modifier,
    can_be_part_of_blueprint = false,

    trigger_effect = tile_trigger_effects.grass_2_trigger_effect()
  },
  -----------//////////////////////////////////////////////////////////////GRASS-3
  {
    name = "grass-3",
    type = "tile",
    order = "b[natural]-a[grass]-c[grass-3]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'expression_in_range_base(-10, 0.6, 0.65, 0.9) + noise_layer_noise(21)'},
    layer = 29,
    variants = tile_variations_template(
      "__base__/graphics/terrain/grass-3.png", "__base__/graphics/terrain/masks/transition-3.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    factoriopedia_alternative = "grass-1",

    transitions = grass_transitions,
    transitions_between_transitions = grass_transitions_between_transitions,

    walking_sound = grass_sounds,
    driving_sound = grass_driving_sound,
    map_color={65, 52, 28},
    scorch_mark_color = {r = 0.353, g = 0.244, b = 0.155, a = 1.000},
    absorptions_per_second = tile_pollution.grass,
    vehicle_friction_modifier = grass_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.grass_3_trigger_effect()
  },
-----------//////////////////////////////////////////////////////////////GRASS-4
  {
    name = "grass-4",
    type = "tile",
    order = "b[natural]-a[grass]-d[grass-4]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'expression_in_range_base(-10, 0.5, 0.55, 0.7) + noise_layer_noise(22)'},
    layer = 30,
    variants = tile_variations_template(
      "__base__/graphics/terrain/grass-4.png", "__base__/graphics/terrain/masks/transition-3.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.5, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    factoriopedia_alternative = "grass-1",

    transitions = grass_transitions,
    transitions_between_transitions = grass_transitions_between_transitions,

    walking_sound = grass_sounds,
    driving_sound = grass_driving_sound,
    map_color={59, 40, 18},
    scorch_mark_color = {r = 0.325, g = 0.242, b = 0.133, a = 1.000},
    absorptions_per_second = tile_pollution.grass,
    vehicle_friction_modifier = grass_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.grass_4_trigger_effect()
  },

-----------//////////////////////////////////////////////////////////////DRY-DIRT
  {
    name = "dry-dirt",
    type = "tile",
    order = "b[natural]-b[dirt]-a[dry-dirt]",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'expression_in_range_base(0.45, -10, 0.55, 0.35) + noise_layer_noise(13)'},
    layer = 18,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dry-dirt.png", "__base__/graphics/terrain/masks/transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    subgroup = "nauvis-tiles",

    transitions = dry_dirt_transitions,
    transitions_between_transitions = dry_dirt_transitions_between_transitions,

    walking_sound = dirt_sounds,
    map_color={94, 66, 37},
    scorch_mark_color = {r = 0.357, g = 0.249, b = 0.153, a = 1.000},
    absorptions_per_second = tile_pollution.dirt,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.dry_dirt_trigger_effect()
  },
-----------//////////////////////////////////////////////////////////////DIRT
  {
    name = "dirt-1",
    type = "tile",
    order = "b[natural]-b[dirt]-b[dirt-1]",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'max(expression_in_range_base(-10, 0.25, 0.45, 0.3),\z
                                               expression_in_range_base(0.4, -10, 0.45, 0.25)) + noise_layer_noise(6)'},
    layer = 19,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-1.png", "__base__/graphics/terrain/masks/transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    subgroup = "nauvis-tiles",

    transitions = dry_dirt_transitions,
    transitions_between_transitions = dry_dirt_transitions_between_transitions,

    walking_sound = sand_sounds,
    map_color={141, 104, 60},
    scorch_mark_color = {r = 0.541, g = 0.407, b = 0.248, a = 1.000},
    absorptions_per_second = tile_pollution.dirt,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.dirt_1_trigger_effect()
  },
-----------//////////////////////////////////////////////////////////////DIRT-2
  {
    name = "dirt-2",
    type = "tile",
    order = "b[natural]-b[dirt]-c[dirt-2]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'expression_in_range_base(-10, 0.3, 0.45, 0.35) + noise_layer_noise(7)'},
    layer = 20,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-2.png", "__base__/graphics/terrain/masks/transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    factoriopedia_alternative = "dirt-1",

    transitions = dry_dirt_transitions,
    transitions_between_transitions = dry_dirt_transitions_between_transitions,

    walking_sound = sand_sounds,
    map_color={136, 96, 59},
    scorch_mark_color = {r = 0.522, g = 0.391, b = 0.237, a = 1.000},
    absorptions_per_second = tile_pollution.dirt,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
-----------//////////////////////////////////////////////////////////////DIRT-3
  {
    name = "dirt-3",
    type = "tile",
    order = "b[natural]-b[dirt]-d[dirt-3]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'expression_in_range_base(-10, 0.35, 0.55, 0.4) + noise_layer_noise(8)'},
    layer = 21,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-3.png", "__base__/graphics/terrain/masks/transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    factoriopedia_alternative = "dirt-1",

    transitions = dry_dirt_transitions,
    transitions_between_transitions = dry_dirt_transitions_between_transitions,

    walking_sound = sand_sounds,
    map_color={133, 92, 53},
    scorch_mark_color = {r = 0.486, g = 0.346, b = 0.210, a = 1.000},
    absorptions_per_second = tile_pollution.dirt,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.dirt_3_trigger_effect()
  },
-----------//////////////////////////////////////////////////////////////DIRT-4
  {
    name = "dirt-4",
    type = "tile",
    order = "b[natural]-b[dirt]-e[dirt-4]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'max(expression_in_range_base(0.55, -10, 0.6, 0.35),\z
                                               expression_in_range_base(0.6, 0.3, 11, 0.35)) + noise_layer_noise(9)'},
    layer = 22,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-4.png", "__base__/graphics/terrain/masks/transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    factoriopedia_alternative = "dirt-1",

    transitions = dark_dirt_transitions,
    transitions_between_transitions = dark_dirt_transitions_between_transitions,

    walking_sound = dirt_sounds,
    map_color={103, 72, 43},
    scorch_mark_color = {r = 0.420, g = 0.304, b = 0.191, a = 1.000},
    absorptions_per_second = tile_pollution.dirt,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.dirt_4_trigger_effect()
  },
-----------//////////////////////////////////////////////////////////////DIRT-5
  {
    name = "dirt-5",
    type = "tile",
    order = "b[natural]-b[dirt]-f[dirt-5]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'expression_in_range_base(-10, 0.4, 0.55, 0.45) + noise_layer_noise(10)'},
    layer = 23,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-5.png", "__base__/graphics/terrain/masks/transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    factoriopedia_alternative = "dirt-1",

    transitions = dark_dirt_transitions,
    transitions_between_transitions = dark_dirt_transitions_between_transitions,

    walking_sound = dirt_sounds,
    map_color={91, 63, 38},
    scorch_mark_color = {r = 0.412, g = 0.298, b = 0.197, a = 1.000},
    absorptions_per_second = tile_pollution.dirt,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.dirt_5_trigger_effect()
  },
-----------//////////////////////////////////////////////////////////////DIRT-6
  {
    name = "dirt-6",
    type = "tile",
    order = "b[natural]-b[dirt]-g[dirt-6]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'expression_in_range_base(-10, 0.45, 0.55, 0.5) + noise_layer_noise(11)'},
    layer = 24,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-6.png", "__base__/graphics/terrain/masks/transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    factoriopedia_alternative = "dirt-1",

    transitions = dark_dirt_transitions,
    transitions_between_transitions = dark_dirt_transitions_between_transitions,

    walking_sound = dirt_sounds,
    map_color={80, 55, 31},
    scorch_mark_color = {r = 0.435, g = 0.310, b = 0.188, a = 1.000},
    absorptions_per_second = tile_pollution.dirt,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.dirt_6_trigger_effect()
  },
-----------//////////////////////////////////////////////////////////////DIRT-7
  {
    name = "dirt-7",
    type = "tile",
    order = "b[natural]-b[dirt]-h[dirt-7]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'expression_in_range_base(-10, 0.5, 0.55, 0.55) + noise_layer_noise(12)'},
    layer = 25,
    variants = tile_variations_template(
      "__base__/graphics/terrain/dirt-7.png", "__base__/graphics/terrain/masks/transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    factoriopedia_alternative = "dirt-1",

    transitions = dark_dirt_transitions,
    transitions_between_transitions = dark_dirt_transitions_between_transitions,

    walking_sound = dirt_sounds,
    map_color={80, 54, 28},
    scorch_mark_color = {r = 0.380, g = 0.269, b = 0.161, a = 1.000},
    absorptions_per_second = tile_pollution.dirt,
    vehicle_friction_modifier = dirt_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.dirt_7_trigger_effect()
  },
-----------//////////////////////////////////////////////////////////////SAND-1
  {
    name = "sand-1",
    type = "tile",
    order = "b[natural]-c[sand]-a[sand-1]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'max(expression_in_range_base(-10, -10, 0.25, 0.15),\z
                                               expression_in_range(5, inf, elevation, aux, -1.5, 0.5, 1.5, 1)) +\z
                                           noise_layer_noise(36)'},
    layer = 8,

    variants = tile_variations_template(
      "__base__/graphics/terrain/sand-1.png", "__base__/graphics/terrain/masks/transition-4.png",
      {
        max_size = 8,
        [2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020} },
        [4] = { probability = 0.20, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
        [8] = { probability = 0.10, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = sand_transitions,
    transitions_between_transitions = sand_transitions_between_transitions,

    walking_sound = sand_sounds,
    driving_sound = sand_driving_sound,
    map_color={138, 103, 58},
    scorch_mark_color = {r = 0.588, g = 0.451, b = 0.272, a = 1.000},
    absorptions_per_second = tile_pollution.sand,
    vehicle_friction_modifier = sand_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.sand_trigger_effect(),

  },
-----------//////////////////////////////////////////////////////////////SAND-2
  {
    name = "sand-2",
    type = "tile",
    order = "b[natural]-c[sand]-b[sand-2]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'max(expression_in_range_base(-10, 0.15, 0.3, 0.2),\z
                                               expression_in_range_base(0.25, -10, 0.3, 0.15)) + noise_layer_noise(37)'},
    layer = 9,

    variants = tile_variations_template(
      "__base__/graphics/terrain/sand-2.png", "__base__/graphics/terrain/masks/transition-4.png",
      {
        max_size = 8,
        [2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020} },
        [4] = { probability = 0.20, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
        [8] = { probability = 0.10, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    factoriopedia_alternative = "sand-1",

    transitions = sand_transitions,
    transitions_between_transitions = sand_transitions_between_transitions,

    walking_sound = sand_sounds,
    driving_sound = sand_driving_sound,
    map_color={128, 93, 52},
    scorch_mark_color = {r = 0.600, g = 0.440, b = 0.252, a = 1.000},
    absorptions_per_second = tile_pollution.sand,
    vehicle_friction_modifier = sand_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
-----------//////////////////////////////////////////////////////////////SAND-3
  {
    name = "sand-3",
    type = "tile",
    order = "b[natural]-c[sand]-c[sand-3]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'max(expression_in_range_base(-10, 0.2, 0.4, 0.25),\z
                                               expression_in_range_base(0.3, -10, 0.4, 0.2)) + noise_layer_noise(38)'},
    layer = 10,
    variants = tile_variations_template(
      "__base__/graphics/terrain/sand-3.png", "__base__/graphics/terrain/masks/transition-4.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020}, },
        [4] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020}, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    factoriopedia_alternative = "sand-1",

    transitions = sand_transitions,
    transitions_between_transitions = sand_transitions_between_transitions,

    walking_sound = sand_sounds,
    driving_sound = sand_driving_sound,
    map_color={115, 83, 47},
    scorch_mark_color = {r = 0.620, g = 0.472, b = 0.279, a = 1.000},
    absorptions_per_second = tile_pollution.sand,
    vehicle_friction_modifier = sand_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
-----------//////////////////////////////////////////////////////////////RED-DESERT-0 //potato-gate//
  {
    name = "red-desert-0",
    type = "tile",
    order = "b[natural]-d[red-desert]-a[red-desert-0]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'expression_in_range_base(0.55, 0.35, 11, 0.5) + noise_layer_noise(30)'},
    layer = 31,
    variants = tile_variations_template(
      "__base__/graphics/terrain/red-desert-0.png", "__base__/graphics/terrain/masks/transition-3.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        -- [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = grass_transitions,
    transitions_between_transitions = grass_transitions_between_transitions,
    --transitions = sand_transitions,
    --transitions_between_transitions = sand_transitions_between_transitions,

    walking_sound = sand_sounds,
    map_color={103, 70, 32},
    scorch_mark_color = {r = 0.447, g = 0.309, b = 0.174, a = 1.000},
    absorptions_per_second = tile_pollution.red_desert,
    vehicle_friction_modifier = grass_vehicle_speed_modifier,
    can_be_part_of_blueprint = false,

    trigger_effect = tile_trigger_effects.red_desert_0_trigger_effect()
  },
-----------//////////////////////////////////////////////////////////////RED-DESERT-1
  {
    name = "red-desert-1",
    type = "tile",
    order = "b[natural]-d[red-desert]-b[red-desert-1]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'max(expression_in_range_base(0.6, -10, 0.7, 0.3),\z
                                               expression_in_range_base(0.7, 0.25, 11, 0.3)) + noise_layer_noise(31)'},
    layer = 14,
    variants = tile_variations_template(
      "__base__/graphics/terrain/red-desert-1.png", "__base__/graphics/terrain/masks/transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        -- [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    factoriopedia_alternative = "red-desert-0",

    transitions = dry_dirt_transitions,
    transitions_between_transitions = dry_dirt_transitions_between_transitions,

    walking_sound = sand_sounds,
    map_color={116, 81, 39},
    scorch_mark_color = {r = 0.514, g = 0.371, b = 0.203, a = 1.000},
    absorptions_per_second = tile_pollution.red_desert,
    vehicle_friction_modifier = grass_vehicle_speed_modifier,
    can_be_part_of_blueprint = false,

    trigger_effect = tile_trigger_effects.red_desert_1_trigger_effect()
  },
-----------//////////////////////////////////////////////////////////////RED-DESERT-2
  {
    name = "red-desert-2",
    type = "tile",
    order = "b[natural]-d[red-desert]-c[red-desert-2]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'max(expression_in_range_base(0.7, -10, 0.8, 0.25),\z
                                               expression_in_range_base(0.8, 0.2, 11, 0.25)) + noise_layer_noise(32)'},
    layer = 15,
    variants = tile_variations_template(
      "__base__/graphics/terrain/red-desert-2.png", "__base__/graphics/terrain/masks/transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    factoriopedia_alternative = "red-desert-0",

    transitions = dry_dirt_transitions,
    transitions_between_transitions = dry_dirt_transitions_between_transitions,

    walking_sound = sand_sounds,
    map_color={116, 84, 43},
    scorch_mark_color = {r = 0.553, g = 0.403, b = 0.243, a = 1.000},
    absorptions_per_second = tile_pollution.red_desert,
    vehicle_friction_modifier = grass_vehicle_speed_modifier,
    can_be_part_of_blueprint = false,

    trigger_effect = tile_trigger_effects.red_desert_2_trigger_effect()
  },
-----------//////////////////////////////////////////////////////////////RED-DESERT-3
  {
    name = "red-desert-3",
    type = "tile",
    order = "b[natural]-d[red-desert]-d[red-desert-3]",
    subgroup = "nauvis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = 'expression_in_range_base(0.8, -10, 11, 0.2) + noise_layer_noise(33)'},
    layer = 16,
    variants = tile_variations_template(
      "__base__/graphics/terrain/red-desert-3.png", "__base__/graphics/terrain/masks/transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
        [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    factoriopedia_alternative = "red-desert-0",

    transitions = dry_dirt_transitions,
    transitions_between_transitions = dry_dirt_transitions_between_transitions,

    walking_sound = sand_sounds,
    map_color={128, 93, 52},
    scorch_mark_color = {r = 0.604, g = 0.447, b = 0.263, a = 1.000},
    absorptions_per_second = tile_pollution.red_desert,
    vehicle_friction_modifier = grass_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.red_desert_3_trigger_effect()
  },
  -----------//////////////////////////////////////////////////////////////NUCLEAR-GROUND
  {
    name = "nuclear-ground",
    type = "tile",
    order = "d[destruction]-a[nuclear]-a[nuclear-ground]",
    subgroup = "special-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer = 33,
    variants =
    {
      transition = tile_graphics.generic_masked_tile_transitions1,
      material_background =
      {
        picture = "__base__/graphics/terrain/nuclear-ground.png",
        count = 4,
        scale = 0.5
      }
    },

    transitions = nuclear_ground_transitions,
    transitions_between_transitions = nuclear_ground_transitions_between_transitions,

    walking_sound = sand_sounds,
    map_color={48, 40, 35},
    absorptions_per_second = nuclear_ground_absorptions_per_second,
    vehicle_friction_modifier = grass_vehicle_speed_modifier
  },
  -----------//////////////////////////////////////////////////////////////STONE-PATH
  {
    type = "tile",
    name = "stone-path",
    order = "a[artificial]-a[tier-1]-a[stone-path]",
    subgroup = "artificial-tiles",
    needs_correction = false,
    minable = {mining_time = 0.1, result = "stone-brick"},
    mined_sound = sounds.deconstruct_bricks(0.8),
    collision_mask = tile_collision_masks.ground(),
    walking_speed_modifier = 1.3,
    layer = 11,
    layer_group = "ground-artificial",
    decorative_removal_probability = 0.15,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/stone-path/stone-path-1.png",
          count = 16,
          size = 1,
          scale = 0.5
        },
        {
          picture = "__base__/graphics/terrain/stone-path/stone-path-2.png",
          count = 16,
          size = 2,
          probability = 0.39,
          scale = 0.5
        },
        {
          picture = "__base__/graphics/terrain/stone-path/stone-path-4.png",
          count = 16,
          size = 4,
          probability = 1,
          scale = 0.5
        }
      },
      transition =
      {
        overlay_layout =
        {
          inner_corner =
          {
            spritesheet = "__base__/graphics/terrain/stone-path/stone-path-inner-corner.png",
            count = 16,
            tile_height = 2,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__base__/graphics/terrain/stone-path/stone-path-outer-corner.png",
            count = 8,
            tile_height = 2,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__base__/graphics/terrain/stone-path/stone-path-side.png",
            count = 16,
            tile_height = 2,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__base__/graphics/terrain/stone-path/stone-path-u.png",
            count = 8,
            tile_height = 2,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__base__/graphics/terrain/stone-path/stone-path-o.png",
            count = 4,
            scale = 0.5
          }
        }
      }
    },
    transitions = stone_path_transitions,
    transitions_between_transitions = stone_path_transitions_between_transitions,

    walking_sound = concrete_sounds,
    driving_sound = stone_driving_sound,
    build_sound = concrete_tile_build_sounds,
    map_color={86, 82, 74},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000},
    vehicle_friction_modifier = stone_path_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.stone_path_trigger_effect()
  },
  {
    type = "tile",
    name = "lab-dark-1",
    order = "z[other]-b[lab]-a[lab-dark-1]",
    subgroup = "special-tiles",
    hidden = true,
    collision_mask = tile_collision_masks.ground(),
    layer = 25,
    layer_group = "ground-artificial",
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/lab-tiles/lab-dark-1.png",
          count = 1,
          size = 1
        }
      },
      empty_transitions = true
    },
    walking_sound = concrete_sounds,
    driving_sound = concrete_driving_sound,
    map_color={49, 49, 49},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000},

    trigger_effect = tile_trigger_effects.lab_tile_dark_1_trigger_effect()
  },
  {
    type = "tile",
    name = "lab-dark-2",
    order = "z[other]-b[lab]-b[lab-dark-2]",
    subgroup = "special-tiles",
    hidden = true,
    collision_mask = tile_collision_masks.ground(),
    layer = 25,
    layer_group = "ground-artificial",
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/lab-tiles/lab-dark-2.png",
          count = 1,
          size = 1
        }
      },
      empty_transitions = true
    },
    walking_sound = concrete_sounds,
    driving_sound = concrete_driving_sound,
    map_color={0, 0, 0},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000},

    trigger_effect = tile_trigger_effects.lab_tile_dark_2_trigger_effect()
  },
  {
    type = "tile",
    name = "lab-white",
    order = "z[other]-b[lab]-c[lab-white]",
    subgroup = "special-tiles",
    hidden = true,
    collision_mask = tile_collision_masks.ground(),
    layer = 70,
    layer_group = "ground-artificial",
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/lab-tiles/lab-white.png",
          count = 1,
          size = 1
        }
      },
      empty_transitions = true
    },
    walking_sound = concrete_sounds,
    driving_sound = concrete_driving_sound,
    map_color={1, 1, 1},
    scorch_mark_color = {r = 1.000, g = 1.000, b = 1.000, a = 1.000},

    trigger_effect = tile_trigger_effects.lab_tile_white_trigger_effect()
  },
  {
    type = "tile",
    name = "tutorial-grid",
    order = "z[other]-c[tutorial]-a[tutorial-grid]",
    subgroup = "special-tiles",
    hidden = true,
    collision_mask = tile_collision_masks.ground(),
    layer = 5,
    layer_group = "ground-artificial",
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/tutorial-grid/tutorial-grid1.png",
          count = 16,
          scale = 0.5,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/tutorial-grid/tutorial-grid2.png",
          count = 16,
          scale = 0.5,
          size = 2
        }
      },
      transition =
      {
        overlay_layout =
        {
          inner_corner =
          {
            spritesheet = "__base__/graphics/terrain/tutorial-grid/tutorial-grid-inner-corner.png",
            count = 4,
            tile_height = 2,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__base__/graphics/terrain/tutorial-grid/tutorial-grid-outer-corner.png",
            count = 4,
            tile_height = 2,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__base__/graphics/terrain/tutorial-grid/tutorial-grid-side.png",
            count = 16,
            tile_height = 2,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__base__/graphics/terrain/tutorial-grid/tutorial-grid-u.png",
            count = 2,
            tile_height = 2,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__base__/graphics/terrain/tutorial-grid/tutorial-grid-o.png",
            count = 2,
            scale = 0.5
          }
        }
      }
    },
    walking_sound = concrete_sounds,
    map_color={122, 122, 122},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000},

    trigger_effect = tile_trigger_effects.tutorial_grid_trigger_effect()
  },

  {
    type = "tile",
    name = "concrete",
    order = "a[artificial]-b[tier-2]-a[concrete]",
    subgroup = "artificial-tiles",
    needs_correction = false,
    minable = {mining_time = 0.1, result = "concrete"},
    mined_sound = sounds.deconstruct_bricks(0.8),
    collision_mask = tile_collision_masks.ground(),
    walking_speed_modifier = 1.4,
    layer = 13,
    layer_group = "ground-artificial",
    transition_overlay_layer_offset = 2, -- need to render border overlay on top of hazard-concrete
    decorative_removal_probability = 0.25,
    variants =
    {
      transition =
      {
        overlay_layout =
        {
          inner_corner =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-inner-corner.png",
            count = 16,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-outer-corner.png",
            count = 8,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-side.png",
            count = 16,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-u.png",
            count = 8,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-o.png",
            count = 4,
            scale = 0.5
          }
        },
        mask_layout =
        {
          inner_corner =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-inner-corner-mask.png",
            count = 16,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
            count = 8,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-side-mask.png",
            count = 16,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-u-mask.png",
            count = 8,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-o-mask.png",
            count = 4,
            scale = 0.5
          }
        }
      },

      material_background =
      {
        picture = "__base__/graphics/terrain/concrete/concrete.png",
        count = 8,
        scale = 0.5
      }
    },

    transitions = concrete_transitions,
    transitions_between_transitions = concrete_transitions_between_transitions,

    walking_sound = concrete_sounds,
    driving_sound = concrete_driving_sound,
    build_sound = concrete_tile_build_sounds,
    map_color={63, 61, 59},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000},
    vehicle_friction_modifier = concrete_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.concrete_trigger_effect()
  },
  {
    type = "tile",
    name = "hazard-concrete-left",
    order = "a[artificial]-b[tier-2]-b[hazard-concrete-left]",
    subgroup = "artificial-tiles",
    needs_correction = false,
    next_direction = "hazard-concrete-right",
    transition_merges_with_tile = "concrete",
    minable = {mining_time = 0.1, result = "hazard-concrete"},
    mined_sound = sounds.deconstruct_bricks(0.8),
    collision_mask = tile_collision_masks.ground(),
    walking_speed_modifier = 1.4,
    layer = 15,
    layer_group = "ground-artificial",
    decorative_removal_probability = 0.25,
    placeable_by = {item = "hazard-concrete", count = 1},
    variants =
    {
      transition = tile_graphics.generic_texture_on_concrete_transition,

      material_background =
      {
        picture = "__base__/graphics/terrain/hazard-concrete-left/hazard-concrete-left.png",
        count = 8,
        scale = 0.5
      }
    },
    walking_sound = concrete_sounds,
    driving_sound = concrete_driving_sound,
    build_sound = concrete_tile_build_sounds,
    map_color={176, 142, 39},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000},
    vehicle_friction_modifier = concrete_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.hazard_concrete_left_trigger_effect(),

  },
  {
    type = "tile",
    name = "hazard-concrete-right",
    order = "a[artificial]-b[tier-2]-c[hazard-concrete-right]",
    subgroup = "artificial-tiles",
    needs_correction = false,
    next_direction = "hazard-concrete-left",
    transition_merges_with_tile = "concrete",
    minable = {mining_time = 0.1, result = "hazard-concrete"},
    mined_sound = sounds.deconstruct_bricks(0.8),
    collision_mask = tile_collision_masks.ground(),
    walking_speed_modifier = 1.4,
    layer = 15,
    layer_group = "ground-artificial",
    decorative_removal_probability = 0.25,
    placeable_by = {item = "hazard-concrete", count = 1},
    variants =
    {
      transition = tile_graphics.generic_texture_on_concrete_transition,

      material_background =
      {
        picture = "__base__/graphics/terrain/hazard-concrete-right/hazard-concrete-right.png",
        count = 8,
        scale = 0.5
      }
    },
    walking_sound = concrete_sounds,
    driving_sound = concrete_driving_sound,
    build_sound = concrete_tile_build_sounds,
    map_color={176, 142, 39},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000},
    vehicle_friction_modifier = concrete_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.hazard_concrete_right_trigger_effect()
  },

  {
    type = "tile",
    name = "refined-concrete",
    order = "a[artificial]-c[tier-3]-a[refined-concrete]",
    subgroup = "artificial-tiles",
    needs_correction = false,
    minable = {mining_time = 0.1, result = "refined-concrete"},
    mined_sound = sounds.deconstruct_bricks(0.8),
    collision_mask = tile_collision_masks.ground(),
    walking_speed_modifier = 1.5,
    layer = 17,
    layer_group = "ground-artificial",
    transition_overlay_layer_offset = 2, -- need to render border overlay on top of hazard-concrete
    decorative_removal_probability = 0.25,
    variants =
    {
      transition =
      {
        overlay_layout =
        {
          inner_corner =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-inner-corner.png",
            count = 16,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-outer-corner.png",
            count = 8,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-side.png",
            count = 16,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-u.png",
            count = 8,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-o.png",
            count = 4,
            scale = 0.5
          }
        },
        mask_layout =
        {
          inner_corner =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-inner-corner-mask.png",
            count = 16,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
            count = 8,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-side-mask.png",
            count = 16,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-u-mask.png",
            count = 8,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-o-mask.png",
            count = 4,
            scale = 0.5
          }
        }
      },

      material_background =
      {
        picture = "__base__/graphics/terrain/concrete/refined-concrete.png",
        count = 8,
        scale = 0.5
      }
    },

    transitions = concrete_transitions,
    transitions_between_transitions = concrete_transitions_between_transitions,

    walking_sound = refined_concrete_sounds,
    driving_sound = concrete_driving_sound,
    build_sound = concrete_tile_build_sounds,

    map_color={49, 48, 45},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000},
    vehicle_friction_modifier = concrete_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.concrete_trigger_effect()
  },
  {
    type = "tile",
    name = "refined-hazard-concrete-left",
    order = "a[artificial]-c[tier-3]-b[refined-hazard-concrete-left]",
    subgroup = "artificial-tiles",
    needs_correction = false,
    next_direction = "refined-hazard-concrete-right",
    transition_merges_with_tile = "refined-concrete",
    minable = {mining_time = 0.1, result = "refined-hazard-concrete"},
    mined_sound = sounds.deconstruct_bricks(0.8),
    collision_mask = tile_collision_masks.ground(),
    walking_speed_modifier = 1.5,
    layer = 19,
    layer_group = "ground-artificial",
    decorative_removal_probability = 0.25,
    placeable_by = {item = "refined-hazard-concrete", count = 1},
    variants =
    {
      transition = tile_graphics.generic_texture_on_concrete_transition,

      material_background =
      {
        picture = "__base__/graphics/terrain/hazard-concrete-left/refined-hazard-concrete-left.png",
        count = 8,
        scale = 0.5
      }
    },
    walking_sound = refined_concrete_sounds,
    driving_sound = concrete_driving_sound,
    build_sound = concrete_tile_build_sounds,
    map_color={116, 94, 26},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000},
    vehicle_friction_modifier = concrete_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.hazard_concrete_left_trigger_effect()
  },
  {
    type = "tile",
    name = "refined-hazard-concrete-right",
    order = "a[artificial]-c[tier-3]-c[refined-hazard-concrete-right]",
    subgroup = "artificial-tiles",
    needs_correction = false,
    next_direction = "refined-hazard-concrete-left",
    transition_merges_with_tile = "refined-concrete",
    minable = {mining_time = 0.1, result = "refined-hazard-concrete"},
    mined_sound = sounds.deconstruct_bricks(0.8),
    collision_mask = tile_collision_masks.ground(),
    walking_speed_modifier = 1.5,
    layer = 19,
    layer_group = "ground-artificial",
    decorative_removal_probability = 0.25,
    placeable_by = {item = "refined-hazard-concrete", count = 1},
    variants =
    {
      transition = tile_graphics.generic_texture_on_concrete_transition,

      material_background =
      {
        picture = "__base__/graphics/terrain/hazard-concrete-right/refined-hazard-concrete-right.png",
        count = 8,
        scale = 0.5
      }
    },
    walking_sound = refined_concrete_sounds,
    driving_sound = concrete_driving_sound,
    build_sound = concrete_tile_build_sounds,
    map_color={116, 94, 26},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000},
    vehicle_friction_modifier = concrete_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.hazard_concrete_right_trigger_effect()
  },
  {
    type = "tile",
    name = "landfill",
    order = "a[artificial]-d[utility]-a[landfill]",
    subgroup = "artificial-tiles",
    minable = {mining_time = 0.5, result = "landfill"},
    mined_sound = sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = 60,
    -- layer_group = "ground-artificial" -- should landfill be in the ground-artifical group?

    transitions = landfill_transitions,
    transitions_between_transitions = landfill_transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    variants =
    {
      transition = tile_graphics.generic_masked_tile_transitions1,

      material_background =
      {
        picture = "__base__/graphics/terrain/landfill.png",
        count = 8,
        scale = 0.5
      }
    },

    walking_sound = dirt_sounds,
    build_sound = landfill_build_sounds,
    map_color={57, 39, 26},
    scorch_mark_color = {r = 0.329, g = 0.242, b = 0.177, a = 1.000}
  },
}

data:extend(
{
  {
    type = "tile-effect",
    name = "water",
    shader = "water",
    water =
    {
      textures =
      {{
        filename = "__base__/graphics/terrain/effects/water-noise.png",
        width = 512,
        height = 512
      }},
      specular_lightness = { 1, 1, 1 },
      foam_color = { 230, 255, 252 },
      foam_color_multiplier = 2.470,

      animation_speed = 0.07,
      animation_scale = { 0.006, 0.006 },

      dark_threshold = { 0.307, 0.289 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.35, 0.322 },
      tick_scale = 0.09,

      near_zoom = 2
    }
  }
})

--Copied from utility constants, but we don't want all of them, so we comment them out. Also tinting the concrete is a bit different, so we tweak some...
local colors =
{
  { name = "red"    , player_color = { r = 0.815, g = 0.024, b = 0.0  , a = 0.5 }, chat_color = {1.000, 0.266, 0.241} },
  { name = "green"  , player_color = { r = 0.093, g = 0.768, b = 0.172, a = 0.5 }, chat_color = {0.173, 0.824, 0.250} },
  { name = "blue"   , player_color = { r = 0.155, g = 0.540, b = 0.898, a = 0.5 }, chat_color = {0.343, 0.683, 1.000} },
  { name = "orange" , player_color = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 }, chat_color = {1.000, 0.630, 0.259} },
  { name = "yellow" , player_color = { r = 0.835, g = 0.666, b = 0.077, a = 0.5 }, chat_color = {1.000, 0.828, 0.231} },
  { name = "pink"   , player_color = { r = 0.929, g = 0.386, b = 0.514, a = 0.5 }, chat_color = {1.000, 0.720, 0.833} },
  { name = "purple" , player_color = { r = 0.485, g = 0.111, b = 0.659, a = 0.5 }, chat_color = {0.821, 0.440, 0.998} },
  { name = "black"  , player_color = { r = 0.1  , g = 0.1  , b = 0.1,   a = 0.5 }, chat_color = {0.5, 0.5, 0.5} },
  { name = "brown"  , player_color = { r = 0.300, g = 0.117, b = 0.0,   a = 0.5 }, chat_color = {0.757, 0.522, 0.371} },
  { name = "cyan"   , player_color = { r = 0.275, g = 0.755, b = 0.712, a = 0.5 }, chat_color = {0.335, 0.918, 0.866} },
  { name = "acid"   , player_color = { r = 0.559, g = 0.761, b = 0.157, a = 0.5 }, chat_color = {0.708, 0.996, 0.134} }
}

local concrete = data.raw.tile["refined-concrete"]

for k, color in pairs (colors) do
  local new = util.copy(concrete)
  new.name = color.name.."-"..new.name
  new.localised_name = {"", {"color."..color.name}, " ", {"tile-name."..concrete.name}}
  new.hidden = true
  new.tint = color.chat_color
  new.order = "a[color-concrete]-"..color.name
  new.subgroup = "special-tiles"
  new.layer = concrete.layer + 10 + k
  new.map_color = color.player_color
  new.minable = nil
  -- reference original transition tables so that they keep referencing global water_tile_type_names
  new.transitions = concrete.transitions
  new.transitions_between_transitions = concrete.transitions_between_transitions

  data:extend{new}
end

--[[
-- FOR DEBUGGING PURPOSES

for k, v in pairs(data.raw["tile"]) do
  data:extend
  {
    {
      type = "explosion",
      name = v.name .. "-explosion",
      icon = "__core__/graphics/icons/category/tiles-editor.png",
      icon_size = 128,
      flags = {"not-on-map"},
      subgroup = "ground-explosions",
      order = "a-s-a",
      height = 0,
      animations = util.empty_sprite(),--explosion_animations.small_explosion(),
      light = { intensity = 1, size = 20 },
      smoke = "smoke-fast",
      smoke_count = 2,
      smoke_slow_down_factor = 1,
      sound = nil, --explosion_sounds.small(0.75),
      created_effect = { type = "direct", action_delivery = { type = "instant", target_effects = v.trigger_effect } }
    }
  }
end
--]]

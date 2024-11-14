local tile_trigger_effects = require("prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local snow_sounds = sound_variations("__space-age__/sound/walking/snow", 10, 0.8, volume_multiplier("main-menu", 2.9))
local icy_snow_sounds = sound_variations("__space-age__/sound/walking/icy-snow", 10, 0.8, volume_multiplier("main-menu", 2.9))
local ice_sounds = sound_variations("__space-age__/sound/walking/ice", 10, 0.8, volume_multiplier("main-menu", 2.9))
local smooth_ice_sounds = sound_variations("__space-age__/sound/walking/smooth-ice", 9, 0.8)
local frozen_concrete_sounds = sound_variations("__space-age__/sound/walking/frozen-concrete", 11, 0.8)
local snow_driving_sound =
{
  sound =
    {
      filename = "__space-age__/sound/driving/vehicle-surface-snow.ogg", volume = 0.8,
      advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}}
    },
    fade_ticks = 6,
}
local ice_driving_sound =
{
  sound =
    {
      filename = "__space-age__/sound/driving/vehicle-surface-ice.ogg", volume = 0.5,
      advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}}
    },
    fade_ticks = 6
}

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local patch_for_inner_corner_of_transition_between_transition = tile_graphics.patch_for_inner_corner_of_transition_between_transition

local aquilo_tile_offset_frozen = 50
local aquilo_tile_offset_thawed = 60

local smooth_ice_vehicle_speed_modifier = 1
local ice_vehicle_speed_modifier = 1.4
local snow_vehicle_speed_modifier = 1.8

local function lerp_color_no_alpha(a, b, amount)
  return
  {
    a[1] + amount * (b[1] - a[1]),
    a[2] + amount * (b[2] - a[2]),
    a[3] + amount * (b[3] - a[3])
  }
end

local snow_map_color_low = {156, 166, 181}
local snow_map_color_high = {190, 194, 197}

local ice_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/ice-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = {
      filename = "__space-age__/graphics/terrain/water-transitions/ice-patch.png",
      scale = 0.5,
      width = 64,
      height = 64
    }
  },
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/dirt-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    overlay_enabled = false
  },
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

local ice_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/ice-2.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = lava_tile_type_names,
    transition_group = lava_transition_group_id,
    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone.png",
    lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = {"out-of-map","empty-space","oil-ocean-shallow"},
    transition_group = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_4_4_8_1_1,
    overlay_enabled = false
  }
}

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

local function material_background(picture, count)
  return
  {
    transition = tile_graphics.generic_masked_tile_transitions1,
    material_background =
    {
      picture = picture,
      count = count,
      scale = 0.5
    }
  }
end

local ammoniacal_ocean = table.deepcopy(data.raw.tile["water"])
ammoniacal_ocean.name = "ammoniacal-ocean"
ammoniacal_ocean.order = "a[aquilo-water]-a[ammoniacal-ocean]"
ammoniacal_ocean.subgroup = "aquilo-tiles"
ammoniacal_ocean.fluid = "ammoniacal-solution"
ammoniacal_ocean.collision_mask = tile_collision_masks.ammoniacal_ocean()
--ammoniacal_ocean.effect_color = {15, 30, 40}
--ammoniacal_ocean.effect_color_secondary = { 5, 40, 65 }
--ammoniacal_ocean.map_color={5, 15, 25 }
ammoniacal_ocean.effect_color = {23, 21, 49}
ammoniacal_ocean.effect_color_secondary = { 15, 30, 65 }
ammoniacal_ocean.map_color={15, 13, 25 }
ammoniacal_ocean.default_cover_tile = "ice-platform"
ammoniacal_ocean.autoplace = {probability_expression = "ammoniacal_ocean"}

local ammoniacal_ocean_2 = table.deepcopy(data.raw.tile["water"])
ammoniacal_ocean_2.name = "ammoniacal-ocean-2"
ammoniacal_ocean_2.order = "a[aquilo-water]-b[ammoniacal-ocean-2]"
ammoniacal_ocean_2.subgroup = "aquilo-tiles"
ammoniacal_ocean_2.fluid = "ammoniacal-solution"
ammoniacal_ocean_2.collision_mask = tile_collision_masks.ammoniacal_ocean()
--ammoniacal_ocean_2.effect_color = {20, 32, 50}
--ammoniacal_ocean_2.effect_color_secondary = { 10, 42, 75 }
--ammoniacal_ocean_2.map_color={10, 17, 35 }
ammoniacal_ocean_2.effect_color = {26, 26, 57}
ammoniacal_ocean_2.effect_color_secondary = { 20, 28, 65 }
ammoniacal_ocean_2.map_color={17, 15, 30 }
ammoniacal_ocean_2.default_cover_tile = "ice-platform"
ammoniacal_ocean_2.autoplace = {probability_expression = "ammoniacal_ocean_2"}



data:extend({
  ammoniacal_ocean,
  ammoniacal_ocean_2,
  {
    type = "tile",
    name = "snow-flat",
    order = "b[natural]-i[ice]-a[snow]",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "snow_flat"},
    layer = aquilo_tile_offset_frozen + 2,
    variants = tile_variations_template(
      "__space-age__/graphics/terrain/aquilo/snow-flat.png", "__base__/graphics/terrain/masks/transition-4.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    subgroup = "aquilo-tiles",

    transitions = ice_transitions,
    transitions_between_transitions = ice_transitions_between_transitions,

    walking_sound = icy_snow_sounds,
    landing_steps_sound = tile_sounds.landing.snow,
    driving_sound = snow_driving_sound,
    map_color = snow_map_color_high,
    scorch_mark_color = {0.318, 0.222, 0.152},
    absorptions_per_second = tile_pollution.ice,
    vehicle_friction_modifier = snow_vehicle_speed_modifier,
    thawed_variant = "dust-flat",

    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
  {
    type = "tile",
    name = "dust-flat",
    order = "b[natural]-i[ice]-a[snow]",
    collision_mask = tile_collision_masks.ground(),
    layer = aquilo_tile_offset_thawed,
    variants = tile_variations_template(
      "__space-age__/graphics/terrain/aquilo/dust-flat.png", "__base__/graphics/terrain/masks/transition-4.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    subgroup = "aquilo-tiles",

    transitions = ice_transitions,
    transitions_between_transitions = ice_transitions_between_transitions,

    walking_sound = icy_snow_sounds,
    landing_steps_sound = tile_sounds.landing.snow,
    driving_sound = snow_driving_sound,
    map_color = snow_map_color_high,
    scorch_mark_color = {0.318, 0.222, 0.152},
    absorptions_per_second = tile_pollution.ice,
    vehicle_friction_modifier = snow_vehicle_speed_modifier,
    frozen_variant = "snow-flat",
    decorative_removal_probability = 1,
    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
  {
    type = "tile",
    name = "snow-crests",
    subgroup = "aquilo-tiles",
    order = "b[natural]-i[ice]-a[snow]",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "snow_crests"},
    layer = aquilo_tile_offset_frozen + 3,
    variants = tile_variations_template(
      "__space-age__/graphics/terrain/aquilo/snow-crests.png", "__base__/graphics/terrain/masks/transition-4.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = ice_transitions,
    transitions_between_transitions = ice_transitions_between_transitions,

    walking_sound = snow_sounds,
    landing_steps_sound = tile_sounds.landing.snow,
    driving_sound = snow_driving_sound,
    map_color = lerp_color_no_alpha(snow_map_color_high, snow_map_color_low, 0.3),
    scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
    absorptions_per_second = tile_pollution.ice,
    vehicle_friction_modifier = snow_vehicle_speed_modifier,
    thawed_variant = "dust-crests",

    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
  {
    type = "tile",
    name = "dust-crests",
    subgroup = "aquilo-tiles",
    order = "b[natural]-i[ice]-a[snow]",
    collision_mask = tile_collision_masks.ground(),
    layer = aquilo_tile_offset_thawed + 1,
    variants = tile_variations_template(
      "__space-age__/graphics/terrain/aquilo/dust-crests.png", "__base__/graphics/terrain/masks/transition-4.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = ice_transitions,
    transitions_between_transitions = ice_transitions_between_transitions,

    walking_sound = snow_sounds,
    landing_steps_sound = tile_sounds.landing.snow,
    driving_sound = snow_driving_sound,
    map_color = lerp_color_no_alpha(snow_map_color_high, snow_map_color_low, 0.3),
    scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
    absorptions_per_second = tile_pollution.ice,
    vehicle_friction_modifier = snow_vehicle_speed_modifier,
    frozen_variant = "snow-crests",
    decorative_removal_probability = 1,
    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
  {
    type = "tile",
    name = "snow-lumpy",
    subgroup = "aquilo-tiles",
    order = "b[natural]-i[ice]-a[snow]",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "snow_lumpy"},
    layer = aquilo_tile_offset_frozen + 4,
    variants = tile_variations_template(
      "__space-age__/graphics/terrain/aquilo/snow-lumpy.png", "__base__/graphics/terrain/masks/transition-4.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = ice_transitions,
    transitions_between_transitions = ice_transitions_between_transitions,

    walking_sound = snow_sounds,
    landing_steps_sound = tile_sounds.landing.snow,
    driving_sound = snow_driving_sound,
    map_color = lerp_color_no_alpha(snow_map_color_high, snow_map_color_low, 0.7),
    scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
    absorptions_per_second = tile_pollution.ice,
    vehicle_friction_modifier = snow_vehicle_speed_modifier,
    thawed_variant = "dust-lumpy",

    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
  {
    type = "tile",
    name = "dust-lumpy",
    subgroup = "aquilo-tiles",
    order = "b[natural]-i[ice]-a[snow]",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "10 * aquilo_snow_ice + 10 * aquilo_tile_variant"},
    layer = aquilo_tile_offset_thawed + 2,
    variants = tile_variations_template(
      "__space-age__/graphics/terrain/aquilo/dust-lumpy.png", "__base__/graphics/terrain/masks/transition-4.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = ice_transitions,
    transitions_between_transitions = ice_transitions_between_transitions,

    walking_sound = snow_sounds,
    landing_steps_sound = tile_sounds.landing.snow,
    driving_sound = snow_driving_sound,
    map_color = lerp_color_no_alpha(snow_map_color_high, snow_map_color_low, 0.7),
    scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
    absorptions_per_second = tile_pollution.ice,
    vehicle_friction_modifier = snow_vehicle_speed_modifier,
    frozen_variant = "snow-lumpy",
    decorative_removal_probability = 1,
    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
  {
    type = "tile",
    name = "snow-patchy",
    subgroup = "aquilo-tiles",
    order = "b[natural]-i[ice]-a[snow]",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "snow_patchy"},
    layer = aquilo_tile_offset_frozen + 5,
    variants = material_background("__space-age__/graphics/terrain/aquilo/snow-patchy-8x.png", 8),

    transitions = ice_transitions,
    transitions_between_transitions = ice_transitions_between_transitions,

    walking_sound = snow_sounds,
    landing_steps_sound = tile_sounds.landing.snow,
    driving_sound = snow_driving_sound,
    map_color = snow_map_color_low,
    scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
    absorptions_per_second = tile_pollution.ice,
    vehicle_friction_modifier = snow_vehicle_speed_modifier,
    thawed_variant = "dust-patchy",
    decorative_removal_probability = 1,
    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
  {
    type = "tile",
    name = "dust-patchy",
    subgroup = "aquilo-tiles",
    order = "b[natural]-i[ice]-a[snow]",
    collision_mask = tile_collision_masks.ground(),
    layer = aquilo_tile_offset_thawed + 3,
    variants = tile_variations_template(
      "__space-age__/graphics/terrain/aquilo/dust-patchy.png", "__base__/graphics/terrain/masks/transition-4.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

    transitions = ice_transitions,
    transitions_between_transitions = ice_transitions_between_transitions,

    walking_sound = snow_sounds,
    landing_steps_sound = tile_sounds.landing.snow,
    driving_sound = snow_driving_sound,
    map_color = snow_map_color_low,
    scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
    absorptions_per_second = tile_pollution.ice,
    vehicle_friction_modifier = snow_vehicle_speed_modifier,
    frozen_variant = "snow-patchy",
    decorative_removal_probability = 1,
    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
  {
    type = "tile",
    name = "ice-rough",
    order = "b[natural]-i[ice]-a[rough]",
    collision_mask = tile_collision_masks.meltable_tile(),
    autoplace = {probability_expression = "ice_rough"},
    layer = aquilo_tile_offset_frozen + 1,
    variants = tile_variations_template(
      "__space-age__/graphics/terrain/aquilo/ice-rough.png", "__base__/graphics/terrain/masks/transition-4.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    subgroup = "aquilo-tiles",

    transitions = ice_transitions,
    transitions_between_transitions = ice_transitions_between_transitions,

    walking_sound = ice_sounds,
    landing_steps_sound = tile_sounds.landing.ice,
    driving_sound = ice_driving_sound,
    map_color = {100, 135, 177},
    scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
    absorptions_per_second = tile_pollution.ice,
    vehicle_friction_modifier = ice_vehicle_speed_modifier,
    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
  {
    type = "tile",
    name = "ice-smooth",
    subgroup = "aquilo-tiles",
    order = "b[natural]-i[ice]-c[smooth]",
    --minable = {mining_time = 0.1, result = "iceblock"},
    collision_mask = tile_collision_masks.meltable_tile(),
    autoplace = {probability_expression = "ice_smooth"},
    layer = aquilo_tile_offset_frozen,
    variants = material_background("__space-age__/graphics/terrain/aquilo/ice-smooth.png", 4),

    transitions = ice_transitions,
    transitions_between_transitions = ice_transitions_between_transitions,

    walking_sound = smooth_ice_sounds,
    landing_steps_sound = tile_sounds.landing.ice,
    driving_sound = ice_driving_sound,
    map_color = {100, 135, 177},
    scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
    absorptions_per_second = tile_pollution.ice,
    vehicle_friction_modifier = smooth_ice_vehicle_speed_modifier,
    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
  {
    type = "tile",
    name = "ice-platform",
    order = "b[natural]-i[ice]-c[smooth]",
    subgroup = "aquilo-tiles",
    minable = {mining_time = 0.5, result = "ice-platform"},
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg", volume = 0.8}, -- sound?
    build_sound =
    {
      small = sound_variations("__core__/sound/landfill-small", 6, 1),
      medium = sound_variations("__core__/sound/landfill-medium", 6,  0.8),
      large = sound_variations("__core__/sound/landfill-large", 6, 0.5)
    },
    is_foundation = true,
    can_be_part_of_blueprint = true,
    collision_mask = tile_collision_masks.meltable_tile(),
    layer = aquilo_tile_offset_frozen - 1,
    variants = material_background("__space-age__/graphics/terrain/aquilo/ice-platform.png", 8),
    transitions = ice_transitions,
    transitions_between_transitions = ice_transitions_between_transitions,

    walking_sound = smooth_ice_sounds,
    landing_steps_sound = tile_sounds.landing.ice,
    driving_sound = ice_driving_sound,
    map_color = {95, 122, 156},
    scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
    absorptions_per_second = tile_pollution.ice,
    vehicle_friction_modifier = smooth_ice_vehicle_speed_modifier,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect()
  },
  {
    type = "tile",
    name = "brash-ice",
    order = "a[deep]",
    subgroup = "aquilo-tiles",
    collision_mask = tile_collision_masks.ammoniacal_ocean(),
    effect = "brash-ice-2",
    effect_color = {26,39,63},
    effect_color_secondary = { 49, 80, 14 },
    autoplace = {probability_expression = "brash_ice"},
    layer = 0,
    layer_group = "water-overlay",
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater1.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = { space_age_tiles_util.lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = sound_variations("__base__/sound/walking/shallow-water", 7, 1),
    map_color = {21,42,56},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "ice-platform",
    fluid = "ammoniacal-solution",
    absorptions_per_second = tile_pollution.aquilo,
    ambient_sounds = lake_ambience
  },
  {
    type = "tile-effect",
    name = "brash-ice-2",
    shader = "water",
    water = {
      shader_variation = "wetland-water",
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/gleba/watercaustics.png",
          width = 512,
          height = 512
        },
        {
          filename = "__space-age__/graphics/terrain/aquilo/brash-ice.png",
          width = 512 * 4,
          height = 512 * 2
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,


      animation_speed = 0.8,
      animation_scale = { 0.40, 0.68 },
      tick_scale = 6,

      specular_lightness = { 4, 10, 1 },
      foam_color = { 8, 2, 2 },
      foam_color_multiplier = 1,

      dark_threshold = { 0.0, 0.2 },
      reflection_threshold = { 3, 2 },
      specular_threshold = { 0.0, 0.0 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16,
    }
  },
})

local function frozen_concrete(base_name, item_name, transition_merge_tile)
  local frozen_name = "frozen-" .. base_name
  local base_prototype = data.raw.tile[base_name]
  base_prototype.frozen_variant = frozen_name
  local frozen_concrete = table.deepcopy(base_prototype)
  frozen_concrete.order = "z[frozen-concrete]-" .. frozen_name
  frozen_concrete.subgroup = "aquilo-tiles"
  frozen_concrete.name = frozen_name
  frozen_concrete.can_be_part_of_blueprint = true
  frozen_concrete.placeable_by = { item = item_name, count = 1}
  frozen_concrete.layer = base_prototype.layer + 1
  frozen_concrete.variants =
  {
    material_background =
    {
      picture = "__space-age__/graphics/terrain/aquilo/"..frozen_name..".png",
      count = 8,
      scale = 0.5
    },
    transition = tile_graphics.generic_texture_on_concrete_transition
  }
  frozen_concrete.transition_merges_with_tile = transition_merge_tile
  frozen_concrete.transitions = nil
  frozen_concrete.transitions_between_transitions = nil
  frozen_concrete.thawed_variant = base_name
  frozen_concrete.frozen_variant = nil
  frozen_concrete.walking_sound = frozen_concrete_sounds
  data:extend({ frozen_concrete })
end

frozen_concrete("concrete", "concrete", "concrete")
frozen_concrete("hazard-concrete-left", "hazard-concrete", "concrete")
frozen_concrete("hazard-concrete-right", "hazard-concrete", "concrete")
frozen_concrete("refined-concrete", "refined-concrete", "refined-concrete")
frozen_concrete("refined-hazard-concrete-left", "refined-hazard-concrete", "refined-concrete")
frozen_concrete("refined-hazard-concrete-right", "refined-hazard-concrete", "refined-concrete")

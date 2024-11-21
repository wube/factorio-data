local tile_trigger_effects = require("prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local tile_lightening = 28
vulcanus_tile_offset = 40
--- max tile layer on nauvis is 33(nuclear_ground), this should generally be above that. Conctrete starts at 100, which this should not be above

local rugged_stone_sound = sound_variations("__space-age__/sound/walking/rugged-stone", 10, 0.8)
local rocky_stone_sound = sound_variations("__space-age__/sound/walking/rocky-stone", 10, 0.8)
local soft_sand_sound = sound_variations("__space-age__/sound/walking/soft-sand", 10, 1)
local warm_stone_sound = sound_variations("__space-age__/sound/walking/warm-stone", 10, 1)
local stone_driving_sound =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-stone.ogg", volume = 0.8,
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

local lava_patch =
{
  filename = "__space-age__/graphics/terrain/water-transitions/lava-patch.png",
  scale = 0.5,
  width = 64,
  height = 64
}

local lava_stone_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-cold.png",
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

local lava_stone_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-cold-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = lava_patch
  },

  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/lava-stone-cold-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      o_transition_count = 0
    }
  },

  {
    transition_group1 = default_transition_group_id,
    transition_group2 = lava_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = lava_patch
  },

  {
    transition_group1 = lava_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/lava-stone-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      o_transition_count = 0
    }
  },
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    overlay_enabled = false
  }
}

local lava_to_out_of_map_transition =
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
  waving_effect_time_scale = 0.005,
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

local destroyed_item_trigger =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    source_effects =
    {
      type = "create-trivial-smoke",
      smoke_name = "smoke",
      offset_deviation = {{-0.1, -0.1}, {0.1, 0.1}},
      starting_frame_deviation = 5
    }
  }
}

space_age_tiles_util.lava_to_out_of_map_transition = lava_to_out_of_map_transition
space_age_tiles_util.lava_stone_transitions_between_transitions = lava_stone_transitions_between_transitions

--define ranges for all tilesets. Having these as thier own expressions helps with debugging and also modifying things like decorative placement
data:extend
{
  {
    type = "noise-expression",
    name = "vulcanus_metal_tile",
    expression = "max(0, vulcanus_tungsten_ore_probability)"
  },
  ---- LAVA
  {
    type = "noise-expression",
    name ="lava_spawn_excluder",
    expression = "distance > 10"
  },
  {
    type = "noise-expression",
    name ="lava_basalts_range", -- lower weight than lava_hot_basalts_range
    expression = "100 * min(vulcanus_basalts_biome * lava_spawn_excluder\z
                            * range_select_base(vulcanus_elev, -5000, 0, 1, -1000, 1),\z
                            100 * (1 - vulcanus_metal_tile))"
  },
  {
    type = "noise-expression",
    name ="lava_mountains_range",
    expression = "1100 * range_select_base(mountain_lava_spots, 0.2, 10, 1, 0, 1)"
  },
  {
    type = "noise-expression",
    name ="lava_hot_basalts_range", -- higher weight than lava_basalts_range. Max elevation is variable so coastline is not always worm or hot.
    expression = "200 * min(vulcanus_basalts_biome * lava_spawn_excluder\z
                            * range_select_base(vulcanus_elev, -5000, min(0, 5 * (-2 + 4 * vulcanus_rock_noise)), 1, -1000, 1),\z
                            100 * (1 - vulcanus_metal_tile))"
  },
  {
    type = "noise-expression",
    name ="lava_hot_mountains_range",
    expression = "1000 * range_select_base(mountain_lava_spots, 0.05, 0.3, 1, 0, 1)"
  },

  ---- BASALTS
  -- aux controls rocky outcrop pounts.
  -- high-medium aux is cracks
  -- low aux is smooth
  -- hotter is lower elevation
  {
    type = "noise-expression",
    name ="volcanic_cracks_hot_range",
    expression = "vulcanus_basalts_biome * range_select_base(vulcanus_elev, 0, 8, 1, 0, 20)"
  },
  {
    type = "noise-expression",
    name ="volcanic_cracks_warm_range",
    expression = "vulcanus_basalts_biome * range_select_base(vulcanus_elev, 8, 22, 1, 0, 5)\z
                  + (aux - 0.05)\z
                  + 50000 * vulcanus_metal_tile"
  },
  {
    type = "noise-expression",
    name = "volcanic_cracks_cold_range",
    expression = "(0.5 - vulcanus_ashlands_biome) * range_select_base(vulcanus_elev, 20, 100, 1, 0, 1)\z
                  + (aux - 0.3)"
  },
  {
    type = "noise-expression",
    name = "volcanic_smooth_stone_warm_range",
    expression = "vulcanus_basalts_biome * range_select_base(vulcanus_elev, 8, 20, 1, 0, 5)\z
                  - (aux - 0.05)\z
                  + 50000 * vulcanus_metal_tile"
  },
  {
    type = "noise-expression",
    name = "volcanic_smooth_stone_range",
    expression = "(0.5 - vulcanus_ashlands_biome) * range_select_base(vulcanus_elev, 20, 100, 1, 0, 1)\z
                  - (aux - 0.3)"
  },

  -- MOUNTAINS
  -- lumps (jagged/cold folded) are on high aux.
  -- depression channels (hot folded, soil) are low aux.
  -- folded is higher up the mountain.
  -- hot folded is closest to the center.
  -- jagged ground identifies rocky peacks and resource patches.
  -- flat folded ix between extremes
  {
    type = "noise-expression",
    name = "volcanic_folds_flat_range",
    expression = "2 * (vulcanus_mountains_biome - 0.5) - 0.15 * mountain_volcano_spots"
  },
  {
    type = "noise-expression",
    name = "volcanic_folds_range",
    expression = "2 * (vulcanus_mountains_biome - 0.5) + (aux - 0.5) + 0.5 * (mountain_volcano_spots - 0.1)"

  },
  {
    type = "noise-expression",
    name = "volcanic_folds_warm_range",
    expression = "2 * (vulcanus_mountains_biome - 0.5) + 3 * (mountain_volcano_spots - 0.85) - 2 * (aux - 0.5)"
  },
  {
    type = "noise-expression",
    name ="volcanic_jagged_ground_range",
    -- volcano peak circle is expected to be 1020 to 1030, The cliff is at 1020
    expression = "5 * min(10, max(vulcanus_calcite_region + 0.2,\z
                                  range_select_base(vulcanus_elev, 1010, 2000, 2, -10, 1) + 3 * (aux - 0.5)))"
  },
  {
    type = "noise-expression",
    name ="volcanic_soil_light_range_mountains",
    expression = "min(0.8, 4 * (vulcanus_mountains_biome - 0.25)) - 0.35 * mountain_volcano_spots - 3 * (aux - 0.2)"
  },
  {
    type = "noise-expression",
    name ="volcanic_soil_dark_range_mountains",
    expression = "min(0.8, 4 * (vulcanus_mountains_biome - 0.25)) - 0.35 * mountain_volcano_spots - 1 * (aux - 0.5)"
  },

  -- Ashlands
  -- Low aux low moisture is ash
  -- Low aux high moisture is trees & grass.
  -- High aux low moisture is chimneys and rocks.
  -- High aux high moisture is rocks with pita
  {
    type = "noise-expression",
    name = "volcanic_ash_flats_range",
    expression = "2 * (vulcanus_ashlands_biome - 0.5)\z
                  - 1.5 * (aux - 0.25)\z
                  - 1.5 * (moisture - 0.6)"
  },
  {
    type = "noise-expression",
    name = "volcanic_ash_light_range",
    expression = "2 * (vulcanus_ashlands_biome - 0.5)\z
                  - 1.5 * (moisture - 0.6)"
  },
  {
    type = "noise-expression",
    name = "volcanic_ash_dark_range",
    expression = "min(1, 4 * (vulcanus_ashlands_biome - 0.25))\z
                  + max(-1.5 * (aux - 0.25),\z
                        0.01 - 1.5 * abs(aux - 0.5) - 1.5 * (moisture - 0.66))"
    -- the last part is an axtra line blending ash cracks to light ash
  },
  {
    type = "noise-expression",
    name = "volcanic_pumice_stones_range",
    expression = "2 * (vulcanus_ashlands_biome - 0.5)\z
                  + 1.5 * (aux - 0.5)\z
                  + 1.5 * (moisture - 0.66)"
  },
  {
    type = "noise-expression",
    name = "volcanic_ash_cracks_range",
    expression = "min(1, 4 * (vulcanus_ashlands_biome - 0.25))\z
                  + 1.5 * (aux - 0.5)\z
                  - 1.5 * (moisture - 0.66)"
  },
  {
    type = "noise-expression",
    name = "volcanic_ash_soil_range",
    expression = "2 * (vulcanus_ashlands_biome - 0.5)"
  },
  {
    type = "noise-expression",
    name = "volcanic_soil_light_range_ashlands",
    expression = "2 * (vulcanus_ashlands_biome - 0.5)\z
                  + 1.5 * (moisture - 0.8)"
  },
  {
    type = "noise-expression",
    name = "volcanic_soil_dark_range_ashlands",
    expression = "2 * (vulcanus_ashlands_biome - 0.5)\z
                  - 1.5 * (aux - 0.25)\z
                  + 1.5 * (moisture - 0.8)"
  },

  -- COMBINE SHARED
  {
    type = "noise-expression",
    name = "volcanic_soil_light_range",
    expression = "max(volcanic_soil_light_range_mountains, volcanic_soil_light_range_ashlands, 10 * (vulcanus_sulfuric_acid_region_patchy + 0.2))"
  },
  {
    type = "noise-expression",
    name = "volcanic_soil_dark_range",
    expression = "max(volcanic_soil_dark_range_mountains, volcanic_soil_dark_range_ashlands)"
  },
  {
    type = "tile",
    name = "volcanic-cracks-hot",
    subgroup = "vulcanus-tiles",
    order = "a-c",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_cracks_hot_range"
    },
    layer = vulcanus_tile_offset + 2,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions_and_light(
      "__space-age__/graphics/terrain/vulcanus/volcanic-cracks-hot.png",
      "__space-age__/graphics/terrain/vulcanus/volcanic-cracks-hot-lightmap.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = data.raw.tile["dirt-1"].walking_sound,
    map_color = {r = tile_lightening+ 30, g = tile_lightening+ 5, b = tile_lightening+ -5}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = .6,
    vehicle_friction_modifier = 1,
    pollution_absorption_per_second = tile_pollution.lava
  },
  ----------- CLIFF TILE
  {
    type = "tile",
    name = "volcanic-jagged-ground",
    subgroup = "vulcanus-tiles",
    order = "a-k",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_jagged_ground_range"
    },
    layer = vulcanus_tile_offset + 5,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/vulcanus/volcanic-jagged-ground.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = rocky_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r = tile_lightening+ 30, g = tile_lightening+ 30, b = tile_lightening+ 20},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 2,
    absorptions_per_second = tile_pollution.lava,
  },
  ----------- "SHALLOW" LAVA
  {
    type = "tile",
    name = "lava",
    subgroup = "vulcanus-tiles",
    order = "a-b",
    collision_mask = tile_collision_masks.lava(),
    autoplace =
    {
      probability_expression = "max(lava_basalts_range, lava_mountains_range)"
    },
    effect = "lava-2",
    fluid = "lava",
    effect_color = { 167, 59, 27 },
    effect_color_secondary = { 49, 80, 14 },
    particle_tints = tile_graphics.lava_particle_tints,
    destroys_dropped_items = true,
    default_destroyed_dropped_item_trigger = destroyed_item_trigger,
    layer = 6,
    layer_group = "water-overlay",
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template(
      "__space-age__/graphics/terrain/vulcanus/lava.png",
      "__base__/graphics/terrain/masks/transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    allowed_neighbors={"lava-hot"},
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = data.raw.tile["water"].walking_sound,
    map_color = {r = 150, g = 49, b = 30},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
    trigger_effect = tile_trigger_effects.hot_lava_trigger_effect(),
    default_cover_tile = "foundation",
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/lava", 10, 0.5 ),
        advanced_volume_control =
        {
          fades = { fade_in = { curve_type = "cosine", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } }
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 3
    }
  },
  ----------- "DEEP" LAVA
  {
    type = "tile",
    name = "lava-hot",
    order = "a-a",
    subgroup = "vulcanus-tiles",
    collision_mask = tile_collision_masks.lava(),
    autoplace =
    {
      probability_expression = "max(lava_hot_basalts_range, lava_hot_mountains_range)"
    },
    effect = "lava",
    fluid = "lava",
    effect_color = { 167, 59, 27 },
    effect_color_secondary = { 49, 80, 14 },
    particle_tints = tile_graphics.lava_particle_tints,
    destroys_dropped_items = true,
    default_destroyed_dropped_item_trigger = destroyed_item_trigger,
    layer = 5,
    layer_group = "water",
    sprite_usage_surface = "vulcanus",
    variants =
      {
        main =
        {
          {
            picture = "__space-age__/graphics/terrain/vulcanus/lava-hot.png",
            count = 1,
            scale = 0.5,
            size = 1
          }
        },
      empty_transitions=true,
    },
    allowed_neighbors={"lava"},
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = data.raw.tile["water"].walking_sound,
    map_color = {r = 255, g = 138, b = 57},
    absorptions_per_second = tile_pollution.lava,
    default_cover_tile = "foundation",
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/magma", 10, 0.7 ),
        advanced_volume_control =
        {
          fades = { fade_in = { curve_type = "cosine", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } }
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 3
    }
  },
  ----------- WARM CRACKS
  {
    type = "tile",
    name = "volcanic-cracks-hot",
    subgroup = "vulcanus-tiles",
    order = "a-c",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_cracks_hot_range"
    },
    layer = vulcanus_tile_offset + 2,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions_and_light(
      "__space-age__/graphics/terrain/vulcanus/volcanic-cracks-hot.png",
      "__space-age__/graphics/terrain/vulcanus/volcanic-cracks-hot-light.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = warm_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    map_color = {r = tile_lightening+ 30, g = tile_lightening+ 5, b = tile_lightening+ -5}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = .6,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
    default_cover_tile = "foundation"
  },
  {
    type = "tile",
    name = "volcanic-cracks-warm",
    subgroup = "vulcanus-tiles",
    order = "a-d",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_cracks_warm_range"
    },
    layer = vulcanus_tile_offset + 3,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions_and_light(
      "__space-age__/graphics/terrain/vulcanus/volcanic-cracks-warm.png",
      "__space-age__/graphics/terrain/vulcanus/volcanic-cracks-warm-lightmap1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = warm_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    map_color = {r = tile_lightening+ 30, g = tile_lightening+ 10, b = tile_lightening+ 5},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava
  },
  ----------- COLD CRACKS
  {
    type = "tile",
    name = "volcanic-cracks",
    subgroup = "vulcanus-tiles",
    order = "a-e",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_cracks_cold_range"
    },
    layer = vulcanus_tile_offset + 4,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
       "__space-age__/graphics/terrain/vulcanus/volcanic-cracks.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = rocky_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r = tile_lightening+ 15, g = tile_lightening+ 14, b = tile_lightening+ 15},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava
  },
  ----------- COLD LAVA FLAT
  {
    type = "tile",
    name = "volcanic-folds-flat",
    subgroup = "vulcanus-tiles",
    order = "a-j",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_folds_flat_range"
    },
    layer = vulcanus_tile_offset + 16,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/vulcanus/volcanic-folds-flat.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = rugged_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r =tile_lightening+ 16, g = tile_lightening+ 15, b = tile_lightening+ 16}, -- changed from (8 7 8) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 2,
    absorptions_per_second = tile_pollution.lava

  },
  ----------- ASH SAND
  {
    type = "tile",
    name = "volcanic-ash-light",
    subgroup = "vulcanus-tiles",
    order = "a-o",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_ash_light_range"
    },
    layer = vulcanus_tile_offset + 14,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/vulcanus/volcanic-ash-light.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = soft_sand_sound,
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    map_color = {r = tile_lightening+ 25, g = tile_lightening+ 25, b = tile_lightening+ 25}, -- changed from (30 30 30) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
    can_be_part_of_blueprint = false,

    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  {
    type = "tile",
    name = "volcanic-ash-dark",
    subgroup = "vulcanus-tiles",
    order = "a-p",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_ash_dark_range"
    },
    layer = vulcanus_tile_offset + 13,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/vulcanus/volcanic-ash-dark.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = soft_sand_sound,
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    map_color = {r = tile_lightening+ 25, g = tile_lightening+ 25, b = tile_lightening+ 25}, -- changed from (30 30 30) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
    can_be_part_of_blueprint = false,

    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  ----------- ASH SAND
  {
    type = "tile",
    name = "volcanic-ash-flats",
    subgroup = "vulcanus-tiles",
    order = "a-o",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_ash_flats_range"
    },
    layer = vulcanus_tile_offset + 12,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/vulcanus/volcanic-ash-flats.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = soft_sand_sound,
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    map_color = {r = tile_lightening+ 25, g = tile_lightening+ 25, b = tile_lightening+ 25}, -- changed from (30 30 30) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
    can_be_part_of_blueprint = false,

    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  ----------- PUMICE
  {
    type = "tile",
    name = "volcanic-pumice-stones",
    subgroup = "vulcanus-tiles",
    order = "a-n",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_pumice_stones_range"
    },
    layer = vulcanus_tile_offset + 15,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/vulcanus/volcanic-pumice-stones.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = rocky_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r = tile_lightening+ 18, g = tile_lightening+ 18, b = tile_lightening+ 18}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava
  },
  ----------- SMOOTH STONE
  {
    type = "tile",
    name = "volcanic-smooth-stone",
    subgroup = "vulcanus-tiles",
    order = "a-g",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_smooth_stone_range"
    },
    layer = vulcanus_tile_offset + 1,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/vulcanus/volcanic-smooth-stone.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = rocky_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r = tile_lightening+ 22, g = tile_lightening+ 22, b = tile_lightening+ 30}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava

  },
  ----------- SMOOTH STONE WARM
  {
    type = "tile",
    name = "volcanic-smooth-stone-warm",
    subgroup = "vulcanus-tiles",
    order = "a-f",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_smooth_stone_warm_range"
    },
    layer = vulcanus_tile_offset,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions_and_light(
      "__space-age__/graphics/terrain/vulcanus/volcanic-smooth-stone-warm.png",
      "__space-age__/graphics/terrain/vulcanus/volcanic-smooth-stone-warm-lightmap.png",

      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = warm_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r = tile_lightening+ 26, g = tile_lightening+ 22, b = tile_lightening+ 22}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,

  },
  {
    type = "tile",
    name = "volcanic-ash-cracks",
    subgroup = "vulcanus-tiles",
    order = "a-r",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_ash_cracks_range"
    },
    layer = vulcanus_tile_offset + 6,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/vulcanus/volcanic-ash-cracks.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = rugged_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r = tile_lightening+ 39, g = tile_lightening+ 39, b = tile_lightening+ 39}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava
  },
  {
    type = "tile",
    name = "volcanic-folds",
    subgroup = "vulcanus-tiles",
    order = "a-i",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_folds_range"
    },
    layer = vulcanus_tile_offset + 18,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/vulcanus/volcanic-folds.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = rugged_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r = tile_lightening+ 15, g = tile_lightening+ 15, b = tile_lightening+ 15}, -- changed from (2 2 2) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 2,
    absorptions_per_second = tile_pollution.lava,
  },
  {
    type = "tile",
    name = "volcanic-folds-warm",
    subgroup = "vulcanus-tiles",
    order = "a-h",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_folds_warm_range"
    },
    layer = vulcanus_tile_offset + 17,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions_and_light(
      "__space-age__/graphics/terrain/vulcanus/volcanic-folds-warm.png",
      "__space-age__/graphics/terrain/vulcanus/volcanic-folds-warm-lightmap.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = rocky_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r = tile_lightening+ 37, g = tile_lightening+ 17, b = tile_lightening+ 17},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
  },
  {
    type = "tile",
    name = "volcanic-soil-dark",
    subgroup = "vulcanus-tiles",
    order = "a-l",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_soil_dark_range",
    },
    layer = vulcanus_tile_offset + 7,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/vulcanus/volcanic-soil-dark.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
      }
    ),
    -- tint={0.8, 0.75, 0.8},
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = soft_sand_sound,
    landing_steps_sound = tile_sounds.landing.sand,
    map_color = {r = tile_lightening+ 20, g = tile_lightening+ 23, b = tile_lightening+ 15},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
  },
  {
    type = "tile",
    name = "volcanic-soil-light",
    subgroup = "vulcanus-tiles",
    order = "a-m",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_soil_light_range"
    },
    layer = vulcanus_tile_offset + 8,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/vulcanus/volcanic-soil-light.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
      }
    ),
    -- tint={0.6, 0.55, 0.55},
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = soft_sand_sound,
    landing_steps_sound = tile_sounds.landing.sand,
    map_color = {r = tile_lightening+ 30, g = tile_lightening+ 20, b = tile_lightening+ 15},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
  },
  {
    type = "tile",
    name = "volcanic-ash-soil",
    subgroup = "vulcanus-tiles",
    order = "a-q",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_ash_soil_range"
    },
    layer = vulcanus_tile_offset + 11,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/vulcanus/volcanic-ash-soil.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = soft_sand_sound,
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    map_color = {r = tile_lightening+ 20, g = tile_lightening+ 20, b = tile_lightening+ 15},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
  },
}

table.insert(lava_tile_type_names, "lava-hot")
table.insert(lava_tile_type_names, "lava")

-- add lava tiles to water tiles (for tiles that doesn't have defined transitions to lava)
table.insert(water_tile_type_names, "lava-hot")
table.insert(water_tile_type_names, "lava")

data:extend(
{
  {
    type = "tile-effect",
    name = "lava",
    shader = "water",
    water =
    {
      shader_variation = "lava",
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/vulcanus/lava-textures/lava-noise-texture.png",
          width = 512,
          height = 512
        },
        {
          filename = "__space-age__/graphics/terrain/vulcanus/lava-textures/lava.png",
          width = 512 * 4,
          height = 512 * 2
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,

      animation_speed = 1.5,
      animation_scale = { 0.7, 0.7 },
      tick_scale = 1,

      specular_lightness = { 22, 51, 17},
      foam_color = { 59, 30, 9},
      foam_color_multiplier = 1.3,

      dark_threshold = { 0.755, 0.755 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.889, 0.291 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16
    }
  },
  {
    type = "tile-effect",
    name = "lava-2",
    shader = "water",
    water =
    {
      shader_variation = "lava",
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/vulcanus/lava-textures/lava-noise-texture.png",
          width = 512,
          height = 512
        },
        {
          filename = "__space-age__/graphics/terrain/vulcanus/lava-textures/coastal-lava.png",
          width = 512 * 4,
          height = 512 * 2
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,

      animation_speed = 1.5,
      animation_scale = { 0.75, 0.75 },
      tick_scale = 1,

      specular_lightness = { 30, 48, 22 },
      foam_color = { 73, 5, 5 },
      foam_color_multiplier = 1,

      dark_threshold = { 0.755, 0.755 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.889, 0.291 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16
    }
  }
})

local tile_trigger_effects = require("prototypes.tile.tile-trigger-effects")
local tile_pollution = require("prototypes.tile.tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")

local space_platform_tile_animations = require("prototypes.tile.platform-tile-animations")

local base_sounds = require("__base__/prototypes/entity/sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local patch_for_inner_corner_of_transition_between_transition = tile_graphics.patch_for_inner_corner_of_transition_between_transition

table.insert(out_of_map_tile_type_names, "empty-space")
table.insert(water_tile_type_names, "oil-ocean-shallow")
table.insert(water_tile_type_names, "oil-ocean-deep")
lava_tile_type_names = lava_tile_type_names or {}

space_age_tiles_util = space_age_tiles_util or {}

local space_platform_tile_build_sounds =
{
  small = sound_variations("__core__/sound/build-concrete-small", 6, 0.4), -- used in editor
  medium = sound_variations("__core__/sound/build-concrete-medium", 6, 0.5), -- used in editor
  large =  sound_variations("__core__/sound/build-concrete-large", 6, 0.5), -- used in editor
  animated =
  {
    variations = sound_variations("__space-age__/sound/terrain/space-platform-tile-build", 7, 0.5),
    aggregation = {max_count = 3, remove = true, count_already_playing = true, priority = "oldest", progress_threshold = 0.6},
  },
}

local concrete_tile_build_sounds =
{
  small = sound_variations("__core__/sound/build-concrete-small", 6, 0.4),
  medium = sound_variations("__core__/sound/build-concrete-medium", 6, 0.5),
  large =  sound_variations("__core__/sound/build-concrete-large", 6, 0.5),
}

local concrete_sounds = sound_variations("__base__/sound/walking/concrete", 11, 0.5)
local dirt_sounds = sound_variations("__base__/sound/walking/dirt-1", 10, 0.8, volume_multiplier("main-menu", 2.9))

default_transition_group_id = default_transition_group_id or 0
water_transition_group_id = water_transition_group_id or 1
out_of_map_transition_group_id = out_of_map_transition_group_id or 2
lava_transition_group_id = lava_transition_group_id or 3

local grass_vehicle_speed_modifier = 1.6
local dirt_vehicle_speed_modifier = 1.4
local sand_vehicle_speed_modifier = 1.8
local stone_path_vehicle_speed_modifier = 1.1
local concrete_vehicle_speed_modifier = 0.8

-- An 'infinity-like' number used to give water an elevation range that
-- is effectively unbounded on the low end
local water_inflike = 4096

-- Don't make a new water_tile_type_names table, update the old one so existing tiles get updated.
-- This table needs to be updated before it gets deepcopied by the (temporary rapid prototype) tile prototypes.
table.insert(water_tile_type_names, "wetland-yumako")
table.insert(water_tile_type_names, "wetland-jellynut")
table.insert(water_tile_type_names, "wetland-light-green-slime")
table.insert(water_tile_type_names, "wetland-green-slime")
table.insert(water_tile_type_names, "wetland-light-dead-skin")
table.insert(water_tile_type_names, "wetland-dead-skin")
table.insert(water_tile_type_names, "wetland-pink-tentacle")
table.insert(water_tile_type_names, "wetland-red-tentacle")
table.insert(water_tile_type_names, "oil-ocean-shallow")
table.insert(water_tile_type_names, "oil-ocean-deep")
table.insert(water_tile_type_names, "ammoniacal-ocean")
table.insert(water_tile_type_names, "ammoniacal-ocean-2")
table.insert(water_tile_type_names, "brash-ice")


local ground_to_out_of_map_transition = base_tiles_util.ground_to_out_of_map_transition
local concrete_to_out_of_map_transition = base_tiles_util.concrete_to_out_of_map_transition
local stone_path_to_out_of_map_transition = base_tiles_util.stone_path_to_out_of_map_transition

local foundation_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/foundation.png",
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

local foundation_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/foundation-transitions.png",
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

data:extend
{
  {
    type = "tile-effect",
    name = "space",
    shader = "space",
    space = {}
  },
  {
    name = "empty-space",
    type = "tile",
    order = "z[other]-b[empty-space]",
    subgroup = "special-tiles",
    collision_mask =
    {
      layers=
      {
        ground_tile=true,
        water_tile=true,
        empty_space=true,
        resource=true,
        floor=true,
        item=true,
        object=true,
        player=true,
        doodad=true
      },
    },
    layer_group = "zero",
    layer = 0,
    effect = "space",
    effect_color = {0.5, 0.507, 0},
    effect_color_secondary = { 0, 68, 25 },
    particle_tints =
    {
      primary = {0, 0, 0, 0},
      secondary = {0, 0, 0, 0},
    },
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/empty-space.png",
          count = 1,
          size = 1
        }
      },
      empty_transitions = true
    },
    map_color = {0, 0, 0},
    absorptions_per_second = tile_pollution.out_of_map,
    autoplace = {probability_expression = 1},
    default_cover_tile = "space-platform-foundation"
  },
  {
    type = "tile",
    name = "space-platform-foundation",
    order = "a[artificial]-d[utility]-b[space-platform-foundation]",
    subgroup = "artificial-tiles",
    minable = {mining_time = 0.5, result = "space-platform-foundation"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    allows_being_covered = false,
    max_health = 50,
    weight = 200,
    collision_mask = tile_collision_masks.ground(),
    layer = 15,
    -- layer_group = "ground-artificial" -- should space-platform-foundation be in the ground-artifical group?

    -- transitions = landfill_transitions,
    -- transitions_between_transitions = landfill_transitions_between_transitions,
    dying_explosion = "space-platform-foundation-explosion",
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    bound_decoratives =
    {
      "space-platform-decorative-pipes-2x1",
      "space-platform-decorative-pipes-1x2",
      "space-platform-decorative-pipes-1x1",
      "space-platform-decorative-4x4",
      "space-platform-decorative-2x2",
      "space-platform-decorative-1x1",
      "space-platform-decorative-tiny",
    },

    build_animations = space_platform_tile_animations.top_animation,
    build_animations_background = space_platform_tile_animations.animation,
    built_animation_frame = 32,

    sprite_usage_surface = "space",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/space-platform/space-platform-1x1.png",
          count = 16,
          size = 1,
          scale = 0.5
        },
        {
          picture = "__space-age__/graphics/terrain/space-platform/space-platform-2x2.png",
          count = 16,
          size = 2,
          probability = 0.75,
          scale = 0.5
        },
      },
      transition =
      {
        --background_layer_offset = 1,
        --background_layer_group = "zero",
        --offset_background_layer_by_tile_layer = true,
        draw_background_layer_under_tiles = true,
        --outer_corner_variations_in_group = 8,
        side_variations_in_group = 16,
        double_side_variations_in_group = 4,

        overlay_layout =
        {
          inner_corner =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-inner-corner.png",
            count = 16,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-outer-corner.png",
            count = 16,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-side.png",
            count = 32,
            scale = 0.5
          },
          double_side =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-double-side.png",
            count = 8,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-u.png",
            count = 4,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-o.png",
            count = 1,
            scale = 0.5
          }
        },
        background_layout =
        {
          inner_corner =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-inner-corner-background.png",
            count = 16,
            scale = 0.5,
            tile_height = 8
          },
          outer_corner =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-outer-corner-background.png",
            count = 16,
            scale = 0.5,
            tile_height = 8
          },
          side =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-side-background.png",
            count = 32,
            scale = 0.5,
            tile_height = 8
          },
          double_side =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-double-side-background.png",
            count = 8,
            scale = 0.5,
            tile_height = 8
          },
          u_transition =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-u-background.png",
            count = 4,
            scale = 0.5,
            tile_height = 8
          },
          o_transition = nil
        },
        mask_layout =
        {
          inner_corner =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-inner-corner-mask.png",
            count = 16,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-outer-corner-mask.png",
            count = 16,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-side-mask.png",
            count = 32,
            scale = 0.5
          },
          double_side =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-double-side-mask.png",
            count = 8,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-u-mask.png",
            count = 4,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-o-mask.png",
            count = 1,
            scale = 0.5
          }
        }
      },

      -- material_background =
      -- {
      --   picture = "__space-age__/graphics/terrain/space-platform/space-platform.png",
      --   count = 8,
      --   scale = 0.5
      -- }
    },

    walking_sound = concrete_sounds,
    build_sound = space_platform_tile_build_sounds,
    map_color = {63, 61, 59},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000}
  },
  {
    type = "tile",
    name = "foundation",
    order = "a[artificial]-f",
    subgroup = "artificial-tiles",
    needs_correction = false,
    minable = {mining_time = 0.5, result = "foundation"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = 9,
    layer_group = "ground-artificial",
    transition_overlay_layer_offset = 2, -- need to render border overlay on top of hazard-concrete
    decorative_removal_probability = 0.25,
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/foundation/foundation-dummy.png",
          count = 1,
          size = 1
        },
        {
          picture = "__space-age__/graphics/terrain/foundation/foundation-dummy.png",
          count = 1,
          size = 2,
          probability = 0.39
        },
        {
          picture = "__space-age__/graphics/terrain/foundation/foundation-dummy.png",
          count = 1,
          size = 4,
          probability = 1
        }
      },
      transition =
      {
        overlay_layout =
        {
          inner_corner =
          {
            spritesheet = "__space-age__/graphics/terrain/foundation/foundation-inner-corner.png",
            count = 16,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__space-age__/graphics/terrain/foundation/foundation-outer-corner.png",
            count = 8,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__space-age__/graphics/terrain/foundation/foundation-side.png",
            count = 16,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__space-age__/graphics/terrain/foundation/foundation-u.png",
            count = 8,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__space-age__/graphics/terrain/foundation/foundation-o.png",
            count = 4,
            scale = 0.5
          }
        },
        mask_layout =
        {
          inner_corner =
          {
            spritesheet = "__space-age__/graphics/terrain/foundation/foundation-inner-corner-mask.png",
            count = 16,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__space-age__/graphics/terrain/foundation/foundation-outer-corner-mask.png",
            count = 8,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__space-age__/graphics/terrain/foundation/foundation-side-mask.png",
            count = 16,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__space-age__/graphics/terrain/foundation/foundation-u-mask.png",
            count = 8,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__space-age__/graphics/terrain/foundation/foundation-o-mask.png",
            count = 4,
            scale = 0.5
          }
        }
      },

      material_background =
      {
        picture = "__space-age__/graphics/terrain/foundation/foundation.png",
        count = 8,
        scale = 0.5
      }
    },

    transitions = foundation_transitions,
    transitions_between_transitions = foundation_transitions_between_transitions,

    walking_sound = dirt_sounds,
    build_sound = concrete_tile_build_sounds,
    map_color={57, 39, 26},
    scorch_mark_color = {r = 0.329, g = 0.242, b = 0.177, a = 1.000},
    vehicle_friction_modifier = 1.1,

    trigger_effect = tile_trigger_effects.concrete_trigger_effect()
  }
}

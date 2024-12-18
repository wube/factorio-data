local tile_trigger_effects = require("prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")
local base_sounds = require("__base__/prototypes/entity/sounds")

local semi_wet_sound = sound_variations("__space-age__/sound/walking/semi-wet-rock", 10, 0.7)
local semi_dry_sound = sound_variations("__space-age__/sound/walking/semi-dry-rock", 10, 0.8)
local soft_bark_sound = sound_variations("__space-age__/sound/walking/soft-bark", 10, 0.8)
local dry_rock_sound = sound_variations("__space-age__/sound/walking/dry-rock", 10, 0.8)
local slime_sound = sound_variations("__space-age__/sound/walking/slime", 10, 0.8)
local wetland_sound = sound_variations("__space-age__/sound/walking/wetland", 10, 0.6)
local tile_lightening = 28

local wetland_driving_sound =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-water-shallow.ogg", volume = 0.6,
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
  },
  fade_ticks = 6
}
local lake_ambience =
{
  {
    sound =
    {
      variations = sound_variations("__base__/sound/world/water/waterlap", 10, 0.4),
      advanced_volume_control =
      {
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
      }
    },
    radius = 7.5,
    min_entity_count = 10,
    max_entity_count = 30,
    entity_to_sound_ratio = 0.1,
    average_pause_seconds = 8
  },
  {
    sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/rain-on-water", 10, 0.2),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}},
        }
      },
      min_entity_count = 10,
      max_entity_count = 25,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 5,
  }
}

gleba_tile_offset = 65
gleba_lowland_tile_offset = 32

local lava_to_out_of_map_transition = space_age_tiles_util.lava_to_out_of_map_transition
local lava_stone_transitions_between_transitions = space_age_tiles_util.lava_stone_transitions_between_transitions

local function water_sound() return sound_variations("__base__/sound/walking/shallow-water", 7, 1, volume_multiplier("main-menu", 2.9)) end
local function mud_sound() return sound_variations("__base__/sound/walking/decorative-mud", 10, 0.3, volume_multiplier("main-menu", 2.9)) end
local function carpet_sound() return sound_variations("__base__/sound/walking/grass", 10, 0.8, volume_multiplier("main-menu", 2.9)) end
local function bark_sound() return sound_variations("__base__/sound/walking/dirt-1", 10, 0.8, volume_multiplier("main-menu", 2.9)) end
local function rock_sound() return sound_variations("__base__/sound/walking/concrete", 11, 0.5) end


local function lowland_tile_variations_template_with_transitions_and_puddle_transitions(high_res_picture, options)
  local result = tile_variations_template_with_transitions(high_res_picture, options)

  if result.transition then
    result.transition.auxiliary_effect_mask_layout =
    {
      spritesheet = "__base__/graphics/terrain/masks/transition-1.png",
      scale = 0.5,
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 1,
      o_transition_count = 1,
      u_transition_line_length = 1,
      o_transition_line_length = 2,
      inner_corner_x = 0,
      outer_corner_x = 576,
      side_x = 1152,
      u_transition_x = 1728,
      o_transition_x = 2304
    }
  end

  return result
end

data:extend({
  {
    type = "tile",
    name = "artificial-yumako-soil",
    order = "d[yumako]-d[artificial-yumako-soil]",
    subgroup = "gleba-tiles",
    minable = {mining_time = 0.5, result = "artificial-yumako-soil"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = gleba_tile_offset + 22,
    searchable = true,

    transitions = data.raw["tile"]["landfill"].transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    sprite_usage_surface = "gleba",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/artificial-yumako-soil.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = semi_wet_sound,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = wetland_driving_sound,
    build_sound = data.raw["tile"]["landfill"].build_sound,
    map_color={204, 183, 6},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  },
  {
    type = "tile",
    name = "overgrowth-yumako-soil",
    order = "d[yumako]-e[overgrowth-yumako-soil]",
    subgroup = "gleba-tiles",
    minable = {mining_time = 0.5, result = "overgrowth-yumako-soil"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = gleba_tile_offset + 24,
    searchable = true,

    transitions = data.raw["tile"]["landfill"].transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    sprite_usage_surface = "gleba",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/overgrowth-yumako-soil.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = semi_wet_sound,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = wetland_driving_sound,
    build_sound = data.raw["tile"]["landfill"].build_sound,
    map_color={204, 183, 6},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  },
  {
    type = "tile",
    name = "artificial-jellynut-soil",
    order = "e[jellynut]-c[artificial-jellynut-soil]",
    subgroup = "gleba-tiles",
    minable = {mining_time = 0.5, result = "artificial-jellynut-soil"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = gleba_tile_offset + 23,
    searchable = true,

    transitions = data.raw["tile"]["landfill"].transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    sprite_usage_surface = "gleba",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/artificial-jellynut-soil.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = semi_wet_sound,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = wetland_driving_sound,
    build_sound = data.raw["tile"]["landfill"].build_sound,
    map_color={204, 6, 183},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  },
  {
    type = "tile",
    name = "overgrowth-jellynut-soil",
    order = "e[jellynut]-d[overgrowth-jellynut-soil]",
    subgroup = "gleba-tiles",
    minable = {mining_time = 0.5, result = "overgrowth-jellynut-soil"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = gleba_tile_offset + 25,
    searchable = true,

    transitions = data.raw["tile"]["landfill"].transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    sprite_usage_surface = "gleba",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/overgrowth-jellynut-soil.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = semi_wet_sound,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = wetland_driving_sound,
    build_sound = data.raw["tile"]["landfill"].build_sound,
    map_color={204, 6, 183},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  },
  {
    type = "tile",
    name = "natural-yumako-soil",
    order = "d[yumako]-c[natural-yumako-soil]",
    subgroup = "gleba-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "gleba_fertile_solid * 50000 - 40000 - gleba_biome_mask_green * 1000000"},
    layer_group = "ground-natural",
    layer = gleba_tile_offset + 20,
    searchable = true,

    transitions = lava_stone_transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    sprite_usage_surface = "gleba",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/natural-yumako-soil.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = semi_wet_sound,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    build_sound = data.raw["tile"]["landfill"].build_sound,
    map_color={185, 166, 5},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  },
  {
    type = "tile",
    name = "natural-jellynut-soil",
    order = "e[jellynut]-b[natural-jellynut-soil]",
    subgroup = "gleba-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "gleba_fertile_solid * 50000 - 40000 - gleba_biome_mask_red * 1000000"},
    layer_group = "ground-natural",
    layer = gleba_tile_offset + 21,
    searchable = true,

    transitions = lava_stone_transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    --[[variants =
    {
      transition = tile_graphics.generic_masked_tile_transitions1,

      material_background =
      {
        picture = "__space-age__/graphics/terrain/natural-jellynut-soil.png",
        count = 8,
        scale = 0.5
      }
    },]]
    sprite_usage_surface = "gleba",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/natural-jellynut-soil.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = semi_wet_sound,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    build_sound = data.raw["tile"]["landfill"].build_sound,
    map_color={185, 5, 166},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  }
})

data:extend({
  ---- LAND
    ---- Lowland
      ----------- Olive Blubber
      {
        type = "tile",
        name = "lowland-olive-blubber",
        order = "c[gleba-land-tiles]-a[lowland-olive-blubber]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = gleba_lowland_tile_offset+4,
        lowland_fog = true,
        effect = "wetland-green-puddle",
        effect_is_opaque = false,
        effect_color = {50,66,66},
        effect_color_secondary = { 49, 80, 14 },
        sprite_usage_surface = "gleba",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__space-age__/graphics/terrain/gleba/lowland-olive-blubber.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0, 0.4, 0.005, 0, 1) + 0.1 * gleba_select(gleba_temperature_normalised, 0.3, 0.8, 0.005, 0, 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = semi_wet_sound,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={66, 82, 11},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-olive-blubber-2", -- weird
        order = "c[gleba-land-tiles]-a[lowland-olive-blubber]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = gleba_lowland_tile_offset+3,
        lowland_fog = true,
        effect = "wetland-green-puddle",
        effect_is_opaque = false,
        effect_color = {50,66,66},
        effect_color_secondary = { 49, 80, 14 },
        sprite_usage_surface = "gleba",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__space-age__/graphics/terrain/gleba/lowland-olive-blubber-2.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0, 0.2, 0.005, 0, 1) + 0.1 * gleba_select(gleba_temperature_normalised, 0, 0.4, 0.005, 0, 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = semi_wet_sound,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={66, 82, 11},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-olive-blubber-3", -- bright
        order = "c[gleba-land-tiles]-a[lowland-olive-blubber]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = gleba_lowland_tile_offset+8,
        lowland_fog = true,
        effect = "wetland-green-puddle",
        effect_is_opaque = false,
        effect_color = {50,66,66},
        effect_color_secondary = { 49, 80, 14 },
        sprite_usage_surface = "gleba",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__space-age__/graphics/terrain/gleba/lowland-olive-blubber-3.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0, 0.4, 0.005, 0, 1) + 0.1 * gleba_select(gleba_temperature_normalised, 0.8, 1, 0.005, 0, 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = semi_wet_sound,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={66, 82, 11},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-brown-blubber",
        order = "c[gleba-land-tiles]-a[lowland-brown-blubber]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = gleba_lowland_tile_offset+1,
        lowland_fog = true,
        effect = "wetland-green-puddle",
        effect_is_opaque = false,
        effect_color = {50,66,66},
        effect_color_secondary = { 49, 80, 14 },
        sprite_usage_surface = "gleba",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__space-age__/graphics/terrain/gleba/lowland-brown-blubber.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0, 0.4, 0.005, 0, 1) + 0.1 * (gleba_plants_noise_b - 0.8)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = semi_wet_sound,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={66, 82, 11},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-pale-green",
        order = "c[gleba-land-tiles]-a[lowland-olive-blubber]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = gleba_lowland_tile_offset+2,
        lowland_fog = true,
        effect = "wetland-green-puddle",
        effect_is_opaque = false,
        effect_color = {50,66,66},
        effect_color_secondary = { 49, 80, 14 },
        sprite_usage_surface = "gleba",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__space-age__/graphics/terrain/gleba/lowland-pale-green.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.2, 0.4, 0.005, 0, 1) + 0.1 * gleba_select(gleba_temperature_normalised, 0, 0.3, 0.005, 0, 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = semi_wet_sound,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={66, 82, 11},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      ----------- Cauliflower
      {
        type = "tile",
        name = "lowland-cream-cauliflower-2",
        order = "c[gleba-land-tiles]-a[lowland-cream-cauliflower]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.3, 0.45, 0.005, 0, 1) + 0.1 * gleba_select(gleba_temperature_normalised, -0.2, 1, 0.005, 0, 1)"},
        layer_group = "water-overlay",
        layer = gleba_lowland_tile_offset+7,
        lowland_fog = true,
        effect = "wetland-grey-puddle",
        effect_is_opaque = false,
        effect_color = { 76, 70, 79 },
        effect_color_secondary = { 76, 70, 79 },
        sprite_usage_surface = "gleba",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__space-age__/graphics/terrain/gleba/cauliflower-mold-2.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = {lava_to_out_of_map_transition},
        transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
            walking_sound = semi_wet_sound,
            landing_steps_sound = tile_sounds.landing.semi_wet,
            map_color={95, 93, 88},
            walking_speed_modifier = 1,
            vehicle_friction_modifier = 1,
            absorptions_per_second = tile_pollution.gleba,
            trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-cream-cauliflower",
        order = "c[gleba-land-tiles]-a[lowland-cream-cauliflower]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.45, 0.65, 0.005, 0, 1) + 0.1 * gleba_select(gleba_temperature_normalised, -0.2, 1, 0.005, 0, 1)"},
        layer_group = "water-overlay",
        layer = gleba_lowland_tile_offset+8,
        lowland_fog = true,
        effect = "wetland-grey-puddle",
        effect_is_opaque = false,
        effect_color = { 76, 70, 79 },
        effect_color_secondary = { 76, 70, 79 },
        sprite_usage_surface = "gleba",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__space-age__/graphics/terrain/gleba/cauliflower-mold.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = semi_wet_sound,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={95, 93, 88},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-dead-skin",
        order = "c[gleba-land-tiles]-a[lowland-cream-cauliflower]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.45, 0.65, 0.005, 0, 1) + 0.1 * gleba_select(gleba_temperature_normalised, -1, -0.2, 0.005, 0, 1)"},
        layer_group = "water-overlay",
        layer = gleba_lowland_tile_offset+5,
        lowland_fog = true,
        effect = "wetland-grey-puddle",
        effect_is_opaque = false,
        effect_color = { 76, 70, 79 },
        effect_color_secondary = { 76, 70, 79 },
        sprite_usage_surface = "gleba",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__space-age__/graphics/terrain/gleba/lowland-dead-skin.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = semi_wet_sound,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={95, 93, 88},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-dead-skin-2",
        order = "c[gleba-land-tiles]-a[lowland-cream-cauliflower]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.3, 0.45, 0.005, 0, 1) + 0.1 * gleba_select(gleba_temperature_normalised, -1, -0.2, 0.005, 0, 1)"},
        layer_group = "water-overlay",
        layer = gleba_lowland_tile_offset+6,
        lowland_fog = true,
        effect = "wetland-grey-puddle",
        effect_is_opaque = false,
        effect_color = { 76, 70, 79 },
        effect_color_secondary = { 76, 70, 79 },
        sprite_usage_surface = "gleba",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__space-age__/graphics/terrain/gleba/lowland-dead-skin-2.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = semi_wet_sound,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={95, 93, 88},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-cream-red",
        order = "c[gleba-land-tiles]-a[lowland-cream-red]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.62, 0.77, 0.005, 0, 1) * gleba_select(gleba_temperature_normalised, 0.25, 1, 0.005, 0, 1)"},
        layer_group = "water-overlay",
        layer = gleba_lowland_tile_offset+11,
        lowland_fog = true,
        effect = "wetland-grey-puddle",
        effect_is_opaque = false,
        effect_color = { 76, 70, 79 },
        effect_color_secondary = { 76, 70, 79 },
        sprite_usage_surface = "gleba",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__space-age__/graphics/terrain/gleba/lowland-cream-red.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = semi_wet_sound,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={95, 83, 78},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      ----------- Red vein
      {
        type = "tile",
        name = "lowland-red-vein-2", -- bulges
        order = "c[gleba-land-tiles]-a[lowland-red-vein]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = gleba_lowland_tile_offset+12,
        lowland_fog = true,
        effect = "wetland-pink-puddle",
        effect_is_opaque = false,
        effect_color = { 92, 56, 68 },
        effect_color_secondary = { 49, 80, 14 },
        sprite_usage_surface = "gleba",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__space-age__/graphics/terrain/gleba/lowland-red-vein-2.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.75, 1, 0.005, 0, 1) + 0.1 * (gleba_plants_noise_b - 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = semi_wet_sound,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={115, 53, 66},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-red-vein", -- sanguine
        order = "c[gleba-land-tiles]-a[lowland-red-vein]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = gleba_lowland_tile_offset+13,
        lowland_fog = true,
        effect = "wetland-pink-puddle",
        effect_is_opaque = false,
        effect_color = { 92, 56, 68 },
        effect_color_secondary = { 49, 80, 14 },
        sprite_usage_surface = "gleba",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__space-age__/graphics/terrain/gleba/lowland-red-vein.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.7, 1, 0.005, 0, 1) * gleba_select(gleba_temperature_normalised, 0.45, 0.75, 0.005, 0, 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = semi_wet_sound,
        landing_steps_sound = tile_sounds.landing.rock,
        map_color={115, 53, 66},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-red-vein-3", -- dull
        order = "c[gleba-land-tiles]-a[lowland-red-vein]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = gleba_lowland_tile_offset+14,
        effect = "wetland-pink-puddle",
        effect_is_opaque = false,
        effect_color = { 92, 56, 68 },
        effect_color_secondary = { 49, 80, 14 },
        sprite_usage_surface = "gleba",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__space-age__/graphics/terrain/gleba/lowland-red-vein-3.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.7, 1, 0.005, 0, 1) * gleba_select(gleba_temperature_normalised, 0.25, 0.45, 0.005, 0, 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = semi_wet_sound,
        map_color={115, 53, 66},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-red-vein-4", -- bright
        order = "c[gleba-land-tiles]-a[lowland-red-vein]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = gleba_lowland_tile_offset+15,
        effect = "wetland-pink-puddle",
        effect_is_opaque = false,
        effect_color = { 92, 56, 68 },
        effect_color_secondary = { 49, 80, 14 },
        sprite_usage_surface = "gleba",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__space-age__/graphics/terrain/gleba/lowland-red-vein-4.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.7, 1, 0.005, 0, 1) * gleba_select(gleba_temperature_normalised, 0.75, 1, 0.005, 0, 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = semi_wet_sound,
        map_color={115, 53, 66},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-red-vein-dead",
        order = "c[gleba-land-tiles]-a[lowland-red-vein]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = gleba_lowland_tile_offset+7,
        lowland_fog = true,
        effect = "wetland-pink-puddle",
        effect_is_opaque = false,
        effect_color = { 92, 56, 68 },
        effect_color_secondary = { 49, 80, 14 },
        sprite_usage_surface = "gleba",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__space-age__/graphics/terrain/gleba/lowland-red-vein-dead.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.6, 1, 0.005, 0, 1) * gleba_select(gleba_temperature_normalised, 0, 0.25, 0.005, 0, 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = semi_wet_sound,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={115, 53, 66},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-red-infection",
        order = "c[gleba-land-tiles]-a[lowland-red-vein]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = gleba_lowland_tile_offset+16,
        effect = "wetland-pink-puddle",
        effect_is_opaque = false,
        effect_color = { 92, 56, 68 },
        effect_color_secondary = { 49, 80, 14 },
        sprite_usage_surface = "gleba",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__space-age__/graphics/terrain/gleba/lowland-red-infection.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.7, 1, 0.05, 0, 1) + 0.1 * (gleba_plants_noise - 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = semi_wet_sound,
        map_color={115, 53, 66},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
    ---- MidLand
      ----------- Cracked
      {
        type = "tile",
        name = "midland-cracked-lichen",
        order = "c[gleba-land-tiles]-a[midland-yellow-crust]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "ground-natural",
        layer = gleba_tile_offset + 8,
        autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0.55, 0.65, 0.15, 0, 1) - 0.2 * gleba_temperature_normalised"},
        sprite_usage_surface = "gleba",
        variants = tile_variations_template_with_transitions(
          "__space-age__/graphics/terrain/gleba/cracked-lichen.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = bark_sound(),
        landing_steps_sound = tile_sounds.landing.bark,
        map_color={81, 77, 44},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "midland-cracked-lichen-dull",
        order = "c[gleba-land-tiles]-a[midland-yellow-crust]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "ground-natural",
        layer = gleba_tile_offset + 9,
        autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0.45, 0.55, 0.15, 0, 1) + 0.2 * gleba_temperature_normalised"},
        sprite_usage_surface = "gleba",
        variants = tile_variations_template_with_transitions(
          "__space-age__/graphics/terrain/gleba/cracked-lichen-dull.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = bark_sound(),
        landing_steps_sound = tile_sounds.landing.bark,
        map_color={71, 67, 40},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "midland-cracked-lichen-dark",
        order = "c[gleba-land-tiles]-a[midland-yellow-crust]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "ground-natural",
        layer = gleba_tile_offset,
        autoplace = {probability_expression = "max(1.08 * gleba_midland * gleba_select(gleba_aux, 0, 0.55, 0.1, 0, 1), 1.15 * gleba_highland) + 0.3 * (gleba_plants_noise_b - 0.7)"},
        sprite_usage_surface = "gleba",
        variants = tile_variations_template_with_transitions(
          "__space-age__/graphics/terrain/gleba/cracked-lichen-dark.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = bark_sound(),
        landing_steps_sound = tile_sounds.landing.bark,
        map_color={61, 57, 30},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      ----------- Turqoise Bark
      {
        type = "tile",
        name = "midland-turquoise-bark-2",
        order = "c[gleba-land-tiles]-a[midland-turquoise-bark]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer = gleba_tile_offset + 10,
        sprite_usage_surface = "gleba",
        variants = tile_variations_template_with_transitions(
          "__space-age__/graphics/terrain/gleba/midland-turquoise-bark-2.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0.05, 0.4, 0.2, 0, 1) - 0.2 * gleba_temperature_normalised"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = soft_bark_sound,
        landing_steps_sound = tile_sounds.landing.bark,
        map_color={46, 68, 48},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "midland-turquoise-bark",
        order = "c[gleba-land-tiles]-a[midland-turquoise-bark]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer = gleba_tile_offset + 11,
        sprite_usage_surface = "gleba",
        variants = tile_variations_template_with_transitions(
          "__space-age__/graphics/terrain/gleba/midland-turquoise-bark.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0, 0.35, 0.2, 0, 1) + 0.2 * gleba_temperature_normalised"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = soft_bark_sound,
        landing_steps_sound = tile_sounds.landing.bark,
        map_color={46, 68, 48},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      ----------- Starburst
      {
        type = "tile",
        name = "midland-yellow-crust-3", -- beige
        order = "c[gleba-land-tiles]-a[midland-yellow-crust]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "ground-natural",
        layer = gleba_tile_offset + 12,
        autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0.65, 1, 0.1, 0, 1)"},
        sprite_usage_surface = "gleba",
        variants = tile_variations_template_with_transitions(
          "__space-age__/graphics/terrain/gleba/starburst-lichen-3.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = dry_rock_sound,
        landing_steps_sound = tile_sounds.landing.rock,
        map_color={114, 86, 40},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "midland-yellow-crust-2", -- red
        order = "c[gleba-land-tiles]-a[midland-yellow-crust]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "ground-natural",
        layer = gleba_tile_offset + 13,
        autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0.8, 1, 0.15, 0, 1) * (0.93 + 0.1 * gleba_select(gleba_moisture, 0.5, 0.5, 0.25, 0, 1) - 0.1 * gleba_temperature_normalised)"},
        sprite_usage_surface = "gleba",
        variants = tile_variations_template_with_transitions(
          "__space-age__/graphics/terrain/gleba/starburst-lichen-2.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = dry_rock_sound,
        landing_steps_sound = tile_sounds.landing.rock,
        map_color={114, 86, 40},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "midland-yellow-crust", -- main
        order = "c[gleba-land-tiles]-a[midland-yellow-crust]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "ground-natural",
        layer = gleba_tile_offset + 14,
        autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0.7, 1, 0.1, 0, 1) * (1 + 0.1 * (gleba_aux - 0.75) + 0.05 * gleba_plants_noise_b)"},
        sprite_usage_surface = "gleba",
        variants = tile_variations_template_with_transitions(
          "__space-age__/graphics/terrain/gleba/starburst-lichen.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = dry_rock_sound,
        landing_steps_sound = tile_sounds.landing.rock,
        map_color={114, 86, 40},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "midland-yellow-crust-4", -- yellow
        order = "c[gleba-land-tiles]-a[midland-yellow-crust]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "ground-natural",
        layer = gleba_tile_offset + 15,
        autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0.8, 1, 0.15, 0, 1) * (0.9 + 0.1 * gleba_select(gleba_moisture, 0.25, 0.25, 0.25, 0, 1) + 0.1 * gleba_temperature_normalised)"},
        sprite_usage_surface = "gleba",
        variants = tile_variations_template_with_transitions(
          "__space-age__/graphics/terrain/gleba/starburst-lichen-4.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = dry_rock_sound,
        landing_steps_sound = tile_sounds.landing.rock,
        map_color={114, 86, 40},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.gleba,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },


    ---- Highland
     ----------- Grey Rock
    {
      type = "tile",
      name = "highland-dark-rock",
      order = "c[gleba-land-tiles]-a[highland-dark-rock]",
      subgroup = "gleba-tiles",
      collision_mask = tile_collision_masks.ground(),
      layer = gleba_tile_offset + 16,
      sprite_usage_surface = "gleba",
      variants = tile_variations_template_with_transitions(
        "__space-age__/graphics/terrain/gleba/highland-dark-rock.png",
        {
          max_size = 4,
          [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
          [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
          [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
          --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
        }
      ),
      autoplace = {probability_expression = "gleba_highland * max(0, 1.05 + 0.1 * (1 - gleba_aux) + 0.2 * gleba_temperature_normalised)"},
      transitions = lava_stone_transitions,
      transitions_between_transitions = lava_stone_transitions_between_transitions,
      walking_sound = dry_rock_sound,
      landing_steps_sound = tile_sounds.landing.rock,
      map_color={52, 55, 48},
      walking_speed_modifier = 1,
      vehicle_friction_modifier = 1,
      absorptions_per_second = tile_pollution.gleba,
      trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
    },
    {
      type = "tile",
      name = "highland-dark-rock-2",
      order = "c[gleba-land-tiles]-a[highland-dark-rock]",
      subgroup = "gleba-tiles",
      collision_mask = tile_collision_masks.ground(),
      layer = gleba_tile_offset + 17,
      sprite_usage_surface = "gleba",
      variants = tile_variations_template_with_transitions(
        "__space-age__/graphics/terrain/gleba/highland-dark-rock-2.png",
        {
          max_size = 4,
          [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
          [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
          [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
          --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
        }
      ),
      autoplace = {probability_expression = "gleba_highland * max(0, 1.13 + 0.1 * (min(gleba_aux + 0.1, 1-gleba_aux)))"},
      transitions = lava_stone_transitions,
      transitions_between_transitions = lava_stone_transitions_between_transitions,
      walking_sound = dry_rock_sound,
      landing_steps_sound = tile_sounds.landing.rock,
      map_color={52, 55, 48},
      walking_speed_modifier = 1,
      vehicle_friction_modifier = 1,
      absorptions_per_second = tile_pollution.gleba,
      trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
    },
    {
      type = "tile",
      name = "highland-yellow-rock",
      order = "c[gleba-land-tiles]-a[highland-yellow-rock]",
      subgroup = "gleba-tiles",
      collision_mask = tile_collision_masks.ground(),
      layer = gleba_tile_offset + 18,
      sprite_usage_surface = "gleba",
      variants = tile_variations_template_with_transitions(
        "__space-age__/graphics/terrain/gleba/highland-yellow-rock.png",
        {
          max_size = 4,
          [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
          [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
          [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
          --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
        }
      ),
      autoplace = {probability_expression = "gleba_highland * max(0, 1 + 0.1 * gleba_aux - 0.2 * gleba_temperature_normalised)"},
      transitions = lava_stone_transitions,
      transitions_between_transitions = lava_stone_transitions_between_transitions,
      walking_sound = dry_rock_sound,
      landing_steps_sound = tile_sounds.landing.rock,
      map_color={52, 55, 48},
      walking_speed_modifier = 1,
      vehicle_friction_modifier = 1,
      absorptions_per_second = tile_pollution.gleba,
      trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
    },
    {
      type = "tile",
      name = "pit-rock",
      order = "c[gleba-land-tiles]-a[highland-dark-rock]",
      subgroup = "gleba-tiles",
      collision_mask = tile_collision_masks.ground(),
      layer = gleba_tile_offset - 1,
      sprite_usage_surface = "gleba",
      variants = tile_variations_template_with_transitions(
        "__space-age__/graphics/terrain/gleba/pit-rock.png",
        {
          max_size = 4,
          [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
          [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
          [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
          --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
        }
      ),
      autoplace =
      {
        probability_expression = "2 * gleba_rockpools_pitrock"
      },
      transitions = lava_stone_transitions,
      transitions_between_transitions = lava_stone_transitions_between_transitions,
      walking_sound = dry_rock_sound,
      landing_steps_sound = tile_sounds.landing.rock,
      map_color = {r = tile_lightening+22, g = tile_lightening+22, b = tile_lightening+30},
      walking_speed_modifier = 1,
      vehicle_friction_modifier = 1,
      absorptions_per_second = tile_pollution.gleba,
      trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
    }
})

table.insert(water_tile_type_names, "wetland-light-dead-skin")
table.insert(water_tile_type_names, "wetland-dead-skin")
table.insert(water_tile_type_names, "wetland-light-green-slime")
table.insert(water_tile_type_names, "wetland-green-slime")
table.insert(water_tile_type_names, "wetland-pink-tentacle")
table.insert(water_tile_type_names, "wetland-red-tentacle")
table.insert(water_tile_type_names, "wetland-blue-slime")
table.insert(water_tile_type_names, "wetland-yumako")
table.insert(water_tile_type_names, "wetland-jellynut")
table.insert(water_tile_type_names, "gleba-deep-lake")


data:extend({
  {
    type = "tile",
    name = "wetland-yumako",
    icon = "__space-age__/graphics/icons/wetland-yumako.png",
    order = "c[resource]-a[wetland-yumako]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_fertile_spots_coastal * 5000 * (1 - gleba_biome_mask_green) * gleba_above_deep_water_mask"},
    default_cover_tile = "landfill",
    lowland_fog = true,
    effect = "wetland-green",
    fluid = "water",
    effect_color = { 126, 118, 37 },
    effect_color_secondary = { 117, 110, 38 },
    --    effect_color = { 40*2, 38*2, 25 },
    -- effect_color_secondary = {77*2, 72*2, 52},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer_group = "water-overlay",
    layer = 3,
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-dead-skin.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    map_color={132, 119, 7},
    absorptions_per_second = tile_pollution.gleba,

    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,

    walking_sound = water_sound(),
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = wetland_driving_sound,
    trigger_effect = tile_trigger_effects.water_mud_trigger_effect(),
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/insects-deep-mud", 8, 0.4),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 8
    }
  },
  {
    type = "tile",
    name = "wetland-jellynut",
    icon = "__space-age__/graphics/icons/wetland-jellynut.png",
    order = "c[resource]-b[wetland-jellynut]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_fertile_spots_coastal * 5000 * (1 - gleba_biome_mask_red) * gleba_above_deep_water_mask"},
    default_cover_tile = "landfill",
    fluid = "water",
    lowland_fog = true,
    effect = "wetland-purple",
    effect_color = { 58, 25, 61 },
    effect_color_secondary = { 91, 45, 88 },
    --effect_color = { 40*1.5, 38, 25*2 },
    --effect_color_secondary = {77*1.5, 72, 52*2},
    layer_group = "water-overlay",
    particle_tints = tile_graphics.gleba_mud_water_particle_tints,
    layer_group = "water",
    layer = 3,
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-purple-tentacle.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    map_color={132, 7, 119},
    absorptions_per_second = tile_pollution.gleba,

    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,

    walking_sound = water_sound(),
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = wetland_driving_sound,
    trigger_effect = tile_trigger_effects.water_mud_trigger_effect(),
    ambient_sounds =
    {
      {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/insects-deep-mud", 8, 0.4 ),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 8
      },
      {
        sound =
          {
            variations = sound_variations("__space-age__/sound/world/tiles/night-frogs", 10, 0.3),
            advanced_volume_control =
            {
              fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}},
              darkness_threshold = 0.85
            }
          },
          min_entity_count = 20,
          max_entity_count = 25,
          entity_to_sound_ratio = 0.1,
          average_pause_seconds = 8,
      }
    }
  },
  {
    type = "tile",
    name = "wetland-dead-skin",
    order = "b[wetland]-d[wetland-dead-skin]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_aux_2 + 2 * min(gleba_select(gleba_aux, 0.3, 0.7, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "wetland-grey",
    --effect_color = { 76, 70, 79 },
    --effect_color_secondary = { 76, 70, 79 },
    effect_color = { 57, 58, 73 },
    effect_color_secondary = { 76, 70, 79 },
    map_color = {r = 46, g = 45, b = 51},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 7,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-dead-skin.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = wetland_sound,
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = wetland_driving_sound,
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    ambient_sounds =
    {
      {
      sound =
        {
          variations = sound_variations("__space-age__/sound/world/tiles/insects-deep-mud", 8, 0.4),
          advanced_volume_control =
          {
            fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
          }
        },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 15,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 3
    },
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/night-insects", 10, 0.3),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}},
          darkness_threshold = 0.85
        }
      },
      min_entity_count = 10,
      max_entity_count = 15,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 5,
      }
    },
  },
  {
    type = "tile",
    name = "wetland-light-dead-skin",
    order = "b[wetland]-c[wetland-light-dead-skin]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_edge_aux_2 + 2 * min(gleba_select(gleba_aux, 0.3, 0.7, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "wetland-grey",
    effect_color = { 78, 75, 86 },
    effect_color_secondary = { 76, 70, 79 },
    map_color = {r = 51, g = 50, b = 56},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 7,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-dead-skin.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = wetland_sound,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = wetland_driving_sound,
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    ambient_sounds =
    {
      {
      sound =
        {
          variations = sound_variations("__space-age__/sound/world/tiles/insects-deep-mud", 8, 0.4),
          advanced_volume_control =
          {
            fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
          }
        },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 15,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 3
    },
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/night-insects", 10, 0.3),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}},
          darkness_threshold = 0.85
        }
      },
      min_entity_count = 10,
      max_entity_count = 15,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 5,
      }
    },
  },
  {
    type = "tile",
    name = "wetland-green-slime",
    order = "b[wetland]-b[wetland-green-slime]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_aux_1 + 2 * min(gleba_select(gleba_aux, 0, 0.3, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "wetland-green",
    --effect_color = {50,66,66},
    --effect_color_secondary = { 49, 80, 14 },
    effect_color = {40,56,71},
    effect_color_secondary = { 39, 70, 24 },
    map_color = {25, 53, 25},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 6,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-green-slime.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = slime_sound,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = wetland_driving_sound,
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    ambient_sounds =
    {
      {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/insects-deep-mud", 8, 0.4),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 15,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 3,
    },
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/night-frogs", 10, 0.3),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}},
          darkness_threshold = 0.85
        }
      },
      min_entity_count = 20,
      max_entity_count = 25,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 8,
    }
    }
  },
  {
    type = "tile",
    name = "wetland-light-green-slime",
    order = "b[wetland]-a[wetland-light-green-slime]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_edge_aux_1 + 2 * min(gleba_select(gleba_aux, 0, 0.3, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "wetland-green",
    effect_color = {50,66,66},
    effect_color_secondary = { 49, 80, 14 },
    map_color = {35, 63, 35},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 6,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-green-slime.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = slime_sound,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = wetland_driving_sound,
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    ambient_sounds =
    {
      {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/insects-deep-mud", 8, 0.4),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 15,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 3,
    },
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/night-frogs", 10, 0.3),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}},
          darkness_threshold = 0.85
        }
      },
      min_entity_count = 20,
      max_entity_count = 25,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 8,
    }
    }
  },
  {
    type = "tile",
    name = "wetland-red-tentacle",
    order = "b[wetland]-f[wetland-red-tentacle]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_aux_3 + 2 * min(gleba_select(gleba_aux, 0.7, 2, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "wetland-pink",
    --effect_color = { 92, 54, 64 },
    --effect_color_secondary = { 49, 80, 14 },
    effect_color = { 72, 45, 62 },
    effect_color_secondary = { 49, 80, 14 },
    map_color = { 54, 15, 24 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 5,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-purple-tentacle.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = wetland_sound,
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = wetland_driving_sound,
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/insects-deep-mud", 8, 0.4),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 15,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 3
    }
  },
  {
    type = "tile",
    name = "wetland-pink-tentacle",
    order = "b[wetland]-e[wetland-pink-tentacle]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_edge_aux_3"},
    lowland_fog = true,
    effect = "wetland-pink",
    effect_color = { 98, 58, 72 },
    effect_color_secondary = { 60, 60, 40 },
    map_color = { 64, 19, 34 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 5,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-purple-tentacle.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = wetland_sound,
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = wetland_driving_sound,
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/insects-deep-mud", 8, 0.4),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 15,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 3
    }
  },
  {
    type = "tile",
    name = "wetland-blue-slime",
    order = "b[wetland]-a[wetland-blue-slime]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "6 * gleba_select(gleba_elevation, gleba_deep_water_level, -4, 0.5, 0, 1) + 5 * gleba_rockpools_bluewater"},
    lowland_fog = true,
    effect = "wetland-blue-slime",
    effect_color = {45,66,74},
    effect_color_secondary = { 49, 80, 14 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 1,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/water/water1.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      empty_transitions=true,
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = sound_variations("__base__/sound/walking/shallow-water", 7, 1),
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = wetland_driving_sound,
    map_color = {25,49,58},
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = tile_pollution.gleba,
    ambient_sounds = lake_ambience
  },
  {
    type = "tile",
    name = "gleba-deep-lake",
    order = "a[deep]",
    subgroup = "gleba-water-tiles",
    collision_mask =  tile_collision_masks.water(),
    autoplace = {probability_expression = "10 * gleba_select(elevation, -500, gleba_deep_water_level, 0.5, 0, 1) + 10 * gleba_rockpools_deepwater"},
    lowland_fog = false,
    effect = "wetland-blue-slime",
    effect_color = {31,51,60},
    effect_color_secondary = { 49, 80, 14 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 1,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
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
      empty_transitions=true,
   },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = sound_variations("__base__/sound/walking/shallow-water", 7, 1),
    landing_steps_sound = tile_sounds.landing.wet,
    map_color = {18,37,51},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = tile_pollution.gleba,
    ambient_sounds = lake_ambience
  }
})

data:extend({
  {
    type = "tile-effect",
    name = "wetland-grey",
    shader = "water",
    water =
    {
      shader_variation = "wetland-water",
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/gleba/watercaustics.png",
          width = 512,
          height = 512
        },
        {
          filename = "__space-age__/graphics/terrain/gleba/wetland-dead-skin-shader.png",
          width = 512 * 4,
          height = 512 * 2
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,


      animation_speed = 1.5,
      animation_scale = { 0.8, 0.8 },
      tick_scale = 6,

      specular_lightness = { 11, 26, 5 },
      foam_color = { 21, 4, 4 },
      foam_color_multiplier = 1,

      dark_threshold = { 0.3, 0.3 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.1, 0.25 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16,
    }
  },
  {
    type = "tile-effect",
    name = "wetland-green",
    shader = "water",
    water =
    {
      shader_variation = "wetland-water",
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/gleba/watercaustics.png",
          width = 512,
          height = 512
        },
        {
          filename = "__space-age__/graphics/terrain/gleba/wetland-green-slime-shader.png",
          width = 512 * 4,
          height = 512 * 2
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,


      animation_speed = 1.5,
      animation_scale = { 0.8, 0.8 },
      tick_scale = 6,

      specular_lightness = { 11, 26, 5 },
      foam_color = { 21, 4, 4 },
      foam_color_multiplier = 1,

      dark_threshold = { 0.1, 0.1 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.1, 0.25 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16,
    }
  },
  {
    type = "tile-effect",
    name = "wetland-pink",
    shader = "water",
    water =
    {
      shader_variation = "wetland-water",
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/gleba/watercaustics.png",
          width = 512,
          height = 512
        },
        {
          filename = "__space-age__/graphics/terrain/gleba/wetland-pink-tentacle-shader.png",
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
      tick_scale = 6,

      specular_lightness = { 11, 26, 5 },
      foam_color = { 21, 4, 4 },
      foam_color_multiplier = 1,

      dark_threshold = { 0.1, 0.1 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.1, 0.25 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16,
    }
  },
  {
    type = "tile-effect",
    name = "wetland-purple",
    shader = "water",
    water =
    {
      shader_variation = "wetland-water",
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/gleba/watercaustics.png",
          width = 512,
          height = 512
        },
        {
          filename = "__space-age__/graphics/terrain/gleba/wetland-purple-tentacle-shader.png",
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
      tick_scale = 6,

      specular_lightness = { 11, 26, 5 },
      foam_color = { 21, 4, 4 },
      foam_color_multiplier = 1,

      dark_threshold = { 0.1, 0.1 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.1, 0.25 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16,
    }
  },
  {
    type = "tile-effect",
    name = "wetland-blue-slime",
    shader = "water",
    water =
    {
      shader_variation = "wetland-water",
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/gleba/watercaustics.png",
          width = 512,
          height = 512
        },
        {
          filename = "__space-age__/graphics/terrain/gleba/wetland-dead-skin-shader.png",
          width = 512 * 4,
          height = 512 * 2
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,


      animation_speed = 1.5,
      animation_scale = { 1.5, 1.5 },
      tick_scale = 6,

      specular_lightness = { 11, 26, 5 },
      foam_color = { 21, 4, 4 },
      foam_color_multiplier = 1,

      dark_threshold = { 0.6, 0.6 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.1, 0.25 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16,
    }
  },

  {
    type = "tile-effect",
    name = "wetland-green-puddle",
    shader = "puddle",
    puddle =
    {
      puddle_noise_texture =
      {
        filename = "__space-age__/graphics/terrain/gleba/puddle-noise.png",
        size = 512
      },
      water_effect = "wetland-green"
    }
  },
  {
    type = "tile-effect",
    name = "wetland-pink-puddle",
    shader = "puddle",
    puddle =
    {
      puddle_noise_texture =
      {
        filename = "__space-age__/graphics/terrain/gleba/puddle-noise.png",
        size = 512
      },
      water_effect = "wetland-purple"
    }
  },
  {
    type = "tile-effect",
    name = "wetland-grey-puddle",
    shader = "puddle",
    puddle =
    {
      puddle_noise_texture =
      {
        filename = "__space-age__/graphics/terrain/gleba/puddle-noise.png",
        size = 512
      },
      water_effect = "wetland-grey"
    }
  },
})

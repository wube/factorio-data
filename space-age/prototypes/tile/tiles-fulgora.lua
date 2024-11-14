local tile_trigger_effects = require("prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local stone_driving_sound =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-stone.ogg", volume = 0.8,
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
  },
  fade_ticks = 6
}

local oil_driving_sound =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-oil.ogg", volume = 0.6,
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

local uneven_stone_driving_sound =
{
  sound =
  {
    filename = "__space-age__/sound/driving/vehicle-surface-uneven-stone.ogg", volume = 0.8,
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
  },
  fade_ticks = 6
}

local metal_rock_driving_sound =
{
  sound =
    {
      filename = "__space-age__/sound/driving/vehicle-surface-metal-rock.ogg", volume = 0.6,
      advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}}
    },
    fade_ticks = 6,
}

local sand_ambient_sound =
{
  sound =
  {
    variations = sound_variations("__space-age__/sound/world/semi-persistent/sand-wind-gust", 5, 0.8),
    advanced_volume_control =
    {
      fades = {fade_in = {curve_type = "S-curve", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
    }
  },
  radius = 7.5,
  min_entity_count = 10,
  max_entity_count = 30,
  entity_to_sound_ratio = 0.1,
  average_pause_seconds = 15
}

table.insert(water_tile_type_names, "oil-ocean-shallow")
table.insert(water_tile_type_names, "oil-ocean-deep")


--[[
local fulgora_sand_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    background_layer_group = "water",
    background_layer_offset = -5,
    masked_background_layer_offset = 1,
    offset_background_layer_by_tile_layer = false,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/fulgora-sand.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_8_short,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__space-age__/graphics/terrain/effect-maps/water-fulgora-sand-mask.png",
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
]]
local fulgora_rock_sand_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    background_layer_group = "water",
    background_layer_offset = -5,
    masked_background_layer_offset = 1,
    offset_background_layer_by_tile_layer = false,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/fulgora-rock-slab-transition.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_8_short,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__space-age__/graphics/terrain/effect-maps/water-fulgora-sand-mask.png",
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
local fulgora_oil_sand_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    background_layer_group = "water",
    background_layer_offset = -5,
    masked_background_layer_offset = 1,
    offset_background_layer_by_tile_layer = false,
    spritesheet = "__space-age__/graphics/terrain/water-transitions/fulgora-oil-sand-transition.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_8_short,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__space-age__/graphics/terrain/effect-maps/water-fulgora-sand-mask.png",
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
local fulgora_sand_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/fulgora-sand-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0_only_u_tall,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__space-age__/graphics/terrain/effect-maps/water-fulgora-sand-to-land-mask.png",
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

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/fulgora-sand-out-of-map-transition.png",
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

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/fulgora-sand-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__space-age__/graphics/terrain/effect-maps/water-fulgora-sand-to-out-of-map-mask.png",
      o_transition_count = 0
    },
    background_mask_layout = tile_spritesheet_layout.simple_white_mask,
    water_patch = patch_for_inner_corner_of_transition_between_transition
  }
}

local function transition_masks()
  return {
    mask_spritesheet = "__base__/graphics/terrain/masks/transition-1.png",
    mask_layout =
    {
      scale = 0.5,
      inner_corner =
      {
        count = 8,
      },
      outer_corner =
      {
        count = 8,
        x = 64*9
      },
      side =
      {
        count = 8,
        x = 64*9*2
      },
      u_transition =
      {
        count = 1,
        x = 64*9*3
      },
      o_transition =
      {
        count = 1,
        x = 64*9*4
      }
    }
  }
end

data:extend
{
  {
    name = "fulgoran-dust",
    type = "tile",
    order = "b[natural]-a[dust]",
    subgroup = "fulgora-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {
      probability_expression = "fulgora_scrap_medium + max(0, fulgora_natural, 2 * fulgora_mesa * fulgora_pyramids) * 2 - 0.9 + fulgora_rock + fulgora_road_dust * fulgora_sprawl"
    },
    layer = 6,
    map_color={112, 65, 50},
    vehicle_friction_modifier = 4,
    absorptions_per_second = tile_pollution.fulgora,
    sprite_usage_surface = "fulgora",
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__space-age__/graphics/terrain/fulgoran-dust.png",
        line_length = 8,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 8,
      material_texture_height_in_tiles = 8
    },
    transitions = fulgora_rock_sand_transitions,
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = sound_variations("__space-age__/sound/walking/soft-sand", 9, 0.6, volume_multiplier("main-menu", 2.9)),
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    ambient_sounds = sand_ambient_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
  {
    name = "fulgoran-dunes",
    type = "tile",
    order = "b[natural]-b[dunes]",
    subgroup = "fulgora-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {
      probability_expression = "1 + fulgora_dunes"
    },
    layer = 7,
    map_color={125, 71, 59},
    vehicle_friction_modifier = 4,
    absorptions_per_second = tile_pollution.fulgora,
    sprite_usage_surface = "fulgora",
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__space-age__/graphics/terrain/fulgoran-dunes.png",
        line_length = 4,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 10,
      material_texture_height_in_tiles = 7
    },
    transitions = fulgora_rock_sand_transitions,
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = sound_variations("__base__/sound/walking/sand", 9, 0.8, volume_multiplier("main-menu", 2.9)),
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    ambient_sounds = sand_ambient_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
  {
    name = "fulgoran-sand",
    type = "tile",
    order = "b[natural]-c[sand]",
    subgroup = "fulgora-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {
      probability_expression = "1 - fulgora_dunes"
    },
    layer = 8,
    map_color={118, 68, 56},
    vehicle_friction_modifier = 4,
    absorptions_per_second = tile_pollution.fulgora,
    sprite_usage_surface = "fulgora",
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__space-age__/graphics/terrain/fulgoran-sand.png",
        line_length = 4,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 10,
      material_texture_height_in_tiles = 7
    },
    transitions = fulgora_rock_sand_transitions,
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = sound_variations("__base__/sound/walking/sand", 9, 0.8, volume_multiplier("main-menu", 2.9)),
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    ambient_sounds = sand_ambient_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
  {
    name = "fulgoran-rock",
    type = "tile",
    order = "b[natural]-d[rock]",
    subgroup = "fulgora-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {
      probability_expression = "0.8 + fulgora_rock * 2 - max(0, fulgora_mix_oil) * 6"
    },
    layer = 9,
    map_color={131, 85, 66},
    vehicle_friction_modifier = 4,
    absorptions_per_second = tile_pollution.fulgora,
    sprite_usage_surface = "fulgora",
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__space-age__/graphics/terrain/fulgoran-rock.png",
        line_length = 8,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 8,
      material_texture_height_in_tiles = 8
    },
    transitions = fulgora_rock_sand_transitions,
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = sound_variations("__space-age__/sound/walking/rocky-stone", 10, 0.8, volume_multiplier("main-menu", 2.9)),
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
  {
    name = "fulgoran-paving",
    type = "tile",
    order = "c[artificial]-b[paving]",
    subgroup = "fulgora-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = { probability_expression = "fulgora_tile_ruin_paving" },
    layer = 5,
    map_color={120, 94, 67},
    --map_color={125, 99, 72}, -- too close to rock
    --map_color={255, 255, 0},
    walking_speed_modifier = 1.3, -- same as stone path
    vehicle_friction_modifier = 1.1,
    absorptions_per_second = tile_pollution.fulgora,
    sprite_usage_surface = "fulgora",
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__space-age__/graphics/terrain/fulgoran-paving.png",
        line_length = 4,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 10,
      material_texture_height_in_tiles = 7
    },
    transitions = fulgora_rock_sand_transitions,
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = sound_variations("__space-age__/sound/walking/rugged-stone", 10, 0.8, volume_multiplier("main-menu", 1.5)),
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = uneven_stone_driving_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
  {
    name = "fulgoran-walls",
    type = "tile",
    order = "c[artificial]-a[walls]",
    subgroup = "fulgora-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = { probability_expression = "fulgora_tile_ruin_walls" },
    layer = 10,
    map_color={114, 75, 65},
    --map_color={255, 0, 0},
    vehicle_friction_modifier = 4,
    absorptions_per_second = tile_pollution.fulgora,
    sprite_usage_surface = "fulgora",
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__space-age__/graphics/terrain/fulgoran-walls.png",
        line_length = 4,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 10,
      material_texture_height_in_tiles = 7
    },
    transitions = fulgora_rock_sand_transitions,
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = sound_variations("__space-age__/sound/walking/rocky-stone", 10, 0.8, volume_multiplier("main-menu", 1.5)),
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = uneven_stone_driving_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
  {
    name = "fulgoran-conduit",
    type = "tile",
    order = "c[artificial]-c[conduit]",
    subgroup = "fulgora-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = { probability_expression = "fulgora_tile_ruin_conduit" },
    layer = 11,
    map_color={100, 79, 68},
    --map_color={255, 0, 255},
    vehicle_friction_modifier = 4,
    absorptions_per_second = tile_pollution.fulgora,
    sprite_usage_surface = "fulgora",
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__space-age__/graphics/terrain/fulgoran-conduit.png",
        line_length = 4,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 10,
      material_texture_height_in_tiles = 7
    },
    transitions = fulgora_rock_sand_transitions,
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = sound_variations("__space-age__/sound/walking/scraps", 7, 0.4, volume_multiplier("main-menu", 1.5)),
    landing_steps_sound = sound_variations("__space-age__/sound/walking/scraps", 7, 1.0, volume_multiplier("main-menu", 2.9)),
    driving_sound = metal_rock_driving_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
  {
    name = "fulgoran-machinery",
    type = "tile",
    order = "c[artificial]-d[machinery]",
    subgroup = "fulgora-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = { probability_expression = "fulgora_tile_ruin_machinery" },
    layer = 12,
    map_color={89, 79, 68},
    --map_color={0, 0, 255},
    vehicle_friction_modifier = 4,
    absorptions_per_second = tile_pollution.fulgora,
    sprite_usage_surface = "fulgora",
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__space-age__/graphics/terrain/fulgoran-machinery.png",
        line_length = 4,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 10,
      material_texture_height_in_tiles = 7
    },
    transitions = fulgora_rock_sand_transitions,
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = sound_variations("__space-age__/sound/walking/scraps", 7, 0.4, volume_multiplier("main-menu", 1.5)),
    landing_steps_sound = sound_variations("__space-age__/sound/walking/scraps", 7, 1.0, volume_multiplier("main-menu", 2.9)),
    driving_sound = metal_rock_driving_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },

  ----- Shallow Oil
  {
    name = "oil-ocean-shallow",
    type = "tile",
    order = "a[oil]-b[shallow]",
    subgroup = "fulgora-tiles",
    collision_mask = tile_collision_masks.oil_ocean_shallow(),
    autoplace = {probability_expression = "50 * fulgora_oil_mask * water_base(fulgora_coastline, 1000)"}, -- target coast at cliff elevation
    layer = 4,
    layer_group = "ground-natural",
    map_color = { 74, 42, 43},
    vehicle_friction_modifier = 4,
    walking_speed_modifier = 0.8,
    default_cover_tile = "foundation",
    absorptions_per_second = tile_pollution.fulgora,
    fluid = "heavy-oil",
    effect_color = { 74, 42, 43, 255 },
    effect_color_secondary = { 60, 13, 5, 255 },
    particle_tints = tile_graphics.fulgora_oil_ocean_particle_tints,
    sprite_usage_surface = "fulgora",
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__space-age__/graphics/terrain/oil-sand-8x.png",
        line_length = 8,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 8,
      material_texture_height_in_tiles = 8
    },
    --transitions = table.deepcopy(data.raw.tile["sand-1"].transitions),
    transitions = fulgora_oil_sand_transitions,
    --transitions_between_transitions = table.deepcopy(data.raw.tile["sand-1"].transitions_between_transitions),
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = sound_variations("__base__/sound/walking/resources/oil", 7, 1, volume_multiplier("main-menu", 1.5)),
    landing_steps_sound = sound_variations("__base__/sound/walking/resources/oil", 7, 1, volume_multiplier("main-menu", 2.9)),
    driving_sound = oil_driving_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },

  ----- Deep Oil
  {
    name = "oil-ocean-deep",
    type = "tile",
    order = "a[oil]-b[deep]",
    subgroup = "fulgora-tiles",
    collision_mask = tile_collision_masks.oil_ocean_deep(),
    autoplace = {probability_expression = "100 * fulgora_oil_mask * water_base(fulgora_coastline - 50 - fulgora_coastline_drop / 2, 2000)"},
    layer = 3,
    layer_group = "water",
    map_color = { 49*1.15, 31*1.15, 35*1.15},
    walking_speed_modifier = 0.5,
    vehicle_friction_modifier = 10,
    default_cover_tile = "foundation",
    absorptions_per_second = tile_pollution.water,
    fluid = "heavy-oil",
    effect = "oil-deep",
    effect_color = { 212, 160, 122 },
    effect_color_secondary = { 76, 70, 79 },
    particle_tints = tile_graphics.fulgora_oil_ocean_particle_tints,
    sprite_usage_surface = "fulgora",
    variants = tile_variations_template_with_transitions(
      "__space-age__/graphics/terrain/oil-ocean-deep.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = table.deepcopy(data.raw.tile["water-shallow"].transitions),
    transitions_between_transitions = table.deepcopy(data.raw.tile["water-shallow"].transitions_between_transitions),
    walking_sound = sound_variations("__space-age__/sound/walking/oil-deep", 10, 0.35, volume_multiplier("main-menu", 2.9)),
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/oil-gloop", 10, 0.15),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "S-curve", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 15
    },
    landing_steps_sound = sound_variations("__base__/sound/walking/resources/oil", 7, 1, volume_multiplier("main-menu", 2.9)),
    trigger_effect = tile_trigger_effects.water_trigger_effect(),
  },
  ----- Deep oil effect
  {
    type = "tile-effect",
    name = "oil-deep",
    shader = "water",
    water =
    {
      shader_variation = "oil",
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/oilNoise.png",
          width = 512,
          height = 512
        },
        {
          filename = "__space-age__/graphics/terrain/oil-ocean-deep-shader.png",
          width = 512 * 4,
          height = 512 * 2
        },
        --gradient map for thin film effect
        {
          filename = "__space-age__/graphics/terrain/oilGradient.png",
          width = 512,
          height = 32
        },
        --specular highligts
        {
          filename = "__space-age__/graphics/terrain/oil-ocean-deep-spec.png",
          width = 512 * 4,
          height = 512 * 2
        },
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,

      specular_lightness = { 3, 3, 3 },
      foam_color = {140,60,60}, -- #4e3838ff,
      foam_color_multiplier = 0.1,

      animation_speed = 1.500,
      animation_scale = {3, 3},

      dark_threshold = {2.000, 2.000},
      reflection_threshold = {5.00, 5.00},
      specular_threshold = {0.000, 0.000},
      tick_scale = 1.000,

      near_zoom = 0.063,
      far_zoom = 0.063,
    }
  }}

local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require ("__base__.prototypes.entity.sounds")
local decorative_trigger_effects = require("__base__.prototypes.decorative.decorative-trigger-effects")

--[[
  General decorative strategy:
  survival_chance + subtype_selection_band_of: (region_box - small_scale_knockout)
  grpi is the survival chance on an individual level
  The region box typically has a larger scale noise added to plant property box selection
  The larger scale noise is usually billows or ridges depending on sign. There are preset ones with different scales.
  The small scale knockout is mainly controlling density inside the recion and letting overlapping decoratives mix.
  Temperature is used for regional subvariation for biome health, and can be added to the box for more variation.

  For decorative groups, multiple decoratives share the same selection box.
  The central decorative ar restricted to a higher part of the box peaks and get placed first.
]]

local decal_tile_layer = 255

-- All gleba tiles must be in the land or water lists. (Shallow water is water)
-- they must be global scope for a later test.
-- Used for tile restrictions
gleba_water_tiles = {
  "wetland-yumako",
  "wetland-jellynut",
  "wetland-blue-slime",
  "wetland-light-green-slime",
  "wetland-green-slime",
  "wetland-light-dead-skin",
  "wetland-dead-skin",
  "wetland-pink-tentacle",
  "wetland-red-tentacle",
  "gleba-deep-lake",
}
gleba_land_tiles = {
  "natural-yumako-soil",
  "natural-jellynut-soil",
  "lowland-brown-blubber",
  "lowland-olive-blubber",
  "lowland-olive-blubber-2",
  "lowland-olive-blubber-3",
  "lowland-pale-green",
  "lowland-cream-cauliflower",
  "lowland-cream-cauliflower-2",
  "lowland-dead-skin",
  "lowland-dead-skin-2",
  "lowland-cream-red",
  "lowland-red-vein",
  "lowland-red-vein-2",
  "lowland-red-vein-3",
  "lowland-red-vein-4",
  "lowland-red-vein-dead",
  "lowland-red-infection",
  "midland-turquoise-bark",
  "midland-turquoise-bark-2",
  "midland-cracked-lichen",
  "midland-cracked-lichen-dull",
  "midland-cracked-lichen-dark",
  "midland-yellow-crust",
  "midland-yellow-crust-2",
  "midland-yellow-crust-3",
  "midland-yellow-crust-4",
  "highland-dark-rock",
  "highland-dark-rock-2",
  "highland-yellow-rock",
  "pit-rock"
}

 -- different from the normal decorative default in that it has colliding_with_tiles_only=true
local function dec_default_collision()
  return {layers={doodad=true}, colliding_with_tiles_only=true, not_colliding_with_itself=true}
end

 -- collides with cliffs. Only use for things that render in object layer and shouldn't grow on cliff edges.
local function dec_cliff_collision()
  return {layers={doodad=true, cliff=true}, not_colliding_with_itself=true}
end

 -- collides with shallow water. Only use for things that would obscure the shore too much.
local function dec_shallow_collision()
  return {layers={doodad=true, water_tile=true}, colliding_with_tiles_only=true, not_colliding_with_itself=true}
end

-- collides with land.
local function dec_land_collision()
 return {layers={doodad=true, ground_tile=true}, colliding_with_tiles_only=true, not_colliding_with_itself=true}
end

-- collides with cliff and water
local function dec_shallow_cliff_collision()
  return {layers={doodad=true, water_tile=true, cliff=true}, not_colliding_with_itself=true}
end


local function autoplaceable(prototype)
  prototype.autoplace = prototype.autoplace or { probability_expression = 0 }
end
autoplaceable(data.raw["optimized-decorative"]["lichen-decal"])
autoplaceable(data.raw["optimized-decorative"]["shroom-decal"])

local pink_lichen_decal = lichen("pink-lichen-decal", {r = 225 / 255, g = 189 / 255, b = 225 / 255})
pink_lichen_decal.autoplace = {probability_expression = "gleba_pink_lichen_probability"}

local function decorative_pictures(data)
  local file_path = data.file_path
  local count = data.count or 1
  local tint_as_overlay = data.tint_as_overlay or false
  local tint = data.tint or {1,1,1,1}
  local pictures = {}
  for i = 1, count do
    table.insert(pictures,
      util.sprite_load(file_path .. '-' .. string.format("%02i", i),
        {
          tint = tint,
          tint_as_overlay = tint_as_overlay,
          scale = 0.5
        }
      )
    )
  end
  return pictures
end

local function decorative_pictures_spritesheet(data)
  local sprite_data = require(data.path)
  local pictures = {}
  for i = 1, data.count or 1 do
    table.insert(pictures,
      util.sprite_load(data.path,
        {
          tint = data.tint,
          tint_as_overlay = data.tint_as_overlay,
          scale = data.scale or 0.5,
          x = (i-1) % sprite_data.line_length * sprite_data.width,
          y = math.floor((i-1) / sprite_data.line_length) * sprite_data.height
        }
      )
    )
  end
  return pictures
end

data:extend{
  pink_lichen_decal,
  {
    type = "optimized-decorative",
    name = "red-lichen-decal",
    order = "b[decorative]-j[bush]-a[mini]-a[green]",
    trigger_effect = decorative_trigger_effects.lichen(),
    collision_mask = dec_shallow_collision(),
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    autoplace =
    {
      probability_expression = "grpi(0.3) + gleba_select(gleba_red_lichen - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.4, 0, 1)"
    },
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/red-lichen-decal/red-lichen-decal-00.png",
        priority = base_decorative_sprite_priority,
        width = 356,
        height = 248,
        shift = util.by_pixel(-3, -7),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/red-lichen-decal/red-lichen-decal-01.png",
        priority = base_decorative_sprite_priority,
        width = 334,
        height = 260,
        shift = util.by_pixel(4, -1),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/red-lichen-decal/red-lichen-decal-02.png",
        priority = base_decorative_sprite_priority,
        width = 418,
        height = 262,
        shift = util.by_pixel(4, 3),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/red-lichen-decal/red-lichen-decal-03.png",
        priority = base_decorative_sprite_priority,
        width = 364,
        height = 226,
        shift = util.by_pixel(0, 3),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/red-lichen-decal/red-lichen-decal-04.png",
        priority = base_decorative_sprite_priority,
        width = 382,
        height = 304,
        shift = util.by_pixel(1, 1),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/red-lichen-decal/red-lichen-decal-05.png",
        priority = base_decorative_sprite_priority,
        width = 300,
        height = 224,
        shift = util.by_pixel(-8, 1),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/red-lichen-decal/red-lichen-decal-06.png",
        priority = base_decorative_sprite_priority,
        width = 314,
        height = 224,
        shift = util.by_pixel(-9, 2),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/red-lichen-decal/red-lichen-decal-07.png",
        priority = base_decorative_sprite_priority,
        width = 318,
        height = 266,
        shift = util.by_pixel(-2, -7),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/red-lichen-decal/red-lichen-decal-08.png",
        priority = base_decorative_sprite_priority,
        width = 326,
        height = 200,
        shift = util.by_pixel(1, -1),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/red-lichen-decal/red-lichen-decal-09.png",
        priority = base_decorative_sprite_priority,
        width = 304,
        height = 182,
        shift = util.by_pixel(-18, 7),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/red-lichen-decal/red-lichen-decal-10.png",
        priority = base_decorative_sprite_priority,
        width = 238,
        height = 172,
        shift = util.by_pixel(-3, -13),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/red-lichen-decal/red-lichen-decal-11.png",
        priority = base_decorative_sprite_priority,
        width = 332,
        height = 258,
        shift = util.by_pixel(6, -4),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/red-lichen-decal/red-lichen-decal-12.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 218,
        shift = util.by_pixel(3, -9),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/red-lichen-decal/red-lichen-decal-13.png",
        priority = base_decorative_sprite_priority,
        width = 372,
        height = 216,
        shift = util.by_pixel(-1, -6),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/red-lichen-decal/red-lichen-decal-14.png",
        priority = base_decorative_sprite_priority,
        width = 134,
        height = 140,
        shift = util.by_pixel(-2, 3),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/red-lichen-decal/red-lichen-decal-15.png",
        priority = base_decorative_sprite_priority,
        width = 174,
        height = 134,
        shift = util.by_pixel(11, 5),
        scale = 0.5
      }
    }
  },
  {
    name = "yellow-lettuce-lichen-1x1",
    type = "optimized-decorative",
    order = "b[cover]-b[yellow-lichen]-c[1]",
    collision_box = {{-0.5, -0.4}, {0.5, 0.4}},
    collision_mask = dec_shallow_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    { -- process: survival_chance + subtype_selection_band_of: (region_box - small_scale_knockout)
      order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
      probability_expression = "grpi(0.5) + gleba_select(gleba_yellow_lettuce - 0.6 * clamp(gleba_decorative_knockout, 0, 1), -0.6, -0.1, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 11, file_path = "__space-age__/graphics/decorative/gleba-yellow-lettuce-lichen/gleba-yellow-lettuce-lichen-1x1"})
  },
  {
    name = "yellow-lettuce-lichen-3x3",
    type = "optimized-decorative",
    order = "b[cover]-b[yellow-lichen]-b[3]",
    collision_box = {{-1, -0.8}, {1, 0.8}},
    collision_mask = dec_shallow_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-c[cover]-b[mid-ring]",
      probability_expression = "grpi(0.5) + gleba_select(gleba_yellow_lettuce - 0.7 * clamp(gleba_decorative_knockout, 0, 1), 0.-0.1, 0.3, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/gleba-yellow-lettuce-lichen/gleba-yellow-lettuce-lichen-3x3"})
  },
  {
    name = "yellow-lettuce-lichen-6x6",
    type = "optimized-decorative",
    order = "b[cover]-b[yellow-lichen]-a[6]",
    collision_box = {{-2, -1.6}, {2, 1.6}},
    collision_mask = dec_shallow_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-c[cover]-a[inner]",
      probability_expression = "grpi(0.5) + gleba_select(gleba_yellow_lettuce - 0.8 * clamp(gleba_decorative_knockout, 0, 1), 0.3, 10, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/gleba-yellow-lettuce-lichen/gleba-yellow-lettuce-lichen-6x6"})
  },
  {
    name = "yellow-lettuce-lichen-cups-1x1",
    type = "optimized-decorative",
    order = "b[cover]-a[yellow-lichen-cups]-c[1]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-d[cups]-c[outer]",
      probability_expression = "grpi(0.3) + gleba_select(gleba_yellow_lettuce_cups - 0.7 * clamp(gleba_decorative_knockout, 0, 1), -0.5, -0.2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 11, file_path = "__space-age__/graphics/decorative/gleba-yellow-lettuce-lichen-cups/gleba-yellow-lettuce-lichen-cups-1x1"})
  },
  {
    name = "yellow-lettuce-lichen-cups-3x3",
    type = "optimized-decorative",
    order = "b[cover]-a[yellow-lichen-cups]-b[3]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-d[cups]-b[mid-ring]",
      probability_expression = "grpi(0.2) + gleba_select(gleba_yellow_lettuce_cups - 0.8 * clamp(gleba_decorative_knockout, 0, 1), -0.2, 0.2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/gleba-yellow-lettuce-lichen-cups/gleba-yellow-lettuce-lichen-cups-3x3"})
  },
  {
    name = "yellow-lettuce-lichen-cups-6x6",
    type = "optimized-decorative",
    order = "b[cover]-a[yellow-lichen-cups]-a[6]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-d[cups]-a[inner]",
      probability_expression = "grpi(0.1) + gleba_select(gleba_yellow_lettuce_cups - 0.9 * clamp(gleba_decorative_knockout, 0, 1), 0.2, 0.5, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/gleba-yellow-lettuce-lichen-cups/gleba-yellow-lettuce-lichen-cups-6x6"})
  },
  {
    name = "honeycomb-fungus",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_cliff_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "object",
    autoplace =
    {
      probability_expression = "grpi(0.7) + min(gleba_decorative_subtype_mixer, gleba_select(gleba_honeycomb, 0.3, 2, 0.1, 0, 1))"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/honeycomb-fungus/honeycomb-fungus"})
  },
  {
    name = "honeycomb-fungus-1x1",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_cliff_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "object",
    autoplace =
    {
      probability_expression = "grpi(0.4) + min(gleba_decorative_subtype_mixer, gleba_select(gleba_honeycomb, 0, 0.4, 0.1, 0, 1))"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/honeycomb-fungus-1x1/honeycomb-fungus-1x1"})
  },
  {
    name = "honeycomb-fungus-decayed",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_mask = dec_cliff_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "object",
    autoplace =
    {
      probability_expression = "grpi(0.2) + min(-gleba_decorative_subtype_mixer, gleba_select(gleba_honeycomb, 0, 0.5, 0.1, 0, 1))"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/honeycomb-fungus-decayed/honeycomb-fungus-decayed"})
  },
  {
    name = "green-lettuce-lichen-1x1",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.5, -0.4}, {0.5, 0.4}},
    collision_mask = dec_shallow_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    { -- process: survival_chance + subtype_selection_band_of: (region_box - small_scale_knockout)
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.3) + gleba_select(gleba_green_lettuce - 0.7 * clamp(gleba_decorative_knockout, 0, 1), -0.5, 0.1, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 11, file_path = "__space-age__/graphics/decorative/green-lettuce-lichen/green-lettuce-lichen-1x1"})
  },
  {
    name = "green-lettuce-lichen-3x3",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-1, -0.8}, {1, 0.8}},
    collision_mask = dec_shallow_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    {
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.3) + gleba_select(gleba_green_lettuce - 0.8 * clamp(gleba_decorative_knockout, 0, 1), 0.1, 0.4, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/green-lettuce-lichen/green-lettuce-lichen-3x3"})
  },
  {
    name = "green-lettuce-lichen-6x6",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-2, -1.6}, {2, 1.6}},
    collision_mask = dec_shallow_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    {
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.3) + gleba_select(gleba_green_lettuce - 0.9 * clamp(gleba_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/green-lettuce-lichen/green-lettuce-lichen-6x6"})
  },
  {
    name = "green-lettuce-lichen-water-1x1",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.5, -0.4}, {0.5, 0.4}},
    collision_mask = dec_land_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    { -- process: survival_chance + subtype_selection_band_of: (region_box - small_scale_knockout)
      order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
      probability_expression = "grpi(0.3) + gleba_water_plant_ramp * gleba_select(gleba_green_lettuce - 0.7 * clamp(gleba_decorative_knockout, 0, 1), -0.5, 0.1, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 11, file_path = "__space-age__/graphics/decorative/green-lettuce-lichen-water/green-lettuce-lichen-1x1"})
  },
  {
    name = "green-lettuce-lichen-water-3x3",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-1, -0.8}, {1, 0.8}},
    collision_mask = dec_land_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-c[cover]-b[mid-ring]",
      probability_expression = "grpi(0.3) + gleba_water_plant_ramp * gleba_select(gleba_green_lettuce - 0.8 * clamp(gleba_decorative_knockout, 0, 1), 0.1, 0.4, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/green-lettuce-lichen-water/green-lettuce-lichen-3x3"})
  },
  {
    name = "green-lettuce-lichen-water-6x6",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-2, -1.6}, {2, 1.6}},
    collision_mask = dec_land_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-c[cover]-a[inner]",
      probability_expression = "grpi(0.3) + gleba_water_plant_ramp * gleba_select(gleba_green_lettuce - 0.9 * clamp(gleba_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/green-lettuce-lichen-water/green-lettuce-lichen-6x6"})
  },
  {
    name = "split-gill-1x1",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    collision_mask = dec_default_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.5) + gleba_select(0.4 + gleba_split_gill + 0.2 * gleba_decorative_knockout, -0.5, 0.2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/split-gill/split-gill-1x1"})
  },
  {
    name = "split-gill-2x2",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.45, -0.45}, {0.45, 0.45}},
    collision_mask = dec_default_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      order = "d[decorative]-c[trivial]-c[cover]-b[mid-ring]",
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.6) + gleba_select(0.4 + gleba_split_gill + 0.3 * gleba_decorative_knockout, 0.2, 2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/split-gill/split-gill-2x2"})
  },
  {
    name = "split-gill-dying-1x1",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    collision_mask = dec_default_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.5) + gleba_select(0.4 + gleba_split_gill_dying + 0.2 * gleba_decorative_knockout, -0.5, 0.2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/split-gill-dying/split-gill-dying-1x1"})
  },
  {
    name = "split-gill-dying-2x2",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.45, -0.45}, {0.45, 0.45}},
    collision_mask = dec_default_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      order = "d[decorative]-c[trivial]-c[cover]-b[mid-ring]",
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.6) + gleba_select(0.4 + gleba_split_gill_dying + 0.3 * gleba_decorative_knockout, 0.2, 2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/split-gill-dying/split-gill-dying-2x2"})
  },
  {
    name = "split-gill-red-1x1",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    collision_mask = dec_default_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.5) + gleba_select(0.4 + gleba_split_gill_red + 0.2 * gleba_decorative_knockout, -0.5, 0.2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/split-gill-red/split-gill-red-1x1"})
  },
  {
    name = "split-gill-red-2x2",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.45, -0.45}, {0.45, 0.45}},
    collision_mask = dec_default_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      order = "d[decorative]-c[trivial]-c[cover]-b[mid-ring]",
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.6) + gleba_select(0.4 + gleba_split_gill_red + 0.3 * gleba_decorative_knockout, 0.2, 2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/split-gill-red/split-gill-red-2x2"})
  },
  {
    name = "fuchsia-pita",
    type = "optimized-decorative",
    order = "b[decorative]-c[pita]-a[red]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_shallow_cliff_collision(),
    render_layer = "object",
    walking_sound = sounds.plant,
    trigger_effect = decorative_trigger_effects.red_pita(),
    autoplace =
    {
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.7) + gleba_select(gleba_fuchsia_pita - clamp(gleba_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)"
    },
    pictures =
    {
      --rpita
      {
        filename = "__space-age__/graphics/decorative/fuchsia-pita/fuchsia-pita-00.png",
        priority = base_decorative_sprite_priority,
        width = 152,
        height = 98,
        shift = util.by_pixel(10.5, -7.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/fuchsia-pita/fuchsia-pita-01.png",
        priority = base_decorative_sprite_priority,
        width = 146,
        height = 109,
        shift = util.by_pixel(13, -6.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/fuchsia-pita/fuchsia-pita-02.png",
        priority = base_decorative_sprite_priority,
        width = 119,
        height = 82,
        shift = util.by_pixel(10.75, -7.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/fuchsia-pita/fuchsia-pita-03.png",
        priority = base_decorative_sprite_priority,
        width = 118,
        height = 84,
        shift = util.by_pixel(9.5, -5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/fuchsia-pita/fuchsia-pita-04.png",
        priority = base_decorative_sprite_priority,
        width = 149,
        height = 99,
        shift = util.by_pixel(13.75, -7.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/fuchsia-pita/fuchsia-pita-05.png",
        priority = base_decorative_sprite_priority,
        width = 142,
        height = 93,
        shift = util.by_pixel(13, -8.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/fuchsia-pita/fuchsia-pita-06.png",
        priority = base_decorative_sprite_priority,
        width = 177,
        height = 106,
        shift = util.by_pixel(8.25, -5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/fuchsia-pita/fuchsia-pita-07.png",
        priority = base_decorative_sprite_priority,
        width = 167,
        height = 120,
        shift = util.by_pixel(10.25, -6.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/fuchsia-pita/fuchsia-pita-08.png",
        priority = base_decorative_sprite_priority,
        width = 168,
        height = 128,
        shift = util.by_pixel(10.5, -6),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/fuchsia-pita/fuchsia-pita-09.png",
        priority = base_decorative_sprite_priority,
        width = 119,
        height = 85,
        shift = util.by_pixel(4.25, -7.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/fuchsia-pita/fuchsia-pita-10.png",
        priority = base_decorative_sprite_priority,
        width = 109,
        height = 69,
        shift = util.by_pixel(7.25, -3.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/fuchsia-pita/fuchsia-pita-11.png",
        priority = base_decorative_sprite_priority,
        width = 93,
        height = 70,
        shift = util.by_pixel(5.75, -4.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/fuchsia-pita/fuchsia-pita-12.png",
        priority = base_decorative_sprite_priority,
        width = 107,
        height = 74,
        shift = util.by_pixel(7.75, -5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/fuchsia-pita/fuchsia-pita-13.png",
        priority = base_decorative_sprite_priority,
        width = 114,
        height = 70,
        shift = util.by_pixel(12, -4.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/fuchsia-pita/fuchsia-pita-14.png",
        priority = base_decorative_sprite_priority,
        width = 89,
        height = 71,
        shift = util.by_pixel(3.75, -7.25),
        scale = 0.5
      }
    }
  },
  {
    name = "wispy-lichen",
    type = "optimized-decorative",
    order = "b[decorative]-b[asterisk-mini]-b[green]",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    collision_mask = dec_cliff_collision(),
    render_layer = "decorative",
    walking_sound = sounds.plant,
    trigger_effect = decorative_trigger_effects.green_asterisk(),
    autoplace =
    {
      placement_density = 2,
      probability_expression = "grpi(0.7) + gleba_select(gleba_wispy_lichen - 0.5 * clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    pictures =
    {
      --gAst
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-00.png",
        priority = base_decorative_sprite_priority,
        width = 120,
        height = 80,
        shift = util.by_pixel(5, -4),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-01.png",
        priority = base_decorative_sprite_priority,
        width = 130,
        height = 95,
        shift = util.by_pixel(1, -5.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-02.png",
        priority = base_decorative_sprite_priority,
        width = 122,
        height = 76,
        shift = util.by_pixel(0, 1),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-03.png",
        priority = base_decorative_sprite_priority,
        width = 121,
        height = 75,
        shift = util.by_pixel(5.75, -0.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-04.png",
        priority = base_decorative_sprite_priority,
        width = 85,
        height = 77,
        shift = util.by_pixel(3.75, -3.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-05.png",
        priority = base_decorative_sprite_priority,
        width = 132,
        height = 77,
        shift = util.by_pixel(-0.5, -1.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-06.png",
        priority = base_decorative_sprite_priority,
        width = 84,
        height = 92,
        shift = util.by_pixel(3, -4),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-07.png",
        priority = base_decorative_sprite_priority,
        width = 118,
        height = 79,
        shift = util.by_pixel(6, -2.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-08.png",
        priority = base_decorative_sprite_priority,
        width = 104,
        height = 78,
        shift = util.by_pixel(3.5, 0.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-09.png",
        priority = base_decorative_sprite_priority,
        width = 88,
        height = 61,
        shift = util.by_pixel(-1, -2.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-10.png",
        priority = base_decorative_sprite_priority,
        width = 89,
        height = 63,
        shift = util.by_pixel(2.75, -9.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-11.png",
        priority = base_decorative_sprite_priority,
        width = 91,
        height = 58,
        shift = util.by_pixel(13.75, -1),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-12.png",
        priority = base_decorative_sprite_priority,
        width = 90,
        height = 64,
        shift = util.by_pixel(-7.5, 2),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-13.png",
        priority = base_decorative_sprite_priority,
        width = 89,
        height = 73,
        shift = util.by_pixel(4.25, -4.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-14.png",
        priority = base_decorative_sprite_priority,
        width = 78,
        height = 56,
        shift = util.by_pixel(1, -3),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-15.png",
        priority = base_decorative_sprite_priority,
        width = 85,
        height = 51,
        shift = util.by_pixel(3.25, -0.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-16.png",
        priority = base_decorative_sprite_priority,
        width = 92,
        height = 71,
        shift = util.by_pixel(8, -1.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-17.png",
        priority = base_decorative_sprite_priority,
        width = 90,
        height = 65,
        shift = util.by_pixel(3, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-18.png",
        priority = base_decorative_sprite_priority,
        width = 117,
        height = 69,
        shift = util.by_pixel(4.25, -4.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/wispy-lichen/wispy-lichen-19.png",
        priority = base_decorative_sprite_priority,
        width = 82,
        height = 64,
        shift = util.by_pixel(0.5, -2),
        scale = 0.5
      }
    }
  },
  {
    name = "coral-land",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_shallow_collision(),
    walking_sound = sounds.carpet_grass,
    render_layer = "object",
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      placement_density = 2,
      probability_expression = "grpi(0.5) + gleba_select(gleba_corals - clamp(gleba_decorative_knockout, 0, 1), 0.3, 2, 0.1, 0, 1)"
    },
    pictures = util.spritesheets_to_pictures({{path = "__space-age__/graphics/decorative/coral/coral", frame_count = 12}}),
  },
  {
    name = "coral-water",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_land_collision(),
    walking_sound = sounds.carpet_grass,
    render_layer = "object",
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      placement_density = 2,
      probability_expression = "grpi(0.7) + gleba_water_plant_ramp * gleba_select(gleba_corals - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    pictures = util.spritesheets_to_pictures({{path = "__space-age__/graphics/decorative/coral-water/coral-water", frame_count = 15}}),
  },
  {
    name = "black-sceptre",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_cliff_collision(),
    walking_sound = sounds.carpet_grass,
    render_layer = "object",
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      placement_density = 2,
      probability_expression = "grpi(0.5) + gleba_select(gleba_black_sceptre - clamp(gleba_decorative_knockout, 0, 1), 0.8, 2, 0.3, 0, 1)"
    },
    pictures = util.spritesheets_to_pictures({{path = "__space-age__/graphics/decorative/black-sceptre/black-sceptre", frame_count = 12}}),
  },
  {
    name = "pink-phalanges",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_cliff_collision(),
    walking_sound = sounds.carpet_grass,
    render_layer = "object",
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      placement_density = 2,
      probability_expression = "grpi(0.6) + gleba_select(gleba_pink_phalanges - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    pictures = util.spritesheets_to_pictures({{path = "__space-age__/graphics/decorative/pink-phalanges/pink-phalanges", frame_count = 10}}),
  },
  {
    name = "green-cup",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_shallow_cliff_collision(),
    walking_sound = sounds.carpet_grass,
    render_layer = "object",
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      placement_density = 2,
      probability_expression = "grpi(0.6) + gleba_select(gleba_green_cup - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.2, 0, 1)"
    },
    pictures = util.spritesheets_to_pictures({{path = "__space-age__/graphics/decorative/green-cup/green-cup", frame_count = 14}}),
  },
  {
    name = "mycelium",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_default_collision(),
    walking_sound = sounds.carpet_grass,
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace = {
      probability_expression = "grpi(0.5) + gleba_select(gleba_mycelium - clamp(gleba_decorative_knockout, 0, 1), 0.1, 2, 0.2, 0, 1)"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/mycelium/mycelium-", "",
     512,
      16)
  },
  {
    name = "veins",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_default_collision(),
    walking_sound = sounds.carpet_grass,
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace = {
      probability_expression = "grpi(0.5) + gleba_select(gleba_veins - clamp(gleba_decorative_knockout, 0, 1), -0.1, 0.3, 0.1, 0, 1)"
    },
    pictures = util.spritesheets_to_pictures({{path = "__space-age__/graphics/decorative/veins/veins", frame_count = 16}}),
  },
  {
    name = "veins-small",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_default_collision(),
    walking_sound = sounds.carpet_grass,
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace = {
      probability_expression = "grpi(0.5) + gleba_select(gleba_veins - clamp(gleba_decorative_knockout, 0, 1), 0.3, 2, 0.1, 0, 1)"
    },
    pictures = util.spritesheets_to_pictures({{path = "__space-age__/graphics/decorative/veins-small/veins-small", frame_count = 12}}),
  },
  {
    name = "brambles",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    collision_mask = dec_shallow_cliff_collision(),
    render_layer = "object",
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace = {
      probability_expression = "grpi(0.8) + gleba_select(gleba_bramble_vines - clamp(gleba_decorative_knockout, 0, 1), 0.0, 0.4, 0.1, 0, 1)"
    },
    pictures = decorative_pictures_spritesheet{path = "__space-age__/graphics/decorative/bramble/bramble", count = 10}
  },
  {
    name = "blood-grape",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_shallow_cliff_collision(),
    walking_sound = sounds.carpet_grass,
    render_layer = "object",
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      placement_density = 2,
      probability_expression = "grpi(0.4) + gleba_select(gleba_bramble_grapes - clamp(gleba_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)"
    },
    pictures = util.spritesheets_to_pictures({{path = "__space-age__/graphics/decorative/blood-grape/blood-grape", frame_count = 18}}),
  },
  {
    name = "blood-grape-vibrant",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_shallow_cliff_collision(),
    walking_sound = sounds.carpet_grass,
    render_layer = "object",
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      placement_density = 2,
      probability_expression = "grpi(0.4) + gleba_select(gleba_bramble_grapes_vibrant - clamp(gleba_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)"
    },
    pictures = util.spritesheets_to_pictures({{path = "__space-age__/graphics/decorative/blood-grape-vibrant/blood-grape-vibrant", frame_count = 18}}),
  },
  {
    name = "brown-cup",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_shallow_collision(),
    walking_sound = sounds.carpet_grass,
    render_layer = "decorative",
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      placement_density = 2,
      probability_expression = "grpi(0.7) + gleba_select(gleba_brown_cup - clamp(gleba_decorative_knockout, 0, 1), 0.6, 2, 0.1, 0, 1)"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/brown-cup/brown-cup-", "",
     220,
      13)
  },
  {
    name = "polycephalum-slime",
    type = "optimized-decorative",
    order = "a[polycephalum]-a[slime]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_shallow_collision(),
    walking_sound = sounds.plant,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace = {
      order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
      probability_expression = "gleba_select(gleba_polycephalum - clamp(-gleba_decorative_knockout, 0, 1), 0.9, 2, 0.2, 0, 1)"
    },
    pictures = decorative_pictures_spritesheet{path = "__space-age__/graphics/decorative/polycephalum/polycephalum-slime", count = 17}
  },
  {
    name = "polycephalum-balloon",
    type = "optimized-decorative",
    order = "a[polycephalum]-b[balloon]",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    collision_mask = dec_shallow_cliff_collision(),
    render_layer = "object",
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace = {
      order = "d[decorative]-c[trivial]-b[bush]-a[inner]",
      probability_expression = "grpi(0.6) + gleba_select(gleba_polycephalum - clamp(-gleba_decorative_knockout, 0, 1), 1, 2, 0.2, 0, 1)"
    },
    pictures = decorative_pictures_spritesheet{path = "__space-age__/graphics/decorative/polycephalum/polycephalum-balloon", count = 13, scale = 0.7}
  },
  {
    name = "grey-cracked-mud-decal",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-3.75, -2.5625}, {3.75, 2.5625}},
    collision_mask = dec_shallow_collision(),
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    autoplace = {
      probability_expression = "grpi(0.08) + gleba_select(gleba_grey_cracked_mud - clamp(gleba_decorative_knockout, 0, 1), 0.1, 2, 0.1, 0, 1)"
    },
    pictures =
    {
      --pubertyDecal
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-00.png",
        width = 474,
        height = 337,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-01.png",
        width = 473,
        height = 265,
        shift = util.by_pixel(0.25, -2.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-02.png",
        width = 473,
        height = 267,
        shift = util.by_pixel(0.25, -3.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-03.png",
        width = 432,
        height = 243,
        shift = util.by_pixel(1.5, 1.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-04.png",
        width = 472,
        height = 305,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-05.png",
        width = 375,
        height = 224,
        shift = util.by_pixel(-0.25, 0),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-06.png",
        width = 296,
        height = 335,
        shift = util.by_pixel(-1, -0.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-07.png",
        width = 400,
        height = 220,
        shift = util.by_pixel(-9, 7.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-08.png",
        width = 268,
        height = 337,
        shift = util.by_pixel(2.5, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-09.png",
        width = 426,
        height = 156,
        shift = util.by_pixel(6, 7.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-10.png",
        width = 426,
        height = 267,
        shift = util.by_pixel(3, 6.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-11.png",
        width = 472,
        height = 329,
        shift = util.by_pixel(0, 0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-12.png",
        width = 472,
        height = 337,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-13.png",
        width = 381,
        height = 276,
        shift = util.by_pixel(21.75, -10.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-14.png",
        width = 472,
        height = 338,
        shift = util.by_pixel(0, 0),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-15.png",
        width = 473,
        height = 336,
        shift = util.by_pixel(-0.25, -0.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-16.png",
        width = 327,
        height = 215,
        shift = util.by_pixel(0.25, -0.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-17.png",
        width = 298,
        height = 212,
        shift = util.by_pixel(-3, 10),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-18.png",
        width = 286,
        height = 199,
        shift = util.by_pixel(-14, 7.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-19.png",
        width = 206,
        height = 157,
        shift = util.by_pixel(5, 0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-20.png",
        width = 305,
        height = 190,
        shift = util.by_pixel(8.75, 2),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-21.png",
        width = 321,
        height = 209,
        shift = util.by_pixel(-5.25, -2.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-22.png",
        width = 297,
        height = 182,
        shift = util.by_pixel(-11.25, 5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-23.png",
        width = 268,
        height = 196,
        shift = util.by_pixel(-4, 2.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-24.png",
        width = 320,
        height = 229,
        shift = util.by_pixel(-2.5, 1.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-25.png",
        width = 472,
        height = 149,
        shift = util.by_pixel(0, -1.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-26.png",
        width = 180,
        height = 211,
        shift = util.by_pixel(1, -5.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-27.png",
        width = 325,
        height = 153,
        shift = util.by_pixel(0.25, -0.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-28.png",
        width = 326,
        height = 132,
        shift = util.by_pixel(0, 4.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/grey-cracked-mud-decal/grey-cracked-mud-decal-29.png",
        width = 311,
        height = 183,
        shift = util.by_pixel(13.25, -21.75),
        scale = 0.5
      }
    }
  },
 -- YELLOW CORAL
  {
    name = "yellow-coral",
    type = "optimized-decorative",
    order = "b[cover]-b[yellow-lichen]-a[7]",
    collision_box = {{-1, -1}, {1, 1}},
    collision_mask = dec_shallow_cliff_collision(),
    render_layer = "object",
    autoplace = {
      probability_expression = "grpi(0.2) + gleba_select(gleba_yellow_coral - 0.5 * clamp(gleba_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)"
    },
    pictures =
    {
      --BOB small
      {
        filename = "__space-age__/graphics/decorative/bob-fingers/bob-fingers-small-01.png",
        width = 224,
        height = 128,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/bob-fingers/bob-fingers-small-02.png",
        width = 290,
        height = 175,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/bob-fingers/bob-fingers-small-03.png",
        width = 253,
        height = 215,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/bob-fingers/bob-fingers-small-04.png",
        width = 320,
        height = 149,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/bob-fingers/bob-fingers-small-05.png",
        width = 210,
        height = 192,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/bob-fingers/bob-fingers-small-06.png",
        width = 210,
        height = 192,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/bob-fingers/bob-fingers-small-07.png",
        width = 275,
        height = 240,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/bob-fingers/bob-fingers-small-08.png",
        width = 131,
        height = 124,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/bob-fingers/bob-fingers-small-09.png",
        width = 122,
        height = 88,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/bob-fingers/bob-fingers-small-10.png",
        width = 119,
        height = 69,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/bob-fingers/bob-fingers-small-11.png",
        width = 90,
        height = 85,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/bob-fingers/bob-fingers-small-12.png",
        width = 157,
        height = 106,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/bob-fingers/bob-fingers-small-13.png",
        width = 137,
        height = 130,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/bob-fingers/bob-fingers-small-14.png",
        width = 83,
        height = 87,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/bob-fingers/bob-fingers-small-15.png",
        width = 105,
        height = 49,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
    }
  },
 -- SOLO BARNACLE
  {
    name = "solo-barnacle",
    type = "optimized-decorative",
    order = "b[cover]-b[yellow-lichen]-a[7]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_shallow_cliff_collision(),
    render_layer = "object",
    autoplace = {
      placement_density = 2,
      probability_expression = "grpi(0.6) + gleba_select(gleba_barnacle_solo - 0.5 * clamp(gleba_decorative_knockout, 0, 1), 0.6, 2, 0.1, 0, 1)"
    },
    pictures =
    {

      {
        filename = "__space-age__/graphics/decorative/barney/barney-01.png",
        width = 39,
        height = 31,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-02.png",
        width = 74,
        height = 53,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-03.png",
        width = 74,
        height = 35,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-04.png",
        width = 44,
        height = 31,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-05.png",
        width = 70,
        height = 51,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-06.png",
        width = 49,
        height = 48,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-07.png",
        width = 49,
        height = 34,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-08.png",
        width = 38,
        height = 31,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-09.png",
        width = 42,
        height = 31,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-10.png",
        width = 46,
        height = 35,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-11.png",
        width = 77,
        height = 54,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-12.png",
        width = 42,
        height = 33,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-13.png",
        width = 38,
        height = 27,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-14.png",
        width = 70,
        height = 38,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-15.png",
        width = 38,
        height = 29,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-16.png",
        width = 56,
        height = 45,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-17.png",
        width = 39,
        height = 31,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-18.png",
        width = 93,
        height = 49,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-19.png",
        width = 87,
        height = 49,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-20.png",
        width = 42,
        height = 33,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-21.png",
        width = 45,
        height = 34,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-22.png",
        width = 40,
        height = 27,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-23.png",
        width = 56,
        height = 53,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-24.png",
        width = 37,
        height = 29,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barney/barney-25.png",
        width = 36,
        height = 28,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
    }
  },
 -- CURLY ROOTS ORANGE
  {
    name = "curly-roots-orange",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    collision_mask = dec_default_collision(),
    walking_sound = sounds.carpet_grass,
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace = {
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.1) + gleba_select(gleba_curly_orange_roots, 0.5, 2, 0.5, 0, 1)"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/orange-root/orange-root-", "",
     1257, 5)
  },
 -- CURLY ROOTS GREY
  {
    name = "curly-roots-grey",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    collision_mask = dec_default_collision(),
    walking_sound = sounds.carpet_grass,
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace = {
      probability_expression = 0
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/curly-root-grey/curly-root-grey-", "",
     1257, 5, nil, nil, 0.9)
  },
 -- PALE LETTUCE CUPS 1X1
  {
    name = "pale-lettuce-lichen-cups-1x1",
    type = "optimized-decorative",
    order = "b[cover]-a[yellow-lichen-cups]-c[1]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_default_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-d[cups]-c[outer]",
      placement_density = 2,
      probability_expression = "grpi(0.3) + gleba_water_plant_ramp * gleba_select(gleba_purple_cups - 0.7 * clamp(gleba_decorative_knockout, 0, 1), -0.5, -0.1, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 11, file_path = "__space-age__/graphics/decorative/gleba-pale-lettuce-lichen-cups/gleba-pale-lettuce-lichen-cups-1x1"})
  },
 -- PALE LETTUCE CUPS 3X3
  {
    name = "pale-lettuce-lichen-cups-3x3",
    type = "optimized-decorative",
    order = "b[cover]-a[yellow-lichen-cups]-b[3]",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    collision_mask = dec_default_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-d[cups]-b[mid-ring]",
      probability_expression = "grpi(0.2) + gleba_water_plant_ramp * gleba_select(gleba_purple_cups - 0.8 * clamp(gleba_decorative_knockout, 0, 1), -0.1, 0.2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/gleba-pale-lettuce-lichen-cups/gleba-pale-lettuce-lichen-cups-3x3"})
  },
 -- PALE LETTUCE CUPS 6X6
  {
    name = "pale-lettuce-lichen-cups-6x6",
    type = "optimized-decorative",
    order = "b[cover]-a[yellow-lichen-cups]-a[6]",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    collision_mask = dec_default_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-d[cups]-a[inner]",
      probability_expression = "grpi(0.1) + gleba_water_plant_ramp * gleba_select(gleba_purple_cups - 0.9 * clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/gleba-pale-lettuce-lichen-cups/gleba-pale-lettuce-lichen-cups-6x6"})
  },
 -- PALE LETTUCE 1X1
  {
    name = "pale-lettuce-lichen-1x1",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.5, -0.4}, {0.5, 0.4}},
    collision_mask = dec_shallow_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    { -- process: survival_chance + subtype_selection_band_of: (region_box - small_scale_knockout)
      order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.2) + gleba_select(gleba_pale_lettuce - 0.7 * clamp(gleba_decorative_knockout, 0, 1), -0.6, -0.1, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 11, file_path = "__space-age__/graphics/decorative/pale-lettuce-lichen/pale-lettuce-lichen-1x1"})
  },
 -- PALE LETTUCE 3X3
  {
    name = "pale-lettuce-lichen-3x3",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-1, -0.8}, {1, 0.8}},
    collision_mask = dec_shallow_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-c[cover]-b[mid-ring]",
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.2) + gleba_select(gleba_pale_lettuce - 0.8 * clamp(gleba_decorative_knockout, 0, 1), -0.2, 0.4, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/pale-lettuce-lichen/pale-lettuce-lichen-3x3"})
  },
 -- PALE LETTUCE 6X6
  {
    name = "pale-lettuce-lichen-6x6",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-2, -1.6}, {2, 1.6}},
    collision_mask = dec_shallow_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-c[cover]-a[inner]",
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.3) + gleba_select(gleba_pale_lettuce - 0.9 * clamp(gleba_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/pale-lettuce-lichen/pale-lettuce-lichen-6x6"})
  },
 -- PALE LETTUCE WATER 1X1
  {
    name = "pale-lettuce-lichen-water-1x1",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.5, -0.4}, {0.5, 0.4}},
    collision_mask = dec_land_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    { -- process: survival_chance + subtype_selection_band_of: (region_box - small_scale_knockout)
      order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
      probability_expression = "grpi(0.1) + gleba_water_plant_ramp * gleba_select(gleba_pale_lettuce - 0.7 * clamp(gleba_decorative_knockout, 0, 1), -0.5, 0.1, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 11, file_path = "__space-age__/graphics/decorative/pale-lettuce-lichen-water/pale-lettuce-lichen-1x1"})
  },
 -- PALE LETTUCE WATER 3X3
  {
    name = "pale-lettuce-lichen-water-3x3",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-1, -0.8}, {1, 0.8}},
    collision_mask = dec_land_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-c[cover]-b[mid-ring]",
      probability_expression = "grpi(0.2) + gleba_water_plant_ramp * gleba_select(gleba_pale_lettuce - 0.8 * clamp(gleba_decorative_knockout, 0, 1), 0.1, 0.5, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/pale-lettuce-lichen-water/pale-lettuce-lichen-3x3"})
  },
 -- PALE LETTUCE WATER 6X6
  {
    name = "pale-lettuce-lichen-water-6x6",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-2, -1.6}, {2, 1.6}},
    collision_mask = dec_land_collision(),
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-c[cover]-a[inner]",
      probability_expression = "grpi(0.3) + gleba_water_plant_ramp * gleba_select(gleba_pale_lettuce - 0.9 * clamp(gleba_decorative_knockout, 0, 1), 0.5, 2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__space-age__/graphics/decorative/pale-lettuce-lichen-water/pale-lettuce-lichen-6x6"})
  },
 -- MATCHES
  {
    name = "matches-small",
    type = "optimized-decorative",
    order = "b[cover]-b[yellow-lichen]-a[7]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_shallow_cliff_collision(),
    render_layer = "object",
    autoplace = {
      placement_density = 2,
      probability_expression = "grpi(0.6) + gleba_select(region_box + 0.3 * gleba_scrub_noise + 0.7 * gleba_temperature_normalised - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)",
      local_expressions =
      {
        region_box = "min(gleba_select(gleba_aux, 0.65, 2, 0.05, -10, 1), gleba_select(gleba_moisture, 0.25, 0.55, 0.01, -10, 1), gleba_select(gleba_temperature_normalised, 0.5, 2, 0.3, -10, 1)) - 1"
      }
    },
    pictures =
    {
      --MATCHES Small
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-01.png",
        width = 43,
        height = 51,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-02.png",
        width = 63,
        height = 63,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-03.png",
        width = 67,
        height = 81,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-04.png",
        width = 76,
        height = 81,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-05.png",
        width = 72,
        height = 60,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-06.png",
        width = 36,
        height = 33,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-07.png",
        width = 72,
        height = 49,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-08.png",
        width = 47,
        height = 51,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-09.png",
        width = 58,
        height = 64,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-10.png",
        width = 68,
        height = 88,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-11.png",
        width = 66,
        height = 60,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-12.png",
        width = 70,
        height = 76,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-13.png",
        width = 61,
        height = 82,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-14.png",
        width = 68,
        height = 78,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-15.png",
        width = 72,
        height = 87,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-16.png",
        width = 83,
        height = 80,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-17.png",
        width = 39,
        height = 40,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-18.png",
        width = 41,
        height = 36,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-19.png",
        width = 52,
        height = 35,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-20.png",
        width = 41,
        height = 48,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
     {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-21.png",
        width = 46,
        height = 53,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-22.png",
        width = 46,
        height = 56,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-23.png",
        width = 49,
        height = 55,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
     {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-24.png",
        width = 65,
        height = 63,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-25.png",
        width = 43,
        height = 73,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-26.png",
        width = 54,
        height = 47,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-27.png",
        width = 49,
        height = 40,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-28.png",
        width = 38,
        height = 34,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-29.png",
        width = 54,
        height = 52,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-30.png",
        width = 57,
        height = 68,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-31.png",
        width = 73,
        height = 59,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-32.png",
        width = 27,
        height = 27,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-33.png",
        width = 66,
        height = 66,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-34.png",
        width = 45,
        height = 43,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-35.png",
        width = 38,
        height = 38,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-36.png",
        width = 52,
        height = 65,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-37.png",
        width = 54,
        height = 33,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-38.png",
        width = 41,
        height = 44,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-39.png",
        width = 57,
        height = 67,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-40.png",
        width = 33,
        height = 34,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-41.png",
        width = 55,
        height = 49,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-42.png",
        width = 87,
        height = 94,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-43.png",
        width = 70,
        height = 51,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-44.png",
        width = 35,
        height = 38,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-45.png",
        width = 82,
        height = 59,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-46.png",
        width = 36,
        height = 41,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-47.png",
        width = 44,
        height = 46,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-48.png",
        width = 46,
        height = 46,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-49.png",
        width = 58,
        height = 53,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/matches-small/matches-small-50.png",
        width = 48,
        height = 61,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
    }
  },
 -- NERVE ROOTS DENSE
  {
    name = "nerve-roots-dense",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    collision_mask = dec_default_collision(),
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    autoplace = {
      probability_expression = 0
    },
    pictures =
    {
      --NERV-dense
      {
        filename = "__space-age__/graphics/decorative/nerv-roots/nerv-root-dense-01.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/nerv-roots/nerv-root-dense-02.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/nerv-roots/nerv-root-dense-03.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/nerv-roots/nerv-root-dense-04.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },

    }
  },
 -- NERVE ROOTS SPARSE
  {
    name = "nerve-roots-sparse",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    collision_mask = dec_default_collision(),
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    autoplace = {
      probability_expression = 0
    },
    pictures =
    {
      --NERV-light
      {
        filename = "__space-age__/graphics/decorative/nerv-roots/nerv-root-light-01.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/nerv-roots/nerv-root-light-02.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/nerv-roots/nerv-root-light-03.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/nerv-roots/nerv-root-light-04.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },

    }
  },
 -- NERVE ROOTS VEINS DENSE
  {
    name = "nerve-roots-veins-dense",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    collision_mask = dec_default_collision(),
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    autoplace = {
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.2) + gleba_select(gleba_nerve_veins + gleba_temperature_normalised  - clamp(gleba_decorative_knockout, 0, 1), 0.6, 2, 0.1, 0, 1)",
    },
    pictures =
    {
      --NERV-dense
      {
        filename = "__space-age__/graphics/decorative/nerv-roots-veins/nerv-root-veins-dense-01.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/nerv-roots-veins/nerv-root-veins-dense-02.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/nerv-roots-veins/nerv-root-veins-dense-03.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/nerv-roots-veins/nerv-root-veins-dense-04.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },

    }
  },
 -- NERVE ROOTS VEINS SPARSE
  {
    name = "nerve-roots-veins-sparse",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    collision_mask = dec_default_collision(),
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    autoplace = {
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.2) + gleba_select(gleba_nerve_veins + gleba_temperature_normalised  - clamp(gleba_decorative_knockout, 0, 1), 0.2, 0.6, 0.2, 0, 1)",
    },
    pictures =
    {
      --NERV-sparse
      {
        filename = "__space-age__/graphics/decorative/nerv-roots-veins/nerv-root-veins-light-01.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/nerv-roots-veins/nerv-root-veins-light-02.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/nerv-roots-veins/nerv-root-veins-light-03.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/nerv-roots-veins/nerv-root-veins-light-04.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },

    }
  },
 -- WHITE CARPET GRASS
  {
    name = "white-carpet-grass",
    type = "optimized-decorative",
    order = "b[decorative]-a[grass]-b[carpet]",
    collision_box = {{-2, -2}, {2, 2}},
    collision_mask = dec_default_collision(),
    grows_through_rail_path = true,
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.green_carpet_grass(),
    autoplace =
    {
      order = "a[doodad]-f[grass]-c",
      probability_expression = "grpi(0.2) + gleba_select(gleba_white_grass - clamp(gleba_decorative_knockout, 0, 1), 0.5, 2, 0.5, 0, 1)"
    },
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/white-carpet-grass/white-carpet-grass-00.png",
        priority = base_decorative_sprite_priority,
        width = 289,
        height = 292,
        shift = util.by_pixel(1.75, -3),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/white-carpet-grass/white-carpet-grass-01.png",
        priority = base_decorative_sprite_priority,
        width = 273,
        height = 264,
        shift = util.by_pixel(0.25, -0.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/white-carpet-grass/white-carpet-grass-02.png",
        priority = base_decorative_sprite_priority,
        width = 246,
        height = 185,
        shift = util.by_pixel(-4.5, 14.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/white-carpet-grass/white-carpet-grass-03.png",
        priority = base_decorative_sprite_priority,
        width = 282,
        height = 220,
        shift = util.by_pixel(2, -15.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/white-carpet-grass/white-carpet-grass-04.png",
        priority = base_decorative_sprite_priority,
        width = 264,
        height = 146,
        shift = util.by_pixel(2, -7.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/white-carpet-grass/white-carpet-grass-05.png",
        priority = base_decorative_sprite_priority,
        width = 235,
        height = 262,
        shift = util.by_pixel(4.25, 2),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/white-carpet-grass/white-carpet-grass-06.png",
        priority = base_decorative_sprite_priority,
        width = 260,
        height = 257,
        shift = util.by_pixel(-0.5, -6.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/white-carpet-grass/white-carpet-grass-07.png",
        priority = base_decorative_sprite_priority,
        width = 244,
        height = 255,
        shift = util.by_pixel(5.5, 2.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/white-carpet-grass/white-carpet-grass-08.png",
        priority = base_decorative_sprite_priority,
        width = 252,
        height = 241,
        shift = util.by_pixel(-4, 12.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/white-carpet-grass/white-carpet-grass-09.png",
        priority = base_decorative_sprite_priority,
        width = 260,
        height = 135,
        shift = util.by_pixel(0, 9.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/white-carpet-grass/white-carpet-grass-10.png",
        priority = base_decorative_sprite_priority,
        width = 272,
        height = 290,
        shift = util.by_pixel(5, -7.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/white-carpet-grass/white-carpet-grass-11.png",
        priority = base_decorative_sprite_priority,
        width = 267,
        height = 253,
        shift = util.by_pixel(0.75, -1.75),
        scale = 0.5
      }
    }
  },
 -- BARNACLES
  {
    name = "barnacles-decal",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-3.375, -2.3125}, {3.25, 2.3125}},
    -- don't collide with water so can overlap shallows, but tile restricturion means it cannot be placed directly on shallows
    collision_mask = dec_default_collision(),
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    autoplace = {
      tile_restriction = gleba_land_tiles,
      probability_expression = "grpi(0.2) + gleba_select(gleba_barnacles - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    pictures =
    {
      --lightDecal
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-00.png",
        width = 400,
        height = 299,
        shift = util.by_pixel(4.5, -2.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-01.png",
        width = 419,
        height = 320,
        shift = util.by_pixel(-0.75, 2),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-02.png",
        width = 417,
        height = 287,
        shift = util.by_pixel(-1.25, 1.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-03.png",
        width = 421,
        height = 298,
        shift = util.by_pixel(-0.25, 5.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-04.png",
        width = 396,
        height = 302,
        shift = util.by_pixel(6, 4),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-05.png",
        width = 408,
        height = 295,
        shift = util.by_pixel(-2.5, 7.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-06.png",
        width = 417,
        height = 317,
        shift = util.by_pixel(-1.25, 3.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-07.png",
        width = 419,
        height = 312,
        shift = util.by_pixel(0.75, 2.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-08.png",
        width = 413,
        height = 317,
        shift = util.by_pixel(-2.25, 2.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-09.png",
        width = 403,
        height = 310,
        shift = util.by_pixel(0.25, 1.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-10.png",
        width = 411,
        height = 307,
        shift = util.by_pixel(-0.75, 1.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-11.png",
        width = 421,
        height = 295,
        shift = util.by_pixel(-0.25, -0.75),
        scale = 0.5
      },
      -- it's a placeholder, 12 variations is enought to get an idea of the direction
      --[[
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-12.png",
        width = 420,
        height = 280,
        shift = util.by_pixel(-0.5, -7),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-13.png",
        width = 403,
        height = 311,
        shift = util.by_pixel(0.75, 3.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-14.png",
        width = 418,
        height = 304,
        shift = util.by_pixel(0, 2),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-15.png",
        width = 398,
        height = 284,
        shift = util.by_pixel(-3.5, 6.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-16.png",
        width = 406,
        height = 313,
        shift = util.by_pixel(4, 0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-17.png",
        width = 420,
        height = 294,
        shift = util.by_pixel(0.5, 4.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-18.png",
        width = 379,
        height = 289,
        shift = util.by_pixel(0.25, 5.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-19.png",
        width = 401,
        height = 311,
        shift = util.by_pixel(-5.25, 1.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-20.png",
        width = 418,
        height = 315,
        shift = util.by_pixel(0.5, 1.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-21.png",
        width = 418,
        height = 314,
        shift = util.by_pixel(1, 3),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-22.png",
        width = 421,
        height = 270,
        shift = util.by_pixel(-0.25, 1),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-23.png",
        width = 403,
        height = 290,
        shift = util.by_pixel(2.25, -2.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-24.png",
        width = 418,
        height = 315,
        shift = util.by_pixel(-0.5, 2.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-25.png",
        width = 414,
        height = 310,
        shift = util.by_pixel(-2, 4),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-26.png",
        width = 403,
        height = 306,
        shift = util.by_pixel(-3.75, 5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-27.png",
        width = 416,
        height = 303,
        shift = util.by_pixel(1, 0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-28.png",
        width = 422,
        height = 311,
        shift = util.by_pixel(0, 2.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/barnacles-decal/barnacles-decal-29.png",
        width = 406,
        height = 292,
        shift = util.by_pixel(-3.5, 2),
        scale = 0.5
      }]]
    }
  },
 -- CORAL STUNTED GREY
  {
    name = "coral-stunted-grey",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-3.375, -2.3125}, {3.25, 2.3125}},
    -- don't collide with water so can overlap shallows, but tile restricturion means it cannot be placed directly on shallows
    collision_mask = dec_default_collision(),
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    autoplace = {
      tile_restriction = gleba_land_tiles,
      probability_expression = "gleba_coral_stunted_grey"
    },
    pictures =
    {
      --lightDecal
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-00.png",
        width = 400,
        height = 299,
        shift = util.by_pixel(4.5, -2.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-01.png",
        width = 419,
        height = 320,
        shift = util.by_pixel(-0.75, 2),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-02.png",
        width = 417,
        height = 287,
        shift = util.by_pixel(-1.25, 1.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-03.png",
        width = 421,
        height = 298,
        shift = util.by_pixel(-0.25, 5.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-04.png",
        width = 396,
        height = 302,
        shift = util.by_pixel(6, 4),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-05.png",
        width = 408,
        height = 295,
        shift = util.by_pixel(-2.5, 7.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-06.png",
        width = 417,
        height = 317,
        shift = util.by_pixel(-1.25, 3.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-07.png",
        width = 419,
        height = 312,
        shift = util.by_pixel(0.75, 2.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-08.png",
        width = 413,
        height = 317,
        shift = util.by_pixel(-2.25, 2.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-09.png",
        width = 403,
        height = 310,
        shift = util.by_pixel(0.25, 1.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-10.png",
        width = 411,
        height = 307,
        shift = util.by_pixel(-0.75, 1.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-11.png",
        width = 421,
        height = 295,
        shift = util.by_pixel(-0.25, -0.75),
        scale = 0.5
      },
      -- it's a placeholder, 12 variations is enought to get an idea of the direction
      --[[
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-12.png",
        width = 420,
        height = 280,
        shift = util.by_pixel(-0.5, -7),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-13.png",
        width = 403,
        height = 311,
        shift = util.by_pixel(0.75, 3.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-14.png",
        width = 418,
        height = 304,
        shift = util.by_pixel(0, 2),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-15.png",
        width = 398,
        height = 284,
        shift = util.by_pixel(-3.5, 6.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-16.png",
        width = 406,
        height = 313,
        shift = util.by_pixel(4, 0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-17.png",
        width = 420,
        height = 294,
        shift = util.by_pixel(0.5, 4.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-18.png",
        width = 379,
        height = 289,
        shift = util.by_pixel(0.25, 5.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-19.png",
        width = 401,
        height = 311,
        shift = util.by_pixel(-5.25, 1.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-20.png",
        width = 418,
        height = 315,
        shift = util.by_pixel(0.5, 1.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-21.png",
        width = 418,
        height = 314,
        shift = util.by_pixel(1, 3),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-22.png",
        width = 421,
        height = 270,
        shift = util.by_pixel(-0.25, 1),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-23.png",
        width = 403,
        height = 290,
        shift = util.by_pixel(2.25, -2.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-24.png",
        width = 418,
        height = 315,
        shift = util.by_pixel(-0.5, 2.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-25.png",
        width = 414,
        height = 310,
        shift = util.by_pixel(-2, 4),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-26.png",
        width = 403,
        height = 306,
        shift = util.by_pixel(-3.75, 5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-27.png",
        width = 416,
        height = 303,
        shift = util.by_pixel(1, 0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-28.png",
        width = 422,
        height = 311,
        shift = util.by_pixel(0, 2.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted-grey/coral-stunted-grey-29.png",
        width = 406,
        height = 292,
        shift = util.by_pixel(-3.5, 2),
        scale = 0.5
      }]]
    }
  },
 -- CORAL STUNTED
  {
    name = "coral-stunted",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-3.375, -2.3125}, {3.25, 2.3125}},
    -- don't collide with water so can overlap shallows, but tile restricturion means it cannot be placed directly on shallows
    collision_mask = dec_default_collision(),
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    autoplace = {
      tile_restriction = gleba_land_tiles,
      probability_expression = "min(0.2, gleba_coral_stunted)"
    },
    pictures =
    {
      --lightDecal
      {
        filename = "__space-age__/graphics/decorative/coral-stunted/coral-stunted-00.png",
        width = 400,
        height = 299,
        shift = util.by_pixel(4.5, -2.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted/coral-stunted-01.png",
        width = 419,
        height = 320,
        shift = util.by_pixel(-0.75, 2),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted/coral-stunted-02.png",
        width = 417,
        height = 287,
        shift = util.by_pixel(-1.25, 1.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted/coral-stunted-03.png",
        width = 421,
        height = 298,
        shift = util.by_pixel(-0.25, 5.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted/coral-stunted-04.png",
        width = 396,
        height = 302,
        shift = util.by_pixel(6, 4),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted/coral-stunted-05.png",
        width = 408,
        height = 295,
        shift = util.by_pixel(-2.5, 7.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted/coral-stunted-06.png",
        width = 417,
        height = 317,
        shift = util.by_pixel(-1.25, 3.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted/coral-stunted-07.png",
        width = 419,
        height = 312,
        shift = util.by_pixel(0.75, 2.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted/coral-stunted-08.png",
        width = 413,
        height = 317,
        shift = util.by_pixel(-2.25, 2.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted/coral-stunted-09.png",
        width = 403,
        height = 310,
        shift = util.by_pixel(0.25, 1.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted/coral-stunted-10.png",
        width = 411,
        height = 307,
        shift = util.by_pixel(-0.75, 1.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/coral-stunted/coral-stunted-11.png",
        width = 421,
        height = 295,
        shift = util.by_pixel(-0.25, -0.75),
        scale = 0.5
      }
    }
  },
 -- SPAWNER SLIME
  {
    name = "gleba-spawner-slime",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_mask = {layers={ground_tile=true}, colliding_with_tiles_only=true}, -- allow on deeper water (which has doodad=true)
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    render_layer = "decals",
    tile_layer = 10, -- above water tiles, blow land tiles
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/gleba-spawner-slime/spawning-foam-0000.png",
        width = 768,
        height = 768,
        shift = util.by_pixel(0, 0),
        scale = 0.5
      },
      {
      filename = "__space-age__/graphics/decorative/gleba-spawner-slime/spawning-foam-0001.png",
      width = 768,
      height = 768,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    },
    {
      filename = "__space-age__/graphics/decorative/gleba-spawner-slime/spawning-foam-0002.png",
      width = 768,
      height = 768,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    },
    {
      filename = "__space-age__/graphics/decorative/gleba-spawner-slime/spawning-foam-0003.png",
      width = 768,
      height = 768,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    },
    {
      filename = "__space-age__/graphics/decorative/gleba-spawner-slime/spawning-foam-0004.png",
      width = 768,
      height = 768,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    },
    {
      filename = "__space-age__/graphics/decorative/gleba-spawner-slime/spawning-foam-0005.png",
      width = 768,
      height = 768,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    },
    {
      filename = "__space-age__/graphics/decorative/gleba-spawner-slime/spawning-foam-0006.png",
      width = 768,
      height = 768,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    },
    }
  },
 -- CLIFF ROOTS
  {
    name = "knobbly-roots",
    type = "optimized-decorative",
    -- order = "a[polycephalum]-a[slime]",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    collision_mask = dec_shallow_collision(),
    walking_sound = sounds.plant,
    -- trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    autoplace = { -- based on funnel trunk
      probability_expression = "2 * gleba_funnel_trunk_region"
    },
    pictures = decorative_pictures_spritesheet{path = "__space-age__/graphics/decorative/gleba-cliff-roots/gleba-cliff-roots", count = 24}
  },
  -- CLIFF ROOTS ORANGE
  {
    name = "knobbly-roots-orange",
    type = "optimized-decorative",
    -- order = "a[polycephalum]-a[slime]",
    collision_mask = dec_shallow_collision(),
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    walking_sound = sounds.plant,
    -- trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    autoplace = { -- based on boom puff
      probability_expression = "2 * gleba_boompuff_region"
    },
    pictures = decorative_pictures_spritesheet{path = "__space-age__/graphics/decorative/gleba-cliff-roots-orange/gleba-cliff-roots-orange", count = 24}
  },
 -- IRON STROMATOLITE
  {
    name = "iron-stromatolite",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/iron-stromatolite.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-a[big]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.7, -0.7}, {0.7, 0.7}},
    collision_mask = {layers={player=true, ground_tile=true, train=true, is_object=true, is_lower_object=true}},
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    max_health = 500,
    autoplace = {
      probability_expression = "gleba_select(gleba_iron_stromatolite - clamp(gleba_decorative_knockout, 0, 1), 1.3, 2, 0.2, 0, 1)"
    },
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "iron-ore-particle",
      mining_time = 0.4,
      results = {
        {type = "item", name = "stone", amount_min = 3, amount_max = 7},
        {type = "item", name = "iron-ore", amount_min = 13, amount_max = 17},
        {type = "item", name = "iron-bacteria", amount_min = 23, amount_max = 37}
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = sounds.deconstruct_bricks(1.0),
    impact_category = "stone",
    pictures =
    {
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-01.png",
        width = 209,
        height = 138,
        shift = {0.304688, -0.4},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-02.png",
        width = 165,
        height = 129,
        shift = {0.0, 0.0390625},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-03.png",
        width = 151,
        height = 139,
        shift = {0.151562, 0.0},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-04.png",
        width = 216,
        height = 110,
        shift = {0.390625, 0.0},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-05.png",
        width = 154,
        height = 147,
        shift = {0.328125, 0.0703125},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-06.png",
        width = 154,
        height = 132,
        shift = {0.16875, -0.1},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-07.png",
        width = 193,
        height = 130,
        shift = {0.3, -0.2},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-08.png",
        width = 136,
        height = 117,
        shift = {0.0, 0.0},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-09.png",
        width = 157,
        height = 115,
        shift = {0.1, 0.0},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-10.png",
        width = 198,
        height = 153,
        shift = {0.325, -0.1},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-11.png",
        width = 190,
        height = 115,
        shift = {0.453125, 0.0},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-12.png",
        width = 229,
        height = 126,
        shift = {0.539062, -0.015625},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-13.png",
        width = 151,
        height = 125,
        shift = {0.0703125, 0.179688},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-14.png",
        width = 137,
        height = 117,
        shift = {0.160938, 0.0},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-15.png",
        width = 201,
        height = 141,
        shift = {0.242188, -0.195312},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/iron/stromatolite-16.png",
        width = 209,
        height = 154,
        shift = {0.351562, -0.1},
        scale = 0.4
      }
    }
  },
 -- COPPER STROMATOLITE
  {
    name = "copper-stromatolite",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/copper-stromatolite.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-a[big]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.7, -0.7}, {0.7, 0.7}},
    collision_mask = {layers={player=true, ground_tile=true, train=true, is_object=true, is_lower_object=true}},
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    max_health = 500,
    autoplace = {
      probability_expression = "gleba_select(gleba_copper_stromatolite - clamp(gleba_decorative_knockout, 0, 1), 1.3, 2, 0.2, 0, 1)"
    },
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "copper-ore-particle",
      mining_time = 0.4,
      results = {
        {type = "item", name = "stone", amount_min = 3, amount_max = 7},
        {type = "item", name = "copper-ore", amount_min = 13, amount_max = 17},
        {type = "item", name = "copper-bacteria", amount_min = 23, amount_max = 37}
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = sounds.deconstruct_bricks(1.0),
    impact_category = "stone",
    pictures =
    {
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-01.png",
        width = 209,
        height = 138,
        shift = {0.304688, -0.4},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-02.png",
        width = 165,
        height = 129,
        shift = {0.0, 0.0390625},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-03.png",
        width = 151,
        height = 139,
        shift = {0.151562, 0.0},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-04.png",
        width = 216,
        height = 110,
        shift = {0.390625, 0.0},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-05.png",
        width = 154,
        height = 147,
        shift = {0.328125, 0.0703125},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-06.png",
        width = 154,
        height = 132,
        shift = {0.16875, -0.1},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-07.png",
        width = 193,
        height = 130,
        shift = {0.3, -0.2},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-08.png",
        width = 136,
        height = 117,
        shift = {0.0, 0.0},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-09.png",
        width = 157,
        height = 115,
        shift = {0.1, 0.0},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-10.png",
        width = 198,
        height = 153,
        shift = {0.325, -0.1},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-11.png",
        width = 190,
        height = 115,
        shift = {0.453125, 0.0},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-12.png",
        width = 229,
        height = 126,
        shift = {0.539062, -0.015625},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-13.png",
        width = 151,
        height = 125,
        shift = {0.0703125, 0.179688},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-14.png",
        width = 137,
        height = 117,
        shift = {0.160938, 0.0},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-15.png",
        width = 201,
        height = 141,
        shift = {0.242188, -0.195312},
        scale = 0.4
      },
      {
        filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-16.png",
        width = 209,
        height = 154,
        shift = {0.351562, -0.1},
        scale = 0.4
      }
    }
  }
}

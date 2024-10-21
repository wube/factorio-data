local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local cloud_wipe_tick = 550
local rocket_separation_tick = 400
local flight_duration = 1200
local solo_duration = 800

local space_bg_strength = { 0.6, 0.6 }
local space_star_strength = { 0.8, 0.8 }

local dpt_spd = 1.5
local space_layers = {}
space_layers.departure =
{
  { --stars
    type = "cover-graphic",
    name = "space paralax stars",
    render_layer = "floor",
    secondary_draw_order = -20,

    texture_relative_to = "ground-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    pod_movement_strength = space_star_strength,
    reference_group = "procession-stars-bg",

    world_size = { 1024, 1024 },
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_stars_background },
    mask_graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_mask },
    effect =
    {
      style = "horizontal-stripe",
      relative_to = "pod"
    },
    frames =
    {
      { timestamp = 0, effect_scale_min = 1.4 },
      { timestamp = 0, effect_scale_max = 1.7 },
      { timestamp = 0, effect_shift = {0, 3} },
      { timestamp = 650, effect_shift = {0, 0} },
      { timestamp = 550, effect_shift_rate = 0 },
      { timestamp = 650, effect_shift_rate = 1 },

      { timestamp = cloud_wipe_tick, offset = {3, -10}, offset_t = {0, 8} },
      { timestamp = flight_duration, offset = {0, 0}, offset_t = {-3, 3} },
      --[[
        [
          { "timestamp": 0, "offset": { "x":3, "y":-10 }, "offset_t" : { "x":0, "y":6 }},
          { "timestamp": 100, "offset": { "x":0, "y":0 }, "offset_t" : { "x":-3, "y":3 }}
        ]
      ]]--
      { timestamp=rocket_separation_tick, offset_rate = 0, offset_rate_t = 0  },
      { timestamp=flight_duration, offset_rate = 1.6, offset_rate_t = -0.6 },
      --[[
      [
        { "timestamp": 500, "offset_rate": { "x":0 }, "offset_rate_t" : { "x":0 }},
        { "timestamp": 998, "offset_rate": { "x":1.6 }, "offset_rate_t" : { "x":-0.6 }}
      ]
      ]]--
    }
  }
}

local spd = 1.1
space_layers.intermezzo =
{
  {
    type = "cover-graphic",
    name = "space paralax stars",
    render_layer = "floor",
    secondary_draw_order = -20,

    texture_relative_to = "ground-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    pod_movement_strength = space_star_strength,
    reference_group = "procession-stars-bg",
    inherit_from = "procession-stars-bg",

    world_size = { 1024, 1024 },
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_stars_background },
    frames =
    {
      { timestamp = 0 , offset = { 0.0, 0.0 } },
      { timestamp = 50, offset = { -0.4 * spd, 0.4 * spd} }
    }
  }
}

local arrival_space_fade_start = 50
local arrival_space_fade_end = 150
space_layers.arrival =
{
  { -- space paralax stars
    type = "cover-graphic",
    name = "space paralax stars",
    render_layer = "floor",
    secondary_draw_order = -20,

    texture_relative_to = "spawn-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    pod_movement_strength = space_star_strength,
    inherit_from = "procession-stars-bg",

    world_size = { 1024, 1024 },
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_stars_background },
    frames =
    {
      { timestamp = arrival_space_fade_start , opacity = 1.00 },
      { timestamp = arrival_space_fade_end , opacity = 0.00 },
    }
  }
}
return space_layers

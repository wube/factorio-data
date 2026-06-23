local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local space_layers = {}
space_layers.departure =
{
  {
    type = "cover-graphic",
    name = "space paralax stars",
    render_layer = "floor",
    secondary_draw_order = -20,
    reference_group = "procession-stars-bg",
    texture_relative_to = "ground-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    pod_movement_strength = { 0.8, 0.8 },
    world_size = { 1024, 1024 },
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_stars_background },
    frames =
    {
      { timestamp = 175 , opacity = 0.00 },
      { timestamp = 350 , opacity = 1.00 },
    }
  }
}

local intermezzo_rate = 0.4
space_layers.intermezzo =
{
  {
    type = "cover-graphic",
    name = "space paralax stars",
    render_layer = "floor",
    secondary_draw_order = -20,
    reference_group = "procession-stars-bg",
    inherit_from = "procession-stars-bg",
    texture_relative_to = "ground-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    pod_movement_strength = { 0.8, 0.8 },
    world_size = { 1024, 1024 },
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_stars_background },
    frames =
    {
      { timestamp = 0 , offset = { 0.0, 0.0 } },
      { timestamp = 50, offset = { 0.8 * 1.28 * intermezzo_rate, -0.8 * intermezzo_rate } }
    }
  }
}

space_layers.arrival =
{
  {
    type = "cover-graphic",
    name = "space paralax stars",
    render_layer = "floor",
    secondary_draw_order = -20,

    texture_relative_to = "spawn-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    pod_movement_strength = { 0.8, 0.8 },
    inherit_from = "procession-stars-bg",
    is_cloud_effect_advanced = true,
    end_time = 290,

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
      { timestamp = 0, effect_scale_min = 1.3 },
      { timestamp = 0, effect_scale_max = 1.7 },
      { timestamp = 0, effect_shift = {0, 0} },
      { timestamp = 400, effect_shift = {0, 3} },
      { timestamp = 150, effect_shift_rate = 0 },
      { timestamp = 300, effect_shift_rate = 1 },
    }
  }
}
return space_layers

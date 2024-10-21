local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local cloud_start = 50
local cloud_end = 450

local layered_layer = -2

return
{
  { --main cloud
    type = "cover-graphic",
    name = "main cloud",
    render_layer = "floor",
    secondary_draw_order = -1,
    texture_relative_to = "ground-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    world_size = { 1024, 1024 },
    start_time = cloud_start,
    end_time = cloud_end,
    is_cloud_effect_advanced = true,
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape },
    mask_graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_mask },
    effect =
    {
      style = "horizontal-stripe",
      relative_to = "pod"
    },
    frames =
    {
      { timestamp = 0, effect_scale_min = 0.34 },
      { timestamp = 0, effect_scale_max = 0.71 },
      { timestamp = cloud_start, effect_shift = {0, -2.7} },
      { timestamp = cloud_end, effect_shift = {0, 2.7} },
      { timestamp = cloud_start, effect_shift_rate = 0 },
      { timestamp = cloud_end, effect_shift_rate = 1 },

      { timestamp = 0 , opacity = 1.00 },

      { timestamp = 0 , offset = {0, 0} },
      { timestamp = 550 , offset = {1, -4} },
    }
  },
  { --stretch cloud
    type = "cover-graphic",
    name = "stretch cloud",
    render_layer = "floor",
    secondary_draw_order = 5,
    texture_relative_to = "ground-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    world_size = { 768, 768 },
    start_time = cloud_start,
    end_time = cloud_end,
    is_cloud_effect_advanced = true,
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape },
    mask_graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_mask },
    effect =
    {
      style = "horizontal-stripe",
      relative_to = "pod"
    },
    frames =
    {
      { timestamp = 0, effect_scale_min = 0.9 },
      { timestamp = 0, effect_scale_max = 2.1 },
      { timestamp = cloud_start, effect_shift = {0, -2.6} },
      { timestamp = cloud_end, effect_shift = {0, 2.8} },
      { timestamp = cloud_start, effect_shift_rate = 0 },
      { timestamp = cloud_end, effect_shift_rate = 1 },

      { timestamp = 0 , opacity = 0.4 },

      { timestamp = 0 , offset = {2, 1} },
      { timestamp = 550 , offset = {4, -3} },
    }
  },
  { --top cloud 1
    type = "cover-graphic",
    name = "top cloud 1",
    render_layer = "floor",
    secondary_draw_order = layered_layer + 1,
    texture_relative_to = "ground-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    world_size = { 768, 768 },
    start_time = cloud_start,
    end_time = cloud_end,
    is_cloud_effect_advanced = true,
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_lvl0 },
    mask_graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_lvl0_mask },
    effect =
    {
      style = "horizontal-stripe",
      relative_to = "pod"
    },
    frames =
    {
      { timestamp = 0, effect_scale_min = 1.1 },
      { timestamp = 0, effect_scale_max = 2.0 },
      { timestamp = cloud_start, effect_shift = {0, -3.7} },
      { timestamp = cloud_end, effect_shift = {0, 3.5} },
      { timestamp = cloud_start, effect_shift_rate = 0 },
      { timestamp = cloud_end, effect_shift_rate = 1 },

      { timestamp = cloud_start , opacity = 0.0 },
      { timestamp = (cloud_start + cloud_end)*0.4 , opacity = 0.9 },
      { timestamp = (cloud_start + cloud_end)*0.6 , opacity = 0.8 },
      { timestamp = cloud_end , opacity = 0.0 },

      { timestamp = 0 , offset = {2, 1} },
      { timestamp = 550 , offset = {4, -3} },
    }
  },
  { --top cloud 2
    type = "cover-graphic",
    name = "top cloud 2",
    render_layer = "floor",
    secondary_draw_order = layered_layer + 2,
    texture_relative_to = "ground-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    world_size = { 968, 968 },
    start_time = cloud_start,
    end_time = cloud_end,
    is_cloud_effect_advanced = true,
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_lvl1 },
    mask_graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_lvl1_mask },
    effect =
    {
      style = "horizontal-stripe",
      relative_to = "pod"
    },
    frames =
    {
      { timestamp = 0, effect_scale_min = 1.1 },
      { timestamp = 0, effect_scale_max = 2.0 },
      { timestamp = cloud_start, effect_shift = {0, -3.65} },
      { timestamp = cloud_end, effect_shift = {0, 3.85} },
      { timestamp = cloud_start, effect_shift_rate = 0 },
      { timestamp = cloud_end, effect_shift_rate = 1 },

      { timestamp = cloud_start , opacity = 0.0 },
      { timestamp = (cloud_start + cloud_end)*0.4 , opacity = 0.9 },
      { timestamp = (cloud_start + cloud_end)*0.6 , opacity = 0.8 },
      { timestamp = cloud_end , opacity = 0.0 },

      { timestamp = 0 , offset = {2, 1} },
      { timestamp = 550 , offset = {4, -3} },
    }
  },
  { --top cloud 3
    type = "cover-graphic",
    name = "top cloud 3",
    render_layer = "floor",
    secondary_draw_order = layered_layer + 3,
    texture_relative_to = "ground-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    world_size = { 1208, 1208 },
    start_time = cloud_start,
    end_time = cloud_end,
    is_cloud_effect_advanced = true,
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_lvl2 },
    mask_graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_lvl2_mask },
    effect =
    {
      style = "horizontal-stripe",
      relative_to = "pod"
    },
    frames =
    {
      { timestamp = 0, effect_scale_min = 1.1 },
      { timestamp = 0, effect_scale_max = 2.0 },
      { timestamp = cloud_start, effect_shift = {0, -3.6} },
      { timestamp = cloud_end, effect_shift = {0, 3.8} },
      { timestamp = cloud_start, effect_shift_rate = 0 },
      { timestamp = cloud_end, effect_shift_rate = 1 },

      { timestamp = cloud_start , opacity = 0.0 },
      { timestamp = (cloud_start + cloud_end)*0.4 , opacity = 0.9 },
      { timestamp = (cloud_start + cloud_end)*0.6 , opacity = 0.8 },
      { timestamp = cloud_end , opacity = 0.0 },

      { timestamp = 0 , offset = {2, 1} },
      { timestamp = 550 , offset = {4, -3} },
    }
  },
  { --top cloud 4
    type = "cover-graphic",
    name = "top cloud 4",
    render_layer = "collision-selection-box",
    secondary_draw_order = layered_layer + 4,
    texture_relative_to = "ground-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    world_size = { 868, 868 },
    start_time = cloud_start,
    end_time = cloud_end,
    is_cloud_effect_advanced = true,
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_lvl3 },
    mask_graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_lvl3_mask },
    effect =
    {
      style = "horizontal-stripe",
      relative_to = "pod"
    },
    frames =
    {
      { timestamp = 0, effect_scale_min = 1.1 },
      { timestamp = 0, effect_scale_max = 2.0 },
      { timestamp = cloud_start, effect_shift = {0, -3.65} },
      { timestamp = cloud_end, effect_shift = {0, 3.85} },
      { timestamp = cloud_start, effect_shift_rate = 0 },
      { timestamp = cloud_end, effect_shift_rate = 1 },

      { timestamp = cloud_start , opacity = 0.0 },
      { timestamp = (cloud_start + cloud_end)*0.4 , opacity = 0.9 },
      { timestamp = (cloud_start + cloud_end)*0.6 , opacity = 0.8 },
      { timestamp = cloud_end , opacity = 0.0 },

      { timestamp = 0 , offset = {2, 1} },
      { timestamp = 550 , offset = {4, -3} },
    }
  },
  {
    type = "cover-graphic",
    name = "haze",
    render_layer = "floor",
    secondary_draw_order = -21,
    world_size = { 512, 512 },
    start_time = 200,
    end_time = 350,
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_tint },
    frames =
    {
      { timestamp = 200, opacity = 0.4 },
      { timestamp = 300, opacity = 0.2 },
      { timestamp = 350, opacity = 0 }
    }
  }
}
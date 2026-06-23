local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")
local pfunctions = require("__space-age__/prototypes/planet/general/general-functions")

local cloud_scl = {-3,-6}                -- movement speed and vector scalar
local parallax_scl = {0.8, 0.9}         -- parallax effect strength

local cloud_anim_range = {40,460}

--                                    START        END        EFFECT_MIN         EFFECT_MAX        EFFECT_SHIFT       OPACITY          LAYERING       PARALLAX

local top_cloud_1 = {                 135,         460,       1.10,              2.00,             -3.5,               1.0,            -2,            0}
local top_cloud_2 = {                 125,         455,       1.10,              2.00,             -3.6,               1.0,            -1,            1}
local top_cloud_3 = {                 105,         440,       1.10,              2.00,             -3.6,               1.0,             1,            2}
local top_cloud_4 = {                 095,         425,       1.10,              2.00,             -3.6,               1.0,             2,            3}
local main_cloud = {                  085,         390,       0.34,              1.71,             -2.7,               1.0,             3,            4}
local stretch_cloud = {               085,         380,       0.30,              1.80,             -2.9,               0.4,             4,            4}

local function make_cloud_frames(cloud_data)
return {
  { timestamp = 0, effect_scale_min = cloud_data[3] },
  { timestamp = 0, effect_scale_max = cloud_data[4] },
  { timestamp = cloud_data[1], effect_shift = {0, cloud_data[5]}, effect_shift_rate = 0 },
  { timestamp = cloud_data[2], effect_shift = {0, -cloud_data[5]}, effect_shift_rate = 1 },

  { timestamp = cloud_anim_range[1] , offset = {0, 0} },
  { timestamp = cloud_anim_range[2] , offset = {cloud_scl[1]*parallax_scl[1]^cloud_data[8], cloud_scl[2]*parallax_scl[2]^cloud_data[8]}}
}
end

return
{
  { --main cloud
    type = "cover-graphic",
    name = "main cloud",
    render_layer = "floor",
    secondary_draw_order = main_cloud[7],
    texture_relative_to = "ground-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    world_size = { 1024, 1024 },
    start_time = main_cloud[1],
    end_time = main_cloud[2],
    is_cloud_effect_advanced = true,
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape },
    mask_graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_mask },
    effect =
    {
      style = "horizontal-stripe",
      relative_to = "pod"
    },
    frames = pfunctions.concN(make_cloud_frames(main_cloud), { timestamp = 0 , opacity = main_cloud[6] })
  },
  { --stretch cloud
    type = "cover-graphic",
    name = "stretch cloud",
    render_layer = "floor",
    secondary_draw_order = stretch_cloud[7],
    texture_relative_to = "ground-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    world_size = { 768, 768 },
    start_time = stretch_cloud[1],
    end_time = stretch_cloud[2],
    is_cloud_effect_advanced = true,
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape },
    mask_graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_mask },
    effect =
    {
      style = "horizontal-stripe",
      relative_to = "pod"
    },
    frames = pfunctions.concN(make_cloud_frames(stretch_cloud), { timestamp = 0 , opacity = stretch_cloud[6] })
  },
  { --top cloud 1
    type = "cover-graphic",
    name = "top cloud 1",
    render_layer = "collision-selection-box",
    secondary_draw_order = top_cloud_1[7],
    texture_relative_to = "ground-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    world_size = { 768, 768 },
    start_time = top_cloud_1[1],
    end_time = top_cloud_1[2],
    is_cloud_effect_advanced = true,
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_lvl0 },
    mask_graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_lvl0_mask },
    effect =
    {
      style = "horizontal-stripe",
      relative_to = "pod"
    },
    frames = pfunctions.concN(make_cloud_frames(top_cloud_1), { timestamp = 0 , opacity = top_cloud_1[6] })
  },
  { --top cloud 2
    type = "cover-graphic",
    name = "top cloud 2",
    render_layer = "floor",
    secondary_draw_order = top_cloud_2[7],
    texture_relative_to = "ground-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    world_size = { 968, 968 },
    start_time = top_cloud_2[1],
    end_time = top_cloud_2[2],
    is_cloud_effect_advanced = true,
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_lvl1 },
    mask_graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_lvl1_mask },
    effect =
    {
      style = "horizontal-stripe",
      relative_to = "pod"
    },
    frames = pfunctions.concN(make_cloud_frames(top_cloud_2), { timestamp = 0 , opacity = top_cloud_2[6] })
  },
  { --top cloud 3
    type = "cover-graphic",
    name = "top cloud 3",
    render_layer = "floor",
    secondary_draw_order = top_cloud_3[7],
    texture_relative_to = "ground-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    world_size = { 1208, 1208 },
    start_time = top_cloud_3[1],
    end_time = top_cloud_3[2],
    is_cloud_effect_advanced = true,
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_lvl2 },
    mask_graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_lvl2_mask },
    effect =
    {
      style = "horizontal-stripe",
      relative_to = "pod"
    },
    frames = pfunctions.concN(make_cloud_frames(top_cloud_3), { timestamp = 0 , opacity = top_cloud_3[6] })
  },
  { --top cloud 4
    type = "cover-graphic",
    name = "top cloud 4",
    render_layer = "floor",
    secondary_draw_order = top_cloud_4[7],
    texture_relative_to = "ground-origin",
    distance_traveled_strength = { 0.0, 0.0 },
    world_size = { 868, 868 },
    start_time = top_cloud_4[1],
    end_time = top_cloud_4[2],
    is_cloud_effect_advanced = true,
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_lvl3 },
    mask_graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_cloudscape_lvl3_mask },
    effect =
    {
      style = "horizontal-stripe",
      relative_to = "pod"
    },
    frames = pfunctions.concN(make_cloud_frames(top_cloud_4), { timestamp = 0 , opacity = top_cloud_4[6] })
  },
  -- HAZE
  {
    type = "cover-graphic",
    name = "haze",
    render_layer = "floor",
    secondary_draw_order = -21,
    world_size = { 512, 512 },
    start_time = 150,
    end_time = 400,
    graphic = { type = "location-catalogue", catalogue_id = procession_graphic_catalogue.planet_tint },
    frames =
    {
      { timestamp = 180, opacity = 0.4 },
      { timestamp = 260, opacity = 0.2 },
      { timestamp = 420, opacity = 0 }
    }
  }
}
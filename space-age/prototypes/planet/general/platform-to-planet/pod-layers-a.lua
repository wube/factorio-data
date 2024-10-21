local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local pfunctions = require("__space-age__/prototypes/planet/general/general-functions")

local jets = pfunctions.conc3(pfunctions.jet_burst(0, 80, procession_graphic_catalogue.thruster_flames_start, procession_graphic_catalogue.thruster_flames_loop),
                              pfunctions.jet_burst(170, 70, procession_graphic_catalogue.thruster_flames_start, procession_graphic_catalogue.thruster_flames_loop),
                              pfunctions.jet_burst(320, 30, procession_graphic_catalogue.thruster_flames_start, procession_graphic_catalogue.thruster_flames_loop))

local jets_emission =
{
  pfunctions.make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_base_emission, 1, 0, 100, false,
  {
    { timestamp = 0, opacity = 0 },
    { timestamp = 10, opacity = 1 },
    { timestamp = 80+10, opacity = 1 },
    { timestamp = 80+20, opacity = 0 },
  }),
  pfunctions.make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_anim_rotation_open_emission, 1, 170, 370, true,
  {
    { timestamp = 170, opacity = 0 },
    { timestamp = 170+10, opacity = 1 },
    { timestamp = 170+10+70, opacity = 1 },
    { timestamp = 170+20+70, opacity = 0 },

    { timestamp = 320, opacity = 0 },
    { timestamp = 320+10, opacity = 1 },
    { timestamp = 320+10+30, opacity = 1 },
    { timestamp = 320+20+30, opacity = 0 },

    { timestamp = 171, frame = 0 },
    { timestamp = 351, frame = 60 }

  }),
}

local pod_layers = pfunctions.conc3(
{
  {
    type = "pod-movement",
    contribute_to_distance_traveled = true,
    distance_traveled_contribution = 1.0,
    frames =
    {
      { timestamp=0, offset = {0, 0}, offset_t = {0, -30} },
      { timestamp=400, offset = {-66, -25}, offset_t = {-64, 50} },
  --[[ offset:
      [
        { "timestamp": 0, "offset": { "x":0.001, "y":0.001 }, "offset_t" : { "x":0, "y":-30.001 }},
        { "timestamp": 200, "offset": { "x":-66.001, "y":-25.001 }, "offset_t" : { "x":-63.999, "y":50 }}
      ]
    ]]--
      { timestamp=0,   offset_rate = 0, offset_rate_t = 0 },
      { timestamp=400, offset_rate = 0, offset_rate_t = 1 },

      { timestamp=150, tilt = 0, tilt_t = 0.0 },
      { timestamp=180, tilt = 0, tilt_t = -0.03  },
      { timestamp=200, tilt = -0.09 , tilt_t = 0.04  },
      { timestamp=263, tilt = -0.02 , tilt_t = -0.03  },
      { timestamp=302, tilt = -0.02 , tilt_t = 0.02  },
      { timestamp=336, tilt = 0.06 , tilt_t = -0.02  },
      { timestamp=382, tilt = 0.08 , tilt_t = 0.0  }
    --[[
        [
          { "timestamp": 150, "tilt": { "x":0 }, "tilt_t" : { "x":0 }},
          { "timestamp": 180, "tilt": { "x":0 }, "tilt_t" : { "x":-0.03 }},
          { "timestamp": 200, "tilt": { "x":-0.09 }, "tilt_t" : { "x":0.04 }},
          { "timestamp": 263, "tilt": { "x":-0.02 }, "tilt_t" : { "x":-0.03 }},
          { "timestamp": 302, "tilt": { "x":-0.02 }, "tilt_t" : { "x":0.02 }},
          { "timestamp": 336, "tilt": { "x":0.06 }, "tilt_t" : { "x":-0.02 }},
          { "timestamp": 382, "tilt": { "x":0.08 }, "tilt_t" : { "x":0.01 }}
        ]
     ]]--
    }
  },
  {
    type = "pod-opacity",
    lut = "__core__/graphics/color_luts/lut-day.png",
    frames =
    {
      { timestamp = 175, lut_blend = 0 },
      { timestamp = 340, lut_blend = 1 },
      { timestamp = 200, outside_opacity = 1 },
      { timestamp = 250, outside_opacity = 0 },
      { timestamp = 150, environment_volume = 1 },
      { timestamp = 250, environment_volume = 0 },
      { timestamp = 100, environment_muffle_intensity = 0 },
      { timestamp = 250, environment_muffle_intensity = 1 },
    }
  },
  pfunctions.make_pod_animation("a_opening", procession_graphic_catalogue.pod_anim_opening, 100, 170,
  {
    { timestamp=100, frame = 0 },
    { timestamp=100+70, frame = 33 }
  }),
  pfunctions.make_pod_animation("a_open_rotation", procession_graphic_catalogue.pod_anim_rotation_open, 171, 0,
  {
    { timestamp=171, frame = 0 },
    { timestamp=351, frame = 59 }
  }),
  {
    type = "single-graphic",
    name = "hatch light",
    render_layer = "object",
    secondary_draw_order = -1,
    relative_to = "ground-origin",
    graphic = { type = "hatch-location-catalogue-index" },
    end_time = 100,
    frames =
    {
      { timestamp = 0, opacity = 0.0 },
      { timestamp = 10, opacity = 1.0 },
      { timestamp = 80, opacity = 1.0 },
      { timestamp = 90, opacity = 0.0 }
    }
  },
}, jets, jets_emission)
return pod_layers

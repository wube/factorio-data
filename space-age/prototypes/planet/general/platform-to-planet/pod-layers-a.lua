-- From hub launch to pre planet atmosphere
local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local pfunctions = require("__space-age__/prototypes/planet/general/general-functions")

local vct = procession_graphic_catalogue.vct_single
local vct_s = procession_graphic_catalogue.vct_small

local jets = pfunctions.concN(pfunctions.jet_burst(0, 80, procession_graphic_catalogue.thruster_flames_start, procession_graphic_catalogue.thruster_flames_loop),
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

local vectoring_single = pfunctions.concN(
  -- vct1, layering, puff_start, reps, rot, dir
  pfunctions.vectoring_single(vct, -1, 145, 2, 0.0, 'R'), -- Clashes with wandering, choose one or the other
  pfunctions.vectoring_single(vct, -1, 210, 4, 0.0, 'L'),
  pfunctions.vectoring_single(vct, -1, 340, 1, 0.0, 'R') -- slight conflict with wandering but not as bad.
)

local vectoring_wandering = pfunctions.concN(
  -- vct1, puff_start, reps, rot, wander_start, wander_time, wander_offset, wander_distance, z_adjustment
  --pfunctions.vectoring_wander(vct_s, 155, 1, 0, 10, 40, 0.33, 0.2, -0.75),
  pfunctions.vectoring_wander(vct_s, 330, 1, 0.5, 0, 45, -0.28, 0.54, -0.73)
)

local pod_layers = pfunctions.concN(
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

      { timestamp=145, tilt = 0  },
      { timestamp=170, tilt = -0.00116 , tilt_t = -0.01315  },
      { timestamp=199, tilt = -0.0564 , tilt_t = 0.01048  },
      { timestamp=223, tilt = -0.05208 , tilt_t = -0.00272  },
      { timestamp=250, tilt = -0.05884 , tilt_t = 0.00384  },
      { timestamp=279, tilt = -0.05262 , tilt_t = 0.00854  },
      { timestamp=308, tilt = -0.00752 , tilt_t = 0.0068  },
      { timestamp=333, tilt = 0.05358 , tilt_t = -0.00609  },
      { timestamp=359, tilt = 0.080 , tilt_t = -0.00577  },
      { timestamp=379, tilt = 0.080  }

    --[[
[
  { "timestamp": 149, "tilt": { "x":0 }, "tilt_t" : { "x":0 }},
  { "timestamp": 170, "tilt": { "x":-1.16 }, "tilt_t" : { "x":-13.15 }},
  { "timestamp": 199, "tilt": { "x":-56.4 }, "tilt_t" : { "x":10.48 }},
  { "timestamp": 223, "tilt": { "x":-52.08 }, "tilt_t" : { "x":-2.72 }},
  { "timestamp": 250, "tilt": { "x":-58.84 }, "tilt_t" : { "x":3.84 }},
  { "timestamp": 279, "tilt": { "x":-52.62 }, "tilt_t" : { "x":8.54 }},
  { "timestamp": 308, "tilt": { "x":-7.52 }, "tilt_t" : { "x":6.8 }},
  { "timestamp": 333, "tilt": { "x":53.58 }, "tilt_t" : { "x":-6.09 }},
  { "timestamp": 358, "tilt": { "x":80 }, "tilt_t" : { "x":-5.77 }},
  { "timestamp": 376, "tilt": { "x":80 }, "tilt_t" : { "x":0 }}
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
}, jets, jets_emission, vectoring_single, vectoring_wandering)
return pod_layers

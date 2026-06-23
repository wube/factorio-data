-- After planet launch, from entry into space to capture by the space platform
local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local pfunctions = require("__space-age__/prototypes/planet/general/general-functions")

local jets = pfunctions.concN(
  pfunctions.jet_burst(110, 60, procession_graphic_catalogue.thruster_flames_start, procession_graphic_catalogue.thruster_flames_loop),
  pfunctions.jet_burst(215, 140, procession_graphic_catalogue.thruster_flames_start, procession_graphic_catalogue.thruster_flames_loop)
  )

local jets_emission =
{
  pfunctions.make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_base_emission, 1, 110, 215+20+140, false,
  {
    { timestamp = 110, opacity = 0 },
    { timestamp = 110+10, opacity = 1 },
    { timestamp = 110+10+60, opacity = 1 },
    { timestamp = 110+20+60, opacity = 0 },

    { timestamp = 215, opacity = 0 },
    { timestamp = 215+10, opacity = 1 },
    { timestamp = 215+10+140, opacity = 1 },
    { timestamp = 215+20+140, opacity = 0 }
  }),
}

local vct = procession_graphic_catalogue.vct_single

local vectoring_single = pfunctions.concN(
  -- vct1, layering, puff_start, reps, rot, dir
  pfunctions.vectoring_single(vct, -1, 0, 2, 0.0, 'R'),
  pfunctions.vectoring_single(vct, -1, 40, 3, 0.0, 'L'),
  pfunctions.vectoring_single(vct, -1, 120, 3, 0.0, 'L'),
  pfunctions.vectoring_single(vct, -1, 160, 2, 0.0, 'L'),
  pfunctions.vectoring_single(vct, -1, 220, 3, 0.0, 'R')
)

local pod_layers = pfunctions.concN(
{
  {
    type = "pod-movement",
    contribute_to_distance_traveled = true,
    distance_traveled_contribution = -1.0,
    frames =
    {
      { timestamp=100, offset = {-60, -10}, offset_t = {26, -27} },
      { timestamp=200, offset = {-10, -43}, offset_t = {10, 7} },
      { timestamp=350, offset = {0, 0}, offset_t = {0, 20} },
  --[[ offset:
      [
  { "timestamp": 0, "offset": { "x":-69.999, "y":0 }, "offset_t" : { "x":39.999, "y":-40.001 }},
  { "timestamp": 200, "offset": { "x":-10, "y":-43 }, "offset_t" : { "x":10, "y":7 }},
  { "timestamp": 350, "offset": { "x":0, "y":0 }, "offset_t" : { "x":0, "y":20 }}
      ]
  ]]--
      { timestamp=0,   offset_rate = 0, offset_rate_t = 0 },
      { timestamp=116, offset_rate = 1, offset_rate_t = -0.34 },
      { timestamp=350, offset_rate = 1, offset_rate_t = 0 },

      --[[       tilt:

  [
  { "timestamp": 0, "tilt": { "x":125 }, "tilt_t" : { "x":1 }},
  { "timestamp": 62, "tilt": { "x":90.22 }, "tilt_t" : { "x":-69.08 }},
  { "timestamp": 93, "tilt": { "x":-120.29 }, "tilt_t" : { "x":78.32 }},
  { "timestamp": 164, "tilt": { "x":-125.23 }, "tilt_t" : { "x":-0.59 }},
  { "timestamp": 211, "tilt": { "x":-131.15 }, "tilt_t" : { "x":41.03 }},
  { "timestamp": 243, "tilt": { "x":1.37 }, "tilt_t" : { "x":-40 }},
  { "timestamp": 289, "tilt": { "x":0 }, "tilt_t" : { "x":0 }}
  ]

      ]]

      { timestamp=0, tilt = 0.125, tilt_t = 0},
      { timestamp=62, tilt = 0.090, tilt_t = -0.07  },
      { timestamp=93, tilt = -0.120, tilt_t = 0.078  },
      { timestamp=164, tilt = -0.125, tilt_t = 0},
      { timestamp=211, tilt = -0.131, tilt_t = 0.041  },
      { timestamp=243, tilt = 0, tilt_t = -0.04  },
      { timestamp=289, tilt = 0  }
    }
  },
  {
    type = "pod-opacity",
    lut = "__core__/graphics/color_luts/lut-day.png",
    frames =
    {
        { timestamp = 100, lut_blend = 1 },
        { timestamp = 150, lut_blend = 0 },
        { timestamp = 175, outside_opacity = 0 },
        { timestamp = 200, outside_opacity = 1 },
        { timestamp = 50, environment_volume = 0 },
        { timestamp = 150, environment_volume = 1 },
        { timestamp = 0, environment_muffle_intensity = 1 },
        { timestamp = 200, environment_muffle_intensity = 0 },
    }
  },
  {
    type = "single-graphic",
    name = "hatch light",
    render_layer = "cargo-hatch",
    secondary_draw_order = -1,
    relative_to = "ground-origin",
    graphic = { type = "hatch-location-catalogue-index" },
    start_time = 250,
    frames =
    {
      { timestamp = 250, opacity = 0.0 },
      { timestamp = 350 - 10, opacity = 1.0 },
      { timestamp = 350, opacity = 0.0 }
    }
  }
}, jets, jets_emission, vectoring_single)

return pod_layers

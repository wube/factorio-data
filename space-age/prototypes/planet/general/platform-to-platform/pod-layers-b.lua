local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local pfunctions = require("__space-age__/prototypes/planet/general/general-functions")

local jets = pfunctions.conc2(
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

local pod_layers = pfunctions.conc3(
{
  {
    type = "pod-movement",
    contribute_to_distance_traveled = true,
    distance_traveled_contribution = -1.0,
    frames =
    {
      { timestamp=0, offset = {-70, -40}, offset_t = {40, 0} },
      { timestamp=200, offset = {-10, -30}, offset_t = {5, 5} },
      { timestamp=350, offset = {0, 0}, offset_t = {0, 20} },
  --[[ offset:
      [
        { "timestamp": 0, "offset": { "x":-70, "y":-40 }, "offset_t" : { "x":40, "y":0 }},
        { "timestamp": 200, "offset": { "x":-10, "y":-30 }, "offset_t" : { "x":5, "y":5 }},
        { "timestamp": 350, "offset": { "x":0, "y":0 }, "offset_t" : { "x":0, "y":20 }}
      ]
  ]]--
      { timestamp=0,   offset_rate = 0, offset_rate_t = 0 },
      { timestamp=116, offset_rate = 1, offset_rate_t = -0.34 },
      { timestamp=350, offset_rate = 1, offset_rate_t = 0 },
      --[[       tilt:
        [
          { "timestamp": 0, "tilt": { "x":0.25 }, "tilt_t" : { "x":1 }},
          { "timestamp": 58, "tilt": { "x":0.09 }, "tilt_t" : { "x":-0.05 }},
          { "timestamp": 111, "tilt": { "x":-0.06 }, "tilt_t" : { "x":0.06 }},
          { "timestamp": 169, "tilt": { "x":-0.06 }, "tilt_t" : { "x":0 }},
          { "timestamp": 216, "tilt": { "x":0.03 }, "tilt_t" : { "x":-0.04 }},
          { "timestamp": 279, "tilt": { "x":0 }, "tilt_t" : { "x":0 }}
        ]
      ]]--
      { timestamp=0, tilt = 0.25 , tilt_t = 0.0  },
      { timestamp=58, tilt = 0.09 , tilt_t = -0.05  },
      { timestamp=111, tilt = -0.06 , tilt_t = 0.06  },
      { timestamp=169, tilt = -0.06  },
      { timestamp=216, tilt = 0.03 , tilt_t = -0.04  },
      { timestamp=279, tilt = 0  }
    }
  },
  {
    type = "pod-opacity",
    lut = "__core__/graphics/color_luts/lut-day.png",
    frames =
    {
        { timestamp = 20, lut_blend = 1 },
        { timestamp = 150, lut_blend = 0 },
        { timestamp = 0, outside_opacity = 0 },
        { timestamp = 100, outside_opacity = 1 },
        { timestamp = 20, environment_volume = 0 },
        { timestamp = 150, environment_volume = 1 },
        { timestamp = 20, environment_muffle_intensity = 1 },
        { timestamp = 150, environment_muffle_intensity = 0 },
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
}, jets, jets_emission)

return pod_layers

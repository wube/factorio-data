-- After hub launch, from pre planet atmosphere to planet landing
local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local pvariables = require("__space-age__/prototypes/planet/general/general-variables")
local pfunctions = require("__space-age__/prototypes/planet/general/general-functions")

local route_scale = 3
local vct = procession_graphic_catalogue.vct_single

local vectoring_single = pfunctions.concN(
  -- vct1, layering, puff_start, reps, rot, dir
  pfunctions.vectoring_single(vct, -1, 10, 1, 0.0, 'R'),
  pfunctions.vectoring_single(vct, -1, 120, 1, 0.0, 'R'),
  pfunctions.vectoring_single(vct, -1, 290, 3, 0.0, 'L'),
  pfunctions.vectoring_single(vct, -1, 370, 1, 0.0, 'L'),
  pfunctions.vectoring_single(vct, -1, 390, 1, 0.0, 'R')
)

local pod_layers_b = {}
pod_layers_b.shared = pfunctions.concN(
{
  {
    type = "pod-movement",
    contribute_to_distance_traveled = true,
    distance_traveled_contribution = -1.0,
    frames =
    {
      { timestamp=0, offset = {40*route_scale, -80*route_scale}, offset_t = {-6.4*route_scale, 5*route_scale} },
      { timestamp=200, offset = {7.9*route_scale, -50.63*route_scale}, offset_t = {-7.42*route_scale, 8.87*route_scale} },
      { timestamp=350, offset = {0, -20*route_scale}, offset_t = {0, 4*route_scale} },
      { timestamp=600, offset = {0, 0}, offset_t = {0, 4*route_scale} },
  --[[ offset:
[
  { "timestamp": 0, "offset": { "x":40, "y":-80 }, "offset_t" : { "x":-6.4, "y":5 }},
  { "timestamp": 200, "offset": { "x":7.9, "y":-50.63 }, "offset_t" : { "x":-7.42, "y":8.87 }},
  { "timestamp": 350, "offset": { "x":0, "y":-19.999 }, "offset_t" : { "x":0, "y":3.999 }},
  { "timestamp": 600, "offset": { "x":0, "y":0 }, "offset_t" : { "x":0, "y":3.999 }}
]
    ]]--
    { timestamp=0, offset_rate = 0 , offset_rate_t = 0  },
    { timestamp=237, offset_rate = 0.6761 , offset_rate_t = -0.0935  },
    { timestamp=419, offset_rate = 0.9246 , offset_rate_t = -0.0219  },
    { timestamp=512, offset_rate = 0.9902 , offset_rate_t = -0.0106  },
    { timestamp=600, offset_rate = 1 , offset_rate_t = 0  },
  --[[
[
  { "timestamp": 0, "offset_rate": { "x":0 }, "offset_rate_t" : { "x":0 }},
  { "timestamp": 237, "offset_rate": { "x":67.61 }, "offset_rate_t" : { "x":-9.35 }},
  { "timestamp": 419, "offset_rate": { "x":92.46 }, "offset_rate_t" : { "x":-2.19 }},
  { "timestamp": 512, "offset_rate": { "x":99.02 }, "offset_rate_t" : { "x":-1.06 }},
  { "timestamp": 600, "offset_rate": { "x":100 }, "offset_rate_t" : { "x":0 }}
]
    ]]--
      { timestamp = 0,                                                        tilt = 0.08,              tilt_t = 0 },
      { timestamp = pvariables.platform_to_planet_duration_b * 0.2,           tilt = 0.07963,           tilt_t = -0.007089 },
      { timestamp = pvariables.platform_to_planet_duration_b * 0.375,         tilt = 0.05042,           tilt_t = -0.00947 },
      { timestamp = pvariables.platform_to_planet_duration_b * 0.5,           tilt = 0.00093,           tilt_t = 0.01095 },
      { timestamp = pvariables.platform_to_planet_duration_b * 0.635,         tilt = -0.01818,         tilt_t = 0.01023 },
      { timestamp = pvariables.platform_to_planet_duration_b * 0.7,           tilt = 0.00054,         tilt_t = -0.00521 },
      { timestamp = pvariables.platform_to_planet_duration_b,           tilt = 0,                 tilt_t = 0 }
    --[[
  { "timestamp": 273, "tilt": { "x":0.93 }, "tilt_t" : { "x":10.95 }},
  { "timestamp": 349, "tilt": { "x":-18.18 }, "tilt_t" : { "x":10.23 }},
  { "timestamp": 409, "tilt": { "x":0.54 }, "tilt_t" : { "x":-5.21 }},

    [
  { "timestamp": 0, "tilt": { "x":80 }, "tilt_t" : { "x":0 }},
  { "timestamp": 120, "tilt": { "x":79.63 }, "tilt_t" : { "x":-7.089 }},
  { "timestamp": 220, "tilt": { "x":50.42 }, "tilt_t" : { "x":-9.47 }},
  { "timestamp": 300, "tilt": { "x":0.25 }, "tilt_t" : { "x":10.95 }},
  { "timestamp": 380, "tilt": { "x":-3.069 }, "tilt_t" : { "x":1.489 }},
  { "timestamp": 420, "tilt": { "x":-0.148 }, "tilt_t" : { "x":-0.81 }},
  { "timestamp": 500, "tilt": { "x":0 }, "tilt_t" : { "x":0 }}
]
    ]]--
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
      { timestamp = 200, environment_volume = 0 },
      { timestamp = 350, environment_volume = 1 },
      { timestamp = 200, environment_muffle_intensity = 1 },
      { timestamp = 100, environment_muffle_intensity = 0 },
    }
  },
  pfunctions.make_pod_overlay("reentry_flames", procession_graphic_catalogue.reentry_flames, 2, 40, 190, false,
  {
    { timestamp=40, opacity = 0 },
    { timestamp=50, opacity = 1 },
    { timestamp=180, opacity = 1 },
    { timestamp=190, opacity = 0 },
  }),
  -- reentry burst
  pfunctions.make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_start, -1, 20, 30, true,
  {
    { timestamp = 20, frame = 0 },
    { timestamp = 30, frame = 9 }
  }),
  pfunctions.make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_loop, -1, 30, 190, false, {}),
  pfunctions.make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_start, -1, 190, 200, true,
  {
    { timestamp = 190, frame = 9 },
    { timestamp = 200, frame = 0 }
  }),
  pfunctions.make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_open_emission, 1, 20, 200, false,
  {
    { timestamp = 20, opacity = 0 },
    { timestamp = 30, opacity = 1 },
    { timestamp = 190, opacity = 1 },
    { timestamp = 200, opacity = 0 }
  }),
  -- reentry burst end

  -- cloud burst
  pfunctions.make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_start, -1, 220, 230, true,
  {
    { timestamp = 220, frame = 0 },
    { timestamp = 230, frame = 9 }
  }),
  pfunctions.make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_loop, -1, 230, 270, false, {}),
  pfunctions.make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_start, -1, 270, 280, true,
  {
    { timestamp = 270, frame = 9 },
    { timestamp = 280, frame = 0 }
  }),
  pfunctions.make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_open_emission, 1, 220, 280, false,
  {
    { timestamp = 220, opacity = 0 },
    { timestamp = 230, opacity = 1 },
    { timestamp = 270, opacity = 1 },
    { timestamp = 280, opacity = 0 }
  }),
  -- cloud burst end

  -- short burst 1
  pfunctions.make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_start, -1, 320, 330, true,
  {
    { timestamp = 320, frame = 0 },
    { timestamp = 330, frame = 9 }
  }),
  pfunctions.make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_loop, -1, 330, 390, false, {}),
  pfunctions.make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_start, -1, 390, 400, true,
  {
    { timestamp = 390, frame = 9 },
    { timestamp = 400, frame = 0 }
  }),
  pfunctions.make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_open_emission, 1, 320, 400, false,
  {
    { timestamp = 320, opacity = 0 },
    { timestamp = 330, opacity = 1 },
    { timestamp = 390, opacity = 1 },
    { timestamp = 400, opacity = 0 }
  }),
  -- short burst 1 end
},vectoring_single)
pod_layers_b.hatch =
{
  pfunctions.make_pod_animation("a_closing", procession_graphic_catalogue.pod_anim_opening, 0, 0,
  {
    { timestamp=pvariables.platform_to_planet_duration_b - 150, frame = 33 },
    { timestamp=pvariables.platform_to_planet_duration_b      , frame = 0 }
  }),

  -- last burst
  pfunctions.make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_start, -1, 430, 440, true,
  {
    { timestamp = 430, frame = 0 },
    { timestamp = 440, frame = 9 }
  }),
  pfunctions.make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_loop, -1, 440, pvariables.platform_to_planet_duration_b - 10, false, {}),
  pfunctions.make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_start, -1, pvariables.platform_to_planet_duration_b - 10, 0, true,
  {
    { timestamp = pvariables.platform_to_planet_duration_b - 10, frame = 9 },
    { timestamp = pvariables.platform_to_planet_duration_b, frame = 0 }
  }),
  pfunctions.make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_open_emission, 1, 430, pvariables.platform_to_planet_duration_b - 150, false,
  {
    { timestamp = 430, opacity = 0 },
    { timestamp = 440, opacity = 1 }
  }),
  pfunctions.make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_anim_opening_emission, 1, pvariables.platform_to_planet_duration_b - 150, 0, true,
  {
    { timestamp=pvariables.platform_to_planet_duration_b - 150, frame = 33 },
    { timestamp=pvariables.platform_to_planet_duration_b      , frame = 0 },
    { timestamp=pvariables.platform_to_planet_duration_b - 10 , opacity = 1 },
    { timestamp=pvariables.platform_to_planet_duration_b      , opacity = 0 }
  }),
  -- last burst end
  {
    type = "single-graphic",
    name = "hatch light",
    render_layer = "cargo-hatch",
    secondary_draw_order = -1,
    relative_to = "ground-origin",
    graphic = { type = "hatch-location-catalogue-index" },
    start_time = 430,
    frames =
    {
      { timestamp = 430, opacity = 0.0 },
      { timestamp = pvariables.platform_to_planet_duration_b - 10, opacity = 1.0 },
      { timestamp = pvariables.platform_to_planet_duration_b, opacity = 0.0 }
    }
  }
}
pod_layers_b.ground =
{
  pfunctions.make_pod_animation("a_landing", procession_graphic_catalogue.pod_anim_landing, 0, 0,
  {
    { timestamp=pvariables.platform_to_planet_duration_b - 150, frame = 0 },
    { timestamp=pvariables.platform_to_planet_duration_b      , frame = 11 }
  }),

  -- last burst
  pfunctions.make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_start, -1-1, 430, 440, true,
  {
    { timestamp = 430, frame = 0 },
    { timestamp = 440, frame = 9 }
  }),
  pfunctions.make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_loop, -1, 440, pvariables.platform_to_planet_duration_b - 50, false, {}),
  pfunctions.make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_start, -1, pvariables.platform_to_planet_duration_b - 50, pvariables.platform_to_planet_duration_b - 30, true,
  {
    { timestamp = pvariables.platform_to_planet_duration_b - 50, frame = 9 },
    { timestamp = pvariables.platform_to_planet_duration_b - 30, frame = 0 }
  }),
  pfunctions.make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_open_emission, 1, 430, pvariables.platform_to_planet_duration_b - 150, false,
  {
    { timestamp = 430, opacity = 0 },
    { timestamp = 440, opacity = 1 }
  }),
  pfunctions.make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_anim_landing_emission, 1, pvariables.platform_to_planet_duration_b - 150, 0, true,
  {
    { timestamp=pvariables.platform_to_planet_duration_b - 150, frame = 0 },
    { timestamp=pvariables.platform_to_planet_duration_b      , frame = 11 },
    { timestamp=pvariables.platform_to_planet_duration_b - 30 , opacity = 1 },
    { timestamp=pvariables.platform_to_planet_duration_b - 20 , opacity = 0 }
  }),
  -- last burst end
}
return pod_layers_b

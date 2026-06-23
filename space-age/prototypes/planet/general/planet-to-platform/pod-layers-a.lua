-- From planet launch up to entry into space.
local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local pvariables = require("__space-age__/prototypes/planet/general/general-variables")
local pfunctions = require("__space-age__/prototypes/planet/general/general-functions")

local scl = 2.2

local vct = procession_graphic_catalogue.vct_single
local vct_s = procession_graphic_catalogue.vct_small

local jets = pfunctions.concN(pfunctions.jet_burst(pvariables.rocket_separation_tick+70, 15, procession_graphic_catalogue.thruster_flames_start, procession_graphic_catalogue.thruster_flames_loop),
                               pfunctions.jet_burst(pvariables.rocket_separation_tick+115, 40, procession_graphic_catalogue.thruster_flames_start, procession_graphic_catalogue.thruster_flames_loop),
                               pfunctions.jet_burst(pvariables.rocket_separation_tick+220, 160, procession_graphic_catalogue.thruster_flames_start, procession_graphic_catalogue.thruster_flames_loop))

local jets_emission =
{
  pfunctions.make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_anim_rotation_closed_emission, 1, pvariables.rocket_separation_tick+70, pvariables.rocket_separation_tick+248, true,
  {
    { timestamp = pvariables.rocket_separation_tick+70, opacity = 0 },
    { timestamp = pvariables.rocket_separation_tick+70+10, opacity = 1 },
    { timestamp = pvariables.rocket_separation_tick+70+10+15, opacity = 1 },
    { timestamp = pvariables.rocket_separation_tick+70+20+15, opacity = 0 },

    { timestamp = pvariables.rocket_separation_tick+115, opacity = 0 },
    { timestamp = pvariables.rocket_separation_tick+115+10, opacity = 1 },
    { timestamp = pvariables.rocket_separation_tick+115+10+40, opacity = 1 },
    { timestamp = pvariables.rocket_separation_tick+115+20+40, opacity = 0 },

    { timestamp = pvariables.rocket_separation_tick+220, opacity = 0 },
    { timestamp = pvariables.rocket_separation_tick+220+10, opacity = 1 },

    { timestamp = pvariables.rocket_separation_tick+247, opacity = 1 },
    { timestamp = pvariables.rocket_separation_tick+248, opacity = 0 },

    { timestamp = pvariables.rocket_separation_tick+70, frame = 0 },
    { timestamp = pvariables.rocket_separation_tick+70+177, frame = 58 }

  }),
  pfunctions.make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_base_emission, 1, pvariables.rocket_separation_tick+248, pvariables.rocket_separation_tick+400, false,
  {
    { timestamp = pvariables.rocket_separation_tick+248, opacity = 1 },
    { timestamp = pvariables.rocket_separation_tick+220+10+160, opacity = 1 },
    { timestamp = pvariables.rocket_separation_tick+220+20+160, opacity = 0 },
  }),
}

local vectoring_single = pfunctions.concN(
  -- vct1, layering, puff_start, reps, rot, dir
  --pfunctions.vectoring_single(vct, -1, 60+pvariables.rocket_separation_tick, 1, 0.0, 'L'), -- clashes with wandering
  --pfunctions.vectoring_single(vct, -1, 90+pvariables.rocket_separation_tick, 1, 0.0, 'R'), -- clashes with wandering
  pfunctions.vectoring_single(vct, -1, 100+pvariables.rocket_separation_tick, 1, 0.0, 'L'), -- needed

  --pfunctions.vectoring_single(vct, -1, 160+pvariables.rocket_separation_tick, 1, 0.0, 'R'), -- not needed
  --pfunctions.vectoring_single(vct, -1, 180+pvariables.rocket_separation_tick, 1, 0.0, 'L'), -- not needed

  pfunctions.vectoring_single(vct, -1, 280+pvariables.rocket_separation_tick, 1, 0.0, 'L'), -- needed
  --pfunctions.vectoring_single(vct, -1, 285+pvariables.rocket_separation_tick, 1, 0.0, 'R'), -- not needed

  --pfunctions.vectoring_single(vct, -1, 325+pvariables.rocket_separation_tick, 1, 0.0, 'R'), -- not needed
  pfunctions.vectoring_single(vct, -1, 365+pvariables.rocket_separation_tick, 1, 0.0, 'R'),  -- useful

  --pfunctions.vectoring_single(vct, -1, 440+pvariables.rocket_separation_tick, 1, 0.0, 'R') -- optional
  pfunctions.vectoring_single(vct, -1, 460+pvariables.rocket_separation_tick, 1, 0.0, 'R') -- needed
)

local vectoring_wandering = pfunctions.concN(
  -- vct1, puff_start, reps, rot, wander_start, wander_time, wander_offset, wander_distance, z_adjustment
  pfunctions.vectoring_wander(vct_s, 65+pvariables.rocket_separation_tick, 2, 0, 5, 40, 0.02, 0.5, -0.58), -- needed
  pfunctions.vectoring_wander(vct_s, 240+pvariables.rocket_separation_tick, 1, 0.5, 0, 45, -0.30, 0.54, -0.72) -- needed
)

local pod_layers = pfunctions.concN(
{
  {
    type = "pod-movement",
    contribute_to_distance_traveled = true,
    distance_traveled_contribution = 1.0,
    frames =
    {
      { timestamp=0, offset = {0, 0}, offset_t = {0, -5*scl} },
      { timestamp=pvariables.flight_duration*0.3, offset = {0, -25*scl}, offset_t = {0, -10*scl} },
      { timestamp=pvariables.flight_duration*0.6, offset = {5*scl, -50*scl}, offset_t = {5*scl, -10*scl} },
      { timestamp=pvariables.flight_duration, offset = {32*scl, -87*scl}, offset_t = {6*scl, -6*scl} },
      --[[ offset:
        [
          { "timestamp": 0, "offset": { "x":0, "y":0.001 }, "offset_t" : { "x":0, "y":-5 }},
          { "timestamp": 200, "offset": { "x":0, "y":-25 }, "offset_t" : { "x":0.04, "y":-10 }},
          { "timestamp": 350, "offset": { "x":5, "y":-50.001 }, "offset_t" : { "x":5, "y":-9.999 }},
          { "timestamp": 450, "offset": { "x":32, "y":-87 }, "offset_t" : { "x":6, "y":-6.001 }}
        ]
      ]]--
      { timestamp=pvariables.impostor_start_tick, offset_rate = 0, offset_rate_t = 0 },
      { timestamp=pvariables.flight_duration,     offset_rate = 0.9, offset_rate_t = 0.1 },
      --[[ tilt:

[
  { "timestamp": 64, "tilt": { "x":0 }, "tilt_t" : { "x":0 }},
  { "timestamp": 82, "tilt": { "x":2.07 }, "tilt_t" : { "x":2.45 }},
  { "timestamp": 97, "tilt": { "x":12.14 }, "tilt_t" : { "x":-0.6 }},
  { "timestamp": 109, "tilt": { "x":17 }, "tilt_t" : { "x":0 }},
  { "timestamp": 165, "tilt": { "x":38 }, "tilt_t" : { "x":0 }},
  { "timestamp": 180, "tilt": { "x":44.66 }, "tilt_t" : { "x":-0.84 }},
  { "timestamp": 199, "tilt": { "x":49 }, "tilt_t" : { "x":0 }},
  { "timestamp": 284, "tilt": { "x":70 }, "tilt_t" : { "x":0 }},
  { "timestamp": 305, "tilt": { "x":75.14 }, "tilt_t" : { "x":1.2 }},
  { "timestamp": 317, "tilt": { "x":81.4 }, "tilt_t" : { "x":0.3 }},
  { "timestamp": 323, "tilt": { "x":86.36 }, "tilt_t" : { "x":-0.64 }},
  { "timestamp": 344, "tilt": { "x":95.04 }, "tilt_t" : { "x":-0.44 }},
  { "timestamp": 369, "tilt": { "x":103 }, "tilt_t" : { "x":0 }},
  { "timestamp": 372, "tilt": { "x":104.23 }, "tilt_t" : { "x":-0.05 }},
  { "timestamp": 379, "tilt": { "x":106.06 }, "tilt_t" : { "x":-0.05 }},
  { "timestamp": 384, "tilt": { "x":107 }, "tilt_t" : { "x":0 }},
  { "timestamp": 444, "tilt": { "x":118 }, "tilt_t" : { "x":0.56 }},
  { "timestamp": 458, "tilt": { "x":122.25 }, "tilt_t" : { "x":-0.44 }},
  { "timestamp": 472, "tilt": { "x":124.81 }, "tilt_t" : { "x":-0.43 }},
  { "timestamp": 480, "tilt": { "x":125 }, "tilt_t" : { "x":0 }}
]

      ]]

      { timestamp = pvariables.rocket_separation_tick + 64,  tilt = 0.0,   tilt_t = 0.0 },
      { timestamp = pvariables.rocket_separation_tick + 82,  tilt = 0.002, tilt_t = 0.00245 },
      { timestamp = pvariables.rocket_separation_tick + 97,  tilt = 0.012, tilt_t = -0.0006 },
      { timestamp = pvariables.rocket_separation_tick + 109, tilt = 0.017, tilt_t = 0.0 },
      { timestamp = pvariables.rocket_separation_tick + 165, tilt = 0.038, tilt_t = 0.0 },
      { timestamp = pvariables.rocket_separation_tick + 180, tilt = 0.045, tilt_t = -0.00084 },
      { timestamp = pvariables.rocket_separation_tick + 199, tilt = 0.049, tilt_t = 0.0 },
      { timestamp = pvariables.rocket_separation_tick + 284, tilt = 0.070, tilt_t = 0.0 },
      { timestamp = pvariables.rocket_separation_tick + 305, tilt = 0.075, tilt_t = 0.0012 },
      { timestamp = pvariables.rocket_separation_tick + 317, tilt = 0.081, tilt_t = 0.0003 },
      { timestamp = pvariables.rocket_separation_tick + 323, tilt = 0.086, tilt_t = 0.00064 },
      { timestamp = pvariables.rocket_separation_tick + 344, tilt = 0.095, tilt_t = 0.00044 },
      { timestamp = pvariables.rocket_separation_tick + 369, tilt = 0.103, tilt_t = 0.0 },
      { timestamp = pvariables.rocket_separation_tick + 372, tilt = 0.104, tilt_t = -0.00005 },
      { timestamp = pvariables.rocket_separation_tick + 379, tilt = 0.106, tilt_t = -0.00005 },
      { timestamp = pvariables.rocket_separation_tick + 384, tilt = 0.107, tilt_t = 0.0 },
      { timestamp = pvariables.rocket_separation_tick + 444, tilt = 0.118, tilt_t = 0.00056 },
      { timestamp = pvariables.rocket_separation_tick + 458, tilt = 0.122, tilt_t = -0.00044 },
      { timestamp = pvariables.rocket_separation_tick + 472, tilt = 0.125, tilt_t = -0.00043 },
      { timestamp = pvariables.rocket_separation_tick + 480, tilt = 0.125, tilt_t = 0.0 }

    }
  },
  {
  type = "pod-opacity",
  lut = "__core__/graphics/color_luts/lut-day.png",
  frames =
  {
    { timestamp = pvariables.impostor_start_tick      , lut_blend = 0 },
    { timestamp = pvariables.impostor_start_tick + 300, lut_blend = 1 },
    { timestamp = pvariables.impostor_start_tick - 50 , outside_opacity = 1 },
    { timestamp = pvariables.impostor_start_tick, outside_opacity = 0 },
    { timestamp = 250, environment_volume = 1 },
    { timestamp = pvariables.rocket_separation_tick + 100, environment_volume = 0 },
    { timestamp = 100, environment_muffle_intensity = 0 },
    { timestamp = pvariables.impostor_start_tick + 50, environment_muffle_intensity = 0.5 },
    { timestamp = pvariables.rocket_separation_tick + 50, environment_muffle_intensity = 1 },
  }
  },
  pfunctions.make_pod_animation("a_rotation", procession_graphic_catalogue.pod_anim_rotation_closed, pvariables.rocket_separation_tick+70, pvariables.rocket_separation_tick+70+177,
  {
    { timestamp=pvariables.rocket_separation_tick+70, frame = 0 },
    { timestamp=pvariables.rocket_separation_tick+70+177, frame = 58 }
  }),
}, jets, jets_emission, vectoring_single, vectoring_wandering)
return pod_layers

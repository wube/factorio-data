local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local pvariables = require("__space-age__/prototypes/planet/general/general-variables")
local pfunctions = require("__space-age__/prototypes/planet/general/general-functions")

local scl = 2.2

local jets = pfunctions.conc3(pfunctions.jet_burst(pvariables.rocket_separation_tick+70, 15, procession_graphic_catalogue.thruster_flames_start, procession_graphic_catalogue.thruster_flames_loop),
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

local pod_layers = pfunctions.conc3(
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
      { timestamp=pvariables.flight_duration, offset = {18*scl, -70*scl}, offset_t = {6*scl, -6*scl} },
      --[[ offset:
        [
          { "timestamp": 0, "offset": { "x":0, "y":0.001 }, "offset_t" : { "x":0, "y":-5 }},
          { "timestamp": 200, "offset": { "x":0, "y":-25 }, "offset_t" : { "x":0.04, "y":-10 }},
          { "timestamp": 350, "offset": { "x":5, "y":-50.001 }, "offset_t" : { "x":5, "y":-9.999 }},
          { "timestamp": 450, "offset": { "x":18, "y":-70 }, "offset_t" : { "x":6, "y":-6.001 }}
        ]
      ]]--
      { timestamp=pvariables.impostor_start_tick, offset_rate = 0, offset_rate_t = 0 },
      { timestamp=pvariables.flight_duration,     offset_rate = 0.9, offset_rate_t = 0.1 },

      { timestamp = pvariables.impostor_start_tick                       , tilt = 0.0    , tilt_t = 0.0 },
      { timestamp = pvariables.impostor_start_tick + pvariables.solo_duration * 0.4 , tilt = 0.02  , tilt_t = -0.03 },
      { timestamp = pvariables.flight_duration                              , tilt = 0.125 , tilt_t = 0 },
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
}, jets, jets_emission)
return pod_layers

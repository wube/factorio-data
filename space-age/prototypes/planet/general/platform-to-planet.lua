local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local spaceLayers = require("__space-age__/prototypes/planet/general/platform-to-planet/space-layers")
local cloudLayers = require("__space-age__/prototypes/planet/general/platform-to-planet/cloud-layers")
local podLayersA = require("__space-age__/prototypes/planet/general/platform-to-planet/pod-layers-a")
local podLayersB = require("__space-age__/prototypes/planet/general/platform-to-planet/pod-layers-b")
local podLayersI = require("__space-age__/prototypes/planet/general/platform-to-planet/pod-layers-i")

local audio = require("__space-age__/prototypes/planet/general/platform-to-planet/audio-events")

local pvariables = require("__space-age__/prototypes/planet/general/general-variables")
local pfunctions = require("__space-age__/prototypes/planet/general/general-functions")

data:extend(
{
  {
    type = "procession",
    name = "platform-to-planet-a",
    usage = "departure",
    procession_style = procession_style.pod_left_generic,
    timeline =
    {
      duration = pvariables.platform_to_planet_duration_a,
      draw_switch_tick = 170,
      layers = pfunctions.conc2(spaceLayers.departure, podLayersA),
      audio_events = audio.a
    }
  },
  {
    type = "procession",
    name = "platform-to-planet-b",
    usage = "arrival",
    procession_style = procession_style.pod_left_generic,
    timeline =
    {
      duration = pvariables.platform_to_planet_duration_b,
      special_action_tick = pvariables.platform_to_planet_hatch_open,
      layers = pfunctions.conc4(spaceLayers.arrival, podLayersB.shared, podLayersB.hatch, cloudLayers),
      audio_events = pfunctions.conc2(audio.b_shared, audio.b_hatch)
    },
    ground_timeline =
    {
      duration = pvariables.platform_to_planet_duration_b,
      layers = pfunctions.conc4(spaceLayers.arrival, podLayersB.shared, podLayersB.ground, cloudLayers),
      audio_events = pfunctions.conc2(audio.b_shared, audio.b_ground)
    }
  },
  {
    type = "procession",
    name = "platform-to-planet-intermezzo",
    usage = "intermezzo",
    procession_style = procession_style.pod_left_generic,
    timeline =
    {
      duration = 100,
      intermezzo_min_duration = 10,
      intermezzo_max_duration = 35,
      layers = pfunctions.conc2(spaceLayers.intermezzo, podLayersI),
      audio_events = audio.i
    }
  }
})

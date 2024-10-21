local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local spaceLayers = require("__space-age__/prototypes/planet/general/planet-to-platform/space-layers")
local cloudLayers = require("__space-age__/prototypes/planet/general/planet-to-platform/cloud-layers")
local rocketLayers = require("__space-age__/prototypes/planet/general/planet-to-platform/rocket-layers")
local podLayersA = require("__space-age__/prototypes/planet/general/planet-to-platform/pod-layers-a")
local podLayersB = require("__space-age__/prototypes/planet/general/planet-to-platform/pod-layers-b")
local podLayersI = require("__space-age__/prototypes/planet/general/planet-to-platform/pod-layers-i")

local audio = require("__space-age__/prototypes/planet/general/planet-to-platform/audio-events")

local pvariables = require("__space-age__/prototypes/planet/general/general-variables")
local pfunctions = require("__space-age__/prototypes/planet/general/general-functions")

data:extend(
{
  {
    type = "procession",
    name = "planet-to-platform-a",
    usage = "departure",
    procession_style = procession_style.pod_right_generic,
    timeline =
    {
      duration = 1200,
      special_action_tick = pvariables.impostor_start_tick-1,
      draw_switch_tick = pvariables.impostor_start_tick,
      layers = pfunctions.conc4(spaceLayers.departure, podLayersA, cloudLayers, rocketLayers),
      audio_events = audio.a
    }
  },
  {
    type = "procession",
    name = "planet-to-platform-b",
    usage = "arrival",
    procession_style = procession_style.pod_right_generic,
    timeline =
    {
      duration = 350,
      layers = pfunctions.conc2(spaceLayers.arrival, podLayersB),
      audio_events = audio.b
    }
  },
  {
    type = "procession",
    name = "planet-to-platform-intermezzo",
    usage = "intermezzo",
    procession_style = procession_style.pod_right_generic,
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

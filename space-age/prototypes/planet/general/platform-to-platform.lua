
local procession_style = require("__base__/prototypes/planet/procession-style")
local spaceLayers = require("__space-age__/prototypes/planet/general/platform-to-planet/space-layers")
local podLayersA = require("__space-age__/prototypes/planet/general/platform-to-platform/pod-layers-a")
local podLayersB = require("__space-age__/prototypes/planet/general/platform-to-platform/pod-layers-b")
local podLayersI = require("__space-age__/prototypes/planet/general/platform-to-platform/pod-layers-i")

local audio = require("__space-age__/prototypes/planet/general/platform-to-platform/audio-events")

local pvariables = require("__space-age__/prototypes/planet/general/general-variables")
local pfunctions = require("__space-age__/prototypes/planet/general/general-functions")

data:extend(
{
  {
    type = "procession",
    name = "platform-to-platform-a",
    usage = "departure",
    procession_style = procession_style.pod_right_platform_to_platform,
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
    name = "platform-to-platform-b",
    usage = "arrival",
    procession_style = procession_style.pod_right_platform_to_platform,
    timeline =
    {
      duration = 350,
      layers = pfunctions.conc2(spaceLayers.arrival, podLayersB),
      audio_events = audio.b
    }
  },
  {
    type = "procession",
    name = "platform-to-platform-intermezzo",
    usage = "intermezzo",
    procession_style = procession_style.pod_right_platform_to_platform,
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

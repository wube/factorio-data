local procession_audio_catalogue_types = require("__base__/prototypes/planet/procession-audio-catalogue-types")

local playSound = function(time, sound)
  return
  {
    timestamp = time,
    type = "play-sound",
    usage = "both",
    audio =
    {
      type = "pod-catalogue",
      catalogue_id = sound
    }
  }
end

local platform_to_platform_audio = {}
platform_to_platform_audio.a =
{
  playSound(0,   procession_audio_catalogue_types.pod_thruster_burst),
  playSound(170, procession_audio_catalogue_types.pod_thruster_burst),
  playSound(320, procession_audio_catalogue_types.pod_thruster_burst),
}

platform_to_platform_audio.i =
{}

platform_to_platform_audio.b =
{
  playSound(110, procession_audio_catalogue_types.pod_thruster_burst),
  playSound(215, procession_audio_catalogue_types.pod_thruster_burst),
}
return platform_to_platform_audio

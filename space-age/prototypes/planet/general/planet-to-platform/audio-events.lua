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

local to_platform_audio = {}
to_platform_audio.a =
{
  playSound(710, procession_audio_catalogue_types.rocket_claws_open),
  playSound(790, procession_audio_catalogue_types.pod_thruster_burst_2),
  playSound(920, procession_audio_catalogue_types.pod_thruster_burst_3),
}

to_platform_audio.i =
{}

to_platform_audio.b =
{
  playSound(130, procession_audio_catalogue_types.pod_thruster_burst_1),
  playSound(200, procession_audio_catalogue_types.pod_thruster_burst_4),
}
return to_platform_audio

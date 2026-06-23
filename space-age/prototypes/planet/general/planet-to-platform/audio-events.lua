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
  playSound(720, procession_audio_catalogue_types.rocket_claws_open),
  playSound(770, procession_audio_catalogue_types.pod_thruster_burst),
  playSound(815, procession_audio_catalogue_types.pod_thruster_burst),
  playSound(920, procession_audio_catalogue_types.pod_thruster_burst),

  playSound(770, procession_audio_catalogue_types.pod_jet_burst),
  playSound(805, procession_audio_catalogue_types.pod_jet_burst),
  playSound(940, procession_audio_catalogue_types.pod_jet_burst),
  playSound(975, procession_audio_catalogue_types.pod_jet_burst),
  playSound(1070, procession_audio_catalogue_types.pod_jet_burst),
  playSound(1165, procession_audio_catalogue_types.pod_jet_burst),
}

to_platform_audio.i =
{
  playSound(40, procession_audio_catalogue_types.pod_jet_burst),
}

to_platform_audio.b =
{
  playSound(5, procession_audio_catalogue_types.pod_jet_burst),
  playSound(30, procession_audio_catalogue_types.pod_jet_burst),
  playSound(48, procession_audio_catalogue_types.pod_jet_burst),
  playSound(78, procession_audio_catalogue_types.pod_jet_burst),
  playSound(100, procession_audio_catalogue_types.pod_jet_burst),
  playSound(128, procession_audio_catalogue_types.pod_jet_burst),
  playSound(152, procession_audio_catalogue_types.pod_jet_burst),
  playSound(215, procession_audio_catalogue_types.pod_jet_burst),
  playSound(228, procession_audio_catalogue_types.pod_jet_burst),
  playSound(254, procession_audio_catalogue_types.pod_jet_burst),
  playSound(284, procession_audio_catalogue_types.pod_jet_burst),
  
  playSound(110, procession_audio_catalogue_types.pod_thruster_burst),
  playSound(215, procession_audio_catalogue_types.pod_thruster_burst),
}
return to_platform_audio

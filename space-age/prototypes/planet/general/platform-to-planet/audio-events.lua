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

local to_planet_audio = {}
to_planet_audio.a =
{
  playSound(0,   procession_audio_catalogue_types.pod_thruster_burst),
  playSound(165, procession_audio_catalogue_types.pod_thruster_burst),
  playSound(200, procession_audio_catalogue_types.pod_thruster_burst_short),
  playSound(320, procession_audio_catalogue_types.pod_thruster_burst),
  
  playSound(127, procession_audio_catalogue_types.pod_wings),

  playSound(157, procession_audio_catalogue_types.pod_jet_burst),
  playSound(207, procession_audio_catalogue_types.pod_jet_burst),
  playSound(215, procession_audio_catalogue_types.pod_jet_burst),
  playSound(337, procession_audio_catalogue_types.pod_jet_burst),
  playSound(363, procession_audio_catalogue_types.pod_jet_burst),
  playSound(423, procession_audio_catalogue_types.pod_jet_burst),
}

to_planet_audio.i =
{}

to_planet_audio.b_shared =
{
  playSound(26,  procession_audio_catalogue_types.pod_thruster_burst_short),
  playSound(40,  procession_audio_catalogue_types.pod_reentry_flames),
  playSound(225, procession_audio_catalogue_types.pod_thruster_burst),
  playSound(320, procession_audio_catalogue_types.pod_thruster_burst),
  playSound(430, procession_audio_catalogue_types.pod_thruster_burst),

  playSound(18, procession_audio_catalogue_types.pod_jet_burst),
  playSound(390, procession_audio_catalogue_types.pod_jet_burst),
}
to_planet_audio.b_hatch =
{
  playSound(464, procession_audio_catalogue_types.pod_wings_close),
}
to_planet_audio.b_ground =
{
  playSound(599, procession_audio_catalogue_types.pod_ground_land),
}
return to_planet_audio

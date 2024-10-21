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
  playSound(0,   procession_audio_catalogue_types.pod_thruster_burst_2),
  playSound(107, procession_audio_catalogue_types.pod_wings),
  playSound(170, procession_audio_catalogue_types.pod_thruster_burst_1),
  playSound(320, procession_audio_catalogue_types.pod_thruster_burst_3),
}

to_planet_audio.i =
{}

to_planet_audio.b_shared =
{
  playSound(20,  procession_audio_catalogue_types.pod_thruster_burst_1),
  playSound(40,  procession_audio_catalogue_types.pod_reentry_flames),
  playSound(220, procession_audio_catalogue_types.pod_thruster_burst_4),
  playSound(320, procession_audio_catalogue_types.pod_thruster_burst_3),
  playSound(430, procession_audio_catalogue_types.pod_thruster_burst_2),
}
to_planet_audio.b_hatch =
{
}
to_planet_audio.b_ground =
{
  --playSound(599, procession_audio_catalogue.pod_ground_land),
}
return to_planet_audio

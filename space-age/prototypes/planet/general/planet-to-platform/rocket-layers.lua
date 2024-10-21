local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local pfunctions = require("__space-age__/prototypes/planet/general/general-functions")
local pvariables = require("__space-age__/prototypes/planet/general/general-variables")

local spawn_offset_x = 0
local spawn_offset_y = (138 + 10)/32 -0.200 + 0.09

local opening_speed = 0.4

local rocket_movement =
{
  { timestamp = 0, shift = {spawn_offset_x, spawn_offset_y} },
  { timestamp = pvariables.flight_duration, shift = {spawn_offset_x - 3, spawn_offset_y + 70} },

  { timestamp = 0,                                                    shift_rate = -0.15, shift_rate_t = 0.15 },
  { timestamp = pvariables.rocket_separation_tick+50,                 shift_rate = 0.15, shift_rate_t = -0.15 },
  { timestamp = pvariables.rocket_separation_tick+187,                shift_rate = -0.12, shift_rate_t = 0.31 },
  { timestamp = pvariables.rocket_separation_tick+400,                shift_rate = 1, shift_rate_t = 0 },

  { timestamp = 0,                                                     rotation = -0.04, rotation_t = 0.04 },
  { timestamp = pvariables.rocket_separation_tick+100,                 rotation = 0.04, rotation_t = -0.04 },
  { timestamp = pvariables.rocket_separation_tick+215,                 rotation = -0.019, rotation_t = 0.055 },
  { timestamp = pvariables.rocket_separation_tick+500,                 rotation = 0.22, rotation_t = 0.16 },
}

local rocket_opening_anim = function(frame_count, speed)
  return
  {
    { timestamp = pvariables.rocket_separation_tick, frame = 0 },
    { timestamp = pvariables.rocket_separation_tick + frame_count*1/opening_speed, frame = frame_count-1 }
  }
end

local fadeout = function(f_start, f_time)
  return
  {
    {timestamp = f_start, opacity = 1},
    {timestamp = f_start+f_time, opacity =0}
  }
end

local fadeout_w_hold = function(f_start, f_time, in_time, out_time)
  return
  {
    {timestamp = f_start, opacity = 0},
    {timestamp = f_start+in_time, opacity = 1},
    {timestamp = f_start+f_time+in_time, opacity = 1},
    {timestamp = f_start+f_time+in_time+out_time, opacity =0}
  }
end

return
{
  pfunctions.make_rocket_part("impostor_base", procession_graphic_catalogue.impostor_opening_base, "elevated-rail-stone-path", false, rocket_movement),
  pfunctions.make_rocket_part("impostor_back", procession_graphic_catalogue.impostor_opening_back, "elevated-higher-object", true, pfunctions.conc2(rocket_movement, rocket_opening_anim(20, 0.3))),
  pfunctions.make_rocket_part("impostor_front", procession_graphic_catalogue.impostor_opening_front, "light-effect", true, pfunctions.conc2(rocket_movement, rocket_opening_anim(20, 0.3))),
  pfunctions.make_rocket_part("impostor_emission1", procession_graphic_catalogue.impostor_emission_1, "light-effect", false, pfunctions.conc2(rocket_movement, fadeout(pvariables.rocket_separation_tick+50, 70))),
  pfunctions.make_rocket_part("impostor_emission2", procession_graphic_catalogue.impostor_emission_2, "light-effect", false, pfunctions.conc2(rocket_movement, fadeout(pvariables.rocket_separation_tick+50, 70))),
  pfunctions.make_rocket_part("impostor_emission3", procession_graphic_catalogue.impostor_emission_3, "light-effect", false, pfunctions.conc2(rocket_movement, fadeout(pvariables.rocket_separation_tick+50, 70))),
  pfunctions.make_rocket_part("impostor_smoke1", procession_graphic_catalogue.impostor_smoke_1, "light-effect", false, pfunctions.conc2(rocket_movement, fadeout(pvariables.rocket_separation_tick, 40))),
  pfunctions.make_rocket_part("impostor_smoke2", procession_graphic_catalogue.impostor_smoke_2, "light-effect", false, pfunctions.conc2(rocket_movement, fadeout(pvariables.rocket_separation_tick-20, 80))),
  pfunctions.make_rocket_part("impostor_smoke3", procession_graphic_catalogue.impostor_smoke_3, "light-effect", false, pfunctions.conc2(rocket_movement, fadeout(pvariables.rocket_separation_tick+10, 60))),
  pfunctions.make_rocket_part("impostor_smoke4", procession_graphic_catalogue.impostor_smoke_4, "elevated-rail-stone-path-lower", false, pfunctions.conc2(rocket_movement, fadeout(pvariables.rocket_separation_tick-50, 70))),
  pfunctions.make_rocket_part("impostor_smoke5", procession_graphic_catalogue.impostor_smoke_5, "elevated-rail-stone-path-lower", false, pfunctions.conc2(rocket_movement, fadeout(pvariables.rocket_separation_tick-100, 80))),
  pfunctions.make_private_pod_overlay("shaded_pod", procession_graphic_catalogue.pod_base_shadowed, 1, 0, pvariables.rocket_separation_tick+(20*1/opening_speed), false,
  {
    { timestamp = pvariables.rocket_separation_tick+(9*1/opening_speed), opacity = 1 },
    { timestamp = pvariables.rocket_separation_tick+(20*1/opening_speed), opacity = 0 }
  }),
  pfunctions.make_rocket_part("impostor_bb_back", procession_graphic_catalogue.impostor_bb_emission_back, "elevated-higher-object", true, pfunctions.conc3(rocket_movement, fadeout_w_hold(pvariables.rocket_separation_tick+70, 15, 10, 10),fadeout_w_hold(pvariables.rocket_separation_tick+115, 1, 10, 40))),
  pfunctions.make_rocket_part("impostor_bb_front", procession_graphic_catalogue.impostor_bb_emission_front, "light-effect", true, pfunctions.conc3(rocket_movement, fadeout_w_hold(pvariables.rocket_separation_tick+70, 15, 10, 10),fadeout_w_hold(pvariables.rocket_separation_tick+115, 1, 10, 40)))
}

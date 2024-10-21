local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")
local procession_audio_catalogue = require("__base__/prototypes/planet/procession-audio-catalogue-types")

local make_pod_overlay = function(name, graphicid, order, t_start, t_end, animated, frameslist)
  return
  {
    type = "single-graphic",
    name = name,
    render_layer = "air-object",
    secondary_draw_order = order,
    relative_to = "pod",
    rotates_with_pod = true,
    shift_rotates_with_pod = true,
    is_passenger_only = false,
    clip_with_hatches = true,
    animation_driven_by_curve = animated,
    start_time = t_start,
    end_time = t_end,
    graphic = { type = "pod-catalogue", catalogue_id = graphicid },
    frames = frameslist
  }
end

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

data:extend(
{
  {
    type = "procession-layer-inheritance-group",
    name = "dummy-group",
    intermezzo_application = { offset = true, rotation = true },
    arrival_application = { offset = true, pod_offset = true, rotation = true }
  },
  {
    type = "procession",
    name = "default-a",
    usage = "departure",
    procession_style = procession_style.default,
    timeline =
    {
      duration = 100,
      layers =
      {
        {
          type = "pod-movement",
          frames =
          {
            { timestamp = 0   , tilt    = 0.0      , tilt_t   = 0.0
                              , offset  = {0, 0}   , offset_t = {0, -40} },
            { timestamp = 100 , offset  = {0, -70} , offset_t = {0, 0} },
            { timestamp=0, offset_rate = 0, offset_rate_t = 0 },
            { timestamp=100, offset_rate = 0, offset_rate_t = 1  }
          }
        },
        {
          type = "pod-opacity",
          lut = "__core__/graphics/color_luts/lut-day.png",
          frames =
          {
            { timestamp = 100, outside_opacity = 1 },
            { timestamp = 150, outside_opacity = 0 },
          }
        },
      },
      audio_events =
      {
      }
    }
  },
  {
    type = "procession",
    name = "default-rocket-a",
    usage = "departure",
    procession_style = procession_style.default,
    timeline =
    {
      duration = 800,
      special_action_tick = 800,
      layers =
      {
        {
          type = "pod-movement",
          frames =
          {
            { timestamp = 0   , tilt    = 0.0      , tilt_t   = 0.0
                              , offset  = {0, 0}   , offset_t = {0, -40} },
            { timestamp = 100 , offset  = {0, -700} , offset_t = {0, 0} }
          }
        },
        {
          type = "pod-opacity",
          lut = "__core__/graphics/color_luts/lut-day.png",
          frames =
          {
            { timestamp = 300, outside_opacity = 1 },
            { timestamp = 500, outside_opacity = 0 }
          }
        },
      }
    }
  },
  {
    type = "procession",
    name = "default-b",
    usage = "arrival",
    procession_style = procession_style.default,
    timeline =
    {
      duration = 400,
      special_action_tick = 100,
      layers =
      {
        {
          type = "pod-movement",
          frames =
          {
            { timestamp = 0   , tilt    = 0.0      , tilt_t   = 0
                              , offset  = {0, -70} , offset_t = {0, 40} },
            { timestamp = 400 , offset  = {0, 0}   , offset_t = {0, 0} },
            { timestamp=0, offset_rate = 0, offset_rate_t = 0 },
            { timestamp=400, offset_rate = 1.8, offset_rate_t = -0.8 }
          }
        },
        {
          type = "pod-opacity",
          lut = "__core__/graphics/color_luts/lut-day.png",
          frames =
          {
            { timestamp = 0, outside_opacity = 0},
            { timestamp = 50, outside_opacity = 1 },
          }
        },
        {
          type = "pod-animation",
          name = "pod fold",
          start_time = 0,
          end_time = 0,
          graphic = { type = "pod-catalogue", catalogue_id = procession_graphic_catalogue.pod_anim_opening },
          frames =
          {
            { timestamp=250, frame = 33 },
            { timestamp=400, frame = 0 }
          }
        },
        -- first burst
        make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_loop, -1, 0, 140, false, {}),
        make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_start, -1, 140, 150, true,
        {
          { timestamp = 140, frame = 9 },
          { timestamp = 150, frame = 0 }
        }),
        make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_open_emission, 1, 0, 150, false,
        {
          { timestamp = 140, opacity = 1 },
          { timestamp = 150, opacity = 0 }
        }),

        -- last burst
        make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_start, -1, 230, 240, true,
        {
          { timestamp = 230, frame = 0 },
          { timestamp = 240, frame = 9 }
        }),
        make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_loop, -1, 240, 390, false, {}),
        make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_start, -1, 390, 0, true,
        {
          { timestamp = 390, frame = 9 },
          { timestamp = 400, frame = 0 }
        }),
        make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_open_emission, 1, 230, 250, false,
        {
          { timestamp = 230, opacity = 0 },
          { timestamp = 250, opacity = 1 }
        }),
        make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_anim_opening_emission, 1, 250, 0, true,
        {
          { timestamp=250, frame = 33 },
          { timestamp=400, frame = 0 },
          { timestamp=390, opacity = 1 },
          { timestamp=400, opacity = 0 }
        }),
        -- last burst end
        {
          type = "single-graphic",
          name = "hatch light",
          render_layer = "cargo-hatch",
          secondary_draw_order = -1,
          relative_to = "ground-origin",
          graphic = { type = "hatch-location-catalogue-index" },
          start_time = 250,
          frames =
          {
            { timestamp = 250, opacity = 0.0, opacity_t = 0.0  },
            { timestamp = 390, opacity = 2.0, opacity_t = -1.0 },
            { timestamp = 400, opacity = 0.0, opacity_t = 0.0  }
          }
        }
      },
      audio_events =
      {
        playSound(100, procession_audio_catalogue.pod_thruster_burst_2),
        playSound(230, procession_audio_catalogue.pod_thruster_burst_3),
      }
    },
    ground_timeline =
    {
      duration = 400,
      special_action_tick = 100,
      layers =
      {
        {
          type = "pod-movement",
          frames =
          {
            { timestamp = 0   , tilt    = 0.0      , tilt_t   = 0
                              , offset  = {0, -70} , offset_t = {0, 40} },
            { timestamp = 400 , offset  = {0, 0}   , offset_t = {0, 0} },
            { timestamp=0, offset_rate = 0, offset_rate_t = 0 },
            { timestamp=400, offset_rate = 1.8, offset_rate_t = -0.8 }
          }
        },
        {
          type = "pod-opacity",
          lut = "__core__/graphics/color_luts/lut-day.png",
          frames =
          {
            { timestamp = 0, outside_opacity = 0},
            { timestamp = 50, outside_opacity = 1 },
          }
        },
        {
          type = "pod-animation",
          name = "pod fold",
          start_time = 0,
          end_time = 400,
          graphic = { type = "pod-catalogue", catalogue_id = procession_graphic_catalogue.pod_anim_landing },
          frames =
          {
            { timestamp=250, frame = 0 },
            { timestamp=400, frame = 11 }
          }
        },
        -- first burst
        make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_loop, -1, 0, 140, false, {}),
        make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_start, -1, 140, 150, true,
        {
          { timestamp = 140, frame = 9 },
          { timestamp = 150, frame = 0 }
        }),
        make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_open_emission, 1, 0, 150, false,
        {
          { timestamp = 140, opacity = 1 },
          { timestamp = 150, opacity = 0 }
        }),

        -- last burst
        make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_start, -1, 230, 240, true,
        {
          { timestamp = 230, frame = 0 },
          { timestamp = 240, frame = 9 }
        }),
        make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_loop, -1, 240, 390, false, {}),
        make_pod_overlay("podjet", procession_graphic_catalogue.thruster_flames_start, -1, 390, 0, true,
        {
          { timestamp = 390, frame = 9 },
          { timestamp = 400, frame = 0 }
        }),
        make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_open_emission, 1, 230, 250, false,
        {
          { timestamp = 230, opacity = 0 },
          { timestamp = 250, opacity = 1 }
        }),
        make_pod_overlay("podjet_emission", procession_graphic_catalogue.pod_anim_landing_emission, 1, 250, 0, true,
        {
          { timestamp=250, frame = 0 },
          { timestamp=400, frame = 11 },
          { timestamp=390, opacity = 1 },
          { timestamp=400, opacity = 0 }
        }),
        -- last burst end
      },
      audio_events =
      {
        playSound(100, procession_audio_catalogue.pod_thruster_burst_2),
        playSound(230, procession_audio_catalogue.pod_thruster_burst_3),
        --playSound(399, procession_audio_catalogue.pod_ground_land),
      }
    }
  },
  {
    type = "procession",
    name = "default-intermezzo",
    usage = "intermezzo",
    procession_style = procession_style.default,
    timeline =
    {
      duration = 100,
      layers = {}
    }
  }
})

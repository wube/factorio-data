local smoke_animations = require("__base__.prototypes.entity.smoke-animations")
local util = require("util")

local smoke_fast_animation = smoke_animations.trivial_smoke_fast
local trivial_smoke = smoke_animations.trivial_smoke

data:extend
{
  {
    type = "trivial-smoke",
    name = "vulcanus-smoke-explosion-particle-small",
    animation = smoke_fast_animation
    {
      animation_speed = 0.5,
      scale = 0.25,
      tint = {r = 0.1, g = 0.1, b = 0.1, a = 0.7}
    },
    render_layer = "elevated-object",
    affected_by_wind = false,
    movement_slow_down_factor = 0.96,
    duration = 150,
    fade_away_duration = 60,
    show_when_smoke_off = true,
    start_scale = 0.3,
    end_scale = 0.1
  },

  trivial_smoke
  {
    name = "demolisher-dying-smoke",
    color = {r = 0.427, g = 0.255, b = 0.169, a = 0.5},
    affected_by_wind = false,
    render_layer = "elevated-higher-object",
    duration = 350,
    start_scale = 1,5,
    end_scale = 2,
    fade_in_duration = 2,
    spread_duration = 20,
    draw_as_glow = true,
    --fade_out_duration = 30,
    movement_slow_down_factor = 0.9,
  },

  trivial_smoke
  {
    name = "magma-eruption-bright-smoke",
    color = {r = 0.154425, g = 0.141225, b = 0.125025, a = 0.3},
    duration = 250,
    spread_duration = 20,
    fade_in_duration = 50,
    fade_away_duration = 50,
    start_scale = 0.1,
    end_scale = 1.2,
    affected_by_wind = false,
    movement_slow_down_factor = 0.9,
    render_layer = "object"
  },

  trivial_smoke
  {
    name = "magma-eruption-dark-smoke",
    color = {r = 0.128688, g = 0.117688, b = 0.1041875, a = 0.35},
    duration = 250,
    spread_duration = 20,
    fade_in_duration = 50,
    fade_away_duration = 100,
    start_scale = 0.2,
    end_scale = 1.5,
    affected_by_wind = false,
    movement_slow_down_factor = 0.9
  },

  trivial_smoke
  {
    name = "demolisher-ash-cloud-boundary",
    --color = {0.290, 0.278, 0.294, 0.6},
    --color = {0.338, 0.324, 0.343, 0.7},
    --color = {0.387, 0.371, 0.392, 0.8},
    color = {0.387/2, 0.371/2, 0.392/2, 0.8/2},
    --color = {0.483, 0.463, 0.490, 1.0},
    affected_by_wind = false,
    render_layer = "under-elevated",
    start_scale = 0.2,
    end_scale = 2,
    spread_duration = 30,

    affected_by_wind = false,
    movement_slow_down_factor = 0.25,
    duration = 60,
    fade_in_duration = 10,
    fade_away_duration = 50,
    show_when_smoke_off = true
  },
  trivial_smoke
  {
    name = "demolisher-ash-cloud-expanding-boundary",
    --color = {0.290, 0.278, 0.294, 0.6},
    --color = {0.338, 0.324, 0.343, 0.7},
    --color = {0.387, 0.371, 0.392, 0.8},
    color = {0.387/2, 0.371/2, 0.392/2, 0.8/2},
    --color = {0.483, 0.463, 0.490, 1.0},
    affected_by_wind = false,
    render_layer = "under-elevated",
    start_scale = 0.3,
    end_scale = 2,
    spread_duration = 20,

    affected_by_wind = false,
    movement_slow_down_factor = 0.01,
    duration = 40,
    fade_in_duration = 10,
    fade_away_duration = 30,
    show_when_smoke_off = true
  },

  trivial_smoke
  {
    name = "demolisher-mining-smoke-front",
    color = {0.282, 0.263, 0.243, 0.6},
    affected_by_wind = false,
    render_layer = "under-elevated",
    duration = 100,
    start_scale = 0.15,
    end_scale = 0.4,
    fade_in_duration = 2,
    spread_duration = 30,
    movement_slow_down_factor = 1,
  },

  trivial_smoke
  {
    name = "demolisher-mining-smoke-small-top",
    color = {0.282, 0.263, 0.243, 0.6},
    affected_by_wind = false,
    render_layer = "under-elevated",
    duration = 120,
    start_scale = 0.2,
    end_scale = 0.5,
    fade_in_duration = 12,
    spread_duration = 20,
    movement_slow_down_factor = 1,
  },

  trivial_smoke
  {
    name = "demolisher-mining-smoke-small-bottom",
    color = {0.1856/1.6, 0.1704/1.6, 0.1544/1.6, 0.6/1.3},
    affected_by_wind = false,
    render_layer = "object-under",
    duration = 60,
    start_scale = 0.2,
    end_scale = 0.5,
    fade_in_duration = 2,
    spread_duration = 3,
    movement_slow_down_factor = 1,
  },

  trivial_smoke
  {
    name = "demolisher-mining-smoke-big",
    color = {0.2088, 0.1917, 0.1737, 0.6},
    affected_by_wind = false,
    render_layer = "object-under",
    duration = 300,
    start_scale = 0.2,
    end_scale = 1,
    fade_in_duration = 2,
    spread_duration = 3,
    movement_slow_down_factor = 1,
  },

  trivial_smoke
  {
    name = "demolisher-mining-smoke",
    color = {0.290, 0.278, 0.294, 0.6},
    affected_by_wind = false,
    render_layer = "object",
    duration = 300,
    start_scale = 0.2,
    end_scale = 1,
    fade_in_duration = 2,
    spread_duration = 3,
    movement_slow_down_factor = 1,
  },

  trivial_smoke
  {
    name = "stomper-steamy-gas",
    color = {0.4118, 0.2941, 0.0667, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 200,
    start_scale = 1,5,
    end_scale = 2,
    fade_in_duration = 2,
    spread_duration = 20,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "strafer-steamy-gas",
    color = {0.4118, 0.2941, 0.0667, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 200,
    start_scale = 0.8,
    end_scale = 1.5,
    fade_in_duration = 2,
    spread_duration = 10,
    movement_slow_down_factor = 1,
  },
  --carbonic smoke
  trivial_smoke
  {
    name = "asteroid-smoke-carbonic-chunk",
    color = {0.2664, 0.2576, 0.2696, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 80,
    start_scale = 0.5,
    end_scale = 0.7,
    spread_duration = 1,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "asteroid-smoke-carbonic-small",
    color = {0.2664, 0.2576, 0.2696, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 90,
    start_scale = 0.5,
    end_scale = 1,
    spread_duration = 6,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "asteroid-smoke-carbonic-medium",
    color = {0.2664, 0.2576, 0.2696, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 100,
    start_scale = 0.8,
    end_scale = 1,
    fade_in_duration = 2,
    spread_duration = 10,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "asteroid-smoke-carbonic-big",
    color = {0.2664, 0.2576, 0.2696, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 120,
    start_scale = 1,
    end_scale = 1.1,
    spread_duration = 15,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "asteroid-smoke-carbonic-huge",
    color = {0.2664, 0.2576, 0.2696, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 140,
    start_scale = 1,
    end_scale = 1.4,
    fade_in_duration = 2,
    spread_duration = 20,
    movement_slow_down_factor = 1,
  },
  --metallic smoke
  trivial_smoke
  {
    name = "asteroid-smoke-metallic-chunk",
    color = {0.26352, 0.2416, 0.22592, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 80,
    start_scale = 0.5,
    end_scale = 0.7,
    spread_duration = 1,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "asteroid-smoke-metallic-small",
    color = {0.26352, 0.2416, 0.22592, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 90,
    start_scale = 0.5,
    end_scale = 1,
    spread_duration = 6,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "asteroid-smoke-metallic-medium",
    color = {0.26352, 0.2416, 0.22592, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 100,
    start_scale = 0.8,
    end_scale = 1,
    fade_in_duration = 2,
    spread_duration = 10,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "asteroid-smoke-metallic-big",
    color = {0.26352, 0.2416, 0.22592, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 120,
    start_scale = 1,
    end_scale = 1.1,
    spread_duration = 15,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "asteroid-smoke-metallic-huge",
    color = {0.26352, 0.2416, 0.22592, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 140,
    start_scale = 1,
    end_scale = 1.4,
    fade_in_duration = 2,
    spread_duration = 20,
    movement_slow_down_factor = 1,
  },
  --oxide smoke
  trivial_smoke
  {
    name = "asteroid-smoke-oxide-chunk",
    color = {0.22592, 0.25728, 0.26352, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 80,
    start_scale = 0.5,
    end_scale = 0.7,
    spread_duration = 1,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "asteroid-smoke-oxide-small",
    color = {0.22592, 0.25728, 0.26352, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 90,
    start_scale = 0.5,
    end_scale = 1,
    spread_duration = 6,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "asteroid-smoke-oxide-medium",
    color = {0.22592, 0.25728, 0.26352, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 100,
    start_scale = 0.8,
    end_scale = 1,
    fade_in_duration = 2,
    spread_duration = 10,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "asteroid-smoke-oxide-big",
    color = {0.22592, 0.25728, 0.26352, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 120,
    start_scale = 1,
    end_scale = 1.1,
    spread_duration = 15,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "asteroid-smoke-oxide-huge",
    color = {0.22592, 0.25728, 0.26352, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 140,
    start_scale = 1,
    end_scale = 1.4,
    fade_in_duration = 2,
    spread_duration = 20,
    movement_slow_down_factor = 1,
  },
  -- promethium smoke
  trivial_smoke
  {
    name = "asteroid-smoke-promethium-chunk",
    color = {0.22, 0.1, 0.1, 0.3},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 80,
    start_scale = 0.5,
    end_scale = 0.7,
    spread_duration = 1,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "asteroid-smoke-promethium-small",
    color = {0.22, 0.1, 0.1, 0.3},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 90,
    start_scale = 0.5,
    end_scale = 1,
    spread_duration = 6,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "asteroid-smoke-promethium-medium",
    color = {0.22, 0.1, 0.1, 0.3},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 100,
    start_scale = 0.8,
    end_scale = 1,
    fade_in_duration = 2,
    spread_duration = 10,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "asteroid-smoke-promethium-big",
    color = {0.22, 0.1, 0.1, 0.3},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 120,
    start_scale = 1,
    end_scale = 1.1,
    spread_duration = 15,
    movement_slow_down_factor = 1,
  },
  trivial_smoke
  {
    name = "asteroid-smoke-promethium-huge",
    color = {0.22, 0.1, 0.1, 0.3},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 140,
    start_scale = 1,
    end_scale = 1.4,
    fade_in_duration = 2,
    spread_duration = 20,
    movement_slow_down_factor = 1,
  },

  trivial_smoke
  {
    name = "mech-armor-smoke",
    color = {r = 0.5, g = 0.5, b = 0.5, a = 0.5},
    duration = 50,
    spread_duration = 50,
    fade_in_duration = 10,
    fade_away_duration = 40,
    start_scale = 0.1,
    end_scale = 0.3
  },
}

local smoke_fast_animation = function(opts)
  local opts = opts or {}
  return
  {
    filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
    priority = "high",
    width = 50,
    height = 50,
    frame_count = 16,
    animation_speed = opts.animation_speed or 16 / 60,
    scale = opts.scale,
    tint = opts.tint
  }
end

local trivial_smoke = function(opts)
  return
  {
    type = "trivial-smoke",
    name = opts.name,
    duration = opts.duration or 600,
    fade_in_duration = opts.fade_in_duration or 0,
    fade_away_duration = opts.fade_away_duration or ((opts.duration or 600) - (opts.fade_in_duration or 0)),
    spread_duration = opts.spread_duration or 600,
    start_scale = opts.start_scale or 0.20,
    end_scale = opts.end_scale or 1.0,
    color = opts.color,
    cyclic = true,
    affected_by_wind = opts.affected_by_wind or true,
    animation =
    {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png",
      flags = { "smoke" }
    }
  }
end

data:extend
{
  trivial_smoke
  {
    name = "smoke",
    color = {r = 0.4, g = 0.4, b = 0.4, a = 0.4}
  },

  trivial_smoke
  {
    name = "light-smoke",
    color = {r = 0.5, g = 0.5, b = 0.5, a = 0.3}
  },

  trivial_smoke
  {
    name = "turbine-smoke",
    color = {r = 0.5, g = 0.5, b = 0.5, a = 0.3},
    start_scale = 0.8,
    fade_in_duration = 30
  },

  trivial_smoke
  {
    name = "train-smoke",
    color = {r = 0.3, g = 0.3, b = 0.3, a = 0.3},
    duration = 150,
    spread_duration = 100,
    fade_away_duration = 100,
    start_scale = 0.4,
    end_scale = 1.5,
    affected_by_wind = true
  },

  trivial_smoke
  {
    name = "car-smoke",
    color = {r = 0.5, g = 0.5, b = 0.5, a = 0.5},
    duration = 12,
    spread_duration = 12,
    fade_away_duration = 12,
    start_scale = 0.1,
    end_scale = 0.5
  },

  trivial_smoke
  {
    name = "tank-smoke",
    color = {r = 0.5, g = 0.5, b = 0.5, a = 0.5},
    duration = 100,
    spread_duration = 100,
    fade_away_duration = 100,
    start_scale = 0.3,
    end_scale = 1.0
  },

  {
    type = "trivial-smoke",
    name = "smoke-fast",
    animation = smoke_fast_animation(),
    duration = 60,
    fade_away_duration = 60
  },

  {
    type = "trivial-smoke",
    name = "smoke-train-stop",
    animation = smoke_fast_animation(),
    render_layer = "lower-object",
    affected_by_wind = false,
    movement_slow_down_factor = 0.95,
    duration = 40,
    fade_away_duration = 30,
    show_when_smoke_off = true
  },

  {
    type = "trivial-smoke",
    name = "smoke-building",
    animation = smoke_fast_animation
    {
      animation_speed = 0.5,
      scale = 0.5
    },
    render_layer = "building-smoke",
    affected_by_wind = false,
    movement_slow_down_factor = 0.96,
    duration = 45,
    fade_away_duration = 20,
    show_when_smoke_off = true
  },

  {
    type = "trivial-smoke",
    name = "smoke-explosion-particle",
    animation = smoke_fast_animation
    {
      animation_speed = 0.5,
      scale = 0.5,
      tint = {r = 0.1, g = 0.1, b = 0.1, a = 0.7}
    },
    render_layer = "smoke",
    affected_by_wind = false,
    movement_slow_down_factor = 0.96,
    duration = 150,
    fade_away_duration = 60,
    show_when_smoke_off = true
  },
  
  {
    type = "trivial-smoke",
    name = "smoke-explosion-particle-tiny",
    animation = smoke_fast_animation
    {
      animation_speed = 0.5,
      scale = 0.2,
      tint = {r = 0.1, g = 0.1, b = 0.1, a = 0.5}
    },
    render_layer = "object",
    affected_by_wind = false,
    movement_slow_down_factor = 0.96,
    duration = 150,
    fade_away_duration = 60,
    show_when_smoke_off = true,
    start_scale = 0.1,
    end_scale = 0.1,
  },

  {
    type = "trivial-smoke",
    name = "smoke-explosion-particle-small",
    animation = smoke_fast_animation
    {
      animation_speed = 0.5,
      scale = 0.25,
      tint = {r = 0.1, g = 0.1, b = 0.1, a = 0.7}
    },
    render_layer = "smoke",
    affected_by_wind = false,
    movement_slow_down_factor = 0.96,
    duration = 150,
    fade_away_duration = 60,
    show_when_smoke_off = true,
    start_scale = 0.3,
    end_scale = 0.1,
  },
  
    {
    type = "trivial-smoke",
    name = "smoke-explosion-lower-particle-small",
    animation = smoke_fast_animation
    {
      animation_speed = 0.5,
      scale = 0.25,
      tint = {r = 0.1, g = 0.1, b = 0.1, a = 0.7}
    },
    render_layer = "smoke",
    affected_by_wind = false,
    movement_slow_down_factor = 0.96,
    duration = 150,
    fade_away_duration = 60,
    show_when_smoke_off = true,
    start_scale = 0.3,
    end_scale = 0.1,
  },

  {
    type = "trivial-smoke",
    name = "smoke-explosion-particle-stone-small",
    animation = smoke_fast_animation
    {
      animation_speed = 0.5,
      scale = 0.25,
      tint = {r = 0.604, g = 0.502, b = 0.400, a = 0.7}
    },
    render_layer = "smoke",
    affected_by_wind = false,
    movement_slow_down_factor = 0.96,
    duration = 150,
    fade_away_duration = 60,
    show_when_smoke_off = true,
    start_scale = 0.3,
    end_scale = 0.1,
  },

  {
    type = "trivial-smoke",
    name = "artillery-smoke",
    animation = smoke_fast_animation
    {
      animation_speed = 1 / 6,
      scale = 0.5
    },
    render_layer = "building-smoke",
    affected_by_wind = false,
    movement_slow_down_factor = 0.96,
    duration = 60 * 1.75,
    fade_away_duration = 20,
    show_when_smoke_off = true
  },

  trivial_smoke
  {
    name = "nuclear-smoke",
    spread_duration = 0,
    duration = 120,
    fade_away_duration = 120,
    start_scale = 0.5,
    end_scale = 1,
    affected_by_wind = false
  },

  {
    type = "trivial-smoke",
    name = "poison-capsule-smoke",
    animation = smoke_fast_animation(
      {
        scale = 0.5
      }
    ),
    duration = 60,
    fade_away_duration = 60,
    render_layer = "higher-object-above",
    color = {r = 0.239, g = 0.875, b = 0.992, a = 0.690}
  },

  {
    type = "trivial-smoke",
    name = "poison-capsule-particle-smoke",
    animation = smoke_fast_animation(
      {
        scale = 0.2
      }
    ),
    duration = 60,
    fade_away_duration = 60,
    render_layer = "higher-object-above",
    color = {r = 0.239, g = 0.875, b = 0.992, a = 0.690}
  },
}

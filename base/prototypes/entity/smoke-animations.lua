local smoke_animations = {}

smoke_animations.trivial_smoke_fast = function(opts)
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

smoke_animations.trivial_nuke_smoke = function(opts)
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
    duration = opts.duration or 600,
    fade_in_duration = opts.fade_in_duration or 0,
    fade_away_duration = opts.fade_away_duration or ((opts.duration or 600) - (opts.fade_in_duration or 0)),
    spread_duration = opts.spread_duration or 600,
    start_scale = opts.start_scale or 0.20,
    end_scale = opts.end_scale or 1.0,
    tint = opts.tint
  }
end

smoke_animations.trivial_smoke = function(opts)
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
    affected_by_wind = (opts.affected_by_wind == nil and true) or opts.affected_by_wind,
    render_layer = opts.render_layer,
    movement_slow_down_factor = opts.movement_slow_down_factor,
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

smoke_animations.trivial_fire_smoke = function(opts)
  return
  {
    type = "trivial-smoke",
    name = opts.name,
    duration = opts.duration or 600,
    fade_in_duration = opts.fade_in_duration or 0,
    fade_away_duration = opts.fade_away_duration or 600,
    spread_duration = opts.spread_duration or 600,
    start_scale = opts.start_scale or 0.20,
    end_scale = opts.end_scale or 1.0,
    color = opts.color,
    cyclic = true,
    affected_by_wind = (opts.affected_by_wind == nil and true) or opts.affected_by_wind,
    animation = opts.animation or
    {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.53125, -0.4375},
      priority = "high",
      flags = { "smoke" },
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png"
    },
    glow_animation = opts.glow_animation,
    glow_fade_away_duration = opts.glow_fade_away_duration,
    vertical_speed_slowdown = opts.vertical_speed_slowdown
  }
end

return smoke_animations

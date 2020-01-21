function smoke(opts)
  return
  {
    type = "smoke",
    name = opts.name,
    flags = {"not-on-map"},
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
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png",
      flags = { "smoke" }
    }
  }
end

data:extend(
{
  smoke{name = "smoke-for-migration", color = {r = 0.4, g = 0.4, b = 0.4, a = 0.4}},
  {
    type = "particle",
    name = "particle-for-migration"
  },
  {
    type = "leaf-particle",
    name = "leaf-particle-for-migration"
  }
}
)

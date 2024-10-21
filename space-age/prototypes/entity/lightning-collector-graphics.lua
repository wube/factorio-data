require ("util")

local function lightning_collector_picture(repeat_count)
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/lightning-collector/lightning-collector",
      {
        priority = "high",
        scale = 0.5,
        repeat_count = repeat_count
      }),
      util.sprite_load("__space-age__/graphics/entity/lightning-collector/lightning-collector-shadow",
      {
        priority = "high",
        draw_as_shadow = true,
        scale = 0.5,
        repeat_count = repeat_count
      })
    }
  }
end

local function lightning_collector_charge()
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/lightning-collector/lightning-collector-charge",
      {
        priority = "high",
        blend_mode = "additive",
        scale = 0.5,
        frame_count = 19,
        draw_as_glow = true,
      })
    }
  }
end

local function lightning_collector_discharge()
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/lightning-collector/lightning-collector-discharge",
      {
        priority = "high",
        blend_mode = "additive",
        scale = 0.5,
        frame_count = 24,
        draw_as_glow = true,
      })
    }
  }
end

return
{
  picture = lightning_collector_picture(),
  charge_animation = lightning_collector_charge(),
  charge_animation_is_looped = false,
  charge_cooldown = 30,
  discharge_animation = lightning_collector_discharge(),
  discharge_cooldown = 60
  --todo: charge light
  --todo: discharge light
}

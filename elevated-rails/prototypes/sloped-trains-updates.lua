local meld = require("__core__.lualib.meld")

local drive_over_elevated_tie =
{
  type = "play-sound",
  sound = sound_variations("__elevated-rails__/sound/elevated-train-tie", 6, 0.8, {volume_multiplier("main-menu", 2.4), volume_multiplier("driving", 0.65)})
}

local updates = {}

updates.wheels =
{
  sloped = util.sprite_load("__elevated-rails__/graphics/entity/train-wheel/train-wheel-sloped",
    {
      priority = "very-low",
      direction_count = 160,
      scale = 0.5,
      shift = util.by_pixel(0, 8),
      usage = "train"
    }
  ),
  slope_angle_between_frames = 1.25
}

updates.locomotive =
{
  wheels = updates.wheels,
  pictures =
  {
    slope_angle_between_frames = 1.25,
    sloped =
    {
      layers =
      {
        util.sprite_load("__elevated-rails__/graphics/entity/locomotive/locomotive-sloped",
          {
            dice = 4,
            priority = "very-low",
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        ),
        util.sprite_load("__elevated-rails__/graphics/entity/locomotive/locomotive-sloped-mask",
          {
            dice = 4,
            priority = "very-low",
            flags = { "mask" },
            apply_runtime_tint = true,
            tint_as_overlay = true,
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        ),
        util.sprite_load("__elevated-rails__/graphics/entity/locomotive/locomotive-sloped-shadow",
          {
            dice = 4,
            priority = "very-low",
            flags = { "shadow" },
            draw_as_shadow = true,
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        )
      }
    }
  },
  front_light_pictures =
  {
    slope_angle_between_frames = 1.25,
    sloped =
    {
      layers =
      {
        util.sprite_load("__elevated-rails__/graphics/entity/locomotive/locomotive-sloped-lights",
          {
            dice = 4,
            priority = "very-low",
            blend_mode = "additive",
            draw_as_light = true,
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        )
      }
    }
  },
  elevated_rail_sound =
  {
    sound =
    {
      filename = "__elevated-rails__/sound/elevated-train-driving.ogg",
      volume = 1.0,
      modifiers = {volume_multiplier("elevation", 1.0)}
    },
    match_volume_to_activity = true,
    activity_to_volume_modifiers =
    {
      multiplier = 1.5,
      offset = 1.0,
    },
    match_speed_to_activity = true,
    activity_to_speed_modifiers =
    {
      multiplier = 0.6,
      minimum = 1.0,
      maximum = 1.15,
      offset = 0.2,
    }
  },
  drive_over_elevated_tie_trigger = drive_over_elevated_tie
}

updates.cargo_wagon =
{
  wheels = updates.wheels,
  pictures =
  {
    slope_angle_between_frames = 1.25,
    slope_back_equals_front = true,
    sloped =
    {
      layers =
      {
        util.sprite_load("__elevated-rails__/graphics/entity/cargo-wagon/cargo-wagon-sloped",
          {
            dice = 4,
            priority = "very-low",
            back_equals_front = true,
            direction_count = 80,
            scale = 0.5,
            usage = "train"
          }
        ),
        util.sprite_load("__elevated-rails__/graphics/entity/cargo-wagon/cargo-wagon-sloped-mask",
          {
            dice = 4,
            priority = "very-low",
            flags = { "mask" },
            apply_runtime_tint = true,
            tint_as_overlay = true,
            direction_count = 80,
            scale = 0.5,
            usage = "train"
          }
        ),
        util.sprite_load("__elevated-rails__/graphics/entity/cargo-wagon/cargo-wagon-sloped-shadow",
          {
            dice = 4,
            priority = "very-low",
            draw_as_shadow = true,
            direction_count = 80,
            scale = 0.5,
            usage = "train"
          }
        )
      }
    }
  },
}

updates.fluid_wagon =
{
  wheels = updates.wheels,
  pictures =
  {
    slope_angle_between_frames = 1.25,
    slope_back_equals_front = true,
    sloped =
    {
      layers =
      {
        util.sprite_load("__elevated-rails__/graphics/entity/fluid-wagon/fluid-wagon-sloped",
          {
            dice = 4,
            priority = "very-low",
            direction_count = 80,
            scale = 0.5,
            usage = "train"
          }
        ),
        util.sprite_load("__elevated-rails__/graphics/entity/fluid-wagon/fluid-wagon-sloped-shadow",
          {
            dice = 4,
            priority = "very-low",
            draw_as_shadow = true,
            direction_count = 80,
            scale = 0.5,
            usage = "train"
          }
        )
      }
    }
  },
}

updates.artillery_wagon =
{
  wheels = updates.wheels,
  pictures =
  {
    slope_angle_between_frames = 1.25,
    sloped =
    {
      layers =
      {
        util.sprite_load("__elevated-rails__/graphics/entity/artillery-wagon/artillery-wagon-sloped-base",
          {
            dice = 4,
            priority = "very-low",
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        ),
        util.sprite_load("__elevated-rails__/graphics/entity/artillery-wagon/artillery-wagon-sloped-base-shadow",
          {
            dice = 4,
            priority = "very-low",
            draw_as_shadow = true,
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        )
      }
    }
  },
  cannon_base_pictures =
  {
    slope_angle_between_frames = 1.25,
    sloped =
    {
      layers =
      {
        util.sprite_load("__elevated-rails__/graphics/entity/artillery-wagon/artillery-wagon-sloped-cannon-base",
          {
            priority = "very-low",
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        ),
        util.sprite_load("__elevated-rails__/graphics/entity/artillery-wagon/artillery-wagon-sloped-cannon-base-shadow",
          {
            priority = "very-low",
            draw_as_shadow = true,
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        )
      }
    }
  },
  cannon_barrel_pictures =
  {
    slope_angle_between_frames = 1.25,
    sloped =
    {
      layers =
      {
        util.sprite_load("__elevated-rails__/graphics/entity/artillery-wagon/artillery-wagon-sloped-cannon-barrel",
          {
            priority = "very-low",
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        ),
        util.sprite_load("__elevated-rails__/graphics/entity/artillery-wagon/artillery-wagon-sloped-cannon-barrel-shadow",
          {
            priority = "very-low",
            draw_as_shadow = true,
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        )
      }
    }
  },
}

updates.apply_all_base = function()
  meld(data.raw["locomotive"]["locomotive"], updates.locomotive)
  meld(data.raw["cargo-wagon"]["cargo-wagon"], updates.cargo_wagon)
  meld(data.raw["fluid-wagon"]["fluid-wagon"], updates.fluid_wagon)
  meld(data.raw["artillery-wagon"]["artillery-wagon"], updates.artillery_wagon)
end
return updates

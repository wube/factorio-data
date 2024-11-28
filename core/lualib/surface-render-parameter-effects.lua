local effects = {}

effects.default_clouds_effect_properties =
  function()
    return
    {
      shape_noise_texture =
      {
        filename = "__core__/graphics/clouds-noise.png",
        size = 2048
      },
      detail_noise_texture =
      {
        filename = "__core__/graphics/clouds-detail-noise.png",
        size = 2048
      },

      warp_sample_1 = { scale = 0.8 / 16 },
      warp_sample_2 = { scale = 3.75 * 0.8 / 32, wind_speed_factor = 0 },
      warped_shape_sample = { scale = 2 * 0.18 / 32 },
      additional_density_sample = { scale = 1.5 * 0.18 / 32, wind_speed_factor = 1.77 },
      detail_sample_1 = { scale = 1.709 / 32, wind_speed_factor = 0.2 / 1.709 },
      detail_sample_2 = { scale = 2.179 / 32, wind_speed_factor = 0.2 / 2.179 },

      scale = 1,
      movement_speed_multiplier = 0.75,
      opacity = 0.25,
      shape_warp_strength = 0.06,
      shape_warp_weight = 0.4,
      detail_sample_morph_duration = 256,
    }
  end

  effects.default_fog_effect_properties =
    function()
      return
      {
        shape_noise_texture =
        {
          filename = "__core__/graphics/clouds-noise.png",
          size = 2048
        },
        detail_noise_texture =
        {
          filename = "__core__/graphics/clouds-detail-noise.png",
          size = 2048
        },
        color1 = {1.0, 0.8706, 0.302},
        color2 = {1.0, 0.8706, 0.2902},
        tick_factor = 0.000005,
      }
    end

  return effects

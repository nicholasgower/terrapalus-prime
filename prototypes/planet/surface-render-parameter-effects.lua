local effects = {}

effects.terrapalus_clouds_effect_properties =
  function()
    return
    {
      shape_noise_texture =
      {
        filename = "__terrapalus__/graphics/clouds-noise.png",
        size = 2048
      },
      detail_noise_texture =
      {
        filename = "__terrapalus__/graphics/clouds-detail-noise.png",
        size = 2048
      },

      warp_sample_1 = { scale = 0.8 / 16 },
      warp_sample_2 = { scale = 3.75 * 0.8 / 32, wind_speed_factor = -0.0 },
      warped_shape_sample = { scale = 2 * 0.18 / 32 },
      additional_density_sample = { scale = 1.5 * 0.18 / 32, wind_speed_factor = 1.77 },
      detail_sample_1 = { scale = 1.709 / 32, wind_speed_factor = 0.2 / 1.709 },
      detail_sample_2 = { scale = 2.179 / 32, wind_speed_factor = 0.2 / 2.179 },

      scale = 0.1,
      movement_speed_multiplier = 0.25,
      opacity = 1.0,
      opacity_at_night = 0.85,
      shape_warp_strength = 0.25,
      shape_warp_weight = 0.2,
      detail_sample_morph_duration = 256,
      color1 = {1.0, 0.2, 0.0, 1.0},
      color2 = {1.0, 0.2, 0.0, 1.0},
    }
  end

  effects.terrapalus_fog_effect_properties =
    function()
      return
      {
        shape_noise_texture =
        {
          filename = "__terrapalus__/graphics/clouds-noise.png",
          size = 2048
        },
        detail_noise_texture =
        {
          filename = "__terrapalus__/graphics/clouds-detail-noise.png",
          size = 2048
        },
        opacity = 0.6,
        opacity_at_night = 0.6,
        color1 = {0.5, 0.2, 1.0, 1.0},
        color2 = {0.5, 0.2, 1.0, 1.0},
      }
    end

  return effects

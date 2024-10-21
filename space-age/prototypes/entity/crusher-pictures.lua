function crusher_integration_patch_horizontal()
  return util.sprite_load("__space-age__/graphics/entity/crusher/crusher-horizontal-integration",
  {
    scale = 0.5,
    shift = {0,0}
  })
end

function crusher_integration_patch_vertical()
  return util.sprite_load("__space-age__/graphics/entity/crusher/crusher-vertical-integration",
  {
    scale = 0.5,
    shift = util.by_pixel( 0.0, 8),
  })
end

function crusher_animation_horizontal_main()
  return util.sprite_load("__space-age__/graphics/entity/crusher/crusher-horizontal",
  {
    animation_speed = 0.5,
    frame_count = 48,
    scale = 0.5,
    shift = {0,0}
  })
end

function crusher_animation_horizontal_shadow()
  return util.sprite_load("__space-age__/graphics/entity/crusher/crusher-horizontal-shadow",
  {
    animation_speed = 0.5,
    repeat_count = 48,
    scale = 0.5,
    draw_as_shadow = true,
    shift = {0,0}
  })
end

function crusher_animation_vertical_main()
  return util.sprite_load("__space-age__/graphics/entity/crusher/crusher-vertical",
  {
    animation_speed = 0.5,
    frame_count = 48,
    scale = 0.5,
    shift = util.by_pixel( 0.0, 8),
  })
end

function crusher_animation_vertical_shadow()
  return util.sprite_load("__space-age__/graphics/entity/crusher/crusher-vertical-shadow",
  {
    animation_speed = 0.5,
    repeat_count = 48,
    scale = 0.5,
    draw_as_shadow = true,
    shift = util.by_pixel( 0.0, 8),
  })
end

function crusher_working_visualisations_horizontal()
  return util.sprite_load("__space-age__/graphics/entity/crusher/crusher-horizontal-light",
  {
    animation_speed = 0.5,
    repeat_count = 48,
    scale = 0.5,
    blend_mode = "additive",
    draw_as_glow = true,
    shift = {0,0}
  })
end

function crusher_working_visualisations_vertical()
  return util.sprite_load("__space-age__/graphics/entity/crusher/crusher-vertical-light",
  {
    animation_speed = 0.5,
    repeat_count = 48,
    scale = 0.5,
    blend_mode = "additive",
    draw_as_glow = true,
    shift = util.by_pixel( 0.0, 8),
  })
end

return {
  integration_patch_render_layer = "floor",
  integration_patch = {
    north = crusher_integration_patch_vertical(),
    east = crusher_integration_patch_horizontal(),
    south = crusher_integration_patch_vertical(),
    west = crusher_integration_patch_horizontal()
  },
  animation = {
    north =
    {
      layers = {
        crusher_animation_vertical_main(),
        crusher_animation_vertical_shadow()
      }
    },
    east =
    {
      layers = {
        crusher_animation_horizontal_main(),
        crusher_animation_horizontal_shadow()
      }
    },
    south =
    {
      layers = {
        crusher_animation_vertical_main(),
        crusher_animation_vertical_shadow()
      }
    },
    west =
    {
      layers = {
        crusher_animation_horizontal_main(),
        crusher_animation_horizontal_shadow()
      }
    }
  },
  working_visualisations = {
    layers = {
      fadeout = true,
      north_animation = crusher_working_visualisations_vertical(),
      east_animation = crusher_working_visualisations_horizontal(),
      south_animation = crusher_working_visualisations_vertical(),
      west_animation = crusher_working_visualisations_horizontal()
    }
  }
}
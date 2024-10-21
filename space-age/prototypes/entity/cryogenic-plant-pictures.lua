local total_frame_count = 192
local anim1_frame_count = 64
local anim2_frame_count = 24
local anim3_frame_count = 96
local anim4_frame_count = 48
local anim5_frame_sequence =
{
   1,  1,  1,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
  22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45,
  46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
  70, 71, 72, 73, 74 ,75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88,  1,  1,  1,  1,  1,
   1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16,
  17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
  41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64,
  65, 66, 67, 68, 69, 70, 71, 72, 73, 74 ,75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88,
}

local anim6_frame_sequence =
{
   1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24,
  25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48,
  49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 71,
  71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71,
  71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71,
  71, 70, 69, 68, 67, 65, 64, 63, 62, 61, 60, 59, 58, 57, 56, 55, 54, 53, 52, 51, 50, 49, 48, 47,
  46, 45, 44, 43,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
   1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
}

local anim6_fluid_frame_sequence = {
 22, 22, 22, 22, 22, 22, 22,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16, 17,
 18, 19, 20, 21, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22,
 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22,
 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22,
 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22,
 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22,
 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22,
 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22,
}

local smoke_frame_count = 64
local working_lights_frame_count = 64
local cryogenic_plant_animation_speed = 0.5

local function cryogenic_plant_animation(name, frames, options)
  options = options or {}
  options['animation_speed'] = cryogenic_plant_animation_speed
  options['frame_count'] = frames
  options['repeat_count'] = total_frame_count / frames
  options['scale'] = 0.5
  return util.sprite_load("__space-age__/graphics/entity/cryogenic-plant/cryogenic-plant-".. name, options)
end

return {
  graphics_set = {
      animation =
      {
        layers =
        {
          cryogenic_plant_animation("main", 1),
          cryogenic_plant_animation("shadow", 1, {draw_as_shadow = true}),
          cryogenic_plant_animation("anim1-base", anim1_frame_count),
          cryogenic_plant_animation("anim2-base", anim2_frame_count),
          cryogenic_plant_animation("anim4-base", anim4_frame_count),
          cryogenic_plant_animation("anim5-base", total_frame_count, {frame_sequence = anim5_frame_sequence}),
          cryogenic_plant_animation("anim6-base", total_frame_count, {frame_sequence = anim6_frame_sequence}),
        }
      },
      working_visualisations =
      {
        ---- anim1
        {
          fadeout = true,
          animation =  cryogenic_plant_animation("anim1-working", anim1_frame_count)
        },
        {
          fadeout = true,
          apply_recipe_tint = "primary",
          animation = cryogenic_plant_animation("anim1-mask1", anim1_frame_count)
        },
        {
          fadeout = true,
          apply_recipe_tint = "secondary",
          animation = cryogenic_plant_animation("anim1-mask2", anim1_frame_count)
        },
        ---- anim2
        {
          always_draw = true,
          apply_recipe_tint = "primary",
          animation = cryogenic_plant_animation("anim2-mask1", anim2_frame_count)
        },
        {
          always_draw = true,
          apply_recipe_tint = "secondary",
          animation = cryogenic_plant_animation("anim2-mask2", anim2_frame_count)
        },
        ---- anim3
        {
          fadeout = true,
          animation =  cryogenic_plant_animation("anim3-working", anim3_frame_count)
        },
        {
          fadeout = true,
          apply_recipe_tint = "primary",
          animation = cryogenic_plant_animation("anim3-mask1", anim3_frame_count)
        },
        {
          fadeout = true,
          apply_recipe_tint = "secondary",
          animation = cryogenic_plant_animation("anim3-mask2", anim3_frame_count)
        },
        ---- anim4
        {
          always_draw = true,
          apply_recipe_tint = "primary",
          animation = cryogenic_plant_animation("anim4-mask1", anim4_frame_count)
        },
        {
          always_draw = true,
          apply_recipe_tint = "secondary",
          animation = cryogenic_plant_animation("anim4-mask2", anim4_frame_count)
        },
        --- anim6
        {
          always_draw = true,
          apply_recipe_tint = "primary",
          animation = cryogenic_plant_animation("anim6-mask1", total_frame_count, {frame_sequence = anim6_fluid_frame_sequence})
        },
        {
          effect = "flicker",
          fadeout = true,
          animation = cryogenic_plant_animation("anim6-working-light", total_frame_count, {blend_mode = "additive", draw_as_glow = true, frame_sequence = anim6_frame_sequence})
        },
        ---- smoke
        {
          fadeout = true,
          constant_speed = true,
          apply_recipe_tint = "tertiary",
          animation = cryogenic_plant_animation("smoke-mask-1", smoke_frame_count)
        },
        {
          fadeout = true,
          constant_speed = true,
          apply_recipe_tint = "quaternary",
          animation = cryogenic_plant_animation("smoke-mask-2", smoke_frame_count)
        },
        {
          always_draw = true,
          animation = cryogenic_plant_animation("glass", 1)
        },
        ---- lights
        {
          effect = "flicker",
          fadeout = true,
          animation = cryogenic_plant_animation("working-lights", working_lights_frame_count, {blend_mode = "additive", draw_as_glow = true})
        },
        {
          animation = cryogenic_plant_animation("status-lamp", 1, {blend_mode = "additive", draw_as_glow = true})
        },
      },
      frozen_patch = util.sprite_load("__space-age__/graphics/entity/cryogenic-plant/cryogenic-plant-frozen", {scale = 0.5}),
      reset_animation_when_frozen = true
  },
  pipe_picture = {
    north =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/cryogenic-plant/cryogenic-plant-pipe-connections-v",
        {
          priority = "extra-high",
          scale = 0.5,
          shift = {0, 3}
        }),
        util.sprite_load("__space-age__/graphics/entity/cryogenic-plant/cryogenic-plant-shadow-v",
        {
          priority = "extra-high",
          draw_as_shadow = true,
          scale = 0.5,
          shift = {0,3}
        }),
      },
    },
    east =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/cryogenic-plant/cryogenic-plant-pipe-connections-h",
        {
          priority = "extra-high",
          scale = 0.5,
          shift = {-3, 0}
        }),
        util.sprite_load("__space-age__/graphics/entity/cryogenic-plant/cryogenic-plant-shadow-h",
        {
          priority = "extra-high",
          draw_as_shadow = true,
          scale = 0.5,
          shift = {-3,0}
        })
      }
    },
    south =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/cryogenic-plant/cryogenic-plant-pipe-connections-v",
        {
          priority = "extra-high",
          scale = 0.5,
          shift = {0, -3}
        }),
        util.sprite_load("__space-age__/graphics/entity/cryogenic-plant/cryogenic-plant-shadow-v",
        {
          priority = "extra-high",
          draw_as_shadow = true,
          scale = 0.5,
          shift = {0,-3}
        }),
      }
    },
    west =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/cryogenic-plant/cryogenic-plant-pipe-connections-h",
        {
          priority = "extra-high",
          scale = 0.5,
          shift = {3, 0}
        }),
        util.sprite_load("__space-age__/graphics/entity/cryogenic-plant/cryogenic-plant-shadow-h",
        {
          priority = "extra-high",
          draw_as_shadow = true,
          scale = 0.5,
          shift = {3,0}
        }),
      }
    }
  },
  pipe_picture_frozen = {
    north =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/cryogenic-plant/cryogenic-plant-pipe-connections-v-frozen",
        {
          priority = "extra-high",
          scale = 0.5,
          shift = {0, 3}
        })
      },
    },
    east =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/cryogenic-plant/cryogenic-plant-pipe-connections-h-frozen",
        {
          priority = "extra-high",
          scale = 0.5,
          shift = {-3, 0}
        })
      }
    },
    south =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/cryogenic-plant/cryogenic-plant-pipe-connections-v-frozen",
        {
          priority = "extra-high",
          scale = 0.5,
          shift = {0, -3}
        })
      }
    },
    west =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/cryogenic-plant/cryogenic-plant-pipe-connections-h-frozen",
        {
          priority = "extra-high",
          scale = 0.5,
          shift = {3, 0}
        })
      }
    }
  }
}

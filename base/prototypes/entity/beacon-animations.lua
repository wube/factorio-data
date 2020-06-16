  return
  {
    module_icons_suppressed = true,

    animation_progress = 1,
    min_animation_progress = 0,

    module_tint_mode = "mix", -- "single-module"
    no_modules_tint = {1, 0, 0},
    random_animation_offset = true,

    apply_module_tint = "secondary",
    apply_module_tint_to_light = "none",

    -- light = { shift = {0, 0}, color = {1, 1, 1}, intensity = 1, size = 3 },
    animation_list =
    {
      {
        render_layer = "floor-mechanics",
        always_draw = true,
        animation =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/beacon/beacon-bottom.png",
              width = 106,
              height = 96,
              shift = util.by_pixel(0, 1),
              hr_version =
              {
                filename = "__base__/graphics/entity/beacon/hr-beacon-bottom.png",
                width = 212,
                height = 192,
                scale = 0.5,
                shift = util.by_pixel(0.5, 1),
              }
            },
            {
              filename = "__base__/graphics/entity/beacon/beacon-shadow.png",
              width = 122,
              height = 90,
              draw_as_shadow = true,
              shift = util.by_pixel(12, 1),
              hr_version =
              {
                filename = "__base__/graphics/entity/beacon/hr-beacon-shadow.png",
                width = 244,
                height = 176,
                scale = 0.5,
                draw_as_shadow = true,
                shift = util.by_pixel(12.5, 0.5),
              }
            }
          }
        },
      },
      {
        render_layer = "object",
        always_draw = true,
        animation =
        {
          filename = "__base__/graphics/entity/beacon/beacon-top.png",
          width = 48,
          height = 70,
          repeat_count = 45,
          animation_speed = 0.5,
          shift = util.by_pixel(3, -19),
          hr_version =
          {
            filename = "__base__/graphics/entity/beacon/hr-beacon-top.png",
            width = 96,
            height = 140,
            scale = 0.5,
            repeat_count = 45,
            animation_speed = 0.5,
            shift = util.by_pixel(3, -19),
          }
        }
      },
      {
        render_layer = "object",
        apply_tint = true,
        draw_as_sprite = true,
        draw_as_light = true,
        always_draw = false,
        animation =
        {
          filename = "__base__/graphics/entity/beacon/beacon-light.png",
          line_length = 9,
          width = 56,
          height = 94,
          frame_count = 45,
          animation_speed = 0.5,
          shift = util.by_pixel(1, -18),
          blend_mode = "additive",
          hr_version =
          {
            filename = "__base__/graphics/entity/beacon/hr-beacon-light.png",
            line_length = 9,
            width = 110,
            height = 186,
            frame_count = 45,
            animation_speed = 0.5,
            scale = 0.5,
            shift = util.by_pixel(0.5, -18),
            blend_mode = "additive",
          }
        }
      },
    },

    module_visualisations =
    {
      -- vanilla art style
      {
        art_style = "vanilla",
        use_for_empty_slots = true,
        tier_offset = 0,
        slots =
        {
          -- slot 1
          {
            {
              has_empty_slot = true,
              render_layer = "lower-object",
              pictures =
              {
                filename = "__base__/graphics/entity/beacon/beacon-module-slot-1.png",
                line_length = 4,
                width = 26,
                height = 34,
                variation_count = 4,
                shift = util.by_pixel(-16, 15),
                hr_version =
                {
                  filename = "__base__/graphics/entity/beacon/hr-beacon-module-slot-1.png",
                  line_length = 4,
                  width = 50,
                  height = 66,
                  variation_count = 4,
                  scale = 0.5,
                  shift = util.by_pixel(-16, 14.5),
                }
              }
            },
            {
              apply_module_tint = "primary",
              render_layer = "lower-object",
              pictures =
              {
                filename = "__base__/graphics/entity/beacon/beacon-module-mask-box-1.png",
                line_length = 3,
                width = 18,
                height = 16,
                variation_count = 3,
                shift = util.by_pixel(-17, 15),
                hr_version =
                {
                  filename = "__base__/graphics/entity/beacon/hr-beacon-module-mask-box-1.png",
                  line_length = 3,
                  width = 36,
                  height = 32,
                  variation_count = 3,
                  scale = 0.5,
                  shift = util.by_pixel(-17, 15),
                }
              }
            },
            {
              apply_module_tint = "secondary",
              render_layer = "lower-object-above-shadow",
              pictures =
              {
                filename = "__base__/graphics/entity/beacon/beacon-module-mask-lights-1.png",
                line_length = 3,
                width = 14,
                height = 6,
                variation_count = 3,
                shift = util.by_pixel(-18, 13),
                hr_version =
                {
                  filename = "__base__/graphics/entity/beacon/hr-beacon-module-mask-lights-1.png",
                  line_length = 3,
                  width = 26,
                  height = 12,
                  variation_count = 3,
                  scale = 0.5,
                  shift = util.by_pixel(-18.5, 13),
                }
              }
            },
            {
              apply_module_tint = "secondary",
              draw_as_light = true,
              draw_as_sprite = false,
              pictures =
              {
                filename = "__base__/graphics/entity/beacon/beacon-module-lights-1.png",
                line_length = 3,
                width = 28,
                height = 22,
                variation_count = 3,
                shift = util.by_pixel(-18, 13),
                hr_version =
                {
                  filename = "__base__/graphics/entity/beacon/hr-beacon-module-lights-1.png",
                  line_length = 3,
                  width = 56,
                  height = 42,
                  variation_count = 3,
                  shift = util.by_pixel(-18, 13),
                  scale = 0.5
                }
              }
            }
          },
          -- slot 2
          {
            {
              has_empty_slot = true,
              render_layer = "lower-object",
              pictures =
              {
                filename = "__base__/graphics/entity/beacon/beacon-module-slot-2.png",
                line_length = 4,
                width = 24,
                height = 22,
                variation_count = 4,
                shift = util.by_pixel(19, -12),
                hr_version =
                {
                  filename = "__base__/graphics/entity/beacon/hr-beacon-module-slot-2.png",
                  line_length = 4,
                  width = 46,
                  height = 44,
                  variation_count = 4,
                  scale = 0.5,
                  shift = util.by_pixel(19, -12),
                }
              }
            },
            {
              apply_module_tint = "primary",
              render_layer = "lower-object",
              pictures =
              {
                filename = "__base__/graphics/entity/beacon/beacon-module-mask-box-2.png",
                line_length = 3,
                width = 18,
                height = 14,
                variation_count = 3,
                shift = util.by_pixel(20, -12),
                hr_version =
                {
                  filename = "__base__/graphics/entity/beacon/hr-beacon-module-mask-box-2.png",
                  line_length = 3,
                  width = 36,
                  height = 26,
                  variation_count = 3,
                  scale = 0.5,
                  shift = util.by_pixel(20.5, -12),
                }
              }
            },
            {
              apply_module_tint = "secondary",
              render_layer = "lower-object-above-shadow",
              pictures =
              {
                filename = "__base__/graphics/entity/beacon/beacon-module-mask-lights-2.png",
                line_length = 3,
                width = 12,
                height = 8,
                variation_count = 3,
                shift = util.by_pixel(22, -15),
                hr_version =
                {
                  filename = "__base__/graphics/entity/beacon/hr-beacon-module-mask-lights-2.png",
                  line_length = 3,
                  width = 24,
                  height = 14,
                  variation_count = 3,
                  scale = 0.5,
                  shift = util.by_pixel(22, -15.5),
                }
              }
            },
            {
              apply_module_tint = "secondary",
              draw_as_light = true,
              draw_as_sprite = false,
              pictures =
              {
                filename = "__base__/graphics/entity/beacon/beacon-module-lights-2.png",
                line_length = 3,
                width = 34,
                height = 24,
                variation_count = 3,
                shift = util.by_pixel(22, -16),
                hr_version = {
                  filename = "__base__/graphics/entity/beacon/hr-beacon-module-lights-2.png",
                  line_length = 3,
                  width = 66,
                  height = 46,
                  variation_count = 3,
                  shift = util.by_pixel(22, -16),
                  scale = 0.5
                }
              }
            }
          }
        }
      } -- end vanilla art style
    }
  }
--end
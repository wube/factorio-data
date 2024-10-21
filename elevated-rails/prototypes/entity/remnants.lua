require ("__elevated-rails__.prototypes.entity.elevated-rail-pictures")
local remnants =
{
  {
    type = "corpse",
    name = "elevated-rail-remnants",
    icon = "__elevated-rails__/graphics/icons/elevated-rail.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "train-transport-remnants",
    order = "a[rail]-a[rail]",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(12,
      util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail/remnants/elevated-rail-remnants",
      {
        line_length = 1,
        direction_count = 1,
        scale = 0.5
      }))
  },
  {
    type = "corpse",
    name = "rail-support-remnants",
    icon = "__elevated-rails__/graphics/icons/rail-support.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "train-transport-remnants",
    order = "a[rail]-b[rail-support]",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,

    animation =
    {
      layers =
      {
        util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-pylon/remnants/elevated-rail-pylon-remnants",
                         {
                           priority = "high",
                           direction_count = 2,
                           scale = 0.5
                         })
      }
    },

    underwater_patch = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-pylon/remnants/elevated-rail-pylon-remnants-underwater",
                                        {
                                          direction_count = 2,
                                          back_equals_front = true,
                                          scale = 0.5
                                        }),

    water_reflection =
    {
      pictures = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-pylon/remnants/elevated-rail-pylon-remnants-reflection",
                                  {
                                    priority = "extra-high",
                                    variation_count = 2,
                                    scale = 0.5
                                  }),
      rotate = false,
    },
  },
  {
    type = "corpse",
    name = "rail-ramp-remnants",
    icon = "__elevated-rails__/graphics/icons/rail-ramp.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "train-transport-remnants",
    order = "a[rail]-b[rail-ramp]",
    selection_box = {{-1.8, -7.8}, {1.8, 7.8}},
    collision_box = {{-1, -6}, {1, 6}},
    tile_width = 4,
    tile_height = 16,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,

    animation =
    {
      layers =
      {
        util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/remnants/elevated-rail-ramp-remnants",
                        {
                          dice_y = 2,
                          scale = 0.5,
                          direction_count = 4,
                          counterclockwise = true
                        })
      }
    },

    underwater_patch = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/remnants/elevated-rail-ramp-remnants-underwater",
                                        {
                                          dice_y = 2,
                                          direction_count = 4,
                                          counterclockwise = true,
                                          scale = 0.5
                                        }),

    water_reflection =
    {
      pictures = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/remnants/elevated-rail-ramp-remnants-reflection",
                                  {
                                    priority = "extra-high",
                                    variation_count = 4,
                                    dice_y = 2,
                                    scale = 0.5
                                  }),
      rotate = false,
    },
  },
}
data:extend(remnants)
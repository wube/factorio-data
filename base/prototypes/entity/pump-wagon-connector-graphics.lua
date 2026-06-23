return
{
  base_animation_finished_at_progress = 0.5,
  clamp_animation_starts_at_progress = 0.75,
  part_1 = util.sprite_load( "__base__/graphics/entity/pump/connector/Part_1",
      {
        direction_count = 128,
        scale = 0.5,
        priority = "very-low",
      }),
  part_1_shadow = util.sprite_load( "__base__/graphics/entity/pump/connector/Part_1_shadow",
      {
        direction_count = 128,
        scale = 0.5,
        priority = "very-low",
        draw_as_shadow = true,
      }),
  part_2 = util.sprite_load( "__base__/graphics/entity/pump/connector/Part_2",
      {
        direction_count = 128,
        scale = 0.5,
        priority = "very-low",
      }),
  part_2_shadow = util.sprite_load( "__base__/graphics/entity/pump/connector/Part_2_shadow",
      {
        direction_count = 128,
        scale = 0.5,
        priority = "very-low",
        draw_as_shadow = true,
      }),
  suction_clamp =util.sprite_load( "__base__/graphics/entity/pump/connector/Part_3",
      {
        frame_count = 8,
        scale = 0.5,
        animation_speed = 1,
      }),
  suction_clamp_shadow = util.sprite_load( "__base__/graphics/entity/pump/connector/Part_3_shadow",
      {
        frame_count = 8,
        scale = 0.5,
        animation_speed = 1,
        draw_as_shadow = true,
      }),
  base =
  {
    input =
    {
      north =
      {
        layers =
        {
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_North_input",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
          }),
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_North_shadow",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            draw_as_shadow = true,
          }),
        }
      },
      east =
      {
        layers =
        {
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_East_input",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
          }),
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_East_shadow",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            draw_as_shadow = true,
          }),
        }
      },
      south =
      {
        layers =
        {
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_South_input",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
          }),
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_South_shadow",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            draw_as_shadow = true,
          }),
        }
      },
      west =
      {
        layers =
        {
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_West_input",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
          }),
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_West_shadow",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            draw_as_shadow = true,
          }),
        }
      }
    },
    output =
    {
      north =
      {
        layers =
        {
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_North_output",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
          }),
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_North_shadow",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            draw_as_shadow = true,
          }),
        }
      },
      east =
      {
        layers =
        {
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_East_output",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
          }),
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_East_shadow",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            draw_as_shadow = true,
          }),
        }
      },
      south =
      {
        layers =
        {
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_South_output",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
          }),
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_South_shadow",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            draw_as_shadow = true,
          }),
        }
      },
      west =
      {
        layers =
        {
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_West_output",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
          }),
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_West_shadow",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            draw_as_shadow = true,
          }),
        }
      }
    }
  },
  height_diff_to_wagon = 0.15,
  part1_to_2_shift = { 0, 0 },
  part2_crop_adjustment = -0.05,
  part2_shadow_crop_adjustment = -0.05,
  clamp_y_shift = -0.375,
  top_pivot_shift =
  {
    north = { 0, -2.4 },
    east = { 1.185, -1.4 },
    south = { 0, -0.8 },
    west = { -1.2, -1.4 },
  },
  resting_position_shift =
  {
    north = { 0, -0.6 },
    east = { 0.75, -0.05 },
    south = { 0, 0.5 },
    west = { -0.7, -0.05 },
  },
  shadow_shift = { 0.8, 1.55 },
}

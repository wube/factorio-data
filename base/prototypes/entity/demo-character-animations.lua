character_animations =
{
  level1 =
  {
    dead =
    {
      filename = "__base__/graphics/entity/character/level1_dead.png",
      width = 58,
      height = 58,
      shift = util.by_pixel(-7.0,-5.0),
      frame_count = 2,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level1_dead.png",
        width = 114,
        height = 112,
        shift = util.by_pixel(-7.0,-5.5),
        frame_count = 2,
        scale = 0.5
      },
    },
    dead_mask =
    {
      filename = "__base__/graphics/entity/character/level1_dead_mask.png",
      width = 46,
      height = 36,
      shift = util.by_pixel(-2.0,-6.0),
      frame_count = 2,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level1_dead_mask.png",
        width = 88,
        height = 70,
        shift = util.by_pixel(-2.5,-6.5),
        frame_count = 2,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    dead_shadow =
    {
      filename = "__base__/graphics/entity/character/level1_dead_shadow.png",
      width = 54,
      height = 54,
      shift = util.by_pixel(-4.0,-3.0),
      frame_count = 2,
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level1_dead_shadow.png",
        width = 108,
        height = 106,
        shift = util.by_pixel(-3.5,-3.0),
        frame_count = 2,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    idle =
    {
      filename = "__base__/graphics/entity/character/level1_idle.png",
      width = 46,
      height = 58,
      shift = util.by_pixel(0.0,-21.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level1_idle.png",
        width = 92,
        height = 116,
        shift = util.by_pixel(0.0,-21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        scale = 0.5
      },
    },
    idle_mask =
    {
      filename = "__base__/graphics/entity/character/level1_idle_mask.png",
      width = 28,
      height = 46,
      shift = util.by_pixel(0.0,-26.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level1_idle_mask.png",
        width = 56,
        height = 90,
        shift = util.by_pixel(0.0,-26.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    idle_shadow =
    {
      filename = "__base__/graphics/entity/character/level1_idle_shadow.png",
      width = 84,
      height = 40,
      shift = util.by_pixel(31.0,1.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level1_idle_shadow.png",
        width = 164,
        height = 78,
        shift = util.by_pixel(30.5,0.5),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    idle_gun =
    {
      filename = "__base__/graphics/entity/character/level1_idle_gun.png",
      width = 56,
      height = 64,
      shift = util.by_pixel(0.0,-22.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level1_idle_gun.png",
        width = 110,
        height = 128,
        shift = util.by_pixel(0.0,-22.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        scale = 0.5
      },
    },
    idle_gun_mask =
    {
      filename = "__base__/graphics/entity/character/level1_idle_gun_mask.png",
      width = 36,
      height = 44,
      shift = util.by_pixel(-1.0,-22.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level1_idle_gun_mask.png",
        width = 72,
        height = 88,
        shift = util.by_pixel(-0.5,-22.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    idle_gun_shadow =
    {
      filename = "__base__/graphics/entity/character/level1_idle_gun_shadow.png",
      width = 92,
      height = 48,
      shift = util.by_pixel(33.0,0.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level1_idle_gun_shadow.png",
        width = 182,
        height = 94,
        shift = util.by_pixel(33.0,0.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    mining_tool =
    {
      stripes =
      {
        {
        filename = "__base__/graphics/entity/character/level1_mining_tool-1.png",
        width_in_frames = 13,
        height_in_frames = 8,
        },
        {
        filename = "__base__/graphics/entity/character/level1_mining_tool-2.png",
        width_in_frames = 13,
        height_in_frames = 8,
        },
      },
      width = 98,
      height = 98,
      shift = util.by_pixel(0.0,-15.0),
      frame_count = 26,
      direction_count = 8,
      animation_speed = 0.9,
      hr_version =
      {
        stripes =
        {
          {
          filename = "__base__/graphics/entity/character/hr-level1_mining_tool-1.png",
          width_in_frames = 13,
          height_in_frames = 8,
          },
          {
          filename = "__base__/graphics/entity/character/hr-level1_mining_tool-2.png",
          width_in_frames = 13,
          height_in_frames = 8,
          },
        },
        width = 196,
        height = 194,
        shift = util.by_pixel(0.0,-15.0),
        frame_count = 26,
        direction_count = 8,
        animation_speed = 0.9,
        scale = 0.5
      },
    },
    mining_tool_mask =
    {
      filename = "__base__/graphics/entity/character/level1_mining_tool_mask.png",
      width = 70,
      height = 70,
      shift = util.by_pixel(0.0,-19.0),
      frame_count = 26,
      direction_count = 8,
      animation_speed = 0.9,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level1_mining_tool_mask.png",
        width = 140,
        height = 138,
        shift = util.by_pixel(0.5,-19.0),
        frame_count = 26,
        direction_count = 8,
        animation_speed = 0.9,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    mining_tool_shadow =
    {
      stripes =
      {
        {
        filename = "__base__/graphics/entity/character/level1_mining_tool_shadow-1.png",
        width_in_frames = 13,
        height_in_frames = 8,
        },
        {
        filename = "__base__/graphics/entity/character/level1_mining_tool_shadow-2.png",
        width_in_frames = 13,
        height_in_frames = 8,
        },
      },
      width = 146,
      height = 72,
      shift = util.by_pixel(26.0,0.0),
      frame_count = 26,
      direction_count = 8,
      animation_speed = 0.9,
      draw_as_shadow = true,
      hr_version =
      {
        stripes =
        {
          {
          filename = "__base__/graphics/entity/character/hr-level1_mining_tool_shadow-1.png",
          width_in_frames = 13,
          height_in_frames = 8,
          },
          {
          filename = "__base__/graphics/entity/character/hr-level1_mining_tool_shadow-2.png",
          width_in_frames = 13,
          height_in_frames = 8,
          },
        },
        width = 292,
        height = 142,
        shift = util.by_pixel(26.0,0.0),
        frame_count = 26,
        direction_count = 8,
        animation_speed = 0.9,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    running =
    {
      filename = "__base__/graphics/entity/character/level1_running.png",
      width = 44,
      height = 66,
      shift = util.by_pixel(0.0,-18.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.6,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level1_running.png",
        width = 88,
        height = 132,
        shift = util.by_pixel(0.0,-18.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        scale = 0.5
      },
    },
    running_mask =
    {
      filename = "__base__/graphics/entity/character/level1_running_mask.png",
      width = 40,
      height = 56,
      shift = util.by_pixel(0.0,-22.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.6,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level1_running_mask.png",
        width = 78,
        height = 110,
        shift = util.by_pixel(0.0,-22.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    running_shadow =
    {
      stripes =
      {
        {
        filename = "__base__/graphics/entity/character/level1_running_shadow-1.png",
        width_in_frames = 11,
        height_in_frames = 8,
        },
        {
        filename = "__base__/graphics/entity/character/level1_running_shadow-2.png",
        width_in_frames = 11,
        height_in_frames = 8,
        },
      },
      width = 96,
      height = 34,
      shift = util.by_pixel(30.0,2.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.6,
      draw_as_shadow = true,
      hr_version =
      {
        stripes =
        {
          {
          filename = "__base__/graphics/entity/character/hr-level1_running_shadow-1.png",
          width_in_frames = 11,
          height_in_frames = 8,
          },
          {
          filename = "__base__/graphics/entity/character/hr-level1_running_shadow-2.png",
          width_in_frames = 11,
          height_in_frames = 8,
          },
        },
        width = 190,
        height = 68,
        shift = util.by_pixel(30.0,2.5),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    running_gun =
    {
      filename = "__base__/graphics/entity/character/level1_running_gun.png",
      width = 56,
      height = 68,
      shift = util.by_pixel(3.0,-20.0),
      frame_count = 22,
      direction_count = 18,
      animation_speed = 0.6,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level1_running_gun.png",
        width = 108,
        height = 136,
        shift = util.by_pixel(2.5,-19.5),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        scale = 0.5
      },
    },
    running_gun_mask =
    {
      filename = "__base__/graphics/entity/character/level1_running_gun_mask.png",
      width = 34,
      height = 50,
      shift = util.by_pixel(1.0,-23.0),
      frame_count = 22,
      direction_count = 18,
      animation_speed = 0.6,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level1_running_gun_mask.png",
        width = 66,
        height = 100,
        shift = util.by_pixel(1.0,-23.0),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    running_gun_shadow =
    {
      stripes =
      {
        {
        filename = "__base__/graphics/entity/character/level1_running_gun_shadow-1.png",
        width_in_frames = 11,
        height_in_frames = 18,
        },
        {
        filename = "__base__/graphics/entity/character/level1_running_gun_shadow-2.png",
        width_in_frames = 11,
        height_in_frames = 18,
        },
      },
      width = 96,
      height = 50,
      shift = util.by_pixel(30.0,0.0),
      frame_count = 22,
      direction_count = 18,
      animation_speed = 0.6,
      draw_as_shadow = true,
      hr_version =
      {
        stripes =
        {
          {
          filename = "__base__/graphics/entity/character/hr-level1_running_gun_shadow-1.png",
          width_in_frames = 11,
          height_in_frames = 18,
          },
          {
          filename = "__base__/graphics/entity/character/hr-level1_running_gun_shadow-2.png",
          width_in_frames = 11,
          height_in_frames = 18,
          },
        },
        width = 192,
        height = 100,
        shift = util.by_pixel(30.0,0.0),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    running_gun_shadow_flipped =
    {
      filename = "__base__/graphics/entity/character/level1_running_gun_shadow_flipped.png",
      line_length = 22,
      width = 90,
      height = 50,
      shift = util.by_pixel(26.0,0.0),
      frame_count = 22,
      direction_count = 18,
      animation_speed = 0.6,
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level1_running_gun_shadow_flipped.png",
        line_length = 22,
        width = 178,
        height = 100,
        shift = util.by_pixel(25.5,0.0),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        line_length = 22,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
  },
  level2addon =
  {
    dead =
    {
      filename = "__base__/graphics/entity/character/level2addon_dead.png",
      width = 44,
      height = 34,
      shift = util.by_pixel(-1.0,-5.0),
      frame_count = 2,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_dead.png",
        width = 86,
        height = 68,
        shift = util.by_pixel(-1.0,-5.0),
        frame_count = 2,
        scale = 0.5
      },
    },
    dead_mask =
    {
      filename = "__base__/graphics/entity/character/level2addon_dead_mask.png",
      width = 44,
      height = 34,
      shift = util.by_pixel(0.0,-5.0),
      frame_count = 2,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_dead_mask.png",
        width = 86,
        height = 66,
        shift = util.by_pixel(-0.5,-5.5),
        frame_count = 2,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    dead_shadow =
    {
      filename = "__base__/graphics/entity/character/level2addon_dead_shadow.png",
      width = 46,
      height = 36,
      shift = util.by_pixel(2.0,0.0),
      frame_count = 2,
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_dead_shadow.png",
        width = 90,
        height = 68,
        shift = util.by_pixel(1.5,-0.5),
        frame_count = 2,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    idle =
    {
      filename = "__base__/graphics/entity/character/level2addon_idle.png",
      width = 28,
      height = 44,
      shift = util.by_pixel(0.0,-27.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_idle.png",
        width = 56,
        height = 86,
        shift = util.by_pixel(0.5,-27.5),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        scale = 0.5
      },
    },
    idle_mask =
    {
      filename = "__base__/graphics/entity/character/level2addon_idle_mask.png",
      width = 26,
      height = 42,
      shift = util.by_pixel(0.0,-28.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_idle_mask.png",
        width = 52,
        height = 84,
        shift = util.by_pixel(0.0,-28.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    idle_shadow =
    {
      stripes =
      {
        {
        filename = "__base__/graphics/entity/character/level2addon_idle_shadow-1.png",
        width_in_frames = 11,
        height_in_frames = 8,
        },
        {
        filename = "__base__/graphics/entity/character/level2addon_idle_shadow-2.png",
        width_in_frames = 11,
        height_in_frames = 8,
        },
      },
      width = 94,
      height = 40,
      shift = util.by_pixel(36.0,1.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_idle_shadow.png",
        width = 186,
        height = 78,
        shift = util.by_pixel(36.0,0.5),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    idle_gun =
    {
      filename = "__base__/graphics/entity/character/level2addon_idle_gun.png",
      width = 36,
      height = 44,
      shift = util.by_pixel(0.0,-25.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_idle_gun.png",
        width = 72,
        height = 86,
        shift = util.by_pixel(0.0,-25.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        scale = 0.5
      },
    },
    idle_gun_mask =
    {
      filename = "__base__/graphics/entity/character/level2addon_idle_gun_mask.png",
      width = 36,
      height = 44,
      shift = util.by_pixel(0.0,-25.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_idle_gun_mask.png",
        width = 72,
        height = 84,
        shift = util.by_pixel(0.0,-25.5),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    idle_gun_shadow =
    {
      filename = "__base__/graphics/entity/character/level2addon_idle_gun_shadow.png",
      width = 92,
      height = 48,
      shift = util.by_pixel(33.0,0.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_idle_gun_shadow.png",
        width = 182,
        height = 94,
        shift = util.by_pixel(33.0,0.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    mining_tool =
    {
      filename = "__base__/graphics/entity/character/level2addon_mining_tool.png",
      width = 72,
      height = 62,
      shift = util.by_pixel(0.0,-21.0),
      frame_count = 26,
      direction_count = 8,
      animation_speed = 0.9,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_mining_tool.png",
        width = 142,
        height = 124,
        shift = util.by_pixel(0.0,-21.0),
        frame_count = 26,
        direction_count = 8,
        animation_speed = 0.9,
        scale = 0.5
      },
    },
    mining_tool_mask =
    {
      filename = "__base__/graphics/entity/character/level2addon_mining_tool_mask.png",
      width = 70,
      height = 60,
      shift = util.by_pixel(0.0,-22.0),
      frame_count = 26,
      direction_count = 8,
      animation_speed = 0.9,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_mining_tool_mask.png",
        width = 140,
        height = 120,
        shift = util.by_pixel(0.0,-22.0),
        frame_count = 26,
        direction_count = 8,
        animation_speed = 0.9,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    mining_tool_shadow =
    {
      stripes =
      {
        {
        filename = "__base__/graphics/entity/character/level2addon_mining_tool_shadow-1.png",
        width_in_frames = 13,
        height_in_frames = 8,
        },
        {
        filename = "__base__/graphics/entity/character/level2addon_mining_tool_shadow-2.png",
        width_in_frames = 13,
        height_in_frames = 8,
        },
      },
      width = 146,
      height = 72,
      shift = util.by_pixel(26.0,0.0),
      frame_count = 26,
      direction_count = 8,
      animation_speed = 0.9,
      draw_as_shadow = true,
      hr_version =
      {
        stripes =
        {
          {
          filename = "__base__/graphics/entity/character/hr-level2addon_mining_tool_shadow-1.png",
          width_in_frames = 13,
          height_in_frames = 8,
          },
          {
          filename = "__base__/graphics/entity/character/hr-level2addon_mining_tool_shadow-2.png",
          width_in_frames = 13,
          height_in_frames = 8,
          },
        },
        width = 292,
        height = 142,
        shift = util.by_pixel(26.0,0.0),
        frame_count = 26,
        direction_count = 8,
        animation_speed = 0.9,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    running =
    {
      filename = "__base__/graphics/entity/character/level2addon_running.png",
      width = 36,
      height = 54,
      shift = util.by_pixel(0.0,-25.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.6,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_running.png",
        width = 70,
        height = 106,
        shift = util.by_pixel(0.0,-25.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        scale = 0.5
      },
    },
    running_mask =
    {
      filename = "__base__/graphics/entity/character/level2addon_running_mask.png",
      width = 36,
      height = 54,
      shift = util.by_pixel(0.0,-25.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.6,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_running_mask.png",
        width = 70,
        height = 104,
        shift = util.by_pixel(0.0,-25.5),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    running_shadow =
    {
      stripes =
      {
        {
        filename = "__base__/graphics/entity/character/level2addon_running_shadow-1.png",
        width_in_frames = 11,
        height_in_frames = 8,
        },
        {
        filename = "__base__/graphics/entity/character/level2addon_running_shadow-2.png",
        width_in_frames = 11,
        height_in_frames = 8,
        },
      },
      width = 98,
      height = 34,
      shift = util.by_pixel(31.0,2.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.6,
      draw_as_shadow = true,
      hr_version =
      {
        stripes =
        {
          {
          filename = "__base__/graphics/entity/character/hr-level2addon_running_shadow-1.png",
          width_in_frames = 11,
          height_in_frames = 8,
          },
          {
          filename = "__base__/graphics/entity/character/hr-level2addon_running_shadow-2.png",
          width_in_frames = 11,
          height_in_frames = 8,
          },
        },
        width = 194,
        height = 68,
        shift = util.by_pixel(31.0,2.5),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    running_gun =
    {
      filename = "__base__/graphics/entity/character/level2addon_running_gun.png",
      width = 36,
      height = 48,
      shift = util.by_pixel(1.0,-25.0),
      frame_count = 22,
      direction_count = 18,
      animation_speed = 0.6,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_running_gun.png",
        width = 68,
        height = 94,
        shift = util.by_pixel(0.5,-25.5),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        scale = 0.5
      },
    },
    running_gun_mask =
    {
      filename = "__base__/graphics/entity/character/level2addon_running_gun_mask.png",
      width = 36,
      height = 48,
      shift = util.by_pixel(1.0,-25.0),
      frame_count = 22,
      direction_count = 18,
      animation_speed = 0.6,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_running_gun_mask.png",
        width = 68,
        height = 94,
        shift = util.by_pixel(0.5,-25.5),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    running_gun_shadow =
    {
      filename = "__base__/graphics/entity/character/level2addon_running_gun_shadow.png",
      width = 68,
      height = 30,
      shift = util.by_pixel(37.0,1.0),
      frame_count = 22,
      direction_count = 18,
      animation_speed = 0.6,
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_running_gun_shadow.png",
        width = 134,
        height = 58,
        shift = util.by_pixel(37.0,1.0),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    running_gun_shadow_flipped =
    {
      filename = "__base__/graphics/entity/character/level2addon_running_gun_shadow_flipped.png",
      line_length = 22,
      width = 70,
      height = 30,
      shift = util.by_pixel(34.0,1.0),
      frame_count = 22,
      direction_count = 18,
      animation_speed = 0.6,
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level2addon_running_gun_shadow_flipped.png",
        line_length = 22,
        width = 138,
        height = 58,
        shift = util.by_pixel(34.0,1.0),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        line_length = 22,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
  },
  level3addon =
  {
    dead =
    {
      filename = "__base__/graphics/entity/character/level3addon_dead.png",
      width = 44,
      height = 34,
      shift = util.by_pixel(-1.0,-5.0),
      frame_count = 2,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_dead.png",
        width = 88,
        height = 68,
        shift = util.by_pixel(-0.5,-5.0),
        frame_count = 2,
        scale = 0.5
      },
    },
    dead_mask =
    {
      filename = "__base__/graphics/entity/character/level3addon_dead_mask.png",
      width = 36,
      height = 30,
      shift = util.by_pixel(3.0,-4.0),
      frame_count = 2,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_dead_mask.png",
        width = 72,
        height = 60,
        shift = util.by_pixel(3.0,-3.5),
        frame_count = 2,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    dead_shadow =
    {
      filename = "__base__/graphics/entity/character/level3addon_dead_shadow.png",
      width = 48,
      height = 36,
      shift = util.by_pixel(2.0,-1.0),
      frame_count = 2,
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_dead_shadow.png",
        width = 92,
        height = 72,
        shift = util.by_pixel(1.5,-1.0),
        frame_count = 2,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    idle =
    {
      filename = "__base__/graphics/entity/character/level3addon_idle.png",
      width = 38,
      height = 44,
      shift = util.by_pixel(0.0,-28.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_idle.png",
        width = 74,
        height = 86,
        shift = util.by_pixel(0.0,-28.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        scale = 0.5
      },
    },
    idle_mask =
    {
      filename = "__base__/graphics/entity/character/level3addon_idle_mask.png",
      width = 38,
      height = 38,
      shift = util.by_pixel(0.0,-31.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_idle_mask.png",
        width = 74,
        height = 72,
        shift = util.by_pixel(0.0,-31.5),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    idle_shadow =
    {
      filename = "__base__/graphics/entity/character/level3addon_idle_shadow.png",
      width = 66,
      height = 32,
      shift = util.by_pixel(38.0,0.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_idle_shadow.png",
        width = 132,
        height = 64,
        shift = util.by_pixel(38.5,0.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    idle_gun =
    {
      filename = "__base__/graphics/entity/character/level3addon_idle_gun.png",
      width = 40,
      height = 44,
      shift = util.by_pixel(0.0,-25.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_idle_gun.png",
        width = 78,
        height = 88,
        shift = util.by_pixel(0.0,-24.5),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        scale = 0.5
      },
    },
    idle_gun_mask =
    {
      filename = "__base__/graphics/entity/character/level3addon_idle_gun_mask.png",
      width = 38,
      height = 36,
      shift = util.by_pixel(0.0,-28.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_idle_gun_mask.png",
        width = 76,
        height = 68,
        shift = util.by_pixel(0.0,-28.5),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    idle_gun_shadow =
    {
      filename = "__base__/graphics/entity/character/level3addon_idle_gun_shadow.png",
      width = 66,
      height = 32,
      shift = util.by_pixel(34.0,0.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.15,
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_idle_gun_shadow.png",
        width = 130,
        height = 64,
        shift = util.by_pixel(33.5,0.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    mining_tool =
    {
      filename = "__base__/graphics/entity/character/level3addon_mining_tool.png",
      width = 72,
      height = 64,
      shift = util.by_pixel(0.0,-21.0),
      frame_count = 26,
      direction_count = 8,
      animation_speed = 0.9,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_mining_tool.png",
        width = 144,
        height = 124,
        shift = util.by_pixel(0.0,-21.5),
        frame_count = 26,
        direction_count = 8,
        animation_speed = 0.9,
        scale = 0.5
      },
    },
    mining_tool_mask =
    {
      filename = "__base__/graphics/entity/character/level3addon_mining_tool_mask.png",
      width = 70,
      height = 56,
      shift = util.by_pixel(0.0,-24.0),
      frame_count = 26,
      direction_count = 8,
      animation_speed = 0.9,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_mining_tool_mask.png",
        width = 138,
        height = 112,
        shift = util.by_pixel(0.0,-24.0),
        frame_count = 26,
        direction_count = 8,
        animation_speed = 0.9,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    mining_tool_shadow =
    {
      stripes =
      {
        {
        filename = "__base__/graphics/entity/character/level3addon_mining_tool_shadow-1.png",
        width_in_frames = 13,
        height_in_frames = 8,
        },
        {
        filename = "__base__/graphics/entity/character/level3addon_mining_tool_shadow-2.png",
        width_in_frames = 13,
        height_in_frames = 8,
        },
      },
      width = 92,
      height = 58,
      shift = util.by_pixel(30.0,0.0),
      frame_count = 26,
      direction_count = 8,
      animation_speed = 0.9,
      draw_as_shadow = true,
      hr_version =
      {
        stripes =
        {
          {
          filename = "__base__/graphics/entity/character/hr-level3addon_mining_tool_shadow-1.png",
          width_in_frames = 13,
          height_in_frames = 8,
          },
          {
          filename = "__base__/graphics/entity/character/hr-level3addon_mining_tool_shadow-2.png",
          width_in_frames = 13,
          height_in_frames = 8,
          },
        },
        width = 184,
        height = 116,
        shift = util.by_pixel(30.0,0.0),
        frame_count = 26,
        direction_count = 8,
        animation_speed = 0.9,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    running =
    {
      filename = "__base__/graphics/entity/character/level3addon_running.png",
      width = 40,
      height = 54,
      shift = util.by_pixel(0.0,-25.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.6,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_running.png",
        width = 80,
        height = 108,
        shift = util.by_pixel(0.0,-25.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        scale = 0.5
      },
    },
    running_mask =
    {
      filename = "__base__/graphics/entity/character/level3addon_running_mask.png",
      width = 40,
      height = 44,
      shift = util.by_pixel(0.0,-29.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.6,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_running_mask.png",
        width = 78,
        height = 88,
        shift = util.by_pixel(0.0,-28.5),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    running_shadow =
    {
      filename = "__base__/graphics/entity/character/level3addon_running_shadow.png",
      width = 84,
      height = 36,
      shift = util.by_pixel(38.0,3.0),
      frame_count = 22,
      direction_count = 8,
      animation_speed = 0.6,
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_running_shadow.png",
        width = 168,
        height = 68,
        shift = util.by_pixel(38.0,2.5),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    running_gun =
    {
      filename = "__base__/graphics/entity/character/level3addon_running_gun.png",
      width = 38,
      height = 48,
      shift = util.by_pixel(0.0,-25.0),
      frame_count = 22,
      direction_count = 18,
      animation_speed = 0.6,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_running_gun.png",
        width = 76,
        height = 96,
        shift = util.by_pixel(0.5,-24.5),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        scale = 0.5
      },
    },
    running_gun_mask =
    {
      filename = "__base__/graphics/entity/character/level3addon_running_gun_mask.png",
      width = 38,
      height = 38,
      shift = util.by_pixel(1.0,-29.0),
      frame_count = 22,
      direction_count = 18,
      animation_speed = 0.6,
      apply_runtime_tint = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_running_gun_mask.png",
        width = 74,
        height = 74,
        shift = util.by_pixel(0.5,-29.5),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
      },
    },
    running_gun_shadow =
    {
      filename = "__base__/graphics/entity/character/level3addon_running_gun_shadow.png",
      width = 68,
      height = 32,
      shift = util.by_pixel(36.0,0.0),
      frame_count = 22,
      direction_count = 18,
      animation_speed = 0.6,
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_running_gun_shadow.png",
        width = 136,
        height = 64,
        shift = util.by_pixel(36.0,0.5),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
    running_gun_shadow_flipped =
    {
      filename = "__base__/graphics/entity/character/level3addon_running_gun_shadow_flipped.png",
      line_length = 22,
      width = 72,
      height = 32,
      shift = util.by_pixel(34.0,0.0),
      frame_count = 22,
      direction_count = 18,
      animation_speed = 0.6,
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/character/hr-level3addon_running_gun_shadow_flipped.png",
        line_length = 22,
        width = 142,
        height = 64,
        shift = util.by_pixel(33.5,0.5),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        line_length = 22,
        draw_as_shadow = true,
        scale = 0.5
      },
    },
  },
}

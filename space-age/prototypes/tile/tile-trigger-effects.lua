local tile_trigger_effects = {}

tile_trigger_effects.sand_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "sand-1-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "sand-1-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "sand-1-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "sand-1-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.red_desert_0_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-0-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-0-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-0-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-0-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.red_desert_1_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-1-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-1-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-1-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-1-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.red_desert_2_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-2-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-2-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-2-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-2-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.red_desert_3_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-3-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-3-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-3-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-3-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.dirt_1_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-1-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-1-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-1-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-1-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.dirt_2_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-2-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-2-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-2-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-2-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.dirt_3_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-3-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-3-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-3-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-3-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.dirt_4_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-4-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-4-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-4-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-4-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.dirt_5_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-5-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-5-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-5-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-5-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.dirt_6_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-6-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-6-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-6-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-6-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.dirt_7_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-7-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-7-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-7-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dirt-7-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.dry_dirt_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dry-dirt-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dry-dirt-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dry-dirt-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "dry-dirt-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.grass_1_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "grass-1-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "grass-1-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "grass-1-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "grass-1-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-carpet-grass-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.6992, -0.5 }, { 0.6992, 0.5 } },
      initial_height = 0.1,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.09,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.grass_2_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "grass-2-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "grass-2-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "grass-2-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "grass-2-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-carpet-grass-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.6992, -0.5 }, { 0.6992, 0.5 } },
      initial_height = 0.1,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.09,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.grass_3_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "grass-3-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "grass-3-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "grass-3-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "grass-3-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-carpet-grass-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.6992, -0.5 }, { 0.6992, 0.5 } },
      initial_height = 0.1,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.09,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.grass_4_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "grass-4-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "grass-4-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "grass-4-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "grass-4-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-carpet-grass-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.6992, -0.5 }, { 0.6992, 0.5 } },
      initial_height = 0.1,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.09,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.landfill_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "landfill-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "landfill-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "landfill-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "landfill-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.stone_path_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "stone-path-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "stone-path-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "stone-path-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "stone-path-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.concrete_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "concrete-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "concrete-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "concrete-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "concrete-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.hazard_concrete_left_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "hazard-concrete-left-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "hazard-concrete-left-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "hazard-concrete-left-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "hazard-concrete-left-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.hazard_concrete_right_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "hazard-concrete-right-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "hazard-concrete-right-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "hazard-concrete-right-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "hazard-concrete-right-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.lab_tile_white_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "lab-tile-white-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "lab-tile-white-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "lab-tile-white-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "lab-tile-white-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.lab_tile_dark_1_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "lab-tile-1-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "lab-tile-1-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "lab-tile-1-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "lab-tile-1-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.lab_tile_dark_2_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "lab-tile-2-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "lab-tile-2-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "lab-tile-2-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "lab-tile-2-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.water_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tintable-water-particle",
      apply_tile_tint = "primary",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2969, -0.2969 }, { 0.2969, 0.2969 } },
      initial_height = 0.1,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.069,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 12,
      tail_length_deviation = 20,
      tail_width = 1
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tintable-water-lower-particle",
      apply_tile_tint = "primary",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2969, -0.2969 }, { 0.2969, 0.2969 } },
      initial_height = 0.1,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.069,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 12,
      tail_length_deviation = 20,
      tail_width = 1
    }
  }
end

tile_trigger_effects.shallow_water_trigger_effect = tile_trigger_effects.water_trigger_effect

tile_trigger_effects.water_mud_trigger_effect = tile_trigger_effects.water_trigger_effect


tile_trigger_effects.tutorial_grid_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tutorial-grid-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tutorial-grid-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tutorial-grid-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tutorial-grid-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.ash_sand_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "sand-1-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
      initial_height = 0.2,
      initial_height_deviation = 0.22,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.041,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "sand-1-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2, -0.2 }, { 0.3, 0.3 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "sand-1-stone-lower-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation =
      {
        left_top = { -0.3984, -0.7969 },
        right_bottom = { 0.3984, 0.7969 }
      },
      initial_height = 0.2,
      initial_height_deviation = 0.2,
      initial_vertical_speed = 0.125,
      initial_vertical_speed_deviation = 0.042,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 4,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "sand-1-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      initial_height = 0.2,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.1,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

tile_trigger_effects.hot_lava_trigger_effect = function()
  return
  {
    {
      type = "damage",
      damage = {amount = 50, type = "fire"}
    }
  }
end

return tile_trigger_effects

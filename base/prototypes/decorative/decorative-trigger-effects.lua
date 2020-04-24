local decorative_trigger_effects = {}

local shift_multiplier = 0.2
local initial_height_deviation_multiplier = 1

local function multiply_area(multiplier, area)
  local top_left_x     = area[1][1] * multiplier
  local top_left_y     = area[1][2] * multiplier
  local bottom_right_x = area[2][1] * multiplier
  local bottom_right_y = area[2][2] * multiplier
  local result_area = { {top_left_x, top_left_y}, {bottom_right_x, bottom_right_y} }
  return result_area
end

decorative_trigger_effects.brown_hairy_grass = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 10,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "brown-hairy-grass-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.2, -0.2 }, { 0.2, 0.2 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.05,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 5,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "brown-hairy-grass-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.2, -0.2 }, { 0.2, 0.2 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.55,
      initial_vertical_speed = 0.021,
      initial_vertical_speed_deviation = 0.035,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.005,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.green_hairy_grass = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-hairy-grass-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.3, -0.3 }, { 0.3, 0.3 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.05,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 5,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-hairy-grass-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.3, -0.3 }, { 0.3, 0.3 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.55,
      initial_vertical_speed = 0.021,
      initial_vertical_speed_deviation = 0.035,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.005,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.green_carpet_grass = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 50,
      repeat_count_deviation = 10,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-carpet-grass-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -5, -5 }, { 5, 5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.061,
      initial_vertical_speed_deviation = 0.050,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.013,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 5,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-carpet-grass-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -2.5, -2.5 }, { 2.5, 2.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.062,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.022,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.small_ship_wreck_grass = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 35,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-carpet-grass-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.061,
      initial_vertical_speed_deviation = 0.050,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.013,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 5,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-carpet-grass-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.062,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.022,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.big_ship_wreck_grass = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 50,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-carpet-grass-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.061,
      initial_vertical_speed_deviation = 0.050,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.013,
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
      particle_name = "green-carpet-grass-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.062,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.022,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "small-rock-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.070,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.04,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.brown_carpet_grass = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 25,
      repeat_count_deviation = 10,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "brown-carpet-grass-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -3, -3 }, { 3, 3 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.061,
      initial_vertical_speed_deviation = 0.043,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.013,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 5,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "brown-carpet-grass-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.062,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.022,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 25,
      repeat_count_deviation = 10,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-carpet-grass-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -3, -3 }, { 3, 3 } }),
      tile_collision_mask = nil,
      initial_height = 0.3,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.070,
      initial_vertical_speed_deviation = 0.043,
      speed_from_center = 0.015,
      speed_from_center_deviation = 0.020,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.green_small_grass = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-small-grass-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.035,
      initial_vertical_speed_deviation = 0.043,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.013,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 2,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-small-grass-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.035,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.015,
      speed_from_center_deviation = 0.022,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.green_asterisk = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 6,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-asterisk-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.35, -0.35 }, { 0.35, 0.35 } }),
      tile_collision_mask = nil,
      initial_height = 0,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.051,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 3,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-asterisk-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.35, -0.35 }, { 0.35, 0.35 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.060,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.015,
      speed_from_center_deviation = 0.03,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-asterisk-grass-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.35, -0.35 }, { 0.35, 0.35 } }),
      tile_collision_mask = nil,
      initial_height = 0,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.051,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.green_pita = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 12,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-pita-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.081,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 6,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-pita-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.060,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.green_pita_mini = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 4,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-pita-mini-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.041,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 3,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-pita-mini-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.060,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.green_desert_bush = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-desert-bush-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.035,
      initial_vertical_speed_deviation = 0.043,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.013,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 3,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-desert-bush-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.035,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.015,
      speed_from_center_deviation = 0.022,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.green_bush_mini = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 6,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-bush-mini-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.035,
      initial_vertical_speed_deviation = 0.043,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.013,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.red_desert_bush = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-bush-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.2, -0.2 }, { 0.2, 0.2 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.035,
      initial_vertical_speed_deviation = 0.043,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.013,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 3,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-desert-bush-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.2, -0.2 }, { 0.2, 0.2 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.035,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.015,
      speed_from_center_deviation = 0.022,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.white_desert_bush = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "white-desert-bush-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.035,
      initial_vertical_speed_deviation = 0.043,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.013,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 3,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "white-desert-bush-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.035,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.015,
      speed_from_center_deviation = 0.022,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.garballo_mini_dry = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 9,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "garballo-mini-dry-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.1, -0.1 }, { 0.1, 0.1 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.05,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.015,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 3,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "garballo-mini-dry-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.1, -0.1 }, { 0.1, 0.1 } }),
      tile_collision_mask = nil,
      initial_height = 0.325,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.08,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.03,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.garballo = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 8,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "garballo-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.1, -0.1 }, { 0.1, 0.1 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.04,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.015,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 2,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "garballo-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.1, -0.1 }, { 0.1, 0.1 } }),
      tile_collision_mask = nil,
      initial_height = 0.325,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.04,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.03,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 3,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-carpet-grass-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.3,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.070,
      initial_vertical_speed_deviation = 0.043,
      speed_from_center = 0.015,
      speed_from_center_deviation = 0.020,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.lichen = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 25,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "lichen-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.19,
      initial_vertical_speed = 0.09,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 5,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "lichen-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.045,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.red_pita = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 9,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-pita-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.081,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-pita-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.060,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.green_croton = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 8,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-croton-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.08,
      initial_vertical_speed_deviation = 0,
      speed_from_center = 0.009,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 6,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-croton-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.08,
      initial_vertical_speed_deviation = 0,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.red_croton = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 5,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-croton-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.08,
      initial_vertical_speed_deviation = 0,
      speed_from_center = 0.009,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 5,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-croton-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.08,
      initial_vertical_speed_deviation = 0,
      speed_from_center = 0.009,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 12,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-croton-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.08,
      initial_vertical_speed_deviation = 0,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.brown_asterisk = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 7,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "brown-asterisk-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.35, -0.35 }, { 0.35, 0.35 } }),
      tile_collision_mask = nil,
      initial_height = 0,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.051,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 5,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "brown-asterisk-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.35, -0.35 }, { 0.35, 0.35 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.060,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "brown-asterisk-grass-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.35, -0.35 }, { 0.35, 0.35 } }),
      tile_collision_mask = nil,
      initial_height = 0,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.051,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.red_asterisk = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 6,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-asterisk-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.35, -0.35 }, { 0.35, 0.35 } }),
      tile_collision_mask = nil,
      initial_height = 0,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.051,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 3,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-asterisk-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.35, -0.35 }, { 0.35, 0.35 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.060,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.015,
      speed_from_center_deviation = 0.03,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 8,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "red-asterisk-grass-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.35, -0.35 }, { 0.35, 0.35 } }),
      tile_collision_mask = nil,
      initial_height = 0,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.051,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.brown_asterisk_mini = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 2,
      repeat_count_deviation = 1,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "brown-asterisk-mini-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.27,
      initial_vertical_speed = 0.04,
      initial_vertical_speed_deviation = 0.035,
      speed_from_center = 0,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 3,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "brown-asterisk-mini-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.32,
      initial_vertical_speed = 0.019,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.green_asterisk_mini = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 2,
      repeat_count_deviation = 1,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-asterisk-mini-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.27,
      initial_vertical_speed = 0.04,
      initial_vertical_speed_deviation = 0.035,
      speed_from_center = 0,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 3,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "green-asterisk-mini-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.32,
      initial_vertical_speed = 0.019,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.brown_fluff = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 2,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "brown-fluff-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.3,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.045,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.005,
      speed_from_center_deviation = 0.003,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 10,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "brown-fluff-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.3,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.042,
      initial_vertical_speed_deviation = 0.048,
      speed_from_center = 0.005,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 5,
      repeat_count_deviation = 5,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "brown-carpet-grass-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.061,
      initial_vertical_speed_deviation = 0.043,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.013,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.brown_fluff_dry = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 2,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "brown-fluff-dry-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.3,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.045,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.005,
      speed_from_center_deviation = 0.003,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 10,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "brown-fluff-dry-wooden-splinter-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.3,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.042,
      initial_vertical_speed_deviation = 0.048,
      speed_from_center = 0.005,
      speed_from_center_deviation = 0.05,
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
      particle_name = "brown-carpet-grass-vegetation-particle-small-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.061,
      initial_vertical_speed_deviation = 0.043,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.013,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.tiny_rock = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tiny-rock-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.3,
      initial_height_deviation = initial_height_deviation_multiplier * 0.1,
      initial_vertical_speed = 0.050,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 6,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "small-rock-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.3,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.070,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.small_rock = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "small-rock-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.2,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.070,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.04,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 5,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "small-rock-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.85,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.medium_rock = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "medium-rock-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.5,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.092,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.04,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "medium-rock-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.3,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.127,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 2,
      repeat_count_deviation = 10,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "big-rock-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.3945 }, { 0.5, 0.3945 } }),
      tile_collision_mask = nil,
      initial_height = 0.4,
      initial_height_deviation = initial_height_deviation_multiplier * 0.61,
      initial_vertical_speed = 0.055,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.big_rock = function()
  return
   {
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "big-rock-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.6914, -0.5 }, { 0.6914, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.3,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.115,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.04,
      speed_from_center_deviation = 0.03,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 2,
      repeat_count_deviation = 3,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "big-rock-stone-particle-big",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.3945, -0.5 }, { 0.3945, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.5,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.086,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.04,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 19,
      repeat_count_deviation = 10,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "big-rock-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.3945 }, { 0.5, 0.3945 } }),
      tile_collision_mask = nil,
      initial_height = 0.4,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.069,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 25,
      repeat_count_deviation = 10,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "big-rock-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.3945 }, { 0.5, 0.3945 } }),
      tile_collision_mask = nil,
      initial_height = 0.4,
      initial_height_deviation = initial_height_deviation_multiplier * 0.61,
      initial_vertical_speed = 0.055,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.huge_rock = function()
  return
   {
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 2,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "huge-rock-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.3945, -0.5 }, { 0.3945, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.3,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.115,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.04,
      speed_from_center_deviation = 0.03,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 5,
      repeat_count_deviation = 3,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "huge-rock-stone-particle-big",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.3945, -0.5 }, { 0.3945, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.5,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.086,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.04,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 10,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "huge-rock-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.3945 }, { 0.5, 0.3945 } }),
      tile_collision_mask = nil,
      initial_height = 0.4,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.069,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 15,
      repeat_count_deviation = 10,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "huge-rock-stone-particle-medium",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.3945 }, { 0.5, 0.3945 } }),
      tile_collision_mask = nil,
      initial_height = 0.4,
      initial_height_deviation = initial_height_deviation_multiplier * 0.61,
      initial_vertical_speed = 0.085,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

decorative_trigger_effects.small_sand_rock = function()
  return
  {
    {
      type = "create-particle",
      repeat_count = 20,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "small-sand-rock-stone-particle-small",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.5,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.092,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.04,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 0,
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "small-sand-rock-stone-particle-tiny",
      offsets = { { 0, 0 } },
      offset_deviation = multiply_area(shift_multiplier, { { -0.5, -0.5 }, { 0.5, 0.5 } }),
      tile_collision_mask = nil,
      initial_height = 0.3,
      initial_height_deviation = initial_height_deviation_multiplier * 0.5,
      initial_vertical_speed = 0.127,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0
    }
  }
end

return decorative_trigger_effects

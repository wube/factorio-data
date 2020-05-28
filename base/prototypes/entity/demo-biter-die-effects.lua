local effects = {}

---- SMALL- BITER DEATH
effects.small_biter =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets =
        {
          { -0.07813, 1.211 },
          { -0.01563, 0.2422 }
        },
        offset_deviation = { { 0, -1 }, { 0, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.9,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.029,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.02,
        speed_from_center_deviation = 0.015,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 12,
        tail_length_deviation = 25,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets =
        {
          { 0.03906, -0.02344 }
        },
        offset_deviation = { { -1, -0.6992 }, { 1, 0.6992 } },
        tile_collision_mask = nil,
        initial_height = 0.4,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.04,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 3,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets =
        {
          { -0.0625, -0.3828 }
        },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.075,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 13,
        tail_length_deviation = 3,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 13,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, 0 } },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = -0,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.009,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.041,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 11,
        tail_length_deviation = 0,
        tail_width = 1
      }
    }
  }
}

---- MEDIUM BITER DEATH
effects.medium_biter =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets =
        {
          { -0.07813, 1.211 },
          { -0.01563, 0.2422 }
        },
        offset_deviation = { { 0, -1 }, { 0, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.9,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.029,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.02,
        speed_from_center_deviation = 0.015,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 12,
        tail_length_deviation = 25,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets =
        {
          { 0.03906, -0.02344 }
        },
        offset_deviation = { { -1, -0.6992 }, { 1, 0.6992 } },
        tile_collision_mask = nil,
        initial_height = 0.4,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.04,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 3,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, -0.03906 } },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.075,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 13,
        tail_length_deviation = 3,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 13,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, 0 } },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = -0,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.009,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.041,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 11,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 6,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, 0 } },
        offset_deviation = { { -1, -0.5 }, { 1, 0.5 } },
        tile_collision_mask = nil,
        initial_height = 0.3,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.043,
        initial_vertical_speed_deviation = 0.003,
        speed_from_center = 0.06,
        speed_from_center_deviation = 0.042,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 10,
        tail_length_deviation = 12,
        tail_width = 1
      }
    }
  }
}

----BIG BITER DEATH
effects.big_biter =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets =
        {
          { 0.0625, 0.7891 },
          { -0.01563, 0.2422 }
        },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.9,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.029,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.015,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 12,
        tail_length_deviation = 25,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets =
        {
          { 0.03906, -0.02344 }
        },
        offset_deviation = { { -1, -0.6992 }, { 1, 0.6992 } },
        tile_collision_mask = nil,
        initial_height = 0.4,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.04,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 3,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 9,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, -0.03906 } },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.075,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 21,
        tail_length_deviation = 3,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 13,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, 0 } },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.01,
        initial_vertical_speed = 0.009,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.13,
        speed_from_center_deviation = 0.041,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 11,
        tail_length_deviation = 7,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 6,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, 0 } },
        offset_deviation = { { -1, -0.5 }, { 1, 0.5 } },
        tile_collision_mask = nil,
        initial_height = 0.3,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.043,
        initial_vertical_speed_deviation = 0.003,
        speed_from_center = 0.06,
        speed_from_center_deviation = 0.042,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 10,
        tail_length_deviation = 12,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-big",
        offsets = { { 0, 0 } },
        offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        tile_collision_mask = nil,
        initial_height = 0.02,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.125,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 2,
        tail_length_deviation = 0,
        tail_width = 1
      }
    }
  }
}

effects.behemoth_biter =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets =
        {
          { 0.0625, 0.7891 },
          { -0.01563, 0.2422 }
        },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.9,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.040,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.035,
        speed_from_center_deviation = 0.015,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 12,
        tail_length_deviation = 25,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 5,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets =
        {
          { 0.03906, -0.02344 }
        },
        offset_deviation = { { -1, -0.6992 }, { 1, 0.6992 } },
        tile_collision_mask = nil,
        initial_height = 0.4,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.07,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.07,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 3,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 9,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, -0.03906 } },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.090,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 21,
        tail_length_deviation = 3,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 13,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, 0 } },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.01,
        initial_vertical_speed = 0.018,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.20,
        speed_from_center_deviation = 0.041,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 11,
        tail_length_deviation = 7,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 6,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, 0 } },
        offset_deviation = { { -1, -0.5 }, { 1, 0.5 } },
        tile_collision_mask = nil,
        initial_height = 0.3,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.055,
        initial_vertical_speed_deviation = 0.003,
        speed_from_center = 0.09,
        speed_from_center_deviation = 0.042,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 10,
        tail_length_deviation = 12,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-big",
        offsets = { { 0, 0 } },
        offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        tile_collision_mask = nil,
        initial_height = 0.02,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.125,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.035,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 2,
        tail_length_deviation = 0,
        tail_width = 1
      }
    }
  }
}

--SMALL SPITTER
effects.small_spitter =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets =
        {
          { -0.07813, 1.211 },
          { -0.01563, 0.2422 }
        },
        offset_deviation = { { 0, -1 }, { 0, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.9,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.029,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.02,
        speed_from_center_deviation = 0.015,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 12,
        tail_length_deviation = 25,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets =
        {
          { 0.03906, -0.02344 }
        },
        offset_deviation = { { -1, -0.6992 }, { 1, 0.6992 } },
        tile_collision_mask = nil,
        initial_height = 0.4,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.04,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 3,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets =
        {
          { -0.0625, -0.3828 }
        },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.075,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 13,
        tail_length_deviation = 3,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 13,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, 0 } },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = -0,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.009,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.041,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 11,
        tail_length_deviation = 0,
        tail_width = 1
      }
    }
  }
}
--MEDIUM-SPITTER
effects.medium_spitter =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets =
        {
          { -0.07813, 1.211 },
          { -0.01563, 0.2422 }
        },
        offset_deviation = { { 0, -1 }, { 0, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.9,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.029,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.02,
        speed_from_center_deviation = 0.015,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 12,
        tail_length_deviation = 25,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets =
        {
          { 0.03906, -0.02344 }
        },
        offset_deviation = { { -1, -0.6992 }, { 1, 0.6992 } },
        tile_collision_mask = nil,
        initial_height = 0.4,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.04,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 3,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, -0.03906 } },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.075,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 13,
        tail_length_deviation = 3,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 13,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, 0 } },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = -0,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.009,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.041,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 11,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 6,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, 0 } },
        offset_deviation = { { -1, -0.5 }, { 1, 0.5 } },
        tile_collision_mask = nil,
        initial_height = 0.3,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.043,
        initial_vertical_speed_deviation = 0.003,
        speed_from_center = 0.06,
        speed_from_center_deviation = 0.042,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 10,
        tail_length_deviation = 12,
        tail_width = 1
      }
    }
  }
}
--BIG-SPITTER
effects.big_spitter =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets =
        {
          { 0.0625, 0.7891 },
          { -0.01563, 0.2422 }
        },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.9,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.029,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.015,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 12,
        tail_length_deviation = 25,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets =
        {
          { 0.03906, -0.02344 }
        },
        offset_deviation = { { -1, -0.6992 }, { 1, 0.6992 } },
        tile_collision_mask = nil,
        initial_height = 0.4,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.04,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 3,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 9,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, -0.03906 } },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.075,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 21,
        tail_length_deviation = 3,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 13,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, 0 } },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.01,
        initial_vertical_speed = 0.009,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.13,
        speed_from_center_deviation = 0.041,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 11,
        tail_length_deviation = 7,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 6,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, 0 } },
        offset_deviation = { { -1, -0.5 }, { 1, 0.5 } },
        tile_collision_mask = nil,
        initial_height = 0.3,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.043,
        initial_vertical_speed_deviation = 0.003,
        speed_from_center = 0.06,
        speed_from_center_deviation = 0.042,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 10,
        tail_length_deviation = 12,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-big",
        offsets = { { 0, 0 } },
        offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        tile_collision_mask = nil,
        initial_height = 0.02,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.125,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 2,
        tail_length_deviation = 0,
        tail_width = 1
      }
    }
  }
}

effects.behemoth_spitter =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets =
        {
          { 0.0625, 0.7891 },
          { -0.01563, 0.2422 }
        },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.9,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.040,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.035,
        speed_from_center_deviation = 0.015,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 12,
        tail_length_deviation = 25,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 5,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets =
        {
          { 0.03906, -0.02344 }
        },
        offset_deviation = { { -1, -0.6992 }, { 1, 0.6992 } },
        tile_collision_mask = nil,
        initial_height = 0.4,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.07,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.07,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 3,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 9,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, -0.03906 } },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.090,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 21,
        tail_length_deviation = 3,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 13,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, 0 } },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.01,
        initial_vertical_speed = 0.018,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.20,
        speed_from_center_deviation = 0.041,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 11,
        tail_length_deviation = 7,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 6,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = { { 0, 0 } },
        offset_deviation = { { -1, -0.5 }, { 1, 0.5 } },
        tile_collision_mask = nil,
        initial_height = 0.3,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.055,
        initial_vertical_speed_deviation = 0.003,
        speed_from_center = 0.09,
        speed_from_center_deviation = 0.042,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 10,
        tail_length_deviation = 12,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-big",
        offsets = { { 0, 0 } },
        offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        tile_collision_mask = nil,
        initial_height = 0.02,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.125,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.035,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 2,
        tail_length_deviation = 0,
        tail_width = 1
      }
    }
  }
}

----SMALL WORM DEATH
effects.small_worm =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets =
        {
          { -0.125, -1.289 },
          { -0.1406, -1.195 }
        },
        offset_deviation = { { -0.1992, -1 }, { 0.1992, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.7,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.029,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.06,
        speed_from_center_deviation = 0.037,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 30,
        tail_length_deviation = 16,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 36,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-lower-layer",
        offsets =
        {
          { -0.0625, -0.3828 }
        },
        offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        tile_collision_mask = nil,
        initial_height = 0.2,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.071,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0.052,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 25,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 6,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets = { { 0, 0 } },
        offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        tile_collision_mask = nil,
        initial_height = 1,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.019,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 3,
        tail_length_deviation = 0,
        tail_width = 1
      }
    }
  }
}

----MEDIUM WORM DEATH
effects.medium_worm =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets =
        {
          { 0.07813, 0.1094 },
          { 0, -0.5703 }
        },
        offset_deviation = { { -0.1992, -1 }, { 0.1992, 1 } },
        tile_collision_mask = nil,
        initial_height = 1.4,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.067,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.06,
        speed_from_center_deviation = 0.037,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 30,
        tail_length_deviation = 100,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 6,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets =
        {
          { -0.09375, -1.063 }
        },
        offset_deviation = { { -0.7969, -1 }, { 0.7969, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.4,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.06,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 3,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 36,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-lower-layer",
        offsets =
        {
          { -0.0625, -0.3828 }
        },
        offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        tile_collision_mask = nil,
        initial_height = 0.2,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.071,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.02,
        speed_from_center_deviation = 0.052,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 25,
        tail_length_deviation = 0,
        tail_width = 1
      }
    }
  }
}

----BIG WORM DEATH
effects.big_worm =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets =
        {
          { -0.07813, -0.6953 },
          { -0.125, -1.289 }
        },
        offset_deviation = { { -0.1992, -1 }, { 0.1992, 1 } },
        tile_collision_mask = nil,
        initial_height = 1.8,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.067,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.06,
        speed_from_center_deviation = 0.037,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 30,
        tail_length_deviation = 100,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-big",
        offsets =
        {
          { -0.09375, -1.063 }
        },
        offset_deviation = { { -0.7969, -1 }, { 0.7969, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.4,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.06,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 3,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 36,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-lower-layer",
        offsets =
        {
          { -0.0625, -0.3828 }
        },
        offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        tile_collision_mask = nil,
        initial_height = 0.2,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.071,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0.052,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 25,
        tail_length_deviation = 0,
        tail_width = 1
      }
    }
  }
}

----BEHEMOTH WORM DEATH
effects.behemoth_worm =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "create-particle",
        repeat_count = 6,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets =
        {
          { -0.07813, -0.6953 },
          { -0.125, -1.289 }
        },
        offset_deviation = { { -0.1992, -1 }, { 0.1992, 1 } },
        tile_collision_mask = nil,
        initial_height = 2.3,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.067,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.06,
        speed_from_center_deviation = 0.037,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 30,
        tail_length_deviation = 100,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 5,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-big",
        offsets =
        {
          { -0.09375, -1.063 }
        },
        offset_deviation = { { -0.7969, -1 }, { 0.7969, 1 } },
        tile_collision_mask = nil,
        initial_height = 0.4,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.06,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 3,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 36,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-lower-layer",
        offsets =
        {
          { -0.0625, -0.3828 }
        },
        offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        tile_collision_mask = nil,
        initial_height = 0.2,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.090,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0.052,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 25,
        tail_length_deviation = 0,
        tail_width = 1
      }
    }
  }
}

effects.spawner_biter =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "create-particle",
        repeat_count = 12,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-carpet",
        offsets = { { 0, 0 } },
        offset_deviation =
        {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
        tile_collision_mask = nil,
        initial_height = 0.2,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.062,
        initial_vertical_speed_deviation = 0.01,
        speed_from_center = 0.08,
        speed_from_center_deviation = 0.011,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 25,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 10,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-carpet",
        offsets =
        {
          { 0.0625, 0.7891 },
          { -0.01563, 0.2422 }
        },
        offset_deviation =
        {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
        tile_collision_mask = nil,
        initial_height = 0.9,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.04,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.035,
        speed_from_center_deviation = 0.015,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 12,
        tail_length_deviation = 25,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 8,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets = { { 0, 0 } },
        offset_deviation =
        {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
        tile_collision_mask = nil,
        initial_height = 1,
        initial_height_deviation = 0.52,
        initial_vertical_speed = 0.078,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.07,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0
      },
      {
        type = "create-particle",
        repeat_count = 11,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-carpet",
        offsets = { { 0, -0.03906 } },
        offset_deviation =
        {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.09,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 21,
        tail_length_deviation = 3,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 15,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-carpet",
        offsets = { { 0, 0 } },
        offset_deviation =
        {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.01,
        initial_vertical_speed = 0.018,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.2,
        speed_from_center_deviation = 0.041,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 11,
        tail_length_deviation = 7,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 15,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-carpet",
        offsets = { { 0, 0 } },
        offset_deviation =
        {
          left_top = { -1, -0.5 },
          right_bottom = { 1, 0.5 }
        },
        tile_collision_mask = nil,
        initial_height = 0.3,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.055,
        initial_vertical_speed_deviation = 0.003,
        speed_from_center = 0.09,
        speed_from_center_deviation = 0.042,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 10,
        tail_length_deviation = 12,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-big",
        offsets = { { 0, 0 } },
        offset_deviation =
        {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
        tile_collision_mask = nil,
        initial_height = 1,
        initial_height_deviation = 0.52,
        initial_vertical_speed = 0.078,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.07,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0
      },
    }
  }
}

effects.spawner_spitter =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "create-particle",
        repeat_count = 12,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-carpet",
        offsets = { { 0, 0 } },
        offset_deviation =
        {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
        tile_collision_mask = nil,
        initial_height = 0.2,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.062,
        initial_vertical_speed_deviation = 0.01,
        speed_from_center = 0.08,
        speed_from_center_deviation = 0.011,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 25,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 10,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-carpet",
        offsets =
        {
          { 0.0625, 0.7891 },
          { -0.01563, 0.2422 }
        },
        offset_deviation =
        {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
        tile_collision_mask = nil,
        initial_height = 0.9,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.04,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.035,
        speed_from_center_deviation = 0.015,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 12,
        tail_length_deviation = 25,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 8,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets = { { 0, 0 } },
        offset_deviation =
        {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
        tile_collision_mask = nil,
        initial_height = 1,
        initial_height_deviation = 0.52,
        initial_vertical_speed = 0.078,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.07,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0
      },
      {
        type = "create-particle",
        repeat_count = 11,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-carpet",
        offsets = { { 0, -0.03906 } },
        offset_deviation =
        {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.09,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 21,
        tail_length_deviation = 3,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 15,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-carpet",
        offsets = { { 0, 0 } },
        offset_deviation =
        {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.01,
        initial_vertical_speed = 0.018,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.2,
        speed_from_center_deviation = 0.041,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 11,
        tail_length_deviation = 7,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 15,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-carpet",
        offsets = { { 0, 0 } },
        offset_deviation =
        {
          left_top = { -1, -0.5 },
          right_bottom = { 1, 0.5 }
        },
        tile_collision_mask = nil,
        initial_height = 0.3,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.055,
        initial_vertical_speed_deviation = 0.003,
        speed_from_center = 0.09,
        speed_from_center_deviation = 0.042,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 10,
        tail_length_deviation = 12,
        tail_width = 1
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-big",
        offsets = { { 0, 0 } },
        offset_deviation =
        {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
        tile_collision_mask = nil,
        initial_height = 1,
        initial_height_deviation = 0.52,
        initial_vertical_speed = 0.078,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.07,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0
      },
    }
  }
}

return effects

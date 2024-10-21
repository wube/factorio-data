local sounds = require("prototypes.entity.sounds")
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
        particle_name = "blood-particle-small",
        offsets =
        {
          { 0, 0.5 },
          { 0, 0.6 }
        },
        offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5} },
        initial_height = 0.9,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.03,
        initial_vertical_speed_deviation = 0.03,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.03,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 12,
        tail_length_deviation = 25,
        tail_width = 3
      },
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets =
        {
          { 0, 0 }
        },
        offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        initial_height = 0.4,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.05,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 3,
        tail_length_deviation = 0,
        tail_width = 3
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-small",
        offsets =
        {
          { 0, -0.4 }
        },
        offset_deviation = { { 0.5, -0.5 }, { 0.5, 0.5 } },
        initial_height = 0.1,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.075,
        initial_vertical_speed_deviation = 0.075,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.03,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 13,
        tail_length_deviation = 3,
        tail_width = 3
      },
      {
        type = "create-particle",
        repeat_count = 13,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-small",
        offsets = { { 0, 0 } },
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        initial_height = 0,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.009,
        initial_vertical_speed_deviation = 0.009,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 5,
        tail_length_deviation = 5,
        tail_width = 3
      },
      {
        type = "play-sound",
        sound = sounds.small_gore
      },
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
          { -0.1, -1.2},
          { 0, -0.24 }
        },
        offset_deviation = { { -0.5, -0.5 }, { -0.5, 0.5 } },
        initial_height = 0.9,
        initial_height_deviation = 0.9,
        initial_vertical_speed = 0.03,
        initial_vertical_speed_deviation = 0.03,
        speed_from_center = 0.02,
        speed_from_center_deviation = 0.02,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 12,
        tail_length_deviation = 25,
        tail_width = 3
      },
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets =
        {
          { 0, 0 }
        },
        offset_deviation = { { -0.7, -0.7 }, { 0.7, 0.7 } },
        initial_height = 0.4,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.05,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 3,
        tail_length_deviation = 0,
        tail_width = 3
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-small",
        offsets = { { 0, 0 } },
        offset_deviation = { { -0.7, -0.7 }, { 0.7, 0.7 } },
        initial_height = 0.1,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.075,
        initial_vertical_speed_deviation = 0.075,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.03,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 13,
        tail_length_deviation = 3,
        tail_width = 3
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
        offset_deviation = { { -0.7, -0.7 }, { 0.7, 0.7 } },
        initial_height = 0,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.01,
        initial_vertical_speed_deviation = 0.01,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 11,
        tail_length_deviation = 0,
        tail_width = 3
      },
      {
        type = "create-particle",
        repeat_count = 6,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-small",
        offsets = { { 0, 0 } },
        offset_deviation = { { -0.7, -0.7 }, { 0.7, 0.7 } },
        initial_height = 0.3,
        initial_height_deviation = 0.3,
        initial_vertical_speed = 0.04,
        initial_vertical_speed_deviation = 0.04,
        speed_from_center = 0.06,
        speed_from_center_deviation = 0.06,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 5,
        tail_length_deviation = 5,
        tail_width = 3
      },
      {
        type = "play-sound",
        sound = sounds.medium_gore
      },
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
        repeat_count = 5,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = {
          { 0, -0.8 },
          { 0, -0.25 }
        },
        offset_deviation = {
          left_top = { -0.7969, -0.7969 },
          right_bottom = { 0.7969, 0.7969 }
        },
        initial_height = 0.9,
        initial_height_deviation = 0.9,
        initial_vertical_speed = 0.03,
        initial_vertical_speed_deviation = 0.03,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.03,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 12,
        tail_length_deviation = 25,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 5,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.7969, -0.7969 },
          right_bottom = { 0.7969, 0.7969 }
        },
        initial_height = 0.1,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.075,
        initial_vertical_speed_deviation = 0.075,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.03,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 21,
        tail_length_deviation = 3,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-big",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.7969, -0.7969 },
          right_bottom = { 0.7969, 0.7969 }
        },
        initial_height = 0.5,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.1,
        initial_vertical_speed_deviation = 0.1,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.03,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 2,
        tail_length_deviation = 0,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.7969, -0.7969 },
          right_bottom = { 0.7969, 0.7969 }
        },
        initial_height = 0.4,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.05,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 1,
        tail_length = 3,
        tail_length_deviation = 0,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 10,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "internal-fluids-particle",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.2969, -0.1992 },
          right_bottom = { 0.2969, 0.1992 }
        },
        initial_height = 0.1,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.05,
        initial_vertical_speed_deviation = 0.02,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 5,
        tail_length_deviation = 5,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "play-sound",
        sound = sounds.big_gore
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
        offsets = {
          { 0, -0.8 },
          { 0, -0.25 }
        },
        offset_deviation = {
          left_top = { -0.7969, -0.7969 },
          right_bottom = { 0.7969, 0.7969 }
        },
        initial_height = 0.5,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.04,
        initial_vertical_speed_deviation = 0.04,
        speed_from_center = 0.035,
        speed_from_center_deviation = 0.035,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 12,
        tail_length_deviation = 25,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 5,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.7969, -0.7969 },
          right_bottom = { 0.7969, 0.7969 }
        },
        initial_height = 0.1,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.09,
        initial_vertical_speed_deviation = 0.09,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0.04,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 21,
        tail_length_deviation = 3,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 5,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.7969, -0.7969 },
          right_bottom = { 0.7969, 0.7969 }
        },
        initial_height = 0.1,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.02,
        initial_vertical_speed_deviation = 0.02,
        speed_from_center = 0.2,
        speed_from_center_deviation = 0.2,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 11,
        tail_length_deviation = 7,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-big",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.7969, -0.7969 },
          right_bottom = { 0.7969, 0.7969 }
        },
        initial_height = 0.5,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.1,
        initial_vertical_speed_deviation = 0.1,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0.04,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 2,
        tail_length_deviation = 0,
        tail_width = 3
      },
      {
        type = "create-particle",
        repeat_count = 10,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "internal-fluids-particle",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.7969, -0.7969 },
          right_bottom = { 0.7969, 0.7969 }
        },
        initial_height = 0.1,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.055,
        initial_vertical_speed_deviation = 0.055,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 8,
        tail_length_deviation = 7,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "play-sound",
        sound = sounds.behemoth_gore
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
        particle_name = "blood-particle-small",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.1992, -0.1992 },
          right_bottom = { 0.1992, 0.1992 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-small",
        offsets = {
          { -0.0625, -0.3828 }
        },
        offset_deviation = {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 13,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-carpet-small",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 3,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "acid-particle",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
        initial_height = 0.2,
        initial_height_deviation = 0.11,
        initial_vertical_speed = 0.058,
        initial_vertical_speed_deviation = 0.047,
        speed_from_center = 0.035,
        speed_from_center_deviation = 0.01,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 5,
        tail_length_deviation = 0,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets = {
          { 0.03906, -0.02344 }
        },
        offset_deviation = {
          left_top = { -1, -0.6953 },
          right_bottom = { 1, 0.6953 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "play-sound",
        sound = sounds.small_gore
      },
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
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 11,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-small",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-carpet",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 3,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "acid-particle",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
        initial_height = 0.3,
        initial_height_deviation = 0.43,
        initial_vertical_speed = 0.074,
        initial_vertical_speed_deviation = 0.049,
        speed_from_center = 0.02,
        speed_from_center_deviation = 0.027,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 9,
        tail_length_deviation = 0,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "play-sound",
        sound = sounds.medium_gore
      },
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
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 6,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 6,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -1, -0.5 },
          right_bottom = { 1, 0.5 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets = {
          { 0.03906, -0.02344 }
        },
        offset_deviation = {
          left_top = { -1, -0.6953 },
          right_bottom = { 1, 0.6953 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-big",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 3,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "acid-particle",
        offsets = {
          { 0, -0.03906 }
        },
        offset_deviation = {
          left_top = { -0.5, -0.2969 },
          right_bottom = { 0.5, 0.2969 }
        },
        initial_height = 0.1,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.075,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 16,
        tail_length_deviation = 9,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "play-sound",
        sound = sounds.big_gore
      },
    }
  }
}
--BEHEMOTH-SPITTER
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
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 7,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
        initial_height = 0.1,
        initial_height_deviation = 0.01,
        initial_vertical_speed = 0.018,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.14,
        speed_from_center_deviation = 0.057,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 11,
        tail_length_deviation = 7,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 5,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -1, -0.5 },
          right_bottom = { 1, 0.5 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets = {
          { 0.03906, -0.02344 }
        },
        offset_deviation = {
          left_top = { -1, -0.6953 },
          right_bottom = { 1, 0.6953 }
        },
        initial_height = 0.4,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.07,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.07,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 3,
        tail_length_deviation = 1,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-big",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
        initial_height = 0.02,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.125,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.035,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 2,
        tail_length_deviation = 1,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 3,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "acid-particle",
        offsets = {
          { 0.01563, -0.125 }
        },
        offset_deviation = {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
        initial_height = 0.1,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.099,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 30,
        tail_length_deviation = 5,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "play-sound",
        sound = sounds.behemoth_gore
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
        particle_name = "blood-particle-small",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.1953, -1 },
          right_bottom = { 0.1953, 1 }
        },
        initial_height = 1.5,
        initial_height_deviation = 0.2,
        initial_vertical_speed = 0.029,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.06,
        speed_from_center_deviation = 0.037,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 30,
        tail_length_deviation = 16,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 20,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-lower-layer-small",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
        initial_height = 0.4,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.051,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0.052,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 10,
        tail_length_deviation = 0,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 6,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "acid-particle",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.3945, -0.3945 },
          right_bottom = { 0.3945, 0.3945 }
        },
        initial_height = 2,
        initial_height_deviation = 0.11,
        initial_vertical_speed = 0.087,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.02,
        speed_from_center_deviation = 0.038,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 8,
        tail_length_deviation = 4,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "play-sound",
        sound = sounds.small_gore_worm
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
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.1953, -1 },
          right_bottom = { 0.1953, 1 }
        },
        initial_height = 2.6,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.067,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.06,
        speed_from_center_deviation = 0.037,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 34,
        tail_length_deviation = 23,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 17,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-lower-layer-small",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
        initial_height = 1.5,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.071,
        initial_vertical_speed_deviation = 0.04,
        speed_from_center = 0.02,
        speed_from_center_deviation = 0.052,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 25,
        tail_length_deviation = 0,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 2,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.7969, -1 },
          right_bottom = { 0.7969, 1 }
        },
        initial_height = 1.6,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.06,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 3,
        tail_length_deviation = 0,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 1,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-big",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.7969, -1 },
          right_bottom = { 0.7969, 1 }
        },
        initial_height = 1.6,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.06,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 1,
        tail_length_deviation = 1,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 3,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "acid-particle",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.3906, -0.3906 },
          right_bottom = { 0.3906, 0.3906 }
        },
        initial_height = 2.3,
        initial_height_deviation = 0.11,
        initial_vertical_speed = 0.093,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0.038,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 13,
        tail_length_deviation = 7,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "play-sound",
        sound = sounds.medium_gore_worm
      },
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
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.1953, -1 },
          right_bottom = { 0.1953, 1 }
        },
        initial_height = 2.8,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.067,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.06,
        speed_from_center_deviation = 0.037,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 31,
        tail_length_deviation = 100,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 15,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-lower-layer",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
        initial_height = 2.3,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.071,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0.052,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 25,
        tail_length_deviation = 0,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-big",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.7969, -1 },
          right_bottom = { 0.7969, 1 }
        },
        initial_height = 2.4,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.06,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 3,
        tail_length_deviation = 2,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 3,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "acid-particle",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.3906, -0.3906 },
          right_bottom = { 0.3906, 0.3906 }
        },
        initial_height = 2.5,
        initial_height_deviation = 0.11,
        initial_vertical_speed = 0.093,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0.038,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 19,
        tail_length_deviation = 7,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "play-sound",
        sound = sounds.big_gore_worm
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
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.1953, -1 },
          right_bottom = { 0.1953, 1 }
        },
        initial_height = 3.1,
        initial_height_deviation = 0,
        initial_vertical_speed = 0.067,
        initial_vertical_speed_deviation = 0.07,
        speed_from_center = 0.06,
        speed_from_center_deviation = 0.037,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 30,
        tail_length_deviation = 100,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 19,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-lower-layer",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
        initial_height = 2.3,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.09,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0.052,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 29,
        tail_length_deviation = 0,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 6,
        repeat_count_deviation = 3,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-big",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.7969, -1 },
          right_bottom = { 0.7969, 1 }
        },
        initial_height = 2.3,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.06,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 2,
        tail_length_deviation = 2,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 1,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-spawner",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.7969, -1 },
          right_bottom = { 0.7969, 1 }
        },
        initial_height = 2.7,
        initial_height_deviation = 0.4,
        initial_vertical_speed = 0.06,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.11,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.955,
        tail_length = 1,
        tail_length_deviation = 1,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "acid-particle",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -0.3906, -0.3906 },
          right_bottom = { 0.3906, 0.3906 }
        },
        initial_height = 2.6,
        initial_height_deviation = 0.11,
        initial_vertical_speed = 0.093,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.04,
        speed_from_center_deviation = 0.038,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 30,
        tail_length_deviation = 7,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "play-sound",
        sound = sounds.behemoth_gore_worm
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
        repeat_count = 7,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle",
        offsets = {
          { 0.02344, -0.6016 }
        },
        offset_deviation = {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
        initial_height = 0.2,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.062,
        initial_vertical_speed_deviation = 0.01,
        speed_from_center = 0.1,
        speed_from_center_deviation = 0.047,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 25,
        tail_length_deviation = 0,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 11,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-carpet",
        offsets = {
          { 0, -0.3594 }
        },
        offset_deviation = {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
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
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 13,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "blood-particle-carpet",
        offsets = {
          { 0, 0 }
        },
        offset_deviation = {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
        initial_height = 0.1,
        initial_height_deviation = 0.01,
        initial_vertical_speed = 0.018,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.19,
        speed_from_center_deviation = 0.041,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 11,
        tail_length_deviation = 7,
        tail_width = 1,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 20,
        repeat_count_deviation = 5,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "internal-fluids-particle",
        offsets = {
          { 0.0, -0.3125 }
        },
        offset_deviation = {
          left_top = { -1, -1 },
          right_bottom = { 1, 1 }
        },
        initial_height = 0.3,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.055,
        initial_vertical_speed_deviation = 0.003,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.042,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 10,
        tail_length_deviation = 12,
        tail_width = 1,
        rotate_offsets = false
      },

      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-small-medium",
        offsets = {
          { 0.0, -0.3281 }
        },
        offset_deviation = {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
        initial_height = 1,
        initial_height_deviation = 0.52,
        initial_vertical_speed = 0.078,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.07,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0,
        rotate_offsets = false
      },
      {
        type = "create-particle",
        repeat_count = 4,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "guts-entrails-particle-big",
        offsets = {
          { -0.01563, -0.3438 }
        },
        offset_deviation = {
          left_top = { -0.5, -0.5 },
          right_bottom = { 0.5, 0.5 }
        },
        initial_height = 1,
        initial_height_deviation = 0.52,
        initial_vertical_speed = 0.078,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.07,
        speed_from_center_deviation = 0,
        frame_speed = 1,
        frame_speed_deviation = 0,
        rotate_offsets = false
      },
      {
        type = "play-sound",
        sound = sounds.spawner_gore
      }
    }
  }
}

effects.spawner_spitter = effects.spawner_biter


return effects

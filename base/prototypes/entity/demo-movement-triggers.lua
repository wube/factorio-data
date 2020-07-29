local movement_triggers = {}

movement_triggers.tank =
{
  {
    tiles = { "water-shallow" },

    type = "create-particle",
    repeat_count = 5,
    particle_name = "shallow-water-vehicle-particle",
    initial_height = 0.2,
    speed_from_center = 0.01,
    speed_from_center_deviation = 0.05,
    initial_vertical_speed = 0.02,
    offsets =
    {
      {0.75, 1},
      {-0.75,1},
      {0.75, -1},
      {-0.75,-1}
    },
    offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
    rotate_offsets = true
  },
  {
    tiles = { "water-mud" },

    type = "create-particle",
    repeat_count = 5,
    particle_name = "shallow-water-2-vehicle-particle",
    initial_height = 0.2,
    speed_from_center = 0.01,
    speed_from_center_deviation = 0.05,
    initial_vertical_speed = 0.02,
    offsets =
    {
      {0.75, 1},
      {-0.75,1},
      {0.75, -1},
      {-0.75,-1}
    },
    offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
    rotate_offsets = true
  },
  {
    tiles = { "sand-1" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "sand-1-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.2,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "sand-1-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, -1},
          {-0.7,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "sand-1-stone-vehicle-particle-tiny",
        probability = 0.03,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "sand-1-stone-vehicle-particle-small",
        probability = 0.03,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "sand-2" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "sand-2-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "sand-2-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, -1},
          {-0.7,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "sand-2-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 1,
        particle_name = "sand-2-stone-vehicle-particle-small",
        probability = 0.03,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "sand-3" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "sand-3-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "sand-3-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, -1},
          {-0.7,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "sand-3-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 1,
        particle_name = "sand-3-stone-vehicle-particle-small",
        probability = 0.03,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "grass-1" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "grass-1-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "grass-1-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "vegetation-vehicle-particle-small-medium",
        probability = 0.07,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "brown-dust-vehicle-particle",
        probability = 0.1,
        initial_height = 0.2,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "grass-2" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "grass-2-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "grass-2-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "vegetation-vehicle-particle-small-medium",
        probability = 0.07,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "brown-dust-vehicle-particle",
        probability = 0.1,
        initial_height = 0.2,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "grass-3" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "grass-3-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "grass-3-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.8,-0.5},
          {-0.8,-1},
          {0.8, -1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "grass-3-vegetation-vehicle-particle-small-medium",
        probability = 0.07,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "brown-dust-vehicle-particle",
        probability = 0.1,
        initial_height = 0.2,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "grass-4" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "grass-4-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "grass-4-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "vegetation-vehicle-particle-small-medium",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "brown-dust-vehicle-particle",
        probability = 0.1,
        initial_height = 0.2,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "red-desert-0" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "red-desert-0-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "red-desert-0-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, -1},
          {-0.7,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "red-desert-0-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "red-desert-0-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "vegetation-vehicle-particle-small-medium",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "red-desert-1" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "red-desert-1-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "red-desert-1-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, -1},
          {-0.7,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "red-desert-1-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "red-desert-1-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "red-desert-2" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "red-desert-2-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "red-desert-2-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets = {{0.7, -1},
                  {-0.7,-1}},
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "red-desert-2-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "red-desert-2-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "red-desert-3" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "red-desert-3-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "red-desert-3-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, -1},
          {-0.7,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "red-desert-3-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "red-desert-3-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dirt-1" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "dirt-1-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "dirt-1-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, -1},
          {-0.7,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "dirt-1-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "dirt-1-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dirt-2" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "dirt-2-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "dirt-2-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets = {{0.7, -1},
                  {-0.7,-1}},
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "dirt-2-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "dirt-2-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dirt-3" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "dirt-3-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "dirt-3-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, -1},
          {-0.7,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "dirt-3-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "dirt-3-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dirt-4" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "dirt-4-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "dirt-4-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, -1},
          {-0.7,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "dirt-4-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "dirt-4-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.8,-0.5},
          {-0.8,-0.5},
          {0.8, -1},
          {-0.8,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dirt-5" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "dirt-5-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "dirt-5-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, -1},
          {-0.7,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "dirt-5-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.9,-0.5},
          {0.9, -1},
          {-0.9,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "dirt-5-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.9,-0.5},
          {0.9, -1},
          {-0.9,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dirt-6" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "dirt-6-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "dirt-6-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, -1},
          {-0.7,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "dirt-6-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.9,-0.5},
          {0.9, -1},
          {-0.9,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "dirt-6-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.9,-0.5},
          {0.9, -1},
          {-0.9,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dirt-7" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "dirt-7-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "dirt-7-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, -1},
          {-0.7,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "dirt-7-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.9,-0.5},
          {0.9, -1},
          {-0.9,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "dirt-7-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.9,-0.5},
          {0.9, -1},
          {-0.9,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dry-dirt" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "dry-dirt-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "dry-dirt-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, -1},
          {-0.7,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "dry-dirt-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.9,-0.5},
          {0.9, -1},
          {-0.9,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "dry-dirt-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.9,-0.5},
          {0.9, -1},
          {-0.9,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "landfill" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "landfill-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "landfill-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, -1},
          {-0.7,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "landfill-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.9,-0.5},
          {0.9, -1},
          {-0.9,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "landfill-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.9,-0.5},
          {0.9, -1},
          {-0.9,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "nuclear-ground" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "nuclear-ground-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, 1},
          {-0.7,1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "nuclear-ground-dust-tank-front-particle",
        probability = 0.3,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.7, -1},
          {-0.7,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "nuclear-ground-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.9,-0.5},
          {0.9, -1},
          {-0.9,-1}
        },
        offset_deviation = {{-0.2, -0.25}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "nuclear-ground-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.9,-0.5},
          {-0.9,-0.5},
          {0.9, -1},
          {-0.9,-1}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
}

movement_triggers.car =
{
  {
    tiles = { "water-shallow" },

    type = "create-particle",
    repeat_count = 5,
    particle_name = "shallow-water-vehicle-particle",
    initial_height = 0.2,
    speed_from_center = 0.01,
    speed_from_center_deviation = 0.05,
    initial_vertical_speed = 0.02,
    offsets =
    {
      {0.75, 1},
      {-0.75,1},
      {0.55, -0.8},
      {-0.55,-0.8}
    },
    offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
    rotate_offsets = true
  },
  {
    tiles = { "water-mud" },

    type = "create-particle",
    repeat_count = 5,
    particle_name = "shallow-water-2-vehicle-particle",
    initial_height = 0.2,
    speed_from_center = 0.01,
    speed_from_center_deviation = 0.05,
    initial_vertical_speed = 0.02,
    offsets =
    {
      {0.75, 1},
      {-0.75,1},
      {0.55, -0.8},
      {-0.55,-0.8}
    },
    offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
    rotate_offsets = true
  },
  {
    tiles = { "sand-1" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "sand-1-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.2,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.8},
          {-0.55,-0.8}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "sand-1-stone-vehicle-particle-tiny",
        probability = 0.01,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "sand-1-stone-vehicle-particle-small",
        probability = 0.01,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "sand-2" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "sand-1-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.2,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.8},
          {-0.55,-0.8}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "sand-2-stone-vehicle-particle-tiny",
        probability = 0.01,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "sand-2-stone-vehicle-particle-small",
        probability = 0.01,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "sand-3" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "sand-3-dust-vehicle-particle",
        probability = 0.3,
        initial_height = 0.2,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.8},
          {-0.55,-0.8}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "sand-3-stone-vehicle-particle-tiny",
        probability = 0.01,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "sand-3-stone-vehicle-particle-small",
        probability = 0.01,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "grass-1" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "grass-1-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "grass-1-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "vegetation-vehicle-particle-small-medium",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "brown-dust-vehicle-particle",
        probability = 0.1,
        initial_height = 0.2,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.8},
          {-0.55,-0.8}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "grass-2" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "grass-2-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "grass-2-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "vegetation-vehicle-particle-small-medium",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "brown-dust-vehicle-particle",
        probability = 0.1,
        initial_height = 0.2,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.8},
          {-0.55,-0.8}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "grass-3" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "grass-3-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "grass-3-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "grass-3-vegetation-vehicle-particle-small-medium",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "brown-dust-vehicle-particle",
        probability = 0.1,
        initial_height = 0.2,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.8},
          {-0.55,-0.8}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "grass-4" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 8,
        particle_name = "grass-4-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "grass-4-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "vegetation-vehicle-particle-small-medium",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "brown-dust-vehicle-particle",
        probability = 0.1,
        initial_height = 0.2,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.8},
          {-0.55,-0.8}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "red-desert-0" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "red-desert-0-dust-vehicle-particle",
        probability = 0.5,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.65, -0.45},
          {-0.65,-0.45}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "red-desert-0-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "red-desert-0-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "vegetation-vehicle-particle-small-medium",
        probability = 0.08,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "red-desert-1" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "red-desert-1-dust-vehicle-particle",
        probability = 0.5,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "red-desert-1-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "red-desert-1-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "red-desert-2" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "red-desert-2-dust-vehicle-particle",
        probability = 0.5,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "red-desert-2-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "red-desert-2-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "red-desert-3" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "red-desert-3-dust-vehicle-particle",
        probability = 0.5,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "red-desert-3-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "red-desert-3-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dirt-1" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "dirt-1-dust-vehicle-particle",
        probability = 0.5,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "dirt-1-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "dirt-1-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dirt-2" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "dirt-2-dust-vehicle-particle",
        probability = 0.5,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "dirt-2-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "dirt-2-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dirt-3" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "dirt-3-dust-vehicle-particle",
        probability = 0.5,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "dirt-3-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "dirt-3-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dirt-4" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "dirt-4-dust-vehicle-particle",
        probability = 0.5,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "dirt-4-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "dirt-4-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dirt-5" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "dirt-5-dust-vehicle-particle",
        probability = 0.5,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "dirt-5-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "dirt-5-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}},
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dirt-6" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "dirt-6-dust-vehicle-particle",
        probability = 0.5,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "dirt-6-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "dirt-6-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dirt-7" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "dirt-7-dust-vehicle-particle",
        probability = 0.5,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "dirt-7-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "dirt-7-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dry-dirt" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "dry-dirt-dust-vehicle-particle",
        probability = 0.5,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "dry-dirt-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "dry-dirt-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "landfill" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "landfill-dust-vehicle-particle",
        probability = 0.5,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "landfill-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "landfill-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "nuclear-ground" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "nuclear-ground-dust-vehicle-particle",
        probability = 0.5,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "nuclear-ground-stone-vehicle-particle-tiny",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 3,
        particle_name = "nuclear-ground-stone-vehicle-particle-small",
        probability = 0.05,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offsets =
        {
          {0.75, 1},
          {-0.75,1},
          {0.55, -0.75},
          {-0.55,-0.75}
        },
        offset_deviation = {{-0.25, -0.25}, {0.25, 0.25}},
        rotate_offsets = true
      },
    }
  }
}

movement_triggers.character =
{
  {
    tiles = { "water-shallow" },

    type = "create-particle",
    repeat_count = 3,
    particle_name = "shallow-water-particle",
    initial_height = 0.2,
    speed_from_center = 0.01,
    speed_from_center_deviation = 0.05,
    initial_vertical_speed = 0.03,
    initial_vertical_speed_deviation = 0.05,
    offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
    tail_length = 3,
  },
  {
    tiles = { "water-mud" },

    type = "create-particle",
    repeat_count = 3,
    particle_name = "shallow-water-2-particle",
    initial_height = 0.2,
    speed_from_center = 0.01,
    speed_from_center_deviation = 0.05,
    initial_vertical_speed = 0.03,
    initial_vertical_speed_deviation = 0.05,
    offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
    tail_length = 3,
  },
  {
    tiles = { "grass-1", "grass-2", "grass-4" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "vegetation-character-particle-small-medium",
        probability = 1,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.01,
        frame_speed = 0.4,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "grass-1-stone-character-particle-tiny",
        probability = 1,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.01,
        frame_speed = 0.4,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "brown-dust-vehicle-particle",
        probability = 0.75,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.01,
        frame_speed = 0.4,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
    }
  },
  {
    tiles = { "grass-3" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 10,
        particle_name = "grass-3-vegetation-character-particle-small-medium",
        probability = 1,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.01,
        frame_speed = 0.4,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "grass-3-stone-character-particle-tiny",
        probability = 1,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.01,
        frame_speed = 0.4,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
        type = "create-particle",
        repeat_count = 2,
        particle_name = "brown-dust-vehicle-particle",
        probability = 1,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.01,
        frame_speed = 0.4,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
    }
  },
  {
  tiles = { "sand-1" },
  actions =
  {
    {
      type = "create-particle",
      repeat_count = 5,
      particle_name = "sand-1-dust-particle",
      probability = 1,
      initial_height = 0.2,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.02,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
      type = "create-particle",
      repeat_count = 1,
      particle_name = "sand-1-stone-character-particle-tiny",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.01,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
    }
  },
  {
    tiles = { "sand-2" },
    actions =
    {
      {
      type = "create-particle",
      repeat_count = 10,
      particle_name = "sand-2-dust-particle",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.02,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
      type = "create-particle",
      repeat_count = 1,
      particle_name = "sand-2-stone-character-particle-tiny",
      probability = 0.3,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.01,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
    }
  },
  {
    tiles = { "sand-3" },
    actions =
    {
      {
      type = "create-particle",
      repeat_count = 10,
      particle_name = "sand-3-dust-particle",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.02,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
      type = "create-particle",
      repeat_count = 3,
      particle_name = "sand-3-stone-character-particle-tiny",
      probability = 01,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.01,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
    }
  },
  {
    tiles = { "red-desert-0" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 10,
        particle_name = "red-desert-0-dust-particle",
        probability = 1,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 0.4,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 4,
        particle_name = "vegetation-character-particle-small-medium",
        probability = 1,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.01,
        frame_speed = 0.4,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "red-desert-0-stone-character-particle-tiny",
        probability = 1,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.01,
        frame_speed = 0.4,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "red-desert-1" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "red-desert-1-dust-particle",
        probability = 1,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "red-desert-1-stone-character-particle-tiny",
        probability = 1,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.01,
        frame_speed = 0.4,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "red-desert-2" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "red-desert-2-dust-particle",
        probability = 1,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "red-desert-2-stone-character-particle-tiny",
        probability = 1,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.01,
        frame_speed = 0.4,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "red-desert-3" },
    actions =
    {
      {
        type = "create-particle",
        repeat_count = 7,
        particle_name = "red-desert-3-dust-particle",
        probability = 1,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.02,
        frame_speed = 1,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
        type = "create-particle",
        repeat_count = 5,
        particle_name = "red-desert-3-stone-character-particle-tiny",
        probability = 1,
        initial_height = 0.1,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0,
        initial_vertical_speed = 0.01,
        frame_speed = 0.4,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        rotate_offsets = true
      },
    }
  },
  {
    tiles = { "dirt-1" },
    actions =
    {
      {
      type = "create-particle",
      repeat_count = 7,
      particle_name = "dirt-1-dust-particle",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.02,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
      type = "create-particle",
      repeat_count = 5,
      particle_name = "dirt-1-stone-character-particle-tiny",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.01,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
    }
  },
  {
    tiles = { "dirt-2" },
    actions =
    {
      {
      type = "create-particle",
      repeat_count = 7,
      particle_name = "dirt-2-dust-particle",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.02,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
      type = "create-particle",
      repeat_count = 5,
      particle_name = "dirt-2-stone-character-particle-tiny",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.01,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
    }
  },
  {
    tiles = { "dirt-3" },
    actions =
    {
      {
      type = "create-particle",
      repeat_count = 7,
      particle_name = "dirt-3-dust-particle",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.02,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
      type = "create-particle",
      repeat_count = 5,
      particle_name = "dirt-3-stone-character-particle-tiny",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.01,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
    }
  },
  {
    tiles = { "dirt-4" },
    actions =
    {
      {
      type = "create-particle",
      repeat_count = 7,
      particle_name = "dirt-4-dust-particle",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.02,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
      type = "create-particle",
      repeat_count = 5,
      particle_name = "dirt-4-stone-character-particle-tiny",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.01,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
    }
  },
  {
    tiles = { "dirt-5" },
    actions =
    {
      {
      type = "create-particle",
      repeat_count = 7,
      particle_name = "dirt-5-dust-particle",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.02,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
      type = "create-particle",
      repeat_count = 5,
      particle_name = "dirt-5-stone-character-particle-tiny",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.01,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
    }
  },
  {
    tiles = { "dirt-6" },
    actions =
    {
      {
      type = "create-particle",
      repeat_count = 7,
      particle_name = "dirt-6-dust-particle",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.02,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
      type = "create-particle",
      repeat_count = 5,
      particle_name = "dirt-6-stone-character-particle-tiny",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.01,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
    }
  },
  {
    tiles = { "dirt-7" },
    actions =
    {
      {
      type = "create-particle",
      repeat_count = 7,
      particle_name = "dirt-5-dust-particle",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.02,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
      type = "create-particle",
      repeat_count = 5,
      particle_name = "dirt-7-stone-character-particle-tiny",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.01,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
    }
  },
  {
    tiles = { "dry-dirt" },
    actions =
    {
      {
      type = "create-particle",
      repeat_count = 7,
      particle_name = "dry-dirt-dust-particle",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.02,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
      type = "create-particle",
      repeat_count = 5,
      particle_name = "dry-dirt-stone-character-particle-tiny",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.01,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
    }
  },
  {
    tiles = { "landfill" },
    actions =
    {
      {
      type = "create-particle",
      repeat_count = 7,
      particle_name = "landfill-dust-particle",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.02,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
      type = "create-particle",
      repeat_count = 5,
      particle_name = "landfill-stone-character-particle-tiny",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.01,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
    }
  },
  {
    tiles = { "nuclear-ground" },
    actions =
    {
      {
      type = "create-particle",
      repeat_count = 7,
      particle_name = "nuclear-ground-dust-particle",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.02,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
      {
      type = "create-particle",
      repeat_count = 5,
      particle_name = "nuclear-ground-stone-character-particle-tiny",
      probability = 1,
      initial_height = 0.1,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      initial_vertical_speed = 0.01,
      frame_speed = 0.4,
      initial_vertical_speed_deviation = 0.05,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      },
    }
  },
}

return movement_triggers
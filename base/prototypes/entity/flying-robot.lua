local hit_effects = require ("prototypes.entity.demo-hit-effects")
local sounds = require("prototypes.entity.demo-sounds")

local robot_animations = {}

robot_animations.sparks = 
{
  {
    filename = "__base__/graphics/entity/sparks/sparks-01.png",
    width = 39,
    height = 34,
    frame_count = 19,
    line_length = 19,
    shift = {-0.109375, 0.3125},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-02.png",
    width = 36,
    height = 32,
    frame_count = 19,
    line_length = 19,
    shift = {0.03125, 0.125},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-03.png",
    width = 42,
    height = 29,
    frame_count = 19,
    line_length = 19,
    shift = {-0.0625, 0.203125},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-04.png",
    width = 40,
    height = 35,
    frame_count = 19,
    line_length = 19,
    shift = {-0.0625, 0.234375},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-05.png",
    width = 39,
    height = 29,
    frame_count = 19,
    line_length = 19,
    shift = {-0.109375, 0.171875},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-06.png",
    width = 44,
    height = 36,
    frame_count = 19,
    line_length = 19,
    shift = {0.03125, 0.3125},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3
  }
}

robot_animations.logistic_robot =
{
  idle =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
    priority = "high",
    line_length = 16,
    width = 41,
    height = 42,
    frame_count = 1,
    shift = {0.015625, -0.09375},
    direction_count = 16,
    y = 42,
    hr_version =
    {
      filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot.png",
      priority = "high",
      line_length = 16,
      width = 80,
      height = 84,
      frame_count = 1,
      shift = util.by_pixel(0, -3),
      direction_count = 16,
      y = 84,
      scale = 0.5
    }
  },
  idle_with_cargo =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
    priority = "high",
    line_length = 16,
    width = 41,
    height = 42,
    frame_count = 1,
    shift = {0.015625, -0.09375},
    direction_count = 16,
    hr_version =
    {
      filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot.png",
      priority = "high",
      line_length = 16,
      width = 80,
      height = 84,
      frame_count = 1,
      shift = util.by_pixel(0, -3),
      direction_count = 16,
      scale = 0.5
    }
  },
  in_motion =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
    priority = "high",
    line_length = 16,
    width = 41,
    height = 42,
    frame_count = 1,
    shift = {0.015625, -0.09375},
    direction_count = 16,
    y = 126,
    hr_version =
    {
      filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot.png",
      priority = "high",
      line_length = 16,
      width = 80,
      height = 84,
      frame_count = 1,
      shift = util.by_pixel(0, -3),
      direction_count = 16,
      y = 252,
      scale = 0.5
    }
  },
  in_motion_with_cargo =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
    priority = "high",
    line_length = 16,
    width = 41,
    height = 42,
    frame_count = 1,
    shift = {0.015625, -0.09375},
    direction_count = 16,
    y = 84,
    hr_version =
    {
      filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot.png",
      priority = "high",
      line_length = 16,
      width = 80,
      height = 84,
      frame_count = 1,
      shift = util.by_pixel(0, -3),
      direction_count = 16,
      y = 168,
      scale = 0.5
    }
  },
  shadow_idle =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 59,
    height = 23,
    frame_count = 1,
    shift = {0.96875, 0.609375},
    direction_count = 16,
    y = 23,
    hr_version =
    {
      filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 115,
      height = 57,
      frame_count = 1,
      shift = util.by_pixel(31.75, 19.75),
      direction_count = 16,
      y = 57,
      scale = 0.5
    }
  },
  shadow_idle_with_cargo =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 59,
    height = 23,
    frame_count = 1,
    shift = {0.96875, 0.609375},
    direction_count = 16,
    hr_version =
    {
      filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 115,
      height = 57,
      frame_count = 1,
      shift = util.by_pixel(31.75, 19.75),
      direction_count = 16,
      scale = 0.5
    }
  },
  shadow_in_motion =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 59,
    height = 23,
    frame_count = 1,
    shift = {0.96875, 0.609375},
    direction_count = 16,
    y = 23,
    hr_version =
    {
      filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 115,
      height = 57,
      frame_count = 1,
      shift = util.by_pixel(31.75, 19.75),
      direction_count = 16,
      y = 171,
      scale = 0.5
    }
  },
  shadow_in_motion_with_cargo =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 59,
    height = 23,
    frame_count = 1,
    shift = {0.96875, 0.609375},
    direction_count = 16,
    hr_version =
    {
      filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 115,
      height = 57,
      frame_count = 1,
      shift = util.by_pixel(31.75, 19.75),
      direction_count = 16,
      y = 114,
      scale = 0.5
    }
  }
}

robot_animations.construction_robot = 
{
  
  idle =
  {
    filename = "__base__/graphics/entity/construction-robot/construction-robot.png",
    priority = "high",
    line_length = 16,
    width = 32,
    height = 36,
    frame_count = 1,
    shift = {0, -0.15625},
    direction_count = 16,
    hr_version =
    {
      filename = "__base__/graphics/entity/construction-robot/hr-construction-robot.png",
      priority = "high",
      line_length = 16,
      width = 66,
      height = 76,
      frame_count = 1,
      shift = util.by_pixel(0,-4.5),
      direction_count = 16,
      scale = 0.5
    }
  },
  in_motion =
  {
    filename = "__base__/graphics/entity/construction-robot/construction-robot.png",
    priority = "high",
    line_length = 16,
    width = 32,
    height = 36,
    frame_count = 1,
    shift = {0, -0.15625},
    direction_count = 16,
    y = 36,
    hr_version =
    {
      filename = "__base__/graphics/entity/construction-robot/hr-construction-robot.png",
      priority = "high",
      line_length = 16,
      width = 66,
      height = 76,
      frame_count = 1,
      shift = util.by_pixel(0, -4.5),
      direction_count = 16,
      y = 76,
      scale = 0.5
    }
  },
  shadow_idle =
  {
    filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 50,
    height = 24,
    frame_count = 1,
    shift = {1.09375, 0.59375},
    direction_count = 16,
    hr_version =
    {
      filename = "__base__/graphics/entity/construction-robot/hr-construction-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 104,
      height = 49,
      frame_count = 1,
      shift = util.by_pixel(33.5, 18.75),
      direction_count = 16,
      scale = 0.5
    }
  },
  shadow_in_motion =
  {
    filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 50,
    height = 24,
    frame_count = 1,
    shift = {1.09375, 0.59375},
    direction_count = 16,
    hr_version =
    {
      filename = "__base__/graphics/entity/construction-robot/hr-construction-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 104,
      height = 49,
      frame_count = 1,
      shift = util.by_pixel(33.5, 18.75),
      direction_count = 16,
      scale = 0.5
    }
  },
  working =
  {
    filename = "__base__/graphics/entity/construction-robot/construction-robot-working.png",
    priority = "high",
    line_length = 2,
    width = 28,
    height = 36,
    frame_count = 2,
    shift = {0, -0.15625},
    direction_count = 16,
    animation_speed = 0.3,
    hr_version =
    {
      filename = "__base__/graphics/entity/construction-robot/hr-construction-robot-working.png",
      priority = "high",
      line_length = 2,
      width = 57,
      height = 74,
      frame_count = 2,
      shift = util.by_pixel(-0.25, -5),
      direction_count = 16,
      animation_speed = 0.3,
      scale = 0.5
    }
  },
  shadow_working =
  {
    filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 50,
    height = 24,
    frame_count = 1,
    repeat_count = 2,
    shift = {1.09375, 0.59375},
    direction_count = 16,
    hr_version =
    {
      filename = "__base__/graphics/entity/construction-robot/hr-construction-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 104,
      height = 49,
      frame_count = 1,
      repeat_count = 2,
      shift = util.by_pixel(33.5, 18.75),
      direction_count = 16,
      scale = 0.5
    }
  }
}

robot_animations.distractor =
{
  
  idle =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/distractor-robot/distractor-robot.png",
        priority = "high",
        line_length = 16,
        width = 38,
        height = 33,
        frame_count = 1,
        direction_count = 16,
        shift = {0, -0.078125},
        hr_version =
        {
          filename = "__base__/graphics/entity/distractor-robot/hr-distractor-robot.png",
          priority = "high",
          line_length = 16,
          width = 72,
          height = 62,
          frame_count = 1,
          direction_count = 16,
          shift = util.by_pixel(0, -2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/distractor-robot/distractor-robot-mask.png",
        priority = "high",
        line_length = 16,
        width = 24,
        height = 21,
        frame_count = 1,
        direction_count = 16,
        shift = {0, -0.203125},
        apply_runtime_tint = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/distractor-robot/hr-distractor-robot-mask.png",
          priority = "high",
          line_length = 16,
          width = 42,
          height = 37,
          frame_count = 1,
          direction_count = 16,
          shift = util.by_pixel(0, -6.25),
          apply_runtime_tint = true,
          scale = 0.5
        }
      }
    }
  },
  shadow_idle =
  {
    filename = "__base__/graphics/entity/distractor-robot/distractor-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 40,
    height = 25,
    frame_count = 1,
    direction_count = 16,
    shift = {0.9375, 0.609375},
    hr_version =
    {
      filename = "__base__/graphics/entity/distractor-robot/hr-distractor-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 96,
      height = 59,
      frame_count = 1,
      direction_count = 16,
      shift = util.by_pixel(32.5, 19.25),
      scale = 0.5
    }
  },
  in_motion =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/distractor-robot/distractor-robot.png",
        priority = "high",
        line_length = 16,
        width = 38,
        height = 33,
        frame_count = 1,
        direction_count = 16,
        shift = {0, -0.078125},
        y = 33,
        hr_version =
        {
          filename = "__base__/graphics/entity/distractor-robot/hr-distractor-robot.png",
          priority = "high",
          line_length = 16,
          width = 72,
          height = 62,
          frame_count = 1,
          direction_count = 16,
          shift = util.by_pixel(0, -2.5),
          y = 62,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/distractor-robot/distractor-robot-mask.png",
        priority = "high",
        line_length = 16,
        width = 24,
        height = 21,
        frame_count = 1,
        direction_count = 16,
        shift = {0, -0.203125},
        apply_runtime_tint = true,
        y = 21,
        hr_version =
        {
          filename = "__base__/graphics/entity/distractor-robot/hr-distractor-robot-mask.png",
          priority = "high",
          line_length = 16,
          width = 42,
          height = 37,
          frame_count = 1,
          direction_count = 16,
          shift = util.by_pixel(0, -6.25),
          apply_runtime_tint = true,
          y = 37,
          scale = 0.5
        }
      }
    }
  },
  shadow_in_motion =
  {
    filename = "__base__/graphics/entity/distractor-robot/distractor-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 40,
    height = 25,
    frame_count = 1,
    direction_count = 16,
    shift = {0.9375, 0.609375},
    hr_version =
    {
      filename = "__base__/graphics/entity/distractor-robot/hr-distractor-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 96,
      height = 59,
      frame_count = 1,
      direction_count = 16,
      shift = util.by_pixel(32.5, 19.25),
      scale = 0.5
    }
  }
}

robot_animations.defender =
{
  
  idle =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/defender-robot/defender-robot.png",
        priority = "high",
        line_length = 16,
        width = 32,
        height = 33,
        frame_count = 1,
        direction_count = 16,
        shift = {0, 0.015625},
        hr_version =
        {
          filename = "__base__/graphics/entity/defender-robot/hr-defender-robot.png",
          priority = "high",
          line_length = 16,
          width = 56,
          height = 59,
          frame_count = 1,
          direction_count = 16,
          shift = util.by_pixel(0, 0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/defender-robot/defender-robot-mask.png",
        priority = "high",
        line_length = 16,
        width = 18,
        height = 16,
        frame_count = 1,
        direction_count = 16,
        shift = {0, -0.125},
        apply_runtime_tint = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/defender-robot/hr-defender-robot-mask.png",
          priority = "high",
          line_length = 16,
          width = 28,
          height = 21,
          frame_count = 1,
          direction_count = 16,
          shift = util.by_pixel(0, -4.75),
          apply_runtime_tint = true,
          scale = 0.5
        }
      }
    }
  },
  shadow_idle =
  {
    filename = "__base__/graphics/entity/defender-robot/defender-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 43,
    height = 23,
    frame_count = 1,
    direction_count = 16,
    shift = {0.859375, 0.609375},
    hr_version =
    {
      filename = "__base__/graphics/entity/defender-robot/hr-defender-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 88,
      height = 50,
      frame_count = 1,
      direction_count = 16,
      shift = util.by_pixel(25.5, 19),
      scale = 0.5
    }
  },
  in_motion =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/defender-robot/defender-robot.png",
        priority = "high",
        line_length = 16,
        width = 32,
        height = 33,
        frame_count = 1,
        direction_count = 16,
        shift = {0, 0.015625},
        y = 33,
        hr_version =
        {
          filename = "__base__/graphics/entity/defender-robot/hr-defender-robot.png",
          priority = "high",
          line_length = 16,
          width = 56,
          height = 59,
          frame_count = 1,
          direction_count = 16,
          shift = util.by_pixel(0, 0.25),
          y = 59,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/defender-robot/defender-robot-mask.png",
        priority = "high",
        line_length = 16,
        width = 18,
        height = 16,
        frame_count = 1,
        direction_count = 16,
        shift = {0, -0.125},
        apply_runtime_tint = true,
        y = 16,
        hr_version =
        {
          filename = "__base__/graphics/entity/defender-robot/hr-defender-robot-mask.png",
          priority = "high",
          line_length = 16,
          width = 28,
          height = 21,
          frame_count = 1,
          direction_count = 16,
          shift = util.by_pixel(0, -4.75),
          apply_runtime_tint = true,
          y = 21,
          scale = 0.5
        }
      }
    }
  },
  shadow_in_motion =
  {
    filename = "__base__/graphics/entity/defender-robot/defender-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 43,
    height = 23,
    frame_count = 1,
    direction_count = 16,
    shift = {0.859375, 0.609375},
    hr_version =
    {
      filename = "__base__/graphics/entity/defender-robot/hr-defender-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 88,
      height = 50,
      frame_count = 1,
      direction_count = 16,
      shift = util.by_pixel(25.5, 19),
      scale = 0.5
    }
  }
}

robot_animations.destroyer =
{
  
  idle =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/destroyer-robot/destroyer-robot.png",
        priority = "high",
        line_length = 32,
        width = 45,
        height = 39,
        y = 39,
        frame_count = 1,
        direction_count = 32,
        shift = {0.078125, -0.546875},
        hr_version =
        {
          filename = "__base__/graphics/entity/destroyer-robot/hr-destroyer-robot.png",
          priority = "high",
          line_length = 32,
          width = 88,
          height = 77,
          y = 77,
          frame_count = 1,
          direction_count = 32,
          shift = util.by_pixel(2.5, -17.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/destroyer-robot/destroyer-robot-mask.png",
        priority = "high",
        line_length = 32,
        width = 27,
        height = 21,
        y = 21,
        frame_count = 1,
        direction_count = 32,
        shift = {0.078125, -0.734375},
        apply_runtime_tint = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/destroyer-robot/hr-destroyer-robot-mask.png",
          priority = "high",
          line_length = 32,
          width = 52,
          height = 42,
          y = 42,
          frame_count = 1,
          direction_count = 32,
          shift = util.by_pixel(2.5, -23),
          apply_runtime_tint = true,
          scale = 0.5
        }
      }
    }
  },
  shadow_idle =
  {
    filename = "__base__/graphics/entity/destroyer-robot/destroyer-robot-shadow.png",
    priority = "high",
    line_length = 32,
    width = 48,
    height = 32,
    frame_count = 1,
    direction_count = 32,
    shift = {0.78125, 0},
    hr_version =
    {
      filename = "__base__/graphics/entity/destroyer-robot/hr-destroyer-robot-shadow.png",
      priority = "high",
      line_length = 32,
      width = 108,
      height = 66,
      frame_count = 1,
      direction_count = 32,
      shift = util.by_pixel(23.5, 1),
      scale = 0.5
    }
  },
  in_motion =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/destroyer-robot/destroyer-robot.png",
        priority = "high",
        line_length = 32,
        width = 45,
        height = 39,
        frame_count = 1,
        direction_count = 32,
        shift = {0.078125, -0.546875},
        hr_version =
        {
          filename = "__base__/graphics/entity/destroyer-robot/hr-destroyer-robot.png",
          priority = "high",
          line_length = 32,
          width = 88,
          height = 77,
          frame_count = 1,
          direction_count = 32,
          shift = util.by_pixel(2.5, -17.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/destroyer-robot/destroyer-robot-mask.png",
        priority = "high",
        line_length = 32,
        width = 27,
        height = 21,
        frame_count = 1,
        direction_count = 32,
        shift = {0.078125, -0.734375},
        apply_runtime_tint = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/destroyer-robot/hr-destroyer-robot-mask.png",
          priority = "high",
          line_length = 32,
          width = 52,
          height = 42,
          frame_count = 1,
          direction_count = 32,
          shift = util.by_pixel(2.5, -23),
          apply_runtime_tint = true,
          scale = 0.5
        }
      }
    }
  },
  shadow_in_motion =
  {
    filename = "__base__/graphics/entity/destroyer-robot/destroyer-robot-shadow.png",
    priority = "high",
    line_length = 32,
    width = 48,
    height = 32,
    frame_count = 1,
    direction_count = 32,
    shift = {0.78125, 0},
    hr_version =
    {
      filename = "__base__/graphics/entity/destroyer-robot/hr-destroyer-robot-shadow.png",
      priority = "high",
      line_length = 32,
      width = 108,
      height = 66,
      frame_count = 1,
      direction_count = 32,
      shift = util.by_pixel(23.5, 1),
      scale = 0.5
    }
  }
}

local robots =
{  
  {
    type = "construction-robot",
    name = "construction-robot",
    icon = "__base__/graphics/icons/construction-robot.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 0.1, result = "construction-robot"},
    resistances = { { type = "fire", percent = 85 } },
    max_health = 100,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    damaged_trigger_effect = hit_effects.entity(nil, {0, -1}),
    dying_explosion = "construction-robot-explosion",
    max_payload_size = 1,
    speed = 0.06,
    max_energy = "1.5MJ",
    energy_per_tick = "0.05kJ",
    speed_multiplier_when_out_of_energy = 0.2,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    working_light = {intensity = 0.8, size = 3, color = {r = 0.8, g = 0.8, b = 0.8}},
    smoke =
    {
      filename = "__base__/graphics/entity/smoke-construction/smoke-01.png",
      width = 39,
      height = 32,
      frame_count = 19,
      line_length = 19,
      shift = {0.078125, -0.15625},
      animation_speed = 0.3
    },
    sparks = robot_animations.sparks,
    working_sound = sounds.construction_robot(0.7),
    cargo_centered = {0.0, 0.2},
    construction_vector = {0.30, 0.22},
    water_reflection = robot_reflection(1),
    idle = robot_animations.construction_robot.idle,
    idle_with_cargo = robot_animations.construction_robot.idle_with_cargo,
    in_motion = robot_animations.construction_robot.in_motion,
    in_motion_with_cargo = robot_animations.construction_robot.in_motion_with_cargo,
    shadow_idle = robot_animations.construction_robot.shadow_idle,
    shadow_idle_with_cargo = robot_animations.construction_robot.shadow_idle_with_cargo,
    shadow_in_motion = robot_animations.construction_robot.shadow_in_motion,
    shadow_in_motion_with_cargo = robot_animations.construction_robot.shadow_in_motion_with_cargo,
    working = robot_animations.construction_robot.working,
    shadow_working = robot_animations.construction_robot.shadow_working
  },
  {
    type = "logistic-robot",
    name = "logistic-robot",
    icon = "__base__/graphics/icons/logistic-robot.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 0.1, result = "logistic-robot"},
    resistances = { { type = "fire", percent = 85 } },
    max_health = 100,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    damaged_trigger_effect = hit_effects.entity(nil, {0, -1}),
    dying_explosion = "logistic-robot-explosion",
    max_payload_size = 1,
    speed = 0.05,
    max_energy = "1.5MJ",
    energy_per_tick = "0.05kJ",
    speed_multiplier_when_out_of_energy = 0.2,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    working_sound = sounds.flying_robot(0.5),
    cargo_centered = {0.0, 0.2},
    water_reflection = robot_reflection(1),
    idle = robot_animations.logistic_robot.idle,
    idle_with_cargo = robot_animations.logistic_robot.idle_with_cargo,
    in_motion = robot_animations.logistic_robot.in_motion,
    in_motion_with_cargo = robot_animations.logistic_robot.in_motion_with_cargo,
    shadow_idle = robot_animations.logistic_robot.shadow_idle,
    shadow_idle_with_cargo = robot_animations.logistic_robot.shadow_idle_with_cargo,
    shadow_in_motion = robot_animations.logistic_robot.shadow_in_motion,
    shadow_in_motion_with_cargo = robot_animations.logistic_robot.shadow_in_motion_with_cargo
  },
  {
    type = "combat-robot",
    name = "distractor",
    icon = "__base__/graphics/icons/distractor.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map", "not-repairable"},
    resistances = { { type = "fire", percent = 95 } },
    order="e-a-b",
    subgroup="capsule",
    max_health = 90,
    alert_when_damaged = false,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.9, -1.5}, {0.9, -0.5}},
    damaged_trigger_effect = hit_effects.entity(nil, {0, -1}),
    dying_explosion = "distractor-robot-explosion",
    time_to_live = 60 * 45,
    speed = 0,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/fight/distractor-robot-loop.ogg",
        volume = 0.7
      },
      apparent_volume = 1,
      persistent = true
    },
    resistances =
    {
      {
        type = "acid",
        decrease = 0,
        percent = 85
      },
    },
    destroy_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          type = "create-entity",
          entity_name = "distractor-robot-explosion"
        }
      }
    },
    attack_parameters =
    {
      type = "beam",
      ammo_category = "combat-robot-laser",
      cooldown = 20,
      cooldown_deviation = 0.2,
      damage_modifier = 1,
      range = 15,
      sound = make_laser_sounds(),
      ammo_type =
      {
        category = "combat-robot-laser",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "beam",
            beam = "laser-beam",
            max_length = 15,
            duration = 20,
            --starting_speed = 0.3
          }
        }
      }
    },
    water_reflection = robot_reflection(1),
    idle = robot_animations.distractor.idle,
    in_motion = robot_animations.distractor.in_motion,
    shadow_idle = robot_animations.distractor.shadow_idle,
    shadow_in_motion = robot_animations.distractor.shadow_in_motion
  },
  {
    type = "combat-robot",
    name = "defender",
    icon = "__base__/graphics/icons/defender.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map", "not-repairable"},
    resistances = { { type = "fire", percent = 95 } },
    subgroup="capsule",
    order="e-a-a",
    max_health = 60,
    alert_when_damaged = false,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    damaged_trigger_effect = hit_effects.entity(nil, {0, -1}),
    dying_explosion = "defender-robot-explosion",
    time_to_live = 60 * 45,
    follows_player = true,
    friction = 0.01,
    range_from_player = 6.0,
    speed = 0.01,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/fight/defender-robot-loop.ogg",
        volume = 0.7
      },
      apparent_volume = 1,
      persistent = true
    },
    resistances =
    {
      {
        type = "acid",
        decrease = 0,
        percent = 80
      },
    },
    destroy_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          type = "create-entity",
          entity_name = "defender-robot-explosion"
        }
      }
    },
    attack_parameters =
    {
      type = "projectile",
      cooldown = 20,
      cooldown_deviation = 0.2,
      projectile_center = {0, 1},
      projectile_creation_distance = 0.6,
      range = 15,
      sound = sounds.light_gunshot,
      ammo_type =
      {
        category = "bullet",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              type = "create-explosion",
              entity_name = "explosion-gunshot-small"
            },
            target_effects =
            {
              {
                type = "create-entity",
                entity_name = "explosion-hit"
              },
              {
                type = "damage",
                damage = { amount = 8 , type = "physical"}
              }
            }
          }
        }
      }
    },
    water_reflection = robot_reflection(0.8),
    idle = robot_animations.defender.idle,
    in_motion = robot_animations.defender.in_motion,
    shadow_idle = robot_animations.defender.shadow_idle,
    shadow_in_motion = robot_animations.defender.shadow_in_motion
  },
  {
    type = "combat-robot",
    name = "destroyer",
    icon = "__base__/graphics/icons/destroyer.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map", "not-repairable"},
    resistances = { { type = "fire", percent = 95 } },
    subgroup="capsule",
    order="e-a-c",
    max_health = 60,
    alert_when_damaged = false,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    damaged_trigger_effect = hit_effects.entity(nil, {0, -1}),
    dying_explosion = "destroyer-robot-explosion",
    time_to_live = 60 * 60 * 2,
    speed = 0.01,
    follows_player = true,
    friction = 0.01,
    range_from_player = 6.0,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/fight/destroyer-robot-loop.ogg",
        volume = 0.7
      },
      apparent_volume = 1,
      persistent = true
    },
    resistances =
    {
      {
        type = "acid",
        decrease = 0,
        percent = 90
      },
    },
    destroy_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          type = "create-entity",
          entity_name = "destroyer-robot-explosion"
        }
      }
    },
    attack_parameters =
    {
      type = "beam",
      ammo_category = "combat-robot-beam",
      cooldown = 20,
      cooldown_deviation = 0.2,
      range = 15,
      sound = make_laser_sounds(),
      ammo_type =
      {
        category = "combat-robot-beam",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "beam",
            beam = "electric-beam",
            max_length = 15,
            duration = 20,
            source_offset = {0.15, -0.5}
          }
        }
      }
    },
    water_reflection = robot_reflection(1.2),
    idle = robot_animations.destroyer.idle,
    in_motion = robot_animations.destroyer.in_motion,
    shadow_idle = robot_animations.destroyer.shadow_idle,
    shadow_in_motion = robot_animations.destroyer.shadow_in_motion
  }
}

data:extend(robots)

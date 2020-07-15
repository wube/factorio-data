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
    shift = util.by_pixel(0, -3),
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
    shift = util.by_pixel(0, -3),
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
    shift = util.by_pixel(0, -3),
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
    shift = util.by_pixel(0, -3),
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
    width = 58,
    height = 29,
    frame_count = 1,
    shift = util.by_pixel(32, 19.5),
    direction_count = 16,
    y = 29,
    draw_as_shadow = true,
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
      scale = 0.5,
      draw_as_shadow = true
    },
  },
  shadow_idle_with_cargo =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 58,
    height = 29,
    frame_count = 1,
    shift = util.by_pixel(32, 19.5),
    direction_count = 16,
    draw_as_shadow = true,
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
      scale = 0.5,
      draw_as_shadow = true
    },
  },
  shadow_in_motion =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 58,
    height = 29,
    frame_count = 1,
    shift = util.by_pixel(32, 19.5),
    direction_count = 16,
    y = 29,
    draw_as_shadow = true,
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
      y = 57*3,
      scale = 0.5,
      draw_as_shadow = true
    },
  },
  shadow_in_motion_with_cargo =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 58,
    height = 29,
    frame_count = 1,
    shift = util.by_pixel(32, 19.5),
    direction_count = 16,
    draw_as_shadow = true,
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
      scale = 0.5,
      draw_as_shadow = true
    },
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
    shift = util.by_pixel(0,-4.5),
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
    shift = util.by_pixel(0, -4.5),
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
    width = 53,
    height = 25,
    frame_count = 1,
    shift = util.by_pixel(33.5, 18.5),
    direction_count = 16,
    draw_as_shadow = true,
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
      scale = 0.5,
      draw_as_shadow = true
    },
  },
  shadow_in_motion =
  {
    filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 53,
    height = 25,
    frame_count = 1,
    shift = util.by_pixel(33.5, 18.5),
    direction_count = 16,
    draw_as_shadow = true,
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
      scale = 0.5,
      draw_as_shadow = true
    },
  },
  working =
  {
    filename = "__base__/graphics/entity/construction-robot/construction-robot-working.png",
    priority = "high",
    line_length = 2,
    width = 28,
    height = 36,
    frame_count = 2,
    shift = util.by_pixel(-0.25, -5),
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
    width = 53,
    height = 25,
    frame_count = 1,
    repeat_count = 2,
    shift = util.by_pixel(33.5, 18.5),
    direction_count = 16,
    draw_as_shadow = true,
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
      scale = 0.5,
      draw_as_shadow = true
    },
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
        shift = util.by_pixel(0, -2.5),
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
        shift = util.by_pixel(0, -6.25),
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
    width = 49,
    height = 30,
    frame_count = 1,
    direction_count = 16,
    shift = util.by_pixel(32.5, 19),
    draw_as_shadow = true,
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
      scale = 0.5,
      draw_as_shadow = true
    },
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
        shift = util.by_pixel(0, -2.5),
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
        shift = util.by_pixel(0, -6.25),
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
    width = 49,
    height = 30,
    frame_count = 1,
    direction_count = 16,
    shift = util.by_pixel(32.5, 19),
    draw_as_shadow = true,
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
      scale = 0.5,
      draw_as_shadow = true
    },
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
        shift = util.by_pixel(2.5, -1.25),
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
          shift = util.by_pixel(2.5, -1.25),
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
        shift = util.by_pixel(2.5, -7),
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
          shift = util.by_pixel(2.5, -7),
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
    width = 55,
    height = 34,
    frame_count = 1,
    direction_count = 32,
    shift = util.by_pixel(23.5, 19),
    draw_as_shadow = true,
    hr_version =
    {
      filename = "__base__/graphics/entity/destroyer-robot/hr-destroyer-robot-shadow.png",
      priority = "high",
      line_length = 32,
      width = 108,
      height = 66,
      frame_count = 1,
      direction_count = 32,
      shift = util.by_pixel(23.5, 19),
      scale = 0.5,
      draw_as_shadow = true
    },
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
        shift = util.by_pixel(2.5, -1.25),
        hr_version =
        {
          filename = "__base__/graphics/entity/destroyer-robot/hr-destroyer-robot.png",
          priority = "high",
          line_length = 32,
          width = 88,
          height = 77,
          frame_count = 1,
          direction_count = 32,
          shift = util.by_pixel(2.5, -1.25),
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
        shift = util.by_pixel(2.5, -7),
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
          shift = util.by_pixel(2.5, -7),
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
    width = 55,
    height = 34,
    frame_count = 1,
    direction_count = 32,
    shift = util.by_pixel(23.5, 19),
    draw_as_shadow = true,
    hr_version =
    {
      filename = "__base__/graphics/entity/destroyer-robot/hr-destroyer-robot-shadow.png",
      priority = "high",
      line_length = 32,
      width = 108,
      height = 66,
      frame_count = 1,
      direction_count = 32,
      shift = util.by_pixel(23.5, 19),
      scale = 0.5,
      draw_as_shadow = true
    },
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
    resistances =
    {
      {
        type = "fire",
        percent = 85
      }
    },
    max_health = 100,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    damaged_trigger_effect = hit_effects.flying_robot(),
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
    repairing_sound =
    {
      { filename = "__base__/sound/robot-repair-1.ogg" },
      { filename = "__base__/sound/robot-repair-2.ogg" },
      { filename = "__base__/sound/robot-repair-3.ogg" },
      { filename = "__base__/sound/robot-repair-4.ogg" },
      { filename = "__base__/sound/robot-repair-5.ogg" }
    },
    working_sound = sounds.construction_robot(0.47),
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
    resistances =
    {
      {
        type = "fire",
        percent = 85
      }
    },
    max_health = 100,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    damaged_trigger_effect = hit_effects.flying_robot(),
    dying_explosion = "logistic-robot-explosion",
    max_payload_size = 1,
    speed = 0.05,
    max_energy = "1.5MJ",
    energy_per_tick = "0.05kJ",
    speed_multiplier_when_out_of_energy = 0.2,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    working_sound = sounds.flying_robot(0.48),
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
    resistances =
    {
      {
        type = "fire",
        percent = 95
      },
      {
        type = "acid",
        decrease = 0,
        percent = 85
      }
    },
    subgroup="capsule",
    order="e-a-b",
    max_health = 90,
    alert_when_damaged = false,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    damaged_trigger_effect = hit_effects.flying_robot(),
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
      persistent = true
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
    name = "destroyer",
    icon = "__base__/graphics/icons/destroyer.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map", "not-repairable"},
    resistances =
    {
      {
        type = "fire",
        percent = 95
      },
      {
        type = "acid",
        decrease = 0,
        percent = 90
      }
    },
    subgroup="capsule",
    order="e-a-c",
    max_health = 60,
    alert_when_damaged = false,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.4}, {0.1, -1.3}},
    damaged_trigger_effect = hit_effects.flying_robot(),
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
      persistent = true
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

local shadow_shift = {-0.75, -0.40}
local animation_shift = {0, 0}

local adjust_animation = function(animation)

  local animation = util.copy(animation)
  local layers = animation.layers or {animation}

  for k, layer in pairs (layers) do

    layer.frame_count = layer.direction_count
    layer.direction_count = 0
    layer.animation_speed = 1
    layer.shift = util.add_shift(layer.shift, animation_shift)

    if layer.hr_version then
      layer.hr_version.frame_count = layer.hr_version.direction_count
      layer.hr_version.direction_count = 0
      layer.hr_version.animation_speed = 1
      layer.hr_version.shift = util.add_shift(layer.hr_version.shift, animation_shift)
    end

  end

  return animation
end

local adjust_shadow = function(shadow_animation)

  local shadow_animation = util.copy(shadow_animation)
  local layers = shadow_animation.layers or {shadow_animation}

  for k, layer in pairs (layers) do

    layer.frame_count = layer.direction_count
    layer.direction_count = 0
    layer.animation_speed = 1
    layer.shift = util.add_shift(layer.shift, shadow_shift)

    if layer.hr_version then
      layer.hr_version.frame_count = layer.hr_version.direction_count
      layer.hr_version.direction_count = 0
      layer.hr_version.animation_speed = 1
      layer.hr_version.shift = util.add_shift(layer.hr_version.shift, shadow_shift)
    end

  end

  return shadow_animation
end

local reversed = function(animation)
  local animation = util.copy(animation)
  local layers = animation.layers or {animation}

  for k, layer in pairs (layers) do
    layer.run_mode = "backward"
    if layer.hr_version then
      layer.hr_version.run_mode = "backward"
    end
  end

  return animation
end

local make_robot_particle = function(prototype)

  local particle_name = prototype.name.."-dying-particle"

  local animation = adjust_animation(prototype.in_motion)
  local shadow_animation = adjust_shadow(prototype.shadow_in_motion)

  local particle =
  {
    type = "optimized-particle",
    name = particle_name,
    pictures = {animation, reversed(animation)},
    shadows = {shadow_animation, reversed(shadow_animation)},
    movement_modifier = 0.95,
    life_time = 1000,
    regular_trigger_effect_frequency = 2,
    regular_trigger_effect =
    {
      {
        type = "create-trivial-smoke",
        smoke_name = "smoke-fast",
        starting_frame_deviation = 5,
        probability = 0.5
      },
      {
        type = "create-particle",
        particle_name = "spark-particle",
        tail_length = 10,
        tail_length_deviation = 5,
        tail_width = 5,
        probability = 0.2,
        initial_height = 0.2,
        initial_vertical_speed = 0.15,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.1,
        speed_from_center_deviation = 0.05,
        offset_deviation = {{-0.25, -0.25},{0.25, 0.25}}
      }
    },
    ended_on_ground_trigger_effect =
    {
      {
      type = "create-entity",
      entity_name = prototype.name.."-remnants",
      offsets = {{0, 0}}
      },
      {
        type = "play-sound",
        sound = sounds.robot_die_impact,
      },
    }
  }

  data:extend{particle}

  prototype.dying_trigger_effect =
  {
    {
      type = "create-particle",
      particle_name = particle_name,
      initial_height = 1.8,
      initial_vertical_speed = 0,
      frame_speed = 1,
      frame_speed_deviation = 0.5,
      speed_from_center = 0,
      speed_from_center_deviation = 0.2,
      offset_deviation = {{-0.01, -0.01},{0.01, 0.01}},
      offsets = {{0, 0.5}}
    },
    {
      type = "play-sound",
      sound = sounds.robot_die_whoosh,
    },
    {
      type = "play-sound",
      sound = sounds.robot_die_vox,
    },
  }

  if prototype.type == "construction-robot" or prototype.type == "logistic-robot" then return end

  prototype.destroy_action =
  {
    type = "direct",
    action_delivery =
    {
      type = "instant",
      source_effects =
      {
        {
          type = "create-particle",
          particle_name = particle_name,
          initial_height = 1.8,
          initial_vertical_speed = 0,
          frame_speed = 0.5,
          frame_speed_deviation = 0.5,
          speed_from_center = 0,
          speed_from_center_deviation = 0.1,
          offset_deviation = {{-0.01, -0.01},{0.01, 0.01}},
          offsets = {{0, 0.5}}
        },
        {
          type = "play-sound",
          sound = sounds.robot_die_whoosh,
        },
        {
          type = "play-sound",
          sound = sounds.robot_die_vox,
        },
        {
          type = "play-sound",
          sound = sounds.robot_selfdestruct,
        },
      }
    }
  }

end

for k, robot in pairs (robots) do
  make_robot_particle(robot)
end

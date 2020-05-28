local hit_effects = require ("prototypes.entity.demo-hit-effects")
local sounds = require("prototypes.entity.demo-sounds")

local robot_animations = {}

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
        shift = util.by_pixel(0, 0.25),
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
        shift = util.by_pixel(0, -4.75),
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
    width = 45,
    height = 26,
    frame_count = 1,
    direction_count = 16,
    shift = util.by_pixel(25.5, 19),
    draw_as_shadow = true,
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
      scale = 0.5,
      draw_as_shadow = true
    },
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
        animation_speed = 1,
        direction_count = 16,
        shift = util.by_pixel(0, 0.25),
        y = 33,
        hr_version =
        {
          filename = "__base__/graphics/entity/defender-robot/hr-defender-robot.png",
          priority = "high",
          line_length = 16,
          width = 56,
          height = 59,
          frame_count = 1,
          animation_speed = 1,
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
        animation_speed = 1,
        direction_count = 16,
        shift = util.by_pixel(0, -4.75),
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
          animation_speed = 1,
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
    width = 45,
    height = 26,
    frame_count = 1,
    animation_speed = 1,
    direction_count = 16,
    shift = util.by_pixel(25.5, 19),
    draw_as_shadow = true,
    hr_version =
    {
      filename = "__base__/graphics/entity/defender-robot/hr-defender-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 88,
      height = 50,
      frame_count = 1,
      animation_speed = 1,
      direction_count = 16,
      shift = util.by_pixel(25.5, 19),
      scale = 0.5,
      draw_as_shadow = true
    },
  }
}

local robots =
{
  {
    type = "combat-robot",
    name = "defender",
    icon = "__base__/graphics/icons/defender.png",
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
        percent = 80
      }
    },
    subgroup="capsule",
    order="e-a-a",
    max_health = 60,
    alert_when_damaged = false,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    damaged_trigger_effect = hit_effects.flying_robot(),
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
      sound = sounds.defender_gunshot,
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

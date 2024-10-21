local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local robot_animations = {}

robot_animations.capture =
{
  layers =
  {
    util.sprite_load("__space-age__/graphics/entity/capture-robot-rocket/capture-robot-capture-anim",
    {
      animation_speed = 0.25,
      frame_count = 32,
      scale = 0.5,
      priority = "high",
      surface = "nauvis",
      usage = "enemy" -- is used around enemy sprites
    }),
    util.sprite_load("__space-age__/graphics/entity/capture-robot-rocket/capture-robot-capture-anim-mask",
    {
      animation_speed = 0.25,
      frame_count = 32,
      scale = 0.5,
      priority = "high",
      apply_runtime_tint = true,
      surface = "nauvis",
      usage = "enemy"
    }),
    util.sprite_load("__space-age__/graphics/entity/capture-robot-rocket/capture-robot-capture-anim-shadow",
    {
      animation_speed = 0.25,
      frame_count = 32,
      scale = 0.5,
      priority = "high",
      draw_as_shadow = true,
      surface = "nauvis",
      usage = "enemy"
    }),
  }
}

local robots =
{
  {
    type = "capture-robot",
    name = "capture-robot",
    hidden = true,
    icon = "__space-age__/graphics/icons/capture-bot.png",
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
    order="e-a-c",
    max_health = 60,
    alert_when_damaged = false,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-1, -1}, {1, -1}},
    hit_visualization_box = {{-0.1, -1.4}, {0.1, -1.3}},
    damaged_trigger_effect = hit_effects.flying_robot(),
    dying_explosion = "capture-robot-explosion",
    capture_speed = 1.0,
    speed = 0.01,
    working_sound =
    {
      sound = { filename = "__base__/sound/fight/destroyer-robot-loop.ogg", volume = 0.7 },
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
          type = "create-explosion",
          entity_name = "capture-robot-explosion"
        }
      }
    },
    water_reflection = robot_reflection(2),
    capture_animation = robot_animations.capture,
  },
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
  end

  return shadow_animation
end

local reversed = function(animation)
  local animation = util.copy(animation)
  local layers = animation.layers or {animation}

  for k, layer in pairs (layers) do
    layer.run_mode = "backward"
  end

  return animation
end

local make_robot_particle = function(prototype)

  local particle_name = prototype.name.."-dying-particle"

  if not prototype.in_motion then return end
  local animation = adjust_animation(prototype.in_motion)
  if not prototype.shadow_in_motion then return end
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
        sound = sounds.robot_die_impact
      }
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
      sound = sounds.robot_die_whoosh
    },
    {
      type = "play-sound",
      sound = sounds.robot_die_vox
    }
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
          sound = sounds.robot_die_whoosh
        },
        {
          type = "play-sound",
          sound = sounds.robot_die_vox
        },
        {
          type = "play-sound",
          sound = sounds.robot_selfdestruct
        }
      }
    }
  }

end

for k, robot in pairs (robots) do
  make_robot_particle(robot)
end

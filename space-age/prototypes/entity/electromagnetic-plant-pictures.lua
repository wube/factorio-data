local animation_speed = 0.4

local warm_up_frames = 32
local rotate_frames = 111
local rotate_continue_frames = 17
local cool_down_frames = 32

local function states()
  return {
    {
      name = "idle",
      duration = 1,
      next_active = "warm-up",
      next_inactive = "idle",
    },
    {
      name = "warm-up",
      duration = warm_up_frames,
      next_active = "working-1",
      next_inactive = "working-1",
    },
    {
      name = "working-1",
      duration = rotate_frames,
      next_active = "working-1-continue",
      next_inactive = "cool-down",
    },
    {
      name = "working-1-continue",
      duration =  rotate_continue_frames,
      next_active = "working-2",
      next_inactive = "working-2",
    },
    {
      name = "working-2",
      duration = rotate_frames,
      next_active = "working-2-continue",
      next_inactive = "cool-down",
    },
    {
      name = "working-2-continue",
      duration =  rotate_continue_frames,
      next_active = "working-3",
      next_inactive = "working-3",
    },
    {
      name = "working-3",
      duration = rotate_frames,
      next_active = "cool-down",
      next_inactive = "cool-down",
    },
    {
      name = "cool-down",
      duration = cool_down_frames,
      next_active = "warm-up",
      next_inactive = "idle",
    }
  }
end

local function base_layers()
  return
  {
    util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/electromagnetic-plant-base",
      {
        animation_speed = animation_speed,
        frame_count = 1,
        scale = 0.5
      }
    ),
    util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/electromagnetic-plant-base-shadow",
      {
        animation_speed = animation_speed,
        draw_as_shadow = true,
        frame_count = 1,
        scale = 0.5
      }
    ),
  }
end

local function warm_up_animation(frame_count)
  return {
    util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/electromagnetic-plant-main-warm-up",
      {
        animation_speed = animation_speed,
        frame_count = frame_count or warm_up_frames,
        scale = 0.5
      }
    ),
    util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/electromagnetic-plant-shadow-warm-up",
      {
        draw_as_shadow = true,
        animation_speed = animation_speed,
        frame_count = frame_count or warm_up_frames,
        scale = 0.5
      }
    )
  }
end

local function rotate_animation()
  return {
    util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/electromagnetic-plant-main-rotate",
      {
        animation_speed = animation_speed,
        frame_count = rotate_frames,
        scale = 0.5
      }
    ),
    util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/electromagnetic-plant-shadow-rotate",
      {
        draw_as_shadow = true,
        animation_speed = animation_speed,
        frame_count = rotate_frames,
        scale = 0.5
      }
    )
  }
end

local function rotate_continue_animation()
  return {
    util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/electromagnetic-plant-main-rotate-continue",
      {
        animation_speed = animation_speed,
        frame_count = rotate_continue_frames,
        scale = 0.5
      }
    ),
    util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/electromagnetic-plant-shadow-rotate-continue",
      {
        draw_as_shadow = true,
        animation_speed = animation_speed,
        frame_count = rotate_continue_frames,
        scale = 0.5
      }
    )
  }
end

local function cool_down_animation(frame_count)
  return {
    util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/electromagnetic-plant-main-cool-down",
      {
        animation_speed = animation_speed,
        frame_count = frame_count or cool_down_frames,
        scale = 0.5
      }
    ),
    util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/electromagnetic-plant-shadow-cool-down",
      {
        draw_as_shadow = true,
        animation_speed = animation_speed,
        frame_count = frame_count or cool_down_frames,
        scale = 0.5
      }
    )
  }
end

local function lights_warm_up_animation()
  return {
    util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/electromagnetic-plant-lights-warm-up",
      {
        draw_as_glow = true,
        blend_mode = "additive",
        animation_speed = animation_speed,
        frame_count = warm_up_frames,
        scale = 0.5
      }
    )
  }
end

local function lights_rotate_animation()
  return {
    util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/electromagnetic-plant-lights-rotate",
      {
        draw_as_glow = true,
        blend_mode = "additive",
        animation_speed = animation_speed,
        frame_count = rotate_frames,
        scale = 0.5
      }
    )
  }
end

local function lights_rotate_continue_animation()
  return {
    util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/electromagnetic-plant-lights-rotate-continue",
      {
        draw_as_glow = true,
        blend_mode = "additive",
        animation_speed = animation_speed,
        frame_count = rotate_continue_frames,
        scale = 0.5
      }
    )
  }
end

local function lights_cool_down_animation(frame_count)
  return {
    util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/electromagnetic-plant-lights-cool-down",
      {
        draw_as_glow = true,
        blend_mode = "additive",
        animation_speed = animation_speed,
        frame_count = cool_down_frames,
        scale = 0.5
      }
    )
  }
end

local function working_visualisations()
  return {
    {
      always_draw = true,
      draw_in_states = {"idle"},
      animation = { layers = warm_up_animation(1)}
    },
    {
      always_draw = true,
      draw_in_states = {"warm-up"},
      animation = { layers = warm_up_animation()},
      name = "warm-up"
    },
    {
      always_draw = true,
      draw_in_states = {"working-1", "working-2", "working-3"},
      animation = { layers = rotate_animation()},
      name = "rotation"
    },
    {
      always_draw = true,
      draw_in_states = {"working-1-continue", "working-2-continue"},
      animation = { layers = rotate_continue_animation()},
      name = "rotation-continue"
    },
    {
      always_draw = true,
      draw_in_states = {"cool-down"},
      animation = { layers = cool_down_animation()},
      name = "cool-down"
    },
    {
      draw_in_states = {"warm-up"},
      animation = { layers = lights_warm_up_animation()},
      name = "warm-up-lights"
    },
    {
      draw_in_states = {"working-1", "working-2", "working-3"},
      animation = { layers = lights_rotate_animation()},
      name = "rotation-lights"
    },
    {
      draw_in_states = {"working-1-continue", "working-2-continue"},
      animation = { layers = lights_rotate_continue_animation()},
      name = "rotation-continue-lights"
    },
    {
      draw_in_states = {"cool-down"},
      animation = { layers = lights_cool_down_animation()},
      name = "cool-down-lights"
    },
    {
      effect = "flicker",
      fadeout = true,
      light = {intensity = 0.35, size = 20, color = {r = 0.2, g = 0.25, b = 1}}
    }
  }
end

local function pipe_connection(pipe_direction)
  local pipe_direction_shadow = "shadow-" .. pipe_direction
  return
  {
    layers = {
      util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/pipe-connections/electromagnetic-plant-pipe-" .. pipe_direction,
        {
          scale = 0.5,
        }
      ),
      util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/pipe-connections/electromagnetic-plant-pipe-" .. pipe_direction_shadow,
        {
          scale = 0.5,
          draw_as_shadow = true,
        }
      )
    }
  }
end

local function pipe_connection_frozen(pipe_direction)
  return
  {
    layers = {
      util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/pipe-connections/electromagnetic-plant-pipe-" .. pipe_direction.."-frozen",
        {
          scale = 0.5,
        }
      )
    }
  }
end

return
{
  graphics_set = {
    animation_progress = 0.25,
    always_draw_idle_animation = true,
    states = states(),
    idle_animation = { layers = base_layers() },
    working_visualisations = working_visualisations(),
    frozen_patch = util.sprite_load("__space-age__/graphics/entity/electromagnetic-plant/electromagnetic-plant-frozen", {scale = 0.5}),
    reset_animation_when_frozen = true
  },
  water_reflection = {
    pictures =
    {
      filename = "__space-age__/graphics/entity/electromagnetic-plant/electromagnetic-plant-water-reflection.png",
      width = 26,
      height = 34,
      shift = util.by_pixel(5, 72.0),
      priority = "extra-high",
      variation_count = 1,
      scale = 5
    },
    rotate = false,
    orientation_to_variation = false
  },
  pipe_pictures = {
    north = pipe_connection("north"),
    east = pipe_connection("east"),
    south = pipe_connection("south"),
    west = pipe_connection("west")
  },
  pipe_pictures_frozen = {
    north = pipe_connection_frozen("north"),
    east = pipe_connection_frozen("east"),
    south = pipe_connection_frozen("south"),
    west = pipe_connection_frozen("west")
  }
}

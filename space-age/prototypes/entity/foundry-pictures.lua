local foundry_animation_speed = 0.16
local frames = 128

local function foundry_main_pictures()
  return util.sprite_load("__space-age__/graphics/entity/foundry/foundry-main",
  {
    animation_speed = foundry_animation_speed,
    frame_count = frames,
    scale = 0.5
  })
end

local function foundry_main_shadow_pictures()
  return util.sprite_load("__space-age__/graphics/entity/foundry/foundry-shadow",
  {
    animation_speed = foundry_animation_speed,
    frame_count = frames,
    draw_as_shadow = true,
    scale = 0.5
  })
end

local function foundry_pipe_north_pictures()
  return util.sprite_load("__space-age__/graphics/entity/foundry/foundry-pipe-connections-north",
  {
    repeat_count = frames,
    scale = 0.5
  })
end

local function foundry_pipe_east_pictures()
  return util.sprite_load("__space-age__/graphics/entity/foundry/foundry-pipe-connections-east",
  {
    repeat_count = frames,
    scale = 0.5
  })
end

local function foundry_pipe_south_pictures()
  return util.sprite_load("__space-age__/graphics/entity/foundry/foundry-pipe-connections-south",
  {
    repeat_count = frames,
    scale = 0.5
  })
end

local function foundry_pipe_west_pictures()
  return util.sprite_load("__space-age__/graphics/entity/foundry/foundry-pipe-connections-west",
  {
    animation_speed = foundry_animation_speed,
    frame_count = frames,
    scale = 0.5
  })
end

local function foundry_working_pictures()
  return
  {
    fadeout = true,
    animation =
    util.sprite_load("__space-age__/graphics/entity/foundry/foundry-working",
      {
        animation_speed = foundry_animation_speed,
        frame_count = frames,
        scale = 0.5
      }
    )
  }
end

local function foundry_lights_pictures()
  return
  {
    effect = "flicker",
    fadeout = true,
    animation =
    util.sprite_load("__space-age__/graphics/entity/foundry/foundry-lights",
      {
        draw_as_glow = true,
        animation_speed = foundry_animation_speed,
        frame_count = frames,
        blend_mode = "additive",
        scale = 0.5
      }
    )
  }
end

local function foundry_status_lamp_pictures()
  return
  {
    animation =
    util.sprite_load("__space-age__/graphics/entity/foundry/foundry-status-lamp",
      {
        draw_as_glow = true,
        repeat_count = frames,
        blend_mode = "additive",
        scale = 0.5
      }
    )
  }
end

local function foundry_chimney_smoke()
  return
  {
    fadeout = true,
    constant_speed = true,
    render_layer = "wires",
    animation =
    {
      filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
      frame_count = 47,
      line_length = 16,
      width = 90,
      height = 188,
      animation_speed = 0.5,
      shift = util.by_pixel(52, -131),
      tint = {0.4, 0.4, 0.4, 1},
      scale = 0.5
    }
  }
end

return {
  graphics_set =
  {
    animation =
    {
      layers =
      {
        foundry_main_pictures(),
        foundry_main_shadow_pictures()
      }
    },
    working_visualisations =
    {
      {
        always_draw = true,
        name = "output-pipe",
        enabled_by_name = true,
        north_animation = foundry_pipe_north_pictures(),
        north_secondary_draw_order = -10, -- behind main animation
        east_animation = foundry_pipe_east_pictures(),
        south_animation = foundry_pipe_south_pictures(),
        west_animation = foundry_pipe_west_pictures()
      },
      {
        always_draw = true,
        name = "input-pipe",
        enabled_by_name = true,
        north_animation = foundry_pipe_south_pictures(),
        east_animation = foundry_pipe_west_pictures(),
        south_animation = foundry_pipe_north_pictures(),
        south_secondary_draw_order = -10, -- behind main animation
        west_animation = foundry_pipe_east_pictures()
      },

      foundry_working_pictures(),
      foundry_lights_pictures(),
      foundry_status_lamp_pictures(),
      foundry_chimney_smoke()
    },
    frozen_patch = util.sprite_load("__space-age__/graphics/entity/foundry/foundry-frozen", {scale = 0.5}),
    reset_animation_when_frozen = true
  },
  pipe_picture_frozen = {
    north = util.sprite_load("__space-age__/graphics/entity/foundry/foundry-pipe-connections-north-frozen", { scale = 0.5, shift = {-1, 3} }),
    east = util.sprite_load("__space-age__/graphics/entity/foundry/foundry-pipe-connections-east-frozen", { scale = 0.5, shift = {-3, -1} }),
    south = util.sprite_load("__space-age__/graphics/entity/foundry/foundry-pipe-connections-south-frozen", { scale = 0.5, shift = {1, -3} }),
    west = util.sprite_load("__space-age__/graphics/entity/foundry/foundry-pipe-connections-west-frozen", { scale = 0.5, shift = {3, 1} })
  }
}

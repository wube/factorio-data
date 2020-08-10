local fireutil = {}

function fireutil.foreach(table_, fun_)
  for k, tab in pairs(table_) do
    fun_(tab)
    if tab.hr_version then
      fun_(tab.hr_version)
    end
  end
  return table_
end

function fireutil.create_fire_pictures(opts)
  local fire_blend_mode = opts.blend_mode or "additive"
  local fire_animation_speed = opts.animation_speed or 0.5
  local fire_scale =  opts.scale or 1
  local fire_tint = {r=1,g=1,b=1,a=1}
  local fire_flags = nil
  local retval =
  {
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-13.png",
      line_length = 8,
      width = 60,
      height = 118,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.0390625, -0.90625 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-12.png",
      line_length = 8,
      width = 63,
      height = 116,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.015625, -0.914065 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-11.png",
      line_length = 8,
      width = 61,
      height = 122,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.0078125, -0.90625 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-10.png",
      line_length = 8,
      width = 65,
      height = 108,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.0625, -0.64844 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-09.png",
      line_length = 8,
      width = 64,
      height = 101,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.03125, -0.695315 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-08.png",
      line_length = 8,
      width = 50,
      height = 98,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.0546875, -0.77344 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-07.png",
      line_length = 8,
      width = 54,
      height = 84,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0.015625, -0.640625 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-06.png",
      line_length = 8,
      width = 65,
      height = 92,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0, -0.83594 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-05.png",
      line_length = 8,
      width = 59,
      height = 103,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0.03125, -0.882815 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-04.png",
      line_length = 8,
      width = 67,
      height = 130,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0.015625, -1.109375 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-03.png",
      line_length = 8,
      width = 74,
      height = 117,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0.046875, -0.984375 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-02.png",
      line_length = 8,
      width = 74,
      height = 114,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0.0078125, -0.96875 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-01.png",
      line_length = 8,
      width = 66,
      height = 119,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.0703125, -1.039065 }
    }
  }
  return fireutil.foreach(retval, function(tab)
    if tab.shift and tab.scale then tab.shift = { tab.shift[1] * tab.scale, tab.shift[2] * tab.scale } end
  end)
end

function fireutil.create_small_tree_flame_animations(opts)
  local fire_blend_mode = opts.blend_mode or "additive"
  local fire_animation_speed = opts.animation_speed or 0.5
  local fire_scale =  opts.scale or 1
  local fire_tint = {r=1,g=1,b=1,a=1}
  local fire_flags = { "compressed" }
  local retval =
  {
    {
      filename = "__base__/graphics/entity/fire-flame/tree-fire-flame-01-a.png",
      line_length = 8,
      width = 38,
      height = 110,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.03125, -1.5},
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags
    },
    {
      filename = "__base__/graphics/entity/fire-flame/tree-fire-flame-01-b.png",
      line_length = 8,
      width = 39,
      height = 111,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.078125, -1.51562},
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags
    },
    {
      filename = "__base__/graphics/entity/fire-flame/tree-fire-flame-01-c.png",
      line_length = 8,
      width = 44,
      height = 108,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.15625, -1.5},
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags
    },
    {
      filename = "__base__/graphics/entity/fire-flame/tree-fire-flame-03-a.png",
      line_length = 8,
      width = 38,
      height = 110,
      frame_count = 23,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.03125, -1.5},
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags
    },
    {
      filename = "__base__/graphics/entity/fire-flame/tree-fire-flame-03-b.png",
      line_length = 8,
      width = 34,
      height = 98,
      frame_count = 23,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.03125, -1.34375},
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags
    },
    {
      filename = "__base__/graphics/entity/fire-flame/tree-fire-flame-03-c.png",
      line_length = 8,
      width = 39,
      height = 111,
      frame_count = 23,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.078125, -1.51562},
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags
    }
  }

  return fireutil.foreach(retval, function(tab)
    if tab.shift and tab.scale then tab.shift = { tab.shift[1] * tab.scale, tab.shift[2] * tab.scale } end
  end)
end

function fireutil.create_burnt_patch_pictures()
  local base =
  {
    filename = "__base__/graphics/entity/fire-flame/burnt-patch.png",
    line_length = 3,
    width = 115,
    height = 56,
    frame_count = 9,
    axially_symmetrical = false,
    direction_count = 1,
    shift = {-0.09375, 0.125}
  }

  local variations = {}

  for y=1,(base.frame_count / base.line_length) do
    for x=1,base.line_length do
      table.insert(variations,
      {
        filename = base.filename,
        width = base.width,
        height = base.height,
        tint = base.tint,
        shift = base.shift,
        x = (x-1) * base.width,
        y = (y-1) * base.height
      })
    end
  end

  return variations
end

function fireutil.create_fire_smoke_source_pictures(scale, tint)
  return
  {
    {
      filename = "__base__/graphics/entity/fire-flame/fire-smoke-source-1.png",
      line_length = 8,
      width = 101,
      height = 138,
      frame_count = 31,
      scale = scale,
      shift = {-0.109375 * scale, -1.1875 * scale},
      animation_speed = 0.5,
      tint = tint
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-smoke-source-2.png",
      line_length = 8,
      width = 99,
      height = 138,
      frame_count = 31,
      scale = scale,
      shift = {-0.203125 * scale, -1.21875 * scale},
      animation_speed = 0.5,
      tint = tint
    }
  }
end

function fireutil.add_basic_fire_graphics_and_effects_definitions(fire)
  fire.flame_alpha = fire.flame_alpha or 0.35
  fire.flame_alpha_deviation = fire.flame_alpha_deviation or 0.05

  fire.add_fuel_cooldown = fire.add_fuel_cooldown or 10
  fire.fade_in_duration = fire.fade_in_duration or 30
  fire.fade_out_duration = fire.fade_out_duration or 30

  fire.burnt_patch_lifetime = fire.burnt_patch_lifetime or 1800

  fire.on_fuel_added_action = fire.on_fuel_added_action or
  {
    type = "direct",
    action_delivery =
    {
      type = "instant",
      target_effects =
      {
        {
          type = "create-trivial-smoke",
          smoke_name = "fire-smoke-on-adding-fuel",
          offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
          speed_from_center = 0.01
        }
      }
    }
  }

  fire.pictures = fire.pictures or fireutil.create_fire_pictures({ blend_mode = "normal", animation_speed = 1, scale = 0.5})

  fire.smoke_source_pictures = fire.smoke_source_pictures or fireutil.create_fire_smoke_source_pictures(1, nil)

  fire.burnt_patch_pictures = fire.burnt_patch_pictures or fireutil.create_burnt_patch_pictures()
  fire.burnt_patch_alpha_default = fire.burnt_patch_alpha_default or 0.4
  fire.burnt_patch_alpha_variations = fire.burnt_patch_alpha_variations or
  {
    { tile = "stone-path", alpha = 0.26 },
    { tile = "concrete", alpha = 0.24 }
  }

  fire.smoke = fire.smoke or
  {
    {
      name = "fire-smoke",
      deviation = {0.5, 0.5},
      frequency = 0.25 / 2,
      position = {0.0, -0.8},
      starting_vertical_speed = 0.05,
      starting_vertical_speed_deviation = 0.005,
      vertical_speed_slowdown = 0.99,
      starting_frame_deviation = 60,
      height = -0.5
    }
  }

  fire.light = fire.light or {intensity = 1, size = 20}

  fire.working_sound = fire.working_sound or
  {
    sound =
    {
      {
        filename = "__base__/sound/fire-1.ogg",
        volume = 0.7
      },
      {
        filename = "__base__/sound/fire-2.ogg",
        volume = 0.7
      }
    },
    match_volume_to_activity = true,
   --max_sounds_per_type = 3,
   --fade_in_ticks = 10,
   --fade_out_ticks = 90
  }

  return fire
end

return fireutil

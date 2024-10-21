require ("util")

local fireutil = {}

function fireutil.foreach(table_, fun_)
  for k, tab in pairs(table_) do
    fun_(tab)
  end
  return table_
end

function fireutil.create_fire_pictures(opts)
  local fire_blend_mode = opts.blend_mode or "normal"
  local fire_animation_speed1 = opts.animation_speed1 or 0.5
  local fire_animation_speed2 = opts.animation_speed2 or 0.9
  local fire_scale1 =  opts.scale1 or 0.55
  local fire_scale2 =  opts.scale2 or 0.35
  local fire_tint = {r=0.9,g=0.9,b=0.9,a=1}
  local fire_flags = nil
  local retval =
  {
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-01.png",
      line_length = 10,
      width = 84,
      height = 130,
      frame_count = 90,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed1,
      scale = fire_scale1,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0, -0.7 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-02.png",
      line_length = 10,
      width = 82,
      height = 106,
      frame_count = 90,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed1,
      scale = fire_scale1,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0, -0.7 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-03.png",
      line_length = 10,
      width = 84,
      height = 124,
      frame_count = 90,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed1,
      scale = fire_scale1,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0, -0.7 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-04.png",
      line_length = 10,
      width = 84,
      height = 94,
      frame_count = 90,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed1,
      scale = fire_scale1,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0, -0.25 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-01.png",
      line_length = 10,
      width = 84,
      height = 130,
      frame_count = 90,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed2,
      scale = fire_scale2,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0, -0.7 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-02.png",
      line_length = 10,
      width = 82,
      height = 106,
      frame_count = 90,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed2,
      scale = fire_scale2,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0, -0.7 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-03.png",
      line_length = 10,
      width = 84,
      height = 124,
      frame_count = 90,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed2,
      scale = fire_scale2,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0, -0.7 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-04.png",
      line_length = 10,
      width = 84,
      height = 94,
      frame_count = 90,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed2,
      scale = fire_scale2,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0, -0.25 }
    }
  }
  retval = fireutil.foreach(retval, function(tab)
    if tab.shift and tab.scale then tab.shift = { tab.shift[1] * tab.scale, tab.shift[2] * tab.scale } end
  end)
  for k, layer in pairs (retval) do
    retval[k] = util.draw_as_glow(layer)
  end
  return retval
end

function fireutil.create_small_tree_flame_animations()
  local fire_blend_mode = "normal"
  local fire_animation_speed1 = 0.5
  local fire_animation_speed2 = 0.9
  local fire_scale1 =  0.6
  local fire_scale2 =  0.4
  local fire_tint = {r=0.9,g=0.9,b=0.9,a=1}
  local retval =
  {
    {
      filename = "__base__/graphics/entity/fire-flame/tree-flame-01.png",
      line_length = 10,
      width = 82,
      height = 110,
      frame_count = 90,
      shift = {0, 0},
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed1,
      scale = fire_scale1,
      tint = fire_tint
    },
    {
      filename = "__base__/graphics/entity/fire-flame/tree-flame-02.png",
      line_length = 10,
      width = 82,
      height = 114,
      frame_count = 90,
      shift = {0, 0},
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed1,
      scale = fire_scale1,
      tint = fire_tint
    },
    {
      filename = "__base__/graphics/entity/fire-flame/tree-flame-01.png",
      line_length = 10,
      width = 82,
      height = 110,
      frame_count = 90,
      shift = {0, 0},
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed2,
      scale = fire_scale2,
      tint = fire_tint
    },
    {
      filename = "__base__/graphics/entity/fire-flame/tree-flame-02.png",
      line_length = 10,
      width = 82,
      height = 114,
      frame_count = 90,
      shift = {0, 0},
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed2,
      scale = fire_scale2,
      tint = fire_tint
    }
  }

  retval = fireutil.foreach(retval, function(tab)
    if tab.shift and tab.scale then tab.shift = { tab.shift[1] * tab.scale, tab.shift[2] * tab.scale } end
  end)

  for k, layer in pairs (retval) do
    retval[k] = util.draw_as_glow(layer)
  end
  return retval
end

function fireutil.create_burnt_patch_pictures()
  local base =
  {
    filename = "__base__/graphics/entity/fire-flame/burnt-patch.png",
    line_length = 3,
    width = 115,
    height = 56,
    frame_count = 9,
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
  fire.flame_alpha = fire.flame_alpha or 0.45
  fire.flame_alpha_deviation = fire.flame_alpha_deviation or 0.05

  fire.add_fuel_cooldown = fire.add_fuel_cooldown or 10
  fire.fade_in_duration = fire.fade_in_duration or 30
  fire.fade_out_duration = fire.fade_out_duration or 60

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

  fire.pictures = fire.pictures or fireutil.create_fire_pictures({})

  fire.smoke_source_pictures = fire.smoke_source_pictures or fireutil.create_fire_smoke_source_pictures(1, nil)

  fire.burnt_patch_pictures = fire.burnt_patch_pictures or fireutil.create_burnt_patch_pictures()
  fire.burnt_patch_alpha_default = fire.burnt_patch_alpha_default or 0.4
  fire.burnt_patch_alpha_variations = fire.burnt_patch_alpha_variations or
  {
    { tile = "stone-path", alpha = 0.26 },
    { tile = "concrete", alpha = 0.24 },
    -- "water", "deepwater", "water-green", "deepwater-green", "water-shallow", "water-mud", "water-wube"
    { tile = "water", alpha = 0 }, { tile = "deepwater", alpha = 0 },
    { tile = "water-green", alpha = 0 }, { tile = "deepwater-green", alpha = 0 },
    { tile = "water-shallow", alpha = 0 }, { tile = "water-mud", alpha = 0 }, { tile = "water-wube", alpha = 0 }
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

  fire.light = fire.light or util.table.deepcopy(fireutil.default_fire_light)

  fire.light_size_modifier_per_flame = 0.1
  fire.light_size_modifier_maximum = 3

  fire.working_sound = fire.working_sound or
  {
    sound = {category = "weapon", variations = sound_variations("__base__/sound/fire", 2, 0.7)},
    activate_sound = {category = "weapon", variations = sound_variations("__base__/sound/fight/fire-impact", 5, 0.9)},
  }

  return fire
end

fireutil.default_fire_light =
{
  intensity = 0.2,
  size = 8,
  color = {1, 0.85, 0.4},
  flicker_interval = 12,
  flicker_min_modifier = 0.9,
  flicker_max_modifier = 1.1
}

return fireutil

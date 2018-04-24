require "util"
local math3d = require "math3d"

local function make_color(r_,g_,b_,a_)
  return { r = r_ * a_, g = g_ * a_, b = b_ * a_, a = a_ }
end

local fireutil = {}

function fireutil.foreach(table_, fun_)
  for k, tab in pairs(table_) do fun_(tab) end
  return table_
end

function fireutil.flamethrower_turret_extension_animation(shft, opts)
  local m_line_length = 5
  local m_frame_count = 15
  local ret_layers = {
    -- diffuse
    {
      filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-extension.png",
      priority = "medium",
      frame_count = opts and opts.frame_count or m_frame_count,
      line_length = opts and opts.line_length or m_line_length,
      run_mode = opts and opts.run_mode or "forward",
      width = 78,
      height = 65,
      direction_count = 1,
      axially_symmetrical = false,
      shift = {0, -0.796875},
    },
    -- mask
    {
      filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-extension-mask.png",
      flags = { "mask" },
      frame_count = opts and opts.frame_count or m_frame_count,
      line_length = opts and opts.line_length or m_line_length,
      run_mode = opts and opts.run_mode or "forward",
      width = 74,
      height = 61,
      direction_count = 1,
      axially_symmetrical = false,
      shift = {0, -0.796875},
      apply_runtime_tint = true
    },
    -- shadow
    {
      filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-extension-shadow.png",
      frame_count = opts and opts.frame_count or m_frame_count,
      line_length = opts and opts.line_length or m_line_length,
      run_mode = opts and opts.run_mode or "forward",
      width = 91,
      height = 56,
      direction_count = 1,
      axially_symmetrical = false,
      shift = {1.04688, 0},
      draw_as_shadow = true, 
    }
  }
  
  local yoffsets = { north = 0, east = 3, south = 2, west = 1 }
  local m_lines = m_frame_count / m_line_length
  
  return { layers = fireutil.foreach(ret_layers, function(tab)
    if tab.shift then tab.shift = { tab.shift[1] + shft[1], tab.shift[2] + shft[2] } end
    if tab.height then tab.y = tab.height * m_lines * yoffsets[opts.direction] end
  end) }
end

fireutil.turret_gun_shift = {
  north = {0, -0.3125},
  east = {0.625, 0.3125},
  south = {0,  0.625},
  west = { -0.46875, 0.3125},
}

fireutil.turret_model_info = {
  tilt_pivot = { -1.68551, 0, 2.35439 },
  gun_tip_lowered = { 4.27735, 0, 3.97644 },
  gun_tip_raised = { 2.2515, 0, 7.10942 },
  units_per_tile = 4,
}

fireutil.gun_center_base = math3d.vector2.sub({0,  -0.725}, fireutil.turret_gun_shift.south)

function fireutil.flamethrower_turret_preparing_muzzle_animation(opts)
  opts.frame_count = opts.frame_count or 15
  opts.run_mode = opts.run_mode or "forward"
  assert(opts.orientation_count)
  
  local model = fireutil.turret_model_info
  local angle_raised = -math3d.vector3.angle({1, 0, 0}, math3d.vector3.sub(model.gun_tip_raised, model.tilt_pivot))
  local angle_lowered = -math3d.vector3.angle({1, 0, 0}, math3d.vector3.sub(model.gun_tip_lowered, model.tilt_pivot))
  local delta_angle = angle_raised - angle_lowered
  
  local generated_orientations = {}
  for r = 0, opts.orientation_count-1 do
    local phi = (r / opts.orientation_count - 0.25) * math.pi * 2
    local generated_frames = {}
    for i = 0, opts.frame_count-1 do
      local k = opts.run_mode == "backward" and (opts.frame_count - i - 1) or i
      local progress = opts.progress or (k / (opts.frame_count - 1))
      
      local matrix = math3d.matrix4x4
      local mat = matrix.compose({
        matrix.translation_vec3(math3d.vector3.mul(model.tilt_pivot, -1)),
        matrix.rotation_y(progress * delta_angle),
        matrix.translation_vec3(model.tilt_pivot),
        matrix.rotation_z(phi),
        matrix.scale(1 / model.units_per_tile, 1 / model.units_per_tile, -1 / model.units_per_tile)
      })
      
      local vec = math3d.matrix4x4.mul_vec3(mat, model.gun_tip_lowered)
      table.insert(generated_frames, math3d.project_vec3(vec))
    end
    local direction_data = { frames = generated_frames }
    if (opts.layers and opts.layers[r]) then
      direction_data.render_layer = opts.layers[r]
    end
    table.insert(generated_orientations, direction_data)
  end
  
  return 
  {
    rotations = generated_orientations,
    direction_shift = fireutil.turret_gun_shift,
  }
end

function fireutil.flamethrower_turret_extension(opts)
  local set_direction = function (opts, dir)
    opts.direction = dir
    return opts
  end

  return {
    north = fireutil.flamethrower_turret_extension_animation(fireutil.turret_gun_shift.north, set_direction(opts, "north")),
    east = fireutil.flamethrower_turret_extension_animation(fireutil.turret_gun_shift.east, set_direction(opts, "east")),
    south = fireutil.flamethrower_turret_extension_animation(fireutil.turret_gun_shift.south, set_direction(opts, "south")),
    west = fireutil.flamethrower_turret_extension_animation(fireutil.turret_gun_shift.west, set_direction(opts, "west")),
  } 
end

function fireutil.flamethrower_turret_prepared_animation(shft, opts)
  local diffuse_layer = 
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun.png",
    priority = "medium",
    counterclockwise = true,
    line_length = 8,
    width = 78,
    height = 64,
    frame_count = 1,
    axially_symmetrical = false,
    direction_count = 64,
    shift = {0, -0.75},
  }
  local glow_layer = 
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-active.png",
    counterclockwise = true,
    line_length = 8,
    width = 78,
    height = 63,
    frame_count = 1,
    axially_symmetrical = false,
    direction_count = 64,
    shift = {0, -0.765625},
    tint = make_color(1, 1, 1, 0.5),
    blend_mode = "additive",
  }
  local mask_layer = 
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-mask.png",
    flags = { "mask" },
    counterclockwise = true,
    line_length = 8,
    width = 72,
    height = 57,
    frame_count = 1,
    axially_symmetrical = false,
    direction_count = 64,
    shift = {0, -0.859375},
    apply_runtime_tint = true,
  }
  local shadow_layer = 
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-shadow.png",
    counterclockwise = true,
    line_length = 8,
    width = 91,
    height = 57,
    frame_count = 1,
    axially_symmetrical = false,
    direction_count = 64,
    shift = {0.984375, 0.015625},
    draw_as_shadow = true,
  }
  
  local ret_layers = opts and opts.attacking and { diffuse_layer, glow_layer, mask_layer, shadow_layer }
                                             or  { diffuse_layer, mask_layer, shadow_layer }
  
  return { layers = fireutil.foreach(ret_layers, function(tab)
    if tab.shift then tab.shift = { tab.shift[1] + shft[1], tab.shift[2] + shft[2] } end
  end) }
end

function fireutil.flamethrower_prepared_animation(opts)
  return {
    north = fireutil.flamethrower_turret_prepared_animation(fireutil.turret_gun_shift.north, opts),
    east = fireutil.flamethrower_turret_prepared_animation(fireutil.turret_gun_shift.east, opts),
    south = fireutil.flamethrower_turret_prepared_animation(fireutil.turret_gun_shift.south, opts),
    west = fireutil.flamethrower_turret_prepared_animation(fireutil.turret_gun_shift.west, opts),
  }
end

function fireutil.create_fire_pictures(opts)
  local fire_blend_mode = opts.blend_mode or "additive"
  local fire_animation_speed = opts.animation_speed or 0.5
  local fire_scale =  opts.scale or 1
  local fire_tint = {r=1,g=1,b=1,a=1}
  local fire_flags = { "compressed" }
  local retval = {
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
    },
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
  local retval = {
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

local function set_shift(shift, tab)
  tab.shift = shift
  if tab.hr_version then
    tab.hr_version.shift = shift
  end
  return tab
end

function fireutil.flamethrower_turret_pipepictures()
  local pipe_sprites = pipepictures()
  
  return {
    north = set_shift({0, 1}, util.table.deepcopy(pipe_sprites.straight_vertical)),
    south = set_shift({0, -1}, util.table.deepcopy(pipe_sprites.straight_vertical)),
    east = set_shift({-1, 0}, util.table.deepcopy(pipe_sprites.straight_horizontal)),
    west = set_shift({1, 0}, util.table.deepcopy(pipe_sprites.straight_horizontal))
  }
end

function fireutil.create_burnt_patch_pictures()
  local base = {
    filename = "__base__/graphics/entity/fire-flame/burnt-patch.png",
    line_length = 3,
    width = 115,
    height = 56,
    frame_count = 9,
    axially_symmetrical = false,
    direction_count = 1,
    shift = {-0.09375, 0.125},
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
        y = (y-1) * base.height,
      })
    end
  end

  return variations
end

data:extend({
{
  type = "fire",
  name = "fire-flame",
  flags = {"placeable-off-grid", "not-on-map"},
  damage_per_tick = {amount = 13 / 60, type = "fire"},
  maximum_damage_multiplier = 6,
  damage_multiplier_increase_per_added_fuel = 1,
  damage_multiplier_decrease_per_tick = 0.005,
  
  spawn_entity = "fire-flame-on-tree",
  
  spread_delay = 300,
  spread_delay_deviation = 180,
  maximum_spread_count = 100,
  
  flame_alpha = 0.35,
  flame_alpha_deviation = 0.05,
  
  emissions_per_tick = 0.005,
  
  add_fuel_cooldown = 10,
  fade_in_duration = 30,
  fade_out_duration = 30,
  
  initial_lifetime = 120,
  lifetime_increase_by = 150,
  lifetime_increase_cooldown = 4,
  maximum_lifetime = 1800,
  delay_between_initial_flames = 10,
  --initial_flame_count = 1,
  burnt_patch_lifetime = 1800,
  
  on_fuel_added_action =
  {
    type = "direct",
    action_delivery =
    {
      type = "instant",
      target_effects =
      {
        {
          type = "create-smoke",
          entity_name = "fire-smoke-on-adding-fuel",
          -- speed = {-0.03, 0},
          -- speed_multiplier = 0.99,
          -- speed_multiplier_deviation = 1.1,
          offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
          speed_from_center = 0.01
        }
      }
    }
  },
  
  pictures = fireutil.create_fire_pictures({ blend_mode = "normal", animation_speed = 1, scale = 0.5}),
  
  smoke_source_pictures = 
  {
    { 
      filename = "__base__/graphics/entity/fire-flame/fire-smoke-source-1.png",
      line_length = 8,
      width = 101,
      height = 138,
      frame_count = 31,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.109375, -1.1875},
      animation_speed = 0.5,
    },
    { 
      filename = "__base__/graphics/entity/fire-flame/fire-smoke-source-2.png",
      line_length = 8,
      width = 99,
      height = 138,
      frame_count = 31,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.203125, -1.21875},
      animation_speed = 0.5,
    },
  },
  
  burnt_patch_pictures = fireutil.create_burnt_patch_pictures(),
  burnt_patch_alpha_default = 0.4,
  burnt_patch_alpha_variations = {
   -- { tile = "grass", alpha = 0.4 },
   -- { tile = "grass-medium", alpha = 0.4 },
    { tile = "grass-dry", alpha = 0.45 },
    { tile = "dirt", alpha = 0.3 },
    { tile = "dirt-dark", alpha = 0.35 },
    { tile = "sand", alpha = 0.24 },
    { tile = "sand-dark", alpha = 0.28 },
    { tile = "stone-path", alpha = 0.26 },
    { tile = "concrete", alpha = 0.24 },
  },

  smoke =
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
      height = -0.5,
    }
  },
 
  light = {intensity = 1, size = 20},
  
  working_sound =
  {
    sound = { filename = "__base__/sound/furnace.ogg" },
    max_sounds_per_type = 3
  },	
  
}})


data:extend({
{
  type = "fire",
  name = "fire-flame-on-tree",
  flags = {"placeable-off-grid", "not-on-map"},

  damage_per_tick = {amount = 35 / 60, type = "fire"},
  
  spawn_entity = "fire-flame-on-tree",
  maximum_spread_count = 100,
  
  spread_delay = 300,
  spread_delay_deviation = 180,
  flame_alpha = 0.35,
  flame_alpha_deviation = 0.05,
  
  tree_dying_factor = 0.8,
  emissions_per_tick = 0.005,
  
  fade_in_duration = 120,
  fade_out_duration = 100,
  smoke_fade_in_duration = 100,
  smoke_fade_out_duration = 130,
  delay_between_initial_flames = 20,
  
  small_tree_fire_pictures = fireutil.create_small_tree_flame_animations({ blend_mode = "additive", animation_speed = 0.5, scale = 0.7 * 0.75 }),
  
  pictures = fireutil.create_fire_pictures({ blend_mode = "additive", animation_speed = 1, scale = 0.5 * 1.25}),
  
  smoke_source_pictures = 
  {
    { 
      filename = "__base__/graphics/entity/fire-flame/fire-smoke-source-1.png",
      line_length = 8,
      width = 101,
      height = 138,
      frame_count = 31,
      axially_symmetrical = false,
      direction_count = 1,
      scale = 0.6,
      shift = {-0.109375 * 0.6, -1.1875 * 0.6},
      animation_speed = 0.5,
      tint = make_color(1,1,1, 0.75),
    },
    { 
      filename = "__base__/graphics/entity/fire-flame/fire-smoke-source-2.png",
      line_length = 8,
      width = 99,
      height = 138,
      frame_count = 31,
      axially_symmetrical = false,
      direction_count = 1,
      scale = 0.6,
      shift = {-0.203125 * 0.6, -1.21875 * 0.6},
      animation_speed = 0.5,
      tint = make_color(1,1,1, 0.75),
    },
  },
  
  smoke =
  {
    {
      name = "fire-smoke-without-glow",
      deviation = {0.5, 0.5},
      frequency = 0.25 / 2,
      position = {0.0, -0.8},
      starting_vertical_speed = 0.008,
      starting_vertical_speed_deviation = 0.05,
      starting_frame_deviation = 60,
      height = -0.5,
    }
  },
   
  light = {intensity = 1, size = 20},

  working_sound =
  {
    sound = { filename = "__base__/sound/furnace.ogg" },
    max_sounds_per_type = 3
  },	
}})

local indicator_pictures =
{
  north = { 
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-led-indicator-north.png",
    line_length = 2,
    width = 5,
    height = 9,
    frame_count = 2,
    axially_symmetrical = false,
    direction_count = 1,
    shift = {0.234375, 0.640625},
  },
  east = { 
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-led-indicator-east.png",
    line_length = 2,
    width = 10,
    height = 6,
    frame_count = 2,
    axially_symmetrical = false,
    direction_count = 1,
    shift = {-1.03125, -0.15625},
  },
  south = { 
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-led-indicator-south.png",
    line_length = 2,
    width = 5,
    height = 8,
    frame_count = 2,
    axially_symmetrical = false,
    direction_count = 1,
    shift = {-0.234375, -1.375},
  },
  west = { 
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-led-indicator-west.png",
    line_length = 2,
    width = 10,
    height = 6,
    frame_count = 2,
    axially_symmetrical = false,
    direction_count = 1,
    shift = {1.03125, -0.46875},
  },
}

data:extend({
  {
    type = "fluid-turret",
    name = "flamethrower-turret",
    icon = "__base__/graphics/icons/flamethrower-turret.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "flamethrower-turret"},
    max_health = 1400,
    corpse = "medium-remnants",
    collision_box = {{-0.7, -1.2 }, {0.7, 1.2}},
    selection_box = {{-1, -1.5 }, {1, 1.5}},
    rotation_speed = 0.015,
    preparing_speed = 0.08,
    folding_speed = 0.08,
    attacking_speed = 1,
    ending_attack_speed = 0.2,
    dying_explosion = "medium-explosion",
    inventory_size = 1,
    automated_ammo_count = 10,
    attacking_animation_fade_out = 10,
    turret_base_has_direction = true,
    
    resistances =
    {
      {
        type = "fire",
        percent = 100,
      },
    },
    
    fluid_box = 
    {
      --production_type = "input",
      secondary_draw_order = 0,
      render_layer = "lower-object",
      pipe_picture = fireutil.flamethrower_turret_pipepictures(),
      pipe_covers = pipecoverspictures(),
      base_area = 1,
      pipe_connections = {
        { position = {-1.5, 1.0} },
        { position = {1.5, 1.0} }
      }
    },
    fluid_buffer_size = 100,
    fluid_buffer_input_flow = 250 / 60 / 5, -- 5s to fill the buffer
    activation_buffer_ratio = 0.25,
    
    folded_animation = fireutil.flamethrower_turret_extension({frame_count = 1, line_length = 1}),
        
    preparing_animation = fireutil.flamethrower_turret_extension({}),
    prepared_animation = fireutil.flamethrower_prepared_animation(),   
    attacking_animation = fireutil.flamethrower_prepared_animation({attacking = true}), 
    ending_attack_animation = fireutil.flamethrower_prepared_animation({attacking = true}), 
    
    folding_animation = fireutil.flamethrower_turret_extension({ run_mode = "backward" }),     
    
    not_enough_fuel_indicator_picture = indicator_pictures,    
    enough_fuel_indicator_picture = fireutil.foreach(util.table.deepcopy(indicator_pictures), function (tab) tab.x = tab.width end),
    indicator_light = { intensity = 0.8, size = 0.9 },
    
    gun_animation_render_layer = "object",
    gun_animation_secondary_draw_order = 1,
    base_picture_render_layer = "lower-object",
    base_picture_secondary_draw_order = 1,
    base_picture =
    {
      north = {
        layers = {
          -- diffuse
          {
            filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-north.png",
            line_length = 1,
            width = 69,
            height = 86,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = {-0.015625, 0.34375},
          },
          -- mask
          {
            filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-north-mask.png",
            flags = { "mask" },
            line_length = 1,
            width = 37,
            height = 37,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = {-0.015625, 1.04688},
            apply_runtime_tint = true,
          },
          -- shadow
          {
            filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-north-shadow.png",
            draw_as_shadow = true, 
            line_length = 1,
            width = 71,
            height = 78,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = {0.140625, 0.46875},
          },
        }
      },
      east = {
        layers = {
          -- diffuse
          {
            filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-east.png",
            line_length = 1,
            width = 95,
            height = 60,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = {-0.140625, 0.125},
          },
          -- mask
          {
            filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-east-mask.png",
            flags = { "mask" },
            apply_runtime_tint = true,
            line_length = 1,
            width = 33,
            height = 42,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = {-1.01563, 0.03125},
          },
          -- shadow
          {
            filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-east-shadow.png",
            draw_as_shadow = true, 
            line_length = 1,
            width = 100,
            height = 44,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = {0.03125, 0.28125},
          },
        }
      },
      south = {
        layers = {
          -- diffuse
          {
            filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-south.png",
            line_length = 1,
            width = 70,
            height = 90,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = {0, -0.15625},
          },
          -- mask
          {
            filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-south-mask.png",
            flags = { "mask" },
            apply_runtime_tint = true,
            line_length = 1,
            width = 37,
            height = 37,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = {0.015625, -0.953125},
          },
          -- shadow
          {
            filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-south-shadow.png",
            draw_as_shadow = true,
            line_length = 1,
            width = 67,
            height = 70,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = {0.140625, -0.0625},
          },
        }

      },
      west = {
        layers = {
          -- diffuse
          {
            filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-west.png",
            line_length = 1,
            width = 93,
            height = 59,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = {0.140625, 0.203125},
          },
          -- mask
          {
            filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-west-mask.png",
            flags = { "mask" },
            apply_runtime_tint = true,
            line_length = 1,
            width = 33,
            height = 40,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = {1.01563, 0.09375},
          },
          -- shadow
          {
            filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-west-shadow.png",
            draw_as_shadow = true, 
            line_length = 1,
            width = 103,
            height = 45,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = {0.484375, 0.296875},
          },
        }
      },
    },
    
    muzzle_animation = 
    { 
      filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-muzzle-fire.png",
      line_length = 8,
      width = 17,
      height = 41,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "additive",
      scale = 0.5,
      shift = {0.015625 * 0.5, -0.546875 * 0.5 + 0.05},
    },
    muzzle_light = {intensity = 0.7, size = 3},
    
    folded_muzzle_animation_shift          = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 1,  orientation_count = 4, progress = 0, layers = {[0] = "object"} },
    preparing_muzzle_animation_shift       = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 15, orientation_count = 4, layers = {[0] = "object"} },
    prepared_muzzle_animation_shift        = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 1, orientation_count =  64, progress = 1},
    --starting_attack_muzzle_animation_shift = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 1,  orientation_count = 64, progress = 1},
    attacking_muzzle_animation_shift       = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 1,  orientation_count = 64, progress = 1},
    ending_attack_muzzle_animation_shift   = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 1,  orientation_count = 64, progress = 1},
    folding_muzzle_animation_shift         = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 15, orientation_count = 4, run_mode = "backward", layers = {[0] = "object"}},
    
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

    prepare_range = 35,
    shoot_in_prepare_state = false,
    attack_parameters =
    {
      type = "stream",
      ammo_category = "flamethrower",
      cooldown = 4,
      range = 30,
      min_range = 6,
      
      turn_range = 1.0/3.0,
      fire_penalty = 15,
      
      fluids = { 
        {type = "crude-oil"}, 
        {type = "heavy-oil", damage_modifier = 1.05}, 
        {type = "light-oil", damage_modifier = 1.1} 
      },
      fluid_consumption = 0.2,
      
      gun_center_shift = {
        north = math3d.vector2.add(fireutil.gun_center_base, fireutil.turret_gun_shift.north), 
        east = math3d.vector2.add(fireutil.gun_center_base, fireutil.turret_gun_shift.east),
        south = math3d.vector2.add(fireutil.gun_center_base, fireutil.turret_gun_shift.south), 
        west = math3d.vector2.add(fireutil.gun_center_base, fireutil.turret_gun_shift.west) 
      },
      gun_barrel_length = 0.4,
      
      ammo_type =
      {
        category = "flamethrower",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "flamethrower-fire-stream",
            duration = 160,
            source_offset = {0.15, -0.5},
          }
        }
      },
      
      cyclic_sound =
      {
        begin_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-start.ogg",
            volume = 0.7
          }
        },
        middle_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-mid.ogg",
            volume = 0.7
          }
        },
        end_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-end.ogg",
            volume = 0.7
          }
        }
      }
    }, -- {0,  0.625}
    call_for_help_radius = 40
  },
})

local function firesmoke(opts)
  return {
    type = "smoke",
    name = opts.name,
    flags = {"not-on-map"},
    duration = opts.duration or 600,
    fade_in_duration = opts.fade_in_duration or 0,
    fade_away_duration = opts.fade_away_duration or 600,
    spread_duration = opts.spread_duration or 600,
    start_scale = opts.start_scale or 0.20,
    end_scale = opts.end_scale or 1.0,
    color = opts.color,
    cyclic = true,
    affected_by_wind = opts.affected_by_wind or true,
    animation = opts.animation or
    {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.53125, -0.4375},
      priority = "high",
      flags = { "smoke" },
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png"
    },
    glow_animation = opts.glow_animation,
    glow_fade_away_duration = opts.glow_fade_away_duration,
    vertical_speed_slowdown = opts.vertical_speed_slowdown
  }
end

data:extend(
{
  firesmoke
  {
    name = "fire-smoke", 
    color = {r=0.4, g=0.4, b=0.4, a=0.25},
    start_scale = 0.5,
    end_scale = 1,
    duration = 300,
    spread_delay = 120,
    fade_away_duration = 90,
    fade_in_duration = 60,
    animation = 
    {
      filename = "__base__/graphics/entity/fire-smoke/fire-smoke.png",
      flags = { "smoke" },
      line_length = 8,
      width = 253,
      height = 210,
      frame_count = 60,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.265625, -0.09375},
      priority = "high",
      animation_speed = 0.25,
    },
    glow_animation = 
    {
      filename = "__base__/graphics/entity/fire-smoke/fire-smoke-glow.png",
      flags = { "smoke" },
      blend_mode = "additive",
      line_length = 8,
      width = 253,
      height = 152,
      frame_count = 60,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.265625, 0.8125},
      priority = "high",
      animation_speed = 0.25,
    },
    glow_fade_away_duration = 70
  },
  
  firesmoke
  {
    name = "fire-smoke-without-glow", 
    color = make_color(1,1,1, 0.25),
    start_scale = 0.5,
    end_scale = 1,
    duration = 300,
    spread_delay = 120,
    fade_away_duration = 90,
    fade_in_duration = 60,
    animation = 
    {
      filename = "__base__/graphics/entity/fire-smoke/fire-smoke.png",
      flags = { "smoke" },
      line_length = 8,
      width = 253,
      height = 210,
      frame_count = 60,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.265625, -0.09375},
      priority = "high",
      animation_speed = 0.25,
    },
  },
  
  firesmoke
  {
    name = "soft-fire-smoke", 
    color = make_color(0.3, 0.3, 0.3, 0.1),
    start_scale = 0.5,
    end_scale = 1.2,
    duration = 300,
    spread_delay = 120,
    fade_away_duration = 60,
  }, 
  firesmoke
  {
    name = "fire-smoke-on-adding-fuel", 
    start_scale = 0.5,
    end_scale = 0.7,
    duration = 300,
    spread_delay = 120,
    fade_away_duration = 60,
    fade_in_duration = 60,
    animation = 
    {
       filename = "__base__/graphics/entity/fire-smoke/fire-smoke.png",
       flags = { "smoke" },
       line_length = 8,
       width = 253,
       height = 210,
       frame_count = 60,
       axially_symmetrical = false,
       direction_count = 1,
       shift = {-0.265625, -0.09375},
       priority = "high",
       animation_speed = 0.25,
    }
  },
}
)

data:extend(
{
  {
    type = "sticker",
    name = "fire-sticker",
    flags = {"not-on-map"},
    
    animation = 
    { 
      filename = "__base__/graphics/entity/fire-flame/fire-flame-13.png",
      line_length = 8,
      width = 60,
      height = 118,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.2,
      tint = { r = 0.5, g = 0.5, b = 0.5, a = 0.18 }, --{ r = 1, g = 1, b = 1, a = 0.35 },
      shift = math3d.vector2.mul({-0.078125, -1.8125}, 0.1),
    },
    
    duration_in_ticks = 30 * 60,
    target_movement_modifier = 0.8,
    damage_per_tick = { amount = 100 / 60, type = "fire" },
    spread_fire_entity = "fire-flame-on-tree",  
    fire_spread_cooldown = 30,
    fire_spread_radius = 0.75,
  },
})

--- ******************************************************************
--- ******************************************************************
--- ******************************************************************


data:extend(
{
  {
    type = "stream",
    name = "flamethrower-fire-stream",
    flags = {"not-on-map"},
    stream_light = {intensity = 1, size = 4},
    ground_light = {intensity = 0.8, size = 4},
  
    smoke_sources =
    {
      {
        name = "soft-fire-smoke",
        frequency = 0.05, --0.25,
        position = {0.0, 0}, -- -0.8},
        starting_frame_deviation = 60
      }
    },
    particle_buffer_size = 90,
    particle_spawn_interval = 2,
    particle_spawn_timeout = 8,
    particle_vertical_acceleration = 0.005 * 0.60,
    particle_horizontal_speed = 0.2* 0.75 * 1.5,
    particle_horizontal_speed_deviation = 0.005 * 0.70,
    particle_start_alpha = 0.5,
    particle_end_alpha = 1,
    particle_start_scale = 0.2,
    particle_loop_frame_count = 3,
    particle_fade_out_threshold = 0.9,
    particle_loop_exit_threshold = 0.25,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-fire",
              entity_name = "fire-flame"
            }
          }
        }
      },
      {
        type = "area",
        perimeter = 2.5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-sticker",
              sticker = "fire-sticker"
            },
            {
              type = "damage",
              damage = { amount = 3, type = "fire" },
              apply_damage_to_trees = false
            }
          }
        }
      }
    },
    
    spine_animation = 
    { 
      filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-fire-stream-spine.png",
      blend_mode = "additive",
      --tint = {r=1, g=1, b=1, a=0.5},
      line_length = 4,
      width = 32,
      height = 18,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      animation_speed = 2,
      shift = {0, 0},
    },
    
    shadow =
    {
      filename = "__base__/graphics/entity/acid-projectile-purple/acid-projectile-purple-shadow.png",
      line_length = 5,
      width = 28,
      height = 16,
      frame_count = 33,
      priority = "high",
      shift = {-0.09, 0.395}
    },
    
    particle =
    {
      filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-explosion.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      frame_count = 32,
      line_length = 8
    },
  }
}
)

data:extend(
{
  {
    type = "stream",
    name = "handheld-flamethrower-fire-stream",
    flags = {"not-on-map"},
    working_sound_disabled =
    {
      {
        filename = "__base__/sound/fight/electric-beam.ogg",
        volume = 0.7
      }
    },
    
    smoke_sources =
    {
      {
        name = "soft-fire-smoke",
        frequency = 0.05, --0.25,
        position = {0.0, 0}, -- -0.8},
        starting_frame_deviation = 60
      }
    },
  
    stream_light = {intensity = 1, size = 4 * 0.8},
    ground_light = {intensity = 0.8, size = 4 * 0.8},
  
    particle_buffer_size = 65,
    particle_spawn_interval = 2,
    particle_spawn_timeout = 2,
    particle_vertical_acceleration = 0.005 * 0.6,
    particle_horizontal_speed = 0.25,
    particle_horizontal_speed_deviation = 0.0035,
    particle_start_alpha = 0.5,
    particle_end_alpha = 1,
    particle_start_scale = 0.2,
    particle_loop_frame_count = 3,
    particle_fade_out_threshold = 0.9,
    particle_loop_exit_threshold = 0.25,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-fire",
              entity_name = "fire-flame",
              initial_ground_flame_count = 2,
            },
          }
        }
      },
      {
        type = "area",
        perimeter = 2.5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-sticker",
              sticker = "fire-sticker"
            },
            {
              type = "damage",
              damage = { amount = 2, type = "fire" },
              apply_damage_to_trees = false
            }
          }
        }
      }
    },
    
    spine_animation = 
    { 
      filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-fire-stream-spine.png",
      blend_mode = "additive",
      --tint = {r=1, g=1, b=1, a=0.5},
      line_length = 4,
      width = 32,
      height = 18,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      animation_speed = 2,
      scale = 0.75,
      shift = {0, 0},
    },
    
    shadow =
    {
      filename = "__base__/graphics/entity/acid-projectile-purple/acid-projectile-purple-shadow.png",
      line_length = 5,
      width = 28,
      height = 16,
      frame_count = 33,
      priority = "high",
      scale = 0.5,
      shift = {-0.09 * 0.5, 0.395 * 0.5}
    },
    
    particle =
    {
      filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-explosion.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      frame_count = 32,
      line_length = 8,
      scale = 0.8,
    },
  },
  {
    type = "stream",
    name = "tank-flamethrower-fire-stream",
    flags = {"not-on-map"},
    working_sound_disabled =
    {
      {
        filename = "__base__/sound/fight/electric-beam.ogg",
        volume = 0.7
      }
    },
    
    smoke_sources =
    {
      {
        name = "soft-fire-smoke",
        frequency = 0.05, --0.25,
        position = {0.0, 0}, -- -0.8},
        starting_frame_deviation = 60
      }
    },
  
    stream_light = {intensity = 1, size = 4 * 0.8},
    ground_light = {intensity = 0.8, size = 4 * 0.8},
  
    particle_buffer_size = 65,
    particle_spawn_interval = 2,
    particle_spawn_timeout = 2,
    particle_vertical_acceleration = 0.005 * 0.3,
    particle_horizontal_speed = 0.45,
    particle_horizontal_speed_deviation = 0.0035,
    particle_start_alpha = 0.5,
    particle_end_alpha = 1,
    particle_start_scale = 0.5,
    particle_loop_frame_count = 3,
    particle_fade_out_threshold = 0.9,
    particle_loop_exit_threshold = 0.25,
    action =
    {
      {
        type = "area",
        perimeter = 4,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "damage",
              damage = { amount = 7, type = "fire" },
              apply_damage_to_trees = true
            }
          }
        }
      }
    },
    
    spine_animation = 
    { 
      filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-fire-stream-spine.png",
      blend_mode = "additive",
      --tint = {r=1, g=1, b=1, a=0.5},
      line_length = 4,
      width = 32,
      height = 18,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      animation_speed = 2,
      scale = 1.40625,
      shift = {0, 0},
    },
    
    shadow =
    {
      filename = "__base__/graphics/entity/acid-projectile-purple/acid-projectile-purple-shadow.png",
      line_length = 5,
      width = 28,
      height = 16,
      frame_count = 33,
      priority = "high",
      scale = 0.9375,
      shift = {-0.09 * 0.5, 0.395 * 0.5}
    },
    
    particle =
    {
      filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-explosion.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      frame_count = 32,
      line_length = 8,
      scale = 1.5,
    },
  }
}
)

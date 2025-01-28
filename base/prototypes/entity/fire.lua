require "util"
require ("circuit-connector-sprites")
local math3d = require "math3d"
local sounds = require("prototypes.entity.sounds")
local fireutil = require("prototypes.fire-util")

function fireutil.flamethrower_turret_extension_animation(shft, opts)
  local m_line_length = 5
  local m_frame_count = 15
  local ret_layers =
  {
    -- diffuse
    {
      filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-extension.png",
      priority = "medium",
      frame_count = opts and opts.frame_count or m_frame_count,
      line_length = opts and opts.line_length or m_line_length,
      run_mode = opts and opts.run_mode or "forward",
      width = 152,
      height = 128,
      direction_count = 1,
      shift = util.by_pixel(0, -26),
      scale = 0.5
    },
    -- mask
    {
      filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-extension-mask.png",
      flags = { "mask" },
      frame_count = opts and opts.frame_count or m_frame_count,
      line_length = opts and opts.line_length or m_line_length,
      run_mode = opts and opts.run_mode or "forward",
      width = 144,
      height = 120,
      direction_count = 1,
      shift = util.by_pixel(0, -26),
      apply_runtime_tint = true,
      scale = 0.5
    },
    -- shadow
    {
      filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-extension-shadow.png",
      frame_count = opts and opts.frame_count or m_frame_count,
      line_length = opts and opts.line_length or m_line_length,
      run_mode = opts and opts.run_mode or "forward",
      width = 180,
      height = 114,
      direction_count = 1,
      shift = util.by_pixel(33, -1),
      draw_as_shadow = true,
      scale = 0.5
    }
  }

  local yoffsets = { north = 0, east = 3, south = 2, west = 1 }
  local m_lines = m_frame_count / m_line_length

  return { layers = fireutil.foreach(ret_layers, function(tab)
    if tab.shift then tab.shift = { tab.shift[1] + shft[1], tab.shift[2] + shft[2] } end
    if tab.height then tab.y = tab.height * m_lines * yoffsets[opts.direction] end
  end) }
end

fireutil.turret_gun_shift =
{
  north = util.by_pixel(0.0, -6.0),
  east = util.by_pixel(18.5, 9.5),
  south = util.by_pixel(0.0, 19.0),
  west = util.by_pixel(-12.0, 5.5)
}

fireutil.turret_model_info =
{
  tilt_pivot = { -1.68551, 0, 2.35439 },
  gun_tip_lowered = { 4.27735, 0, 3.97644 },
  gun_tip_raised = { 2.2515, 0, 7.10942 },
  units_per_tile = 4
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
    direction_shift = fireutil.turret_gun_shift
  }
end

function fireutil.flamethrower_turret_extension(opts)
  local set_direction = function (opts, dir)
    opts.direction = dir
    return opts
  end

  return
  {
    north = fireutil.flamethrower_turret_extension_animation(fireutil.turret_gun_shift.north, set_direction(opts, "north")),
    east = fireutil.flamethrower_turret_extension_animation(fireutil.turret_gun_shift.east, set_direction(opts, "east")),
    south = fireutil.flamethrower_turret_extension_animation(fireutil.turret_gun_shift.south, set_direction(opts, "south")),
    west = fireutil.flamethrower_turret_extension_animation(fireutil.turret_gun_shift.west, set_direction(opts, "west"))
  }
end

function fireutil.flamethrower_turret_prepared_animation(shft, opts)
  local diffuse_layer =
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun.png",
    priority = "medium",
    counterclockwise = true,
    line_length = 8,
    width = 158,
    height = 128,
    direction_count = 64,
    shift = util.by_pixel(-1, -25),
    scale = 0.5
  }
  local glow_layer =
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-active.png",
    counterclockwise = true,
    line_length = 8,
    width = 158,
    height = 126,
    direction_count = 64,
    shift = util.by_pixel(-1, -25),
    tint = util.premul_color{1, 1, 1, 0.5},
    blend_mode = "additive",
    scale = 0.5
  }

  local glow_light_layer =
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-active.png",
    counterclockwise = true,
    line_length = 8,
    width = 158,
    height = 126,
    direction_count = 64,
    shift = util.by_pixel(-1, -25),
    tint = util.premul_color{1, 1, 1, 0.5},
    blend_mode = "additive",
    draw_as_light = true,
    scale = 0.5
  }

  local mask_layer =
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-mask.png",
    flags = { "mask" },
    counterclockwise = true,
    line_length = 8,
    width = 144,
    height = 112,
    direction_count = 64,
    shift = util.by_pixel(-1, -28),
    apply_runtime_tint = true,
    scale = 0.5
  }
  local shadow_layer =
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-shadow.png",
    counterclockwise = true,
    line_length = 8,
    width = 182,
    height = 116,
    direction_count = 64,
    shift = util.by_pixel(31, -1),
    draw_as_shadow = true,
    scale = 0.5
  }

  local ret_layers = opts and opts.attacking and { diffuse_layer, glow_layer, glow_light_layer, mask_layer, shadow_layer }
                                             or  { diffuse_layer, mask_layer, shadow_layer }

  return { layers = fireutil.foreach(ret_layers, function(tab)
    if tab.shift then tab.shift = { tab.shift[1] + shft[1], tab.shift[2] + shft[2] } end
  end) }
end

function fireutil.flamethrower_prepared_animation(opts)
  return
  {
    north = fireutil.flamethrower_turret_prepared_animation(fireutil.turret_gun_shift.north, opts),
    east = fireutil.flamethrower_turret_prepared_animation(fireutil.turret_gun_shift.east, opts),
    south = fireutil.flamethrower_turret_prepared_animation(fireutil.turret_gun_shift.south, opts),
    west = fireutil.flamethrower_turret_prepared_animation(fireutil.turret_gun_shift.west, opts)
  }
end

local function set_shift(shift, tab)
  tab.shift = shift
  return tab
end

function fireutil.flamethrower_turret_pipepictures()
  local pipe_sprites = pipepictures()

  return
  {
    north = set_shift({0, 1}, util.table.deepcopy(pipe_sprites.straight_vertical)),
    south = set_shift({0, -1}, util.table.deepcopy(pipe_sprites.straight_vertical)),
    east = set_shift({-1, 0}, util.table.deepcopy(pipe_sprites.straight_horizontal)),
    west = set_shift({1, 0}, util.table.deepcopy(pipe_sprites.straight_horizontal))
  }
end

data:extend({
fireutil.add_basic_fire_graphics_and_effects_definitions
{
  type = "fire",
  name = "fire-flame",
  flags = {"placeable-off-grid", "not-on-map"},
  hidden = true,
  damage_per_tick = {amount = 13 / 60, type = "fire"},
  maximum_damage_multiplier = 6,
  damage_multiplier_increase_per_added_fuel = 1,
  damage_multiplier_decrease_per_tick = 0.005,

  spawn_entity = "fire-flame-on-tree",

  spread_delay = 300,
  spread_delay_deviation = 180,
  maximum_spread_count = 100,

  emissions_per_second = { pollution = 0.005 },

  initial_lifetime = 120,
  lifetime_increase_by = 150,
  lifetime_increase_cooldown = 4,
  maximum_lifetime = 1800,
  delay_between_initial_flames = 10,
  --initial_flame_count = 1,

}})

data:extend({
{
  type = "fire",
  name = "fire-flame-on-tree",
  localised_name = {"entity-name.fire-flame"},
  flags = {"placeable-off-grid", "not-on-map"},
  hidden = true,
  damage_per_tick = {amount = 35 / 60, type = "fire"},

  spawn_entity = "fire-flame-on-tree",
  maximum_spread_count = 100,

  spread_delay = 300,
  spread_delay_deviation = 180,
  flame_alpha = 0.44,
  flame_alpha_deviation = 0.05,

  tree_dying_factor = 0.8,
  emissions_per_second = { pollution = 0.005 },

  fade_in_duration = 120,
  fade_out_duration = 100,
  smoke_fade_in_duration = 100,
  smoke_fade_out_duration = 130,
  delay_between_initial_flames = 20,

  small_tree_fire_pictures = fireutil.create_small_tree_flame_animations(),

  pictures = fireutil.create_fire_pictures({}),

  smoke_source_pictures = fireutil.create_fire_smoke_source_pictures(0.6, util.premul_color{1,1,1, 0.75}),

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
      height = -0.5
    }
  },

  light = util.table.deepcopy(fireutil.default_fire_light),

  working_sound =
  {
    sound = {category = "weapon", filename = "__base__/sound/fire-1.ogg"},
    max_sounds_per_prototype = 2
  }
}})

local indicator_pictures =
{
  north = util.draw_as_glow
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-led-indicator-north.png",
    width = 10,
    height = 18,
    shift = util.by_pixel(7, 20),
    scale = 0.5
  },
  east = util.draw_as_glow
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-led-indicator-east.png",
    width = 18,
    height = 8,
    shift = util.by_pixel(-33, -5),
    scale = 0.5
  },
  south = util.draw_as_glow
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-led-indicator-south.png",
    width = 8,
    height = 18,
    shift = util.by_pixel(-8, -45),
    scale = 0.5
  },
  west = util.draw_as_glow
  {
    filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-led-indicator-west.png",
    width = 20,
    height = 10,
    shift = util.by_pixel(32, -20),
    scale = 0.5
  }
}

data:extend({
  {
    type = "fluid-turret",
    name = "flamethrower-turret",
    icon = "__base__/graphics/icons/flamethrower-turret.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "flamethrower-turret"},
    fast_replaceable_group = "flamethrower-turret",
    max_health = 1400,
    corpse = "flamethrower-turret-remnants",
    collision_box = {{-0.7, -1.2 }, {0.7, 1.2}},
    selection_box = {{-1, -1.5 }, {1, 1.5}},
    rotation_speed = 0.015,
    preparing_speed = 0.08,
    open_sound = {filename = "__base__/sound/open-close/turret-open.ogg", volume = 0.6},
    close_sound = {filename = "__base__/sound/open-close/turret-close.ogg", volume = 0.6},
    preparing_sound = sounds.flamethrower_turret_activate,
    folding_sound = sounds.flamethrower_turret_deactivate,
    folding_speed = 0.08,
    attacking_speed = 1,
    ending_attack_speed = 0.2,
    dying_explosion = "medium-explosion",
    turret_base_has_direction = true,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },

    fluid_box =
    {
      production_type = "none", -- FluidTurret has its own logic
      secondary_draw_order = 0,
      render_layer = "lower-object",
      --pipe_picture = fireutil.flamethrower_turret_pipepictures(),
      pipe_covers = pipecoverspictures(),
      volume = 100,
      pipe_connections =
      {
        { direction = defines.direction.west, position = {-0.5, 1.0} },
        { direction = defines.direction.east, position = {0.5, 1.0} }
      }
    },
    fluid_buffer_size = 100,
    fluid_buffer_input_flow = 250 / 60 / 5, -- 5s to fill the buffer
    activation_buffer_ratio = 0.25,

    circuit_connector = circuit_connector_definitions["flamethrower-turret"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    folded_animation = fireutil.flamethrower_turret_extension({frame_count = 1, line_length = 1}),

    preparing_animation = fireutil.flamethrower_turret_extension({}),
    prepared_animation = fireutil.flamethrower_prepared_animation(),
    attacking_animation = fireutil.flamethrower_prepared_animation({attacking = true}),
    ending_attack_animation = fireutil.flamethrower_prepared_animation({attacking = true}),

    folding_animation = fireutil.flamethrower_turret_extension({ run_mode = "backward" }),

    not_enough_fuel_indicator_picture = indicator_pictures,
    not_enough_fuel_indicator_light = {intensity = 0.2, size = 1.5, color = {1, 0, 0}},
    enough_fuel_indicator_picture = fireutil.foreach(util.table.deepcopy(indicator_pictures), function (tab) tab.x = tab.width end),
    enough_fuel_indicator_light = {intensity = 0.2, size = 1.5, color = {0, 1, 0}},
    out_of_ammo_alert_icon =
    {
      filename = "__core__/graphics/icons/alerts/fuel-icon-red.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },

    gun_animation_render_layer = "object",
    gun_animation_secondary_draw_order = 1,
    graphics_set =
    {
      base_visualisation =
      {
        render_layer = "lower-object-above-shadow",
        secondary_draw_order = 1,
        animation =
        {
          north =
          {
            layers =
            {
              -- diffuse
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-north.png",
                line_length = 1,
                width = 158,
                height = 196,
                shift = util.by_pixel(-1, 13),
                scale = 0.5
              },
              -- mask
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-north-mask.png",
                flags = { "mask" },
                line_length = 1,
                width = 74,
                height = 70,
                shift = util.by_pixel(-1, 33),
                apply_runtime_tint = true,
                scale = 0.5
              },
              -- shadow
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-north-shadow.png",
                draw_as_shadow = true,
                line_length = 1,
                width = 134,
                height = 152,
                shift = util.by_pixel(3, 15),
                scale = 0.5
              }
            }
          },
          east =
          {
            layers =
            {
              -- diffuse
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-east.png",
                line_length = 1,
                width = 216,
                height = 146,
                shift = util.by_pixel(-6, 3),
                scale = 0.5
              },
              -- mask
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-east-mask.png",
                flags = { "mask" },
                apply_runtime_tint = true,
                line_length = 1,
                width = 66,
                height = 82,
                shift = util.by_pixel(-33, 1),
                scale = 0.5
              },
              -- shadow
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-east-shadow.png",
                draw_as_shadow = true,
                line_length = 1,
                width = 144,
                height = 86,
                shift = util.by_pixel(14, 9),
                scale = 0.5
              }
            }
          },
          south =
          {
            layers =
            {
              -- diffuse
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-south.png",
                line_length = 1,
                width = 128,
                height = 166,
                shift = util.by_pixel(0, -8),
                scale = 0.5
              },
              -- mask
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-south-mask.png",
                flags = { "mask" },
                apply_runtime_tint = true,
                line_length = 1,
                width = 72,
                height = 72,
                shift = util.by_pixel(0, -31),
                scale = 0.5
              },
              -- shadow
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-south-shadow.png",
                draw_as_shadow = true,
                line_length = 1,
                width = 134,
                height = 98,
                shift = util.by_pixel(3, 9),
                scale = 0.5
              }
            }

          },
          west =
          {
            layers =
            {
              -- diffuse
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-west.png",
                line_length = 1,
                width = 208,
                height = 144,
                shift = util.by_pixel(7, -1),
                scale = 0.5
              },
              -- mask
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-west-mask.png",
                flags = { "mask" },
                apply_runtime_tint = true,
                line_length = 1,
                width = 64,
                height = 74,
                shift = util.by_pixel(32, -1),
                scale = 0.5
              },
              -- shadow
              {
                filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-base-west-shadow.png",
                draw_as_shadow = true,
                line_length = 1,
                width = 206,
                height = 88,
                shift = util.by_pixel(15, 4),
                scale = 0.5
              }
            }
          }
        }
      }
    },

    muzzle_animation = util.draw_as_glow
    {
      filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-muzzle-fire.png",
      line_length = 8,
      width = 16,
      height = 30,
      frame_count = 32,
      blend_mode = "additive",
      scale = 0.45,
      shift = {0.015625 * 0.5, -0.546875 * 0.5 + 0.05}
    },
    muzzle_light = {size = 1.5, intensity = 0.2, color = {1, 0.5, 0}},

    folded_muzzle_animation_shift          = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 1,  orientation_count = 4, progress = 0, layers = {[0] = "object"} },
    preparing_muzzle_animation_shift       = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 15, orientation_count = 4, layers = {[0] = "object"} },
    prepared_muzzle_animation_shift        = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 1, orientation_count =  64, progress = 1},
    --starting_attack_muzzle_animation_shift = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 1,  orientation_count = 64, progress = 1},
    attacking_muzzle_animation_shift       = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 1,  orientation_count = 64, progress = 1},
    ending_attack_muzzle_animation_shift   = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 1,  orientation_count = 64, progress = 1},
    folding_muzzle_animation_shift         = fireutil.flamethrower_turret_preparing_muzzle_animation{ frame_count = 15, orientation_count = 4, run_mode = "backward", layers = {[0] = "object"}},

    prepare_range = 35,
    shoot_in_prepare_state = false,
    attack_parameters =
    {
      type = "stream",
      cooldown = 4,
      range = 30,
      min_range = 6,

      turn_range = 1.0 / 3.0,
      fire_penalty = 15,

      -- lead_target_for_projectile_speed = 0.2* 0.75 * 1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      fluids =
      {
        {type = "crude-oil"},
        {type = "heavy-oil", damage_modifier = 1.05},
        {type = "light-oil", damage_modifier = 1.1}
      },
      fluid_consumption = 0.2,

      gun_center_shift =
      {
        north = math3d.vector2.add(fireutil.gun_center_base, fireutil.turret_gun_shift.north),
        east = math3d.vector2.add(fireutil.gun_center_base, fireutil.turret_gun_shift.east),
        south = math3d.vector2.add(fireutil.gun_center_base, fireutil.turret_gun_shift.south),
        west = math3d.vector2.add(fireutil.gun_center_base, fireutil.turret_gun_shift.west)
      },
      gun_barrel_length = 0.4,

      ammo_category = "flamethrower",
      ammo_type =
      {
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "flamethrower-fire-stream",
            source_offset = {0.15, -0.5}
          }
        }
      },

      cyclic_sound =
      {
        begin_sound = sound_variations("__base__/sound/fight/flamethrower-turret-start", 3, 0.5),
        middle_sound = sound_variations("__base__/sound/fight/flamethrower-turret-mid", 3, 0.5),
        end_sound = sound_variations("__base__/sound/fight/flamethrower-turret-end", 3, 0.5)
      }
    },
    call_for_help_radius = 40
  }
})

data:extend(
{
  {
    type = "sticker",
    name = "fire-sticker",
    flags = {"not-on-map"},
    hidden = true,

    animation =
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-01.png",
      line_length = 10,
      width = 84,
      height = 130,
      frame_count = 90,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.4,
      tint = { r = 0.5, g = 0.5, b = 0.5, a = 0.18 }, --{ r = 1, g = 1, b = 1, a = 0.35 },
      shift = math3d.vector2.mul({-0.078125, -1.8125}, 0.1),
      draw_as_glow = true
    },

    duration_in_ticks = 30 * 60,
    damage_interval = 10,
    target_movement_modifier = 0.8,
    damage_per_tick = { amount = 10 * 100 / 60, type = "fire" },
    spread_fire_entity = "fire-flame-on-tree",
    fire_spread_cooldown = 30,
    fire_spread_radius = 0.75
  }
})

--- ******************************************************************
--- ******************************************************************
--- ******************************************************************

local stream_sprites =
{
  spine_animation = util.draw_as_glow
  {
    filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-fire-stream-spine.png",
    blend_mode = "normal",
    tint = {r=1, g=1, b=1, a=0.2},
    line_length = 6,
    width = 54,
    height = 26,
    frame_count = 36,
    animation_speed = 2,
    shift = {0, 0}
  },

  shadow =
  {
    filename = "__base__/graphics/entity/acid-projectile/projectile-shadow.png",
    line_length = 5,
    width = 28,
    height = 16,
    frame_count = 33,
    priority = "high",
    shift = {-0.09, 0.395}
  },

  particle = util.draw_as_glow
  {
    filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-explosion.png",
    priority = "extra-high",
    blend_mode = "normal",
    tint = {r=0.9, g=0.9, b=0.9, a=0.55},
    line_length = 6,
    width = 124,
    height = 108,
    frame_count = 36,
    scale = 0.666,
  }
}

data:extend(
{
  {
    type = "stream",
    name = "flamethrower-fire-stream",
    flags = {"not-on-map"},
    hidden = true,
    --stream_light = {intensity = 1, size = 4},
    --ground_light = {intensity = 0.8, size = 4},

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
    particle_start_alpha = 0.5/0.666,
    particle_end_alpha = 1,
    particle_start_scale = 0.2,
    particle_loop_frame_count = 3,
    particle_fade_out_threshold = 0.9,
    particle_loop_exit_threshold = 0.25,
    action =
    {
      {
        type = "area",
        radius = 2.5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-sticker",
              sticker = "fire-sticker",
              show_in_tooltip = true
            },
            {
              type = "damage",
              damage = { amount = 3, type = "fire" },
              apply_damage_to_trees = false
            }
          }
        }
      },
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
              show_in_tooltip = true
            }
          }
        }
      }
    },
    spine_animation = stream_sprites.spine_animation,
    shadow = stream_sprites.shadow,
    particle = stream_sprites.particle
  }
}
)

data:extend(
{
  {
    type = "stream",
    name = "handheld-flamethrower-fire-stream",
    flags = {"not-on-map"},
    hidden = true,

    smoke_sources =
    {
      {
        name = "soft-fire-smoke",
        frequency = 0.05, --0.25,
        position = {0.0, 0}, -- -0.8},
        starting_frame_deviation = 60
      }
    },

    --stream_light = {intensity = 1, size = 4 * 0.8},
    --ground_light = {intensity = 0.8, size = 4 * 0.8},

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
        type = "area",
        radius = 2.5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-sticker",
              sticker = "fire-sticker",
              show_in_tooltip = true
            },
            {
              type = "damage",
              damage = { amount = 2, type = "fire" },
              apply_damage_to_trees = false
            }
          }
        }
      },
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
              show_in_tooltip = true,
              initial_ground_flame_count = 2
            }
          }
        }
      }
    },
    spine_animation = stream_sprites.spine_animation,
    shadow = stream_sprites.shadow,
    particle = stream_sprites.particle
  },
  {
    type = "stream",
    name = "tank-flamethrower-fire-stream",
    flags = {"not-on-map"},
    hidden = true,

    smoke_sources =
    {
      {
        name = "soft-fire-smoke",
        frequency = 0.05, --0.25,
        position = {0.0, 0}, -- -0.8},
        starting_frame_deviation = 60
      }
    },

    --stream_light = {intensity = 1, size = 4 * 0.8},
    --ground_light = {intensity = 0.8, size = 4 * 0.8},

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
        radius = 4,
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
    spine_animation = stream_sprites.spine_animation,
    shadow = stream_sprites.shadow,
    particle = stream_sprites.particle
  }
}
)

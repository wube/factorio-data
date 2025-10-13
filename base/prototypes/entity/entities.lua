require ("util")
require ("prototypes.entity.pipecovers")
require ("circuit-connector-sprites")
require ("prototypes.entity.assemblerpipes")
require ("prototypes.entity.laser-sounds")
require ("prototypes.entity.enemy-constants")
require ("prototypes.entity.spawner-animation")
require ("prototypes.entity.character-animations")
require ("prototypes.entity.entity-util")
require ("prototypes.entity.spidertron-animations")
local simulations = require("__base__.prototypes.factoriopedia-simulations")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")
local procession_audio_catalogue_types = require("__base__/prototypes/planet/procession-audio-catalogue-types")

function create_entity_parameter(number)
  data:extend(
  {
    {
      type = "simple-entity",
      name = "parameter-" .. number,
      icon = "__base__/graphics/icons/parameter/parameter-" .. number .. ".png",
      localised_name = {"parameter-x", tostring(number)},
      subgroup = "parameters",
      order = "a",
      parameter = true,
      localised_description = {"entity-description.parameter-x"}
    }
  })
end

for n = 0, 9 do
  create_entity_parameter(n)
end


local hit_effects = require("prototypes.entity.hit-effects")
local sounds = require("prototypes.entity.sounds")
local movement_triggers = require("prototypes.entity.movement-triggers")
local cargo_pod_procession_catalogue = require("__base__/prototypes/entity/cargo-pod-catalogue")

local logistic_chest_opened_duration = 7

local tank_shift_y = 6

local heated_pipes_tint = {0.5, 0.4, 0.3, 0.5}
local heat_glow_tint = {1, 1, 1, 1}

local rocket_shift = 48

apply_heat_pipe_glow = function(layer)
  layer.tint = heated_pipes_tint
  local light_layer = util.copy(layer)
  light_layer.draw_as_light = true
  light_layer.tint = heat_glow_tint
  return
  {
    layers =
    {
      layer,
      light_layer
    }
  }
end

function make_heat_pipe_pictures(path, name_prefix, data, draw_as_glow)
  local all_pictures = {}
  local func = draw_as_glow and apply_heat_pipe_glow or function(t) return t end
  for key, t in pairs(data) do
    if t.empty then
      all_pictures[key] = { priority = "extra-high", filename = "__core__/graphics/empty.png", width = 1, height = 1 }
    else
      local tile_pictures = {}
      for i = 1, (t.variations or 1) do
        local sprite = func
        {
          priority = "extra-high",
          filename = path .. name_prefix .. "-" .. (t.name or string.gsub(key, "_", "-")) .. (t.ommit_number and ".png" or ("-" .. tostring(i) .. ".png")),
          width = (t.width or 32) * 2,
          height = (t.height or 32) * 2,
          scale = 0.5,
          shift = t.shift
        }
        table.insert(tile_pictures, sprite)
      end
      all_pictures[key] = tile_pictures
    end
  end
  return all_pictures
end

function make_spidertron_leg(spidertron_name, scale, leg_thickness, movement_speed, number, leg_resistances)
  return
  {
    type = "spider-leg",
    name = spidertron_name .. "-leg-" .. number,
    hidden = true,
    localised_name = {"entity-name.spidertron-leg"},
    collision_box = {{-0.05, -0.05}, {0.05, 0.05}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    icon = "__base__/graphics/icons/spidertron.png",
    walking_sound_volume_modifier = 0.8,
    walking_sound_speed_modifier = 0.5,
    target_position_randomisation_distance = 0.25 * scale,
    minimal_step_size = 1 * scale,
    working_sound =
    {
      match_progress_to_activity = true,
      sound = sounds.spidertron_leg,
    },
    stretch_force_scalar = 2.5 / (3.5 * scale), -- longer legs, weaker stretch force
    knee_height = 2.5 * scale,
    knee_distance_factor = 0.4,
    initial_movement_speed = 0.06 * movement_speed,
    movement_acceleration = 0.03 * movement_speed,
    max_health = 100,
    resistances = util.table.deepcopy(leg_resistances),
    base_position_selection_distance = 6 * scale,
    movement_based_position_selection_distance = 4 * scale,
    selectable_in_game = false,
    alert_when_damaged = false,
    graphics_set = create_spidertron_leg_graphics_set(scale * leg_thickness, number)
  }
end

function accumulator_picture(tint, repeat_count)
  return
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/accumulator/accumulator.png",
        priority = "high",
        width = 130,
        height = 189,
        repeat_count = repeat_count,
        shift = util.by_pixel(0, -11),
        tint = tint,
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/accumulator/accumulator-shadow.png",
        priority = "high",
        width = 234,
        height = 106,
        repeat_count = repeat_count,
        shift = util.by_pixel(29, 6),
        draw_as_shadow = true,
        scale = 0.5
      }
    }
  }
end

function accumulator_charge()
  return
  {
    layers =
    {
      accumulator_picture({1, 1, 1, 1} , 24),
      {
        filename = "__base__/graphics/entity/accumulator/accumulator-charge.png",
        priority = "high",
        width = 178,
        height = 210,
        line_length = 6,
        frame_count = 24,
        draw_as_glow = true,
        shift = util.by_pixel(1, -20),
        scale = 0.5
      }
    }
  }
end

function accumulator_reflection()
  return
  {
    pictures =
      {
        filename = "__base__/graphics/entity/accumulator/accumulator-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 24,
        shift = util.by_pixel(0, 50),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
  }
end

function accumulator_discharge()
  return
  {
    layers =
    {
      accumulator_picture({1, 1, 1, 1} , 24),
      {
        filename = "__base__/graphics/entity/accumulator/accumulator-discharge.png",
        priority = "high",
        width = 174,
        height = 214,
        line_length = 6,
        frame_count = 24,
        draw_as_glow = true,
        shift = util.by_pixel(-1, -21),
        scale = 0.5
      }
    }
  }
end

function make_4way_animation_from_spritesheet(animation)
  local function make_animation_layer(idx, anim)
    local frame_count = anim.frame_count or 1
    local start_frame = frame_count * idx
    local x = 0
    local y = 0
    if anim.line_length then
      y = anim.height * math.floor(start_frame / (anim.line_length or 1))
      if anim.line_length > frame_count then
        error("single line must not contain animations for multiple directions when line_lenght is specified: " .. anim.filename)
      end
    else
      x = idx * anim.width
    end
    return
    {
      filename = anim.filename,
      priority = anim.priority or "high",
      flags = anim.flags,
      x = x,
      y = y,
      width = anim.width,
      height = anim.height,
      frame_count = anim.frame_count,
      line_length = anim.line_length,
      repeat_count = anim.repeat_count,
      shift = anim.shift,
      draw_as_shadow = anim.draw_as_shadow,
      draw_as_glow = anim.draw_as_glow,
      draw_as_light = anim.draw_as_light,
      apply_runtime_tint = anim.apply_runtime_tint,
      tint_as_overlay = anim.tint_as_overlay or false,
      animation_speed = anim.animation_speed,
      scale = anim.scale or 1,
      tint = anim.tint,
      blend_mode = anim.blend_mode,
      load_in_minimal_mode = anim.load_in_minimal_mode,
      premul_alpha = anim.premul_alpha,
      generate_sdf = anim.generate_sdf
    }
  end

  local function make_animation(idx)
    if animation.layers then
      local tab = { layers = {} }
      for k,v in ipairs(animation.layers) do
        table.insert(tab.layers, make_animation_layer(idx, v))
      end
      return tab
    else
      return make_animation_layer(idx, animation)
    end
  end

  return
  {
    north = make_animation(0),
    east = make_animation(1),
    south = make_animation(2),
    west = make_animation(3)
  }
end

function car_reflection(scale)
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/car/car-reflection.png",
      priority = "extra-high",
      width = 20,
      height = 24,
      shift = util.by_pixel(0, 35),
      variation_count = 1,
      scale = 5 * scale
    },
    rotate = true,
    orientation_to_variation = false
  }
end

function boiler_reflection()
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/boiler/boiler-reflection.png",
      priority = "extra-high",
      width = 28,
      height = 32,
      shift = util.by_pixel(5, 30),
      variation_count = 4,
      scale = 5
    },
    rotate = false,
    orientation_to_variation = true
  }
end

function robot_reflection(scale)
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/construction-robot/construction-robot-reflection.png",
      priority = "extra-high",
      width = 12,
      height = 12,
      shift = util.by_pixel(0, 105),
      variation_count = 1,
      scale = 5 * scale
    },
    rotate = false,
    orientation_to_variation = false
  }
end

--- @param i integer
local function make_visualization(i)
  return
  {
    filename = "__base__/graphics/entity/pipe/visualization.png",
    priority = "extra-high",
    x = i * 64,
    size = 64,
    scale = 0.5,
    flags = {"icon"},
  }
end

--- @param i integer
local function make_disabled_visualization(i)
  return
  {
    filename = "__base__/graphics/entity/pipe/disabled-visualization.png",
    priority = "extra-high",
    x = i * 64,
    size = 64,
    scale = 0.5,
    flags = {"icon"},
  }
end

pipepictures = function()
  return
  {
    straight_vertical_single =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-single.png",
      priority = "extra-high",
      width = 160,
      height = 160,
      scale = 0.5
    },
    straight_vertical =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    straight_vertical_window =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-window.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    straight_horizontal_window =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal-window.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    straight_horizontal =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    corner_up_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-up-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    corner_up_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-up-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    corner_down_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-down-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    corner_down_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-down-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    t_up =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-up.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    t_down =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-down.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    t_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    t_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    cross =
    {
      filename = "__base__/graphics/entity/pipe/pipe-cross.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    ending_up =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-up.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    ending_down =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-down.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    ending_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    ending_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    straight_vertical_single_visualization = make_visualization(0),
    straight_vertical_visualization = make_visualization(5),
    straight_vertical_window_visualization = make_visualization(5),
    straight_horizontal_window_visualization = make_visualization(10),
    straight_horizontal_visualization = make_visualization(10),
    corner_up_right_visualization = make_visualization(3),
    corner_up_left_visualization = make_visualization(9),
    corner_down_right_visualization = make_visualization(6),
    corner_down_left_visualization = make_visualization(12),
    t_up_visualization = make_visualization(11),
    t_down_visualization = make_visualization(14),
    t_right_visualization = make_visualization(7),
    t_left_visualization = make_visualization(13),
    cross_visualization = make_visualization(15),
    ending_up_visualization = make_visualization(1),
    ending_down_visualization = make_visualization(4),
    ending_right_visualization = make_visualization(2),
    ending_left_visualization = make_visualization(8),
    straight_vertical_single_disabled_visualization = make_disabled_visualization(0),
    straight_vertical_disabled_visualization = make_disabled_visualization(5),
    straight_vertical_window_disabled_visualization = make_disabled_visualization(5),
    straight_horizontal_window_disabled_visualization = make_disabled_visualization(10),
    straight_horizontal_disabled_visualization = make_disabled_visualization(10),
    corner_up_right_disabled_visualization = make_disabled_visualization(3),
    corner_up_left_disabled_visualization = make_disabled_visualization(9),
    corner_down_right_disabled_visualization = make_disabled_visualization(6),
    corner_down_left_disabled_visualization = make_disabled_visualization(12),
    t_up_disabled_visualization = make_disabled_visualization(11),
    t_down_disabled_visualization = make_disabled_visualization(14),
    t_right_disabled_visualization = make_disabled_visualization(7),
    t_left_disabled_visualization = make_disabled_visualization(13),
    cross_disabled_visualization = make_disabled_visualization(15),
    ending_up_disabled_visualization = make_disabled_visualization(1),
    ending_down_disabled_visualization = make_disabled_visualization(4),
    ending_right_disabled_visualization = make_disabled_visualization(2),
    ending_left_disabled_visualization = make_disabled_visualization(8),
    horizontal_window_background =
    {
      filename = "__base__/graphics/entity/pipe/pipe-horizontal-window-background.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    vertical_window_background =
    {
      filename = "__base__/graphics/entity/pipe/pipe-vertical-window-background.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    fluid_background =
    {
      filename = "__base__/graphics/entity/pipe/fluid-background.png",
      priority = "extra-high",
      width = 64,
      height = 40,
      scale = 0.5
    },
    low_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    middle_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-medium-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    high_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-high-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    gas_flow =
    {
      filename = "__base__/graphics/entity/pipe/steam.png",
      priority = "extra-high",
      line_length = 10,
      width = 48,
      height = 30,
      frame_count = 60
    }
  }
end

function crash_trigger()
  return
  {
    type = "play-sound",
    sound = { filename = "__base__/sound/car-crash.ogg", volume = 0 }
  }
end

data:extend(
{
  {
    type = "character-corpse",
    name = "character-corpse",
    icon = "__core__/graphics/icons/entity/character.png",
    minable = {mining_time = 2},
    time_to_live = 0,
    selection_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_priority = 100, -- 0-255 value with 255 being on-top of everything else
    flags = {"placeable-off-grid", "not-rotatable", "not-on-map"},
    hidden = true,
    open_sound = { filename = "__base__/sound/character-corpse-open.ogg", volume = 0.5 },
    close_sound = { filename = "__base__/sound/character-corpse-close.ogg", volume = 0.5 },
    water_reflection =
    {
        pictures =
        {
          {
            filename = "__base__/graphics/entity/character/level1_dead_effect_map.png",
            width = 120,
            height = 63,
            --shift = util.by_pixel(-7.0,-5.5),
            --frame_count = 2,
            scale = 1,
            usage = "player"
          },
        }
      },
    pictures =
    {
      {
        layers =
        {
          character_animations.level1.dead,
          character_animations.level1.dead_mask,
          character_animations.level1.dead_shadow
        }
      },
      {
        layers =
        {
          character_animations.level1.dead,
          character_animations.level1.dead_mask,
          character_animations.level2addon.dead,
          character_animations.level2addon.dead_mask,
          character_animations.level1.dead_shadow
        }
      },
      {
        layers =
        {
          character_animations.level1.dead,
          character_animations.level1.dead_mask,
          character_animations.level3addon.dead,
          character_animations.level3addon.dead_mask,
          character_animations.level1.dead_shadow
        }
      }
    },
    -- The highest index found in the corpse is the graphics variation used
    armor_picture_mapping =
    {
      ["light-armor"] = 1,
      ["heavy-armor"] = 2,
      ["modular-armor"] = 2,
      ["power-armor"] = 3,
      ["power-armor-mk2"] = 3
    }
  },
  {
    type = "optimized-particle",
    name = "character-footprint-particle",
    render_layer = "decals",
    render_layer_when_on_ground = "decals",
    life_time = 600,
    fade_away_duration = 125,
    pictures =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/character/footprints.png",
        line_length = 2,
        frame_count = 2,
        width = 30,
        height = 22,
        shift = util.by_pixel(0.25, 0.25),
        scale = 0.5,
        variation_count = 8
      }
    }
  },
  {
    type = "character",
    name = "character",
    icon = "__core__/graphics/icons/entity/character.png",
    flags = {"placeable-off-grid", "breaths-air", "not-repairable", "not-on-map", "not-flammable", "get-by-unit-number"},
    max_health = 250,
    alert_when_damaged = false,
    healing_per_tick = 0.15,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.4, -1.4}, {0.4, 0.2}},
    hit_visualization_box = {{-0.2, -1.1}, {0.2, 0.2}},
    sticker_box = {{-0.2, -1}, {0.2, 0}},
    crafting_categories = {"crafting"},
    mining_categories = {"basic-solid"},
    character_corpse = "character-corpse",
    inventory_size = 80,
    build_distance = 10,
    drop_item_distance = 10,
    reach_distance = 10,
    item_pickup_distance = 1,
    loot_pickup_distance = 2,
    enter_vehicle_distance = 3,
    reach_resource_distance = 2.7,
    grounded_landing_search_radius = 5,
    ticks_to_keep_gun = 600,
    ticks_to_keep_aiming_direction = 100,
    --ticks you need to wait after firing a weapon or taking damage to get out of combat and get healed
    ticks_to_stay_in_combat = 600,
    damage_hit_tint = {0.12, 0, 0, 0},
    running_speed = 0.15,
    distance_per_frame = 0.13,
    maximum_corner_sliding_distance = 0.7,
    subgroup = "creatures",
    order="a",
    heartbeat = { filename = "__base__/sound/heartbeat.ogg" },
    tool_attack_result =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = 8 , type = "physical"}
        }
      }
    },

    animations =
    {
      {
        idle =
        {
          layers =
          {
            character_animations.level1.idle,
            character_animations.level1.idle_mask,
            character_animations.level1.idle_shadow
          }
        },
        idle_with_gun =
        {
          layers =
          {
            character_animations.level1.idle_gun,
            character_animations.level1.idle_gun_mask,
            character_animations.level1.idle_gun_shadow
          }
        },
        mining_with_tool =
        {
          layers =
          {
            character_animations.level1.mining_tool,
            character_animations.level1.mining_tool_mask,
            character_animations.level1.mining_tool_shadow
          }
        },
        running_with_gun =
        {
          layers =
          {
            character_animations.level1.running_gun,
            character_animations.level1.running_gun_mask,
            character_animations.level1.running_gun_shadow
          }
        },
        flipped_shadow_running_with_gun =
        {
          layers =
          {
            character_animations.level1.running_gun_shadow_flipped
          }
        },
        running =
        {
          layers =
          {
            character_animations.level1.running,
            character_animations.level1.running_mask,
            character_animations.level1.running_shadow
          }
        }
      },
      {
        armors = {"heavy-armor", "modular-armor"},
        idle =
        {
          layers =
          {
            character_animations.level1.idle,
            character_animations.level1.idle_mask,
            character_animations.level2addon.idle,
            character_animations.level2addon.idle_mask,
            character_animations.level1.idle_shadow,
            character_animations.level2addon.idle_shadow
          }
        },
        idle_with_gun =
        {
          layers =
          {
            character_animations.level1.idle_gun,
            character_animations.level1.idle_gun_mask,
            character_animations.level2addon.idle_gun,
            character_animations.level2addon.idle_gun_mask,
            character_animations.level1.idle_gun_shadow,
            character_animations.level2addon.idle_gun_shadow
          }
        },
        mining_with_tool =
        {
          layers =
          {
            character_animations.level1.mining_tool,
            character_animations.level1.mining_tool_mask,
            character_animations.level2addon.mining_tool,
            character_animations.level2addon.mining_tool_mask,
            character_animations.level1.mining_tool_shadow,
            character_animations.level2addon.mining_tool_shadow
          }
        },
        running_with_gun =
        {
          layers =
          {
            character_animations.level1.running_gun,
            character_animations.level1.running_gun_mask,
            character_animations.level2addon.running_gun,
            character_animations.level2addon.running_gun_mask,
            character_animations.level1.running_gun_shadow,
            character_animations.level2addon.running_gun_shadow
          }
        },
        flipped_shadow_running_with_gun =
        {
          layers =
          {
            character_animations.level1.running_gun_shadow_flipped,
            character_animations.level2addon.running_gun_shadow_flipped
          }
        },
        running =
        {
          layers =
          {
            character_animations.level1.running,
            character_animations.level1.running_mask,
            character_animations.level2addon.running,
            character_animations.level2addon.running_mask,
            character_animations.level1.running_shadow,
            character_animations.level2addon.running_shadow
          }
        }
      },
      {
        armors = {"power-armor", "power-armor-mk2"},
        idle =
        {
          layers =
          {
            character_animations.level1.idle,
            character_animations.level1.idle_mask,
            character_animations.level3addon.idle,
            character_animations.level3addon.idle_mask,
            character_animations.level1.idle_shadow,
            character_animations.level3addon.idle_shadow
          }
        },
        idle_with_gun =
        {
          layers =
          {
            character_animations.level1.idle_gun,
            character_animations.level1.idle_gun_mask,
            character_animations.level3addon.idle_gun,
            character_animations.level3addon.idle_gun_mask,
            character_animations.level1.idle_gun_shadow,
            character_animations.level3addon.idle_gun_shadow
          }
        },
        mining_with_tool =
        {
          layers =
          {
            character_animations.level1.mining_tool,
            character_animations.level1.mining_tool_mask,
            character_animations.level3addon.mining_tool,
            character_animations.level3addon.mining_tool_mask,
            character_animations.level1.mining_tool_shadow,
            character_animations.level3addon.mining_tool_shadow
          }
        },
        running_with_gun =
        {
          layers =
          {
            character_animations.level1.running_gun,
            character_animations.level1.running_gun_mask,
            character_animations.level3addon.running_gun,
            character_animations.level3addon.running_gun_mask,
            character_animations.level1.running_gun_shadow,
            character_animations.level3addon.running_gun_shadow
          }
        },
        flipped_shadow_running_with_gun =
        {
          layers =
          {
            character_animations.level1.running_gun_shadow_flipped,
            character_animations.level3addon.running_gun_shadow_flipped
          }
        },
        running =
        {
          layers =
          {
            character_animations.level1.running,
            character_animations.level1.running_mask,
            character_animations.level3addon.running,
            character_animations.level3addon.running_mask,
            character_animations.level1.running_shadow,
            character_animations.level3addon.running_shadow
          }
        }
      }
    },
    light =
    {
      {
        minimum_darkness = 0.3,
        intensity = 0.4,
        size = 25,
        color = {1.0, 1.0, 1.0}
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          size = 200
        },
        shift = {0, -13},
        size = 2,
        intensity = 0.6,
        color = {1.0, 1.0, 1.0}
      }
    },
    mining_speed = 0.5,
    mining_with_tool_particles_animation_positions = {19},
    running_sound_animation_positions = {5, 16},
    moving_sound_animation_positions = {10, 21},
    synced_footstep_particle_triggers = movement_triggers.character,
    footprint_particles =
    {
      {
        tiles =
        {
          "dry-dirt",
          "dirt-1", "dirt-2", "dirt-3", "dirt-4","dirt-5", "dirt-6", "dirt-7",
          "sand-1", "sand-2", "sand-3", "nuclear-ground",
          "red-desert-0", "red-desert-1", "red-desert-2", "red-desert-3"
        },
        particle_name = "character-footprint-particle"
      },
      -- no particle by default so that both (synced_)footstep_particle_triggers are consistently not defined for tiles by default
      {
        tiles = {},
        use_as_default = true,
        particle_name = nil
      }
    },
    right_footprint_frames = { 10, 21 },
    left_footprint_frames = {5, 16},
    right_footprint_offset = { 0.1, 0 },
    left_footprint_offset = { -0.1, 0 },

    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/character/character-reflection.png",
        priority = "extra-high",
        width = 13,
        height = 19,
        shift = util.by_pixel(0, 67 * 0.5),
        scale = 5,
        variation_count = 1
      },
      rotate = false,
      orientation_to_variation = false
    }
  },

  {
    type = "furnace",
    name = "stone-furnace",
    icon = "__base__/graphics/icons/stone-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "stone-furnace"},
    fast_replaceable_group = "furnace",
    next_upgrade = "steel-furnace",
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["stone-furnace"],
    max_health = 200,
    corpse = "stone-furnace-remnants",
    dying_explosion = "stone-furnace-explosion",
    repair_sound = sounds.manual_repair,
    mined_sound = sounds.deconstruct_bricks(0.8),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    allowed_effects = {"speed", "consumption", "pollution"},
    effect_receiver = {uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true},
    impact_category = "stone",
    icon_draw_specification = {scale = 0.66, shift = {0, -0.1}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/furnace.ogg",
        volume = 0.6,
        modifiers = {volume_multiplier("main-menu", 1.5), volume_multiplier("tips-and-tricks", 1.4)},
        audible_distance_modifier = 0.4
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
    },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    damaged_trigger_effect = hit_effects.rock(),
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    energy_usage = "90kW",
    crafting_speed = 1,
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = { pollution = 2 },
      light_flicker =
      {
        color = {0,0,0},
        minimum_intensity = 0.6,
        maximum_intensity = 0.95
      },
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 5,
          position = {0.0, -0.8},
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        }
      }
    },
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/stone-furnace/stone-furnace.png",
            priority = "extra-high",
            width = 151,
            height = 146,
            shift = util.by_pixel(-0.25, 6),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/stone-furnace/stone-furnace-shadow.png",
            priority = "extra-high",
            width = 164,
            height = 74,
            draw_as_shadow = true,
            shift = util.by_pixel(14.5, 13),
            scale = 0.5
          }
        }
      },
      working_visualisations =
      {
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            layers =
            {
              {
                filename = "__base__/graphics/entity/stone-furnace/stone-furnace-fire.png",
                priority = "extra-high",
                line_length = 8,
                width = 41,
                height = 100,
                frame_count = 48,
                draw_as_glow = true,
                shift = util.by_pixel(-0.75, 5.5),
                scale = 0.5
              },
              {
                filename = "__base__/graphics/entity/stone-furnace/stone-furnace-light.png",
                blend_mode = "additive",
                width = 106,
                height = 144,
                repeat_count = 48,
                draw_as_glow = true,
                shift = util.by_pixel(0, 5),
                scale = 0.5,
              },
            }
          }
        },
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            filename = "__base__/graphics/entity/stone-furnace/stone-furnace-ground-light.png",
            blend_mode = "additive",
            width = 116,
            height = 110,
            repeat_count = 48,
            draw_as_light = true,
            shift = util.by_pixel(-1, 44),
            scale = 0.5,
          },
        },
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__base__/graphics/entity/stone-furnace/stone-furnace-reflection.png",
          priority = "extra-high",
          width = 16,
          height = 16,
          shift = util.by_pixel(0, 35),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  },

  {
    type = "fish",
    name = "fish",
    icon = "__base__/graphics/icons/fish-entity.png",
    flags = {"placeable-neutral", "not-on-map"},
    minable = {mining_time = 0.4, result = "raw-fish", count = 5},
    mined_sound = sounds.mine_fish,
    max_health = 20,
    subgroup = "creatures",
    order = "b-a",
    factoriopedia_simulation = simulations.factoriopedia_fish,
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    pictures =
    {
      {
        filename = "__base__/graphics/entity/fish/fish-1.png",
        priority = "extra-high",
        width = 22,
        height = 36
      },
      {
        filename = "__base__/graphics/entity/fish/fish-2.png",
        priority = "extra-high",
        width = 32,
        height = 32
      }
    },
    autoplace = { probability_expression = 0.01 },
    protected_from_tile_building = false
  },

  {
    type = "boiler",
    name = "boiler",
    icon = "__base__/graphics/icons/boiler.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "boiler"},
    fast_replaceable_group = "boiler",
    max_health = 200,
    corpse = "boiler-remnants",
    dying_explosion = "boiler-explosion",
    impact_category = "metal-large",
    mode = "output-to-separate-pipe",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-1.29, -0.79}, {1.29, 0.79}},
    selection_box = {{-1.5, -1}, {1.5, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    target_temperature = 165,
    fluid_box =
    {
      volume = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {flow_direction = "input-output", direction = defines.direction.west, position = {-1, 0.5}},
        {flow_direction = "input-output", direction = defines.direction.east, position = {1, 0.5}}
      },
      production_type = "input",
      filter = "water"
    },
    output_fluid_box =
    {
      volume = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {flow_direction = "output", direction = defines.direction.north, position = {0, -0.5}}
      },
      production_type = "output",
      filter = "steam"
    },
    energy_consumption = "1.8MW",
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = { pollution = 30 },
      light_flicker =
      {
        color = {0,0,0},
        minimum_intensity = 0.6,
        maximum_intensity = 0.95
      },
      smoke =
      {
        {
          name = "smoke",
          north_position = util.by_pixel(-38, -47.5),
          south_position = util.by_pixel(38.5, -32),
          east_position = util.by_pixel(20, -70),
          west_position = util.by_pixel(-19, -8.5),
          frequency = 15,
          starting_vertical_speed = 0.0,
          starting_frame_deviation = 60
        }
      }
    },
    working_sound =
    {
      sound = {filename = "__base__/sound/boiler.ogg", volume = 0.7, audible_distance_modifier = 0.3},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    open_sound = sounds.steam_open,
    close_sound = sounds.steam_close,

    pictures =
    {
      north =
      {
        structure =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/boiler/boiler-N-idle.png",
              priority = "extra-high",
              width = 269,
              height = 221,
              shift = util.by_pixel(-1.25, 5.25),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/boiler/boiler-N-shadow.png",
              priority = "extra-high",
              width = 274,
              height = 164,
              scale = 0.5,
              shift = util.by_pixel(20.5, 9),
              draw_as_shadow = true
            }
          }
        },
        fire =
        {
          filename = "__base__/graphics/entity/boiler/boiler-N-fire.png",
          draw_as_glow = true,
          priority = "extra-high",
          frame_count = 64,
          line_length = 8,
          width = 26,
          height = 26,
          animation_speed = 0.5,
          shift = util.by_pixel(0, -8.5),
          scale = 0.5
        },
        fire_glow =
        {
          filename = "__base__/graphics/entity/boiler/boiler-N-light.png",
          draw_as_glow = true,
          priority = "extra-high",
          width = 200,
          height = 173,
          shift = util.by_pixel(-1, -6.75),
          blend_mode = "additive",
          scale = 0.5
        },
      },
      east =
      {
        structure =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/boiler/boiler-E-idle.png",
              priority = "extra-high",
              width = 216,
              height = 301,
              shift = util.by_pixel(-3, 1.25),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/boiler/boiler-E-shadow.png",
              priority = "extra-high",
              width = 184,
              height = 194,
              scale = 0.5,
              shift = util.by_pixel(30, 9.5),
              draw_as_shadow = true
            }
          }
        },
        patch =
        {
          filename = "__base__/graphics/entity/boiler/boiler-E-patch.png",
          width = 6,
          height = 36,
          shift = util.by_pixel(33.5, -13.5),
          scale = 0.5
        },
        fire =
        {
          filename = "__base__/graphics/entity/boiler/boiler-E-fire.png",
          draw_as_glow = true,
          priority = "extra-high",
          frame_count = 64,
          line_length = 8,
          width = 28,
          height = 28,
          animation_speed = 0.5,
          shift = util.by_pixel(-9.5, -22),
          scale = 0.5
        },
        fire_glow =
        {
          filename = "__base__/graphics/entity/boiler/boiler-E-light.png",
          draw_as_glow = true,
          priority = "extra-high",
          width = 139,
          height = 244,
          shift = util.by_pixel(0.25, -13),
          blend_mode = "additive",
          scale = 0.5
        },
      },
      south =
      {
        structure =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/boiler/boiler-S-idle.png",
              priority = "extra-high",
              width = 260,
              height = 192,
              shift = util.by_pixel(4, 13),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/boiler/boiler-S-shadow.png",
              priority = "extra-high",
              width = 311,
              height = 131,
              scale = 0.5,
              shift = util.by_pixel(29.75, 15.75),
              draw_as_shadow = true
            }
          },
        },
        fire =
        {
          filename = "__base__/graphics/entity/boiler/boiler-S-fire.png",
          draw_as_glow = true,
          priority = "extra-high",
          frame_count = 64,
          line_length = 8,
          width = 26,
          height = 16,
          animation_speed = 0.5,
          shift = util.by_pixel(-1, -26.5),
          scale = 0.5
        },
        fire_glow =
        {
          filename = "__base__/graphics/entity/boiler/boiler-S-light.png",
          draw_as_glow = true,
          priority = "extra-high",
          width = 200,
          height = 162,
          shift = util.by_pixel(1, 5.5),
          blend_mode = "additive",
          scale = 0.5
        },
      },
      west =
      {
        structure =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/boiler/boiler-W-idle.png",
              priority = "extra-high",
              width = 196,
              height = 273,
              shift = util.by_pixel(1.5, 7.75),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/boiler/boiler-W-shadow.png",
              priority = "extra-high",
              width = 206,
              height = 218,
              scale = 0.5,
              shift = util.by_pixel(19.5, 6.5),
              draw_as_shadow = true
            }
          },
        },
        fire =
        {
          filename = "__base__/graphics/entity/boiler/boiler-W-fire.png",
          draw_as_glow = true,
          priority = "extra-high",
          frame_count = 64,
          line_length = 8,
          width = 30,
          height = 29,
          animation_speed = 0.5,
          shift = util.by_pixel(13, -23.25),
          scale = 0.5
        },
        fire_glow =
        {
          filename = "__base__/graphics/entity/boiler/boiler-W-light.png",
          draw_as_glow = true,
          priority = "extra-high",
          width = 136,
          height = 217,
          shift = util.by_pixel(2, -6.25),
          blend_mode = "additive",
          scale = 0.5
        },
      }
    },

    fire_flicker_enabled = true,
    fire_glow_flicker_enabled = true,
    burning_cooldown = 20,
    water_reflection = boiler_reflection()
  },

  {
    type = "container",
    name = "wooden-chest",
    icon = "__base__/graphics/icons/wooden-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "wooden-chest"},
    max_health = 100,
    corpse = "wooden-chest-remnants",
    dying_explosion = "wooden-chest-explosion",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    fast_replaceable_group = "container",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    inventory_size = 16,
    open_sound = { filename = "__base__/sound/wooden-chest-open.ogg", volume = 0.6 },
    close_sound = { filename = "__base__/sound/wooden-chest-close.ogg", volume = 0.6 },
    impact_category = "wood",
    icon_draw_specification = {scale = 0.7},
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/wooden-chest/wooden-chest.png",
          priority = "extra-high",
          width = 62,
          height = 72,
          shift = util.by_pixel(0.5, -2),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/wooden-chest/wooden-chest-shadow.png",
          priority = "extra-high",
          width = 104,
          height = 40,
          shift = util.by_pixel(10, 6.5),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "container",
    name = "iron-chest",
    icon = "__base__/graphics/icons/iron-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "iron-chest"},
    max_health = 200,
    corpse = "iron-chest-remnants",
    dying_explosion = "iron-chest-explosion",
    open_sound = sounds.metallic_chest_open,
    close_sound = sounds.metallic_chest_close,
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "container",
    inventory_size = 32,
    impact_category = "metal",
    icon_draw_specification = {scale = 0.7},
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
          priority = "extra-high",
          width = 66,
          height = 76,
          shift = util.by_pixel(-0.5, -0.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
          priority = "extra-high",
          width = 110,
          height = 50,
          shift = util.by_pixel(10.5, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "electric-pole",
    name = "small-electric-pole",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    quality_indicator_scale = 0.75,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "small-electric-pole"},
    max_health = 100,
    corpse = "small-electric-pole-remnants",
    dying_explosion = "small-electric-pole-explosion",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    damaged_trigger_effect = hit_effects.entity({{-0.2, -2.2}, {0.2, 0.2}}),
    drawing_box_vertical_extension = 2.2,
    maximum_wire_distance = 7.5,
    supply_area_distance = 2.5,
    impact_category = "wood",
    open_sound = sounds.electric_network_open,
    close_sound = sounds.electric_network_close,
    fast_replaceable_group = "electric-pole",
    pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/small-electric-pole/small-electric-pole.png",
          priority = "extra-high",
          width = 72,
          height = 220,
          direction_count = 4,
          shift = util.by_pixel(1.5, -42.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/small-electric-pole/small-electric-pole-shadow.png",
          priority = "extra-high",
          width = 256,
          height = 52,
          direction_count = 4,
          shift = util.by_pixel(51, 3),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = util.by_pixel(98.5, 2.5),
          red = util.by_pixel(111.0, 4.5),
          green = util.by_pixel(85.5, 4.0)
        },
        wire =
        {
          copper = util.by_pixel(0.0, -82.5),
          red = util.by_pixel(13.0, -81.0),
          green = util.by_pixel(-12.5, -81.0)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel(99.5, 4.0),
          red = util.by_pixel(110.0, 9.0),
          green = util.by_pixel(92.5, -4.0)
        },
        wire =
        {
          copper = util.by_pixel(1.5, -81.0),
          red = util.by_pixel(12.0, -76.0),
          green = util.by_pixel(-6.0, -89.5)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel(100.5, 5.5),
          red = util.by_pixel(102.5, 14.5),
          green = util.by_pixel(103.5, -3.5)
        },
        wire =
        {
          copper = util.by_pixel(2.5, -79.5),
          red = util.by_pixel(4.0, -71.0),
          green = util.by_pixel(5.0, -89.5)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel(98.5, -1.5),
          red = util.by_pixel(88.0, 3.5),
          green = util.by_pixel(106.0, -9.0)
        },
        wire =
        {
          copper = util.by_pixel(0.5, -86.5),
          red = util.by_pixel(-10.5, -81.5),
          green = util.by_pixel(8.0, -93.5)
        }
      }
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/small-electric-pole/small-electric-pole-reflection.png",
        priority = "extra-high",
        width = 12,
        height = 28,
        shift = util.by_pixel(5, 40),
        variation_count = 4,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    }
  },
  {
    type = "generator",
    name = "steam-engine",
    icon = "__base__/graphics/icons/steam-engine.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.3, result = "steam-engine"},
    max_health = 400,
    corpse = "steam-engine-remnants",
    dying_explosion = "steam-engine-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    effectivity = 1,
    fluid_usage_per_tick = 0.5,
    maximum_temperature = 165,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      },
      {
        type = "impact",
        percent = 30
      }
    },
    fast_replaceable_group = "steam-engine",
    collision_box = {{-1.25, -2.35}, {1.25, 2.35}},
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { flow_direction = "input-output", direction = defines.direction.south, position = {0, 2} },
        { flow_direction = "input-output", direction = defines.direction.north, position = {0, -2} }
      },
      production_type = "input",
      filter = "steam",
      minimum_temperature = 100.0
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    horizontal_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steam-engine/steam-engine-H.png",
          width = 352,
          height = 257,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(1, -4.75),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/steam-engine/steam-engine-H-shadow.png",
          width = 508,
          height = 160,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(48, 24),
          scale = 0.5
        }
      }
    },
    vertical_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steam-engine/steam-engine-V.png",
          width = 225,
          height = 391,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(4.75, -6.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/steam-engine/steam-engine-V-shadow.png",
          width = 330,
          height = 307,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(40.5, 9.25),
          scale = 0.5
        }
      }
    },
    smoke =
    {
      {
        name = "light-smoke",
        north_position = {0.9, 0.0},
        east_position = {-2.0, -2.0},
        frequency = 10 / 32,
        starting_vertical_speed = 0.08,
        starting_frame_deviation = 60
      }
    },
    impact_category = "metal-large",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/steam-engine-90bpm.ogg",
        volume = 0.55,
        speed_smoothing_window_size = 60,
        modifiers = volume_multiplier("tips-and-tricks", 1.1),
        audible_distance_modifier = 0.8,
      },
      match_speed_to_activity = true,
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    perceived_performance = {minimum = 0.25, performance_to_activity_rate = 2.0},
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/steam-engine/steam-engine-reflection.png",
        priority = "extra-high",
        width = 40,
        height = 44,
        shift = util.by_pixel(0, 55),
        variation_count = 2,
        repeat_count = 2,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    }
  },

  {
    type = "offshore-pump",
    name = "offshore-pump",
    icon = "__base__/graphics/icons/offshore-pump.png",
    flags = {"placeable-neutral", "player-creation", "filter-directions"},
    collision_mask = {layers={object=true, train=true, is_object=true, is_lower_object=true}}, -- collide just with object-layer and train-layer which don't collide with water, this allows us to build on 1 tile wide ground
    tile_buildability_rules =
    {
      {area = {{-0.4, -0.4}, {0.4, 0.4}}, required_tiles = {layers={ground_tile=true}}, colliding_tiles = {layers={water_tile=true}}, remove_on_collision = true},
      {area = {{-1, -2}, {1, -1}}, required_tiles = {layers={water_tile=true}}, colliding_tiles = {layers={}}},
    },
    minable = {mining_time = 0.1, result = "offshore-pump"},
    fast_replaceable_group = "offshore-pump",
    max_health = 150,
    corpse = "offshore-pump-remnants",
    dying_explosion = "offshore-pump-explosion",
    fluid_source_offset = {0, -1},
    resistances =
    {
      {
        type = "fire",
        percent = 70
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.6, -1.05}, {0.6, 0.3}},
    selection_box = {{-0.6, -1.49}, {0.6, 0.49}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 100,
      pipe_covers = pipecoverspictures(),
      production_type = "output",
      pipe_connections =
      {
        {
          position = {0, 0},
          direction = defines.direction.south,
          flow_direction = "output"
        }
      }
    },
    energy_source =
    {
      type = "void"
    },
    energy_usage = "60kW",
    pumping_speed = 20,
    tile_width = 1,
    tile_height = 1,
    impact_category = "metal",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/offshore-pump.ogg",
        volume = 0.5,
        modifiers = volume_multiplier("tips-and-tricks", 1.1),
        audible_distance_modifier = 0.7,
      },
      match_volume_to_activity = true,
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    perceived_performance = {minimum = 0.5},
    always_draw_fluid = true,
    graphics_set =
    {
      underwater_layer_offset = 15,
      base_render_layer = "ground-patch",
      animation =
      {
        north =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/offshore-pump/offshore-pump_North.png",
              priority = "high",
              line_length = 8,
              frame_count = 32,
              animation_speed = 0.25,
              width = 90,
              height = 162,
              shift = util.by_pixel(-1, -15),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/offshore-pump/offshore-pump_North-shadow.png",
              priority = "high",
              line_length = 8,
              frame_count = 32,
              animation_speed = 0.25,
              width = 150,
              height = 134,
              shift = util.by_pixel(13, -7),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        },
        east =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/offshore-pump/offshore-pump_East.png",
              priority = "high",
              line_length = 8,
              frame_count = 32,
              animation_speed = 0.25,
              width = 124,
              height = 102,
              shift = util.by_pixel(15, -2),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/offshore-pump/offshore-pump_East-shadow.png",
              priority = "high",
              line_length = 8,
              frame_count = 32,
              animation_speed = 0.25,
              width = 180,
              height = 66,
              shift = util.by_pixel(27, 8),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        },
        south =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/offshore-pump/offshore-pump_South.png",
              priority = "high",
              line_length = 8,
              frame_count = 32,
              animation_speed = 0.25,
              width = 92,
              height = 192,
              shift = util.by_pixel(-1, 0),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/offshore-pump/offshore-pump_South-shadow.png",
              priority = "high",
              line_length = 8,
              frame_count = 32,
              animation_speed = 0.25,
              width = 164,
              height = 128,
              shift = util.by_pixel(15, 23),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        },
        west =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/offshore-pump/offshore-pump_West.png",
              priority = "high",
              line_length = 8,
              frame_count = 32,
              animation_speed = 0.25,
              width = 124,
              height = 102,
              shift = util.by_pixel(-15, -2),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/offshore-pump/offshore-pump_West-shadow.png",
              priority = "high",
              line_length = 8,
              frame_count = 32,
              animation_speed = 0.25,
              width = 172,
              height = 66,
              shift = util.by_pixel(-3, 8),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      fluid_animation =
      {
        north =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_North-fluid.png",
          apply_runtime_tint = true,
          line_length = 8,
          frame_count = 32,
          animation_speed = 0.25,
          width = 40,
          height = 40,
          shift = util.by_pixel(-1, -22),
          scale = 0.5
        },
        east =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_East-fluid.png",
          apply_runtime_tint = true,
          line_length = 8,
          frame_count = 32,
          animation_speed = 0.25,
          width = 38,
          height = 50,
          shift = util.by_pixel(6, -11),
          scale = 0.5
        },
        south =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_South-fluid.png",
          apply_runtime_tint = true,
          line_length = 8,
          frame_count = 32,
          animation_speed = 0.25,
          width = 36,
          height = 14,
          shift = util.by_pixel(-1, -4),
          scale = 0.5
        },
        west =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_West-fluid.png",
          apply_runtime_tint = true,
          line_length = 8,
          frame_count = 32,
          animation_speed = 0.25,
          width = 36,
          height = 50,
          shift = util.by_pixel(-7, -11),
          scale = 0.5
        }
      },
      glass_pictures =
      {
        north =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_North-glass.png",
          width = 36,
          height = 40,
          shift = util.by_pixel(-2, -22),
          scale = 0.5
        },
        east =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_East-glass.png",
          width = 30,
          height = 32,
          shift = util.by_pixel(5, -13),
          scale = 0.5
        },
        south =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_South-glass.png",
          width = 40,
          height = 24,
          shift = util.by_pixel(-1, -6),
          scale = 0.5
        },
        west =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_West-glass.png",
          width = 30,
          height = 32,
          shift = util.by_pixel(-6, -14),
          scale = 0.5
        }
      },
      base_pictures =
      {
        north =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_North-legs.png",
          width = 114,
          height = 106,
          shift = util.by_pixel(-1, -5),
          scale = 0.5
        },
        east =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_East-legs.png",
          width = 106,
          height = 60,
          shift = util.by_pixel(4, 13),
          scale = 0.5
        },
        south =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_South-legs.png",
          width = 110,
          height = 108,
          shift = util.by_pixel(-2, 6),
          scale = 0.5
        },
        west =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_West-legs.png",
          width = 108,
          height = 64,
          shift = util.by_pixel(-6, 12),
          scale = 0.5
        }
      },
      underwater_pictures =
      {
        north =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_North-underwater.png",
          width = 98,
          height = 36,
          shift = util.by_pixel(-1, -32),
          scale = 0.5
        },
        east =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_East-underwater.png",
          width = 40,
          height = 72,
          shift = util.by_pixel(39, 17),
          scale = 0.5
        },
        south =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_South-underwater.png",
          width = 98,
          height = 48,
          shift = util.by_pixel(-1, 49),
          scale = 0.5
        },
        west =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_West-underwater.png",
          width = 40,
          height = 72,
          shift = util.by_pixel(-40, 17),
          scale = 0.5
        }
      }
    },
    placeable_position_visualization =
    {
      filename = "__core__/graphics/cursor-boxes-32x32.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      scale = 0.5,
      x = 3*64
    },
    circuit_connector = circuit_connector_definitions["offshore-pump"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/offshore-pump/offshore-pump-reflection.png",
        priority = "extra-high",
        width = 132,
        height = 156,
        shift = util.by_pixel(0, 19),
        variation_count = 4,
        scale = 1
      },
      rotate = false,
      orientation_to_variation = true
    }
  },

  {
    type = "inserter",
    name = "inserter",
    icon = "__base__/graphics/icons/inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "inserter"},
    max_health = 150,
    corpse = "inserter-remnants",
    dying_explosion = "inserter-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    damaged_trigger_effect = hit_effects.entity(),
    energy_per_movement = "5kJ",
    energy_per_rotation = "5kJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.4kW"
    },
    extension_speed = 0.035,
    rotation_speed = 0.014,
    filter_count = 5,
    icon_draw_specification = {scale = 0.5},
    fast_replaceable_group = "inserter",
    next_upgrade = "fast-inserter",
    impact_category = "metal",
    open_sound = sounds.inserter_open,
    close_sound = sounds.inserter_close,
    working_sound = sounds.inserter_basic,
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-base.png",
      priority = "extra-high",
      width = 32,
      height = 136,
      scale = 0.25
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-closed.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-open.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 132,
      scale = 0.25
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/inserter/inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5-1),
        scale = 0.5
      }
    },
    circuit_connector = circuit_connector_definitions["inserter"],
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = "fast-inserter",
    icon = "__base__/graphics/icons/fast-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = { mining_time = 0.1, result = "fast-inserter" },
    max_health = 150,
    corpse = "fast-inserter-remnants",
    dying_explosion = "fast-inserter-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    damaged_trigger_effect = hit_effects.entity(),
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = "7kJ",
    energy_per_rotation = "7kJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.5kW"
    },
    extension_speed = 0.1,
    rotation_speed = 0.04,
    filter_count = 5,
    icon_draw_specification = {scale = 0.5},
    fast_replaceable_group = "inserter",
    next_upgrade = "bulk-inserter",
    impact_category = "metal",
    open_sound = sounds.inserter_open,
    close_sound = sounds.inserter_close,
    working_sound = sounds.inserter_fast,
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/fast-inserter/fast-inserter-hand-base.png",
      priority = "extra-high",
      width = 32,
      height = 136,
      scale = 0.25
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/fast-inserter/fast-inserter-hand-closed.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/fast-inserter/fast-inserter-hand-open.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 132,
      scale = 0.25
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/fast-inserter/fast-inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5-1),
        scale = 0.5
      }
    },
    circuit_connector = circuit_connector_definitions["inserter"],
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = "long-handed-inserter",
    icon = "__base__/graphics/icons/long-handed-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "long-handed-inserter"},
    max_health = 160,
    corpse = "long-handed-inserter-remnants",
    dying_explosion = "long-handed-inserter-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    damaged_trigger_effect = hit_effects.entity(),
    starting_distance = 1.7,
    pickup_position = {0, -2},
    insert_position = {0, 2.2},
    energy_per_movement = "5kJ",
    energy_per_rotation = "5kJ",
    extension_speed = 0.05,
    rotation_speed = 0.02,
    filter_count = 5,
    icon_draw_specification = {scale = 0.5},
    hand_size = 1.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.4kW"
    },
    fast_replaceable_group = "long-handed-inserter",
    impact_category = "metal",
    open_sound = sounds.inserter_open,
    close_sound = sounds.inserter_close,
    working_sound = sounds.inserter_long_handed,
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-hand-base.png",
      priority = "extra-high",
      width = 32,
      height = 136,
      scale = 0.25
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-hand-closed.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-hand-open.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 132,
      scale = 0.25
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5-1),
        scale = 0.5
      }
    },
    circuit_connector = circuit_connector_definitions["inserter"],
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = "burner-inserter",
    icon = "__base__/graphics/icons/burner-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "burner-inserter"},
    max_health = 100,
    corpse = "burner-inserter-remnants",
    dying_explosion = "burner-inserter-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    damaged_trigger_effect = hit_effects.entity(),
    energy_per_movement = "50kJ",
    energy_per_rotation = "50kJ",
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      initial_fuel = "wood",
      initial_fuel_percent = 0.25,
      effectivity = 1,
      fuel_inventory_size = 1,
      light_flicker = {color = {0,0,0}},
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 9
        }
      }
    },
    extension_speed = 0.035,
    rotation_speed = 0.013,
    filter_count = 5,
    icon_draw_specification = {scale = 0.5},
    fast_replaceable_group = "inserter",
    impact_category = "metal",
    working_sound = sounds.inserter_basic,
    open_sound = sounds.inserter_open,
    close_sound = sounds.inserter_close,
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base.png",
      priority = "extra-high",
      width = 32,
      height = 136,
      scale = 0.25
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 132,
      scale = 0.25
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/burner-inserter/burner-inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5-1),
        scale = 0.5
      }
    },
    circuit_connector = circuit_connector_definitions["inserter"],
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal,
  },

  {
    type = "item-entity",
    name = "item-on-ground",
    icon = "__core__/graphics/item-on-ground.png",
    factoriopedia_simulation = simulations.factoriopedia_item_on_ground,
    flags = {"placeable-off-grid", "not-on-map"},
    collision_box = {{-0.14, -0.14}, {0.14, 0.14}},
    selection_box = {{-0.17, -0.17}, {0.17, 0.17}},
    selection_priority = selection_priorities.ground_entity - 1,
    minable = {mining_time = 0.025}
  },

  {
    type = "pipe",
    name = "pipe",
    icon = "__base__/graphics/icons/pipe.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "pipe"},
    max_health = 100,
    corpse = "pipe-remnants",
    dying_explosion = "pipe-explosion",
    icon_draw_specification = {scale = 0.5},
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "impact",
        percent = 30
      }
    },
    fast_replaceable_group = "pipe",
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 100,
      pipe_covers = pipecoverspictures(), -- in case a real pipe is connected to a ghost
      pipe_connections =
      {
        { direction = defines.direction.north, position = {0, 0} },
        { direction = defines.direction.east, position = {0, 0} },
        { direction = defines.direction.south, position = {0, 0} },
        { direction = defines.direction.west, position = {0, 0} }
      },
      hide_connection_info = true
    },
    impact_category = "metal",
    pictures = pipepictures(),
    working_sound = sounds.pipe,
    open_sound = sounds.metal_small_open,
    close_sound = sounds.metal_small_close,

    horizontal_window_bounding_box = {{-0.25, -0.28125}, {0.25, 0.15625}},
    vertical_window_bounding_box = {{-0.28125, -0.5}, {0.03125, 0.125}}
  },

  {
    type = "radar",
    name = "radar",
    icon = "__base__/graphics/icons/radar.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "radar"},
    fast_replaceable_group = "radar",
    max_health = 250,
    corpse = "radar-remnants",
    dying_explosion = "radar-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    energy_per_sector = "10MJ",
    max_distance_of_sector_revealed = 14,
    max_distance_of_nearby_sector_revealed = 3,
    energy_per_nearby_scan = "250kJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "300kW",
    integration_patch =
    {
      filename = "__base__/graphics/entity/radar/radar-integration.png",
      priority = "low",
      width = 238,
      height = 216,
      shift = util.by_pixel(1.5, 4.0),
      scale = 0.5
    },
    pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/radar/radar.png",
          priority = "low",
          width = 196,
          height = 254,
          apply_projection = false,
          direction_count = 64,
          line_length = 8,
          shift = util.by_pixel(1.0, -16.0),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/radar/radar-shadow.png",
          priority = "low",
          width = 336,
          height = 170,
          apply_projection = false,
          direction_count = 64,
          line_length = 8,
          shift = util.by_pixel(39.0, 6.0),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/radar.ogg", volume = 0.8, modifiers = volume_multiplier("main-menu", 2.0)},
      max_sounds_per_prototype = 3,
      use_doppler_shift = false
    },
    radius_minimap_visualisation_color = {0.059, 0.092, 0.235, 0.275},
    rotation_speed = 0.01,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/radar/radar-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 32,
        shift = util.by_pixel(5, 35),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    },
    is_military_target = false,
    circuit_connector = circuit_connector_definitions["radar"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },

  {
    type = "lamp",
    name = "small-lamp",
    icon = "__base__/graphics/icons/small-lamp.png",
    flags = {"placeable-neutral", "player-creation"},
    fast_replaceable_group = "lamp",
    minable = {mining_time = 0.1, result = "small-lamp"},
    max_health = 100,
    corpse = "lamp-remnants",
    dying_explosion = "lamp-explosion",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    impact_category = "glass",
    open_sound = {filename = "__base__/sound/open-close/electric-small-open.ogg", volume = 0.7},
    close_sound = {filename = "__base__/sound/open-close/electric-small-close.ogg", volume = 0.7},
    energy_source =
    {
      type = "electric",
      usage_priority = "lamp"
    },
    energy_usage_per_tick = "5kW",
    darkness_for_all_lamps_on = 0.5,
    darkness_for_all_lamps_off = 0.3,
    light = {intensity = 0.9, size = 40, color = {1, 1, 0.75}},
    light_when_colored = {intensity = 0, size = 6, color = {1, 1, 0.75}},
    glow_size = 6,
    glow_color_intensity = 1,
    glow_render_mode = "multiplicative",
    picture_off =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/small-lamp/lamp.png",
          priority = "high",
          width = 83,
          height = 70,
          shift = util.by_pixel(0.25,3),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/small-lamp/lamp-shadow.png",
          priority = "high",
          width = 76,
          height = 47,
          shift = util.by_pixel(4, 4.75),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    picture_on =
    {
      filename = "__base__/graphics/entity/small-lamp/lamp-light.png",
      priority = "high",
      width = 90,
      height = 78,
      shift = util.by_pixel(0, -7),
      scale = 0.5
    },
    signal_to_color_mapping =
    {
      {type = "virtual", name = "signal-red",    color = {1, 0, 0}},
      {type = "virtual", name = "signal-green",  color = {0, 1, 0}},
      {type = "virtual", name = "signal-blue",   color = {0, 0, 1}},
      {type = "virtual", name = "signal-yellow", color = {1, 1, 0}},
      {type = "virtual", name = "signal-pink",   color = {1, 0, 1}},
      {type = "virtual", name = "signal-cyan",   color = {0, 1, 1}},
      {type = "virtual", name = "signal-white",  color = {1, 1, 1}},
      {type = "virtual", name = "signal-grey",   color = {0.5, 0.5, 0.5}},
      {type = "virtual", name = "signal-black",  color = {0, 0, 0}}
    },
    default_red_signal = { type = "virtual", name = "signal-red" },
    default_green_signal = { type = "virtual", name = "signal-green" },
    default_blue_signal = { type = "virtual", name = "signal-blue" },
    default_rgb_signal = { type = "virtual", name = "signal-white" },

    circuit_connector = circuit_connector_definitions["lamp"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },

  {
    type = "arrow",
    name = "orange-arrow-with-circle",
    flags = {"placeable-off-grid", "not-on-map"},
    hidden = true,
    blinking = true,
    arrow_picture =
    {
      filename = "__core__/graphics/arrows/gui-arrow-medium.png",
      priority = "low",
      width = 58,
      height = 62
    },
    circle_picture =
    {
      filename = "__core__/graphics/arrows/gui-arrow-circle.png",
      priority = "low",
      width = 50,
      height = 50
    }
  },

  {
    type = "pipe-to-ground",
    name = "pipe-to-ground",
    icon = "__base__/graphics/icons/pipe-to-ground.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "pipe-to-ground"},
    max_health = 150,
    corpse = "pipe-to-ground-remnants",
    dying_explosion = "pipe-to-ground-explosion",
    factoriopedia_simulation = simulations.factoriopedia_pipe_to_ground,
    icon_draw_specification = {scale = 0.5},
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "impact",
        percent = 40
      }

    },
    fast_replaceable_group = "pipe",
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 100,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { direction = defines.direction.north, position = {0, 0} },
        {
          connection_type = "underground",
          direction = defines.direction.south,
          position = {0, 0},
          max_underground_distance = 10
        }
      },
      hide_connection_info = true
    },
    impact_category = "metal",
    working_sound = sounds.pipe,
    open_sound = sounds.metal_small_open,
    close_sound = sounds.metal_small_close,
    pictures =
    {
      north =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-up.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      },
      south =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-down.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      },
      west =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      },
      east =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    visualization =
    {
      north =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/visualization.png",
        priority = "extra-high",
        x = 64,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      south =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/visualization.png",
        priority = "extra-high",
        x = 192,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      west =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/visualization.png",
        priority = "extra-high",
        x = 256,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      east =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/visualization.png",
        priority = "extra-high",
        x = 128,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
    },
    disabled_visualization =
    {
      north =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/disabled-visualization.png",
        priority = "extra-high",
        x = 64,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      south =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/disabled-visualization.png",
        priority = "extra-high",
        x = 192,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      west =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/disabled-visualization.png",
        priority = "extra-high",
        x = 256,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      east =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/disabled-visualization.png",
        priority = "extra-high",
        x = 128,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
    },
  },

  {
    type = "assembling-machine",
    name = "assembling-machine-1",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "assembling-machine-1"},
    max_health = 300,
    corpse = "assembling-machine-1-remnants",
    dying_explosion = "assembling-machine-1-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "assembling-machine",
    next_upgrade = "assembling-machine-2",
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
            priority="high",
            width = 214,
            height = 226,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 2),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
            priority="high",
            width = 190,
            height = 165,
            line_length = 1,
            repeat_count = 32,
            draw_as_shadow = true,
            shift = util.by_pixel(8.5, 5),
            scale = 0.5
          }
        }
      }
    },
    crafting_categories = {"crafting", "basic-crafting", "advanced-crafting"},
    crafting_speed = 0.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 4 }
    },
    energy_usage = "75kW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    allowed_effects = {"speed", "consumption", "pollution"},
    effect_receiver = {uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true},
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.5, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  },
  {
    type = "assembling-machine",
    name = "assembling-machine-2",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "assembling-machine-2"},
    max_health = 350,
    corpse = "assembling-machine-2-remnants",
    dying_explosion = "assembling-machine-2-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {0, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {0, 1} }},
        secondary_draw_orders = { north = -1 }
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "assembling-machine",
    next_upgrade = "assembling-machine-3",
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2.png",
            priority = "high",
            width = 214,
            height = 218,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 4),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-shadow.png",
            priority = "high",
            width = 196,
            height = 163,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(12, 4.75),
            scale = 0.5
          }
        }
      },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/assembling-machine-t2-1.ogg", volume = 0.45, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid"},

    crafting_speed = 0.75,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 3 }
    },
    energy_usage = "150kW",
    module_slots = 2,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"}
  },

  {
    type = "entity-ghost",
    name = "entity-ghost",
    icon =  "__core__/graphics/icons/mip/ghost-entity.png",
    factoriopedia_simulation = simulations.factoriopedia_entity_ghost,
    build_sound = {category = "gui-effect", filename = "__core__/sound/build-ghost-small.ogg", volume = 0.6, aggregation = {max_count = 3, remove = true}},
    medium_build_sound = {category = "gui-effect", filename = "__core__/sound/build-ghost-medium.ogg", volume = 0.7, aggregation = {max_count = 3, remove = true}},
    large_build_sound = {category = "gui-effect", filename = "__core__/sound/build-ghost-large.ogg",  volume = 0.7, aggregation = {max_count = 3, remove = true}},
    huge_build_sound = {category = "gui-effect", filename = "__core__/sound/build-ghost-large.ogg",  volume = 0.7, aggregation = {max_count = 3, remove = true}},
    minable = {mining_time = 0, results={}},
    mined_sound = {category = "gui-effect", filename = "__core__/sound/deconstruct-ghost.ogg", volume = 0.4}
  },

  {
    type = "tile-ghost",
    name = "tile-ghost",
    icon = "__core__/graphics/icons/mip/ghost-tile.png",
    factoriopedia_simulation = simulations.factoriopedia_tile_ghost,
    minable = {mining_time = 0, results={}},
    collision_box = {{-0.49, -0.49}, {0.49, 0.49}},
    build_sound = {category = "gui-effect", filename = "__core__/sound/build-ghost-tile.ogg", volume = 0.9},
    mined_sound = {category = "gui-effect", filename = "__core__/sound/deconstruct-ghost-tile.ogg", volume = 0.7},
    selection_priority = 30
  },

  {
    type = "deconstructible-tile-proxy",
    name = "deconstructible-tile-proxy",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_priority = 30
  },
  {
    type = "item-request-proxy",
    name = "item-request-proxy",
    icon = "__core__/graphics/icons/mip/item-request-slot.png",
    factoriopedia_simulation = simulations.factoriopedia_item_request_proxy,
    use_target_entity_alert_icon_shift = true,
    flags = {"not-on-map", "placeable-off-grid"},
    minable = {mining_time = 0, results={}},
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{0, 0}, {0, 0}}
  },

  scaled_cliff(
    {
      mod_name = "__base__",
      name = "cliff",
      map_color = {r=144, g=119, b=87},
      suffix = nil,
      scale = 1.0,
      has_lower_layer = true,
      factoriopedia_simulation = simulations.factoriopedia_cliff
    }
  ),

  {
    type = "wall",
    name = "stone-wall",
    icon = "__base__/graphics/icons/wall.png",
    flags = {"placeable-neutral", "player-creation"},
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.wall(),
    minable = {mining_time = 0.2, result = "stone-wall"},
    fast_replaceable_group = "wall",
    max_health = 350,
    repair_speed_modifier = 2,
    corpse = "wall-remnants",
    dying_explosion = "wall-explosion",
    repair_sound = sounds.manual_repair,
    mined_sound = sounds.deconstruct_bricks(0.8),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "stone",
    -- this kind of code can be used for having walls mirror the effect
    -- there can be multiple reaction items
    --attack_reaction =
    --{
    --{
    ---- how far the mirroring works
    --range = 2,
    ---- what kind of damage triggers the mirroring
    ---- if not present then anything triggers the mirroring
    --damage_type = "physical",
    ---- caused damage will be multiplied by this and added to the subsequent damages
    --reaction_modifier = 0.1,
    --action =
    --{
    --type = "direct",
    --action_delivery =
    --{
    --type = "instant",
    --target_effects =
    --{
    --type = "damage",
    ---- always use at least 0.1 damage
    --damage = {amount = 0.1, type = "physical"}
    --}
    --}
    --},
    --}
    --},
    connected_gate_visualization =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      scale = 0.5
    },
    resistances =
    {
      {
        type = "physical",
        decrease = 3,
        percent = 20
      },
      {
        type = "impact",
        decrease = 45,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      },
      {
        type = "fire",
        percent = 100
      },
      {
        type = "acid",
        percent = 80
      },
      {
        type = "laser",
        percent = 70
      }
    },
    visual_merge_group = 0, -- different walls will visually connect to each other if their merge group is same (defaults to 0)
    pictures =
    {
      single =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/wall/wall-single.png",
            priority = "extra-high",
            width = 64,
            height = 86,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, -5),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/wall/wall-single-shadow.png",
            priority = "extra-high",
            width = 98,
            height = 60,
            repeat_count = 2,
            shift = util.by_pixel(10, 17),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      straight_vertical =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/wall/wall-vertical.png",
            priority = "extra-high",
            width = 64,
            height = 134,
            variation_count = 5,
            line_length = 5,
            shift = util.by_pixel(0, 8),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/wall/wall-vertical-shadow.png",
            priority = "extra-high",
            width = 98,
            height = 110,
            repeat_count = 5,
            shift = util.by_pixel(10, 29),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      straight_horizontal =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/wall/wall-horizontal.png",
            priority = "extra-high",
            width = 64,
            height = 92,
            variation_count = 6,
            line_length = 6,
            shift = util.by_pixel(0, -2),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/wall/wall-horizontal-shadow.png",
            priority = "extra-high",
            width = 124,
            height = 68,
            repeat_count = 6,
            shift = util.by_pixel(14, 15),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      corner_right_down =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/wall/wall-corner-right.png",
            priority = "extra-high",
            width = 64,
            height = 128,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, 7),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/wall/wall-corner-right-shadow.png",
            priority = "extra-high",
            width = 124,
            height = 120,
            repeat_count = 2,
            shift = util.by_pixel(17, 28),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      corner_left_down =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/wall/wall-corner-left.png",
            priority = "extra-high",
            width = 64,
            height = 134,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, 7),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/wall/wall-corner-left-shadow.png",
            priority = "extra-high",
            width = 102,
            height = 120,
            repeat_count = 2,
            shift = util.by_pixel(9, 28),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      t_up =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/wall/wall-t.png",
            priority = "extra-high",
            width = 64,
            height = 134,
            variation_count = 4,
            line_length = 4,
            shift = util.by_pixel(0, 7),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/wall/wall-t-shadow.png",
            priority = "extra-high",
            width = 124,
            height = 120,
            repeat_count = 4,
            shift = util.by_pixel(14, 28),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      ending_right =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/wall/wall-ending-right.png",
            priority = "extra-high",
            width = 64,
            height = 92,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, -3),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/wall/wall-ending-right-shadow.png",
            priority = "extra-high",
            width = 124,
            height = 68,
            repeat_count = 2,
            shift = util.by_pixel(17, 15),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      ending_left =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/wall/wall-ending-left.png",
            priority = "extra-high",
            width = 64,
            height = 92,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, -3),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/wall/wall-ending-left-shadow.png",
            priority = "extra-high",
            width = 102,
            height = 68,
            repeat_count = 2,
            shift = util.by_pixel(9, 15),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      filling =
      {
        filename = "__base__/graphics/entity/wall/wall-filling.png",
        priority = "extra-high",
        width = 48,
        height = 56,
        variation_count = 8,
        line_length = 8,
        shift = util.by_pixel(0, -1),
        scale = 0.5
      },
      water_connection_patch =
      {
        sheets =
        {
          {
            filename = "__base__/graphics/entity/wall/wall-patch.png",
            priority = "extra-high",
            width = 116,
            height = 128,
            shift = util.by_pixel(0, -2),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/wall/wall-patch-shadow.png",
            priority = "extra-high",
            width = 144,
            height = 100,
            shift = util.by_pixel(9, 15),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      gate_connection_patch =
      {
        sheets =
        {
          {
            filename = "__base__/graphics/entity/wall/wall-gate.png",
            priority = "extra-high",
            width = 82,
            height = 108,
            shift = util.by_pixel(0, -7),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/wall/wall-gate-shadow.png",
            priority = "extra-high",
            width = 130,
            height = 78,
            shift = util.by_pixel(14, 18),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },

    wall_diode_green =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/wall/wall-diode-green.png",
        priority = "extra-high",
        width = 72,
        height = 44,
        draw_as_glow = true,
        --frames = 4,
        shift = util.by_pixel(-1, -23),
        scale = 0.5
      }
    },
    wall_diode_green_light_top =
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(0, -30),
      size = 1,
      intensity = 0.2
    },
    wall_diode_green_light_right =
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(12, -23),
      size = 1,
      intensity = 0.2
    },
    wall_diode_green_light_bottom =
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(0, -17),
      size = 1,
      intensity = 0.2
    },
    wall_diode_green_light_left =
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(-12, -23),
      size = 1,
      intensity = 0.2
    },

    wall_diode_red =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/wall/wall-diode-red.png",
        priority = "extra-high",
        width = 72,
        height = 44,
        draw_as_glow = true,
        --frames = 4,
        shift = util.by_pixel(-1, -23),
        scale = 0.5
      }
    },
    wall_diode_red_light_top =
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(0, -30),
      size = 1,
      intensity = 0.2
    },
    wall_diode_red_light_right =
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(12, -23),
      size = 1,
      intensity = 0.2
    },
    wall_diode_red_light_bottom =
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(0, -17),
      size = 1,
      intensity = 0.2
    },
    wall_diode_red_light_left =
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(-12, -23),
      size = 1,
      intensity = 0.2
    },

    circuit_connector = circuit_connector_definitions["wall"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    default_output_signal = {type = "virtual", name = "signal-G"}
  },
  {
    type = "lab",
    name = "lab",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "lab"},
    fast_replaceable_group = "lab",
    max_health = 150,
    corpse = "lab-remnants",
    dying_explosion = "lab-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    on_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/lab/lab.png",
          width = 194,
          height = 174,
          frame_count = 33,
          line_length = 11,
          animation_speed = 1 / 3,
          shift = util.by_pixel(0, 1.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/lab/lab-integration.png",
          width = 242,
          height = 162,
          line_length = 1,
          repeat_count = 33,
          animation_speed = 1 / 3,
          shift = util.by_pixel(0, 15.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/lab/lab-light.png",
          blend_mode = "additive",
          draw_as_light = true,
          width = 216,
          height = 194,
          frame_count = 33,
          line_length = 11,
          animation_speed = 1 / 3,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/lab/lab-shadow.png",
          width = 242,
          height = 136,
          line_length = 1,
          repeat_count = 33,
          animation_speed = 1 / 3,
          shift = util.by_pixel(13, 11),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    off_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/lab/lab.png",
          width = 194,
          height = 174,
          shift = util.by_pixel(0, 1.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/lab/lab-integration.png",
          width = 242,
          height = 162,
          shift = util.by_pixel(0, 15.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/lab/lab-shadow.png",
          width = 242,
          height = 136,
          shift = util.by_pixel(13, 11),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7,
        modifiers = {volume_multiplier("main-menu", 2.2), volume_multiplier("tips-and-tricks", 0.8)},
        audible_distance_modifier = 0.7,
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    impact_category = "glass",
    open_sound = sounds.lab_open,
    close_sound = sounds.lab_close,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "60kW",
    researching_speed = 1,
    inputs =
    {
      "automation-science-pack",
      "logistic-science-pack",
      "military-science-pack",
      "chemical-science-pack",
      "production-science-pack",
      "utility-science-pack",
      "space-science-pack"
    },
    module_slots = 2,
    icons_positioning =
    {
      {inventory_index = defines.inventory.lab_modules, shift = {0, 0.9}},
      {inventory_index = defines.inventory.lab_input, shift = {0, 0}, max_icons_per_row = 4, separation_multiplier = 1/1.1}
    },
  },
  {
    type = "highlight-box",
    name = "highlight-box",
    hidden = true
  },
  {
    type = "entity-ghost",
    name = "tree-proxy",
    icon = "__base__/graphics/icons/tree-01.png",
    hidden = true
  },
  {
    type = "entity-ghost",
    name = "tree-dying-proxy",
    icons =
    {
      {
        icon = "__base__/graphics/icons/tree-01.png",
      },
      {
        icon = "__core__/graphics/cancel.png"
      }
    },
    hidden = true
  },
  {
    type = "entity-ghost",
    name = "tile-proxy",
    icon = "__base__/graphics/icons/landfill.png",
    hidden = true
  },
  {
    type = "car",
    name = "car",
    icon = "__base__/graphics/icons/car.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"},
    minable = {mining_time = 0.4, result = "car"},
    mined_sound = sounds.deconstruct_medium(0.8),
    max_health = 450,
    is_military_target = true,
    deliver_category = "vehicle",
    corpse = "car-remnants",
    dying_explosion = "car-explosion",
    alert_icon_shift = util.by_pixel(0, -13),
    energy_per_hit_point = 1,
    crash_trigger = crash_trigger(),
    resistances =
    {
      {
        type = "fire",
        percent = 50
      },
      {
        type = "impact",
        percent = 30,
        decrease = 50
      },
      {
        type = "acid",
        percent = 20
      }
    },
    collision_box = {{-0.7, -1}, {0.7, 1}},
    selection_box = {{-0.7, -1}, {0.7, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    effectivity = 0.6,
    braking_power = "200kW",
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      fuel_inventory_size = 1,
      smoke =
      {
        {
          name = "car-smoke",
          deviation = {0.25, 0.25},
          frequency = 200,
          position = {0, 1.5},
          starting_frame = 0,
          starting_frame_deviation = 60
        }
      }
    },
    consumption = "150kW",
    friction = 2e-3,
    light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {-0.6, -14},
        size = 2,
        intensity = 0.6,
        color = {0.92, 0.77, 0.3}
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.6, -14},
        size = 2,
        intensity = 0.6,
        color = {0.92, 0.77, 0.3}
      }
    },
    render_layer = "object",
    light_animation =
    {
      filename = "__base__/graphics/entity/car/car-light.png",
      priority = "low",
      blend_mode = "additive",
      draw_as_glow = true,
      width = 206,
      height = 162,
      line_length = 8,
      direction_count = 64,
      scale = 0.5,
      shift = util.by_pixel(-1 + 2, -6 + 3),
      repeat_count = 2,
    },
    animation =
    {
      layers =
      {
        {
          priority = "low",
          width = 201,
          height = 172,
          frame_count = 2,
          scale = 0.5,
          direction_count = 64,
          shift = util.by_pixel(0+2, -11.5+8.5),
          animation_speed = 8,
          max_advance = 0.2,
          stripes =
          {
          {
          filename = "__base__/graphics/entity/car/car-1.png",
          width_in_frames = 2,
          height_in_frames = 11
          },
          {
          filename = "__base__/graphics/entity/car/car-2.png",
          width_in_frames = 2,
          height_in_frames = 11
          },
          {
          filename = "__base__/graphics/entity/car/car-3.png",
          width_in_frames = 2,
          height_in_frames = 11
          },
          {
          filename = "__base__/graphics/entity/car/car-4.png",
          width_in_frames = 2,
          height_in_frames = 11
          },
          {
          filename = "__base__/graphics/entity/car/car-5.png",
          width_in_frames = 2,
          height_in_frames = 11
          },
          {
          filename = "__base__/graphics/entity/car/car-6.png",
          width_in_frames = 2,
          height_in_frames = 9
          }
          }
        },
        {
          priority = "low",
          width = 199,
          height = 147,
          frame_count = 2,
          apply_runtime_tint = true,
          scale = 0.5,
          direction_count = 64,
          max_advance = 0.2,
          shift = util.by_pixel(0+2, -11+8.5),
          line_length = 1,
          stripes = util.multiplystripes(2,
          {
          {
          filename = "__base__/graphics/entity/car/car-mask-1.png",
          width_in_frames = 1,
          height_in_frames = 13
          },
          {
          filename = "__base__/graphics/entity/car/car-mask-2.png",
          width_in_frames = 1,
          height_in_frames = 13
          },
          {
          filename = "__base__/graphics/entity/car/car-mask-3.png",
          width_in_frames = 1,
          height_in_frames = 13
          },
          {
          filename = "__base__/graphics/entity/car/car-mask-4.png",
          width_in_frames = 1,
          height_in_frames = 13
          },
          {
          filename = "__base__/graphics/entity/car/car-mask-5.png",
          width_in_frames = 1,
          height_in_frames = 12
          }
          })
        },
        {
          priority = "low",
          width = 114,
          height = 76,
          frame_count = 2,
          draw_as_shadow = true,
          direction_count = 64,
          shift = {0.28125, 0.25},
          max_advance = 0.2,
          stripes = util.multiplystripes(2,
          {
            {
              filename = "__base__/graphics/entity/car/car-shadow-1.png",
              width_in_frames = 1,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/car/car-shadow-2.png",
              width_in_frames = 1,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/car/car-shadow-3.png",
              width_in_frames = 1,
              height_in_frames = 20
            }
          })
        }
      }
    },
    turret_animation =
    {
      layers =
      {
        {
          priority = "low",
          width = 71,
          height = 57,
          direction_count = 64,
          shift = util.by_pixel(0+2, -33.5+8.5),
          animation_speed = 8,
          scale = 0.5,
          stripes =
          {
          {
          filename = "__base__/graphics/entity/car/car-turret-1.png",
          width_in_frames = 1,
          height_in_frames = 32
          },
          {
          filename = "__base__/graphics/entity/car/car-turret-2.png",
          width_in_frames = 1,
          height_in_frames = 32
          }
          }
        },
        {
          filename = "__base__/graphics/entity/car/car-turret-shadow.png",
          priority = "low",
          line_length = 8,
          width = 46,
          height = 31,
          draw_as_shadow = true,
          direction_count = 64,
          shift = {0.875, 0.359375}
        }
      }
    },
    turret_rotation_speed = 0.35 / 60,
    sound_no_fuel = { filename = "__base__/sound/fight/car-no-fuel-1.ogg", volume = 0.6 },
    stop_trigger_speed = 0.15,
    stop_trigger =
    {
      {
        type = "play-sound",
        sound = {filename = "__base__/sound/car-breaks.ogg", volume = 0.2 }
      }
    },
    impact_category = "metal",
    impact_speed_to_volume_ratio = 4.0,
    working_sound =
    {
      main_sounds =
      {
        {
          sound = {filename = "__base__/sound/car-engine-driving.ogg", volume = 0.67, modifiers = volume_multiplier("main-menu", 2.2)},
          match_volume_to_activity = true,
          activity_to_volume_modifiers =
          {
            multiplier = 1.8,
            offset = 0.95,
          },
          match_speed_to_activity = true,
          activity_to_speed_modifiers =
          {
            multiplier = 0.8,
            minimum = 1.0,
            maximum = 1.4,
            offset = 0.1,
          }
        },
        {
          sound = { filename = "__base__/sound/car-engine.ogg", volume = 0.67 },
          match_volume_to_activity = true,
          fade_in_ticks = 22,
          activity_to_volume_modifiers =
          {
            multiplier = 2.4,
            offset = 1.5,
            inverted = true
          }
        },
      },
      activate_sound = { filename = "__base__/sound/car-engine-start.ogg", volume = 0.67 },
      deactivate_sound = { filename = "__base__/sound/car-engine-stop.ogg", volume = 0.67 },
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.5 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.4 },
    rotation_speed = 0.015,
    rotation_snap_angle = 0.015,
    weight = 700,
    guns = { "vehicle-machine-gun" },
    inventory_size = 80,
    track_particle_triggers = movement_triggers.car,
    water_reflection = car_reflection(1)
  },
  {
    type = "furnace",
    name = "electric-furnace",
    icon = "__base__/graphics/icons/electric-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "electric-furnace"},
    fast_replaceable_group = "furnace",
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["electric-furnace"],
    max_health = 350,
    corpse = "electric-furnace-remnants",
    dying_explosion = "electric-furnace-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    module_slots = 2,
    icon_draw_specification = {shift = {0, -0.1}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.furnace_modules, shift = {0, 0.8}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    crafting_speed = 2,
    energy_usage = "180kW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 1 }
    },
    impact_category = "metal",
    open_sound = sounds.electric_large_open,
    close_sound = sounds.electric_large_close,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-furnace.ogg",
        volume = 0.85,
        modifiers = volume_multiplier("main-menu", 4.2),
        advanced_volume_control = {attenuation = "exponential"},
        audible_distance_modifier = 0.7,
      },
      max_sounds_per_prototype = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace.png",
            priority = "high",
            width = 239,
            height = 219,
            shift = util.by_pixel(0.75, 5.75),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png",
            priority = "high",
            width = 227,
            height = 171,
            draw_as_shadow = true,
            shift = util.by_pixel(11.25, 7.75),
            scale = 0.5
          }
        }
      },
      working_visualisations =
      {
        {
          fadeout = true,
          animation =
          {
            layers =
            {
              {
                filename = "__base__/graphics/entity/electric-furnace/electric-furnace-heater.png",
                priority = "high",
                width = 60,
                height = 56,
                frame_count = 12,
                animation_speed = 0.5,
                draw_as_glow = true,
                shift = util.by_pixel(1.75, 32.75),
                scale = 0.5
              },
              {
                filename = "__base__/graphics/entity/electric-furnace/electric-furnace-light.png",
                blend_mode = "additive",
                width = 202,
                height = 202,
                repeat_count = 12,
                draw_as_glow = true,
                shift = util.by_pixel(1, 0),
                scale = 0.5,
              },
            }
          },
        },
        {
          fadeout = true,
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-ground-light.png",
            blend_mode = "additive",
            width = 166,
            height = 124,
            draw_as_light = true,
            shift = util.by_pixel(3, 69),
            scale = 0.5,
          },
        },
        {
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-1.png",
            priority = "high",
            width = 37,
            height = 25,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(-20.5, -18.5),
            scale = 0.5
          }
        },
        {
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-2.png",
            priority = "high",
            width = 23,
            height = 15,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(3.5, -38),
            scale = 0.5
          }
        }
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-reflection.png",
          priority = "extra-high",
          width = 24,
          height = 24,
          shift = util.by_pixel(5, 40),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  },
  {
    type = "electric-pole",
    name = "big-electric-pole",
    icon = "__base__/graphics/icons/big-electric-pole.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "big-electric-pole"},
    fast_replaceable_group = "big-electric-pole",
    max_health = 150,
    corpse = "big-electric-pole-remnants",
    dying_explosion = "big-electric-pole-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.65, -0.65}, {0.65, 0.65}},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true}},
    selection_box = {{-1, -1}, {1, 1}},
    damaged_trigger_effect = hit_effects.entity({{-0.5, -2.5},{0.5, 0.5}}),
    drawing_box_vertical_extension = 3,
    maximum_wire_distance = 32,
    supply_area_distance = 2,
    impact_category = "metal",
    open_sound = sounds.electric_network_open,
    close_sound = sounds.electric_network_close,
    track_coverage_during_drag_building = false,
    pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole.png",
          priority = "extra-high",
          width = 148,
          height = 312,
          direction_count = 4,
          shift = util.by_pixel(0, -51),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole-shadow.png",
          priority = "extra-high",
          width = 374,
          height = 94,
          direction_count = 4,
          shift = util.by_pixel(60, 0),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = util.by_pixel_hr(245.0, -34.0),
          red = util.by_pixel_hr(301.0, -0.0),
          green = util.by_pixel_hr(206.0, -0.0)
        },
        wire =
        {
          copper = util.by_pixel_hr(0, -246.0),
          red = util.by_pixel_hr(58.0, -211.0),
          green = util.by_pixel_hr(-58.0, -211.0)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel_hr(279.0, -24.0),
          red = util.by_pixel_hr(284.0, 28.0),
          green = util.by_pixel_hr(204.0, -31.0)
        },
        wire =
        {
          copper = util.by_pixel_hr(34.0, -235.0),
          red = util.by_pixel_hr(41.0, -183.0),
          green = util.by_pixel_hr(-40.0, -240.0)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel_hr(292.0, 0.0),
          red = util.by_pixel_hr(244.0, 41.0),
          green = util.by_pixel_hr(244.0, -41.0)
        },
        wire =
        {
          copper = util.by_pixel_hr(47.0, -212.0),
          red = util.by_pixel_hr(1.0, -170.0),
          green = util.by_pixel_hr(1.0, -251.0)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel_hr(277.0, 23.0),
          red = util.by_pixel_hr(204.0, 30.0),
          green = util.by_pixel_hr(286.0, -29.0)
        },
        wire =
        {
          copper = util.by_pixel_hr(33.0, -188.0),
          red = util.by_pixel_hr(-41.0, -182.5),
          green = util.by_pixel_hr(41.0, -239.0)
        }
      }
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole-reflection.png",
        priority = "extra-high",
        width = 16,
        height = 32,
        shift = util.by_pixel(0, 60),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "electric-pole",
    name = "medium-electric-pole",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    quality_indicator_scale = 0.75,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "medium-electric-pole"},
    max_health = 100,
    corpse = "medium-electric-pole-remnants",
    dying_explosion = "medium-electric-pole-explosion",
    fast_replaceable_group = "electric-pole",
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity({{-0.2, -2.2},{0.2, 0.2}}),
    drawing_box_vertical_extension = 2.3,
    maximum_wire_distance = 9,
    supply_area_distance = 3.5,
    impact_category = "metal",
    open_sound = sounds.electric_network_open,
    close_sound = sounds.electric_network_close,
    pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/medium-electric-pole/medium-electric-pole.png",
          priority = "extra-high",
          width = 84,
          height = 252,
          direction_count = 4,
          shift = util.by_pixel(3.5, -44),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/medium-electric-pole/medium-electric-pole-shadow.png",
          priority = "extra-high",
          width = 280,
          height = 64,
          direction_count = 4,
          shift = util.by_pixel(56.5, -1),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = util.by_pixel_hr(229, -13),
          red = util.by_pixel_hr(246, -2),
          green = util.by_pixel_hr(201, -2)
        },
        wire =
        {
          copper = util.by_pixel_hr(15, -199),
          red = util.by_pixel_hr(43, -179),
          green = util.by_pixel_hr(-15, -185)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel_hr(229, -13),
          red = util.by_pixel_hr(230, 10),
          green = util.by_pixel_hr(196, -23)
        },
        wire =
        {
          copper = util.by_pixel_hr(15, -199),
          red = util.by_pixel_hr(27, -167),
          green = util.by_pixel_hr(-9, -200)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel_hr(229, -13),
          red = util.by_pixel_hr(208, 12),
          green = util.by_pixel_hr(217, -30)
        },
        wire =
        {
          copper = util.by_pixel_hr(15, -199),
          red = util.by_pixel_hr(5, -166),
          green = util.by_pixel_hr(13, -206)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel_hr(229, -13),
          red = util.by_pixel_hr(195, 1),
          green = util.by_pixel_hr(238, -23)
        },
        wire =
        {
          copper = util.by_pixel_hr(15, -199),
          red = util.by_pixel_hr(-12, -175),
          green = util.by_pixel_hr(36, -199)
        }
      }
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/medium-electric-pole/medium-electric-pole-reflection.png",
        priority = "extra-high",
        width = 12,
        height = 28,
        shift = util.by_pixel(0, 55),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "furnace",
    name = "steel-furnace",
    icon = "__base__/graphics/icons/steel-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "steel-furnace"},
    fast_replaceable_group = "furnace",
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["steel-furnace"],
    max_health = 300,
    corpse = "steel-furnace-remnants",
    dying_explosion = "steel-furnace-explosion",
    impact_category = "metal",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    allowed_effects = {"speed", "consumption", "pollution"},
    effect_receiver = {uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true},
    icon_draw_specification = {scale = 0.66, shift = {0, -0.1}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/steel-furnace.ogg",
        volume = 0.32,
        advanced_volume_control = {attenuation = "exponential"},
        audible_distance_modifier = 0.5,
      },
      max_sounds_per_prototype = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    energy_usage = "90kW",
    crafting_speed = 2,
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      emissions_per_minute = { pollution = 4 },
      fuel_inventory_size = 1,
      light_flicker =
      {
        color = {0,0,0},
        minimum_intensity = 0.6,
        maximum_intensity = 0.95
      },
      smoke =
      {
        {
          name = "smoke",
          frequency = 10,
          position = {0.7, -1.2},
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        }
      }
    },
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace.png",
            priority = "high",
            width = 171,
            height = 174,
            shift = util.by_pixel(-1.25, 2),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-shadow.png",
            priority = "high",
            width = 277,
            height = 85,
            draw_as_shadow = true,
            shift = util.by_pixel(39.25, 11.25),
            scale = 0.5
          }
        }
      },
      working_visualisations =
      {
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-fire.png",
            priority = "high",
            line_length = 8,
            width = 57,
            height = 81,
            frame_count = 48,
            draw_as_glow = true,
            shift = util.by_pixel(-0.75, 5.75),
            scale = 0.5
          },
        },
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-glow.png",
            priority = "high",
            width = 60,
            height = 43,
            draw_as_glow = true,
            shift = {0.03125, 0.640625},
            blend_mode = "additive"
          }
        },
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-working.png",
            priority = "high",
            line_length = 1,
            width = 128,
            height = 150,
            draw_as_glow = true,
            shift = util.by_pixel(0, -5),
            blend_mode = "additive",
            scale = 0.5,
          }
        },
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-ground-light.png",
            priority = "high",
            line_length = 1,
            width = 152,
            height = 126,
            draw_as_light = true,
            shift = util.by_pixel(1, 48),
            blend_mode = "additive",
            scale = 0.5,
          },
        },
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace-reflection.png",
          priority = "extra-high",
          width = 20,
          height = 24,
          shift = util.by_pixel(0, 45),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  },

  {
    type = "gate",
    name = "gate",
    icon = "__base__/graphics/icons/gate.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    fast_replaceable_group = "wall",
    minable = {mining_time = 0.1, result = "gate"},
    max_health = 350,
    corpse = "gate-remnants",
    dying_explosion = "gate-explosion",
    factoriopedia_simulation = simulations.factoriopedia_gate,
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    opening_speed = 0.0666666,
    activation_distance = 3,
    timeout_to_close = 5,
    fadeout_interval = 15,
    resistances =
    {
      {
        type = "physical",
        decrease = 3,
        percent = 20
      },
      {
        type = "impact",
        decrease = 45,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      },
      {
        type = "fire",
        percent = 100
      },
      {
        type = "acid",
        percent = 80
      },
      {
        type = "laser",
        percent = 70
      }
    },
    vertical_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/gate-vertical.png",
          line_length = 8,
          width = 78,
          height = 120,
          frame_count = 16,
          shift = util.by_pixel(-1, -13),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/gate/gate-vertical-shadow.png",
          line_length = 8,
          width = 82,
          height = 104,
          frame_count = 16,
          shift = util.by_pixel(9, 9),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    horizontal_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/gate-horizontal.png",
          line_length = 8,
          width = 66,
          height = 90,
          frame_count = 16,
          shift = util.by_pixel(0, -3),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/gate/gate-horizontal-shadow.png",
          line_length = 8,
          width = 122,
          height = 60,
          frame_count = 16,
          shift = util.by_pixel(12, 10),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    horizontal_rail_animation_left =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/gate-rail-horizontal-left.png",
          line_length = 8,
          width = 66,
          height = 74,
          frame_count = 16,
          shift = util.by_pixel(0, -7),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/gate/gate-rail-horizontal-shadow-left.png",
          line_length = 8,
          width = 122,
          height = 60,
          frame_count = 16,
          shift = util.by_pixel(12, 10),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    horizontal_rail_animation_right =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/gate-rail-horizontal-right.png",
          line_length = 8,
          width = 66,
          height = 74,
          frame_count = 16,
          shift = util.by_pixel(0, -7),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/gate/gate-rail-horizontal-shadow-right.png",
          line_length = 8,
          width = 122,
          height = 58,
          frame_count = 16,
          shift = util.by_pixel(12, 11),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    vertical_rail_animation_left =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/gate-rail-vertical-left.png",
          line_length = 8,
          width = 42,
          height = 118,
          frame_count = 16,
          shift = util.by_pixel(0, -13),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/gate/gate-rail-vertical-shadow-left.png",
          line_length = 8,
          width = 82,
          height = 104,
          frame_count = 16,
          shift = util.by_pixel(9, 9),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    vertical_rail_animation_right =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/gate-rail-vertical-right.png",
          line_length = 8,
          width = 42,
          height = 118,
          frame_count = 16,
          shift = util.by_pixel(0, -13),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/gate/gate-rail-vertical-shadow-right.png",
          line_length = 8,
          width = 82,
          height = 104,
          frame_count = 16,
          shift = util.by_pixel(9, 9),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    vertical_rail_base =
    {
      filename = "__base__/graphics/entity/gate/gate-rail-base-vertical.png",
      line_length = 8,
      width = 138,
      height = 130,
      frame_count = 16,
      shift = util.by_pixel(-1, 0),
      scale = 0.5
    },
    horizontal_rail_base =
    {
      filename = "__base__/graphics/entity/gate/gate-rail-base-horizontal.png",
      line_length = 8,
      width = 130,
      height = 104,
      frame_count = 16,
      shift = util.by_pixel(0, 3),
      scale = 0.5
    },
    wall_patch =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/gate-wall-patch.png",
          line_length = 8,
          width = 70,
          height = 94,
          frame_count = 16,
          shift = util.by_pixel(-1, 13),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/gate/gate-wall-patch-shadow.png",
          line_length = 8,
          width = 82,
          height = 72,
          frame_count = 16,
          shift = util.by_pixel(9, 33),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    impact_category = "stone",
    opening_sound = sounds.gate_open,
    closing_sound = sounds.gate_close
  },

  {
    type = "container",
    name = "steel-chest",
    icon = "__base__/graphics/icons/steel-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "steel-chest"},
    max_health = 350,
    corpse = "steel-chest-remnants",
    dying_explosion = "steel-chest-explosion",
    open_sound = sounds.metallic_chest_open,
    close_sound = sounds.metallic_chest_close,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "container",
    inventory_size = 48,
    impact_category = "metal",
    icon_draw_specification = {scale = 0.7},
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steel-chest/steel-chest.png",
          priority = "extra-high",
          width = 64,
          height = 80,
          shift = util.by_pixel(-0.25, -0.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/steel-chest/steel-chest-shadow.png",
          priority = "extra-high",
          width = 110,
          height = 46,
          shift = util.by_pixel(12.25, 8),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "solar-panel",
    name = "solar-panel",
    icon = "__base__/graphics/icons/solar-panel.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "solar-panel"},
    fast_replaceable_group = "solar-panel",
    max_health = 200,
    corpse = "solar-panel-remnants",
    dying_explosion = "solar-panel-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel.png",
          priority = "high",
          width = 230,
          height = 224,
          shift = util.by_pixel(-3, 3.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel-shadow.png",
          priority = "high",
          width = 220,
          height = 180,
          shift = util.by_pixel(9.5, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    overlay =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel-shadow-overlay.png",
          priority = "high",
          width = 214,
          height = 180,
          shift = util.by_pixel(10.5, 6),
          scale = 0.5
        }
      }
    },
    impact_category = "glass",
    production = "60kW"
  },

  {
    type = "accumulator",
    name = "accumulator",
    icon = "__base__/graphics/icons/accumulator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "accumulator"},
    fast_replaceable_group = "accumulator",
    max_health = 150,
    corpse = "accumulator-remnants",
    dying_explosion = "accumulator-explosion",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.5,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "5MJ",
      usage_priority = "tertiary",
      input_flow_limit = "300kW",
      output_flow_limit = "300kW"
    },
    chargable_graphics =
    {
      picture = accumulator_picture(),
      charge_animation = accumulator_charge(),
      charge_cooldown = 30,
      discharge_animation = accumulator_discharge(),
      discharge_cooldown = 60
      --discharge_light = {intensity = 0.7, size = 7, color = {r = 1.0, g = 1.0, b = 1.0}},
    },
    water_reflection = accumulator_reflection(),
    impact_category = "metal",
    open_sound = sounds.electric_large_open,
    close_sound = sounds.electric_large_close,
    working_sound =
    {
      main_sounds =
      {
        {
          sound =
          {
            filename = "__base__/sound/accumulator-working.ogg",
            volume = 0.4,
            modifiers = volume_multiplier("main-menu", 1.44),
            audible_distance_modifier = 0.5
          },
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {offset = 2, inverted = true},
          fade_in_ticks = 4,
          fade_out_ticks = 20
        },
        {
          sound =
          {
            filename = "__base__/sound/accumulator-discharging.ogg",
            volume = 0.4,
            modifiers = volume_multiplier("main-menu", 1.44),
            audible_distance_modifier = 0.5
          },
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {offset = 1},
          fade_in_ticks = 4,
          fade_out_ticks = 20
        }
      },
      idle_sound = {filename = "__base__/sound/accumulator-idle.ogg", volume = 0.35, audible_distance_modifier = 0.5},
      max_sounds_per_prototype = 3,
    },

    circuit_connector = circuit_connector_definitions["accumulator"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_output_signal = {type = "virtual", name = "signal-A"}
  },

  {
    type = "electric-energy-interface",
    name = "hidden-electric-energy-interface",
    icon = "__base__/graphics/icons/solar-panel.png",
    localised_name = {"item-name.solar-panel"},
    hidden = true,
    max_health = 150,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0, -0}, {0, 0}},
    selectable_in_game = false,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "10GJ",
      usage_priority = "tertiary",
      input_flow_limit = "0kW",
      output_flow_limit = "500GW"
    },
    energy_production = "500GW",
    energy_usage = "0kW",
    picture =
    {
      filename = "__core__/graphics/empty.png",
      priority = "extra-high",
      width = 1,
      height = 1
    },
    order = "h-e-e-i"
  }
}
)

data:extend(
{
  {
    type = "assembling-machine",
    name = "assembling-machine-3",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "assembling-machine-3"},
    max_health = 400,
    corpse = "assembling-machine-3-remnants",
    dying_explosion = "assembling-machine-3-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {0, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {0, 1} }},
        secondary_draw_orders = { north = -1 }
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/assembling-machine-t3-1.ogg", volume = 0.45, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.2,
    fast_replaceable_group = "assembling-machine",
    graphics_set =
    {
      animation_progress = 0.5,
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3.png",
            priority = "high",
            width = 214,
            height = 237,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, -0.75),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-shadow.png",
            priority = "high",
            width = 260,
            height = 162,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(28, 4),
            scale = 0.5
          }
        }
      }
    },

    crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid"},
    crafting_speed = 1.25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 2 }
    },
    energy_usage = "375kW",
    module_slots = 4,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"}
  },
  {
    type = "inserter",
    name = "bulk-inserter",
    icon = "__base__/graphics/icons/bulk-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    bulk = true,
    minable = { mining_time = 0.1, result = "bulk-inserter" },
    max_health = 160,
    corpse = "bulk-inserter-remnants",
    dying_explosion = "bulk-inserter-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    damaged_trigger_effect = hit_effects.entity(),
    starting_distance = 0.85,
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = "20kJ",
    energy_per_rotation = "20kJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW"
    },
    extension_speed = 0.1,
    rotation_speed = 0.04,
    filter_count = 5,
    icon_draw_specification = {scale = 0.5},
    fast_replaceable_group = "inserter",
    open_sound = sounds.inserter_open,
    close_sound = sounds.inserter_close,
    working_sound = sounds.inserter_fast,
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/bulk-inserter/bulk-inserter-hand-base.png",
      priority = "extra-high",
      width = 32,
      height = 136,
      scale = 0.25
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/bulk-inserter/bulk-inserter-hand-closed.png",
      priority = "extra-high",
      width = 100,
      height = 164,
      scale = 0.25
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/bulk-inserter/bulk-inserter-hand-open.png",
      priority = "extra-high",
      width = 130,
      height = 164,
      scale = 0.25
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 132,
      scale = 0.25
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/bulk-inserter/bulk-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 100,
      height = 164,
      scale = 0.25
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/bulk-inserter/bulk-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 130,
      height = 164,
      scale = 0.25
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/bulk-inserter/bulk-inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5-1),
        scale = 0.5
      }
    },
    circuit_connector = circuit_connector_definitions["inserter"],
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "land-mine",
    name = "land-mine",
    icon = "__base__/graphics/icons/land-mine.png",
    flags =
    {
      "placeable-player",
      "placeable-enemy",
      "player-creation",
      "placeable-off-grid",
      "not-on-map"
    },
    minable = {mining_time = 0.5, result = "land-mine"},
    fast_replaceable_group = "land-mine",
    mined_sound = sounds.deconstruct_small(1.0),
    max_health = 15,
    corpse = "land-mine-remnants",
    dying_explosion = "land-mine-explosion",
    collision_box = {{-0.4,-0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    picture_safe =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5
    },
    picture_set =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine-set.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5
    },
    picture_set_enemy =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine-set-enemy.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    trigger_radius = 2.5,
    ammo_category = "landmine",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "nested-result",
            affects_target = true,
            action =
            {
              type = "area",
              radius = 6,
              force = "enemy",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = { amount = 250, type = "explosion"}
                  },
                  {
                    type = "create-sticker",
                    sticker = "stun-sticker"
                  }
                }
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = { amount = 1000, type = "explosion"}
          }
        }
      }
    }
  },
  {
    type = "logistic-container",
    name = "passive-provider-chest",
    icon = "__base__/graphics/icons/passive-provider-chest.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "passive-provider-chest"},
    max_health = 350,
    corpse = "passive-provider-chest-remnants",
    dying_explosion = "passive-provider-chest-explosion",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    fast_replaceable_group = "container",
    inventory_size = 48,
    icon_draw_specification = {scale = 0.7},
    logistic_mode = "passive-provider",
    open_sound = sounds.metallic_chest_open,
    close_sound = sounds.metallic_chest_close,
    animation_sound = sounds.logistics_chest_open,
    impact_category = "metal",
    opened_duration = logistic_chest_opened_duration,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/logistic-chest/passive-provider-chest.png",
          priority = "extra-high",
          width = 66,
          height = 74,
          frame_count = 7,
          shift = util.by_pixel(0, -2),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
          priority = "extra-high",
          width = 112,
          height = 46,
          repeat_count = 7,
          shift = util.by_pixel(12, 4.5),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "logistic-container",
    name = "active-provider-chest",
    icon = "__base__/graphics/icons/active-provider-chest.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "active-provider-chest"},
    max_health = 350,
    corpse = "active-provider-chest-remnants",
    dying_explosion = "active-provider-chest-explosion",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    fast_replaceable_group = "container",
    inventory_size = 48,
    icon_draw_specification = {scale = 0.7},
    logistic_mode = "active-provider",
    open_sound = sounds.metallic_chest_open,
    close_sound = sounds.metallic_chest_close,
    animation_sound = sounds.logistics_chest_open,
    impact_category = "metal",
    opened_duration = logistic_chest_opened_duration,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/logistic-chest/active-provider-chest.png",
          priority = "extra-high",
          width = 66,
          height = 74,
          frame_count = 7,
          shift = util.by_pixel(0, -2),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
          priority = "extra-high",
          width = 112,
          height = 46,
          repeat_count = 7,
          shift = util.by_pixel(12, 4.5),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "logistic-container",
    name = "storage-chest",
    icon = "__base__/graphics/icons/storage-chest.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "storage-chest"},
    max_health = 350,
    max_logistic_slots = 1,
    corpse = "storage-chest-remnants",
    dying_explosion = "storage-chest-explosion",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    fast_replaceable_group = "container",
    inventory_size = 48,
    icon_draw_specification = {scale = 0.7},
    logistic_mode = "storage",
    open_sound = sounds.metallic_chest_open,
    close_sound = sounds.metallic_chest_close,
    animation_sound = sounds.logistics_chest_open,
    impact_category = "metal",
    opened_duration = logistic_chest_opened_duration,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/logistic-chest/storage-chest.png",
          priority = "extra-high",
          width = 66,
          height = 74,
          frame_count = 7,
          shift = util.by_pixel(0, -2),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
          priority = "extra-high",
          width = 112,
          height = 46,
          repeat_count = 7,
          shift = util.by_pixel(12, 4.5),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "logistic-container",
    name = "buffer-chest",
    icon = "__base__/graphics/icons/buffer-chest.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "buffer-chest"},
    max_health = 350,
    corpse = "buffer-chest-remnants",
    dying_explosion = "buffer-chest-explosion",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    fast_replaceable_group = "container",
    inventory_size = 48,
    icon_draw_specification = {scale = 0.7},
    trash_inventory_size = 20,
    logistic_mode = "buffer",
    open_sound = sounds.metallic_chest_open,
    close_sound = sounds.metallic_chest_close,
    animation_sound = sounds.logistics_chest_open,
    impact_category = "metal",
    opened_duration = logistic_chest_opened_duration,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/logistic-chest/buffer-chest.png",
          priority = "extra-high",
          width = 66,
          height = 74,
          frame_count = 7,
          shift = util.by_pixel(0, -2),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
          priority = "extra-high",
          width = 112,
          height = 46,
          repeat_count = 7,
          shift = util.by_pixel(12, 4.5),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "logistic-container",
    name = "requester-chest",
    icon = "__base__/graphics/icons/requester-chest.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "requester-chest"},
    max_health = 350,
    corpse = "requester-chest-remnants",
    dying_explosion = "requester-chest-explosion",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    fast_replaceable_group = "container",
    inventory_size = 48,
    icon_draw_specification = {scale = 0.7},
    trash_inventory_size = 20,
    logistic_mode = "requester",
    open_sound = sounds.metallic_chest_open,
    close_sound = sounds.metallic_chest_close,
    animation_sound = sounds.logistics_chest_open,
    impact_category = "metal",
    opened_duration = logistic_chest_opened_duration,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/logistic-chest/requester-chest.png",
          priority = "extra-high",
          width = 66,
          height = 74,
          frame_count = 7,
          shift = util.by_pixel(0, -2),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
          priority = "extra-high",
          width = 112,
          height = 46,
          repeat_count = 7,
          shift = util.by_pixel(12, 4.5),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "rocket-silo",
    name = "rocket-silo",
    icon = "__base__/graphics/icons/rocket-silo.png",
    flags = {"placeable-player", "player-creation"},
    fast_transfer_modules_into_module_slots_only = true,
    crafting_categories = {"rocket-building"},
    fast_replaceable_group = "rocket-silo",
    rocket_parts_required = 100,
    rocket_quick_relaunch_start_offset = -0.625,
    cargo_station_parameters =
    {
      is_input_station = false,
      is_output_station = true,
      hatch_definitions = { silo_cargo_hatch({0, 0}) },
    },
    crafting_speed = 1,
    to_be_inserted_to_rocket_inventory_size = 1,
    logistic_trash_inventory_size = 0,
    icon_draw_specification = {shift = {0, 2}},
    module_slots = 4,
    icons_positioning =
    {
      {inventory_index = defines.inventory.assembling_machine_modules, shift = {0, 3.3}}
    },
    fixed_recipe = "rocket-part",
    show_recipe_icon = false,
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    minable = {mining_time = 1, result = "rocket-silo"},
    max_health = 5000,
    corpse = "rocket-silo-remnants",
    dying_explosion = "rocket-silo-explosion",
    collision_box = {{-4.20, -4.20}, {4.20, 4.20}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    damaged_trigger_effect = hit_effects.entity(),
    hole_clipping_box = { {-2.75, -1.15}, {2.75, 2.25} },
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 60
      }
    },
    impact_category = "metal-large",
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-input"
    },
    energy_usage = "250kW", --energy usage used when crafting the rocket
    lamp_energy_usage = "0kW",
    active_energy_usage = "3990kW",
    rocket_entity = "rocket-silo-rocket",
    times_to_blink = 3,
    light_blinking_speed = 1 / (3 * 60),
    door_opening_speed = 1 / (4.25 * 60),

    base_engine_light =
    {
      intensity = 1,
      size = 25,
      shift = {0, 1.5}
    },

    shadow_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/00-rocket-silo-shadow.png",
      priority = "medium",
      width = 612,
      height = 578,
      draw_as_shadow = true,
      dice = 2,
      shift = util.by_pixel(7, 2),
      scale = 0.5
    },

    hole_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/01-rocket-silo-hole.png",
      width = 400,
      height = 270,
      shift = util.by_pixel(-5, 16),
      scale = 0.5
    },

    hole_light_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/01-rocket-silo-hole-light.png",
      width = 400,
      height = 270,
      shift = util.by_pixel(-5, 16),
      tint = {1,1,1,0},
      scale = 0.5
    },

    rocket_shadow_overlay_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/03-rocket-over-shadow-over-rocket.png",
      width = 426,
      height = 288,
      shift = util.by_pixel(-2, 21),
      scale = 0.5
    },
    rocket_glow_overlay_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/03-rocket-over-glow.png",
      blend_mode = "additive",
      width = 434,
      height = 446,
      shift = util.by_pixel(-3, 36),
      scale = 0.5
    },

    door_back_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/04-door-back.png",
      width = 312,
      height = 286,
      shift = util.by_pixel(37, 12),
      scale = 0.5
    },
    door_back_open_offset = {1.8, -1.8 * 0.43299225},
    door_front_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/05-door-front.png",
      width = 332,
      height = 300,
      shift = util.by_pixel(-28, 33),
      scale = 0.5
    },
    door_front_open_offset = {-1.8, 1.8 * 0.43299225},

    base_day_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/06-rocket-silo.png",
      dice_y = 3,
      width = 608,
      height = 596,
      shift = util.by_pixel(3, -1),
      scale = 0.5
    },

    red_lights_back_sprites =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {1.34375, 0.28125-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {2.3125, 0.9375-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {2.65625, 1.90625-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-2.65625, 1.90625-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-2.3125, 0.9375-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-1.34375, 0.28125-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {0, 0-1.375},
          scale = 0.5
        }
      }
    },

    red_lights_front_sprites =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {2.3125, 2.8125-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {1.34375, 3.40625-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {0, 3.75-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {0, 3.75-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-2.3125, 2.8125-1.375},
          scale = 0.5
        }
      }
    },
    satellite_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/15-rocket-silo-turbine.png",
      priority = "medium",
      width = 54,
      height = 88,
      frame_count = 32,
      line_length = 8,
      animation_speed = 0.4,
      shift = util.by_pixel(-100, 111),
      scale = 0.5
    },

    arm_01_back_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/08-rocket-silo-arms-back.png",
      priority = "medium",
      width = 128,
      height = 150,
      frame_count = 32,
      line_length = 32,
      animation_speed = 0.3,
      shift = util.by_pixel(-53, -84),
      scale = 0.5
    },

    arm_02_right_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/08-rocket-silo-arms-right.png",
      priority = "medium",
      width = 182,
      height = 188,
      frame_count = 32,
      line_length = 32,
      animation_speed = 0.3,
      shift = util.by_pixel(101, -38),
      scale = 0.5
    },

    arm_03_front_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/13-rocket-silo-arms-front.png",
      priority = "medium",
      width = 126,
      height = 228,
      frame_count = 32,
      line_length = 32,
      animation_speed = 0.3,
      shift = util.by_pixel(-51, 16),
      scale = 0.5
    },

    base_front_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/14-rocket-silo-front.png",
      width = 580,
      height = 262,
      shift = util.by_pixel(-1, 78),
      scale = 0.5
    },
    silo_fade_out_start_distance = 8,
    silo_fade_out_end_distance = 15,

    alarm_sound = "__base__/sound/silo-alarm.ogg",
    quick_alarm_sound = {filename = "__base__/sound/silo-alarm-short.ogg", volume = 1.0, aggregation = {max_count = 2, remove = true, count_already_playing = true}},
    clamps_on_sound = {filename = "__base__/sound/silo-clamps-on.ogg", volume = 1.0, aggregation = {max_count = 1, remove = false, count_already_playing = true}},
    clamps_off_sound = {filename = "__base__/sound/silo-clamps-off.ogg", volume = 0.8, aggregation = {max_count = 1, remove = false, count_already_playing = true}},
    doors_sound = {filename = "__base__/sound/silo-doors.ogg", volume = 0.8, aggregation = {max_count = 3, remove = true, count_already_playing = true}},
    raise_rocket_sound = {filename = "__base__/sound/silo-raise-rocket.ogg", volume = 1.0, aggregation = {max_count = 2, remove = true, count_already_playing = true}},
    open_sound = {filename = "__base__/sound/open-close/silo-open.ogg", volume = 0.7},
    close_sound = {filename = "__base__/sound/open-close/silo-close.ogg", volume = 0.7},
    working_sound =
    {
      sound =
        {
          filename = "__base__/sound/rocket-silo-working-1.ogg",
          volume = 0.8,
          aggregation = {max_count = 3, remove = true, count_already_playing = true}
        },
      fade_in_ticks = 10,
      fade_out_ticks = 15
    },
  },
  {
    type = "rocket-silo-rocket",
    name = "rocket-silo-rocket",
    flags = {"not-on-map"},
    hidden = true,
    collision_mask = {layers={}, not_colliding_with_itself=true},
    collision_box = {{-2, -7}, {2, 4}},
    selection_box = {{0, 0}, {0, 0}},
    dying_explosion = "massive-explosion",
    shadow_slave_entity = "rocket-silo-rocket-shadow",
    inventory_size = 0,
    rising_speed = 1 / (7 * 60),
    engine_starting_speed = 1 / (5.5 * 60),
    flying_speed = 1 / (2000 * 60),
    flying_acceleration = 0.01,
    icon_draw_specification = {render_layer = "air-entity-info-icon"},
    glow_light =
    {
      intensity = 1,
      size = 30,
      shift = {0, 1.5},
      color = {1, 1, 1}
    },
    cargo_pod_entity = "cargo-pod",
    rocket_sprite =
    {
    layers =
      {
        util.sprite_load("__base__/graphics/entity/rocket-silo/rocket-static-pod",
      {
        dice_y = 4,
        shift = util.by_pixel( 0, 17.0+rocket_shift),
        scale = 0.5
      }),
      util.sprite_load("__base__/graphics/entity/rocket-silo/rocket-static-emission",
      {
        dice_y = 4,
        shift = util.by_pixel( 0, 17+rocket_shift),
        draw_as_glow = true,
        blend_mode = "additive",
        scale = 0.5
      })
    }
    },

    rocket_shadow_sprite = util.sprite_load("__base__/graphics/entity/rocket-silo/rocket-static-pod-shadow",
    {
      priority = "medium",
      shift = util.by_pixel( -80, -210+rocket_shift),
      draw_as_shadow = true,
      scale = 0.5
    }),
    rocket_glare_overlay_sprite = util.add_shift_offset(util.by_pixel(0, 112+112+rocket_shift),
    {
      filename = "__base__/graphics/entity/rocket-silo/03-rocket-over-glare.png",
      blend_mode = "additive",
      width = 481,
      height = 481,
      shift = util.by_pixel(-2, -2),
      flags = { "linear-magnification", "linear-minification" }
    }),
    rocket_smoke_top1_animation = util.add_shift_offset(util.by_pixel(0-66, -112+28+232+32+rocket_shift),
    {
      filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
      priority = "medium",
      tint = {0.8, 0.8, 1, 0.8 },
      width = 80,
      height = 286,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5/2*1.3,
      shift = util.by_pixel(-1, -3)
    }),
    rocket_smoke_top2_animation = util.add_shift_offset(util.by_pixel(0+17, -112+28+265+32+rocket_shift),
    {
      filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
      priority = "medium",
      tint = {0.8, 0.8, 1, 0.8 },
      width = 80,
      height = 286,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5/2*1.3,
      shift = util.by_pixel(-1, -3)
    }),
    rocket_smoke_top3_animation = util.add_shift_offset(util.by_pixel(0+48, -112+28+252+32+rocket_shift),
    {
      filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
      priority = "medium",
      tint = {0.8, 0.8, 1, 0.8},
      width = 80,
      height = 286,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5/2*1.3,
      shift = util.by_pixel(-1, -3)
    }),

    rocket_smoke_bottom1_animation = util.add_shift_offset(util.by_pixel(0-69, -112+28+205+32+rocket_shift),
    {
      filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
      priority = "medium",
      tint = {0.8, 0.8, 1, 0.7},
      width = 80,
      height = 286,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5/2*1.3,
      shift = util.by_pixel(-1, -3)
    }),
    rocket_smoke_bottom2_animation = util.add_shift_offset(util.by_pixel(0+62, -112+28+207+32+rocket_shift),
    {
      filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
      priority = "medium",
      tint = {0.8, 0.8, 1, 0.7},
      width = 80,
      height = 286,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5/2*1.3,
      shift = util.by_pixel(-1, -3)
    }),
    rocket_flame_animation = util.sprite_load("__base__/graphics/entity/rocket-silo/rocket-jet",
    {
      shift = util.by_pixel( 0, 17+rocket_shift),
      draw_as_glow = true,
      blend_mode = "additive",
      scale = 0.5,
      frame_count = 8,
      animation_speed = 0.5
    }),
    rocket_flame_left_rotation = 0.0611,
    rocket_flame_right_rotation = 0.952,
    rocket_initial_offset = {0, 3},
    rocket_rise_offset = {0, -2.8},
    rocket_launch_offset = {0, -256},
    cargo_attachment_offset = util.by_pixel(0, -63.4),
    rocket_render_layer_switch_distance = 9.5,
    full_render_layer_switch_distance = 11,
    effects_fade_in_start_distance = 4.5,
    effects_fade_in_end_distance = 7.5,
    shadow_fade_out_start_ratio = 0.25,
    shadow_fade_out_end_ratio = 0.75,
    rocket_visible_distance_from_center = 2.75,
    rocket_above_wires_slice_offset_from_center = -3,
    rocket_air_object_slice_offset_from_center = -6,

    flying_sound =
    {
      filename = "__base__/sound/silo-rocket.ogg",
      volume = 1.0,
      modifiers = volume_multiplier("main-menu", 0.6),
      audible_distance_modifier = 6,
      aggregation = {max_count = 3, remove = true, count_already_playing = true, priority = "oldest"}
    }
  },
  {
    type = "rocket-silo-rocket-shadow",
    name = "rocket-silo-rocket-shadow",
    flags = {"not-on-map"},
    hidden = true,
    collision_mask = {layers={}, not_colliding_with_itself=true},
    collision_box = {{0, 0}, {10, 3.5}},
    selection_box = {{0, 0}, {0, 0}}
  },
  {
    type = "rocket-silo-rocket-shadow",
    name = "cargo-pod-shadow",
    flags = {"not-on-map"},
    hidden = true,
    collision_mask = {layers={}, not_colliding_with_itself=true},
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{0, 0}, {0, 0}}
  },
  {
    type = "cargo-landing-pad",
    name = "cargo-landing-pad",
    icon = "__base__/graphics/icons/cargo-landing-pad.png",
    flags = {"placeable-player", "player-creation", "no-automated-item-insertion"},
    collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
    selection_box = {{-4, -4}, {4, 4}},
    build_grid_size = 2,
    max_health = 1000,
    corpse = "cargo-landing-pad-remnants",
    dying_explosion = "rocket-silo-explosion",
    minable = {mining_time = 1, result = "cargo-landing-pad"},
    inventory_size = 80,
    radar_range = 4,
    radar_visualisation_color = {0.059, 0.092, 0.235, 0.275},
    open_sound = sounds.mech_large_open,
    close_sound = sounds.mech_large_close,
    graphics_set =
    {
        water_reflection =
        {
          pictures =
          {
            filename = "__base__/graphics/entity/cargo-hubs/hubs/planet-hub-reflections.png",
            priority = "extra-high",
            width = 64,
            height = 32,
            shift = util.by_pixel(0, 160),
            variation_count = 1,
            scale = 4
          },
          rotate = false,
          orientation_to_variation = false
        },

      connections = require("__base__.graphics.entity.cargo-hubs.connections.planet-connections"),
      picture =
      {
        {
          render_layer = "lower-object-above-shadow",
          layers =
          {
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-0-A",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-0-B",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-0-C",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-0-D",
            {
              scale = 0.5,
              shift = {0, -1}
            })
          }
        },
        {
          render_layer = "lower-object-overlay",
          layers =
          {
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-1-A",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-1-B",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-1-C",
            {
              scale = 0.5,
              shift = {0, -1}
            })
          }
        },
        {
          render_layer = "object-under",
          layers =
          {
          util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-2",
            {
              scale = 0.5,
              shift = {0, -1}
            })
          }
        },
        {
          render_layer = "object",
          layers =
          {
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-3",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-shadow",
            {
              scale = 0.5,
              shift = {8, 0},
              draw_as_shadow = true
            }),
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-emission-A",
            {
              scale = 0.5,
              shift = {0, -1},
              draw_as_glow = true,
              blend_mode = "additive"
            }),
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-emission-C",
            {
              scale = 0.5,
              shift = {0, -1},
              draw_as_glow = true,
              blend_mode = "additive"
            }),
          }
        },
        {
          render_layer = "above-inserters",
          layers =
          {
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hatches/planet-upper-hatch-occluder",
            {
              scale = 0.5,
              shift = {0, -1}
            })
          }
        }
      },
      animation =
      {
        layers =
          {
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-turbine",
            {
              frame_count = 32,
              repeat_count = 1,
              scale = 0.5,
              shift = {0, -0.5},
              animation_speed = 0.5
            })
          }
      }
    },
    robot_landing_location_offset = {-2.1, -2.8},
    robot_opened_duration = logistic_chest_opened_duration,
    robot_animation = util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-drone-hatch",
                      {
                        frame_count = 7,
                        scale = 0.5,
                        shift = {0, -0.5},
                      }),
    robot_animation_sound = sounds.logistics_chest_open,
    cargo_station_parameters =
    {
      is_input_station = true,
      is_output_station = false,
      hatch_definitions =
      {
        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3)
      },
      giga_hatch_definitions =
      {
        planet_upper_giga_hatch({0,1,2, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29})
      }
    },
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["cargo-landing-pad"],
  },
  {
    type = "roboport",
    name = "roboport",
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"placeable-player", "player-creation"},
    fast_replaceable_group = "roboport",
    minable = {mining_time = 0.1, result = "roboport"},
    max_health = 500,
    corpse = "roboport-remnants",
    dying_explosion = "roboport-explosion",
    collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
    selection_box = {{-2, -2}, {2, 2}},
    damaged_trigger_effect = hit_effects.entity(),
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = "5MW",
      buffer_capacity = "100MJ"
    },
    recharge_minimum = "40MJ",
    energy_usage = "50kW",
    -- per one charge slot
    charging_energy = "500kW",
    logistics_radius = 25,
    construction_radius = 55,
    charge_approach_distance = 5,
    robot_slots_count = 7,
    material_slots_count = 7,
    stationing_offset = {0, 0},
    charging_offsets =
    {
      {-1.5, -1}, {1.5, -1}, {1.5, 1}, {-1.5, 1}
    },
    base =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/roboport/roboport-base.png",
          width = 228,
          height = 277,
          shift = util.by_pixel(2, -2.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/roboport/roboport-shadow.png",
          width = 294,
          height = 201,
          draw_as_shadow = true,
          shift = util.by_pixel(28.5, 9.25),
          scale = 0.5
        }
      }
    },
    base_patch =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-patch.png",
      priority = "medium",
      width = 138,
      height = 100,
      shift = util.by_pixel(1.5, -5),
      scale = 0.5
    },
    base_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-animation.png",
      priority = "medium",
      width = 83,
      height = 59,
      frame_count = 8,
      animation_speed = 0.5,
      shift = util.by_pixel(-17.75, -71.25),
      scale = 0.5
    },
    door_animation_up =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-up.png",
      priority = "medium",
      width = 97,
      height = 38,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -39.5),
      scale = 0.5
    },
    door_animation_down =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-down.png",
      priority = "medium",
      width = 97,
      height = 41,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -19.75),
      scale = 0.5
    },
    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      draw_as_glow = true,
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5,
    },
    impact_category = "metal",
    open_sound = {filename = "__base__/sound/open-close/roboport-open.ogg", volume = 0.5},
    close_sound = {filename = "__base__/sound/open-close/roboport-close.ogg", volume = 0.4},
    working_sound =
    {
      sound = {filename = "__base__/sound/roboport-working.ogg", volume = 0.4, audible_distance_modifier = 0.75},
      max_sounds_per_prototype = 3,
    },
    recharging_light = {intensity = 0.2, size = 3, color = {0.5, 0.5, 1}},
    request_to_open_door_timeout = 15,
    spawn_and_station_height = 0.3,
    stationing_render_layer_swap_height = 0.87,
    radar_visualisation_color = {0.059, 0.092, 0.235, 0.275},

    draw_logistic_radius_visualization = true,
    draw_construction_radius_visualization = true,

    open_door_trigger_effect = sounds.roboport_door_open,
    close_door_trigger_effect = sounds.roboport_door_close,

    circuit_connector = circuit_connector_definitions["roboport"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
    default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
    default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
    default_total_construction_output_signal = {type = "virtual", name = "signal-T"},
    default_roboport_count_output_signal = {type = "virtual", name = "signal-R"},

    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/roboport/roboport-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 28,
        shift = util.by_pixel(0, 65),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },

  {
    type = "storage-tank",
    name = "storage-tank",
    icon = "__base__/graphics/icons/storage-tank.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "storage-tank"},
    max_health = 500,
    corpse = "storage-tank-remnants",
    dying_explosion = "storage-tank-explosion",
    collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "storage-tank",
    damaged_trigger_effect = hit_effects.entity(),
    icon_draw_specification = {scale = 1.5, shift = {0, -0.3}},
    fluid_box =
    {
      volume = 25000,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { direction = defines.direction.north, position = {-1, -1} },
        { direction = defines.direction.east, position = {1, 1} },
        { direction = defines.direction.south, position = {1, 1} },
        { direction = defines.direction.west, position = {-1, -1} }
      },
      hide_connection_info = true
    },
    two_direction_only = true,
    window_bounding_box = {{-0.125, 0.6875}, {0.1875, 1.1875}},
    pictures =
    {
      picture =
      {
        sheets =
        {
          {
            filename = "__base__/graphics/entity/storage-tank/storage-tank.png",
            priority = "extra-high",
            frames = 2,
            width = 219,
            height = 235,
            shift = util.by_pixel(-0.25, -1.25),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/storage-tank/storage-tank-shadow.png",
            priority = "extra-high",
            frames = 2,
            width = 291,
            height = 153,
            shift = util.by_pixel(29.75, 22.25),
            scale = 0.5,
            draw_as_shadow = true
          }
        }
      },
      fluid_background =
      {
        filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
        priority = "extra-high",
        width = 32,
        height = 15
      },
      window_background =
      {
        filename = "__base__/graphics/entity/storage-tank/window-background.png",
        priority = "extra-high",
        width = 34,
        height = 48,
        scale = 0.5
      },
      flow_sprite =
      {
        filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
        priority = "extra-high",
        width = 160,
        height = 20
      },
      gas_flow =
      {
        filename = "__base__/graphics/entity/pipe/steam.png",
        priority = "extra-high",
        line_length = 10,
        width = 48,
        height = 30,
        frame_count = 60,
        animation_speed = 0.25,
        scale = 0.5
      }
    },
    flow_length_in_ticks = 360,
    impact_category = "metal-large",
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    working_sound =
    {
      sound = {filename = "__base__/sound/storage-tank.ogg", volume = 0.6, audible_distance_modifier = 0.5},
      match_volume_to_activity = true,
      max_sounds_per_prototype = 3
    },

    circuit_connector = circuit_connector_definitions["storage-tank"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/storage-tank/storage-tank-reflection.png",
        priority = "extra-high",
        width = 24,
        height = 24,
        shift = util.by_pixel(5, 35),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },

  {
    type = "pump",
    name = "pump",
    icon = "__base__/graphics/icons/pump.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "pump"},
    max_health = 180,
    fast_replaceable_group = "pipe",
    corpse = "pump-remnants",
    dying_explosion = "pump-explosion",
    collision_box = {{-0.29, -0.9}, {0.29, 0.9}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    icon_draw_specification = {scale = 0.5},
    working_sound =
    {
      sound = {filename = "__base__/sound/pump.ogg", volume = 0.3, audible_distance_modifier = 0.5},
      max_sounds_per_prototype = 2
    },
    damaged_trigger_effect = hit_effects.entity(),
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "impact",
        percent = 30
      }
    },
    fluid_box =
    {
      volume = 400,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { direction = defines.direction.north, position = {0, -0.5}, flow_direction = "output" },
        { direction = defines.direction.south, position = {0, 0.5}, flow_direction = "input" }
      }
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW"
    },
    energy_usage = "29kW",
    pumping_speed = 20,
    impact_category = "metal",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,

    animations =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north.png",
        width = 103,
        height = 164,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(8, -0.85)
      },
      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east.png",
        width = 130,
        height = 109,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(-0.5, 1.75)
      },

      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south.png",
        width = 114,
        height = 160,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(12.5, -8)
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west.png",
        width = 131,
        height = 111,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(-0.25, 1.25)
      }
    },

    fluid_wagon_connector_frame_count = 35,
    fluid_wagon_connector_alignment_tolerance = 2.0 / 32.0,

    fluid_wagon_connector_graphics = require("prototypes.entity.pump-connector"),

    fluid_animation =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north-liquid.png",
        apply_runtime_tint = true,
        width = 38,
        height = 22,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(-0.250, -16.750)
      },

      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east-liquid.png",
        width = 35,
        height = 46,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(6.25, -8.5)
      },

      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south-liquid.png",
        width = 38,
        height = 45,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(0.5, -9.25)
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west-liquid.png",
        width = 35,
        height = 47,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(-6.5, -9.5)
      }
    },

    glass_pictures =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north-glass.png",
        width = 64,
        height = 128,
        scale = 0.5
      },
      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east-glass.png",
        width = 128,
        height = 192,
        scale = 0.5
      },
      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south-glass.png",
        width = 64,
        height = 128,
        scale = 0.5
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west-glass.png",
        width = 192,
        height = 192,
        scale = 0.5,
        shift = util.by_pixel(-16, 0)
      }
    },

    circuit_connector = circuit_connector_definitions["pump"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "valve",
    name = "one-way-valve",
    icon = "__base__/graphics/entity/one-way-valve/one-way-valve-east.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    minable = {mining_time = 0.1, result = "one-way-valve"},
    fast_replaceable_group = "pipe",
    mode = "one-way",
    flow_rate = 20,
    fluid_box =
    {
      volume = 100,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {direction = defines.direction.north, position = {0, 0}, flow_direction = "output"},
        {direction = defines.direction.south, position = {0, 0}, flow_direction = "input-output"},
      },
    },
    max_health = 100,
    corpse = "pipe-remnants",
    dying_explosion = "pipe-explosion",
    icon_draw_specification = {scale = 0.5},
    animations =
    {
      north = {filename = "__base__/graphics/entity/one-way-valve/one-way-valve-north.png", size = 64, scale = 0.5},
      east = {filename = "__base__/graphics/entity/one-way-valve/one-way-valve-east.png", size = 64, scale = 0.5},
      south = {filename = "__base__/graphics/entity/one-way-valve/one-way-valve-south.png", size = 64, scale = 0.5},
      west = {filename = "__base__/graphics/entity/one-way-valve/one-way-valve-west.png", size = 64, scale = 0.5},
    },
  },
  {
    type = "valve",
    name = "overflow-valve",
    icon = "__base__/graphics/entity/overflow-valve/overflow-valve-east.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    minable = {mining_time = 0.1, result = "overflow-valve"},
    fast_replaceable_group = "pipe",
    mode = "overflow",
    threshold = 0.8,
    flow_rate = 20,
    fluid_box =
    {
      volume = 100,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {direction = defines.direction.north, position = {0, 0}, flow_direction = "output"},
        {direction = defines.direction.south, position = {0, 0}, flow_direction = "input-output"},
      },
    },
    max_health = 100,
    corpse = "pipe-remnants",
    dying_explosion = "pipe-explosion",
    icon_draw_specification = {scale = 0.5},
    animations =
    {
      north = {filename = "__base__/graphics/entity/overflow-valve/overflow-valve-north.png", size = 64, scale = 0.5},
      east = {filename = "__base__/graphics/entity/overflow-valve/overflow-valve-east.png", size = 64, scale = 0.5},
      south = {filename = "__base__/graphics/entity/overflow-valve/overflow-valve-south.png", size = 64, scale = 0.5},
      west = {filename = "__base__/graphics/entity/overflow-valve/overflow-valve-west.png", size = 64, scale = 0.5},
    },
  },
  {
    type = "valve",
    name = "top-up-valve",
    icon = "__base__/graphics/entity/top-up-valve/top-up-valve-east.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    minable = {mining_time = 0.1, result = "top-up-valve"},
    fast_replaceable_group = "pipe",
    mode = "top-up",
    threshold = 0.5,
    flow_rate = 20,
    fluid_box =
    {
      volume = 100,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {direction = defines.direction.north, position = {0, 0}, flow_direction = "output"},
        {direction = defines.direction.south, position = {0, 0}, flow_direction = "input-output"},
      },
    },
    max_health = 100,
    corpse = "pipe-remnants",
    dying_explosion = "pipe-explosion",
    icon_draw_specification = {scale = 0.5},
    animations =
    {
      north = {filename = "__base__/graphics/entity/top-up-valve/top-up-valve-north.png", size = 64, scale = 0.5},
      east = {filename = "__base__/graphics/entity/top-up-valve/top-up-valve-east.png", size = 64, scale = 0.5},
      south = {filename = "__base__/graphics/entity/top-up-valve/top-up-valve-south.png", size = 64, scale = 0.5},
      west = {filename = "__base__/graphics/entity/top-up-valve/top-up-valve-west.png", size = 64, scale = 0.5},
    },
  },
  {
    type = "market",
    name = "market",
    icon = "__base__/graphics/icons/market.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    allow_access_to_all_forces = true,
    order = "d-a-a",
    subgroup = "other",
    max_health = 150,
    corpse = "big-remnants",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    picture =
    {
      filename = "__base__/graphics/entity/market/market.png",
      width = 156,
      height = 127,
      shift = {0.95, 0.2}
    }
  },
  {
    type = "electric-pole",
    name = "substation",
    icon = "__base__/graphics/icons/substation.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "substation"},
    fast_replaceable_group = "substation",
    max_health = 200,
    corpse = "substation-remnants",
    dying_explosion = "substation-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    damaged_trigger_effect = hit_effects.entity({{-0.5, -2.5}, {0.5, 0.5}}),
    drawing_box_vertical_extension = 2,
    maximum_wire_distance = 18,
    supply_area_distance = 9,
    pictures =
    {
      layers =
      {

        {
          filename = "__base__/graphics/entity/substation/substation.png",
          priority = "high",
          width = 138,
          height = 270,
          direction_count = 4,
          shift = util.by_pixel(0, 1-32),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/substation/substation-shadow.png",
          priority = "high",
          width = 370,
          height = 104,
          direction_count = 4,
          shift = util.by_pixel(62, 42-32),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },

    impact_category = "metal",
    open_sound = sounds.electric_network_open,
    close_sound = sounds.electric_network_close,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/substation.ogg",
        volume = 0.4,
        audible_distance_modifier = 0.32,
      },
      max_sounds_per_prototype = 3,
      fade_in_ticks = 30,
      fade_out_ticks = 40,
      use_doppler_shift = false
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = util.by_pixel(136, 8),
          green = util.by_pixel(124, 8),
          red = util.by_pixel(151, 9)
        },
        wire =
        {
          copper = util.by_pixel(0, -86),
          green = util.by_pixel(-21, -82),
          red = util.by_pixel(22, -81)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel(133, 9),
          green = util.by_pixel(144, 21),
          red = util.by_pixel(110, -3)
        },
        wire =
        {
          copper = util.by_pixel(0, -85),
          green = util.by_pixel(15, -70),
          red = util.by_pixel(-15, -92)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel(133, 9),
          green = util.by_pixel(127, 26),
          red = util.by_pixel(127, -8)
        },
        wire =
        {
          copper = util.by_pixel(0, -85),
          green = util.by_pixel(0, -66),
          red = util.by_pixel(0, -97)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel(133, 9),
          green = util.by_pixel(111, 20),
          red = util.by_pixel(144, -3)
        },
        wire =
        {
          copper = util.by_pixel(0, -86),
          green = util.by_pixel(-15, -71),
          red = util.by_pixel(15, -92)
        }
      }
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/substation/substation-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 28,
        shift = util.by_pixel(0, 55),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "beacon",
    name = "beacon",
    icon = "__base__/graphics/icons/beacon.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "beacon"},
    fast_replaceable_group = "beacon",
    max_health = 200,
    corpse = "beacon-remnants",
    dying_explosion = "beacon-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.7,
    allowed_effects = {"consumption", "speed", "pollution"},
    graphics_set = require("prototypes.entity.beacon-animations"),
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
      priority = "extra-high-no-scale",
      width = 10,
      height = 10
    },
    supply_area_distance = 3,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    impact_category = "metal",
    open_sound = {filename = "__base__/sound/open-close/beacon-open.ogg", volume = 0.25},
    close_sound = {filename = "__base__/sound/open-close/beacon-close.ogg", volume = 0.25},
    working_sound =
    {
      sound =
      {
        variations = sound_variations("__base__/sound/beacon", 2, 0.3),
        audible_distance_modifier = 0.33,
      },
      max_sounds_per_prototype = 3
    },
    energy_usage = "480kW",
    distribution_effectivity = 1.5,
    distribution_effectivity_bonus_per_quality_level = 0.2,
    profile = {1,0.7071,0.5773,0.5,0.4472,0.4082,0.3779,0.3535,0.3333,0.3162,0.3015,0.2886,0.2773,0.2672,0.2581,0.25,0.2425,0.2357,0.2294,0.2236,0.2182,0.2132,0.2085,0.2041,0.2,0.1961,0.1924,0.1889,0.1856,0.1825,0.1796,0.1767,0.174,0.1714,0.169,0.1666,0.1643,0.1622,0.1601,0.1581,0.1561,0.1543,0.1524,0.1507,0.149,0.1474,0.1458,0.1443,0.1428,0.1414,0.14,0.1386,0.1373,0.136,0.1348,0.1336,0.1324,0.1313,0.1301,0.129,0.128,0.127,0.1259,0.125,0.124,0.123,0.1221,0.1212,0.1203,0.1195,0.1186,0.1178,0.117,0.1162,0.1154,0.1147,0.1139,0.1132,0.1125,0.1118,0.1111,0.1104,0.1097,0.1091,0.1084,0.1078,0.1072,0.1066,0.1059,0.1054,0.1048,0.1042,0.1036,0.1031,0.1025,0.102,0.1015,0.101,0.1005,0.1},
    beacon_counter = "same_type",
    module_slots = 2,
    icons_positioning =
    {
      {inventory_index = defines.inventory.beacon_modules, shift = {0, 0}, multi_row_initial_height_modifier = -0.3, max_icons_per_row = 2}
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/beacon/beacon-reflection.png",
        priority = "extra-high",
        width = 18,
        height = 29,
        shift = util.by_pixel(0, 55),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    name = "poison-cloud",
    type = "smoke-with-trigger",
    flags = {"not-on-map"},
    hidden = true,
    show_when_smoke_off = true,
    particle_count = 16,
    particle_spread = { 3.6 * 1.05, 3.6 * 0.6 * 1.05 },
    particle_distance_scale_factor = 0.5,
    particle_scale_factor = { 1, 0.707 },
    wave_speed = { 1/80, 1/60 },
    wave_distance = { 0.3, 0.2 },
    spread_duration_variation = 20,
    particle_duration_variation = 60 * 3,
    render_layer = "object",

    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 20,
    fade_away_duration = 2 * 60,
    spread_duration = 20,
    color = {0.239, 0.875, 0.992, 0.690}, -- #3ddffdb0,

    animation =
    {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png",
      flags = { "smoke" }
    },

    created_effect =
    {
      {
        type = "cluster",
        cluster_count = 10,
        distance = 4,
        distance_deviation = 5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-smoke",
              show_in_tooltip = false,
              entity_name = "poison-cloud-visual-dummy",
              initial_height = 0
            },
            {
              type = "play-sound",
              sound = sounds.poison_capsule_explosion
            }
          }
        }
      },
      {
        type = "cluster",
        cluster_count = 11,
        distance = 8 * 1.1,
        distance_deviation = 2,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-smoke",
              show_in_tooltip = false,
              entity_name = "poison-cloud-visual-dummy",
              initial_height = 0
            }
          }
        }
      }
    },
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            radius = 11,
            entity_flags = {"breaths-air"},
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 8, type = "poison"}
              }
            }
          }
        }
      }
    },
    action_cooldown = 30
  },

  {
    type = "car",
    name = "tank",
    icon = "__base__/graphics/icons/tank.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"},
    minable = {mining_time = 0.5, result = "tank"},
    mined_sound = sounds.deconstruct_large(0.8),
    max_health = 2000,
    is_military_target = true,
    deliver_category = "vehicle",
    corpse = "tank-remnants",
    dying_explosion = "tank-explosion",
    alert_icon_shift = util.by_pixel(0, -13),
    immune_to_tree_impacts = true,
    immune_to_rock_impacts = true,
    energy_per_hit_point = 0.5,
    allow_remote_driving = true,
    equipment_grid = "medium-equipment-grid",
    trash_inventory_size = 20,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 60
      },
      {
        type = "physical",
        decrease = 15,
        percent = 60
      },
      {
        type = "impact",
        decrease = 50,
        percent = 80
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 70
      },
      {
        type = "acid",
        decrease = 0,
        percent = 70
      }
    },
    collision_box = {{-0.9, -1.3}, {0.9, 1.3}},
    selection_box = {{-0.9, -1.3}, {0.9, 1.3}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.5,
    effectivity = 0.9,
    braking_power = "800kW",
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      fuel_inventory_size = 2,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0, 1.5},
          starting_frame = 0,
          starting_frame_deviation = 60
        }
      }
    },
    consumption = "600kW",
    terrain_friction_modifier = 0.2,
    friction = 0.002,
    light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {-0.1, -14 + tank_shift_y / 32},
        size = 2,
        intensity = 0.8,
        color = {1, 1, 0.8},
        source_orientation_offset = -0.02
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.1, -14 + tank_shift_y / 32},
        size = 2,
        intensity = 0.8,
        color = {1, 1, 0.8},
        source_orientation_offset = 0.02
      }
    },
    light_animation =
    {
      filename = "__base__/graphics/entity/tank/tank-light.png",
      priority = "low",
      blend_mode = "additive",
      draw_as_glow = true,
      width = 260,
      height = 210,
      line_length = 8,
      direction_count = 64,
      scale = 0.5,
      shift = util.by_pixel(-1, -17 + 6),
      repeat_count = 2,
    },
    animation =
    {
      layers =
      {
        {
          priority = "low",
          width = 270,
          height = 212,
          frame_count = 2,
          direction_count = 64,
          shift = util.by_pixel(0, -16 + tank_shift_y),
          animation_speed = 8,
          max_advance = 1,
          stripes =
          {
            {
              filename = "__base__/graphics/entity/tank/tank-base-1.png",
              width_in_frames = 2,
              height_in_frames = 16
            },
            {
              filename = "__base__/graphics/entity/tank/tank-base-2.png",
              width_in_frames = 2,
              height_in_frames = 16
            },
            {
              filename = "__base__/graphics/entity/tank/tank-base-3.png",
              width_in_frames = 2,
              height_in_frames = 16
            },
            {
              filename = "__base__/graphics/entity/tank/tank-base-4.png",
              width_in_frames = 2,
              height_in_frames = 16
            }
          },
          scale = 0.5
        },
        {
          priority = "low",
          width = 208,
          height = 166,
          frame_count = 2,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = util.by_pixel(0, -27.5 + tank_shift_y),
          max_advance = 1,
          line_length = 2,
          stripes = util.multiplystripes(2,
          {
            {
              filename = "__base__/graphics/entity/tank/tank-base-mask-1.png",
              width_in_frames = 1,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/tank/tank-base-mask-2.png",
              width_in_frames = 1,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/tank/tank-base-mask-3.png",
              width_in_frames = 1,
              height_in_frames = 20
            }
          }),
          scale = 0.5
        },
        {
          priority = "low",
          width = 302,
          height = 194,
          frame_count = 2,
          draw_as_shadow = true,
          direction_count = 64,
          shift = util.by_pixel(22.5, 1 + tank_shift_y),
          max_advance = 1,
          stripes = util.multiplystripes(2,
          {
            {
              filename = "__base__/graphics/entity/tank/tank-base-shadow-1.png",
              width_in_frames = 1,
              height_in_frames = 16
            },
            {
              filename = "__base__/graphics/entity/tank/tank-base-shadow-2.png",
              width_in_frames = 1,
              height_in_frames = 16
            },
            {
              filename = "__base__/graphics/entity/tank/tank-base-shadow-3.png",
              width_in_frames = 1,
              height_in_frames = 16
            },
            {
              filename = "__base__/graphics/entity/tank/tank-base-shadow-4.png",
              width_in_frames = 1,
              height_in_frames = 16
            }
          }),
          scale = 0.5
        }
      }
    },
    turret_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/tank/tank-turret.png",
          priority = "low",
          line_length = 8,
          width = 179,
          height = 132,
          direction_count = 64,
          shift = util.by_pixel(2.25-2, -40.5 + tank_shift_y),
          animation_speed = 8,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/tank/tank-turret-mask.png",
          priority = "low",
          line_length = 8,
          width = 72,
          height = 66,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = util.by_pixel(2-2, -41.5 + tank_shift_y),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/tank/tank-turret-shadow.png",
          priority = "low",
          line_length = 8,
          width = 193,
          height = 134,
          draw_as_shadow = true,
          direction_count = 64,
          shift = util.by_pixel(58.25-2, 0.5 + tank_shift_y),
          scale = 0.5
        }
      }
    },
    turret_rotation_speed = 0.35 / 60,
    turret_return_timeout = 300,
    sound_no_fuel = { filename = "__base__/sound/fight/tank-no-fuel-1.ogg", volume = 0.4 },
    impact_category = "metal-large",
    impact_speed_to_volume_ratio = 5.0,
    working_sound =
    {
      main_sounds =
      {
        {
          sound = { filename = "__base__/sound/fight/tank-engine-driving.ogg", volume = 0.35, modifiers = volume_multiplier("main-menu", 1.3) },
          match_volume_to_activity = true,
          activity_to_volume_modifiers =
          {
            multiplier = 4.5,
            offset = 1.0,
          },
          match_speed_to_activity = true,
          activity_to_speed_modifiers =
          {
            multiplier = 3.0,
            minimum = 1.0,
            maximum = 1.2,
            offset = 0.8
          }
        },
        {
          sound = { filename = "__base__/sound/fight/tank-tracks.ogg", volume = 0.35, modifiers = volume_multiplier("main-menu", 1.3) },
          match_volume_to_activity = true,
          activity_to_volume_modifiers =
          {
            multiplier = 4.5,
            offset = 1.0,
          },
        },
        {
          sound = { filename = "__base__/sound/fight/tank-engine.ogg", volume = 0.67 },
          match_volume_to_activity = true,
          fade_in_ticks = 22,
          fade_out_ticks = 4,
          activity_to_volume_modifiers =
          {
            multiplier = 1.75,
            offset = 1.3,
            inverted = true
          }
        },
      },
      activate_sound = { filename = "__base__/sound/fight/tank-engine-start.ogg", volume = 0.37 },
      deactivate_sound = { filename = "__base__/sound/fight/tank-engine-stop.ogg", volume = 0.37 },
    },
    stop_trigger_speed = 0.1,
    stop_trigger =
    {
      {
        type = "play-sound",
        sound = { filename = "__base__/sound/fight/tank-brakes.ogg", volume = 0.3 }
      }
    },
    open_sound = { filename = "__base__/sound/fight/tank-door-open.ogg", volume=0.48 },
    close_sound = { filename = "__base__/sound/fight/tank-door-close.ogg", volume = 0.43 },
    rotation_speed = 0.0035,
    rotation_snap_angle = 0.01,
    tank_driving = true,
    weight = 20000,
    inventory_size = 80,
    track_particle_triggers = movement_triggers.tank,
    guns = { "tank-cannon", "tank-machine-gun", "tank-flamethrower" },
    water_reflection = car_reflection(1.2)
  },
  {
    type = "smoke-with-trigger",
    name = "poison-cloud-visual-dummy",
    flags = {"not-on-map"},
    hidden = true,
    show_when_smoke_off = true,
    particle_count = 24,
    particle_spread = { 3.6 * 1.05, 3.6 * 0.6 * 1.05 },
    particle_distance_scale_factor = 0.5,
    particle_scale_factor = { 1, 0.707 },
    particle_duration_variation = 60 * 3,
    wave_speed = { 0.5 / 80, 0.5 / 60 },
    wave_distance = { 1, 0.5 },
    spread_duration_variation = 300 - 20,

    render_layer = "object",

    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 20 + 4 * 60,
    fade_away_duration = 3 * 60,
    spread_duration = (300 - 20) / 2 ,
    color = {0.014, 0.358, 0.395, 0.322}, -- #035b6452

    animation =
    {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png",
      flags = { "smoke" }
    },
    working_sound =
    {
      sound = {filename = "__base__/sound/fight/poison-cloud.ogg", volume = 0.5, audible_distance_modifier = 0.8},
      max_sounds_per_prototype = 1,
      match_volume_to_activity = true
    }
  },

  {
    type = "sticker",
    name = "slowdown-sticker",
    hidden = true,
    animation =
    {
      filename = "__base__/graphics/entity/slowdown-sticker/slowdown-sticker.png",
      line_length = 5,
      width = 42,
      height = 48,
      frame_count = 50,
      animation_speed = 0.5,
      tint = {1.000, 0.663, 0.000, 0.694}, -- #ffa900b1
      shift = util.by_pixel(2, -0.5),
      scale = 0.5
    },
    duration_in_ticks = 30 * 60,
    target_movement_modifier = 0.25
  },
  {
    type = "sticker",
    name = "stun-sticker",
    flags = {"not-on-map"},
    hidden = true,
    duration_in_ticks = 3*60,
    target_movement_modifier = 0
  },
  {
    type = "sticker",
    name = "electric-mini-stun",
    flags = {"not-on-map"},
    hidden = true,
    duration_in_ticks = 40,
    target_movement_modifier = 0.2
  },

  {
    type = "assembling-machine",
    name = "oil-refinery",
    icon = "__base__/graphics/icons/oil-refinery.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.2, result = "oil-refinery"},
    fast_replaceable_group = "oil-refinery",
    max_health = 350,
    corpse = "oil-refinery-remnants",
    dying_explosion = "oil-refinery-explosion",
    icon_draw_specification = {scale = 2, shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["oil-refinery"],
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true, meltable=true}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.3,
    module_slots = 3,
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"oil-processing"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 6 }
    },
    energy_usage = "420kW",

    graphics_set =
    {
      animation = make_4way_animation_from_spritesheet(
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/oil-refinery/oil-refinery.png",
            width = 386,
            height = 430,
            shift = util.by_pixel(0, -7.5),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/oil-refinery/oil-refinery-shadow.png",
            width = 674,
            height = 426,
            shift = util.by_pixel(82.5, 26.5),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }),

      working_visualisations =
      {
        {
          fadeout = true,
          constant_speed = true,
          north_position = util.by_pixel(34, -65),
          east_position = util.by_pixel(-52, -61),
          south_position = util.by_pixel(-59, -82),
          west_position = util.by_pixel(57, -58),
          animation =
          {
            filename = "__base__/graphics/entity/oil-refinery/oil-refinery-fire.png",
            line_length = 10,
            width = 40,
            height = 81,
            frame_count = 60,
            animation_speed = 0.75,
            scale = 0.5,
            draw_as_glow = true,
            shift = util.by_pixel(0, -14.25)
          },
        },
        {
          fadeout = true,
          north_animation =
          {
            filename = "__base__/graphics/entity/oil-refinery/oil-refinery-light.png",
            width = 321,
            height = 205,
            blend_mode = "additive",
            draw_as_glow = true,
            shift = util.by_pixel(-1, -50),
            scale = 0.5,
          },
          east_animation =
          {
            filename = "__base__/graphics/entity/oil-refinery/oil-refinery-light.png",
            width = 321,
            x = 321;
            height = 205,
            blend_mode = "additive",
            draw_as_glow = true,
            shift = util.by_pixel(-1, -50),
            scale = 0.5,
          },
          south_animation =
          {
            filename = "__base__/graphics/entity/oil-refinery/oil-refinery-light.png",
            width = 321,
            x = 321 * 2;
            height = 205,
            blend_mode = "additive",
            draw_as_glow = true,
            shift = util.by_pixel(-1, -50),
            scale = 0.5,
          },
          west_animation =
          {
            filename = "__base__/graphics/entity/oil-refinery/oil-refinery-light.png",
            width = 321,
            x = 321 * 3;
            height = 205,
            blend_mode = "additive",
            draw_as_glow = true,
            shift = util.by_pixel(-1, -50),
            scale = 0.5,
          },
        }
      }
    },
    impact_category = "metal-large",
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/oil-refinery.ogg" },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.south,
            position = {-1, 2}
          }
        }
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.south,
            position = {1, 2}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.north,
            position = {-2, -2}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.north,
            position = {0, -2}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.north,
            position = {2, -2}
          }
        }
      }
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/oil-refinery/oil-refinery-reflection.png",
        priority = "extra-high",
        width = 40,
        height = 48,
        shift = util.by_pixel(5, 95),
        variation_count = 4,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    }
  },

  {
    type = "assembling-machine",
    name = "chemical-plant",
    icon = "__base__/graphics/icons/chemical-plant.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "chemical-plant"},
    fast_replaceable_group = "chemical-plant",
    max_health = 300,
    corpse = "chemical-plant-remnants",
    dying_explosion = "chemical-plant-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["chemical-plant"],
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.4,
    module_slots = 3,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},

    graphics_set =
    {
      animation = make_4way_animation_from_spritesheet({ layers =
      {
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant.png",
          width = 220,
          height = 292,
          frame_count = 24,
          line_length = 12,
          shift = util.by_pixel(0.5, -9),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-shadow.png",
          width = 312,
          height = 222,
          repeat_count = 24,
          shift = util.by_pixel(27, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }}),
      working_visualisations =
      {
        {
          apply_recipe_tint = "primary",
          north_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-north.png",
            frame_count = 24,
            line_length = 6,
            width = 66,
            height = 44,
            shift = util.by_pixel(23, 15),
            scale = 0.5
          },
          east_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-east.png",
            frame_count = 24,
            line_length = 6,
            width = 70,
            height = 36,
            shift = util.by_pixel(0, 22),
            scale = 0.5
          },
          south_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-south.png",
            frame_count = 24,
            line_length = 6,
            width = 66,
            height = 42,
            shift = util.by_pixel(0, 17),
            scale = 0.5
          },
          west_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-west.png",
            frame_count = 24,
            line_length = 6,
            width = 74,
            height = 36,
            shift = util.by_pixel(-10, 13),
            scale = 0.5
          }
        },
        {
          apply_recipe_tint = "secondary",
          north_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-north.png",
            frame_count = 24,
            line_length = 6,
            width = 62,
            height = 42,
            shift = util.by_pixel(24, 15),
            scale = 0.5
          },
          east_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-east.png",
            frame_count = 24,
            line_length = 6,
            width = 68,
            height = 36,
            shift = util.by_pixel(0, 22),
            scale = 0.5
          },
          south_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-south.png",
            frame_count = 24,
            line_length = 6,
            width = 60,
            height = 40,
            shift = util.by_pixel(1, 17),
            scale = 0.5
          },
          west_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-west.png",
            frame_count = 24,
            line_length = 6,
            width = 68,
            height = 28,
            shift = util.by_pixel(-9, 15),
            scale = 0.5
          }
        },
        {
          apply_recipe_tint = "tertiary",
          fadeout = true,
          constant_speed = true,
          north_position = util.by_pixel_hr(-30, -161),
          east_position = util.by_pixel_hr(29, -150),
          south_position = util.by_pixel_hr(12, -134),
          west_position = util.by_pixel_hr(-32, -130),
          render_layer = "wires",
          animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
            frame_count = 47,
            line_length = 16,
            width = 90,
            height = 188,
            animation_speed = 0.5,
            shift = util.by_pixel(-2, -40),
            scale = 0.5
          }
        },
        {
          apply_recipe_tint = "quaternary",
          fadeout = true,
          constant_speed = true,
          north_position = util.by_pixel_hr(-30, -161),
          east_position = util.by_pixel_hr(29, -150),
          south_position = util.by_pixel_hr(12, -134),
          west_position = util.by_pixel_hr(-32, -130),
          render_layer = "wires",
          animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
            frame_count = 47,
            line_length = 16,
            width = 40,
            height = 84,
            animation_speed = 0.5,
            shift = util.by_pixel(0, -14),
            scale = 0.5
          }
        }
      }
    },
    impact_category = "metal-large",
    open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
    close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
    working_sound =
    {
      sound = sound_variations("__base__/sound/chemical-plant", 3, 0.5),
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 4 }
    },
    energy_usage = "210kW",
    crafting_categories = {"chemistry"},
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {-1, -1}
          }
        }
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {1, -1}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {-1, 1}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {1, 1}
          }
        }
      }
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 36,
        shift = util.by_pixel(5, 60),
        variation_count = 4,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    }
  },

  {
    type = "electric-energy-interface",
    name = "electric-energy-interface",
    icons = {{icon = "__base__/graphics/icons/accumulator.png", tint = {1, 0.8, 1, 1}}},
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    minable = {mining_time = 0.1, result = "electric-energy-interface"},
    max_health = 150,
    corpse = "medium-remnants",
    subgroup = "other",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.5,
    gui_mode = "all",
    allow_copy_paste = true,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "10GJ",
      usage_priority = "tertiary"
    },

    energy_production = "500GW",
    energy_usage = "0kW",
    -- also 'pictures' for 4-way sprite is available, or 'animation' resp. 'animations'
    picture = accumulator_picture( {1, 0.8, 1, 1} ),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
  },
  {
    type = "reactor",
    name = "nuclear-reactor",
    icon  = "__base__/graphics/icons/nuclear-reactor.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "nuclear-reactor"},
    fast_replaceable_group = "reactor",
    max_health = 500,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    consumption = "40MW",
    neighbour_bonus = 1,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"nuclear"},
      effectivity = 1,
      fuel_inventory_size = 1,
      burnt_inventory_size = 1,
      light_flicker =
      {
        color = {0,0,0},
        minimum_intensity = 0.7,
        maximum_intensity = 0.95
      }
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    lower_layer_picture =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes.png",
      width = 320,
      height = 316,
      scale = 0.5,
      shift = util.by_pixel(-1, -5)
    },
    heat_lower_layer_picture = apply_heat_pipe_glow
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes-heated.png",
      width = 320,
      height = 316,
      scale = 0.5,
      shift = util.by_pixel(-0.5, -4.5)
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/nuclear-reactor/reactor.png",
          width = 302,
          height = 318,
          scale = 0.5,
          shift = util.by_pixel(-5, -7)
        },
        {
          filename = "__base__/graphics/entity/nuclear-reactor/reactor-shadow.png",
          width = 525,
          height = 323,
          scale = 0.5,
          shift = { 1.625, 0 },
          draw_as_shadow = true
        }
      }
    },

    working_light_picture =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-lights-color.png",
      blend_mode = "additive",
      draw_as_glow = true,
      width = 320,
      height = 320,
      scale = 0.5,
      shift = { -0.03125, -0.1875 },
    },

    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "10MJ",
      max_transfer = "10GW",
      minimum_glow_temperature = 350,
      connections =
      {
        {
          position = {-2, -2},
          direction = defines.direction.north
        },
        {
          position = {0, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.east
        },
        {
          position = {2, 0},
          direction = defines.direction.east
        },
        {
          position = {2, 2},
          direction = defines.direction.east
        },
        {
          position = {2, 2},
          direction = defines.direction.south
        },
        {
          position = {0, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.west
        },
        {
          position = {-2, 0},
          direction = defines.direction.west
        },
        {
          position = {-2, -2},
          direction = defines.direction.west
        }
      },

      heat_picture = apply_heat_pipe_glow
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-heated.png",
        width = 216,
        height = 256,
        scale = 0.5,
        shift = util.by_pixel(3, -6.5)
      },
    },

    connection_patches_connected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 64,
        height = 64,
        variation_count = 12,
        scale = 0.5
      }
    },

    connection_patches_disconnected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 64,
        height = 64,
        variation_count = 12,
        y = 64,
        scale = 0.5
      }
    },

    heat_connection_patches_connected =
    {
      sheet = apply_heat_pipe_glow
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
        width = 64,
        height = 64,
        variation_count = 12,
        scale = 0.5
      }
    },

    heat_connection_patches_disconnected =
    {
      sheet = apply_heat_pipe_glow
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
        width = 64,
        height = 64,
        variation_count = 12,
        y = 64,
        scale = 0.5
      }
    },

    impact_category = "metal-large",
    open_sound = {filename = "__base__/sound/open-close/nuclear-open.ogg", volume = 0.8},
    close_sound = {filename = "__base__/sound/open-close/nuclear-close.ogg", volume = 0.8},
    working_sound =
    {
      sound = sound_variations("__base__/sound/nuclear-reactor", 2, 0.55, volume_multiplier("main-menu", 0.8)),
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    meltdown_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "atomic-rocket"
          }
        }
      }
    },

    default_temperature_signal = {type = "virtual", name = "signal-T"},
    circuit_wire_max_distance = reactor_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["nuclear-reactor"],
  },
  {
    type = "assembling-machine",
    name = "centrifuge",
    icon = "__base__/graphics/icons/centrifuge.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "centrifuge"},
    fast_replaceable_group = "centrifuge",
    max_health = 350,
    corpse = "centrifuge-remnants",
    dying_explosion = "centrifuge-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["centrifuge"],
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.7,

    graphics_set =
    {
      always_draw_idle_animation = true,
      idle_animation =
      {
        layers =
        {
          -- Centrifuge A
          {
            filename = "__base__/graphics/entity/centrifuge/centrifuge-C.png",
            priority = "high",
            scale = 0.5,
            line_length = 8,
            width = 237,
            height = 214,
            frame_count = 64,
            shift = util.by_pixel(-0.25, -26.5)
          },
          {
            filename = "__base__/graphics/entity/centrifuge/centrifuge-C-shadow.png",
            draw_as_shadow = true,
            priority = "high",
            scale = 0.5,
            line_length = 8,
            width = 279,
            height = 152,
            frame_count = 64,
            shift = util.by_pixel(16.75, -10)
          },
          -- Centrifuge B
          {
            filename = "__base__/graphics/entity/centrifuge/centrifuge-B.png",
            priority = "high",
            scale = 0.5,
            line_length = 8,
            width = 156,
            height = 234,
            frame_count = 64,
            shift = util.by_pixel(23, 6.5)
          },
          {
            filename = "__base__/graphics/entity/centrifuge/centrifuge-B-shadow.png",
            draw_as_shadow = true,
            priority = "high",
            scale = 0.5,
            line_length = 8,
            width = 251,
            height = 149,
            frame_count = 64,
            shift = util.by_pixel(63.25, 15.25)
          },
          -- Centrifuge A
          {
            filename = "__base__/graphics/entity/centrifuge/centrifuge-A.png",
            priority = "high",
            scale = 0.5,
            line_length = 8,
            width = 139,
            height = 246,
            frame_count = 64,
            shift = util.by_pixel(-26.25, 3.5)
          },
          {
            filename = "__base__/graphics/entity/centrifuge/centrifuge-A-shadow.png",
            priority = "high",
            draw_as_shadow = true,
            scale = 0.5,
            line_length = 8,
            width = 230,
            height = 124,
            frame_count = 64,
            shift = util.by_pixel(8.5, 23.5)
          }
        }
      },

      working_visualisations =
      {
        {
          effect = "uranium-glow",
          fadeout = true,
          light = {intensity = 0.2, size = 9.9, shift = {0, 0}, color = {0, 1, 0}}
        },
        {
          effect = "uranium-glow",
          fadeout = true,
          animation =
          {
            layers =
            {
              -- Centrifuge C
              {
                filename = "__base__/graphics/entity/centrifuge/centrifuge-C-light.png",
                priority = "high",
                scale = 0.5,
                blend_mode = "additive", -- centrifuge
                line_length = 8,
                width = 190,
                height = 207,
                frame_count = 64,
                draw_as_glow = true,
                shift = util.by_pixel(0, -27.25)
              },
              -- Centrifuge B
              {
                filename = "__base__/graphics/entity/centrifuge/centrifuge-B-light.png",
                priority = "high",
                scale = 0.5,
                blend_mode = "additive", -- centrifuge
                line_length = 8,
                width = 131,
                height = 206,
                frame_count = 64,
                draw_as_glow = true,
                shift = util.by_pixel(16.75, 0.5)
              },
              -- Centrifuge A
              {
                filename = "__base__/graphics/entity/centrifuge/centrifuge-A-light.png",
                priority = "high",
                scale = 0.5,
                blend_mode = "additive", -- centrifuge
                line_length = 8,
                width = 108,
                height = 197,
                frame_count = 64,
                draw_as_glow = true,
                shift = util.by_pixel(-23.5, -1.75)
              }
            }
          }
        }
      }
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal-large",
    working_sound =
    {
      sound = sound_variations("__base__/sound/centrifuge", 3, 0.3, volume_multiplier("main-menu", 1.5) ),
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    crafting_speed = 1,
    crafting_categories = {"centrifuging"},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 4 }
    },
    energy_usage = "350kW",
    module_slots = 2,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/centrifuge/centrifuge-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 32,
        shift = util.by_pixel(0, 65),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "boiler",
    name = "heat-exchanger",
    icon = "__base__/graphics/icons/heat-boiler.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "heat-exchanger"},
    fast_replaceable_group = "heat-exchanger",
    max_health = 200,
    corpse = "heat-exchanger-remnants",
    dying_explosion = "heat-exchanger-explosion",
    impact_category = "metal",
    mode = "output-to-separate-pipe",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-1.29, -0.79}, {1.29, 0.79}},
    selection_box = {{-1.5, -1}, {1.5, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    target_temperature = 500,
    fluid_box =
    {
      volume = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {flow_direction = "input-output", direction = defines.direction.west, position = {-1, 0.5}},
        {flow_direction = "input-output", direction = defines.direction.east, position = {1, 0.5}}
      },
      production_type = "input",
      filter = "water"
    },
    output_fluid_box =
    {
      volume  = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {flow_direction = "output", direction = defines.direction.north, position = {0, -0.5}}
      },
      production_type = "output",
      filter = "steam"
    },
    energy_consumption = "10MW",
    energy_source =
    {
      type = "heat",
      max_temperature = 1000,
      specific_heat = "1MJ",
      max_transfer = "2GW",
      min_working_temperature = 500,
      minimum_glow_temperature = 350,
      connections =
      {
        {
          position = {0, 0.5},
          direction = defines.direction.south
        }
      },
      pipe_covers =
        make_4way_animation_from_spritesheet(
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
          width = 64,
          height = 64,
          direction_count = 4,
          scale = 0.5
        }),
      heat_pipe_covers =
        make_4way_animation_from_spritesheet(
        apply_heat_pipe_glow{
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
          width = 64,
          height = 64,
          direction_count = 4,
          scale = 0.5
        }),
      heat_picture =
      {
        north = apply_heat_pipe_glow
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-N-heated.png",
          priority = "extra-high",
          width = 44,
          height = 96,
          shift = util.by_pixel(-0.5, 8.5),
          scale = 0.5
        },
        east = apply_heat_pipe_glow
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-E-heated.png",
          priority = "extra-high",
          width = 80,
          height = 80,
          shift = util.by_pixel(-21, -13),
          scale = 0.5
        },
        south = apply_heat_pipe_glow
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-S-heated.png",
          priority = "extra-high",
          width = 28,
          height = 40,
          shift = util.by_pixel(-1, -30),
          scale = 0.5
        },
        west = apply_heat_pipe_glow
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-W-heated.png",
          priority = "extra-high",
          width = 64,
          height = 76,
          shift = util.by_pixel(23, -13),
          scale = 0.5
        }
      }
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/heat-exchanger.ogg",
        volume = 0.65,
        modifiers = volume_multiplier("main-menu", 0.7),
        audible_distance_modifier = 0.5,
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    open_sound = sounds.steam_open,
    close_sound = sounds.steam_close,

    pictures =
    {
      north =
      {
        structure =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/heat-exchanger/heatex-N-idle.png",
              priority = "extra-high",
              width = 269,
              height = 221,
              shift = util.by_pixel(-1.25, 5.25),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/boiler/boiler-N-shadow.png",
              priority = "extra-high",
              width = 274,
              height = 164,
              scale = 0.5,
              shift = util.by_pixel(20.5, 9),
              draw_as_shadow = true
            }
          }
        }
      },
      east =
      {
        structure =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/heat-exchanger/heatex-E-idle.png",
              priority = "extra-high",
              width = 211,
              height = 301,
              shift = util.by_pixel(-1.75, 1.25),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/boiler/boiler-E-shadow.png",
              priority = "extra-high",
              width = 184,
              height = 194,
              scale = 0.5,
              shift = util.by_pixel(30, 9.5),
              draw_as_shadow = true
            }
          }
        }
      },
      south =
      {
        structure =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/heat-exchanger/heatex-S-idle.png",
              priority = "extra-high",
              width = 260,
              height = 201,
              shift = util.by_pixel(4, 10.75),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/boiler/boiler-S-shadow.png",
              priority = "extra-high",
              width = 311,
              height = 131,
              scale = 0.5,
              shift = util.by_pixel(29.75, 15.75),
              draw_as_shadow = true
            }
          }
        }
      },
      west =
      {
        structure =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/heat-exchanger/heatex-W-idle.png",
              priority = "extra-high",
              width = 196,
              height = 273,
              shift = util.by_pixel(1.5, 7.75),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/boiler/boiler-W-shadow.png",
              priority = "extra-high",
              width = 206,
              height = 218,
              scale = 0.5,
              shift = util.by_pixel(19.5, 6.5),
              draw_as_shadow = true
            }
          }
        }
      },
    },
    burning_cooldown = 20,
    water_reflection = boiler_reflection()
  },
  {
    type = "generator",
    name = "steam-turbine",
    icon = "__base__/graphics/icons/steam-turbine.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.3, result = "steam-turbine"},
    max_health = 300,
    corpse = "steam-turbine-remnants",
    dying_explosion = "steam-turbine-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    effectivity = 1,
    fluid_usage_per_tick = 1,
    maximum_temperature = 500,
    burns_fluid = false,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fast_replaceable_group = "steam-engine",
    collision_box = {{-1.25, -2.35}, {1.25, 2.35}},
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { flow_direction = "input-output", direction = defines.direction.south, position = {0, 2} },
        { flow_direction = "input-output", direction = defines.direction.north, position = {0, -2} }
      },
      production_type = "input",
      filter = "steam",
      minimum_temperature = 100.0
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    horizontal_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-H.png",
          width = 320,
          height = 245,
          frame_count = 8,
          line_length = 4,
          shift = util.by_pixel(0, -2.75),
          run_mode = "backward",
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-H-shadow.png",
          width = 435,
          height = 150,
          repeat_count = 8,
          line_length = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(28.5, 18),
          run_mode = "backward",
          scale = 0.5
        }
      }
    },
    vertical_animation =
    {
     layers =
     {
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-V.png",
          width = 217,
          height = 374,
          frame_count = 8,
          line_length = 4,
          shift = util.by_pixel(4.75, 0.0),
          run_mode = "backward",
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-V-shadow.png",
          width = 302,
          height = 260,
          repeat_count = 8,
          line_length = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(39.5, 24.5),
          run_mode = "backward",
          scale = 0.5
        }
      }
    },
    smoke =
    {
      {
        name = "turbine-smoke",
        north_position = {0.0, -1.0},
        east_position = {0.75, -0.75},
        frequency = 10 / 32,
        starting_vertical_speed = 0.08,
        starting_frame_deviation = 60
      }
    },
    impact_category = "metal-large",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/steam-turbine.ogg",
        volume = 0.49,
        modifiers = volume_multiplier("main-menu", 0.7),
        speed_smoothing_window_size = 60,
        advanced_volume_control = {attenuation = "exponential"},
        audible_distance_modifier = 0.8,
      },
      match_speed_to_activity = true,
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    perceived_performance = {minimum = 0.25, performance_to_activity_rate = 2.0},
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/steam-turbine/steam-turbine-reflection.png",
        priority = "extra-high",
        width = 40,
        height = 36,
        shift = util.by_pixel(0, 50),
        variation_count = 2,
        repeat_count = 2,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    }
  },
  {
    type = "heat-pipe",
    name = "heat-pipe",
    icon = "__base__/graphics/icons/heat-pipe.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "heat-pipe"},
    fast_replaceable_group = "heat-pipe",
    max_health = 200,
    corpse = "heat-pipe-remnants",
    dying_explosion = "heat-pipe-explosion",
    random_corpse_variation = true,
    working_sound =
    {
      sound = { filename = "__base__/sound/heat-pipe.ogg", volume = 0.4 },
      match_volume_to_activity = true,
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    impact_category = "metal",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "1MJ",
      max_transfer = "1GW",
      minimum_glow_temperature = 350,
      connections =
      {
        {
          position = {0, 0},
          direction = defines.direction.north
        },
        {
          position = {0, 0},
          direction = defines.direction.east
        },
        {
          position = {0, 0},
          direction = defines.direction.south
        },
        {
          position = {0, 0},
          direction = defines.direction.west
        }
      }
    },

    connection_sprites = make_heat_pipe_pictures("__base__/graphics/entity/heat-pipe/", "heat-pipe",
    {
      single = { name = "straight-vertical-single", ommit_number = true },
      straight_vertical = { variations = 6 },
      straight_horizontal = { variations = 6 },
      corner_right_up = { name = "corner-up-right", variations = 6 },
      corner_left_up = { name = "corner-up-left", variations = 6 },
      corner_right_down = { name = "corner-down-right", variations = 6 },
      corner_left_down = { name = "corner-down-left", variations = 6 },
      t_up = {},
      t_down = {},
      t_right = {},
      t_left = {},
      cross = { name = "t" },
      ending_up = {},
      ending_down = {},
      ending_right = {},
      ending_left = {}
    }),

    heat_glow_sprites = make_heat_pipe_pictures("__base__/graphics/entity/heat-pipe/", "heated",
    {
      single = { empty = true },
      straight_vertical = { variations = 6 },
      straight_horizontal = { variations = 6 },
      corner_right_up = { name = "corner-up-right", variations = 6 },
      corner_left_up = { name = "corner-up-left", variations = 6 },
      corner_right_down = { name = "corner-down-right", variations = 6 },
      corner_left_down = { name = "corner-down-left", variations = 6 },
      t_up = {},
      t_down = {},
      t_right = {},
      t_left = {},
      cross = { name = "t" },
      ending_up = {},
      ending_down = {},
      ending_right = {},
      ending_left = {}
    }, true)
  },
  {
    type = "simple-entity-with-force",
    name = "simple-entity-with-force",
    render_layer = "object",
    icon = "__base__/graphics/icons/steel-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    order = "s-e-w-f",
    minable = {mining_time = 0.1, result = "simple-entity-with-force"},
    max_health = 100,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steel-chest/steel-chest.png",
          priority = "extra-high",
          width = 64,
          height = 80,
          shift = util.by_pixel(-0.25, -0.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/steel-chest/steel-chest-shadow.png",
          priority = "extra-high",
          width = 110,
          height = 46,
          shift = util.by_pixel(12.25, 8),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    }
  },
  {
    type = "simple-entity-with-owner",
    name = "simple-entity-with-owner",
    render_layer = "object",
    icon = "__base__/graphics/icons/wooden-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    order = "s-e-w-o",
    minable = {mining_time = 0.1, result = "simple-entity-with-owner"},
    max_health = 100,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
          priority = "extra-high",
          width = 66,
          height = 76,
          shift = util.by_pixel(-0.5, -0.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
          priority = "extra-high",
          width = 110,
          height = 50,
          shift = util.by_pixel(10.5, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
  }
})

function create_spidertron(arguments)
local scale = arguments.scale
local leg_scale = scale * arguments.leg_scale
local body_height = 1.5 * scale * leg_scale
local spidertron_resistances =
{
  {
    type = "fire",
    decrease = 15,
    percent = 60
  },
  {
    type = "physical",
    decrease = 15,
    percent = 60
  },
  {
    type = "impact",
    decrease = 50,
    percent = 80
  },
  {
    type = "explosion",
    decrease = 20,
    percent = 75
  },
  {
    type = "acid",
    decrease = 0,
    percent = 70
  },
  {
    type = "laser",
    decrease = 0,
    percent = 70
  },
  {
    type = "electric",
    decrease = 0,
    percent = 70
  }
}
local spidertron_leg_resistances = util.table.deepcopy(spidertron_resistances)
spidertron_leg_resistances[4] = { type = "explosion", percent = 100 }

data:extend(
{
  {
    type = "spider-vehicle",
    name = arguments.name,
    collision_box = {{-1 * scale, -1 * scale}, {1 * scale, 1 * scale}},
    sticker_box = {{-1.5 * scale, -1.5 * scale}, {1.5 * scale, 1.5 * scale}},
    selection_box = {{-1 * scale, -1 * scale}, {1 * scale, 1 * scale}},
    drawing_box_vertical_extension = 3 * scale,
    icon = "__base__/graphics/icons/spidertron.png",
    factoriopedia_simulation = arguments.factoriopedia_simulation,
    mined_sound = sounds.deconstruct_large(0.8),
    open_sound = { filename = "__base__/sound/spidertron/spidertron-door-open.ogg", volume= 0.45 },
    close_sound = { filename = "__base__/sound/spidertron/spidertron-door-close.ogg", volume = 0.4 },
    working_sound =
    {
      sound = { filename = "__base__/sound/spidertron/spidertron-vox.ogg", volume = 0.35 },
      activate_sound = { filename = "__base__/sound/spidertron/spidertron-activate.ogg", volume = 0.5 },
      deactivate_sound = { filename = "__base__/sound/spidertron/spidertron-deactivate.ogg", volume = 0.5 },
      match_speed_to_activity = true,
      activity_to_speed_modifiers =
      {
        multiplier = 6.0,
        minimum = 1.0,
        offset = 0.93333333333
      }
    },
    weight = 1,
    braking_force = 1,
    friction_force = 1,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 1, result = arguments.name},
    max_health = 3000,
    resistances = util.table.deepcopy(spidertron_resistances),
    minimap_representation =
    {
      filename = "__base__/graphics/entity/spidertron/spidertron-map.png",
      flags = {"icon"},
      size = {128, 128},
      scale = 0.5
    },
    selected_minimap_representation =
    {
      filename = "__base__/graphics/entity/spidertron/spidertron-map-selected.png",
      flags = {"icon"},
      size = {128, 128},
      scale = 0.5
    },
    corpse = "spidertron-remnants",
    dying_explosion = "spidertron-explosion",
    energy_per_hit_point = 1,
    guns = { "spidertron-rocket-launcher-1", "spidertron-rocket-launcher-2", "spidertron-rocket-launcher-3", "spidertron-rocket-launcher-4" },
    inventory_size = 80,
    equipment_grid = "spidertron-equipment-grid",
    trash_inventory_size = 20,
    height = body_height,
    alert_icon_shift = { 0, -body_height },
    torso_rotation_speed = 0.005,
    chunk_exploration_radius = 3,
    selection_priority = 60,
    graphics_set = spidertron_torso_graphics_set(scale),
    energy_source =
    {
      type = "void"
    },
    movement_energy_consumption = "250kW",
    automatic_weapon_cycling = true,
    chain_shooting_cooldown_modifier = 0.5,
    spider_engine =
    {
      legs =
      {
        { -- 1
          leg = arguments.name .. "-leg-1",
          mount_position = util.by_pixel(15  * scale, -22 * scale),
          ground_position = {2.25  * leg_scale, -2.5  * leg_scale},
          walking_group = 1,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 2
          leg = arguments.name .. "-leg-2",
          mount_position = util.by_pixel(23  * scale, -10  * scale),
          ground_position = {3  * leg_scale, -1  * leg_scale},
          walking_group = 2,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 3
          leg = arguments.name .. "-leg-3",
          mount_position = util.by_pixel(25  * scale, 4  * scale),
          ground_position = {3  * leg_scale, 1  * leg_scale},
          walking_group = 1,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 4
          leg = arguments.name .. "-leg-4",
          mount_position = util.by_pixel(15  * scale, 17  * scale),
          ground_position = {2.25  * leg_scale, 2.5  * leg_scale},
          walking_group = 2,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 5
          leg = arguments.name .. "-leg-5",
          mount_position = util.by_pixel(-15 * scale, -22 * scale),
          ground_position = {-2.25 * leg_scale, -2.5 * leg_scale},
          walking_group = 2,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 6
          leg = arguments.name .. "-leg-6",
          mount_position = util.by_pixel(-23 * scale, -10 * scale),
          ground_position = {-3 * leg_scale, -1 * leg_scale},
          walking_group = 1,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 7
          leg = arguments.name .. "-leg-7",
          mount_position = util.by_pixel(-25 * scale, 4 * scale),
          ground_position = {-3 * leg_scale, 1 * leg_scale},
          walking_group = 2,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 8
          leg = arguments.name .. "-leg-8",
          mount_position = util.by_pixel(-15 * scale, 17 * scale),
          ground_position = {-2.25 * leg_scale, 2.5 * leg_scale},
          walking_group = 1,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        }
      },
    },
    is_military_target = true,
    allow_remote_driving = true,
  },
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 1, spidertron_leg_resistances),
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 2, spidertron_leg_resistances),
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 3, spidertron_leg_resistances),
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 4, spidertron_leg_resistances),
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 5, spidertron_leg_resistances),
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 6, spidertron_leg_resistances),
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 7, spidertron_leg_resistances),
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 8, spidertron_leg_resistances),
})
end

function get_leg_hit_the_ground_trigger()
  return
    {
      {
        type = "create-trivial-smoke",
        smoke_name = "smoke-building",
        repeat_count = 4,
        starting_frame_deviation = 5,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        speed_from_center = 0.03
      }
    }
end

data:extend(
{
  {
    type = "arrow",
    name = "fake-selection-box-2x2",
    flags = {"placeable-off-grid", "not-on-map"},
    hidden = true,
    circle_picture =
    {
      filename = "__core__/graphics/arrows/fake-selection-box-2x2.png",
      priority = "low",
      width = 128,
      height = 128,
      scale = 0.5
    },
    arrow_picture =
    {
      filename = "__core__/graphics/empty.png",
      priority = "low",
      width = 1,
      height = 1
    }
  },
  {
    type = "artillery-flare",
    name = "artillery-flare",
    icon = "__base__/graphics/icons/artillery-targeting-remote.png",
    flags = {"placeable-off-grid", "not-on-map"},
    hidden = true,
    map_color = {1, 0.5, 0},
    life_time = 60 * 60,
    initial_height = 0,
    initial_vertical_speed = 0,
    initial_frame_speed = 1,
    shots_per_flare = 1,
    early_death_ticks = 3 * 60,
    pictures =
    {
      {
        filename = "__core__/graphics/shoot-cursor-red.png",
        priority = "low",
        width = 258,
        height = 183,
        scale = 1,
        flags = {"icon"}
      }
    }
  },
  {
    type = "speech-bubble",
    name = "compi-speech-bubble",
    style = "compilatron_speech_bubble",
    wrapper_flow_style = "compilatron_speech_bubble_wrapper",
    fade_in_out_ticks = 60 * 0.5,
    flags = {"not-on-map", "placeable-off-grid"},
    hidden = true
  }
}
)

create_spidertron{name = "spidertron",
                  scale = 1,
                  leg_scale = 1, -- relative to scale
                  leg_thickness = 1, -- relative to leg_scale
                  leg_movement_speed = 1,
                  factoriopedia_simulation = simulations.factoriopedia_spidertron}

local red_chest = util.table.deepcopy(data.raw["container"]["steel-chest"])
red_chest.minable = nil
red_chest.name = "red-chest"
red_chest.order = "r-e-d"
local red_chest_reference = data.raw["logistic-container"]["passive-provider-chest"]
red_chest.icon = util.table.deepcopy(red_chest_reference.icon)
red_chest.icon_size = red_chest_reference.icon_size
red_chest.picture = util.table.deepcopy(red_chest_reference.animation)
red_chest.picture.layers[1].frame_count = nil
red_chest.picture.layers[2].repeat_count = nil
red_chest.hidden = true
data:extend({red_chest})

local blue_chest = util.table.deepcopy(data.raw["container"]["steel-chest"])
blue_chest.minable = nil
blue_chest.name = "blue-chest"
blue_chest.order = "b-l-u-e"
local blue_chest_reference = data.raw["logistic-container"]["requester-chest"]
blue_chest.icon = util.table.deepcopy(blue_chest_reference.icon)
blue_chest.picture = util.table.deepcopy(blue_chest_reference.animation)
blue_chest.picture.layers[1].frame_count = nil
blue_chest.picture.layers[2].repeat_count = nil
blue_chest.hidden = true
data:extend({blue_chest})

local full_resistances = function()
  return {
    {
      type = "fire",
      percent = 100
    },
    {
      type = "impact",
      percent = 100
    },
    {
      type = "physical",
      percent = 100
    },
    {
      type = "explosion",
      percent = 100
    }
  }
end

local infinity_chest = util.table.deepcopy(data.raw["logistic-container"]["storage-chest"])
infinity_chest.type = "infinity-container"
infinity_chest.name = "infinity-chest"
infinity_chest.icon = "__base__/graphics/icons/infinity-chest.png"
infinity_chest.hidden = true
infinity_chest.gui_mode = "admins" -- all, none, admins
infinity_chest.erase_contents_when_mined = true
infinity_chest.preserve_contents_when_created = true
infinity_chest.animation = nil
infinity_chest.animation_sound = nil
infinity_chest.picture =
{
  layers =
  {
    {
      filename = "__base__/graphics/entity/infinity-chest/infinity-chest.png",
      priority = "extra-high",
      width = 68,
      height = 84,
      shift = util.by_pixel(0, -3),
      scale = 0.5
    },
    {
      filename = "__base__/graphics/entity/infinity-chest/infinity-chest-shadow.png",
      priority = "extra-high",
      width = 116,
      height = 48,
      shift = util.by_pixel(12, 6),
      draw_as_shadow = true,
      scale = 0.5
    }
  }
}
infinity_chest.logistic_mode = nil
infinity_chest.minable = {mining_time = 0.1, result = "infinity-chest"}
infinity_chest.resistances = full_resistances()
data:extend({infinity_chest})

local infinity_pipe = util.table.deepcopy(data.raw["pipe"]["pipe"])
infinity_pipe.type = "infinity-pipe"
infinity_pipe.name = "infinity-pipe"
infinity_pipe.hidden = true
infinity_pipe.icon = nil
infinity_pipe.icons =
{{
  icon = "__base__/graphics/icons/pipe.png",
  tint = {0.5, 0.5, 1}
}}
infinity_pipe.gui_mode = "admins" -- all, none, admins
infinity_pipe.minable = {mining_time = 0.1, result = "infinity-pipe"}
infinity_pipe.resistances = full_resistances()
for name, picture in pairs(infinity_pipe.pictures) do
  if name ~= "high_temperature_flow" and name ~= "middle_temperature_flow" and name ~= "low_temperature_flow" and name ~= "gas_flow" and (not string.find(name, "_visualization")) then
    picture.tint = {0.5, 0.5, 1}
  end
end
data:extend({infinity_pipe})

data:extend({
{
  name = "burner-generator",
  type = "burner-generator",
  icon = "__base__/graphics/icons/steam-engine.png",
  flags = {"placeable-neutral","player-creation"},
  hidden = true,
  max_health = 400,
  dying_explosion = "medium-explosion",
  corpse = "steam-engine-remnants",
  collision_box = {{-1.35, -2.35}, {1.35, 2.35}},
  selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
  max_power_output = "1MW",
  minable = {mining_time = 1, result = "burner-generator"},
  animation =
  {
    north = util.table.deepcopy(data.raw.generator["steam-engine"].vertical_animation),
    east = util.table.deepcopy(data.raw.generator["steam-engine"].horizontal_animation),
    south = util.table.deepcopy(data.raw.generator["steam-engine"].vertical_animation),
    west = util.table.deepcopy(data.raw.generator["steam-engine"].horizontal_animation)
  },
  -- idle_animation can also be specified
  perceived_performance = {minimum = 0.25, performance_to_activity_rate = 2.0},
  burner =
  {
    type = "burner",
    fuel_categories = {"chemical"},
    effectivity = 0.5,
    fuel_inventory_size = 1,
    emissions_per_minute = { pollution = 10 },
    smoke =
    {
      {
        name = "smoke",
        north_position = {0.9, 0.0},
        east_position = {-2.0, -2.0},
        deviation = {0.1, 0.1},
        frequency = 9
      }
    }
  },
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-output"
  }
}})

data:extend(
{
  {
    type = "heat-interface",
    name = "heat-interface",
    icon = "__base__/graphics/icons/heat-interface.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    minable = {mining_time = 0.1, result = "heat-interface"},
    max_health = 150,
    corpse = "small-remnants",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    gui_mode = "admins", -- all, none, admins
    resistances = full_resistances(),
    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "10MJ",
      max_transfer = "10GW",
      default_temperature = 0,
      min_working_temperature = 0,
      connections =
      {
        {
          position = {0, 0},
          direction = defines.direction.north
        },
        {
          position = {0, 0},
          direction = defines.direction.east
        },
        {
          position = {0, 0},
          direction = defines.direction.south
        },
        {
          position = {0, 0},
          direction = defines.direction.west
        }
      }
    },
    picture =
    {
      filename = "__base__/graphics/icons/heat-interface.png",
      height = 64,
      width = 64,
      scale = 0.5,
      flags = {"no-crop"}
    }
  }
}
)

local linked_chest = util.table.deepcopy(data.raw["container"]["wooden-chest"])
linked_chest.type = "linked-container"
linked_chest.name = "linked-chest"
linked_chest.hidden = true
linked_chest.minable.result = "linked-chest"
linked_chest.gui_mode = "admins" -- all, none, admins
linked_chest.icon = "__base__/graphics/icons/linked-chest-icon.png"
linked_chest.picture =
{
  layers =
  {
    {
      filename = "__base__/graphics/entity/linked-chest/linked-chest.png",
      priority = "extra-high",
      width = 66,
      height = 74,
      shift = util.by_pixel(0, -2),
      scale = 0.5
    },
    {
      filename = "__base__/graphics/entity/linked-chest/linked-chest-shadow.png",
      priority = "extra-high",
      width = 112,
      height = 46,
      shift = util.by_pixel(12, 4.5),
      draw_as_shadow = true,
      scale = 0.5
    }
  }
}
data:extend({linked_chest})

data:extend{
  {
    type = "proxy-container",
    name = "proxy-container",
    hidden = true,
    icons = {{icon = "__base__/graphics/icons/linked-chest-icon.png", tint = {0.8, 0.1, 0.3}}},
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "proxy-container"},
    max_health = 100,
    corpse = "wooden-chest-remnants",
    dying_explosion = "wooden-chest-explosion",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    fast_replaceable_group = "container",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = { filename = "__base__/sound/wooden-chest-open.ogg", volume = 0.6 },
    close_sound = { filename = "__base__/sound/wooden-chest-close.ogg", volume = 0.6 },
    impact_category = "wood",
    icon_draw_specification = {scale = 0.7},
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/linked-chest/linked-chest.png",
          priority = "extra-high",
          width = 66,
          height = 74,
          shift = util.by_pixel(0, -2),
          scale = 0.5,
          tint = {0.8, 0.1, 0.3}
        },
        {
          filename = "__base__/graphics/entity/linked-chest/linked-chest-shadow.png",
          priority = "extra-high",
          width = 112,
          height = 46,
          shift = util.by_pixel(12, 4.5),
          draw_as_shadow = true,
          scale = 0.5,
          tint = {0.8, 0.1, 0.3}
        }
      }
    }
  },
  {
    type = "container",
    name = "bottomless-chest",
    hidden = true,
    icons = {{icon = "__base__/graphics/icons/steel-chest.png", tint = {0.4, 0.4, 0.4}}},
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "bottomless-chest"},
    max_health = 4000,
    corpse = "steel-chest-remnants",
    dying_explosion = "steel-chest-explosion",
    open_sound = sounds.metallic_chest_open,
    close_sound = sounds.metallic_chest_close,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "container",
    inventory_size = 1,
    inventory_type = "with_custom_stack_size",
    inventory_properties = { stack_size_min = 1000000000 },
    impact_category = "metal",
    icon_draw_specification = {scale = 0.7},
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steel-chest/steel-chest.png",
          priority = "extra-high",
          width = 64,
          height = 80,
          shift = util.by_pixel(-0.25, -0.5),
          scale = 0.5,
          tint = {0.4, 0.4, 0.4}
        },
        {
          filename = "__base__/graphics/entity/steel-chest/steel-chest-shadow.png",
          priority = "extra-high",
          width = 110,
          height = 46,
          shift = util.by_pixel(12.25, 8),
          draw_as_shadow = true,
          scale = 0.5,
          tint = {0.4, 0.4, 0.4}
        }
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
  }
}

data:extend({
  {
    type = "cargo-pod",
    name = "cargo-pod",
    icon = "__base__/graphics/icons/cargo-pod.png",
    flags = {"not-on-map"},
    order = "d[cargo-pod]",
    collision_mask = {layers = {}},
    collision_box = {{0, 0},{0, 0}},
    selection_box = {{-0.5, -1}, {0.5, 0.5}},
    inventory_size = 10,
    impact_trigger = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 600 , type = "physical"}
          }
        }
      }
    },
    icon_draw_specification = {render_layer = "air-entity-info-icon", scale = 1.0},
    spawned_container = "cargo-pod-container",
    shadow_slave_entity = "cargo-pod-shadow",
    default_graphic = { type = "pod-catalogue", catalogue_id = procession_graphic_catalogue_types.pod_base },
    default_shadow_graphic = { type = "pod-catalogue", catalogue_id = procession_graphic_catalogue_types.pod_shadow },
    procession_graphic_catalogue = cargo_pod_procession_catalogue,
    procession_audio_catalogue =
    {
      {
        index = procession_audio_catalogue_types.pod_reentry_flames,
        sound =
        {
          filename = "__base__/sound/procession/cargo-pod-reentry-flame.ogg",
          aggregation = {max_count = 3, remove = true, count_already_playing = true}
        }
      },
      {
        index = procession_audio_catalogue_types.pod_thruster_burst_1,
        sound =
        {
          filename = "__base__/sound/procession/cargo-pod-thruster-burst-1.ogg",
          aggregation = {max_count = 3, remove = true, count_already_playing = true}
        }
      },
      {
        index = procession_audio_catalogue_types.pod_thruster_burst_2,
        sound =
        {
          filename = "__base__/sound/procession/cargo-pod-thruster-burst-2.ogg",
          aggregation = {max_count = 3, remove = true, count_already_playing = true}
        }
      },
      {
        index = procession_audio_catalogue_types.pod_thruster_burst_3,
        sound =
        {
          filename = "__base__/sound/procession/cargo-pod-thruster-burst-3.ogg",
          aggregation = {max_count = 3, remove = true, count_already_playing = true}
        }
      },
      {
        index = procession_audio_catalogue_types.pod_thruster_burst_4,
        sound =
        {
          filename = "__base__/sound/procession/cargo-pod-thruster-burst-4.ogg",
          aggregation = {max_count = 3, remove = true, count_already_playing = true}
        }
      },
      {
        index = procession_audio_catalogue_types.pod_wings,
        sound =
        {
          filename = "__base__/sound/procession/cargo-pod-wings.ogg",
          aggregation = {max_count = 3, remove = true, count_already_playing = true}
        }
      },
      {
        index = procession_audio_catalogue_types.rocket_claws_open,
        sound =
        {
          filename = "__base__/sound/procession/cargo-pod-rocket-claws-open.ogg",
          aggregation = {max_count = 3, remove = true, count_already_playing = true}
        }
      },
      {
        index = procession_audio_catalogue_types.pod_ground_land,
        sound =
        {
          filename = "__base__/sound/car-stone-impact-2.ogg",
          volume = 0.8,
          aggregation = {max_count = 3, remove = true, count_already_playing = true}
        }
      }
    }
  },
  {
    type = "temporary-container",
    name = "cargo-pod-container",
    icon = "__base__/graphics/icons/landed-cargo-pod.png",
    order = "e[cargo-pod-container]",
    minable = {mining_time = 0.5},
    fast_replaceable_group = "container",
    flags = {"player-creation", "placeable-neutral", "placeable-off-grid", "not-in-kill-statistics", "not-upgradable"},
    alert_when_damaged = false,
    dying_explosion = "cargo-pod-container-explosion",
    remains_when_mined = {"cargo-pod-container-explosion"},
    max_health = 250,
    damaged_trigger_effect = hit_effects.entity(),
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true}},
    collision_box = {{-0.5, 0.0},{0.5, 1.3}},
    selection_box = {{-0.75, -1.25}, {0.75, 1.5}},
    inventory_size = 20,
    alert_after_time = 60 * 60,
    impact_category = "metal",
    open_sound = { filename = "__base__/sound/open-close/metal-large-open.ogg", volume = 0.6 },
    close_sound = { filename = "__base__/sound/open-close/metal-large-close.ogg", volume = 0.6 },
    picture =
    {
      layers =
      {
        {
        filename = "__base__/graphics/entity/cargo-pod/pod-landing.png",
        x = 192 * 5,
        y = 258,
        width = 192,
        height = 258,
        scale = 0.5,
        shift = util.by_pixel( -10.5, 8.0)
        },
        util.sprite_load("__base__/graphics/entity/cargo-pod/pod-landed-shadow",
        {
          priority = "medium",
          scale = 0.5,
          draw_as_shadow = true,
        })
      }
    },
  }
})

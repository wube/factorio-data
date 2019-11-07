require ("prototypes.entity.demo-rail-pictures")
require ("prototypes.entity.demo-assemblerpipes")
require ("prototypes.entity.demo-pipecovers")
require ("prototypes.entity.demo-transport-belt-pictures")
require ("circuit-connector-sprites")
require ("prototypes.entity.demo-character-animations")

if not data.is_demo then
  require ("prototypes.entity.assemblerpipes")
end


local function scale_bounding_box(bb, scale)
  local orientation = bb[3] or 0
  return
  {
    {scale*bb[1][1], scale*bb[1][2]},
    {scale*bb[2][1], scale*bb[2][2]},
    orientation
  }
end

local function cliff_sprite_variations(name, column_offset, row_offset, variation_count, scale)
  local frame_width = 128
  local shadow_frame_width = name == "entrance" and 128 or 160
  local shadow_shift = name == "entrance" and {0, 0} or {0.5, 0}
  local frame_height = 128
  pictures = {}
  for i=0,(variation_count-1) do
    table.insert(pictures,
    {
      layers =
      {
        {
          filename = "__base__/graphics/terrain/cliffs/cliff-" .. name .. ".png",
          width = frame_width,
          height = frame_height,
          x = (column_offset + i) * frame_width,
          y = row_offset * frame_height,
          scale = scale,
          hr_version =
          {
            filename = "__base__/graphics/terrain/cliffs/hr-cliff-" .. name .. ".png",
            width = frame_width * 2,
            height = frame_height * 2,
            x = (column_offset + i) * frame_width * 2,
            y = row_offset * frame_height * 2,
            scale = scale * 0.5
          }
        },
        {
          filename = "__base__/graphics/terrain/cliffs/cliff-" .. name .. "-shadow.png",
          width = shadow_frame_width,
          height = frame_height,
          x = (column_offset + i) * shadow_frame_width,
          y = row_offset * frame_height,
          draw_as_shadow = true,
          scale = scale,
          shift = shadow_shift,
          hr_version =
          {
            filename = "__base__/graphics/terrain/cliffs/hr-cliff-" .. name .. "-shadow.png",
            width = shadow_frame_width * 2,
            height = frame_height * 2,
            x = (column_offset + i) * shadow_frame_width * 2,
            y = row_offset * frame_height * 2,
            draw_as_shadow = true,
            scale = scale * 0.5,
            shift = shadow_shift
          }
        }
      }
    })
  end
  return pictures
end

local function cliff_orientation(name, column_offset, row_offset, variation_count, collision_bounding_box, scale, fill_volume)
  return
  {
    pictures = cliff_sprite_variations(name, column_offset, row_offset, variation_count, scale),
    collision_bounding_box = scale_bounding_box(collision_bounding_box, scale),
    fill_volume = fill_volume
  }
end

local sqrt2 = 1.4142135623730951
local function dq(n) -- 'diagonal quarter' i.e. 1/4 of the way across 1x1 cell diagonally
  return sqrt2 * n / 4
end

local function rotbb(cx, cy, halfwidth, halfheight, angle)
  return {{cx-halfwidth, cy-halfheight}, {cx+halfwidth, cy+halfheight}, angle}
end

-- @param fill_volume m3 of rock that must be added (or removed) in order to change a section of cliff into a ramp
local function scaled_cliff(name, scale, fill_volume)
  local grid_offset
  if scale == 1 then
    grid_offset = {0, 0.5}
  else
    grid_offset = {0.5, 0.5} -- Works well for the 2x2 cliffs
  end
  return
  {
    type = "cliff",
    name = name,
    icon = "__base__/graphics/icons/cliff-icon.png",
    icon_size = 32,
    subgroup = "cliffs",
    flags = {"placeable-neutral"},
    -- generic collision box is intentionally small so you can place trees nearby in map editor
    -- cliffs are auto-placed with centers at (0, 0.5) offset from the grid;
    -- using a collision box with even width and odd height makes them place properly in the editor.
    collision_box = scale_bounding_box({{-1.0, -0.5}, {1.0, 0.5}}, scale),
    selection_box = scale_bounding_box({{-1.5, -1.5}, {1.5, 1.5}}, scale),
    order = "b[decorative]-l[rock]-b[big]",
    selectable_in_game = false,
    map_color = {r=0.4, g=0.3, b=0.2, a=0.75},
    grid_size = {4 * scale, 4 * scale},
    grid_offset = grid_offset,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
    cliff_explosive = "cliff-explosives",
    orientations =
    {
      -- Since removing a cliff also causes neighboring cliffs to be removed,
      -- we'll think of it (for purposes of fill volume) as filling two sections centered on the ends of this segment.
      -- That way you can't "cheat" by filling every other cliff segment -- the numbers should work out the same.
      west_to_east   = cliff_orientation("sides"   , 0, 2, 8, {{-2.0, -1.5}, {2.0,  1.5}}, scale, fill_volume*2),
      north_to_south = cliff_orientation("sides"   , 0, 3, 8, {{-1.0, -2.0}, {1.0,  2.0}}, scale, fill_volume*2),
      east_to_west   = cliff_orientation("sides"   , 0, 0, 8, {{-2.0, -0.5}, {2.0,  0.5}}, scale, fill_volume*2),
      south_to_north = cliff_orientation("sides"   , 0, 1, 8, {{-1.0, -2.0}, {1.0,  2.0}}, scale, fill_volume*2),
      west_to_north  = cliff_orientation("outer"   , 0, 3, 8, rotbb(-5/4, -3/4, dq(5.4), dq(3.6), 7/8), scale, fill_volume*2),
      north_to_east  = cliff_orientation("outer"   , 0, 0, 8, rotbb( 5/4, -3/4, dq(5.4), dq(3.6), 1/8), scale, fill_volume*2),
      east_to_south  = cliff_orientation("outer"   , 0, 1, 8, rotbb( 3/4,  5/4, dq(4.4), dq(2.6), 7/8), scale, fill_volume*2),
      south_to_west  = cliff_orientation("outer"   , 0, 2, 8, rotbb(-3/4,  5/4, dq(4.4), dq(2.6), 1/8), scale, fill_volume*2),
      west_to_south  = cliff_orientation("inner"   , 0, 0, 8, rotbb(-5/4,  3/4, dq(5.4), dq(3.6), 1/8), scale, fill_volume*2),
      north_to_west  = cliff_orientation("inner"   , 0, 1, 8, rotbb(-3/4, -5/4, dq(4.4), dq(2.6), 7/8), scale, fill_volume*2),
      east_to_north  = cliff_orientation("inner"   , 0, 2, 8, rotbb( 3/4, -5/4, dq(4.4), dq(2.6), 1/8), scale, fill_volume*2),
      south_to_east  = cliff_orientation("inner"   , 0, 3, 8, rotbb( 5/4,  3/4, dq(5.4), dq(3.6), 7/8), scale, fill_volume*2),
      west_to_none   = cliff_orientation("entrance", 2, 0, 2, {{-2.0, -1.5}, {0.0,  1.5}}, scale, fill_volume),
      none_to_east   = cliff_orientation("entrance", 0, 0, 2, {{ 0.0, -1.5}, {2.0,  1.5}}, scale, fill_volume),
      north_to_none  = cliff_orientation("entrance", 2, 3, 2, rotbb( 0.75, -0.75, dq(4.5), dq(2.5), 1/8), scale, fill_volume),
      none_to_south  = cliff_orientation("entrance", 0, 3, 2, rotbb( 0.60,  0.90, dq(4), dq(2), 7/8), scale, fill_volume),
      east_to_none   = cliff_orientation("entrance", 2, 2, 2, rotbb( 0.75,  0.75, dq(4), dq(2), 7/8), scale, fill_volume),
      none_to_west   = cliff_orientation("entrance", 0, 2, 2, rotbb(-0.85,  0.85, dq(4), dq(2), 1/8), scale, fill_volume),
      south_to_none  = cliff_orientation("entrance", 2, 1, 2, rotbb(-0.85,  0.85, dq(4), dq(2), 1/8), scale, fill_volume),
      none_to_north  = cliff_orientation("entrance", 0, 1, 2, rotbb(-0.70, -0.70, dq(4.5), dq(2.5), 7/8), scale, fill_volume)
    }
  }
end

function make_unit_melee_ammo_type(damagevalue)
  return
  {
    category = "melee",
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = damagevalue , type = "physical"}
        }
      }
    }
  }
end

pipepictures = function()
  return
  {
    straight_vertical_single =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-single.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-straight-vertical-single.png",
        priority = "extra-high",
        width = 160,
        height = 160,
        scale = 0.5
      }
    },
    straight_vertical =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-straight-vertical.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    straight_vertical_window =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-window.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-straight-vertical-window.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    straight_horizontal_window =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal-window.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-straight-horizontal-window.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    straight_horizontal =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-straight-horizontal.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    corner_up_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-up-right.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-corner-up-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    corner_up_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-up-left.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-corner-up-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    corner_down_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-down-right.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-corner-down-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    corner_down_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-down-left.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-corner-down-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    t_up =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-up.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-t-up.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    t_down =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-down.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-t-down.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    t_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-right.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-t-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    t_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-left.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
         filename = "__base__/graphics/entity/pipe/hr-pipe-t-left.png",
         priority = "extra-high",
         width = 128,
         height = 128,
         scale = 0.5
      }
    },
    cross =
    {
      filename = "__base__/graphics/entity/pipe/pipe-cross.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-cross.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    ending_up =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-up.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-ending-up.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
      },
    ending_down =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-down.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-ending-down.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    ending_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-right.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-ending-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    ending_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-left.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-ending-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    horizontal_window_background =
    {
      filename = "__base__/graphics/entity/pipe/pipe-horizontal-window-background.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-horizontal-window-background.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    vertical_window_background =
    {
      filename = "__base__/graphics/entity/pipe/pipe-vertical-window-background.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-vertical-window-background.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    fluid_background =
    {
      filename = "__base__/graphics/entity/pipe/fluid-background.png",
      priority = "extra-high",
      width = 32,
      height = 20,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-fluid-background.png",
        priority = "extra-high",
        width = 64,
        height = 40,
        scale = 0.5
      }
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
      width = 24,
      height = 15,
      frame_count = 60,
      axially_symmetrical = false,
      direction_count = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-steam.png",
        priority = "extra-high",
        line_length = 10,
        width = 48,
        height = 30,
        frame_count = 60,
        axially_symmetrical = false,
        direction_count = 1
      }
    }
  }
end

function trivial_smoke(opts)
  return
  {
    type = "trivial-smoke",
    name = opts.name,
    duration = opts.duration or 600,
    fade_in_duration = opts.fade_in_duration or 0,
    fade_away_duration = opts.fade_away_duration or ((opts.duration or 600) - (opts.fade_in_duration or 0)),
    spread_duration = opts.spread_duration or 600,
    start_scale = opts.start_scale or 0.20,
    end_scale = opts.end_scale or 1.0,
    color = opts.color,
    cyclic = true,
    affected_by_wind = opts.affected_by_wind or true,
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
    }
  }
end

local compilatron_animations =
{
  walk =
  {
    width = 40,
    height = 52,
    frame_count = 2,
    axially_symmetrical = false,
    direction_count = 32,
    shift = util.by_pixel(0.0, -14.0),
    stripes =
    {
      {
        filename = "__base__/graphics/entity/compilatron/compilatron-walk-1.png",
        width_in_frames = 2,
        height_in_frames = 16
      },
      {
        filename = "__base__/graphics/entity/compilatron/compilatron-walk-2.png",
        width_in_frames = 2,
        height_in_frames = 16
      }
    },

    hr_version =
    {
      width = 78,
      height = 104,
      frame_count = 2,
      axially_symmetrical = false,
      direction_count = 32,
      shift = util.by_pixel(0.0, -14),
      scale = 0.5,
      stripes =
      {
        {
          filename = "__base__/graphics/entity/compilatron/hr-compilatron-walk-1.png",
          width_in_frames = 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/compilatron/hr-compilatron-walk-2.png",
          width_in_frames = 2,
          height_in_frames = 16
        }
      },
    }
  },
  walk_shadow =
  {
    width = 72,
    height = 30,
    frame_count = 2,
    direction_count = 32,
    shift = util.by_pixel(19, 0.0),
    draw_as_shadow = true,
    stripes = util.multiplystripes(2,
    {
      {
        filename = "__base__/graphics/entity/compilatron/compilatron-walk-shadow.png",
        width_in_frames = 1,
        height_in_frames = 32
      }
    }),
    hr_version =
    {
      width = 142,
      height = 56,
      frame_count = 2,
      axially_symmetrical = false,
      direction_count = 32,
      shift = util.by_pixel(15.5, -0.5),
      draw_as_shadow = true,
      scale = 0.5,
      stripes = util.multiplystripes(2,
      {
        {
          filename = "__base__/graphics/entity/compilatron/hr-compilatron-walk-shadow.png",
          width_in_frames = 1,
          height_in_frames = 32
        }
      })
    }
  }
}

local lab_inputs =
{
  "automation-science-pack",
  "logistic-science-pack",
}

if not data.is_demo then
  local extra_lab_inputs =
  {
    "military-science-pack",
    "chemical-science-pack",
    "production-science-pack",
    "utility-science-pack",
    "space-science-pack"
  }

  for _, item in pairs(extra_lab_inputs) do
    table.insert(lab_inputs, item)
  end
end

function crash_trigger()
  return
  {
    type = "play-sound",
    sound =
    {
      {
        filename = "__base__/sound/car-crash.ogg",
        volume = 0.4
      }
    }
  }
end

function flying_robot_sounds()
  return
  {
    sound =
    {
      { filename = "__base__/sound/flying-robot-1.ogg", volume = 0.6 },
      { filename = "__base__/sound/flying-robot-2.ogg", volume = 0.6 },
      { filename = "__base__/sound/flying-robot-3.ogg", volume = 0.6 },
      { filename = "__base__/sound/flying-robot-4.ogg", volume = 0.6 },
      { filename = "__base__/sound/flying-robot-5.ogg", volume = 0.6 }
    },
    max_sounds_per_type = 3,
    audible_distance_modifier = 0.5,
    probability = 1 / (3 * 60) -- average pause between the sound is 3 seconds
  }
end

data:extend(
{
  {
    type = "character-corpse",
    name = "character-corpse",
    icon = "__base__/graphics/icons/character.png",
    icon_size = 32,
    minable = {mining_time = 2},
    time_to_live = 15 * 60 * 60, -- 15 minutes
    selection_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_priority = 100, -- 0-255 value with 255 being on-top of everything else
    flags = {"placeable-off-grid", "not-rotatable", "not-on-map"},
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
      --nil = 1,
      ["light-armor"] = 2,
      ["heavy-armor"] = not data.is_demo and 2 or nil,
      ["modular-armor"] = not data.is_demo and 3 or nil,
      ["power-armor"] = not data.is_demo and 3 or nil,
      ["power-armor-mk2"] = not data.is_demo and 3 or nil
    }
  },
  {
    type = "character",
    name = "character",
    icon = "__base__/graphics/icons/character.png",
    icon_size = 32,
    flags = {"placeable-off-grid", "breaths-air", "not-repairable", "not-on-map", "not-flammable"},
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
    ticks_to_keep_gun = 600,
    ticks_to_keep_aiming_direction = 100,
    --ticks you need to wait after firing a weapon or taking damage to get out of combat and get healed
    ticks_to_stay_in_combat = 600,
    damage_hit_tint = {r = 1, g = 0, b = 0, a = 0},
    running_speed = 0.15,
    distance_per_frame = 0.13,
    maximum_corner_sliding_distance = 0.7,
    subgroup = "creatures",
    order="a",
    eat =
    {
      {
        filename = "__base__/sound/eat.ogg",
        volume = 1
      }
    },
    heartbeat =
    {
      {
        filename = "__base__/sound/heartbeat.ogg"
      }
    },
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
        -- heavy-armor is not in the demo
        armors = data.is_demo and {"light-armor"} or {"light-armor", "heavy-armor"},
        idle =
        {
          layers =
          {
            character_animations.level1.idle,
            character_animations.level1.idle_mask,
            character_animations.level2addon.idle,
            character_animations.level2addon.idle_mask,
            character_animations.level1.idle_shadow
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
            character_animations.level1.idle_gun_shadow
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
            character_animations.level1.mining_tool_shadow
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
            character_animations.level1.running_gun_shadow
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
            character_animations.level1.running_shadow
          }
        }
      },
      {
        -- modular armors are not in the demo
        armors = data.is_demo and {} or {"modular-armor", "power-armor", "power-armor-mk2"},
        idle =
        {
          layers =
          {
            character_animations.level1.idle,
            character_animations.level1.idle_mask,
            character_animations.level3addon.idle,
            character_animations.level3addon.idle_mask,
            character_animations.level1.idle_shadow
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
            character_animations.level1.idle_gun_shadow
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
            character_animations.level1.mining_tool_shadow
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
            character_animations.level1.running_gun_shadow
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
            character_animations.level1.running_shadow
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
        color = {r=1.0, g=1.0, b=1.0}
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
        shift = {0, -13},
        size = 2,
        intensity = 0.6,
        color = {r=1.0, g=1.0, b=1.0}
      }
    },
    mining_speed = 0.5,
    mining_with_tool_particles_animation_positions = {19},
    running_sound_animation_positions = {5, 16},
    footstep_particle_triggers =
    {
      {
        tiles = { "water-shallow" },

        type = "create-particle",
        repeat_count = 5,
        entity_name = "shallow-water-droplet-particle",
        initial_height = 0.2,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0.05,
        initial_vertical_speed = 0.02,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
      },
      {
        tiles = { "water-mud" },

        type = "create-particle",
        repeat_count = 5,
        entity_name = "shallow-water-droplet-particle",
        initial_height = 0.2,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0.05,
        initial_vertical_speed = 0.02,
        initial_vertical_speed_deviation = 0.05,
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
      }
    }
  },

  {
    type = "furnace",
    name = "stone-furnace",
    icon = "__base__/graphics/icons/stone-furnace.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "stone-furnace"},
    max_health = 200,
    corpse = "stone-furnace-remnants",
    repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
    working_sound =
    {
      sound = { filename = "__base__/sound/furnace.ogg", }
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
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    energy_usage = "90kW",
    crafting_speed = 1,
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      fuel_category = "chemical",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = 2,
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
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/stone-furnace/stone-furnace.png",
          priority = "extra-high",
          width = 81,
          height = 64,
          frame_count = 1,
          shift = util.by_pixel(14.5, 2),
          hr_version =
          {
            filename = "__base__/graphics/entity/stone-furnace/hr-stone-furnace.png",
            priority = "extra-high",
            width = 151,
            height = 146,
            frame_count = 1,
            shift = util.by_pixel(-0.25, 6),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/stone-furnace/stone-furnace-shadow.png",
          priority = "extra-high",
          width = 81,
          height = 64,
          frame_count = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(14.5, 2),
          hr_version =
          {
            filename = "__base__/graphics/entity/stone-furnace/hr-stone-furnace-shadow.png",
            priority = "extra-high",
            width = 164,
            height = 74,
            frame_count = 1,
            draw_as_shadow = true,
            shift = util.by_pixel(14.5, 13),
            scale = 0.5
          }
        }
      }
    },
    working_visualisations =
    {
      {
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        south_position = {0.0, 0.0},
        west_position = {0.0, 0.0},
        animation =
        {
          filename = "__base__/graphics/entity/stone-furnace/stone-furnace-fire.png",
          priority = "extra-high",
          line_length = 8,
          width = 20,
          height = 49,
          frame_count = 48,
          axially_symmetrical = false,
          direction_count = 1,
          shift = util.by_pixel(-0.5, 5.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/stone-furnace/hr-stone-furnace-fire.png",
            priority = "extra-high",
            line_length = 8,
            width = 41,
            height = 100,
            frame_count = 48,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(-0.75, 5.5),
            scale = 0.5
          }
        },
      light = {intensity = 1, size = 1, color = {r=1.0, g=1.0, b=1.0}}
      }
    },
    fast_replaceable_group = "furnace",
    next_upgrade = "steel-furnace"
  },

  {
    type = "transport-belt",
    name = "transport-belt",
    icon = "__base__/graphics/icons/transport-belt.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "transport-belt"},
    max_health = 150,
    corpse = "transport-belt-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/transport-belt.ogg",
        volume = 0.4
      },
      persistent = true
    },
    animation_speed_coefficient = 32,
    belt_animation_set = basic_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    next_upgrade = "fast-transport-belt",
    speed = 0.03125,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_wire_connection_points = circuit_connector_definitions["belt"].points,
    circuit_connector_sprites = circuit_connector_definitions["belt"].sprites,
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },

  {
    type = "fish",
    name = "fish",
    icon = "__base__/graphics/icons/fish.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    minable = {mining_time = 0.4, result = "raw-fish", count = 5},
    max_health = 20,
    subgroup = "creatures",
    order = "b-a",
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-0.5, -0.3}, {0.5, 0.3}},
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
    autoplace = { influence = 0.01 }
  },

  {
    type = "boiler",
    name = "boiler",
    icon = "__base__/graphics/icons/boiler.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "boiler"},
    max_health = 200,
    corpse = "boiler-remnants",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
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
    target_temperature = 165,
    fluid_box =
    {
      base_area = 1,
      height = 2,
      base_level = -1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {type = "input-output", position = {-2, 0.5}},
        {type = "input-output", position = {2, 0.5}}
      },
      production_type = "input-output",
      filter = "water"
    },
    output_fluid_box =
    {
      base_area = 1,
      height = 2,
      base_level = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {type = "output", position = {0, -1.5}}
      },
      production_type = "output",
      filter = "steam"
    },
    energy_consumption = "1.8MW",
    energy_source =
    {
      type = "burner",
      fuel_category = "chemical",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = 30,
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
      sound =
      {
        filename = "__base__/sound/boiler.ogg",
        volume = 0.8
      },
      max_sounds_per_type = 3
    },

    structure =
    {
      north =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/boiler/boiler-N-idle.png",
            priority = "extra-high",
            width = 131,
            height = 108,
            shift = util.by_pixel(-0.5, 4),
            hr_version =
        {
              filename = "__base__/graphics/entity/boiler/hr-boiler-N-idle.png",
              priority = "extra-high",
              width = 269,
              height = 221,
              shift = util.by_pixel(-1.25, 5.25),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/boiler/boiler-N-shadow.png",
            priority = "extra-high",
            width = 137,
            height = 82,
            shift = util.by_pixel(20.5, 9),
            draw_as_shadow = true,
            hr_version =
        {
              filename = "__base__/graphics/entity/boiler/hr-boiler-N-shadow.png",
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
        layers =
        {
          {
            filename = "__base__/graphics/entity/boiler/boiler-E-idle.png",
            priority = "extra-high",
            width = 105,
            height = 147,
            shift = util.by_pixel(-3.5, -0.5),
            hr_version =
        {
              filename = "__base__/graphics/entity/boiler/hr-boiler-E-idle.png",
              priority = "extra-high",
              width = 216,
              height = 301,
              shift = util.by_pixel(-3, 1.25),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/boiler/boiler-E-shadow.png",
            priority = "extra-high",
            width = 92,
            height = 97,
            shift = util.by_pixel(30, 9.5),
            draw_as_shadow = true,
            hr_version =
        {
              filename = "__base__/graphics/entity/boiler/hr-boiler-E-shadow.png",
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
        layers =
        {
          {
            filename = "__base__/graphics/entity/boiler/boiler-S-idle.png",
            priority = "extra-high",
            width = 128,
            height = 95,
            shift = util.by_pixel(3, 12.5),
            hr_version =
        {
              filename = "__base__/graphics/entity/boiler/hr-boiler-S-idle.png",
              priority = "extra-high",
              width = 260,
              height = 192,
              shift = util.by_pixel(4, 13),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/boiler/boiler-S-shadow.png",
            priority = "extra-high",
            width = 156,
            height = 66,
            shift = util.by_pixel(30, 16),
            draw_as_shadow = true,
            hr_version =
        {
              filename = "__base__/graphics/entity/boiler/hr-boiler-S-shadow.png",
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
        layers =
        {
          {
            filename = "__base__/graphics/entity/boiler/boiler-W-idle.png",
            priority = "extra-high",
            width = 96,
            height = 132,
            shift = util.by_pixel(1, 5),
            hr_version =
        {
              filename = "__base__/graphics/entity/boiler/hr-boiler-W-idle.png",
              priority = "extra-high",
              width = 196,
              height = 273,
              shift = util.by_pixel(1.5, 7.75),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/boiler/boiler-W-shadow.png",
            priority = "extra-high",
            width = 103,
            height = 109,
            shift = util.by_pixel(19.5, 6.5),
            draw_as_shadow = true,
            hr_version =
        {
              filename = "__base__/graphics/entity/boiler/hr-boiler-W-shadow.png",
              priority = "extra-high",
              width = 206,
              height = 218,
              scale = 0.5,
              shift = util.by_pixel(19.5, 6.5),
              draw_as_shadow = true
            }
          }
        }
      }
    },

    patch =
    {
      east =
      {
        filename = "__base__/graphics/entity/boiler/boiler-E-patch.png",
        priority = "extra-high",
        width = 3,
        height = 17,
        shift = util.by_pixel(33.5, -13.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/boiler/hr-boiler-E-patch.png",
          width = 6,
          height = 36,
          shift = util.by_pixel(33.5, -13.5),
          scale = 0.5
        }
      }
    },

    fire_flicker_enabled = true,
    fire =
    {
      north =
      {
        filename = "__base__/graphics/entity/boiler/boiler-N-fire.png",
        priority = "extra-high",
        frame_count = 64,
        line_length = 8,
        width = 12,
        height = 13,
        animation_speed = 0.5,
        shift = util.by_pixel(0, -8.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/boiler/hr-boiler-N-fire.png",
          priority = "extra-high",
          frame_count = 64,
          line_length = 8,
          width = 26,
          height = 26,
          animation_speed = 0.5,
          shift = util.by_pixel(0, -8.5),
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/boiler/boiler-E-fire.png",
        priority = "extra-high",
        frame_count = 64,
        line_length = 8,
        width = 14,
        height = 14,
        animation_speed = 0.5,
        shift = util.by_pixel(-10, -22),
        hr_version =
        {
          filename = "__base__/graphics/entity/boiler/hr-boiler-E-fire.png",
          priority = "extra-high",
          frame_count = 64,
          line_length = 8,
          width = 28,
          height = 28,
          animation_speed = 0.5,
          shift = util.by_pixel(-9.5, -22),
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/boiler/boiler-S-fire.png",
        priority = "extra-high",
        frame_count = 64,
        line_length = 8,
        width = 12,
        height = 9,
        animation_speed = 0.5,
        shift = util.by_pixel(-1, -26.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/boiler/hr-boiler-S-fire.png",
          priority = "extra-high",
          frame_count = 64,
          line_length = 8,
          width = 26,
          height = 16,
          animation_speed = 0.5,
          shift = util.by_pixel(-1, -26.5),
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/boiler/boiler-W-fire.png",
        priority = "extra-high",
        frame_count = 64,
        line_length = 8,
        width = 14,
        height = 14,
        animation_speed = 0.5,
        shift = util.by_pixel(13, -23),
        hr_version =
        {
          filename = "__base__/graphics/entity/boiler/hr-boiler-W-fire.png",
          priority = "extra-high",
          frame_count = 64,
          line_length = 8,
          width = 30,
          height = 29,
          animation_speed = 0.5,
          shift = util.by_pixel(13, -23.25),
          scale = 0.5
        }
      }
    },

    fire_glow_flicker_enabled = true,

    fire_glow =
    {
      north =
      {
        filename = "__base__/graphics/entity/boiler/boiler-N-light.png",
        priority = "extra-high",
        frame_count = 1,
        width = 100,
        height = 87,
        shift = util.by_pixel(-1, -6.5),
        blend_mode = "additive",
        hr_version =
        {
          filename = "__base__/graphics/entity/boiler/hr-boiler-N-light.png",
          priority = "extra-high",
          frame_count = 1,
          width = 200,
          height = 173,
          shift = util.by_pixel(-1, -6.75),
          blend_mode = "additive",
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/boiler/boiler-E-light.png",
        priority = "extra-high",
        frame_count = 1,
        width = 70,
        height = 122,
        shift = util.by_pixel(0, -13),
        blend_mode = "additive",
        hr_version =
        {
          filename = "__base__/graphics/entity/boiler/hr-boiler-E-light.png",
          priority = "extra-high",
          frame_count = 1,
          width = 139,
          height = 244,
          shift = util.by_pixel(0.25, -13),
          blend_mode = "additive",
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/boiler/boiler-S-light.png",
        priority = "extra-high",
        frame_count = 1,
        width = 100,
        height = 81,
        shift = util.by_pixel(1, 5.5),
        blend_mode = "additive",
        hr_version =
        {
          filename = "__base__/graphics/entity/boiler/hr-boiler-S-light.png",
          priority = "extra-high",
          frame_count = 1,
          width = 200,
          height = 162,
          shift = util.by_pixel(1, 5.5),
          blend_mode = "additive",
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/boiler/boiler-W-light.png",
        priority = "extra-high",
        frame_count = 1,
        width = 68,
        height = 109,
        shift = util.by_pixel(2, -6.5),
        blend_mode = "additive",
        hr_version =
        {
          filename = "__base__/graphics/entity/boiler/hr-boiler-W-light.png",
          priority = "extra-high",
          frame_count = 1,
          width = 136,
          height = 217,
          shift = util.by_pixel(2, -6.25),
          blend_mode = "additive",
          scale = 0.5
        }
      }
    },
    burning_cooldown = 20
  },

  {
    type = "container",
    name = "wooden-chest",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "wooden-chest"},
    max_health = 100,
    corpse = "wooden-chest-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    fast_replaceable_group = "container",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    inventory_size = 16,
    open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" },
    close_sound = { filename = "__base__/sound/wooden-chest-close.ogg" },
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/wooden-chest/wooden-chest.png",
          priority = "extra-high",
          width = 32,
          height = 36,
          shift = util.by_pixel(0.5, -2),
          hr_version =
          {
            filename = "__base__/graphics/entity/wooden-chest/hr-wooden-chest.png",
            priority = "extra-high",
            width = 62,
            height = 72,
            shift = util.by_pixel(0.5, -2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/wooden-chest/wooden-chest-shadow.png",
          priority = "extra-high",
          width = 52,
          height = 20,
          shift = util.by_pixel(10, 6.5),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/wooden-chest/hr-wooden-chest-shadow.png",
            priority = "extra-high",
            width = 104,
            height = 40,
            shift = util.by_pixel(10, 6.5),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "container",
    name = "iron-chest",
    icon = "__base__/graphics/icons/iron-chest.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "iron-chest"},
    max_health = 200,
    corpse = "iron-chest-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
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
    fast_replaceable_group = "container",
    inventory_size = 32,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
          priority = "extra-high",
          width = 34,
          height = 38,
          shift = util.by_pixel(0, -0.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/iron-chest/hr-iron-chest.png",
            priority = "extra-high",
            width = 66,
            height = 76,
            shift = util.by_pixel(-0.5, -0.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
          priority = "extra-high",
          width = 56,
          height = 26,
          shift = util.by_pixel(10, 6.5),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/iron-chest/hr-iron-chest-shadow.png",
            priority = "extra-high",
            width = 110,
            height = 50,
            shift = util.by_pixel(10.5, 6),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "container",
    name = "bait-chest",
    order = "a",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    max_health = 1,
    collision_box = {{-0.01, -0.01}, {0.01, 0.01}},
    selectable_in_game = false,
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    inventory_size = 16,
    open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" },
    close_sound = { filename = "__base__/sound/wooden-chest-close.ogg" },
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    picture =
    {
      filename = "__base__/graphics/entity/wooden-chest/wooden-chest.png",
      priority = "extra-high",
      width = 1,
      height = 1,
    },
  },

  {
    type = "electric-pole",
    name = "small-electric-pole",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {mining_time = 0.1, result = "small-electric-pole"},
    max_health = 100,
    corpse = "small-electric-pole-remnants",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    drawing_box = {{-0.5, -2.6}, {0.5, 0.5}},
    maximum_wire_distance = 7.5,
    supply_area_distance = 2.5,
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    track_coverage_during_build_by_moving = true,
    fast_replaceable_group = "electric-pole",
    pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/small-electric-pole/small-electric-pole.png",
          priority = "extra-high",
          width = 36,
          height = 108,
          direction_count = 4,
          shift = util.by_pixel(2, -42),
          hr_version =
          {
            filename = "__base__/graphics/entity/small-electric-pole/hr-small-electric-pole.png",
            priority = "extra-high",
            width = 72,
            height = 220,
            direction_count = 4,
            shift = util.by_pixel(1.5, -42.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/small-electric-pole/small-electric-pole-shadow.png",
          priority = "extra-high",
          width = 130,
          height = 28,
          direction_count = 4,
          shift = util.by_pixel(50, 2),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/small-electric-pole/hr-small-electric-pole-shadow.png",
            priority = "extra-high",
            width = 256,
            height = 52,
            direction_count = 4,
            shift = util.by_pixel(51, 3),
            draw_as_shadow = true,
            scale = 0.5
          }
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
    }
  },

  {
    type = "explosion",
    name = "explosion",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/explosion/explosion-1.png",
        priority = "high",
        width = 64,
        height = 59,
        frame_count = 16,
        animation_speed = 0.5
      },
      {
        filename = "__base__/graphics/entity/explosion/explosion-2.png",
        priority = "high",
        width = 64,
        height = 57,
        frame_count = 16,
        animation_speed = 0.5
      },
      {
        filename = "__base__/graphics/entity/explosion/explosion-3.png",
        priority = "high",
        width = 64,
        height = 49,
        frame_count = 16,
        animation_speed = 0.5
      },
      {
        filename = "__base__/graphics/entity/explosion/explosion-4.png",
        priority = "high",
        width = 64,
        height = 51,
        frame_count = 16,
        animation_speed = 0.5
      }
    },
    light = {intensity = 1, size = 20, color = {r=1.0, g=1.0, b=1.0}},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound =
    {
      aggregation =
      {
        max_count = 1,
        remove = true
      },
      variations =
      {
        {
          filename = "__base__/sound/fight/small-explosion-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/fight/small-explosion-2.ogg",
          volume = 0.75
        }
      }
    }
  },

  {
    type = "explosion",
    name = "explosion-gunshot",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/explosion-gunshot/explosion-gunshot.png",
        priority = "extra-high",
        width = 34,
        height = 38,
        frame_count = 2,
        animation_speed = 1.5,
        shift = {0, 0}
      },
      {
        filename = "__base__/graphics/entity/explosion-gunshot/explosion-gunshot.png",
        priority = "extra-high",
        width = 34,
        height = 38,
        x = 34 * 2,
        frame_count = 2,
        animation_speed = 1.5,
        shift = {0, 0}
      },
      {
        filename = "__base__/graphics/entity/explosion-gunshot/explosion-gunshot.png",
        priority = "extra-high",
        width = 34,
        height = 38,
        x = 34 * 4,
        frame_count = 3,
        animation_speed = 1.5,
        shift = {0, 0}
      },
      {
        filename = "__base__/graphics/entity/explosion-gunshot/explosion-gunshot.png",
        priority = "extra-high",
        width = 34,
        height = 38,
        x = 34 * 7,
        frame_count = 3,
        animation_speed = 1.5,
        shift = {0, 0}
      },
      {
        filename = "__base__/graphics/entity/explosion-gunshot/explosion-gunshot.png",
        priority = "extra-high",
        width = 34,
        height = 38,
        x = 34 * 10,
        frame_count = 3,
        animation_speed = 1.5,
        shift = {0, 0}
      }
    },
    rotate = true,
    light = {intensity = 1, size = 10, color = {r=1.0, g=1.0, b=1.0}},
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },

  {
    type = "explosion",
    name = "explosion-gunshot-small",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/explosion-hit/explosion-hit.png",
        priority = "extra-high",
        width = 34,
        height = 38,
        frame_count = 13,
        animation_speed = 1.5,
        shift = {0, 0}
      }
    },
    rotate = true,
    light = {intensity = 1, size = 10, color = {r=1.0, g=1.0, b=1.0}},
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },
  {
    type = "explosion",
    name = "explosion-hit",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/explosion-hit/explosion-hit.png",
        priority = "extra-high",
        width = 34,
        height = 38,
        frame_count = 13,
        animation_speed = 1.5,
        shift = {0, -0.3125}
      }
    },
    light = {intensity = 1, size = 10, color = {r=1.0, g=1.0, b=1.0}},
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },
  {
    type = "explosion",
    name = "big-explosion",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/big-explosion/big-explosion.png",
        flags = { "compressed" },
        width = 197,
        height = 245,
        frame_count = 47,
        line_length = 6,
        shift = {0.1875, -0.75},
        animation_speed = 0.5
      }
    },
    light = {intensity = 1, size = 50, color = {r=1.0, g=1.0, b=1.0}},
    sound =
    {
      aggregation =
      {
        max_count = 1,
        remove = true
      },
      variations =
      {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.0
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.0
        }
      }
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            entity_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "medium-explosion",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/medium-explosion/medium-explosion.png",
        priority = "high",
        width = 112,
        height = 94,
        frame_count = 54,
        line_length = 6,
        shift = {-0.56, -0.96},
        animation_speed = 0.5
      }
    },
    light = {intensity = 1, size = 50, color = {r=1.0, g=1.0, b=1.0}},
    sound =
    {
      aggregation =
      {
        max_count = 1,
        remove = true
      },
      variations =
      {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 0.8
        }
      }
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            entity_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "massive-explosion",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/medium-explosion/medium-explosion.png",
        priority = "high",
        width = 112,
        height = 94,
        scale = 0.8,
        frame_count = 54,
        line_length = 6,
        shift = {-0.56, -0.96},
        animation_speed = 0.5
      }
    },
    light = {intensity = 1, size = 50, color = {r=1.0, g=1.0, b=1.0}},
    sound =
    {
      aggregation =
      {
        max_count = 1,
        remove = true
      },
      variations =
      {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.0
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.0
        }
      }
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 60,
            entity_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "ground-explosion",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/medium-explosion/medium-explosion.png",
        priority = "high",
        width = 112,
        height = 94,
        scale = 0.8,
        frame_count = 54,
        line_length = 6,
        shift = {-0.56, -0.96},
        animation_speed = 0.5
      }
    },
    light = {intensity = 1, size = 10, color = {r=1.0, g=0.8, b=0.6}},
    sound =
    {
      aggregation =
      {
        max_count = 1,
        remove = true
      },
      variations =
      {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.0
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.0
        }
      }
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 10,
            entity_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.20,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
          },
          {
            type = "create-particle",
            repeat_count = 100,
            entity_name = "stone-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.20,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "blood-explosion-small",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__core__/graphics/empty.png",
        priority = "high",
        width = 1,
        height = 1,
        frame_count = 1
      }
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "create-entity",
          entity_name = "blood-fountain",
          repeat_count = 20,
          offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}}
        }
      }
    }
  },
  {
    type = "explosion",
    name = "blood-explosion-big",
    flags = {"not-on-map"},
     animations =
    {
      {
        filename = "__core__/graphics/empty.png",
        priority = "high",
        width = 1,
        height = 1,
        frame_count = 1
      }
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 150,
            entity_name = "blood-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.05,
            initial_vertical_speed = -0.01,
            initial_vertical_speed_deviation = 0.02,
            offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}}
          },
          {
            type = "create-entity",
            entity_name = "blood-fountain",
            repeat_count = 35,
            offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}}
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "blood-explosion-huge",
    flags = {"not-on-map"},
     animations =
    {
      {
        filename = "__core__/graphics/empty.png",
        priority = "high",
        width = 1,
        height = 1,
        frame_count = 1
      }
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 150,
            entity_name = "blood-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.05,
            initial_vertical_speed = -0.01,
            initial_vertical_speed_deviation = 0.02,
            offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}}
          },
          {
            type = "create-entity",
            entity_name = "blood-fountain-big",
            repeat_count = 35,
            offset_deviation = {{-1.6, -1.6}, {1.6, 1.6}}
          }
        }
      }
    }
  },
  {
    type = "generator",
    name = "steam-engine",
    icon = "__base__/graphics/icons/steam-engine.png",
    icon_size = 32,
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.3, result = "steam-engine"},
    max_health = 400,
    dying_explosion = "medium-explosion",
    corpse = "steam-engine-remnants",
    alert_icon_shift = util.by_pixel(3, -34),
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
    collision_box = {{-1.35, -2.35}, {1.35, 2.35}},
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    fluid_box =
    {
      base_area = 1,
      height = 2,
      base_level = -1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { type = "input-output", position = {0, 3} },
        { type = "input-output", position = {0, -3} }
      },
      production_type = "input-output",
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
          width = 176,
          height = 128,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(1, -5),
          hr_version =
          {
            filename = "__base__/graphics/entity/steam-engine/hr-steam-engine-H.png",
            width = 352,
            height = 257,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(1, -4.75),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/steam-engine/steam-engine-H-shadow.png",
          width = 254,
          height = 80,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(48, 24),
          hr_version =
          {
            filename = "__base__/graphics/entity/steam-engine/hr-steam-engine-H-shadow.png",
            width = 508,
            height = 160,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(48, 24),
            scale = 0.5
          }
        }
      }
    },
    vertical_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steam-engine/steam-engine-V.png",
          width = 112,
          height = 195,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(5, -6.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/steam-engine/hr-steam-engine-V.png",
            width = 225,
            height = 391,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(4.75, -6.25),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/steam-engine/steam-engine-V-shadow.png",
          width = 165,
          height = 153,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(40.5, 9.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/steam-engine/hr-steam-engine-V-shadow.png",
            width = 330,
            height = 307,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(40.5, 9.25),
            scale = 0.5
          }
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
        slow_down_factor = 1,
        starting_frame_deviation = 60
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/steam-engine-90bpm.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true
    },
    min_perceived_performance = 0.25,
    performance_to_sound_speedup = 0.5
  },

  {
    type = "offshore-pump",
    name = "offshore-pump",
    icon = "__base__/graphics/icons/offshore-pump.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "filter-directions"},
    collision_mask = { "ground-tile", "object-layer" },
    fluid_box_tile_collision_test = { "ground-tile" },
    adjacent_tile_collision_test = { "water-tile" },
    minable = {mining_time = 0.1, result = "offshore-pump"},
    max_health = 150,
    corpse = "small-remnants",
    fluid = "water",
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
    selection_box = {{-1, -1.49}, {1, 0.49}},
    fluid_box =
    {
      base_area = 1,
      base_level = 1,
      pipe_covers = pipecoverspictures(),
      production_type = "output",
      filter = "water",
      pipe_connections =
      {
        {
          position = {0, 1},
          type = "output"
        }
      }
    },
    pumping_speed = 20,
    tile_width = 1,
    tile_height = 1,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      north =
      {
        filename = "__base__/graphics/entity/offshore-pump/offshore-pump.png",
        priority = "high",
        shift = {0.90625, 0.0625},
        width = 160,
        height = 102
      },
      east =
      {
        filename = "__base__/graphics/entity/offshore-pump/offshore-pump.png",
        priority = "high",
        shift = {0.90625, 0.0625},
        x = 160,
        width = 160,
        height = 102
      },
      south =
      {
        filename = "__base__/graphics/entity/offshore-pump/offshore-pump.png",
        priority = "high",
        shift = {0.90625, 0.65625},
        x = 320,
        width = 160,
        height = 102
      },
      west =
      {
        filename = "__base__/graphics/entity/offshore-pump/offshore-pump.png",
        priority = "high",
        shift = {1.0, 0.0625},
        x = 480,
        width = 160,
        height = 102
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
    circuit_wire_connection_points = circuit_connector_definitions["offshore-pump"].points,
    circuit_connector_sprites = circuit_connector_definitions["offshore-pump"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance

  },

  trivial_smoke{name = "smoke", color = {r = 0.4, g = 0.4, b = 0.4, a = 0.4}},
  trivial_smoke{name = "light-smoke", color = {r = 0.5, g = 0.5, b = 0.5, a = 0.3}},
  trivial_smoke{name = "turbine-smoke", color = {r = 0.5, g = 0.5, b = 0.5, a = 0.3}, start_scale = 0.8, fade_in_duration = 30 },
  trivial_smoke
  {
    name = "train-smoke",
    color = {r = 0.3, g = 0.3, b = 0.3, a = 0.3},
    duration = 150,
    spread_duration = 100,
    fade_away_duration = 100,
    start_scale = 0.4,
    end_scale = 1.5,
    affected_by_wind = true
  },
  trivial_smoke
  {
    name = "car-smoke",
    color = {r = 0.5, g = 0.5, b = 0.5, a = 0.5},
    duration = 12,
    spread_duration = 12,
    fade_away_duration = 12,
    start_scale = 0.1,
    end_scale = 0.5
  },
  trivial_smoke
  {
    name = "tank-smoke",
    color = {r = 0.6, g = 0.6, b = 0.6, a = 0.6},
    duration = 100,
    spread_duration = 100,
    fade_away_duration = 100,
    start_scale = 0.3,
    end_scale = 1.0
  },
  {
    type = "trivial-smoke",
    name = "smoke-fast",
    animation =
    {
      filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
      priority = "high",
      width = 50,
      height = 50,
      frame_count = 16,
      animation_speed = 16 / 60,
    },
    duration = 60,
    fade_away_duration = 60
  },

  {
    type = "trivial-smoke",
    name = "smoke-train-stop",
    animation =
    {
      filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
      priority = "high",
      width = 50,
      height = 50,
      animation_speed = 16 / 60,
      frame_count = 16,
      scale = 0.5
    },
    render_layer = "lower-object",
    affected_by_wind = false,
    movement_slow_down_factor = 0.95,
    duration = 40,
    fade_away_duration = 30,
    show_when_smoke_off = true
  },

  {
    type = "trivial-smoke",
    name = "smoke-building",
    animation =
    {
      filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
      priority = "high",
      width = 50,
      height = 50,
      animation_speed = 1 / 2,
      frame_count = 16,
      scale = 0.5
    },
    render_layer = "building-smoke",
    affected_by_wind = false,
    movement_slow_down_factor = 0.96,
    duration = 45,
    fade_away_duration = 20,
    show_when_smoke_off = true
  },

  {
    type = "trivial-smoke",
    name = "smoke-explosion-particle",
    animation =
    {
      filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
      priority = "high",
      width = 50,
      height = 50,
      animation_speed = 1 / 2,
      frame_count = 16,
      scale = 0.5,
      tint = {r = 0.1, g = 0.1, b = 0.1, a = 0.7}
    },
    render_layer = "smoke",
    affected_by_wind = false,
    movement_slow_down_factor = 0.96,
    duration = 150,
    fade_away_duration = 60,
    show_when_smoke_off = true
  },

  {
    type = "inserter",
    name = "inserter",
    icon = "__base__/graphics/icons/inserter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "inserter"},
    max_health = 150,
    corpse = "inserter-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    energy_per_movement = "5kJ",
    energy_per_rotation = "5kJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.4kW"
    },
    extension_speed = 0.03,
    rotation_speed = 0.014,
    fast_replaceable_group = "inserter",
    next_upgrade = "fast-inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-basic-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version =
      {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25
      }
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/inserter/inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/inserter/hr-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/inserter/inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
        hr_version =
        {
          filename = "__base__/graphics/entity/inserter/hr-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5
        }
      }
    },
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = "fast-inserter",
    icon = "__base__/graphics/icons/fast-inserter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = { mining_time = 0.1, result = "fast-inserter" },
    max_health = 150,
    corpse = "fast-inserter-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = "7KJ",
    energy_per_rotation = "7KJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.5kW"
    },
    extension_speed = 0.07,
    rotation_speed = 0.04,
    fast_replaceable_group = "inserter",
    next_upgrade = "stack-inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-fast-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/fast-inserter/fast-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34,
      hr_version =
      {
        filename = "__base__/graphics/entity/fast-inserter/hr-fast-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25
      }
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/fast-inserter/fast-inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/fast-inserter/hr-fast-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/fast-inserter/fast-inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/fast-inserter/hr-fast-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/fast-inserter/fast-inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
        hr_version =
        {
          filename = "__base__/graphics/entity/fast-inserter/hr-fast-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5
        }
      }
    },
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = "long-handed-inserter",
    icon = "__base__/graphics/icons/long-handed-inserter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "long-handed-inserter"},
    max_health = 160,
    corpse = "long-handed-inserter-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -2},
    insert_position = {0, 2.2},
    energy_per_movement = "5KJ",
    energy_per_rotation = "5KJ",
    rotation_speed = 0.02,
    extension_speed = 0.0457,
    hand_size = 1.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.4kW"
    },
    fast_replaceable_group = "long-handed-inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-long-handed-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-long-handed-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-long-handed-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-long-handed-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-long-handed-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34,
      hr_version =
      {
        filename = "__base__/graphics/entity/long-handed-inserter/hr-long-handed-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25
      }
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/long-handed-inserter/hr-long-handed-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/long-handed-inserter/hr-long-handed-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
        hr_version =
        {
          filename = "__base__/graphics/entity/long-handed-inserter/hr-long-handed-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5
        }
      }
    },
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = "burner-inserter",
    icon = "__base__/graphics/icons/burner-inserter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "burner-inserter"},
    max_health = 100,
    corpse = "burner-inserter-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    energy_per_movement = "50KJ",
    energy_per_rotation = "50KJ",
    energy_source =
    {
      type = "burner",
      fuel_category = "chemical",
      effectivity = 1,
      fuel_inventory_size = 1,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 9
        }
      }
    },
    extension_speed = 0.0214,
    rotation_speed = 0.01,
    fast_replaceable_group = "inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-basic-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-basic-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25
      }
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/burner-inserter/burner-inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
        hr_version =
        {
          filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5
        }
      }
    },
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },

  {
    type = "item-entity",
    name = "item-on-ground",
    flags = {"placeable-off-grid", "not-on-map"},
    collision_box = {{-0.14, -0.14}, {0.14, 0.14}},
    selection_box = {{-0.17, -0.17}, {0.17, 0.17}},
    minable = {mining_time = 0.025}
  },

  {
    type = "pipe",
    name = "pipe",
    icon = "__base__/graphics/icons/pipe.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {mining_time = 0.1, result = "pipe"},
    max_health = 100,
    corpse = "pipe-remnants",
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
    fluid_box =
    {
      base_area = 1,
      pipe_connections =
      {
        { position = {0, -1} },
        { position = {1, 0} },
        { position = {0, 1} },
        { position = {-1, 0} }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures = pipepictures(),
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/pipe.ogg",
          volume = 0.85
        }
      },
      match_volume_to_activity = true,
      max_sounds_per_type = 3
    },

    horizontal_window_bounding_box = {{-0.25, -0.28125}, {0.25, 0.15625}},
    vertical_window_bounding_box = {{-0.28125, -0.5}, {0.03125, 0.125}}
  },

  {
    type = "radar",
    name = "radar",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "radar"},
    max_health = 250,
    corpse = "radar-remnants",
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
      width = 119,
      height = 108,
      direction_count = 1,
      shift = util.by_pixel(1.5, 4),
      hr_version =
      {
        filename = "__base__/graphics/entity/radar/hr-radar-integration.png",
        priority = "low",
        width = 238,
        height = 216,
        direction_count = 1,
        shift = util.by_pixel(1.5, 4),
        scale = 0.5
      }
    },
    pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/radar/radar.png",
          priority = "low",
          width = 98,
          height = 128,
          apply_projection = false,
          direction_count = 64,
          line_length = 8,
          shift = util.by_pixel(1, -16),
          hr_version =
          {
            filename = "__base__/graphics/entity/radar/hr-radar.png",
            priority = "low",
            width = 196,
            height = 254,
            apply_projection = false,
            direction_count = 64,
            line_length = 8,
            shift = util.by_pixel(1, -16),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/radar/radar-shadow.png",
          priority = "low",
          width = 172,
          height = 94,
          apply_projection = false,
          direction_count = 64,
          line_length = 8,
          shift = util.by_pixel(39,3),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/radar/hr-radar-shadow.png",
            priority = "low",
            width = 343,
            height = 186,
            apply_projection = false,
            direction_count = 64,
            line_length = 8,
            shift = util.by_pixel(39.25,3),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/radar.ogg"
        }
      },
      apparent_volume = 2
    },
    radius_minimap_visualisation_color = { r = 0.059, g = 0.092, b = 0.235, a = 0.275 },
    rotation_speed = 0.01
  },

  {
    type = "lamp",
    name = "small-lamp",
    icon = "__base__/graphics/icons/small-lamp.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "small-lamp"},
    max_health = 100,
    corpse = "lamp-remnants",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_source =
    {
      type = "electric",
      usage_priority = "lamp"
    },
    energy_usage_per_tick = "5KW",
    darkness_for_all_lamps_on = 0.5,
    darkness_for_all_lamps_off = 0.3,
    light = {intensity = 0.9, size = 40, color = {r=1.0, g=1.0, b=1.0}},
    light_when_colored = {intensity = 1, size = 6, color = {r=1.0, g=1.0, b=1.0}},
    glow_size = 6,
    glow_color_intensity = 0.135,
    picture_off =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/small-lamp/lamp.png",
          priority = "high",
          width = 42,
          height = 36,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 1,
          shift = util.by_pixel(0,3),
          hr_version =
          {
            filename = "__base__/graphics/entity/small-lamp/hr-lamp.png",
            priority = "high",
            width = 83,
            height = 70,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(0.25,3),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/small-lamp/lamp-shadow.png",
          priority = "high",
          width = 38,
          height = 24,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 1,
          shift = util.by_pixel(4,5),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/small-lamp/hr-lamp-shadow.png",
            priority = "high",
            width = 76,
            height = 47,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(4, 4.75),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    picture_on =
    {
      filename = "__base__/graphics/entity/small-lamp/lamp-light.png",
      priority = "high",
      width = 46,
      height = 40,
      frame_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(0, -7),
      hr_version =
      {
        filename = "__base__/graphics/entity/small-lamp/hr-lamp-light.png",
        priority = "high",
        width = 90,
        height = 78,
        frame_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(0, -7),
        scale = 0.5
      }
    },
    signal_to_color_mapping =
    {
      {type="virtual", name="signal-red", color={r=1,g=0,b=0}},
      {type="virtual", name="signal-green", color={r=0,g=1,b=0}},
      {type="virtual", name="signal-blue", color={r=0,g=0,b=1}},
      {type="virtual", name="signal-yellow", color={r=1,g=1,b=0}},
      {type="virtual", name="signal-pink", color={r=1,g=0,b=1}},
      {type="virtual", name="signal-cyan", color={r=0,g=1,b=1}}
    },

    circuit_wire_connection_point = circuit_connector_definitions["lamp"].points,
    circuit_connector_sprites = circuit_connector_definitions["lamp"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },

  {
    type = "arrow",
    name = "orange-arrow-with-circle",
    flags = {"placeable-off-grid", "not-on-map"},
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
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "pipe-to-ground"},
    max_health = 150,
    corpse = "pipe-to-ground-remnants",
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
    fluid_box =
    {
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {0, 1},
          max_underground_distance = 10
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures =
    {
      up =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      }
    }
  },

  {
    type = "assembling-machine",
    name = "assembling-machine-1",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "assembling-machine-1"},
    max_health = 300,
    dying_explosion = "medium-explosion",
    corpse = "medium-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    --fluid_boxes =
    --{
    --  {
    --    production_type = "input",
    --    pipe_picture = assembler1pipepictures(),
    --    pipe_covers = pipecoverspictures(),
    --    base_area = 10,
    --    base_level = -1,
    --    pipe_connections = {{ type="input", position = {0, -2} }},
    --    secondary_draw_orders = { north = -1 }
    --  },
    --  {
    --    production_type = "output",
    --    pipe_picture = assembler1pipepictures(),
    --    pipe_covers = pipecoverspictures(),
    --    base_area = 10,
    --    base_level = 1,
    --    pipe_connections = {{ type="output", position = {0, 2} }},
    --    secondary_draw_orders = { north = -1 }
    --  },
    --  off_when_no_fluid_recipe = true
    --},
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    next_upgrade = "assembling-machine-2",
    alert_icon_shift = util.by_pixel(-3, -12),
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
          priority="high",
          width = 108,
          height = 114,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 2),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1.png",
            priority="high",
            width = 214,
            height = 226,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
          priority="high",
          width = 95,
          height = 83,
          frame_count = 1,
          line_length = 1,
          repeat_count = 32,
          draw_as_shadow = true,
          shift = util.by_pixel(8.5, 5.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1-shadow.png",
            priority="high",
            width = 190,
            height = 165,
            frame_count = 1,
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
      emissions_per_minute = 4
    },
    energy_usage = "75kW",
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
          volume = 0.8
        }
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5
    }
  },
  {
    type = "assembling-machine",
    name = "assembling-machine-2",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "assembling-machine-2"},
    max_health = 350,
    dying_explosion = "medium-explosion",
    corpse = "medium-remnants",
    alert_icon_shift = util.by_pixel(-3, -12),
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes = (not data.is_demo) and
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }},
        secondary_draw_orders = { north = -1 }
      },
      off_when_no_fluid_recipe = true
    } or nil,
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    next_upgrade = "assembling-machine-3",
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2.png",
          priority = "high",
          width = 108,
          height = 110,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 4),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-2/hr-assembling-machine-2.png",
            priority = "high",
            width = 214,
            height = 218,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 4),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-shadow.png",
          priority = "high",
          width = 98,
          height = 82,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(12, 5),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-2/hr-assembling-machine-2-shadow.png",
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
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-t2-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t2-2.ogg",
          volume = 0.8
        }
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5
    },
    crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid"},

    crafting_speed = 0.75,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 3
    },
    energy_usage = "150kW",
    module_specification =
    {
      module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },
  {
    type = "flying-text",
    name = "flying-text",
    flags = {"not-on-map", "placeable-off-grid"},
    time_to_live = 150,
    speed = 0.05
  },
  {
    type = "speech-bubble",
    name = "compi-speech-bubble",
    style = "compilatron_speech_bubble",
    wrapper_flow_style = "compilatron_speech_bubble_wrapper",
    fade_in_out_ticks = 60 * 0.5,
    flags = {"not-on-map", "placeable-off-grid"}
  },
  {
    type = "flying-text",
    name = "tutorial-flying-text",
    flags = {"not-on-map", "placeable-off-grid"},
    time_to_live = 120,
    speed = 0.02,
    text_alignment = "center"
  },

  {
    type = "entity-ghost",
    name = "entity-ghost",
    flags = {"not-on-map"},
    minable = { mining_time = 0, results={}}
  },

  {
    type = "tile-ghost",
    name = "tile-ghost",
    flags = {"not-on-map"},
    minable = { mining_time = 0, results={}},
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_priority = 45
  },

  {
    type = "deconstructible-tile-proxy",
    name = "deconstructible-tile-proxy",
    flags = {"not-on-map"},
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
  },
  {
    type = "item-request-proxy",
    name = "item-request-proxy",
    picture =
    {
      filename = "__core__/graphics/icons/alerts/logistic-delivery.png",
      flags = { "icon" },
      priority = "extra-high",
      width = 64,
      height = 64,
      shift = {0, 0},
      scale = 0.5
    },
    use_target_entity_alert_icon_shift = true,
    flags = {"not-on-map", "placeable-off-grid"},
    minable = { mining_time = 0, results={}},
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -0.4}, {0.5, 0.6}}
  },
  {
    type = "explosion",
    name = "water-splash",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/water-splash/water-splash.png",
        priority = "extra-high",
        width = 92,
        height = 66,
        frame_count = 15,
        line_length = 5,
        shift = {-0.437, 0.5},
        animation_speed = 0.35
      }
    }
  },

  scaled_cliff("cliff", 1.0, 16),

  {
    type = "wall",
    name = "stone-wall",
    icon = "__base__/graphics/icons/wall.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    minable = {mining_time = 0.2, result = "stone-wall"},
    fast_replaceable_group = "wall",
    max_health = 350,
    repair_speed_modifier = 2,
    corpse = "wall-remnants",
    repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
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
            width = 32,
            height = 46,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, -6),
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-single.png",
              priority = "extra-high",
              width = 64,
              height = 86,
              variation_count = 2,
              line_length = 2,
              shift = util.by_pixel(0, -5),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/wall/wall-single-shadow.png",
            priority = "extra-high",
            width = 50,
            height = 32,
            repeat_count = 2,
            shift = util.by_pixel(10, 16),
            draw_as_shadow = true,
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-single-shadow.png",
              priority = "extra-high",
              width = 98,
              height = 60,
              repeat_count = 2,
              shift = util.by_pixel(10, 17),
              draw_as_shadow = true,
              scale = 0.5
            }
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
            width = 32,
            height = 68,
            variation_count = 5,
            line_length = 5,
            shift = util.by_pixel(0, 8),
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-vertical.png",
              priority = "extra-high",
              width = 64,
              height = 134,
              variation_count = 5,
              line_length = 5,
              shift = util.by_pixel(0, 8),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/wall/wall-vertical-shadow.png",
            priority = "extra-high",
            width = 50,
            height = 58,
            repeat_count = 5,
            shift = util.by_pixel(10, 28),
            draw_as_shadow = true,
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-vertical-shadow.png",
              priority = "extra-high",
              width = 98,
              height = 110,
              repeat_count = 5,
              shift = util.by_pixel(10, 29),
              draw_as_shadow = true,
              scale = 0.5
            }
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
            width = 32,
            height = 50,
            variation_count = 6,
            line_length = 6,
            shift = util.by_pixel(0, -4),
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-horizontal.png",
              priority = "extra-high",
              width = 64,
              height = 92,
              variation_count = 6,
              line_length = 6,
              shift = util.by_pixel(0, -2),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/wall/wall-horizontal-shadow.png",
            priority = "extra-high",
            width = 62,
            height = 36,
            repeat_count = 6,
            shift = util.by_pixel(14, 14),
            draw_as_shadow = true,
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-horizontal-shadow.png",
              priority = "extra-high",
              width = 124,
              height = 68,
              repeat_count = 6,
              shift = util.by_pixel(14, 15),
              draw_as_shadow = true,
              scale = 0.5
            }
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
            width = 32,
            height = 64,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, 6),
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-corner-right.png",
              priority = "extra-high",
              width = 64,
              height = 128,
              variation_count = 2,
              line_length = 2,
              shift = util.by_pixel(0, 7),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/wall/wall-corner-right-shadow.png",
            priority = "extra-high",
            width = 62,
            height = 60,
            repeat_count = 2,
            shift = util.by_pixel(14, 28),
            draw_as_shadow = true,
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-corner-right-shadow.png",
              priority = "extra-high",
              width = 124,
              height = 120,
              repeat_count = 2,
              shift = util.by_pixel(17, 28),
              draw_as_shadow = true,
              scale = 0.5
            }
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
            width = 32,
            height = 68,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, 6),
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-corner-left.png",
              priority = "extra-high",
              width = 64,
              height = 134,
              variation_count = 2,
              line_length = 2,
              shift = util.by_pixel(0, 7),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/wall/wall-corner-left-shadow.png",
            priority = "extra-high",
            width = 54,
            height = 60,
            repeat_count = 2,
            shift = util.by_pixel(8, 28),
            draw_as_shadow = true,
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-corner-left-shadow.png",
              priority = "extra-high",
              width = 102,
              height = 120,
              repeat_count = 2,
              shift = util.by_pixel(9, 28),
              draw_as_shadow = true,
              scale = 0.5
            }
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
            width = 32,
            height = 68,
            variation_count = 4,
            line_length = 4,
            shift = util.by_pixel(0, 6),
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-t.png",
              priority = "extra-high",
              width = 64,
              height = 134,
              variation_count = 4,
              line_length = 4,
              shift = util.by_pixel(0, 7),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/wall/wall-t-shadow.png",
            priority = "extra-high",
            width = 62,
            height = 60,
            repeat_count = 4,
            shift = util.by_pixel(14, 28),
            draw_as_shadow = true,
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-t-shadow.png",
              priority = "extra-high",
              width = 124,
              height = 120,
              repeat_count = 4,
              shift = util.by_pixel(14, 28),
              draw_as_shadow = true,
              scale = 0.5
            }
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
            width = 32,
            height = 48,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, -4),
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-ending-right.png",
              priority = "extra-high",
              width = 64,
              height = 92,
              variation_count = 2,
              line_length = 2,
              shift = util.by_pixel(0, -3),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/wall/wall-ending-right-shadow.png",
            priority = "extra-high",
            width = 62,
            height = 36,
            repeat_count = 2,
            shift = util.by_pixel(14, 14),
            draw_as_shadow = true,
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-ending-right-shadow.png",
              priority = "extra-high",
              width = 124,
              height = 68,
              repeat_count = 2,
              shift = util.by_pixel(17, 15),
              draw_as_shadow = true,
              scale = 0.5
            }
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
            width = 32,
            height = 48,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, -4),
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-ending-left.png",
              priority = "extra-high",
              width = 64,
              height = 92,
              variation_count = 2,
              line_length = 2,
              shift = util.by_pixel(0, -3),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/wall/wall-ending-left-shadow.png",
            priority = "extra-high",
            width = 54,
            height = 36,
            repeat_count = 2,
            shift = util.by_pixel(8, 14),
            draw_as_shadow = true,
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-ending-left-shadow.png",
              priority = "extra-high",
              width = 102,
              height = 68,
              repeat_count = 2,
              shift = util.by_pixel(9, 15),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      filling =
      {
        filename = "__base__/graphics/entity/wall/wall-filling.png",
          priority = "extra-high",
          width = 24,
          height = 30,
          variation_count = 8,
          line_length = 8,
          shift = util.by_pixel(0, -2),
          hr_version =
          {
            filename = "__base__/graphics/entity/wall/hr-wall-filling.png",
            priority = "extra-high",
            width = 48,
            height = 56,
            variation_count = 8,
            line_length = 8,
            shift = util.by_pixel(0, -1),
            scale = 0.5
          }
      },
      water_connection_patch =
      {
        sheets =
        {
          {
            filename = "__base__/graphics/entity/wall/wall-patch.png",
            priority = "extra-high",
            width = 58,
            height = 64,
            shift = util.by_pixel(0, -2),
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-patch.png",
              priority = "extra-high",
              width = 116,
              height = 128,
              shift = util.by_pixel(0, -2),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/wall/wall-patch-shadow.png",
            priority = "extra-high",
            width = 74,
            height = 52,
            shift = util.by_pixel(8, 14),
            draw_as_shadow = true,
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-patch-shadow.png",
              priority = "extra-high",
              width = 144,
              height = 100,
              shift = util.by_pixel(9, 15),
              draw_as_shadow = true,
              scale = 0.5
            }
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
            width = 42,
            height = 56,
            shift = util.by_pixel(0, -8),
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-gate.png",
              priority = "extra-high",
              width = 82,
              height = 108,
              shift = util.by_pixel(0, -7),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/wall/wall-gate-shadow.png",
            priority = "extra-high",
            width = 66,
            height = 40,
            shift = util.by_pixel(14, 18),
            draw_as_shadow = true,
            hr_version =
            {
              filename = "__base__/graphics/entity/wall/hr-wall-gate-shadow.png",
              priority = "extra-high",
              width = 130,
              height = 78,
              shift = util.by_pixel(14, 18),
              draw_as_shadow = true,
              scale = 0.5
            }
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
        width = 38,
        height = 24,
        --frames = 4, -- this is optional, it will default to 4 for Sprite4Way
        shift = util.by_pixel(-2, -24),
        hr_version =
        {
          filename = "__base__/graphics/entity/wall/hr-wall-diode-green.png",
          priority = "extra-high",
          width = 72,
          height = 44,
          --frames = 4,
          shift = util.by_pixel(-1, -23),
          scale = 0.5
        }
      }
    },
    wall_diode_green_light_top =
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(0, -30),
      size = 1,
      intensity = 0.3
    },
    wall_diode_green_light_right =
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(12, -23),
      size = 1,
      intensity = 0.3
    },
    wall_diode_green_light_bottom =
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(0, -17),
      size = 1,
      intensity = 0.3
    },
    wall_diode_green_light_left =
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(-12, -23),
      size = 1,
      intensity = 0.3
    },

    wall_diode_red =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/wall/wall-diode-red.png",
        priority = "extra-high",
        width = 38,
        height = 24,
        --frames = 4, -- this is optional, it will default to 4 for Sprite4Way
        shift = util.by_pixel(-2, -24),
        hr_version =
        {
          filename = "__base__/graphics/entity/wall/hr-wall-diode-red.png",
          priority = "extra-high",
          width = 72,
          height = 44,
          --frames = 4,
          shift = util.by_pixel(-1, -23),
          scale = 0.5
        }
      }
    },
    wall_diode_red_light_top =
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(0, -30),
      size = 1,
      intensity = 0.3
    },
    wall_diode_red_light_right =
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(12, -23),
      size = 1,
      intensity = 0.3
    },
    wall_diode_red_light_bottom =
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(0, -17),
      size = 1,
      intensity = 0.3
    },
    wall_diode_red_light_left =
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(-12, -23),
      size = 1,
      intensity = 0.3
    },

    circuit_wire_connection_point = circuit_connector_definitions["gate"].points,
    circuit_connector_sprites = circuit_connector_definitions["gate"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    default_output_signal = data.is_demo and {type = "virtual", name = "signal-green"} or {type = "virtual", name = "signal-G"}
  },
  {
    type = "unit",
    name = "compilatron",
    icon = "__base__/graphics/icons/compilatron.png",
    icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 1000000,
    order = "b-b-a",
    subgroup="enemies",
    has_belt_immunity = true,
    selectable_in_game = true,
    can_open_gates = true,
    healing_per_tick = 1000000,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.8, -1.3}, {0.8, 0.5}},
    attack_parameters =
    {
      type = "projectile",
      damage_modifier = 1000000,
      range = 0.5,
      cooldown = 35,
      ammo_category = "melee",
      ammo_type =
      {
        action = {
          action_delivery = {
            target_effects = {
              damage = {
                amount = 7,
                type = "physical"
              },
              type = "damage",
              show_in_tooltip = false
            },
            type = "instant"
          },
          type = "direct"
        },
        category = "melee",
        target_type = "entity"
      },
      animation =
      {
        layers =
        {
          compilatron_animations.walk_shadow,
          compilatron_animations.walk
        }
      }
    },
    vision_distance = 30,
    movement_speed = 0.2,
    distance_per_frame = 0.1,
    pollution_to_join_attack = 1,
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    corpse = "small-biter-corpse",
    dying_explosion = "blood-explosion-small",
    run_animation =
    {
      layers =
      {
        compilatron_animations.walk_shadow,
        compilatron_animations.walk
      }
    }
  },
  {
    type = "lab",
    name = "lab",
    icon = "__base__/graphics/icons/lab.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "lab"},
    max_health = 150,
    corpse = "lab-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    light = {intensity = 0.75, size = 8, color = {r = 1.0, g = 1.0, b = 1.0}},
    on_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/lab/lab.png",
          width = 98,
          height = 87,
          frame_count = 33,
          line_length = 11,
          animation_speed = 1 / 3,
          shift = util.by_pixel(0, 1.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab.png",
            width = 194,
            height = 174,
            frame_count = 33,
            line_length = 11,
            animation_speed = 1 / 3,
            shift = util.by_pixel(0, 1.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/lab/lab-integration.png",
          width = 122,
          height = 81,
          frame_count = 1,
          line_length = 1,
          repeat_count = 33,
          animation_speed = 1 / 3,
          shift = util.by_pixel(0, 15.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab-integration.png",
            width = 242,
            height = 162,
            frame_count = 1,
            line_length = 1,
            repeat_count = 33,
            animation_speed = 1 / 3,
            shift = util.by_pixel(0, 15.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/lab/lab-shadow.png",
          width = 122,
          height = 68,
          frame_count = 1,
          line_length = 1,
          repeat_count = 33,
          animation_speed = 1 / 3,
          shift = util.by_pixel(13, 11),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab-shadow.png",
            width = 242,
            height = 136,
            frame_count = 1,
            line_length = 1,
            repeat_count = 33,
            animation_speed = 1 / 3,
            shift = util.by_pixel(13, 11),
            scale = 0.5,
            draw_as_shadow = true
          }
        }
      }
    },
    off_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/lab/lab.png",
          width = 98,
          height = 87,
          frame_count = 1,
          shift = util.by_pixel(0, 1.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab.png",
            width = 194,
            height = 174,
            frame_count = 1,
            shift = util.by_pixel(0, 1.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/lab/lab-integration.png",
          width = 122,
          height = 81,
          frame_count = 1,
          shift = util.by_pixel(0, 15.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab-integration.png",
            width = 242,
            height = 162,
            frame_count = 1,
            shift = util.by_pixel(0, 15.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/lab/lab-shadow.png",
          width = 122,
          height = 68,
          frame_count = 1,
          shift = util.by_pixel(13, 11),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab-shadow.png",
            width = 242,
            height = 136,
            frame_count = 1,
            shift = util.by_pixel(13, 11),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7
      },
      apparent_volume = 1
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "60kW",
    researching_speed = 1,
    inputs = lab_inputs,
    module_specification =
    {
      module_slots = 2,
      module_info_icon_shift = {0, 0.9}
    }
  },
  {
    type = "highlight-box",
    name = "highlight-box"
  },
  {
    type = "simple-entity",
    name = "mineable-wreckage",
    icon = "__base__/graphics/icons/ship-wreck/small-ship-wreck.png",
    icon_size = 32,
    minable = {mining_time = 0.5, result = "iron-gear-wheel"},
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    subgroup = "wrecks",
    order = "d[remnants]-d[ship-wreck]-c[small]-a",
    max_health = 200,
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1.3, -1.1}, {1.3, 1.1}},
    pictures =
    {
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-a.png",
        width = 65,
        height= 68
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-b.png",
        width = 109,
        height= 67
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-c.png",
        width = 63,
        height= 54
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-d.png",
        width = 82,
        height= 67
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-e.png",
        width = 78,
        height= 75,
        shift={0.3, -0.2}
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-f.png",
        width = 58,
        height= 35
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-g.png",
        width = 80,
        height= 72
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-h.png",
        width = 79,
        height= 54
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-i.png",
        width = 56,
        height= 55
      }
    },
    render_layer = "object"
  },
  {
    type = "container",
    name = "compilatron-chest",
    icon = "__base__/graphics/icons/compilatron-chest.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "compilatron-chest"},
    max_health = 100,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    fast_replaceable_group = "container",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    inventory_size = 32,
    open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" },
    close_sound = { filename = "__base__/sound/wooden-chest-close.ogg" },
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/compilatron-chest/compilatron-chest.png",
          priority = "extra-high",
          width = 34,
          height = 40,
          shift = util.by_pixel(0, -3),
          hr_version =
          {
            filename = "__base__/graphics/entity/compilatron-chest/hr-compilatron-chest.png",
            priority = "extra-high",
            width = 68,
            height = 79,
            shift = util.by_pixel(0, -3),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/compilatron-chest/compilatron-chest-shadow.png",
          priority = "extra-high",
          width = 57,
          height = 21,
          shift = util.by_pixel(12, 6),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/compilatron-chest/hr-compilatron-chest-shadow.png",
            priority = "extra-high",
            width = 114,
            height = 41,
            shift = util.by_pixel(12, 6),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "flying-text",
    name = "tree-proxy",
    icon = "__base__/graphics/icons/tree-01.png",
    icon_size = 32,
    flags = {"hidden"},
    time_to_live = 150,
    speed = 0.05
  },
  {
    type = "flying-text",
    name = "tree-dying-proxy",
    icons =
    {
      {
       icon = "__base__/graphics/icons/tree-01.png",
       icon_size = 32
      },
      {
        icon = "__core__/graphics/cancel.png",
        icon_size = 64
      }
    },
    icon_size = 32,
    flags = {"hidden"},
    time_to_live = 150,
    speed = 0.05
  },
  {
    type = "flying-text",
    name = "tile-proxy",
    icon = "__base__/graphics/icons/landfill.png",
    icon_size = 32,
    flags = {"hidden"},
    time_to_live = 150,
    speed = 0.05
  },
  {
    type = "splitter",
    name = "splitter",
    icon = "__base__/graphics/icons/splitter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "splitter"},
    max_health = 170,
    corpse = "splitter-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 0.7,
    structure_animation_movement_cooldown = 10,
    fast_replaceable_group = "transport-belt",
    next_upgrade = "fast-splitter",
    speed = 0.03125,
    belt_animation_set = basic_belt_animation_set,
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/splitter/splitter-north.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 82,
        height = 36,
        shift = util.by_pixel(6, 0),
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-north.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 160,
          height = 70,
          shift = util.by_pixel(7, 0),
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/splitter/splitter-east.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 46,
        height = 80,
        shift = util.by_pixel(4, -6),
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-east.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 160,
          shift = util.by_pixel(4, -6),
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/splitter/splitter-south.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 82,
        height = 32,
        shift = util.by_pixel(4, 0),
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-south.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 164,
          height = 64,
          shift = util.by_pixel(4, 0),
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/splitter/splitter-west.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 46,
        height = 76,
        shift = util.by_pixel(6, -4),
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-west.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 150,
          shift = util.by_pixel(6, -4),
          scale = 0.5
        }
      }
    }
  },
  {
    type = "underground-belt",
    name = "underground-belt",
    icon = "__base__/graphics/icons/underground-belt.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "underground-belt"},
    max_health = 150,
    corpse = "underground-belt-remnants",
    max_distance = 5,
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    underground_remove_belts_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines-remove.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
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
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 32,
    belt_animation_set = basic_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    next_upgrade = "fast-underground-belt",
    speed = 0.03125,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          y = 96,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height =192,
            y = 192,
            scale = 0.5
          }
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            scale = 0.5
          }

        }

      },
      direction_in_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          y = 96*3,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192*3,
            scale = 0.5
          }
        }
      },
      direction_out_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          y = 96*2,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y= 192*2,
            scale = 0.5
          },

        }

      },
      back_patch =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure-back-patch.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure-back-patch.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            scale = 0.5
          }

        }
      },
      front_patch =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure-front-patch.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure-front-patch.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            scale = 0.5
          }

        }
      }
    }
  },
  {
    type = "loader",
    name = "loader",
    icon = "__base__/graphics/icons/loader.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {mining_time = 0.1, result = "loader"},
    max_health = 170,
    filter_count = 5,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.9}, {0.4, 0.9}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    animation_speed_coefficient = 32,
    belt_animation_set = basic_belt_animation_set,
    fast_replaceable_group = "loader",
    speed = 0.03125,
    structure_render_layer = "lower-object",
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          y = 64
        }
      }
    }
  },
  {
    type = "car",
    name = "car",
    icon = "__base__/graphics/icons/car.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"},
    minable = {mining_time = 0.4, result = "car"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 450,
    corpse = "car-remnants",
    dying_explosion = "medium-explosion",
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
      },
    },
    collision_box = {{-0.7, -1}, {0.7, 1}},
    selection_box = {{-0.7, -1}, {0.7, 1}},
    effectivity = 0.6,
    braking_power = "200kW",

    burner =
    {
      fuel_category = "chemical",
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
        color = {r = 0.92, g = 0.77, b = 0.3}
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
        color = {r = 0.92, g = 0.77, b = 0.3}
      }
    },
    render_layer = "object",
    animation =
    {
      layers =
      {
        {
          priority = "low",
          width = 102,
          height = 86,
          frame_count = 2,
          direction_count = 64,
          shift = {0, -0.1875},
          animation_speed = 8,
          max_advance = 0.2,
          stripes =
          {
            {
             filename = "__base__/graphics/entity/car/car-1.png",
             width_in_frames = 2,
             height_in_frames = 22
            },
            {
             filename = "__base__/graphics/entity/car/car-2.png",
             width_in_frames = 2,
             height_in_frames = 22
            },
            {
             filename = "__base__/graphics/entity/car/car-3.png",
             width_in_frames = 2,
             height_in_frames = 20
            }
          },
          hr_version =
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
                filename = "__base__/graphics/entity/car/hr-car-1.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-2.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-3.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-4.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-5.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-6.png",
                width_in_frames = 2,
                height_in_frames = 9
              }
            }
          }
        },
        {
          priority = "low",
          width = 100,
          height = 75,
          frame_count = 2,
          apply_runtime_tint = true,
          direction_count = 64,
          max_advance = 0.2,
          line_length = 2,
          shift = {0, -0.171875},
          stripes = util.multiplystripes(2,
          {
            {
              filename = "__base__/graphics/entity/car/car-mask-1.png",
              width_in_frames = 1,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/car/car-mask-2.png",
              width_in_frames = 1,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/car/car-mask-3.png",
              width_in_frames = 1,
              height_in_frames = 20
            }
          }),
          hr_version =
          {
            priority = "low",
            width = 199,
            height = 147,
            frame_count = 2,
            apply_runtime_tint = true,
            scale = 0.5,
            axially_symmetrical = false,
            direction_count = 64,
            max_advance = 0.2,
            shift = util.by_pixel(0+2, -11+8.5),
            line_length = 1,
            stripes = util.multiplystripes(2,
            {
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-1.png",
                width_in_frames = 1,
                height_in_frames = 13
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-2.png",
                width_in_frames = 1,
                height_in_frames = 13
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-3.png",
                width_in_frames = 1,
                height_in_frames = 13
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-4.png",
                width_in_frames = 1,
                height_in_frames = 13
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-5.png",
                width_in_frames = 1,
                height_in_frames = 12
              }
            })
          }
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
          filename = "__base__/graphics/entity/car/car-turret.png",
          priority = "low",
          line_length = 8,
          width = 36,
          height = 29,
          frame_count = 1,
          direction_count = 64,
          shift = {0.03125, -0.890625},
          animation_speed = 8,
          hr_version =
          {
            priority = "low",
            width = 71,
            height = 57,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 64,
            shift = util.by_pixel(0+2, -33.5+8.5),
            animation_speed = 8,
            scale = 0.5,
            stripes =
            {
              {
                filename = "__base__/graphics/entity/car/hr-car-turret-1.png",
                width_in_frames = 1,
                height_in_frames = 32
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-turret-2.png",
                width_in_frames = 1,
                height_in_frames = 32
              }
            }
          }
        },
        {
          filename = "__base__/graphics/entity/car/car-turret-shadow.png",
          priority = "low",
          line_length = 8,
          width = 46,
          height = 31,
          frame_count = 1,
          draw_as_shadow = true,
          direction_count = 64,
          shift = {0.875, 0.359375}
        }
      }
    },
    turret_rotation_speed = 0.35 / 60,
    sound_no_fuel =
    {
      {
        filename = "__base__/sound/fight/car-no-fuel-1.ogg",
        volume = 0.6
      }
    },
    stop_trigger_speed = 0.2,
    stop_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/car-breaks.ogg",
            volume = 0.6
          }
        }
      }
    },
    sound_minimum_speed = 0.2;
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/car-engine.ogg",
        volume = 0.6
      },
      activate_sound =
      {
        filename = "__base__/sound/car-engine-start.ogg",
        volume = 0.6
      },
      deactivate_sound =
      {
        filename = "__base__/sound/car-engine-stop.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    rotation_speed = 0.015,
    weight = 700,
    guns = { "vehicle-machine-gun" },
    inventory_size = 80
  },
  {
    type = "furnace",
    name = "electric-furnace",
    icon = "__base__/graphics/icons/electric-furnace.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "electric-furnace"},
    max_health = 350,
    corpse = "electric-furnace-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    module_specification =
    {
      module_slots = 2,
      module_info_icon_shift = {0, 0.8}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    crafting_speed = 2,
    energy_usage = "180kW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 1
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-furnace.ogg",
        volume = 0.7
      },
      apparent_volume = 1.5
    },
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-base.png",
          priority = "high",
          width = 129,
          height = 100,
          frame_count = 1,
          shift = {0.421875, 0},
          hr_version =
          {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace.png",
            priority = "high",
            width = 239,
            height = 219,
            frame_count = 1,
            shift = util.by_pixel(0.75, 5.75),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png",
          priority = "high",
          width = 129,
          height = 100,
          frame_count = 1,
          shift = {0.421875, 0},
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-shadow.png",
            priority = "high",
            width = 227,
            height = 171,
            frame_count = 1,
            draw_as_shadow = true,
            shift = util.by_pixel(11.25, 7.75),
            scale = 0.5
          }
        }
      }
    },
    working_visualisations =
    {
      {
        animation =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-heater.png",
          priority = "high",
          width = 25,
          height = 15,
          frame_count = 12,
          animation_speed = 0.5,
          shift = {0.015625, 0.890625},
          hr_version =
          {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-heater.png",
            priority = "high",
            width = 60,
            height = 56,
            frame_count = 12,
            animation_speed = 0.5,
            shift = util.by_pixel(1.75, 32.75),
            scale = 0.5
          }
        },
        light = {intensity = 0.4, size = 6, shift = {0.0, 1.0}, color = {r = 1.0, g = 1.0, b = 1.0}}
      },
      {
        animation =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-1.png",
          priority = "high",
          width = 19,
          height = 13,
          frame_count = 4,
          animation_speed = 0.5,
          shift = {-0.671875, -0.640625},
          hr_version =
          {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-propeller-1.png",
            priority = "high",
            width = 37,
            height = 25,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(-20.5, -18.5),
            scale = 0.5
          }
        }
      },
      {
        animation =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-2.png",
          priority = "high",
          width = 12,
          height = 9,
          frame_count = 4,
          animation_speed = 0.5,
          shift = {0.0625, -1.234375},
          hr_version =
          {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-propeller-2.png",
            priority = "high",
            width = 23,
            height = 15,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(3.5, -38),
            scale = 0.5
          }
        }
      }
    },
    fast_replaceable_group = "furnace"
  },

  {
    type = "roboport",
    name = "compi-roboport",
    order="compi-roboport",
    icon = "__base__/graphics/icons/roboport.png",
    icon_size = 32,
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    collision_mask = {},
    energy_source = { type = "void" },
    recharge_minimum = "40MJ",
    energy_usage = "50kW",
    -- per one charge slot
    charging_energy = "1000kW",
    logistics_radius = 25,
    construction_radius = 55,
    charge_approach_distance = 5,
    robot_slots_count = 7,
    material_slots_count = 7,
    stationing_offset = {0, 0},
    charging_offsets =
    {
      {-1.5, -0.5}, {1.5, -0.5}, {1.5, 1.5}, {-1.5, 1.5}
    },
    base =
    {
      layers =
      {
        {
          filename = "__core__/graphics/empty.png",
          width = 1,
          height = 1,
        },
      }
    },
    base_patch =
    {
      filename = "__core__/graphics/empty.png",
      priority = "high",
      width = 1,
      height = 1,
      frame_count = 1
    },
    base_animation =
    {
      filename = "__core__/graphics/empty.png",
      priority = "high",
      width = 1,
      height = 1,
      frame_count = 1
    },
    door_animation_up =
    {
      filename = "__core__/graphics/empty.png",
      priority = "high",
      width = 1,
      height = 1,
      frame_count = 1
    },
    door_animation_down =
    {
      filename = "__core__/graphics/empty.png",
      priority = "high",
      width = 1,
      height = 1,
      frame_count = 1
    },
    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/roboport-working.ogg", volume = 0.6 },
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.5,
      probability = 1 / (5 * 60) -- average pause between the sound is 5 seconds
    },
    recharging_light = {intensity = 0.4, size = 5, color = {r = 1.0, g = 1.0, b = 1.0}},
    request_to_open_door_timeout = 15,
    spawn_and_station_height = 0.8,
    robots_shrink_when_entering_and_exiting = true,

    draw_logistic_radius_visualization = true,
    draw_construction_radius_visualization = true,

    open_door_trigger_effect =
    {
      {
        type = "play-sound",
        sound = { filename = "__base__/sound/roboport-door.ogg", volume = 1.0 }
      }
    },
    close_door_trigger_effect =
    {
      {
        type = "play-sound",
        sound = { filename = "__base__/sound/roboport-door.ogg", volume = 0.75 }
      }
    },

    circuit_wire_connection_point = circuit_connector_definitions["roboport"].points,
    circuit_connector_sprites = circuit_connector_definitions["roboport"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
    default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
    default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
    default_total_construction_output_signal = {type = "virtual", name = "signal-T"}
  },

  {
    type = "logistic-container",
    name = "compi-logistics-chest",
    icons = { {icon = "__core__/graphics/white-square.png"} },
    icon_size = 10,
    logistic_slots_count = 1,
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    collision_mask = {},
    fast_replaceable_group = "container",
    inventory_size = 48,
    logistic_mode = "storage",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    opened_duration = logistic_chest_opened_duration,
    animation =
    {
      filename = "__core__/graphics/empty.png",
      priority = "high",
      width = 1,
      height = 1,
      frame_count = 1
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },

  {
    type = "construction-robot",
    name = "construction-robot",
    icon = "__base__/graphics/icons/construction-robot.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 0.1, result = "construction-robot"},
    resistances = { { type = "fire", percent = 85 } },
    max_health = 100,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    max_payload_size = 1,
    speed = 0.06,
    max_energy = "1.5MJ",
    energy_per_tick = "0.05kJ",
    speed_multiplier_when_out_of_energy = 0.2,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    working_light = {intensity = 0.8, size = 3, color = {r = 0.8, g = 0.8, b = 0.8}},
    idle =
    {
      filename = "__base__/graphics/entity/construction-robot/construction-robot.png",
      priority = "high",
      line_length = 16,
      width = 32,
      height = 36,
      frame_count = 1,
      shift = {0, -0.15625},
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
      shift = {0, -0.15625},
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
      width = 50,
      height = 24,
      frame_count = 1,
      shift = {1.09375, 0.59375},
      direction_count = 16,
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
        scale = 0.5
      }
    },
    shadow_in_motion =
    {
      filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 50,
      height = 24,
      frame_count = 1,
      shift = {1.09375, 0.59375},
      direction_count = 16,
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
        scale = 0.5
      }
    },
    working =
    {
      filename = "__base__/graphics/entity/construction-robot/construction-robot-working.png",
      priority = "high",
      line_length = 2,
      width = 28,
      height = 36,
      frame_count = 2,
      shift = {0, -0.15625},
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
      width = 50,
      height = 24,
      frame_count = 1,
      repeat_count = 2,
      shift = {1.09375, 0.59375},
      direction_count = 16,
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
        scale = 0.5
      }
    },
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
    sparks =
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
    },
    working_sound = flying_robot_sounds(),
    cargo_centered = {0.0, 0.2},
    construction_vector = {0.30, 0.22}
  },
   {
    type = "electric-pole",
    name = "big-electric-pole",
    icon = "__base__/graphics/icons/big-electric-pole.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {mining_time = 0.1, result = "big-electric-pole"},
    max_health = 150,
    corpse = "big-electric-pole-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.65, -0.65}, {0.65, 0.65}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box = {{-1, -3}, {1, 0.5}},
    maximum_wire_distance = 30,
    supply_area_distance = 2,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole.png",
          priority = "extra-high",
          width = 76,
          height = 156,
          direction_count = 4,
          shift = util.by_pixel(1, -51),
          hr_version =
          {
            filename = "__base__/graphics/entity/big-electric-pole/hr-big-electric-pole.png",
            priority = "extra-high",
            width = 148,
            height = 312,
            direction_count = 4,
            shift = util.by_pixel(0, -51),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole-shadow.png",
          priority = "extra-high",
          width = 188,
          height = 48,
          direction_count = 4,
          shift = util.by_pixel(60, 0),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/big-electric-pole/hr-big-electric-pole-shadow.png",
            priority = "extra-high",
            width = 374,
            height = 94,
            direction_count = 4,
            shift = util.by_pixel(60, 0),
            draw_as_shadow = true,
            scale = 0.5
          }
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
    }
  },
  {
    type = "electric-pole",
    name = "medium-electric-pole",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {mining_time = 0.1, result = "medium-electric-pole"},
    max_health = 100,
    corpse = "medium-electric-pole-remnants",
    track_coverage_during_build_by_moving = true,
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
    drawing_box = {{-0.5, -2.8}, {0.5, 0.5}},
    maximum_wire_distance = 9,
    supply_area_distance = 3.5,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/medium-electric-pole/medium-electric-pole.png",
          priority = "extra-high",
          width = 40,
          height = 124,
          direction_count = 4,
          shift = util.by_pixel(4, -44),
          hr_version =
          {
            filename = "__base__/graphics/entity/medium-electric-pole/hr-medium-electric-pole.png",
            priority = "extra-high",
            width = 84,
            height = 252,
            direction_count = 4,
            shift = util.by_pixel(3.5, -44),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/medium-electric-pole/medium-electric-pole-shadow.png",
          priority = "extra-high",
          width = 140,
          height = 32,
          direction_count = 4,
          shift = util.by_pixel(56, -1),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/medium-electric-pole/hr-medium-electric-pole-shadow.png",
            priority = "extra-high",
            width = 280,
            height = 64,
            direction_count = 4,
            shift = util.by_pixel(56.5, -1),
            draw_as_shadow = true,
            scale = 0.5
          }
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
    }
  },
  {
    type = "furnace",
    name = "steel-furnace",
    icon = "__base__/graphics/icons/steel-furnace.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "steel-furnace"},
    max_health = 300,
    corpse = "steel-furnace-remnants",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/furnace.ogg" }
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
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    energy_usage = "90kW",
    crafting_speed = 2,
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      fuel_category = "chemical",
      effectivity = 1,
      emissions_per_minute = 4,
      fuel_inventory_size = 1,
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
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace.png",
          priority = "high",
          width = 85,
          height = 87,
          frame_count = 1,
          shift = util.by_pixel(-1.5, 1.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace.png",
            priority = "high",
            width = 171,
            height = 174,
            frame_count = 1,
            shift = util.by_pixel(-1.25, 2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace-shadow.png",
          priority = "high",
          width = 139,
          height = 43,
          frame_count = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(39.5, 11.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-shadow.png",
            priority = "high",
            width = 277,
            height = 85,
            frame_count = 1,
            draw_as_shadow = true,
            shift = util.by_pixel(39.25, 11.25),
            scale = 0.5
          }
        }
      }
    },
    working_visualisations =
    {
      {
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        south_position = {0.0, 0.0},
        west_position = {0.0, 0.0},
        animation =
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace-fire.png",
          priority = "high",
          line_length = 8,
          width = 29,
          height = 40,
          frame_count = 48,
          direction_count = 1,
          shift = util.by_pixel(-0.5, 6),
          hr_version =
          {
            filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-fire.png",
            priority = "high",
            line_length = 8,
            width = 57,
            height = 81,
            frame_count = 48,
            direction_count = 1,
            shift = util.by_pixel(-0.75, 5.75),
            scale = 0.5
          }
        },
        light = {intensity = 1, size = 1, color = {r = 1.0, g = 1.0, b = 1.0}}
      },
      {
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        south_position = {0.0, 0.0},
        west_position = {0.0, 0.0},
        effect = "flicker", -- changes alpha based on energy source light intensity
        animation =
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace-glow.png",
          priority = "high",
          width = 60,
          height = 43,
          frame_count = 1,
          shift = {0.03125, 0.640625},
          blend_mode = "additive"
        }
      },
      {
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        south_position = {0.0, 0.0},
        west_position = {0.0, 0.0},
        effect = "flicker", -- changes alpha based on energy source light intensity
        animation =
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace-working.png",
          priority = "high",
          line_length = 8,
          width = 64,
          height = 75,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(0, -4.5),
          blend_mode = "additive",
          hr_version =
          {
            filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-working.png",
            priority = "high",
            line_length = 8,
            width = 130,
            height = 149,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(0, -4.25),
            blend_mode = "additive",
            scale = 0.5
          }
        }
      }
    },
    fast_replaceable_group = "furnace"
  },

   {
    type = "gate",
    name = "gate",
    icon = "__base__/graphics/icons/gate.png",
    icon_size = 32,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    fast_replaceable_group = "wall",
    minable = {mining_time = 0.1, result = "gate"},
    max_health = 350,
    corpse = "gate-remnants",
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
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
          width = 38,
          height = 62,
          frame_count = 16,
          shift = util.by_pixel(0, -14),
          hr_version =
          {
            filename = "__base__/graphics/entity/gate/hr-gate-vertical.png",
            line_length = 8,
            width = 78,
            height = 120,
            frame_count = 16,
            shift = util.by_pixel(-1, -13),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/gate/gate-vertical-shadow.png",
          line_length = 8,
          width = 40,
          height = 54,
          frame_count = 16,
          shift = util.by_pixel(10, 8),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/gate/hr-gate-vertical-shadow.png",
            line_length = 8,
            width = 82,
            height = 104,
            frame_count = 16,
            shift = util.by_pixel(9, 9),
            draw_as_shadow = true,
            scale = 0.5
          }
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
          width = 34,
          height = 48,
          frame_count = 16,
          shift = util.by_pixel(0, -4),
          hr_version =
          {
            filename = "__base__/graphics/entity/gate/hr-gate-horizontal.png",
            line_length = 8,
            width = 66,
            height = 90,
            frame_count = 16,
            shift = util.by_pixel(0, -3),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/gate/gate-horizontal-shadow.png",
          line_length = 8,
          width = 62,
          height = 30,
          frame_count = 16,
          shift = util.by_pixel(12, 10),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/gate/hr-gate-horizontal-shadow.png",
            line_length = 8,
            width = 122,
            height = 60,
            frame_count = 16,
            shift = util.by_pixel(12, 10),
            draw_as_shadow = true,
            scale = 0.5
          }
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
          width = 34,
          height = 40,
          frame_count = 16,
          shift = util.by_pixel(0, -8),
          hr_version =
          {
            filename = "__base__/graphics/entity/gate/hr-gate-rail-horizontal-left.png",
            line_length = 8,
            width = 66,
            height = 74,
            frame_count = 16,
            shift = util.by_pixel(0, -7),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/gate/gate-rail-horizontal-shadow-left.png",
          line_length = 8,
          width = 62,
          height = 30,
          frame_count = 16,
          shift = util.by_pixel(12, 10),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/gate/hr-gate-rail-horizontal-shadow-left.png",
            line_length = 8,
            width = 122,
            height = 60,
            frame_count = 16,
            shift = util.by_pixel(12, 10),
            draw_as_shadow = true,
            scale = 0.5
          }
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
          width = 34,
          height = 40,
          frame_count = 16,
          shift = util.by_pixel(0, -8),
          hr_version =
          {
            filename = "__base__/graphics/entity/gate/hr-gate-rail-horizontal-right.png",
            line_length = 8,
            width = 66,
            height = 74,
            frame_count = 16,
            shift = util.by_pixel(0, -7),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/gate/gate-rail-horizontal-shadow-right.png",
          line_length = 8,
          width = 62,
          height = 30,
          frame_count = 16,
          shift = util.by_pixel(12, 10),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/gate/hr-gate-rail-horizontal-shadow-right.png",
            line_length = 8,
            width = 122,
            height = 58,
            frame_count = 16,
            shift = util.by_pixel(12, 11),
            draw_as_shadow = true,
            scale = 0.5
          }
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
          width = 22,
          height = 62,
          frame_count = 16,
          shift = util.by_pixel(0, -14),
          hr_version =
          {
            filename = "__base__/graphics/entity/gate/hr-gate-rail-vertical-left.png",
            line_length = 8,
            width = 42,
            height = 118,
            frame_count = 16,
            shift = util.by_pixel(0, -13),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/gate/gate-rail-vertical-shadow-left.png",
          line_length = 8,
          width = 44,
          height = 54,
          frame_count = 16,
          shift = util.by_pixel(8, 8),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/gate/hr-gate-rail-vertical-shadow-left.png",
            line_length = 8,
            width = 82,
            height = 104,
            frame_count = 16,
            shift = util.by_pixel(9, 9),
            draw_as_shadow = true,
            scale = 0.5
          }
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
          width = 22,
          height = 62,
          frame_count = 16,
          shift = util.by_pixel(0, -14),
          hr_version =
          {
            filename = "__base__/graphics/entity/gate/hr-gate-rail-vertical-right.png",
            line_length = 8,
            width = 42,
            height = 118,
            frame_count = 16,
            shift = util.by_pixel(0, -13),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/gate/gate-rail-vertical-shadow-right.png",
          line_length = 8,
          width = 44,
          height = 54,
          frame_count = 16,
          shift = util.by_pixel(8, 8),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/gate/hr-gate-rail-vertical-shadow-right.png",
            line_length = 8,
            width = 82,
            height = 104,
            frame_count = 16,
            shift = util.by_pixel(9, 9),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    vertical_rail_base =
    {
      filename = "__base__/graphics/entity/gate/gate-rail-base-vertical.png",
      line_length = 8,
      width = 68,
      height = 66,
      frame_count = 16,
      shift = util.by_pixel(0, 0),
      hr_version =
      {
        filename = "__base__/graphics/entity/gate/hr-gate-rail-base-vertical.png",
        line_length = 8,
        width = 138,
        height = 130,
        frame_count = 16,
        shift = util.by_pixel(-1, 0),
        scale = 0.5
      }
    },
    horizontal_rail_base =
    {
      filename = "__base__/graphics/entity/gate/gate-rail-base-horizontal.png",
      line_length = 8,
      width = 66,
      height = 54,
      frame_count = 16,
      shift = util.by_pixel(0, 2),
      hr_version =
      {
        filename = "__base__/graphics/entity/gate/hr-gate-rail-base-horizontal.png",
        line_length = 8,
        width = 130,
        height = 104,
        frame_count = 16,
        shift = util.by_pixel(0, 3),
        scale = 0.5
      }
    },
    wall_patch =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/gate-wall-patch.png",
          line_length = 8,
          width = 34,
          height = 48,
          frame_count = 16,
          shift = util.by_pixel(0, 12),
          hr_version =
          {
            filename = "__base__/graphics/entity/gate/hr-gate-wall-patch.png",
            line_length = 8,
            width = 70,
            height = 94,
            frame_count = 16,
            shift = util.by_pixel(-1, 13),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/gate/gate-wall-patch-shadow.png",
          line_length = 8,
          width = 44,
          height = 38,
          frame_count = 16,
          shift = util.by_pixel(8, 32),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/gate/hr-gate-wall-patch-shadow.png",
            line_length = 8,
            width = 82,
            height = 72,
            frame_count = 16,
            shift = util.by_pixel(9, 33),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },

    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    open_sound =
    {
      variations = { filename = "__base__/sound/gate1.ogg", volume = 0.5 },
      aggregation =
      {
        max_count = 1,
        remove = true
      }
    },
    close_sound =
    {
      variations = { filename = "__base__/sound/gate1.ogg", volume = 0.5 },
      aggregation =
      {
        max_count = 1,
        remove = true
      }
    }
  },
}
)

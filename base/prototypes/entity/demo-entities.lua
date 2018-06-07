require ("prototypes.entity.demo-rail-pictures")
require ("prototypes.entity.demo-pipecovers")
require ("prototypes.entity.demo-transport-belt-pictures")
require ("circuit-connector-sprites")
require ("prototypes.entity.demo-player-animations")

local function scale_bounding_box(bb, scale)
  local orientation = bb[3] or 0
  return {
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
    table.insert(pictures, {
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
  return {
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
  return {
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
    orientations =
    {
      -- Since removing a cliff also causes neighboring cliffs to be removed,
      -- we'll think of it (for purposes of fill volume) as filling two sections centered on the ends of this segment.
      -- That way you can't "cheat" by filling every other cliff segment -- the numbers should work out the same.
      west_to_east   = cliff_orientation("sides"   , 0, 2, 8, {{-2.0, -1.5}, {2.0,  1.5}}, scale, fill_volume*2),
      north_to_south = cliff_orientation("sides"   , 0, 3, 8, {{-1.0, -2.0}, {1.0,  2.0}}, scale, fill_volume*2),
      east_to_west   = cliff_orientation("sides"   , 0, 0, 8, {{-2.0, -0.5}, {2.0,  0.5}}, scale, fill_volume*2),
      south_to_north = cliff_orientation("sides"   , 0, 1, 8, {{-1.0, -2.0}, {1.0,  2.0}}, scale, fill_volume*2),
      west_to_north  = cliff_orientation("outer"   , 0, 3, 8, rotbb(-5/4, -3/4, dq(6), dq(3), 7/8), scale, fill_volume*2),
      north_to_east  = cliff_orientation("outer"   , 0, 0, 8, rotbb( 5/4, -3/4, dq(6), dq(3), 1/8), scale, fill_volume*2),
      east_to_south  = cliff_orientation("outer"   , 0, 1, 8, rotbb( 3/4,  5/4, dq(5), dq(2), 7/8), scale, fill_volume*2),
      south_to_west  = cliff_orientation("outer"   , 0, 2, 8, rotbb(-3/4,  5/4, dq(5), dq(2), 1/8), scale, fill_volume*2),
      west_to_south  = cliff_orientation("inner"   , 0, 0, 8, rotbb(-5/4,  3/4, dq(6), dq(3), 1/8), scale, fill_volume*2),
      north_to_west  = cliff_orientation("inner"   , 0, 1, 8, rotbb(-3/4, -5/4, dq(5), dq(2), 7/8), scale, fill_volume*2),
      east_to_north  = cliff_orientation("inner"   , 0, 2, 8, rotbb( 3/4, -5/4, dq(5), dq(2), 1/8), scale, fill_volume*2),
      south_to_east  = cliff_orientation("inner"   , 0, 3, 8, rotbb( 5/4,  3/4, dq(6), dq(3), 7/8), scale, fill_volume*2),
      west_to_none   = cliff_orientation("entrance", 2, 0, 2, {{-2.0, -1.5}, {0.0,  1.5}}, scale, fill_volume),
      none_to_east   = cliff_orientation("entrance", 0, 0, 2, {{ 0.0, -1.5}, {2.0,  1.5}}, scale, fill_volume),
      north_to_none  = cliff_orientation("entrance", 2, 3, 2, {{-1.0, -2.0}, {1.0, -0.5}}, scale, fill_volume),
      none_to_south  = cliff_orientation("entrance", 0, 3, 2, {{-1.0,  0.5}, {1.0,  2.0}}, scale, fill_volume),
      east_to_none   = cliff_orientation("entrance", 2, 2, 2, {{ 0.0, -0.5}, {2.0,  0.5}}, scale, fill_volume),
      none_to_west   = cliff_orientation("entrance", 0, 2, 2, {{-2.0, -0.5}, {0.0,  0.5}}, scale, fill_volume),
      south_to_none  = cliff_orientation("entrance", 2, 1, 2, {{-1.0,  0.5}, {1.0,  2.0}}, scale, fill_volume),
      none_to_north  = cliff_orientation("entrance", 0, 1, 2, {{-1.0, -2.0}, {1.0, -0.5}}, scale, fill_volume)
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
  return {
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
  return {
    type = "trivial-smoke",
    name = opts.name,
    flags = {"not-on-map"},
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
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png",
      flags = { "smoke" }
    }
  }
end


data:extend(
{
  {
    type = "character-corpse",
    name = "character-corpse",
    icon = "__base__/graphics/icons/player.png",
    icon_size = 32,
    minable = {mining_time = 5},
    time_to_live = 15 * 60 * 60, -- 15 minutes
    selection_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_priority = 100, -- 0-255 value with 255 being on-top of everything else
    pictures =
    {
      {
        layers =
        {
          playeranimations.level1.dead,
          playeranimations.level1.dead_mask,
          playeranimations.level1.dead_shadow
        }
      },
      {
        layers =
        {
          playeranimations.level1.dead,
          playeranimations.level1.dead_mask,
          playeranimations.level2addon.dead,
          playeranimations.level2addon.dead_mask,
          playeranimations.level1.dead_shadow
        }
      },
      {
        layers =
        {
          playeranimations.level1.dead,
          playeranimations.level1.dead_mask,
          playeranimations.level3addon.dead,
          playeranimations.level3addon.dead_mask,
          playeranimations.level1.dead_shadow
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
    type = "player",
    name = "player",
    icon = "__base__/graphics/icons/player.png",
    icon_size = 32,
    flags = {"placeable-off-grid", "breaths-air", "not-repairable", "not-on-map", "not-flammable"},
    max_health = 250,
    alert_when_damaged = false,
    healing_per_tick = 0.15,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.4, -1.4}, {0.4, 0.2}},
    sticker_box = {{-0.2, -1}, {0.2, 0}},
    crafting_categories = {"crafting"},
    mining_categories = {"basic-solid"},
    character_corpse = "character-corpse",
    inventory_size = 60,
    build_distance = 6,
    drop_item_distance = 6,
    reach_distance = 6,
    item_pickup_distance = 1,
    loot_pickup_distance = 2,
    enter_vehicle_distance = 3,
    reach_resource_distance = 2.7,
    ticks_to_keep_gun = 600,
    ticks_to_keep_aiming_direction = 100,
    --ticks you need to wait after firing a weapon or taking damate to get out of combat and get healed
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

    animations =
    {
      {
        idle =
        {
          layers =
          {
            playeranimations.level1.idle,
            playeranimations.level1.idle_mask,
            playeranimations.level1.idle_shadow
          }
        },
        idle_with_gun =
        {
          layers =
          {
            playeranimations.level1.idle_gun,
            playeranimations.level1.idle_gun_mask,
            playeranimations.level1.idle_gun_shadow
          }
        },
        mining_with_hands =
        {
          layers =
          {
            playeranimations.level1.mining_hands,
            playeranimations.level1.mining_hands_mask,
            playeranimations.level1.mining_hands_shadow
          }
        },
        mining_with_tool =
        {
          layers =
          {
            playeranimations.level1.mining_tool,
            playeranimations.level1.mining_tool_mask,
            playeranimations.level1.mining_tool_shadow
          }
        },
        running_with_gun =
        {
          layers =
          {
            playeranimations.level1.running_gun,
            playeranimations.level1.running_gun_mask,
            playeranimations.level1.running_gun_shadow
          }
        },
        running =
        {
          layers =
          {
            playeranimations.level1.running,
            playeranimations.level1.running_mask,
            playeranimations.level1.running_shadow
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
            playeranimations.level1.idle,
            playeranimations.level1.idle_mask,
            playeranimations.level2addon.idle,
            playeranimations.level2addon.idle_mask,
            playeranimations.level1.idle_shadow
          }
        },
        idle_with_gun =
        {
          layers =
          {
            playeranimations.level1.idle_gun,
            playeranimations.level1.idle_gun_mask,
            playeranimations.level2addon.idle_gun,
            playeranimations.level2addon.idle_gun_mask,
            playeranimations.level1.idle_gun_shadow
          }
        },
        mining_with_hands =
        {
          layers =
          {
            playeranimations.level1.mining_hands,
            playeranimations.level1.mining_hands_mask,
            playeranimations.level2addon.mining_hands,
            playeranimations.level2addon.mining_hands_mask,
            playeranimations.level1.mining_hands_shadow
          }
        },
        mining_with_tool =
        {
          layers =
          {
            playeranimations.level1.mining_tool,
            playeranimations.level1.mining_tool_mask,
            playeranimations.level2addon.mining_tool,
            playeranimations.level2addon.mining_tool_mask,
            playeranimations.level1.mining_tool_shadow
          }
        },
        running_with_gun =
        {
          layers =
          {
            playeranimations.level1.running_gun,
            playeranimations.level1.running_gun_mask,
            playeranimations.level2addon.running_gun,
            playeranimations.level2addon.running_gun_mask,
            playeranimations.level1.running_gun_shadow
          }
        },
        running =
        {
          layers =
          {
            playeranimations.level1.running,
            playeranimations.level1.running_mask,
            playeranimations.level2addon.running,
            playeranimations.level2addon.running_mask,
            playeranimations.level1.running_shadow
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
            playeranimations.level1.idle,
            playeranimations.level1.idle_mask,
            playeranimations.level3addon.idle,
            playeranimations.level3addon.idle_mask,
            playeranimations.level1.idle_shadow
          }
        },
        idle_with_gun =
        {
          layers =
          {
            playeranimations.level1.idle_gun,
            playeranimations.level1.idle_gun_mask,
            playeranimations.level3addon.idle_gun,
            playeranimations.level3addon.idle_gun_mask,
            playeranimations.level1.idle_gun_shadow
          }
        },
        mining_with_hands =
        {
          layers =
          {
            playeranimations.level1.mining_hands,
            playeranimations.level1.mining_hands_mask,
            playeranimations.level3addon.mining_hands,
            playeranimations.level3addon.mining_hands_mask,
            playeranimations.level1.mining_hands_shadow
          }
        },
        mining_with_tool =
        {
          layers =
          {
            playeranimations.level1.mining_tool,
            playeranimations.level1.mining_tool_mask,
            playeranimations.level3addon.mining_tool,
            playeranimations.level3addon.mining_tool_mask,
            playeranimations.level1.mining_tool_shadow
          }
        },
        running_with_gun =
        {
          layers =
          {
            playeranimations.level1.running_gun,
            playeranimations.level1.running_gun_mask,
            playeranimations.level3addon.running_gun,
            playeranimations.level3addon.running_gun_mask,
            playeranimations.level1.running_gun_shadow
          }
        },
        running =
        {
          layers =
          {
            playeranimations.level1.running,
            playeranimations.level1.running_mask,
            playeranimations.level3addon.running,
            playeranimations.level3addon.running_mask,
            playeranimations.level1.running_shadow
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
    mining_speed = 0.01,
    mining_with_hands_particles_animation_positions = {29, 63},
    mining_with_tool_particles_animation_positions = {28},
    running_sound_animation_positions = {5, 16}
  },

  {
    type = "furnace",
    name = "stone-furnace",
    icon = "__base__/graphics/icons/stone-furnace.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "stone-furnace"},
    max_health = 200,
    corpse = "medium-remnants",
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
    energy_usage = "180kW",
    crafting_speed = 1,
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      fuel_category = "chemical",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions = 0.01,
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
        shift = {0.515625, 0.0625},
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
        shift = {0.515625, 0.0625},
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
            shift = util.by_pixel(2, 5.5),
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
    fast_replaceable_group = "furnace"
  },

  {
    type = "transport-belt",
    name = "transport-belt",
    icon = "__base__/graphics/icons/transport-belt.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = "transport-belt"},
    max_health = 150,
    corpse = "small-remnants",
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
      max_sounds_per_type = 3
    },
    animation_speed_coefficient = 32,
    animations =
    {
      filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
      priority = "extra-high",
      width = 40,
      height = 40,
      frame_count = 16,
      direction_count = 12,
      hr_version =
      {
        filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
        priority = "extra-high",
        width = 80,
        height = 80,
        scale = 0.5,
        frame_count = 16,
        direction_count = 12
      }
    },
    belt_horizontal = basic_belt_horizontal,
    belt_vertical = basic_belt_vertical,
    ending_top = basic_belt_ending_top,
    ending_bottom = basic_belt_ending_bottom,
    ending_side = basic_belt_ending_side,
    starting_top = basic_belt_starting_top,
    starting_bottom = basic_belt_starting_bottom,
    starting_side = basic_belt_starting_side,
    ending_patch = ending_patch_prototype,
    fast_replaceable_group = "transport-belt",
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
    minable = {mining_time = 1, result = "raw-fish", count = 5},
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
    minable = {hardness = 0.2, mining_time = 0.5, result = "boiler"},
    max_health = 200,
    corpse = "medium-remnants",
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
      effectivity = 0.5,
      fuel_inventory_size = 1,
      emissions = 0.1 / 6.5,
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
    minable = {mining_time = 1, result = "wooden-chest"},
    max_health = 100,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    fast_replaceable_group = "container",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    inventory_size = 16,
    open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" },
    close_sound = { filename = "__base__/sound/wooden-chest-close.ogg" },
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    picture =
    {
      filename = "__base__/graphics/entity/wooden-chest/wooden-chest.png",
      priority = "extra-high",
      width = 46,
      height = 33,
      shift = {0.25, 0.015625}
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },

  {
    type = "electric-pole",
    name = "small-electric-pole",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "small-electric-pole"},
    max_health = 100,
    corpse = "small-remnants",
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
      filename = "__base__/graphics/entity/small-electric-pole/small-electric-pole.png",
      priority = "extra-high",
      width = 123,
      height = 124,
      direction_count = 4,
      shift = {1.4, -1.1}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {2.7, 0},
          red = {2.3, 0},
          green = {3.1, 0}
        },
        wire =
        {
          copper = {0, -2.7},
          red = {-0.375, -2.625},
          green = {0.40625, -2.625}
        }
      },
      {
        shadow =
        {
          copper = {2.7, -0.05},
          red = {2.2, -0.35},
          green = {3, 0.12}
        },
        wire =
        {
          copper = {-0.04, -2.8},
          red = {-0.375, -2.9375},
          green = {0.1875, -2.5625}
        }
      },
      {
        shadow =
        {
          copper = {2.5, -0.1},
          red = {2.55, -0.45},
          green = {2.5, 0.25}
        },
        wire =
        {
          copper = {-0.15625, -2.6875},
          red = {-0.0625, -2.96875},
          green = {-0.03125, -2.40625}
        }
      },
      {
        shadow =
        {
          copper = {2.30, -0.1},
          red = {2.65, -0.40},
          green = {1.75, 0.20}
        },
        wire =
        {
          copper = {-0.03125, -2.71875},
          red = {0.3125, -2.875},
          green = {-0.25, -2.5}
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
        axially_symmetrical = false,
        direction_count = 1,
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
    minable = {mining_time = 1, result = "steam-engine"},
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
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
    minable = {mining_time = 1, result = "offshore-pump"},
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
      duration = 60,
      fade_away_duration = 60
    }
  },

  {
    type = "trivial-smoke",
    name = "smoke-train-stop",
    flags = {"not-on-map"},
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
    flags = {"not-on-map"},
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
    flags = {"not-on-map"},
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
    minable = {hardness = 0.2, mining_time = 0.5, result = "inserter"},
    max_health = 150,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    energy_per_movement = 5000,
    energy_per_rotation = 5000,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.4kW"
    },
    extension_speed = 0.03,
    rotation_speed = 0.014,
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
    name = "burner-inserter",
    icon = "__base__/graphics/icons/burner-inserter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "burner-inserter"},
    max_health = 100,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    energy_per_movement = 100000,
    energy_per_rotation = 100000,
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
    rotation_speed = 0.01,
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
    minable = {hardness = 0.1, mining_time = 0.05}
  },

  {
    type = "pipe",
    name = "pipe",
    icon = "__base__/graphics/icons/pipe.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "pipe"},
    max_health = 100,
    corpse = "small-remnants",
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
    minable = {hardness = 0.2, mining_time = 0.5, result = "radar"},
    max_health = 250,
    corpse = "big-remnants",
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
      apply_projection = false,
      direction_count = 1,
      repeat_count = 64,
      line_length = 1,
      shift = util.by_pixel(1.5, 4),
      hr_version =
      {
        filename = "__base__/graphics/entity/radar/hr-radar-integration.png",
        priority = "low",
        width = 238,
        height = 216,
        apply_projection = false,
        direction_count = 1,
        repeat_count = 64,
        line_length = 1,
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
    radius_minimap_visualisation_color = { r = 0.059, g = 0.092, b = 0.235, a = 0.275 }
  },

  {
    type = "lamp",
    name = "small-lamp",
    icon = "__base__/graphics/icons/small-lamp.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "small-lamp"},
    max_health = 100,
    corpse = "small-remnants",
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
    minable = {hardness = 0.2, mining_time = 0.5, result = "pipe-to-ground"},
    max_health = 150,
    corpse = "small-remnants",
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
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      scale = 0.5
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
    minable = {hardness = 0.2, mining_time = 0.5, result = "assembling-machine-1"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
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
    crafting_categories = {"crafting"},
    crafting_speed = 0.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.05 / 1.5
    },
    energy_usage = "90kW",
    ingredient_count = 2,
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
    type = "flying-text",
    name = "flying-text",
    flags = {"not-on-map", "placeable-off-grid"},
    time_to_live = 150,
    speed = 0.05
  },
  {
    type = "flying-text",
    name = "tutorial-flying-text",
    flags = {"not-on-map"},
    time_to_live = 120,
    speed = 0.02,
    text_alignment = "center"
  },

  {
    type = "corpse",
    name = "acid-splash-purple",
    flags = {"not-on-map"},
    time_before_removed = 60 * 30,
    final_render_layer = "corpse",
    splash =
    {
      {
        filename = "__base__/graphics/entity/acid-splash-purple/splash-1.png",
        line_length = 5,
        width = 199,
        height = 159,
        frame_count = 20,
        shift = {0.484375, -0.171875}
      },
      {
        filename = "__base__/graphics/entity/acid-splash-purple/splash-2.png",
        line_length = 5,
        width = 238,
        height = 157,
        frame_count = 20,
        shift = {0.8125, -0.15625}
      },
      {
        filename = "__base__/graphics/entity/acid-splash-purple/splash-3.png",
        line_length = 5,
        width = 240,
        height = 162,
        frame_count = 20,
        shift = {0.71875, -0.09375}
      },
      {
        filename = "__base__/graphics/entity/acid-splash-purple/splash-4.png",
        line_length = 5,
        width = 241,
        height = 146,
        frame_count = 20,
        shift = {0.703125, -0.375}
      }
    },
    splash_speed = 0.03
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
      filename = "__core__/graphics/logistic-delivery.png",
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
  scaled_cliff("small-cliff", 0.5, 8),

  {
    type = "wall",
    name = "stone-wall",
    icon = "__base__/graphics/icons/stone-wall.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    minable = {mining_time = 0.5, result = "stone-wall"},
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
        type = "laser",
        percent = 70
      }
    },
    pictures =
    {
      single =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/stone-wall/wall-single.png",
            priority = "extra-high",
            width = 22,
            height = 42,
            shift = {0, -0.15625}
          },
          {
            filename = "__base__/graphics/entity/stone-wall/wall-single-shadow.png",
            priority = "extra-high",
            width = 47,
            height = 32,
            shift = {0.359375, 0.5},
            draw_as_shadow = true
          }
        }
      },
      straight_vertical =
      {
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-vertical-1.png",
              priority = "extra-high",
              width = 22,
              height = 42,
              shift = {0, -0.15625}
            },
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-vertical-shadow.png",
              priority = "extra-high",
              width = 47,
              height = 60,
              shift = {0.390625, 0.625},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-vertical-2.png",
              priority = "extra-high",
              width = 22,
              height = 42,
              shift = {0, -0.15625}
            },
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-vertical-shadow.png",
              priority = "extra-high",
              width = 47,
              height = 60,
              shift = {0.390625, 0.625},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-vertical-3.png",
              priority = "extra-high",
              width = 22,
              height = 42,
              shift = {0, -0.15625}
            },
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-vertical-shadow.png",
              priority = "extra-high",
              width = 47,
              height = 60,
              shift = {0.390625, 0.625},
              draw_as_shadow = true
            }
          }
        }
      },
      straight_horizontal =
      {
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-horizontal-1.png",
              priority = "extra-high",
              width = 32,
              height = 42,
              shift = {0, -0.15625}
            },
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-horizontal-shadow.png",
              priority = "extra-high",
              width = 59,
              height = 32,
              shift = {0.421875, 0.5},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-horizontal-2.png",
              priority = "extra-high",
              width = 32,
              height = 42,
              shift = {0, -0.15625}
            },
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-horizontal-shadow.png",
              priority = "extra-high",
              width = 59,
              height = 32,
              shift = {0.421875, 0.5},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-horizontal-3.png",
              priority = "extra-high",
              width = 32,
              height = 42,
              shift = {0, -0.15625}
            },
            {
              filename = "__base__/graphics/entity/stone-wall/wall-straight-horizontal-shadow.png",
              priority = "extra-high",
              width = 59,
              height = 32,
              shift = {0.421875, 0.5},
              draw_as_shadow = true
            }
          }
        }
      },
      corner_right_down =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/stone-wall/wall-corner-right-down.png",
            priority = "extra-high",
            width = 27,
            height = 42,
            shift = {0.078125, -0.15625}
          },
          {
            filename = "__base__/graphics/entity/stone-wall/wall-corner-right-down-shadow.png",
            priority = "extra-high",
            width = 53,
            height = 61,
            shift = {0.484375, 0.640625},
            draw_as_shadow = true
          }
        }
      },
      corner_left_down =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/stone-wall/wall-corner-left-down.png",
            priority = "extra-high",
            width = 27,
            height = 42,
            shift = {-0.078125, -0.15625}
          },
          {
            filename = "__base__/graphics/entity/stone-wall/wall-corner-left-down-shadow.png",
            priority = "extra-high",
            width = 53,
            height = 60,
            shift = {0.328125, 0.640625},
            draw_as_shadow = true
          }
        }
      },
      t_up =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/stone-wall/wall-t-down.png",
            priority = "extra-high",
            width = 32,
            height = 42,
            shift = {0, -0.15625}
          },
          {
            filename = "__base__/graphics/entity/stone-wall/wall-t-down-shadow.png",
            priority = "extra-high",
            width = 71,
            height = 61,
            shift = {0.546875, 0.640625},
            draw_as_shadow = true
          }
        }
      },
      ending_right =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/stone-wall/wall-ending-right.png",
            priority = "extra-high",
            width = 27,
            height = 42,
            shift = {0.078125, -0.15625}
          },
          {
            filename = "__base__/graphics/entity/stone-wall/wall-ending-right-shadow.png",
            priority = "extra-high",
            width = 53,
            height = 32,
            shift = {0.484375, 0.5},
            draw_as_shadow = true
          }
        }
      },
      ending_left =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/stone-wall/wall-ending-left.png",
            priority = "extra-high",
            width = 27,
            height = 42,
            shift = {-0.078125, -0.15625}
          },
          {
            filename = "__base__/graphics/entity/stone-wall/wall-ending-left-shadow.png",
            priority = "extra-high",
            width = 53,
            height = 32,
            shift = {0.328125, 0.5},
            draw_as_shadow = true
          }
        }
      },
      water_connection_patch =
      {
        sheets =
        {
          {
            filename = "__base__/graphics/entity/stone-wall/wall-patch.png",
            priority = "extra-high",
            width = 52,
            height = 68,
            shift = util.by_pixel(0, -2)
          },
          {
            filename = "__base__/graphics/entity/stone-wall/wall-patch-shadow.png",
            priority = "extra-high",
            draw_as_shadow = true,
            width = 74,
            height = 96,
            shift = util.by_pixel(6, 13)
          }
        }
      }
    },

    wall_diode_green = util.conditional_return(not data.is_demo,
        {
          filename = "__base__/graphics/entity/gate/wall-diode-green.png",
          width = 21,
          height = 22,
          shift = {0, -0.78125}
        }),
    wall_diode_green_light = util.conditional_return(not data.is_demo,
        {
          minimum_darkness = 0.3,
          color = {g=1},
          shift = {0, -0.78125},
          size = 1,
          intensity = 0.3
        }),
    wall_diode_red = util.conditional_return(not data.is_demo,
    {
      filename = "__base__/graphics/entity/gate/wall-diode-red.png",
      width = 21,
      height = 22,
      shift = {0, -0.78125}
    }),
    wall_diode_red_light = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = {0, -0.78125},
      size = 1,
      intensity = 0.3
    }),

    circuit_wire_connection_point = circuit_connector_definitions["gate"].points,
    circuit_connector_sprites = circuit_connector_definitions["gate"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    default_output_signal = data.is_demo and {type = "virtual", name = "signal-green"} or {type = "virtual", name = "signal-G"}
  },
  {
    type = "corpse",
    name = "wall-remnants",
    icon = "__base__/graphics/icons/wall-remnants.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup="remnants",
    order="d[remnants]-c[wall]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation =
    {
      {
        width = 36,
        height = 36,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/stone-wall/remains/wall-remain-01.png"
      },
      {
        width = 38,
        height = 35,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/stone-wall/remains/wall-remain-02.png"
      },
      {
        width = 35,
        height = 36,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/stone-wall/remains/wall-remain-03.png"
      },
      {
        width = 41,
        height = 36,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/stone-wall/remains/wall-remain-04.png"
      },
      {
        width = 35,
        height = 35,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/stone-wall/remains/wall-remain-05.png"
      },
      {
        width = 50,
        height = 37,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/stone-wall/remains/wall-remain-06.png"
      },
      {
        width = 54,
        height = 40,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/stone-wall/remains/wall-remain-07.png"
      },
      {
        width = 43,
        height = 45,
        frame_count = 1,
        direction_count = 1,
        filename = "__base__/graphics/entity/stone-wall/remains/wall-remain-08.png"
      }
    }
  }
}
)

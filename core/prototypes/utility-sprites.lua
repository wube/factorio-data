local function make_cursor_box(x, y, side_length, shift)
  return
  {
   sprite =
   {
     filename = "__core__/graphics/cursor-boxes.png",
     priority = "extra-high-no-scale",
     width = 64,
     height = 64,
     scale = 0.5,
     x = x,
     y = y,
     shift = (function()
              if shift then
                return {0.5 - shift[1] / 32.0, 0.5 - shift[2] / 32.0}
              else
                return {0.5, 0.5}
              end
            end)()
   },
   max_side_length = side_length
  }
end

local function make_full_cursor_box(x, y, side_length, side_height)
  return
  {
    sprite =
    {
      filename = "__core__/graphics/cursor-boxes-32x32.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      scale = 0.5,
      x = x,
      y = y,
      shift = {0, 0}
    },
    is_whole_box = true,
    side_length = side_length,
    side_height = side_height
  }
end

local function make_default_modifier_icon()
  return
  {
    filename = "__core__/graphics/bonus-icon.png",
    priority = "medium",
    width = 32,
    height = 32,
    generate_sdf = true,
    flags = {"icon"}
  }
end

local function make_side_menu_button(row, hover)
  local side_menu_icon_size = 64
  local hover_x_offset = 64 + 32
  return
  {
    filename = "__core__/graphics/side-menu-buttons.png",
    priority = "high",
    size = side_menu_icon_size,
    mipmap_count = 2,
    x = hover and hover_x_offset or 0,
    y = row * side_menu_icon_size,
    flags = {"icon"}
  }
end

local function make_side_map_menu_button(row, hover)
  local side_menu_icon_size = 64
  local hover_x_offset = 64 + 32
  return
  {
    filename = "__core__/graphics/side-map-menu-buttons.png",
    priority = "high",
    size = side_menu_icon_size,
    mipmap_count = 2,
    x = hover and hover_x_offset or 0,
    y = row * side_menu_icon_size,
    flags = {"icon"}
  }
end

data:extend(
{
  {
    type = "sprite",
    name = "tooltip-category-electricity",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-electricity.png",
    priority = "extra-high-no-scale",
    width = 32,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-equipment-grid-electricity",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-equipment-grid-electricity.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-equipment-grid",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-equipment-grid.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-placed-in-equipment-grid",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-equipment-grid.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-turret",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-turret.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-thrown",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-thrown.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-effect",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-effect.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-vehicle",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-vehicle.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-vehicle-weapons",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-vehicle-weapons.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-heat",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-heat.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-train",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-train.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-debug",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-debug.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-consumes",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-consumes.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-generates",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-generates.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "info",
    filename = "__core__/graphics/icons/mip/info-blue.png",
    priority = "extra-high-no-scale",
    width = 16,
    height = 40,
    --flags = {"no-crop", "trilinear-filtering"},
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "info_no_border",
    filename = "__core__/graphics/icons/mip/info-blue-no-border.png",
    priority = "extra-high-no-scale",
    width = 16,
    height = 16,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "restart_required",
    filename = "__core__/graphics/icons/mip/needs-restart.png",
    priority = "extra-high-no-scale",
    width = 16,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "developer",
    filename = "__core__/graphics/icons/mip/developer.png",
    priority = "extra-high-no-scale",
    width = 16,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "quantity-time",
    filename = "__core__/graphics/icons/mip/quantity-time.png",
    priority = "extra-high-no-scale",
    width = 28,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "quantity-multiplier",
    filename = "__core__/graphics/icons/mip/quantity-multiplier.png",
    priority = "extra-high-no-scale",
    width = 28,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count =2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "warning-white",
    filename = "__core__/graphics/icons/mip/warning-white.png",
    priority = "extra-high-no-scale",
    size = 32,
    scale = 0.5,
    mipmap_count = 2,
    flags = {"gui-icon"}
  },
  -- {
    -- type = "sprite",
    -- name = "quantity-multiplier",
    -- filename = "__core__/graphics/icons/mip/quantity-multiplier-red.png",
    -- priority = "extra-high-no-scale",
    -- width = 28,
    -- height = 40,
    -- flags = {"gui-icon"},
    -- mipmap_count =2,
    -- scale = 0.5
  -- },
  {
    type = "sprite",
    name = "infinity",
    filename = "__core__/graphics/icons/mip/infinity.png",
    priority = "extra-high-no-scale",
    width = 24,
    height = 32,
    --flags = {"no-crop", "icon"},
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "utility-sprites",
    name = "default",
    cursor_box =
    {
      regular =
      {
        make_full_cursor_box(0, 0, 1, 1),
        make_cursor_box(256, 0, 0.4, {1, 1}),
        make_cursor_box(192, 0, 0.7),
        make_cursor_box(128, 0, 1.05),
        make_cursor_box(64, 0, 3.5),
        make_cursor_box(0, 0, 4.0)
      },
      not_allowed =
      {
        make_full_cursor_box(64, 0, 1, 1),
        make_cursor_box(256, 64, 0.4, {1, 1}),
        make_cursor_box(192, 64, 0.7),
        make_cursor_box(128, 64, 1.05),
        make_cursor_box(64, 64, 3.5),
        make_cursor_box(0, 64, 4.0)
      },
      electricity =
      {
        make_full_cursor_box(128, 0, 1, 1),
        make_cursor_box(256, 128, 0.4, {1, 1}),
        make_cursor_box(192, 128, 0.7),
        make_cursor_box(128, 128, 1.05),
        make_cursor_box(64, 128, 3.5),
        make_cursor_box(0, 128, 4.0)
      },
      pair =
      {
        make_full_cursor_box(192, 0, 1, 1),
        make_cursor_box(256, 128, 0.4, {1, 1}),
        make_cursor_box(192, 128, 0.7),
        make_cursor_box(128, 128, 1.05),
        make_cursor_box(64, 128, 3.5),
        make_cursor_box(0, 128, 4.0)
      },
      copy =
      {
        make_full_cursor_box(192, 0, 1, 1),
        make_cursor_box(256, 192, 0.4, {1, 1}),
        make_cursor_box(192, 192, 0.7),
        make_cursor_box(128, 192, 1.05),
        make_cursor_box(64, 192, 3.5),
        make_cursor_box(0, 192, 4.0)
      },
      train_visualization =
      {
        make_full_cursor_box(256, 0, 1, 1),
        make_cursor_box(256, 256, 0.4, {1, 1}),
        make_cursor_box(192, 256, 0.7),
        make_cursor_box(128, 256, 1.05),
        make_cursor_box(64, 256, 3.5),
        make_cursor_box(0, 256, 4.0)
      },
      logistics =
      {
        make_full_cursor_box(128, 0, 1, 1),
        make_cursor_box(256, 128, 0.4, {1, 1}),
        make_cursor_box(192, 128, 0.7),
        make_cursor_box(128, 128, 1.05),
        make_cursor_box(64, 128, 3.5),
        make_cursor_box(0, 128, 4.0)
      },
      blueprint_snap_rectangle =
      {
        make_full_cursor_box(320, 0, 1, 1),
        make_cursor_box(64, 324, 1.1), -- box for size <= 1
        make_cursor_box(0, 324, 2) -- box for rest
      },
    },

    add =
    {
      filename = "__core__/graphics/add-icon.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    clone =
    {
      filename = "__core__/graphics/clone-icon.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    go_to_arrow =
    {
      filename = "__core__/graphics/goto-icon.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    play =
    {
      filename = "__core__/graphics/icons/mip/play.png",
      priority = "medium",
      width = 32,
      height = 32,
      mipmap_count = 2,
      scale = 0.5,
      flags = {"gui-icon"}
    },
    pause =
    {
      filename = "__core__/graphics/icons/mip/pause.png",
      priority = "medium",
      width = 32,
      height = 32,
      mipmap_count =2,
      flags = {"gui-icon"}
    },
    stop =
    {
      filename = "__core__/graphics/icons/mip/stop.png",
      priority = "medium",
      width = 32,
      height = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    speed_down =
    {
      filename = "__core__/graphics/icons/mip/speed-down.png",
      priority = "medium",
      width = 32,
      height = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale = 0.5
    },
    speed_up =
    {
      filename = "__core__/graphics/icons/mip/speed-up.png",
      priority = "medium",
      width = 32,
      height = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale = 0.5
    },
    editor_speed_down =
    {
      filename = "__core__/graphics/icons/mip/speed-down.png",
      priority = "medium",
      width = 32,
      height = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale = 0.5
    },
    editor_pause =
    {
      filename = "__core__/graphics/icons/mip/pause.png",
      priority = "medium",
      width = 32,
      height = 32,
      mipmap_count = 2,
      scale = 0.5,
      flags = {"gui-icon"},
    },
    editor_play =
    {
      filename = "__core__/graphics/icons/mip/play.png",
      priority = "medium",
      width = 32,
      height = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale= 0.5
    },
    editor_speed_up =
    {
      filename = "__core__/graphics/icons/mip/speed-up.png",
      priority = "medium",
      width = 32,
      height = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale = 0.5
    },
    tick_once =
    {
      filename = "__core__/graphics/icons/mip/editor-tick-once-icon.png",
      priority = "medium",
      width = 32,
      height = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale = 0.5
    },
    tick_sixty =
    {
      filename = "__core__/graphics/icons/mip/editor-tick-sixty-icon.png",
      priority = "medium",
      width = 32,
      height = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale = 0.5
    },
    tick_custom =
    {
      filename = "__core__/graphics/icons/mip/editor-tick-custom-icon.png",
      priority = "medium",
      width = 32,
      height = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale = 0.5
    },
    variations_tool_icon =
    {
      filename = "__core__/graphics/icons/mip/variations.png",
      priority = "medium",
      width = 64,
      height = 64,
      mipmap_count = 3,
      flags = {"gui-icon"},
      scale = 0.5
    },
    lua_snippet_tool_icon =
    {
      filename = "__core__/graphics/icons/mip/run-snippet-tool.png",
      priority = "medium",
      width = 64,
      height = 64,
      mipmap_count = 3,
      flags = {"gui-icon"},
      scale = 0.5
    },
    too_far =
    {
      filename = "__core__/graphics/too-far.png",
      priority = "extra-high-no-scale",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    shoot_cursor_green =
    {
      filename = "__core__/graphics/shoot-cursor-green.png",
      priority = "low",
      width = 258,
      height = 183,
      flags = {"icon"}
    },
    shoot_cursor_red =
    {
      filename = "__core__/graphics/shoot-cursor-red.png",
      priority = "low",
      width = 258,
      height = 183,
      flags = {"icon"}
    },
    electricity_icon =
    {
      filename = "__core__/graphics/icons/alerts/electricity-icon-red.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    fuel_icon =
    {
      filename = "__core__/graphics/icons/alerts/fuel-icon-red.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    ammo_icon =
    {
      filename = "__core__/graphics/icons/alerts/ammo-icon-red.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    fluid_icon =
    {
      filename = "__core__/graphics/icons/alerts/fluid-icon-red.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    warning_icon =
    {
      filename = "__core__/graphics/icons/alerts/warning-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    too_far_from_roboport_icon =
    {
      filename = "__core__/graphics/icons/alerts/too-far-from-roboport-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    danger_icon =
    {
      filename = "__core__/graphics/icons/alerts/danger-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    destroyed_icon =
    {
      filename = "__core__/graphics/icons/alerts/destroyed-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    recharge_icon =
    {
      filename = "__core__/graphics/icons/alerts/recharge-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    pump_cannot_connect_icon =
    {
      filename = "__core__/graphics/empty.png",
      priority = "extra-high-no-scale",
      width = 1,
      height = 1,
      flags = {"icon"}
    },
    not_enough_repair_packs_icon =
    {
      filename = "__core__/graphics/icons/alerts/not-enough-repair-packs-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    not_enough_construction_robots_icon =
    {
      filename = "__core__/graphics/icons/alerts/not-enough-construction-robots-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    no_building_material_icon =
    {
      filename = "__core__/graphics/icons/alerts/no-building-material-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    no_storage_space_icon =
    {
      filename = "__core__/graphics/icons/alerts/no-storage-space-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    electricity_icon_unplugged =
    {
      filename = "__core__/graphics/icons/alerts/electricity-icon-unplugged.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    game_stopped_visualization =
    {
      filename = "__core__/graphics/game-stopped-visualization.png",
      priority = "extra-high-no-scale",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    pollution_visualization =
    {
      filename = "__core__/graphics/pollution-visualization.png",
      priority = "extra-high-no-scale",
      width = 32,
      height = 32
    },
    health_bar_green_pip =
    {
      filename = "__core__/graphics/health-bar-pips.png",
      priority = "extra-high-no-scale",
      width = 7,
      height = 7
    },
    health_bar_yellow_pip =
    {
      filename = "__core__/graphics/health-bar-pips.png",
      priority = "extra-high-no-scale",
      width = 7,
      height = 7,
      x = 7
    },
    health_bar_red_pip =
    {
      filename = "__core__/graphics/health-bar-pips.png",
      priority = "extra-high-no-scale",
      width = 7,
      height = 7,
      x = 14
    },
    ghost_bar_pip =
    {
      filename = "__core__/graphics/health-bar-pips.png",
      priority = "extra-high-no-scale",
      width = 7,
      height = 7,
      x = 21
    },
    bar_gray_pip =
    {
      filename = "__core__/graphics/health-bar-pips.png",
      priority = "extra-high-no-scale",
      width = 7,
      height = 7,
      x = 28
    },
    shield_bar_pip =
    {
      filename = "__core__/graphics/health-bar-pips.png",
      priority = "extra-high-no-scale",
      width = 7,
      height = 7,
      x = 35
    },
    hand =
    {
      filename = "__core__/graphics/hand.png",
      priority = "extra-high-no-scale",
      width = 128,
      height = 128,
      mipmap_count = 3,
      flags = {"gui-icon"}
    },
    entity_info_dark_background =
    {
      filename = "__core__/graphics/entity-info-dark-background.png",
      priority = "extra-high-no-scale",
      width = 53,
      height = 53,
      flags = {"icon"}
    },
    medium_gui_arrow =
    {
      filename = "__core__/graphics/arrows/gui-arrow-medium.png",
      priority = "medium",
      width = 58,
      height = 62,
      flags = {"icon"}
    },
    small_gui_arrow =
    {
      filename = "__core__/graphics/arrows/gui-arrow-small.png",
      priority = "medium",
      width = 42,
      height = 55,
      flags = {"icon"}
    },
    light_medium =
    {
      filename = "__core__/graphics/light-medium.png",
      priority = "extra-high",
      flags = {"light"},
      width = 300,
      height = 300
    },
    light_small =
    {
      filename = "__core__/graphics/light-small.png",
      priority = "extra-high",
      flags = {"light"},
      width = 150,
      height = 150
    },
    light_cone =
    {
      filename = "__core__/graphics/light-cone.png",
      priority = "extra-high",
      flags = {"light"},
      width = 200,
      height = 200
    },
    color_effect =
    {
      filename = "__core__/graphics/color-effect-small.png",
      priority = "medium",
      width = 150,
      height = 150,
      flags = {"icon"}
    },
    clock =
    {
      filename = "__core__/graphics/clock-icon.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    default_ammo_damage_modifier_icon = make_default_modifier_icon(),
    default_gun_speed_modifier_icon = make_default_modifier_icon(),
    default_turret_attack_modifier_icon = make_default_modifier_icon(),
    inserter_stack_size_bonus_modifier_icon = make_default_modifier_icon(),
    stack_inserter_capacity_bonus_modifier_icon = make_default_modifier_icon(),
    laboratory_speed_modifier_icon = make_default_modifier_icon(),
    character_logistic_slots_modifier_icon = make_default_modifier_icon(),
    character_logistic_trash_slots_modifier_icon = make_default_modifier_icon(),
    quick_bar_count_modifier_icon = make_default_modifier_icon(),
    maximum_following_robots_count_modifier_icon = make_default_modifier_icon(),
    worker_robot_speed_modifier_icon = make_default_modifier_icon(),
    worker_robot_storage_modifier_icon = make_default_modifier_icon(),
    ghost_time_to_live_modifier_icon = make_default_modifier_icon(),
    turret_attack_modifier_icon = make_default_modifier_icon(),
    ammo_damage_modifier_icon = make_default_modifier_icon(),
    give_item_modifier_icon = make_default_modifier_icon(),
    gun_speed_modifier_icon = make_default_modifier_icon(),
    unlock_recipe_modifier_icon = make_default_modifier_icon(),
    character_crafting_speed_modifier_icon = make_default_modifier_icon(),
    character_mining_speed_modifier_icon = make_default_modifier_icon(),
    character_running_speed_modifier_icon = make_default_modifier_icon(),
    character_build_distance_modifier_icon = make_default_modifier_icon(),
    character_item_drop_distance_modifier_icon = make_default_modifier_icon(),
    character_reach_distance_modifier_icon = make_default_modifier_icon(),
    character_resource_reach_distance_modifier_icon = make_default_modifier_icon(),
    character_item_pickup_distance_modifier_icon = make_default_modifier_icon(),
    character_loot_pickup_distance_modifier_icon = make_default_modifier_icon(),
    character_inventory_slots_bonus_modifier_icon = make_default_modifier_icon(),
    deconstruction_time_to_live_modifier_icon = make_default_modifier_icon(),
    character_health_bonus_modifier_icon = make_default_modifier_icon(),
    auto_character_logistic_trash_slots_modifier_icon = make_default_modifier_icon(),
    mining_drill_productivity_bonus_modifier_icon = make_default_modifier_icon(),
    train_braking_force_bonus_modifier_icon = make_default_modifier_icon(),
    zoom_to_world_enabled_modifier_icon = make_default_modifier_icon(),
    zoom_to_world_ghost_building_enabled_modifier_icon = make_default_modifier_icon(),
    zoom_to_world_blueprint_enabled_modifier_icon = make_default_modifier_icon(),
    zoom_to_world_deconstruction_planner_enabled_modifier_icon = make_default_modifier_icon(),
    zoom_to_world_upgrade_planner_enabled_modifier_icon = make_default_modifier_icon(),
    zoom_to_world_selection_tool_enabled_modifier_icon = make_default_modifier_icon(),
    worker_robot_battery_modifier_icon = make_default_modifier_icon(),
    laboratory_productivity_modifier_icon = make_default_modifier_icon(),
    follower_robot_lifetime_modifier_icon = make_default_modifier_icon(),
    nothing_modifier_icon = make_default_modifier_icon(),
    max_failed_attempts_per_tick_per_construction_queue_modifier_icon = make_default_modifier_icon(),
    max_successful_attempts_per_tick_per_construction_queue_modifier_icon = make_default_modifier_icon(),
    artillery_range_modifier_icon = make_default_modifier_icon(),
    character_additional_mining_categories_modifier_icon = make_default_modifier_icon(),
    character_logistic_requests_modifier_icon = make_default_modifier_icon(),
    hint_arrow_up =
    {
      filename = "__core__/graphics/gui-new.png",
      priority = "extra-high-no-scale",
      x = 433,
      y = 473,
      width = 32,
      height = 24,
      scale = 0.5,
      flags = {"icon"}
    },
    hint_arrow_down =
    {
      filename = "__core__/graphics/gui-new.png",
      priority = "extra-high-no-scale",
      x = 465,
      y = 473,
      width = 32,
      height = 24,
      scale = 0.5,
      flags = {"icon"}
    },
    hint_arrow_right =
    {
      filename = "__core__/graphics/gui-new.png",
      priority = "extra-high-no-scale",
      x = 458,
      y = 441,
      width = 24,
      height = 32,
      scale = 0.5,
      flags = {"icon"}
    },
    hint_arrow_left =
    {
      filename = "__core__/graphics/gui-new.png",
      priority = "extra-high-no-scale",
      x = 433,
      y = 441,
      width = 24,
      height = 32,
      scale = 0.5,
      flags = {"icon"}
    },
    rail_path_not_possible =
    {
      filename = "__core__/graphics/rail-path-not-possible.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    slot_icon_module =
    {
      filename = "__core__/graphics/slot-icon-module.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5,
      flags = {"icon"}
    },
    slot_icon_armor =
    {
      filename = "__core__/graphics/slot-icon-armor.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5,
      flags = {"icon"}
    },
    slot_icon_gun =
    {
      filename = "__core__/graphics/slot-icon-gun.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5,
      flags = {"icon"}
    },
    slot_icon_ammo =
    {
      filename = "__core__/graphics/slot-icon-ammo.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5,
      flags = {"icon"}
    },
    slot_icon_resource =
    {
      filename = "__core__/graphics/slot-icon-resource.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    slot_icon_fuel =
    {
      filename = "__core__/graphics/slot-icon-fuel.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5,
      flags = {"icon"}
    },
    slot_icon_result =
    {
      filename = "__core__/graphics/slot-icon-result.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    slot_icon_robot =
    {
      filename = "__core__/graphics/slot-icon-robot.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5,
      flags = {"icon"}
    },
    slot_icon_robot_material =
    {
      filename = "__core__/graphics/slot-icon-robot-material.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5,
      flags = {"icon"}
    },
    slot =
    {
      filename = "__core__/graphics/slot.png",
      priority = "extra-high-no-scale",
      width = 36,
      height = 36,
      flags = {"icon"}
    },
    equipment_slot =
    {
      filename = "__core__/graphics/gui-new.png",
      priority = "medium",
      width = 80,
      height = 80,
      x = 0,
      y = 930,
      flags = {"icon"},
      scale = 0.5
    },
    equipment_collision =
    {
      filename = "__core__/graphics/gui-new.png",
      priority = "medium",
      width = 80,
      height = 80,
      x = 80,
      y = 930,
      flags = {"icon"},
      scale = 0.5
    },
    green_circle =
    {
      filename = "__core__/graphics/green-circle.png",
      priority = "medium",
      width = 25,
      height = 25,
      flags = {"icon"}
    },
    green_dot =
    {
      filename = "__core__/graphics/green-dot.png",
      priority = "medium",
      width = 1,
      height = 1
    },
    robot_slot =
    {
      filename = "__core__/graphics/robot-slot.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    set_bar_slot =
    {
      filename = "__core__/graphics/set-bar-slot.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5,
      flags = {"icon"}
    },
    missing_icon =
    {
      filename = "__core__/graphics/questionmark.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5,
      flags = {"icon"}
    },
    deconstruction_mark =
    {
      filename = "__core__/graphics/cancel.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    upgrade_mark =
    {
      filename = "__core__/graphics/upgrade.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    confirm_slot =
    {
      filename = "__core__/graphics/icons/mip/confirm.png",
      priority = "medium",
      width = 32,
      height = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale = 0.5
    },
    export_slot =
    {
      filename = "__core__/graphics/export.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    upgrade_blueprint =
    {
      filename = "__core__/graphics/icons/mip/upgrade-blueprint.png",
      priority = "medium",
      width = 32,
      height = 32,
      mipmap_count = 2,
      flags = {"icon"}
    },
    import_slot =
    {
      filename = "__core__/graphics/import.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    tile_editor_icon =
    {
      filename = "__core__/graphics/icons/category/tiles-editor.png",
      priority = "medium",
      width = 128,
      height = 128,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale = 0.5
    },
    clone_editor_icon =
    {
      filename = "__core__/graphics/clone-editor-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    scripting_editor_icon =
    {
      filename = "__core__/graphics/icons/category/scripting-editor.png",
      priority = "medium",
      width = 128,
      height = 128,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale = 0.5
    },
    decorative_editor_icon =
    {
      filename = "__core__/graphics/icons/category/decorative-editor.png",
      priority = "medium",
      width = 128,
      height = 128,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale = 0.5
    },
    resource_editor_icon =
    {
      filename = "__core__/graphics/icons/category/resource-editor.png",
      priority = "medium",
      width = 128,
      height = 128,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale = 0.5
    },
    entity_editor_icon =
    {
      filename = "__core__/graphics/entity-editor-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    item_editor_icon =
    {
      filename = "__core__/graphics/item-editor-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    cable_editor_icon =
    {
      filename = "__core__/graphics/cable-editor-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    none_editor_icon =
    {
      filename = "__core__/graphics/icons/mip/none-editor-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    force_editor_icon =
    {
      filename = "__core__/graphics/force-editor-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    surface_editor_icon =
    {
      filename = "__core__/graphics/icons/category/surface-editor.png",
      priority = "medium",
      width = 128,
      height = 128,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale = 0.5
    },
    time_editor_icon =
    {
      filename = "__core__/graphics/time-editor-icon.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    cliff_editor_icon =
    {
      filename = "__core__/graphics/icons/category/cliff-editor.png",
      priority = "medium",
      width = 128,
      height = 128,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale = 2
    },
    paint_bucket_icon =
    {
      filename = "__core__/graphics/icons/mip/paint-bucket-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      mipmap_count = 3,
      flags = {"gui-icon"},
      scale = 0.5
    },
    brush_icon =
    {
      filename = "__core__/graphics/icons/mip/brush-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      mipmap_count = 3,
      flags = {"gui-icon"},
      scale = 0.5
    },
    spray_icon =
    {
      filename = "__core__/graphics/icons/mip/spray-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      mipmap_count = 3,
      flags = {"gui-icon"},
      scale = 0.5
    },
    cursor_icon =
    {
      filename = "__core__/graphics/icons/mip/cursor-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      mipmap_count = 3,
      flags = {"gui-icon"},
      scale = 0.5
    },
    area_icon =
    {
      filename = "__core__/graphics/icons/mip/select-area.png",
      priority = "medium",
      width = 64,
      height = 64,
      mipmap_count = 3,
      flags = {"gui-icon"},
      scale = 0.5
    },
    line_icon =
    {
      filename = "__core__/graphics/icons/mip/line-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      mipmap_count = 3,
      flags = {"gui-icon"},
      scale = 0.5
    },
    editor_selection =
    {
      filename = "__core__/graphics/editor-selection.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    brush_square_shape =
    {
      filename = "__core__/graphics/icons/mip/brush-square-shape.png",
      priority = "medium",
      width = 32,
      height = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale = 0.5
    },
    brush_circle_shape =
    {
      filename = "__core__/graphics/icons/mip/brush-circle-shape.png",
      priority = "medium",
      width = 32,
      height = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      scale = 0.5
    },
    player_force_icon =
    {
      filename = "__core__/graphics/player-force-icon.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    neutral_force_icon =
    {
      filename = "__core__/graphics/treex64-provisional.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    enemy_force_icon =
    {
      filename = "__core__/graphics/enemy-force-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    nature_icon =
    {
      filename = "__core__/graphics/treex32-provisional.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    no_nature_icon =
    {
      filename = "__core__/graphics/no-nature.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    multiplayer_waiting_icon =
    {
      filename = "__core__/graphics/multiplayer-waiting-icon.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    spawn_flag =
    {
      filename = "__core__/graphics/spawn-flag.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    questionmark =
    {
      filename = "__core__/graphics/questionmark.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5,
      flags = {"icon"}
    },
    copper_wire =
    {
      filename = "__core__/graphics/copper-wire.png",
      priority = "extra-high-no-scale",
      flags = { "no-crop" },
      width = 224,
      height = 46,
      hr_version =
      {
        filename = "__core__/graphics/hr-copper-wire.png",
        priority = "extra-high-no-scale",
        flags = { "no-crop" },
        width = 448,
        height = 92,
        scale = 0.5
      }
    },
    green_wire =
    {
      filename = "__core__/graphics/green-wire.png",
      priority = "extra-high-no-scale",
      flags = { "no-crop" },
      width = 224,
      height = 46,
      hr_version =
      {
        filename = "__core__/graphics/hr-green-wire.png",
        priority = "extra-high-no-scale",
        flags = { "no-crop" },
        width = 448,
        height = 92,
        scale = 0.5
      }
    },
    red_wire =
    {
      filename = "__core__/graphics/red-wire.png",
      priority = "extra-high-no-scale",
      flags = { "no-crop" },
      width = 224,
      height = 46,
      hr_version =
      {
        filename = "__core__/graphics/hr-red-wire.png",
        priority = "extra-high-no-scale",
        flags = { "no-crop" },
        width = 448,
        height = 92,
        scale = 0.5
      }
    },
    green_wire_hightlight =
    {
      filename = "__core__/graphics/wire-highlight.png",
      priority = "extra-high-no-scale",
      flags = { "no-crop" },
      width = 224,
      height = 46,
      hr_version =
      {
        filename = "__core__/graphics/hr-wire-highlight.png",
        priority = "extra-high-no-scale",
        flags = { "no-crop" },
        width = 448,
        height = 92,
        scale = 0.5
      }
    },
    red_wire_hightlight =
    {
      filename = "__core__/graphics/wire-highlight.png",
      priority = "extra-high-no-scale",
      flags = { "no-crop" },
      width = 224,
      height = 46,
      hr_version =
      {
        filename = "__core__/graphics/hr-wire-highlight.png",
        priority = "extra-high-no-scale",
        flags = { "no-crop" },
        width = 448,
        height = 92,
        scale = 0.5
      }
    },
    wire_shadow =
    {
      filename = "__core__/graphics/wire-shadow.png",
      priority = "extra-high-no-scale",
      flags = { "no-crop" },
      width = 224,
      height = 46,
      hr_version =
      {
        filename = "__core__/graphics/hr-wire-shadow.png",
        priority = "extra-high-no-scale",
        flags = { "no-crop" },
        width = 448,
        height = 92,
        scale = 0.5
      }
    },
    trash_bin =
    {
      filename = "__core__/graphics/trash-bin.png",
      priority = "high",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    and_or =
    {
      filename = "__core__/graphics/and-or-icon.png",
      priority = "high",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    left_arrow =
    {
      filename = "__core__/graphics/left-arrow.png",
      priority = "high",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    right_arrow =
    {
      filename = "__core__/graphics/right-arrow.png",
      priority = "high",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    down_arrow =
    {
      filename = "__core__/graphics/down-arrow.png",
      priority = "high",
      width = 32,
      height = 16,
      flags = {"icon"}
    },
    enter =
    {
      filename = "__core__/graphics/enter-icon.png",
      priority = "high",
      width = 64,
      height = 64,
      flags = {"icon"}
    },

    side_menu_blueprint_library_icon =  make_side_menu_button(0, false),
    side_menu_production_icon =   make_side_menu_button(1, false),
    side_menu_bonus_icon =        make_side_menu_button(2, false),
    side_menu_tutorials_icon =    make_side_menu_button(3, false),
    side_menu_train_icon =        make_side_menu_button(4, false),
    side_menu_achievements_icon = make_side_menu_button(5, false),
    side_menu_menu_icon =         make_side_menu_button(6, false), -- for demo
    side_menu_map_icon =          make_side_menu_button(7, false), -- for demo

    side_menu_blueprint_library_hover_icon =  make_side_menu_button(0, true),
    side_menu_production_hover_icon =   make_side_menu_button(1, true),
    side_menu_bonus_hover_icon =        make_side_menu_button(2, true),
    side_menu_tutorials_hover_icon =    make_side_menu_button(3, true),
    side_menu_train_hover_icon =        make_side_menu_button(4, true),
    side_menu_achievements_hover_icon = make_side_menu_button(5, true),
    side_menu_menu_hover_icon =         make_side_menu_button(6, true), -- for demo
    side_menu_map_hover_icon =          make_side_menu_button(7, true), -- for demo

    circuit_network_panel_black =
    {
      filename = "__core__/graphics/circuit-network-panel-black.png",
      priority = "high",
      width = 16,
      height = 16,
      flags = {"icon"}
    },
    circuit_network_panel_white =
    {
      filename = "__core__/graphics/circuit-network-panel-white.png",
      priority = "high",
      width = 16,
      height = 16,
      flags = {"icon"}
    },

    logistic_network_panel_black =
    {
      filename = "__core__/graphics/logistic-network-panel-black.png",
      priority = "high",
      width = 16,
      height = 16,
      flags = {"icon"}
    },
    logistic_network_panel_white =
    {
      filename = "__core__/graphics/logistic-network-panel-white.png",
      priority = "high",
      width = 16,
      height = 16,
      flags = {"icon"}
    },

    rename_icon_small_black =
    {
      filename = "__core__/graphics/rename-small-black.png",
      priority = "high",
      width = 16,
      height = 16,
      flags = {"icon"}
    },
    rename_icon_small_white =
    {
      filename = "__core__/graphics/rename-small-white.png",
      priority = "high",
      width = 16,
      height = 16,
      flags = {"icon"}
    },

    rename_icon_normal =
    {
      filename = "__core__/graphics/rename-normal.png",
      priority = "high",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    achievement_label_locked =
    {
      filename = "__core__/graphics/achievement-labels.png",
      priority = "high",
      width = 33,
      height = 64,
      flags = {"icon"}
    },
    achievement_label_unlocked_off =
    {
      filename = "__core__/graphics/achievement-labels.png",
      priority = "high",
      width = 33,
      height = 64,
      x = 33,
      y = 0,
      flags = {"icon"}
    },
    achievement_label_unlocked =
    {
      filename = "__core__/graphics/achievement-labels.png",
      priority = "high",
      width = 33,
      height = 64,
      x = 66,
      y = 0,
      flags = {"icon"}
    },
    achievement_label_failed =
    {
      filename = "__core__/graphics/achievement-labels.png",
      priority = "high",
      width = 33,
      height = 64,
      x = 99,
      y = 0,
      flags = {"icon"}
    },
    logistic_radius_visualization =
    {
      filename = "__core__/graphics/visualization-logistic-radius.png",
      priority = "extra-high-no-scale",
      x = 1,
      y = 1,
      width = 10,
      height = 10
    },
    construction_radius_visualization =
    {
      filename = "__core__/graphics/visualization-construction-radius.png",
      priority = "extra-high-no-scale",
      x = 1,
      y = 1,
      width = 10,
      height = 10
    },
    track_button =
    {
      filename = "__core__/graphics/track-button.png",
      priority = "high",
      width = 16,
      height = 16
    },
    clouds =
    {
      filename = "__core__/graphics/clouds.png",
      priority = "low",
      flags = { "linear-minification", "linear-magnification" },
      width = 256,
      height = 256,
      frame_count = 2
    },
    refresh_white =
    {
      filename = "__core__/graphics/refresh-white-animation.png",
      flags = {"icon"},
      width = 32,
      height = 32,
      scale = 0.5,
      frame_count = 16,
      animation_speed = 16
    },
    indication_arrow =
    {
      filename = "__core__/graphics/arrows/indication-arrow.png",
      priority = "extra-high-no-scale",
      flags = { "icon" },
      width = 64,
      height = 64,
      scale = 0.5
    },
    fluid_indication_arrow =
    {
      filename = "__core__/graphics/arrows/fluid-indication-arrow.png",
      priority = "extra-high-no-scale",
      flags = { "icon" },
      width = 48,
      height = 48,
      scale = 0.5
    },
    fluid_indication_arrow_both_ways =
    {
      filename = "__core__/graphics/arrows/fluid-indication-arrow-both-ways.png",
      priority = "extra-high-no-scale",
      flags = { "icon" },
      width = 48,
      height = 48,
      scale = 0.5
    },
    heat_exchange_indication =
    {
      filename = "__core__/graphics/arrows/heat-exchange-indication.png",
      priority = "extra-high-no-scale",
      flags = { "icon" },
      width = 48,
      height = 48,
      scale = 0.5
    },
    rail_planner_indication_arrow =
    {
      filename = "__core__/graphics/arrows/rail-planner-indication-arrow.png",
      priority = "extra-high-no-scale",
      flags = { "icon" },
      width = 82,
      height = 44,
      scale = 0.5
    },
    rail_planner_indication_arrow_too_far =
    {
      filename = "__core__/graphics/arrows/rail-planner-indication-arrow-too-far.png",
      priority = "extra-high-no-scale",
      flags = { "icon" },
      width = 82,
      height = 44,
      scale = 0.5
    },
    indication_line =
    {
      filename = "__core__/graphics/arrows/indication-line.png",
      priority = "extra-high-no-scale",
      flags = { "icon" },
      width = 64,
      height = 64,
      scale = 0.5
    },
    short_indication_line =
    {
      filename = "__core__/graphics/arrows/short-indication-line.png",
      priority = "extra-high-no-scale",
      flags = { "icon" },
      width = 64,
      height = 64,
      scale = 0.5
    },
    short_indication_line_green =
    {
      filename = "__core__/graphics/arrows/short-indication-line-green.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 12,
      scale = 0.5
    },
    rail_signal_placement_indicator =
    {
      filename = "__core__/graphics/rail-placement-indicators.png",
      priority = "extra-high-no-scale",
      flags = { "icon" },
      width = 64,
      height = 64,
      scale = 0.5
    },
    train_stop_placement_indicator =
    {
      filename = "__core__/graphics/rail-placement-indicators.png",
      priority = "extra-high-no-scale",
      flags = { "icon" },
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    placement_indicator_leg =
    {
      filename = "__core__/graphics/rail-placement-indicators.png",
      priority = "extra-high-no-scale",
      flags = { "icon" },
      width = 64,
      height = 64,
      x = 128,
      scale = 0.5
    },
    grey_rail_signal_placement_indicator =
    {
      filename = "__core__/graphics/rail-placement-indicators.png",
      priority = "extra-high-no-scale",
      flags = { "icon" },
      width = 64,
      height = 64,
      y = 64,
      scale = 0.5
    },
    grey_placement_indicator_leg =
    {
      filename = "__core__/graphics/rail-placement-indicators.png",
      priority = "extra-high-no-scale",
      flags = { "icon" },
      width = 64,
      height = 64,
      x = 128,
      y = 64,
      scale = 0.5
    },
    battery =
    {
      filename = "__core__/graphics/battery.png",
      priority = "extra-high-no-scale",
      width = 21,
      height = 54
    },
    arrow_button =
    {
      priority = "extra-high-no-scale",
      width = 10,
      height = 8,
      frame_count = 4,
      stripes =
      {
        {
          filename = "__core__/graphics/arrows/arrow-button.png",
          width_in_frames = 1,
          height_in_frames = 1,
          x = 3,
          y = 4
        },
        {
          filename = "__core__/graphics/arrows/arrow-button.png",
          width_in_frames = 1,
          height_in_frames = 1,
          x = 19,
          y = 4
        },
        {
          filename = "__core__/graphics/arrows/arrow-button.png",
          width_in_frames = 1,
          height_in_frames = 1,
          x = 3,
          y = 20
        },
        {
          filename = "__core__/graphics/arrows/arrow-button.png",
          width_in_frames = 1,
          height_in_frames = 1,
          x = 19,
          y = 20
        }
      }
    },
    show_logistics_network_in_map_view   = make_side_map_menu_button(0, false),
    show_electric_network_in_map_view    = make_side_map_menu_button(1, false),
    show_turret_range_in_map_view        = make_side_map_menu_button(2, false),
    show_pollution_in_map_view           = make_side_map_menu_button(3, false),
    show_train_station_names_in_map_view = make_side_map_menu_button(4, false),
    show_player_names_in_map_view        = make_side_map_menu_button(5, false),    show_logistics_network_in_map_view_black   = make_side_map_menu_button(0, true),
    show_electric_network_in_map_view_black    = make_side_map_menu_button(1, true),
    show_turret_range_in_map_view_black        = make_side_map_menu_button(2, true),
    show_pollution_in_map_view_black           = make_side_map_menu_button(3, true),
    show_train_station_names_in_map_view_black = make_side_map_menu_button(4, true),
    show_player_names_in_map_view_black        = make_side_map_menu_button(5, true),
    train_stop_in_map_view =
    {
      filename = "__core__/graphics/train-stop-in-map-view.png",
      priority = "extra-high-no-scale",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    train_stop_disabled_in_map_view =
    {
      filename = "__core__/graphics/train-stop-in-map-view.png",
      priority = "extra-high-no-scale",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    custom_tag_in_map_view =
    {
      filename = "__core__/graphics/custom-tag-in-map-view.png",
      priority = "extra-high-no-scale",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    covered_chunk =
    {
      filename = "__core__/graphics/covered-chunk.png",
      priority = "extra-high-no-scale",
      width = 10,
      height = 10
    },
    white_square =
    {
      filename = "__core__/graphics/white-square.png",
      priority = "extra-high-no-scale",
      width = 10,
      height = 10
    },
    white_mask =
    {
      filename = "__core__/graphics/white-square.png",
      priority = "extra-high-no-scale",
      flags = { "alpha-mask", "always-compressed" },
      width = 1,
      height = 1
    },
    favourite_server_icon =
    {
      filename = "__core__/graphics/favourite.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    crafting_machine_recipe_not_unlocked =
    {
      filename = "__core__/graphics/no-recipe.png",
      priority = "extra-high-no-scale",
      width = 101,
      height = 101,
      scale = 0.6,
      flags = {"icon"}
    },
    explosion_chart_visualization =
    {
      filename = "__core__/graphics/artillery-impact-map-visualization.png",
      priority = "extra-high-no-scale",
      scale = 0.5,
      flags = {"icon"},
      width = 64,
      height = 64,
      line_length = 8,
      frame_count = 24,
      blend_mode = "additive"
    },
    gps_map_icon =
    {
      filename = "__core__/graphics/gps-map-placeholder.png",
      priority = "extra-high-no-scale",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    underground_remove_belts =
    {
      filename = "__core__/graphics/arrows/underground-lines-remove.png",
      priority = "high",
      flags = {"icon"},
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    underground_remove_pipes =
    {
      filename = "__core__/graphics/arrows/underground-lines-remove.png",
      priority = "high",
      flags = {"icon"},
      width = 64,
      height = 64,
      scale = 0.5
    },
    underground_pipe_connection =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "extra-high-no-scale",
      flags = {"icon"},
      width = 64,
      height = 64,
      scale = 0.5
    },
    ghost_cursor =
    {
      filename = "__core__/graphics/ghost-cursor.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    tile_ghost_cursor =
    {
      filename = "__core__/graphics/tile-ghost-cursor.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },

    expand =
    {
      filename = "__core__/graphics/icons/mip/expand.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },

    expand_dark =
    {
      filename = "__core__/graphics/icons/mip/expand-dark.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },

    collapse =
    {
      filename = "__core__/graphics/icons/mip/collapse.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },

    collapse_dark =
    {
      filename = "__core__/graphics/icons/mip/collapse-dark.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },

    ------------------------------------------------------------ new icons
    battery_indicator =
    {
      filename = "__core__/graphics/battery-indicator.png",
      priority = "extra-high-no-scale",
      width = 54,
      height = 94,
      scale = 0.5,
      flags = {"icon"}
    },
    battery_indicator_bar =
    {
      filename = "__core__/graphics/battery-indicator-bar.png",
      priority = "extra-high-no-scale",
      width = 26,
      height = 16,
      scale = 0.5,
      flags = {"icon"}
    },
    center =
    {
      filename = "__core__/graphics/icons/mip/center.png",
      priority = "extra-high-no-scale",
      size = 32,
      mipmap_count = 2,
      scale = 0.5,
      flags = {"gui-icon"}
    },
    check_mark =
    {
      filename = "__core__/graphics/icons/check-mark.png",
      size = 32,
      scale = 0.5,
      flags = {"icon"}
    },
    check_mark_white =
    {
      filename = "__core__/graphics/icons/mip/check-mark-white.png",
      size = 32,
      scale = 0.5,
      flags = {"gui-icon"},
      mipmap_count = 2
    },
    close_white =
    {
      filename = "__core__/graphics/icons/close-white.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      flags = {"gui-icon"}
    },
    close_black =
    {
      filename = "__core__/graphics/icons/close-black.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      flags = {"gui-icon"},
    },
    close_fat =
    {
      filename = "__core__/graphics/icons/mip/close-fat.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    color_picker =
    {
      filename = "__core__/graphics/icons/mip/color-picker.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    change_recipe =
    {
      filename = "__core__/graphics/icons/change-recipe.png",
      priority = "extra-high-no-scale",
      size = 64,
      scale = 0.5,
      flags = {"gui-icon"}
    },
    downloading =
    {
      filename = "__core__/graphics/icons/mip/downloading.png",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    downloading_white =
    {
      filename = "__core__/graphics/icons/mip/downloading-white.png",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    downloaded =
    {
      filename = "__core__/graphics/icons/mip/downloaded.png",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    downloaded_white =
    {
      filename = "__core__/graphics/icons/mip/downloaded-white.png",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    dropdown =
    {
      filename = "__core__/graphics/icons/mip/dropdown.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    equipment_grid =
    {
      filename = "__core__/graphics/icons/equipment-grid.png",
      priority = "extra-high-no-scale",
      size = 46,
      scale = 1,
      flags = {"icon"}
    },
    expand_dots =
    {
      filename = "__core__/graphics/icons/mip/open-panel-options-8x16.png",
      priority = "extra-high-no-scale",
      width = 8,
      height = 16,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    expand_dots_white =
    {
      filename = "__core__/graphics/icons/mip/open-panel-options-8x16-white.png",
      priority = "extra-high-no-scale",
      width = 8,
      height = 16,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    export =
    {
      filename = "__core__/graphics/icons/mip/export.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    import =
    {
      filename = "__core__/graphics/icons/mip/import.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    map =
    {
      filename = "__core__/graphics/icons/mip/map.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count =2,
      flags = {"gui-icon"}
    },
    map_exchange_string =
    {
      filename = "__core__/graphics/icons/mip/map-exchange-string.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"gui-icon"},
      mipmap_count = 2,
      scale = 0.5
    },
    missing_mod_icon =
    {
      filename = "__core__/graphics/missing-thumbnail.png",
      size = 144,
      scale = 0.5,
      flags = {"icon"}
    },
    mod_dependency_arrow =
    {
      filename = "__core__/graphics/icons/mip/go-to-minibutton-arrow.png",
      priority = "extra-high-no-scale",
      size = 16,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    not_available =
    {
      filename = "__core__/graphics/icons/mip/not-available.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count =2,
      flags = {"gui-icon"}
    },
    preset =
    {
      filename = "__core__/graphics/icons/mip/preset.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    refresh =
    {
      filename = "__core__/graphics/icons/mip/refresh.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    reset =
    {
      filename = "__core__/graphics/icons/mip/reset.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    reset_white =
    {
      filename = "__core__/graphics/icons/mip/reset-white.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    shuffle =
    {
      filename = "__core__/graphics/icons/mip/shuffle.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    sync_mods =
    {
      filename = "__core__/graphics/icons/mip/sync-mods.png",
      priority = "extra-high-no-scale",
      size = 32,
      flags = {"gui-icon"},
      mipmap_count = 2,
      scale = 0.5
    },
    search_icon =
    {
      filename = "__core__/graphics/icons/mip/search.png",
      priority = "medium",
      width = 32,
      height = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    search_black =
    {
      filename = "__core__/graphics/icons/search-black.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      flags = {"gui-icon"},
    },
    search_white =
    {
      filename = "__core__/graphics/icons/search-white.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      flags = {"gui-icon"},
    },
    station_name =
    {
      filename = "__core__/graphics/icons/mip/station-name.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    trash =
    {
      filename = "__core__/graphics/icons/mip/trash.png",
      priority = "extra-high-no-scale",
      size = 32,
      flags = {"gui-icon"},
      mipmap_count = 2,
      scale = 0.5
    },
    trash_white =
    {
      filename = "__core__/graphics/icons/mip/trash-white.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    copy =
    {
      filename = "__core__/graphics/icons/mip/copy.png",
      priority = "extra-high-no-scale",
      size = 32,
      flags = {"gui-icon"},
      mipmap_count = 2,
      scale = 0.5
    },
    reassign =
    {
      filename = "__core__/graphics/icons/mip/reassign.png",
      priority = "extra-high-no-scale",
      size = 32,
      flags = {"gui-icon"},
      mipmap_count = 2,
      scale = 0.5
    },
    warning =
    {
      filename = "__core__/graphics/icons/mip/warning.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    warning_white =
    {
      filename = "__core__/graphics/icons/mip/warning-white.png",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    list_view =
    {
      filename = "__core__/graphics/icons/mip/list-view.png",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    grid_view =
    {
      filename = "__core__/graphics/icons/mip/grid-view.png",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    reference_point =
    {
      filename = "__core__/graphics/reference-point.png",
      size = 100,
      scale = 0.5,
      flags = {"gui-icon"}
    }
  }
})

local function make_cursor_box(x, y, side_length, shift)
  local shift = shift or {0,0}
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
      shift = {0.5 - (shift[1] / 32.0), 0.5 - (shift[2] / 32.0)}
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

local function make_default_modifier_icon(filename)
  --if filename then
  --  return
  --  {
  --    filename = "__core__/graphics/technology-effect/" .. filename,
  --    priority = "extra-high-no-scale",
  --    width = 64,
  --    height = 64,
  --    mipmap_count = 2,
  --    generate_sdf = true,
  --    flags = {"icon"}
  --  }
  --end

  return
  {
    filename = "__core__/graphics/bonus-icon.png",
    priority = "extra-high-no-scale",
    width = 32,
    height = 32,
    generate_sdf = true,
    flags = {"icon"}
  }
end

local function make_technology_modifier_icon(filename)
  return
  {
    filename = "__core__/graphics/icons/technology/effect/" .. filename,
    priority = "extra-high-no-scale",
    width = 64,
    height = 64,
    mipmap_count = 2,
    generate_sdf = true,
    flags = {"icon"}
  }
end

local default_character_modifier_icon =
{
  filename = "__core__/graphics/icons/entity/character.png",
  priority = "extra-high-no-scale",
  size = 64,
  scale = 0.5,
  mipmap_count = 2,
  generate_sdf = true,
  flags = {"icon"}
}

local function make_modifier_constant(filename)
  return
  {
    filename = "__core__/graphics/icons/technology/effect-constant/" .. filename,
    priority = "extra-high-no-scale",
    width = 64,
    height = 64,
    generate_sdf = true,
    mipmap_count = 2,
    flags = {"gui-icon"}
  }
end

local function make_side_menu_button(row)
  local side_menu_icon_size = 64
  return
  {
    filename = "__core__/graphics/side-menu-buttons.png",
    priority = "high",
    size = side_menu_icon_size,
    mipmap_count = 2,
    y = row * side_menu_icon_size,
    flags = {"gui-icon"}
  }
end

local function make_side_map_menu_button(row)
  local side_menu_icon_size = 64
  return
  {
    filename = "__core__/graphics/icons/mip/side-map-menu-buttons.png",
    priority = "high",
    size = side_menu_icon_size,
    mipmap_count = 2,
    y = row * side_menu_icon_size,
    flags = {"gui-icon"}
  }
end
local function make_controller_icon(file)
  return
  {
    filename = file,
    width = 40,
    height = 40,
    mipmap_count = 2,
    scale = 0.5,
    flags = {"gui-icon"},
    load_in_minimal_mode = true
  }
end


local function make_empty_slot_icon(name)
  return
  {
    filename = "__core__/graphics/icons/mip/" .. name .. ".png",
    priority = "extra-high-no-scale",
    size = 64,
    mipmap_count = 2,
    flags = {"gui-icon"},
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
    name = "tooltip-category-consumed",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-consumed.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-shot",
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
    name = "tooltip-category-activated",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-activated.png",
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
    name = "tooltip-category-crafting-surface-conditions",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-surface-conditions.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-construction-surface-conditions",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-surface-conditions.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-spoilable",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-spoilable.png",
    priority = "extra-high-no-scale",
    width = 40,
    height = 40,
    flags = {"gui-icon"},
    mipmap_count = 2,
    scale = 0.5
  },
  {
    type = "sprite",
    name = "tooltip-category-insertion",
    filename = "__core__/graphics/icons/tooltips/tooltip-category-insertion.png",
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
    name = "quality_info",
    filename = "__core__/graphics/icons/mip/quality-info-blue.png",
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
    flags = {"gui-icon"},
    load_in_minimal_mode = true
  },
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
      multiplayer_selection =
      {
        make_full_cursor_box(256, 0, 1, 1),
        make_cursor_box(256, 256, 0.4, {1, 1}),
        make_cursor_box(192, 256, 0.7),
        make_cursor_box(128, 256, 1.05),
        make_cursor_box(64, 256, 3.5),
        make_cursor_box(0, 256, 4.0)
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
      spidertron_remote_selected =
      {
        make_full_cursor_box(192, 0, 1, 1),
        make_cursor_box(256, 192, 0.4, {1, 1}),
        make_cursor_box(192, 192, 0.7),
        make_cursor_box(128, 192, 1.05),
        make_cursor_box(64, 192, 3.5),
        make_cursor_box(0, 192, 4.0)
      },
      spidertron_remote_to_be_selected =
      {
        make_full_cursor_box(384, 0, 1, 1),
        make_cursor_box(256, 384, 0.4, {1, 1}),
        make_cursor_box(192, 384, 0.7),
        make_cursor_box(128, 384, 1.05),
        make_cursor_box(64, 384, 3.5),
        make_cursor_box(0, 384, 4.0)
      }
    },

    add =
    {
      filename = "__core__/graphics/add-icon.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    add_white =
    {
      filename = "__core__/graphics/add-icon-white.png",
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
      flags = {"gui-icon"}
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
    lightning_warning_icon =
    {
      filename = "__core__/graphics/icons/alerts/endangered-by-lightning.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
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
    no_path_icon =
    {
      filename = "__core__/graphics/icons/alerts/no-path-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    destination_full_icon =
    {
      filename = "__core__/graphics/icons/alerts/destination-full-icon.png",
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
    no_platform_storage_space_icon =
    {
      filename = "__core__/graphics/icons/alerts/no-platform-storage-space-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    asteroid_collector_path_blocked_icon =
    {
      filename = "__core__/graphics/icons/alerts/asteroid-collector-path-blocked-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    navmesh_pending_icon =
    {
      filename = "__core__/graphics/icons/alerts/navmesh-pending-icon.png",
      priority = "extra-high-no-scale",
      flags = {"icon"},
      width = 64,
      height = 64,
      frame_count = 3
    },
    unclaimed_cargo_icon =
    {
      filename = "__core__/graphics/icons/alerts/unclaimed-cargo-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    no_roboport_storage_space_icon =
    {
      filename = "__core__/graphics/icons/alerts/no-roboport-storage-space-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    frozen_icon =
    {
      filename = "__core__/graphics/icons/alerts/frozen-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    pipeline_disabled_icon =
    {
      filename = "__core__/graphics/icons/alerts/fluid-icon-red.png",
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
    tooltip_category_spoilable =
    {
      filename = "__core__/graphics/icons/tooltips/tooltip-category-spoilable.png",
      priority = "extra-high-no-scale",
      width = 40,
      height = 40,
      flags = {"icon"}
    },
    resources_depleted_icon =
    {
      filename = "__core__/graphics/icons/alerts/resources-depleted-icon.png",
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
      filename = "__core__/graphics/icons/mip/slot-item-in-hand.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      mipmap_count = 2,
      scale = 0.5,
      flags = {"gui-icon"}
    },
    hand_black =
    {
      filename = "__core__/graphics/icons/mip/slot-item-in-hand-black.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      mipmap_count = 2,
      scale = 0.5,
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
      flags = {"light"}
    },
    clock =
    {
      filename = "__core__/graphics/clock-icon.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    item_to_be_delivered_symbol =
    {
      filename = "__core__/graphics/icons/item-to-be-delivered-symbol.png",
      priority = "medium",
      width = 64,
      height = 92,
      scale = 0.4,
      flags = {"icon"}
    },
    default_ammo_damage_modifier_icon                                     = make_default_modifier_icon("default-ammo-damage-modifier.png"),
    default_gun_speed_modifier_icon                                       = make_default_modifier_icon("default-gun-speed-modifier.png"),
    default_turret_attack_modifier_icon                                   = make_default_modifier_icon("default-turret-attack-modifier.png"),
    inserter_stack_size_bonus_modifier_icon                               = make_technology_modifier_icon("inserter.png"),
    belt_stack_size_bonus_modifier_icon                                   = make_technology_modifier_icon("transport-belt.png"),
    bulk_inserter_capacity_bonus_modifier_icon                            = make_technology_modifier_icon("bulk-inserter.png"),
    laboratory_speed_modifier_icon                                        = make_default_modifier_icon("laboratory-speed-modifier.png"),
    character_logistic_trash_slots_modifier_icon                          = make_technology_modifier_icon("effect-logistic-trash-slots.png"),
    maximum_following_robots_count_modifier_icon                          = make_technology_modifier_icon("defender.png"),
    worker_robot_speed_modifier_icon                                      = make_default_modifier_icon("worker-robot-speed-modifier.png"),
    worker_robot_storage_modifier_icon                                    = make_default_modifier_icon("worker-robot-storage-modifier.png"),
    create_ghost_on_entity_death_modifier_icon                            = make_technology_modifier_icon("effect-ghost.png"),
    vehicle_logistics_modifier_icon                                       = make_default_modifier_icon(),
    turret_attack_modifier_icon                                           = make_default_modifier_icon("turret-attack-modifier.png"),
    ammo_damage_modifier_icon                                             = make_default_modifier_icon("ammo-damage-modifier.png"),
    give_item_modifier_icon                                               = make_default_modifier_icon("give-item-modifier.png"),
    gun_speed_modifier_icon                                               = make_default_modifier_icon("gun-speed-modifier.png"),
    unlock_recipe_modifier_icon                                           = make_default_modifier_icon("unlock-recipe-modifier.png"),
    unlock_space_location_modifier_icon                                   = make_default_modifier_icon("unlock-space-location-modifier.png"),
    unlock_space_platforms_modifier_icon                                  = make_default_modifier_icon("unlock-space-platforms-modifier.png"),
    unlock_circuit_network_modifier_icon                                  = make_technology_modifier_icon("effect-circuit-network.png"),
    cliff_deconstruction_enabled_modifier_icon                            = make_technology_modifier_icon("effect-cliff-deconstruction.png"),
    mining_with_fluid_modifier_icon                                       = make_technology_modifier_icon("effect-mining-with-fluid.png"),
    rail_support_on_deep_oil_ocean_modifier_icon                          = make_technology_modifier_icon("effect-rail-support-on-deep-oil-ocean.png"),
    rail_planner_allow_elevated_rails_modifier_icon                       = make_default_modifier_icon("rail-planner-allow-elevated-rails.png"),
    unlock_quality_modifier_icon                                          = make_default_modifier_icon("unlock-quality-modifier.png"),
    change_recipe_productivity_modifier_icon                              = make_default_modifier_icon("unlock-quality-modifier.png"),
    character_crafting_speed_modifier_icon                                = default_character_modifier_icon,
    character_mining_speed_modifier_icon                                  = default_character_modifier_icon,
    character_running_speed_modifier_icon                                 = default_character_modifier_icon,
    character_build_distance_modifier_icon                                = default_character_modifier_icon,
    character_item_drop_distance_modifier_icon                            = default_character_modifier_icon,
    character_reach_distance_modifier_icon                                = default_character_modifier_icon,
    character_resource_reach_distance_modifier_icon                       = default_character_modifier_icon,
    character_item_pickup_distance_modifier_icon                          = default_character_modifier_icon,
    character_loot_pickup_distance_modifier_icon                          = default_character_modifier_icon,
    character_inventory_slots_bonus_modifier_icon                         = default_character_modifier_icon,
    character_health_bonus_modifier_icon                                  = default_character_modifier_icon,
    deconstruction_time_to_live_modifier_icon                             = make_technology_modifier_icon("effect-deconstruction.png"),
    mining_drill_productivity_bonus_modifier_icon                         = make_technology_modifier_icon("electric-mining-drill.png"),
    train_braking_force_bonus_modifier_icon                               = make_default_modifier_icon("train-braking-force-bonus-modifier.png"),
    worker_robot_battery_modifier_icon                                    = make_default_modifier_icon("worker-robot-battery-modifier.png"),
    laboratory_productivity_modifier_icon                                 = make_default_modifier_icon("laboratory-productivity-modifier.png"),
    follower_robot_lifetime_modifier_icon                                 = make_default_modifier_icon("follower-robot-lifetime-modifier.png"),
    nothing_modifier_icon                                                 = make_default_modifier_icon("nothing-modifier.png"),
    max_failed_attempts_per_tick_per_construction_queue_modifier_icon     = make_technology_modifier_icon("effect-ghost.png"),
    max_successful_attempts_per_tick_per_construction_queue_modifier_icon = make_technology_modifier_icon("effect-ghost.png"),
    cargo_landing_pad_count_modifier_icon                                 = make_default_modifier_icon();
    artillery_range_modifier_icon                                         = make_technology_modifier_icon("artillery-shell.png"),
    character_additional_mining_categories_modifier_icon                  = make_default_modifier_icon("character-additional-mining-categories-modifier.png"),
    character_logistic_requests_modifier_icon                             = make_technology_modifier_icon("effect-logistic-slots.png"),
    beacon_distribution_modifier_icon                                     = make_default_modifier_icon(),
    ammo_damage_modifier_constant                                             = make_modifier_constant("effect-constant-damage.png"),
    turret_attack_modifier_constant                                           = make_modifier_constant("effect-constant-damage.png"),
    worker_robot_speed_modifier_constant                                      = make_modifier_constant("effect-constant-movement-speed.png"),
    gun_speed_modifier_constant                                               = make_modifier_constant("effect-constant-speed.png"),
    laboratory_speed_modifier_constant                                        = make_modifier_constant("effect-constant-speed.png"),
    artillery_range_modifier_constant                                         = make_modifier_constant("effect-constant-range.png"),
    maximum_following_robots_count_modifier_constant                          = make_modifier_constant("effect-constant-count.png"),
    follower_robot_lifetime_modifier_constant                                 = make_modifier_constant("effect-constant-time-to-live.png"),
    character_logistic_trash_slots_modifier_constant                          = make_modifier_constant("effect-constant-capacity.png"),
    --capacity_modifier_constant                                                = make_modifier_constant("effect-constant-capacity.png"),
    worker_robot_storage_modifier_constant                                    = make_modifier_constant("effect-constant-capacity.png"),
    worker_robot_battery_modifier_constant                                    = make_modifier_constant("effect-constant-battery.png"),
    mining_drill_productivity_bonus_modifier_constant                         = make_modifier_constant("effect-constant-mining-productivity.png"),
    laboratory_productivity_modifier_constant                                 = make_modifier_constant("effect-constant-laboratory-productivity.png"),
    train_braking_force_bonus_modifier_constant                               = make_modifier_constant("effect-constant-braking-force.png"),
    character_mining_speed_modifier_constant                                  = make_modifier_constant("effect-constant-mining.png"),
    character_crafting_speed_modifier_constant                                = make_modifier_constant("effect-constant-crafting-speed.png"),
    character_running_speed_modifier_constant                                 = make_modifier_constant("effect-constant-movement-speed.png"),
    character_build_distance_modifier_constant                                = make_modifier_constant("effect-constant-range.png"),
    character_item_drop_distance_modifier_constant                            = make_modifier_constant("effect-constant-range.png"),
    character_reach_distance_modifier_constant                                = make_modifier_constant("effect-constant-range.png"),
    character_resource_reach_distance_modifier_constant                       = make_modifier_constant("effect-constant-range.png"),
    character_item_pickup_distance_modifier_constant                          = make_modifier_constant("effect-constant-range.png"),
    character_loot_pickup_distance_modifier_constant                          = make_modifier_constant("effect-constant-range.png"),
    character_inventory_slots_bonus_modifier_constant                         = make_modifier_constant("effect-constant-capacity.png"),
    character_health_bonus_modifier_constant                                  = make_modifier_constant("effect-constant-health.png"),
    bulk_inserter_capacity_bonus_modifier_constant                            = make_modifier_constant("effect-constant-capacity.png"),
    inserter_stack_size_bonus_modifier_constant                               = make_modifier_constant("effect-constant-capacity.png"),
    belt_stack_size_bonus_modifier_constant                                   = make_modifier_constant("effect-constant-capacity.png"),
    deconstruction_time_to_live_modifier_constant                             = make_modifier_constant("effect-constant-time-to-live.png"),
    max_failed_attempts_per_tick_per_construction_queue_modifier_constant     = make_modifier_constant("effect-constant-speed.png"),
    max_successful_attempts_per_tick_per_construction_queue_modifier_constant = make_modifier_constant("effect-constant-speed.png"),
    change_recipe_productivity_modifier_constant                              = make_modifier_constant("effect-constant-recipe-productivity.png"),
    unlock_space_location_modifier_constant                                   = make_modifier_constant("effect-constant-planet.png"),


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
    empty_module_slot = make_empty_slot_icon("empty-module-slot"),
    empty_armor_slot = make_empty_slot_icon("empty-armor-slot"),
    empty_gun_slot = make_empty_slot_icon("empty-gun-slot"),
    empty_ammo_slot = make_empty_slot_icon("empty-ammo-slot"),
    empty_robot_slot = make_empty_slot_icon("empty-robot-slot"),
    empty_robot_material_slot = make_empty_slot_icon("empty-robot-material-slot"),
    empty_inserter_hand_slot = make_empty_slot_icon("empty-inserter-hand-slot"),
    empty_trash_slot = make_empty_slot_icon("empty-trash-slot"),
    empty_drop_cargo_slot = make_empty_slot_icon("empty-drop-cargo-slot"),
    slot =
    {
      filename = "__core__/graphics/slot.png",
      priority = "extra-high-no-scale",
      width = 80,
      height = 80,
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
      filename = "__core__/graphics/icons/mip/slot-robot-white.png",
      priority = "medium",
      width = 64,
      height = 64,
      mipmap_count = 3,
      scale = 0.5,
      flags = {"gui-icon"}
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
    buildability_collision =
    {
      filename = "__core__/graphics/buildability-collision.png",
      priority = "medium",
      width = 64,
      height = 64,
      mipmap_count = 4,
      flags = {"icon"},
      scale = 0.5
    },
    buildability_elevated_collision_line =
    {
      filename = "__core__/graphics/elevated-collision-line.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"},
      scale = 0.5
    },
    buildability_elevated_collision_bottom =
    {
      filename = "__core__/graphics/elevated-collision-bottom.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"},
      scale = 0.5
    },
    buildability_elevated_collision_top =
    {
      filename = "__core__/graphics/elevated-collision-top.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"},
      scale = 0.5
    },
    buildability_collision_elevated =
    {
      filename = "__core__/graphics/buildability-collision-elevated.png",
      priority = "medium",
      width = 64,
      height = 64,
      mipmap_count = 4,
      flags = {"icon"},
      scale = 0.5
    },
    upgrade_mark =
    {
      filename = "__core__/graphics/icons/upgrade-symbol.png",
      priority = "medium",
      width = 64,
      height = 92,
      scale = 0.5,
      shift = util.by_pixel_hr(0, -46),
      flags = {"icon"}
    },
    rebuild_mark =
    {
      filename = "__core__/graphics/icons/rebuild-symbol.png",
      priority = "medium",
      width = 64,
      height = 92,
      scale = 0.5,
      shift = util.by_pixel_hr(0, -46),
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
    asteroid_chunk_editor_icon =
    {
      filename = "__core__/graphics/icons/category/asteroid-chunk-editor.png",
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
      filename = "__core__/graphics/icons/force/player-force-icon.png",
      priority = "medium",
      width = 128,
      height = 128,
      mipmap_count = 2,
      flags = {"icon"}
    },
    neutral_force_icon =
    {
      filename = "__core__/graphics/icons/force/neutral-force-icon.png",
      priority = "medium",
      width = 128,
      height = 128,
      mipmap_count = 2,
      flags = {"icon"}
    },
    enemy_force_icon =
    {
      filename = "__core__/graphics/icons/force/enemy-force-icon.png",
      priority = "medium",
      width = 128,
      height = 128,
      mipmap_count = 2,
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
      width = 448,
      height = 92,
      scale = 0.5
    },
    green_wire =
    {
      filename = "__core__/graphics/green-wire.png",
      priority = "extra-high-no-scale",
      flags = { "no-crop" },
      width = 448,
      height = 92,
      scale = 0.5
    },
    red_wire =
    {
      filename = "__core__/graphics/red-wire.png",
      priority = "extra-high-no-scale",
      flags = { "no-crop" },
      width = 448,
      height = 92,
      scale = 0.5
    },
    copper_wire_highlight =
    {
      filename = "__core__/graphics/wire-highlight.png",
      priority = "extra-high-no-scale",
      flags = { "no-crop" },
      width = 448,
      height = 92,
      scale = 0.5
    },
    green_wire_highlight =
    {
      filename = "__core__/graphics/wire-highlight.png",
      priority = "extra-high-no-scale",
      flags = { "no-crop" },
      width = 448,
      height = 92,
      scale = 0.5
    },
    red_wire_highlight =
    {
      filename = "__core__/graphics/wire-highlight.png",
      priority = "extra-high-no-scale",
      flags = { "no-crop" },
      width = 448,
      height = 92,
      scale = 0.5
    },
    wire_shadow =
    {
      filename = "__core__/graphics/wire-shadow.png",
      priority = "extra-high-no-scale",
      flags = { "no-crop" },
      width = 448,
      height = 92,
      scale = 0.5
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
      width = 24,
      height = 16,
      scale = 1,
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

    side_menu_blueprint_library_icon =  make_side_menu_button(0),
    side_menu_production_icon = make_side_menu_button(1),
    side_menu_bonus_icon = make_side_menu_button(2),
    side_menu_tutorials_icon = make_side_menu_button(3),
    side_menu_train_icon = make_side_menu_button(4),
    side_menu_achievements_icon = make_side_menu_button(5),
    side_menu_menu_icon = make_side_menu_button(6), -- for demo
    side_menu_map_icon = make_side_menu_button(7), -- for demo
    side_menu_space_platforms_icon = make_side_menu_button(8),
    side_menu_logistic_networks_icon = make_side_menu_button(9),
    side_menu_factoriopedia_icon = make_side_menu_button(10),
    side_menu_technology_icon = make_side_menu_button(11), -- for quick panel
    side_menu_players_icon = make_side_menu_button(12),

    circuit_network_panel =
    {
      filename = "__core__/graphics/icons/mip/circuit-connection.png",
      priority = "high",
      size = 32,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },

    logistic_network_panel_white =
    {
      filename = "__core__/graphics/icons/mip/logistic-connection.png",
      priority = "high",
      size = 32,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },

    logistic_network_panel_black =
    {
      filename = "__core__/graphics/icons/mip/logistic-connection.png",
      priority = "high",
      size = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      invert_colors = true
    },

    rename_icon =
    {
      filename = "__core__/graphics/rename-icon.png",
      priority = "high",
      size = 32,
      flags = {"icon"}
    },

    achievement_warning =
    {
      filename = "__core__/graphics/icons/mip/achievements-warning.png",
      priority = "high",
      size = 48,
      mipmap_count = 2,
      flags = {"icon"}
    },

    achievement_label =
    {
      layers =
      {
        {
          filename = "__core__/graphics/gui-new.png",
          priority = "high",
          width = 72,
          height = 120,
          x = 392,
          y = 904,
          scale = 0.5,
          flags = {"icon"},
          shift = { -8, 0}
        },
        {
          filename = "__core__/graphics/icons/mip/achievements-status.png",
          priority = "high",
          width = 56,
          height = 56,
          x = 0,
          y = 56 * 1,
          scale = 0.5,
          mipmap_count = 2,
          flags = {"icon"},
          shift = { -8, 16 - 30}
        }
      }
    },

    achievement_label_completed =
    {
      layers =
      {
        {
          filename = "__core__/graphics/gui-new.png",
          priority = "high",
          width = 72,
          height = 120,
          x = 320,
          y = 904,
          scale = 0.5,
          flags = {"icon"},
          shift = { -8, 0}
        },
        {
          filename = "__core__/graphics/icons/mip/achievements-status.png",
          priority = "high",
          width = 56,
          height = 56,
          x = 0,
          y = 0,
          scale = 0.5,
          mipmap_count = 2,
          flags = {"icon"},
          shift = { -8, 16 - 30}
        }
      }
    },

    achievement_label_failed =
    {
      layers =
      {
        {
          filename = "__core__/graphics/gui-new.png",
          priority = "high",
          width = 72,
          height = 120,
          x = 464,
          y = 904,
          scale = 0.5,
          flags = {"icon"},
          shift = { -8, 0}
        },
        {
          filename = "__core__/graphics/icons/mip/achievements-status.png",
          priority = "high",
          width = 56,
          height = 56,
          x = 0,
          y = 56 * 2,
          scale = 0.5,
          mipmap_count = 2,
          flags = {"icon"},
          shift = { -8, 16 - 30}
        }
      }
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
      filename = "__core__/graphics/icons/mip/pin.png",
      priority = "high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    track_button_white =
    {
      filename = "__core__/graphics/icons/mip/pin-white.png",
      priority = "high",
      width = 32,
      height = 32,
      scale = 0.5
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
      animation_speed = 16,
      load_in_minimal_mode = true
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
    rail_planner_indication_arrow_anchored =
    {
      filename = "__core__/graphics/arrows/rail-planner-indication-arrow-anchored.png",
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
    rail_support_placement_indicator =
    {
      filename = "__core__/graphics/rail-placement-indicators.png", -- TODO (@GFX)
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
    show_logistics_network_in_map_view   = make_side_map_menu_button(0),
    show_electric_network_in_map_view    = make_side_map_menu_button(1),
    show_turret_range_in_map_view        = make_side_map_menu_button(2),
    show_train_station_names_in_map_view = make_side_map_menu_button(4),
    show_player_names_in_map_view        = make_side_map_menu_button(5),
    show_tags_in_map_view                = make_side_map_menu_button(6),
    show_worker_robots_in_map_view       = make_side_map_menu_button(7),
    show_rail_signal_states_in_map_view  = make_side_map_menu_button(8),
    show_recipe_icons_in_map_view        = make_side_map_menu_button(9),
    show_pipelines_in_map_view           = make_side_map_menu_button(10),
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
      tint = {r = 0.9, g = 0.2, b = 0.2},
      priority = "extra-high-no-scale",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    train_stop_full_in_map_view =
    {
      filename = "__core__/graphics/train-stop-in-map-view.png",
      tint = {r = 0.5, g = 0.5, b = 0.9},
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
      height = 49,
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
    white_square_icon =
    {
      filename = "__core__/graphics/white-square.png",
      priority = "extra-high-no-scale",
      flags = {"icon"},
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
    crafting_machine_recipe_not_unlocked =
    {
      filename = "__core__/graphics/no-recipe.png",
      priority = "extra-high-no-scale",
      width = 101,
      height = 101,
      scale = 0.6,
      flags = {"icon"}
    },
    filter_blacklist =
    {
      filename = "__core__/graphics/filter-blacklist.png",
      priority = "extra-high-no-scale",
      width = 101,
      height = 101,
      scale = 0.3,
      flags = {"icon"},
      generate_sdf = true
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
    custom_tag_icon =
    {
      filename = "__core__/graphics/icons/mip/custom-tag-icon.png",
      priority = "extra-high-no-scale",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    space_age_icon =
    {
      filename = "__core__/graphics/icons/space-age.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    tip_icon =
    {
      filename = "__core__/graphics/icons/tip.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
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
    max_distance_underground_remove_belts =
    {
      filename = "__core__/graphics/arrows/max-distance-underground-lines-remove.png",
      priority = "high",
      flags = {"icon"},
      width = 64,
      height = 64,
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
      filename = "__core__/graphics/icons/mip/cursor-ghost.png",
      priority = "extra-high",
      size = 64,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    tile_ghost_cursor =
    {
      filename = "__core__/graphics/icons/mip/cursor-ghost-tile.png",
      priority = "extra-high",
      size = 64,
      mipmap_count = 2,
      scale = 0.5,
      flags = {"gui-icon"}
    },
    force_ghost_cursor =
    {
      filename = "__core__/graphics/icons/mip/cursor-super-force-ghost.png",
      priority = "extra-high",
      size = 64,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    force_tile_ghost_cursor =
    {
      filename = "__core__/graphics/icons/mip/cursor-ghost-super-force-tile.png",
      priority = "extra-high",
      size = 64,
      mipmap_count = 2,
      scale = 0.5,
      flags = {"gui-icon"}
    },
    cross_select =
    {
      filename = "__core__/graphics/cross-select-x32.png",
      priority = "extra-high",
      size = 32,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
    },
    crosshair =
    {
      filename = "__core__/graphics/crosshair-x32.png",
      priority = "extra-high",
      size = 32,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
    },

    expand =
    {
      filename = "__core__/graphics/icons/mip/expand.png",
      priority = "extra-high-no-scale",
      size = 32,
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

    any_quality =
    {
      filename = "__core__/graphics/icons/any-quality.png",
      priority = "extra-high-no-scale",
      size = 64,
      scale = 0.25,
      flags = {"icon"}
    },

    fluid_visualization_connection =
    {
      filename = "__core__/graphics/fluid-visualization/connection.png",
      priority = "extra-high-no-scale",
      flags = {"icon"},
      width = 48,
      height = 48,
      scale = 0.5
    },

    fluid_visualization_connection_both_ways =
    {
      filename = "__core__/graphics/fluid-visualization/connection-both-ways.png",
      priority = "extra-high-no-scale",
      flags = {"icon"},
      width = 48,
      height = 48,
      scale = 0.5
    },

    fluid_visualization_connection_underground =
    {
      filename = "__core__/graphics/fluid-visualization/connection-underground.png",
      priority = "extra-high-no-scale",
      flags = {"icon"},
      width = 64,
      height = 64,
      scale = 0.5
    },

    fluid_visualization_extent_arrow =
    {
      filename = "__core__/graphics/fluid-visualization/extent-arrow.png",
      size = {42, 55},
      scale = 0.5,
      flags = {"gui-icon"}
    },

    ------------------------------------------------------------ new icons
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
      mipmap_count = 2,
      load_in_minimal_mode = true
    },
    check_mark_green =
    {
      filename = "__core__/graphics/icons/mip/check-mark-green.png",
      size = 32,
      scale = 0.5,
      flags = {"gui-icon"},
      mipmap_count = 2
    },
    check_mark_dark_green =
    {
      filename = "__core__/graphics/icons/mip/check-mark-dark-green.png",
      size = 32,
      scale = 0.5,
      flags = {"gui-icon"},
      mipmap_count = 2
    },
    not_played_yet_green =
    {
      filename = "__core__/graphics/icons/mip/not-played-yet-green.png",
      size = 32,
      scale = 0.5,
      flags = {"gui-icon"},
      mipmap_count = 2
    },
    not_played_yet_dark_green =
    {
      filename = "__core__/graphics/icons/mip/not-played-yet-dark-green.png",
      size = 32,
      scale = 0.5,
      flags = {"gui-icon"},
      mipmap_count = 2
    },
    played_green =
    {
      filename = "__core__/graphics/icons/mip/played-green.png",
      size = 32,
      scale = 0.5,
      flags = {"gui-icon"},
      mipmap_count = 2
    },
    played_dark_green =
    {
      filename = "__core__/graphics/icons/mip/played-dark-green.png",
      size = 32,
      scale = 0.5,
      flags = {"gui-icon"},
      mipmap_count = 2
    },
    close =
    {
      filename = "__core__/graphics/icons/close.png",
      priority = "extra-high-no-scale",
      size = 32,
      flags = {"gui-icon"}
    },

    close_black =
    {
      filename = "__core__/graphics/icons/close.png",
      priority = "extra-high-no-scale",
      size = 32,
      flags = {"gui-icon"},
      invert_colors = true
    },
    close_map_preview =
    {
      filename = "__core__/graphics/icons/close-map-preview.png",
      priority = "extra-high-no-scale",
      size = 64,
      flags = {"gui-icon"}
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
    backward_arrow =
    {
      filename = "__core__/graphics/icons/mip/backward-arrow.png",
      priority = "extra-high-no-scale",
      size = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
    },
    backward_arrow_black =
    {
      filename = "__core__/graphics/icons/mip/backward-arrow-black.png",
      priority = "extra-high-no-scale",
      size = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
    },
    forward_arrow =
    {
      filename = "__core__/graphics/icons/mip/forward-arrow.png",
      priority = "extra-high-no-scale",
      size = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
    },
    forward_arrow_black =
    {
      filename = "__core__/graphics/icons/mip/forward-arrow-black.png",
      priority = "extra-high-no-scale",
      size = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
    },
    recipe_arrow =
    {
      filename = "__core__/graphics/icons/mip/recipe-arrow.png",
      priority = "extra-high-no-scale",
      size = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
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
      mipmap_count = 2,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
    },
    downloaded =
    {
      filename = "__core__/graphics/icons/mip/downloaded.png",
      size = 32,
      mipmap_count = 2,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
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
      filename = "__core__/graphics/icons/mip/equipment-grid-white.png",
      priority = "extra-high-no-scale",
      mipmap_count = 2,
      size = 64,
      scale = 1,
      flags = {"icon"},
      invert_colors = true
    },
    expand_dots =
    {
      filename = "__core__/graphics/icons/mip/open-panel-options-8x16-white.png",
      priority = "extra-high-no-scale",
      width = 8,
      height = 16,
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
      scale = 0.5,
      flags = {"gui-icon"},
      mipmap_count = 2
    },
    missing_mod_icon =
    {
      filename = "__core__/graphics/missing-thumbnail.png",
      size = 144,
      scale = 0.5,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
    },
    mod_dependency_arrow =
    {
      filename = "__core__/graphics/icons/mip/go-to-minibutton-arrow.png",
      priority = "extra-high-no-scale",
      size = 16,
      mipmap_count = 2,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
    },
    not_available =
    {
      filename = "__core__/graphics/icons/mip/not-available.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count =2,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
    },
    not_available_black =
    {
      filename = "__core__/graphics/icons/mip/not-available.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count =2,
      flags = {"gui-icon"},
      invert_colors = true
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
      flags = {"gui-icon"},
      load_in_minimal_mode = true
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
      flags = {"gui-icon"},
      load_in_minimal_mode = true
    },
    search =
    {
      filename = "__core__/graphics/icons/search.png",
      priority = "extra-high-no-scale",
      size = 32,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
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
      scale = 0.5,
      load_in_minimal_mode = true
    },
    trash_white =
    {
      filename = "__core__/graphics/icons/mip/trash-white.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
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
      flags = {"gui-icon"},
      load_in_minimal_mode = true
    },
    warning_white =
    {
      filename = "__core__/graphics/icons/mip/warning-white.png",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
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
    slots_view =
    {
      filename = "__core__/graphics/icons/mip/slots-view.png",
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
    },
    mouse_cursor =
    {
      filename = "__core__/graphics/mouse-cursor.png",
      size = {30, 45},
      scale = 0.5,
      flags = {"gui-icon"}
    },
    mod_category =
    {
      filename = "__core__/graphics/icons/mod-manager/cubes.png",
      size = 32,
      scale = 0.5,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
    },
    mod_last_updated =
    {
      filename = "__core__/graphics/icons/mod-manager/history.png",
      size = 32,
      scale = 0.5,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
    },
    mod_downloads_count =
    {
      filename = "__core__/graphics/icons/mod-manager/download.png",
      size = 32,
      scale = 0.5,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
    },
    status_working =
    {
      filename = "__core__/graphics/status.png",
      size = {32, 32},
      scale = 0.5,
      flags = {"gui-icon"}
    },
    status_not_working =
    {
      filename = "__core__/graphics/status.png",
      size = {32, 32},
      x = 32,
      scale = 0.5,
      flags = {"gui-icon"}
    },
    status_yellow =
    {
      filename = "__core__/graphics/status.png",
      size = {32, 32},
      x = 64,
      scale = 0.5,
      flags = {"gui-icon"}
    },
    status_blue =
    {
      filename = "__core__/graphics/status.png",
      size = {32, 32},
      x = 96,
      scale = 0.5,
      flags = {"gui-icon"}
    },
    status_inactive =
    {
      filename = "__core__/graphics/status.png",
      size = {32, 32},
      x = 128,
      scale = 0.5,
      flags = {"gui-icon"}
    },
    gradient =
    {
      filename = "__core__/graphics/gui-new.png",
      size = {1, 296},
      position = {496, 136},
      flags = {"gui-icon"}
    },
    output_console_gradient =
    {
      filename = "__core__/graphics/gui-new.png",
      size = {475, 1},
      position = {0, 1219},
      flags = {"gui-icon"}
    },
    select_icon_white =
    {
      filename = "__core__/graphics/icons/mip/select-icon.png",
      size = 40,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    select_icon_black =
    {
      filename = "__core__/graphics/icons/mip/select-icon.png",
      size = 40,
      mipmap_count = 2,
      flags = {"gui-icon"},
      invert_colors = true
    },
    notification =
    {
      filename = "__core__/graphics/icons/mip/notification.png",
      size = 20,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    alert_arrow =
    {
      filename = "__core__/graphics/arrows/alert-arrow.png",
      size = {42, 55},
      scale = 0.5,
      flags = {"gui-icon"}
    },
    pin_arrow =
    {
      filename = "__core__/graphics/arrows/pin-arrow.png",
      size = {42, 55},
      scale = 0.5,
      flags = {"gui-icon"}
    },
    pin_center =
    {
      filename = "__core__/graphics/arrows/pin-center.png",
      size = {240, 240},
      scale = 0.5,
      flags = {"gui-icon"}
    },
    technology_white =
    {
      filename = "__core__/graphics/icons/mip/technology-white.png",
      size = 64,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    sort_by_name =
    {
      filename = "__core__/graphics/icons/mip/sort-by-name.png",
      size = 32,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    sort_by_time =
    {
      filename = "__core__/graphics/icons/mip/sort-by-time.png",
      size = 32,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    bookmark =
    {
      filename = "__core__/graphics/icons/mip/bookmark.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"},
      load_in_minimal_mode = true
    },
    move_tag =
    {
      filename = "__core__/graphics/icons/mip/move-tag.png",
      priority = "high",
      size = 32,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    feedback =
    {
      filename = "__core__/graphics/icons/mip/feedback.png",
      size = 64,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    parametrise =
    {
      type = "sprite",
      filename = "__core__/graphics/icons/parametrise.png",
      priority = "extra-high-no-scale",
      size = 64,
      flags = {"gui-icon"},
      mipmap_count = 4,
      scale = 0.5
    },
    starmap_platform_moving =
    {
      type = "sprite",
      filename = "__core__/graphics/icons/starmap-platform-moving-states.png",
      priority = "extra-high-no-scale",
      size = {54, 37},
      flags = {"gui-icon"},
      scale = 0.5
    },
    starmap_platform_moving_hovered =
    {
      type = "sprite",
      filename = "__core__/graphics/icons/starmap-platform-moving-states.png",
      priority = "extra-high-no-scale",
      y = 37,
      size = {54, 37},
      flags = {"gui-icon"},
      scale = 0.5
    },
    starmap_platform_moving_clicked =
    {
      type = "sprite",
      filename = "__core__/graphics/icons/starmap-platform-moving-states.png",
      priority = "extra-high-no-scale",
      y = 74,
      size = {54, 37},
      flags = {"gui-icon"},
      scale = 0.5
    },
    starmap_platform_stopped =
    {
      type = "sprite",
      filename = "__core__/graphics/icons/starmap-platform-stopped-states.png",
      priority = "extra-high-no-scale",
      size = {54, 33},
      flags = {"gui-icon"},
      scale = 0.5
    },
    starmap_platform_stopped_hovered =
    {
      type = "sprite",
      filename = "__core__/graphics/icons/starmap-platform-stopped-states.png",
      priority = "extra-high-no-scale",
      y = 33,
      size = {54, 33},
      flags = {"gui-icon"},
      scale = 0.5
    },
    starmap_platform_stopped_clicked =
    {
      type = "sprite",
      filename = "__core__/graphics/icons/starmap-platform-stopped-states.png",
      priority = "extra-high-no-scale",
      y = 66,
      size = {54, 33},
      flags = {"gui-icon"},
      scale = 0.5
    },
    starmap_platform_stacked =
    {
      type = "sprite",
      filename = "__core__/graphics/icons/starmap-platform-stacked-states.png",
      priority = "extra-high-no-scale",
      size = {54, 54},
      flags = {"gui-icon"},
      scale = 0.5
    },
    starmap_platform_stacked_hovered =
    {
      type = "sprite",
      filename = "__core__/graphics/icons/starmap-platform-stacked-states.png",
      priority = "extra-high-no-scale",
      y = 54,
      size = {54, 54},
      flags = {"gui-icon"},
      scale = 0.5
    },
    starmap_platform_stacked_clicked =
    {
      type = "sprite",
      filename = "__core__/graphics/icons/starmap-platform-stacked-states.png",
      priority = "extra-high-no-scale",
      y = 108,
      size = {54, 54},
      flags = {"gui-icon"},
      scale = 0.5
    },
    starmap_star =
    {
      type = "sprite",
      filename = "__core__/graphics/icons/starmap-star.png",
      priority = "extra-high-no-scale",
      size = 512,
      flags = {"gui-icon"},
      scale = 0.5
    },
    controller_joycon_a = make_controller_icon("__core__/graphics/icons/controller/joycon/color/B.png"),
    controller_joycon_b = make_controller_icon("__core__/graphics/icons/controller/joycon/color/A.png"),
    controller_joycon_x = make_controller_icon("__core__/graphics/icons/controller/joycon/color/Y.png"),
    controller_joycon_y = make_controller_icon("__core__/graphics/icons/controller/joycon/color/X.png"),
    controller_joycon_back = make_controller_icon("__core__/graphics/icons/controller/joycon/color/minus.png"),
    controller_joycon_start = make_controller_icon("__core__/graphics/icons/controller/joycon/color/plus.png"),
    controller_joycon_leftstick = make_controller_icon("__core__/graphics/icons/controller/joycon/color/L-stick-press.png"),
    controller_joycon_rightstick = make_controller_icon("__core__/graphics/icons/controller/joycon/color/R-stick-press.png"),
    controller_joycon_leftshoulder = make_controller_icon("__core__/graphics/icons/controller/joycon/color/L.png"),
    controller_joycon_rightshoulder = make_controller_icon("__core__/graphics/icons/controller/joycon/color/R.png"),
    controller_joycon_dpup = make_controller_icon("__core__/graphics/icons/controller/joycon/color/dpad-up.png"),
    controller_joycon_dpdown = make_controller_icon("__core__/graphics/icons/controller/joycon/color/dpad-down.png"),
    controller_joycon_dpleft = make_controller_icon("__core__/graphics/icons/controller/joycon/color/dpad-left.png"),
    controller_joycon_dpright = make_controller_icon("__core__/graphics/icons/controller/joycon/color/dpad-right.png"),
    controller_joycon_paddle1 = make_controller_icon("__core__/graphics/icons/controller/joycon/color/SL.png"),
    controller_joycon_paddle2 = make_controller_icon("__core__/graphics/icons/controller/joycon/color/SR.png"),
    controller_joycon_paddle3 = make_controller_icon("__core__/graphics/icons/controller/joycon/color/SR.png"),
    controller_joycon_paddle4 = make_controller_icon("__core__/graphics/icons/controller/joycon/color/SL.png"),
    controller_joycon_righttrigger = make_controller_icon("__core__/graphics/icons/controller/joycon/color/ZR.png"),
    controller_joycon_lefttrigger = make_controller_icon("__core__/graphics/icons/controller/joycon/color/ZL.png"),
    controller_joycon_left_stick = make_controller_icon("__core__/graphics/icons/controller/joycon/color/L-stick.png"),
    controller_joycon_right_stick = make_controller_icon("__core__/graphics/icons/controller/joycon/color/R-stick.png"),

    controller_joycon_black_a = make_controller_icon("__core__/graphics/icons/controller/joycon/black/B.png"),
    controller_joycon_black_b = make_controller_icon("__core__/graphics/icons/controller/joycon/black/A.png"),
    controller_joycon_black_x = make_controller_icon("__core__/graphics/icons/controller/joycon/black/Y.png"),
    controller_joycon_black_y = make_controller_icon("__core__/graphics/icons/controller/joycon/black/X.png"),
    controller_joycon_black_back = make_controller_icon("__core__/graphics/icons/controller/joycon/black/minus.png"),
    controller_joycon_black_start = make_controller_icon("__core__/graphics/icons/controller/joycon/black/plus.png"),
    controller_joycon_black_leftstick = make_controller_icon("__core__/graphics/icons/controller/joycon/black/L-stick-press.png"),
    controller_joycon_black_rightstick = make_controller_icon("__core__/graphics/icons/controller/joycon/black/R-stick-press.png"),
    controller_joycon_black_leftshoulder = make_controller_icon("__core__/graphics/icons/controller/joycon/black/L.png"),
    controller_joycon_black_rightshoulder = make_controller_icon("__core__/graphics/icons/controller/joycon/black/R.png"),
    controller_joycon_black_dpup = make_controller_icon("__core__/graphics/icons/controller/joycon/black/dpad-up.png"),
    controller_joycon_black_dpdown = make_controller_icon("__core__/graphics/icons/controller/joycon/black/dpad-down.png"),
    controller_joycon_black_dpleft = make_controller_icon("__core__/graphics/icons/controller/joycon/black/dpad-left.png"),
    controller_joycon_black_dpright = make_controller_icon("__core__/graphics/icons/controller/joycon/black/dpad-right.png"),
    controller_joycon_black_paddle1 = make_controller_icon("__core__/graphics/icons/controller/joycon/black/SL.png"),
    controller_joycon_black_paddle2 = make_controller_icon("__core__/graphics/icons/controller/joycon/black/SR.png"),
    controller_joycon_black_paddle3 = make_controller_icon("__core__/graphics/icons/controller/joycon/black/SR.png"),
    controller_joycon_black_paddle4 = make_controller_icon("__core__/graphics/icons/controller/joycon/black/SL.png"),
    controller_joycon_black_righttrigger = make_controller_icon("__core__/graphics/icons/controller/joycon/black/ZR.png"),
    controller_joycon_black_lefttrigger = make_controller_icon("__core__/graphics/icons/controller/joycon/black/ZL.png"),
    controller_joycon_black_left_stick = make_controller_icon("__core__/graphics/icons/controller/joycon/black/L-stick.png"),
    controller_joycon_black_right_stick = make_controller_icon("__core__/graphics/icons/controller/joycon/black/R-stick.png"),

    controller_xbox_a = make_controller_icon("__core__/graphics/icons/controller/joycon/color/A.png"),
    controller_xbox_b = make_controller_icon("__core__/graphics/icons/controller/joycon/color/B.png"),
    controller_xbox_x = make_controller_icon("__core__/graphics/icons/controller/joycon/color/X.png"),
    controller_xbox_y = make_controller_icon("__core__/graphics/icons/controller/joycon/color/Y.png"),
    controller_xbox_back = make_controller_icon("__core__/graphics/icons/controller/xbox/color/windows.png"),
    controller_xbox_start = make_controller_icon("__core__/graphics/icons/controller/steam-deck/color/menu.png"),
    controller_xbox_leftstick = make_controller_icon("__core__/graphics/icons/controller/joycon/color/L-stick-press.png"),
    controller_xbox_rightstick = make_controller_icon("__core__/graphics/icons/controller/joycon/color/R-stick-press.png"),
    controller_xbox_leftshoulder = make_controller_icon("__core__/graphics/icons/controller/xbox/color/LB.png"),
    controller_xbox_rightshoulder = make_controller_icon("__core__/graphics/icons/controller/xbox/color/RB.png"),
    controller_xbox_dpup = make_controller_icon("__core__/graphics/icons/controller/ps/color/dpad-up.png"),
    controller_xbox_dpdown = make_controller_icon("__core__/graphics/icons/controller/ps/color/dpad-down.png"),
    controller_xbox_dpleft = make_controller_icon("__core__/graphics/icons/controller/ps/color/dpad-left.png"),
    controller_xbox_dpright = make_controller_icon("__core__/graphics/icons/controller/ps/color/dpad-right.png"),
    controller_xbox_righttrigger = make_controller_icon("__core__/graphics/icons/controller/xbox/color/RT.png"),
    controller_xbox_lefttrigger = make_controller_icon("__core__/graphics/icons/controller/xbox/color/LT.png"),
    controller_xbox_left_stick = make_controller_icon("__core__/graphics/icons/controller/joycon/color/L-stick.png"),
    controller_xbox_right_stick = make_controller_icon("__core__/graphics/icons/controller/joycon/color/R-stick.png"),

    controller_xbox_black_a = make_controller_icon("__core__/graphics/icons/controller/joycon/black/A.png"),
    controller_xbox_black_b = make_controller_icon("__core__/graphics/icons/controller/joycon/black/B.png"),
    controller_xbox_black_x = make_controller_icon("__core__/graphics/icons/controller/joycon/black/X.png"),
    controller_xbox_black_y = make_controller_icon("__core__/graphics/icons/controller/joycon/black/Y.png"),
    controller_xbox_black_back = make_controller_icon("__core__/graphics/icons/controller/xbox/black/windows.png"),
    controller_xbox_black_start = make_controller_icon("__core__/graphics/icons/controller/steam-deck/black/menu.png"),
    controller_xbox_black_leftstick = make_controller_icon("__core__/graphics/icons/controller/joycon/black/L-stick-press.png"),
    controller_xbox_black_rightstick = make_controller_icon("__core__/graphics/icons/controller/joycon/black/R-stick-press.png"),
    controller_xbox_black_leftshoulder = make_controller_icon("__core__/graphics/icons/controller/xbox/black/LB.png"),
    controller_xbox_black_rightshoulder = make_controller_icon("__core__/graphics/icons/controller/xbox/black/RB.png"),
    controller_xbox_black_dpup = make_controller_icon("__core__/graphics/icons/controller/ps/black/dpad-up.png"),
    controller_xbox_black_dpdown = make_controller_icon("__core__/graphics/icons/controller/ps/black/dpad-down.png"),
    controller_xbox_black_dpleft = make_controller_icon("__core__/graphics/icons/controller/ps/black/dpad-left.png"),
    controller_xbox_black_dpright = make_controller_icon("__core__/graphics/icons/controller/ps/black/dpad-right.png"),
    controller_xbox_black_righttrigger = make_controller_icon("__core__/graphics/icons/controller/xbox/black/RT.png"),
    controller_xbox_black_lefttrigger = make_controller_icon("__core__/graphics/icons/controller/xbox/black/LT.png"),
    controller_xbox_black_left_stick = make_controller_icon("__core__/graphics/icons/controller/joycon/black/L-stick.png"),
    controller_xbox_black_right_stick = make_controller_icon("__core__/graphics/icons/controller/joycon/black/R-stick.png"),

    controller_ps_a = make_controller_icon("__core__/graphics/icons/controller/ps/color/cross.png"),
    controller_ps_b = make_controller_icon("__core__/graphics/icons/controller/ps/color/circle.png"),
    controller_ps_x = make_controller_icon("__core__/graphics/icons/controller/ps/color/square.png"),
    controller_ps_y = make_controller_icon("__core__/graphics/icons/controller/ps/color/triangle.png"),
    controller_ps_back = make_controller_icon("__core__/graphics/icons/controller/ps/color/share.png"),
    controller_ps_start = make_controller_icon("__core__/graphics/icons/controller/ps/color/options.png"),
    controller_ps_leftstick = make_controller_icon("__core__/graphics/icons/controller/joycon/color/L-stick-press.png"),
    controller_ps_rightstick = make_controller_icon("__core__/graphics/icons/controller/joycon/color/R-stick-press.png"),
    controller_ps_leftshoulder = make_controller_icon("__core__/graphics/icons/controller/ps/color/L1.png"),
    controller_ps_rightshoulder = make_controller_icon("__core__/graphics/icons/controller/ps/color/R1.png"),
    controller_ps_dpup = make_controller_icon("__core__/graphics/icons/controller/ps/color/dpad-up.png"),
    controller_ps_dpdown = make_controller_icon("__core__/graphics/icons/controller/ps/color/dpad-down.png"),
    controller_ps_dpleft = make_controller_icon("__core__/graphics/icons/controller/ps/color/dpad-left.png"),
    controller_ps_dpright = make_controller_icon("__core__/graphics/icons/controller/ps/color/dpad-right.png"),
    controller_ps_righttrigger = make_controller_icon("__core__/graphics/icons/controller/ps/color/R2.png"),
    controller_ps_lefttrigger = make_controller_icon("__core__/graphics/icons/controller/ps/color/L2.png"),
    controller_ps_left_stick = make_controller_icon("__core__/graphics/icons/controller/joycon/color/L-stick.png"),
    controller_ps_right_stick = make_controller_icon("__core__/graphics/icons/controller/joycon/color/R-stick.png"),

    controller_ps_black_a = make_controller_icon("__core__/graphics/icons/controller/ps/black/cross.png"),
    controller_ps_black_b = make_controller_icon("__core__/graphics/icons/controller/ps/black/circle.png"),
    controller_ps_black_x = make_controller_icon("__core__/graphics/icons/controller/ps/black/square.png"),
    controller_ps_black_y = make_controller_icon("__core__/graphics/icons/controller/ps/black/triangle.png"),
    controller_ps_black_back = make_controller_icon("__core__/graphics/icons/controller/ps/black/share.png"),
    controller_ps_black_start = make_controller_icon("__core__/graphics/icons/controller/ps/black/options.png"),
    controller_ps_black_leftstick = make_controller_icon("__core__/graphics/icons/controller/joycon/black/L-stick-press.png"),
    controller_ps_black_rightstick = make_controller_icon("__core__/graphics/icons/controller/joycon/black/R-stick-press.png"),
    controller_ps_black_leftshoulder = make_controller_icon("__core__/graphics/icons/controller/ps/black/L1.png"),
    controller_ps_black_rightshoulder = make_controller_icon("__core__/graphics/icons/controller/ps/black/R1.png"),
    controller_ps_black_dpup = make_controller_icon("__core__/graphics/icons/controller/ps/black/dpad-up.png"),
    controller_ps_black_dpdown = make_controller_icon("__core__/graphics/icons/controller/ps/black/dpad-down.png"),
    controller_ps_black_dpleft = make_controller_icon("__core__/graphics/icons/controller/ps/black/dpad-left.png"),
    controller_ps_black_dpright = make_controller_icon("__core__/graphics/icons/controller/ps/black/dpad-right.png"),
    controller_ps_black_righttrigger = make_controller_icon("__core__/graphics/icons/controller/ps/black/R2.png"),
    controller_ps_black_lefttrigger = make_controller_icon("__core__/graphics/icons/controller/ps/black/L2.png"),
    controller_ps_black_left_stick = make_controller_icon("__core__/graphics/icons/controller/joycon/black/L-stick.png"),
    controller_ps_black_right_stick = make_controller_icon("__core__/graphics/icons/controller/joycon/black/R-stick.png"),

    controller_steamdeck_a = make_controller_icon("__core__/graphics/icons/controller/joycon/color/A.png"),
    controller_steamdeck_b = make_controller_icon("__core__/graphics/icons/controller/joycon/color/B.png"),
    controller_steamdeck_x = make_controller_icon("__core__/graphics/icons/controller/joycon/color/X.png"),
    controller_steamdeck_y = make_controller_icon("__core__/graphics/icons/controller/joycon/color/Y.png"),
    controller_steamdeck_back = make_controller_icon("__core__/graphics/icons/controller/steam-deck/color/square.png"),
    controller_steamdeck_start = make_controller_icon("__core__/graphics/icons/controller/steam-deck/color/menu.png"),
    controller_steamdeck_leftstick = make_controller_icon("__core__/graphics/icons/controller/joycon/color/L-stick-press.png"),
    controller_steamdeck_rightstick = make_controller_icon("__core__/graphics/icons/controller/joycon/color/R-stick-press.png"),
    controller_steamdeck_leftshoulder = make_controller_icon("__core__/graphics/icons/controller/steam-deck/color/L1.png"),
    controller_steamdeck_rightshoulder = make_controller_icon("__core__/graphics/icons/controller/steam-deck/color/R1.png"),
    controller_steamdeck_dpup = make_controller_icon("__core__/graphics/icons/controller/ps/color/dpad-up.png"),
    controller_steamdeck_dpdown = make_controller_icon("__core__/graphics/icons/controller/ps/color/dpad-down.png"),
    controller_steamdeck_dpleft = make_controller_icon("__core__/graphics/icons/controller/ps/color/dpad-left.png"),
    controller_steamdeck_dpright = make_controller_icon("__core__/graphics/icons/controller/ps/color/dpad-right.png"),
    controller_steamdeck_paddle1 = make_controller_icon("__core__/graphics/icons/controller/steam-deck/color/L4.png"),
    controller_steamdeck_paddle2 = make_controller_icon("__core__/graphics/icons/controller/steam-deck/color/R4.png"),
    controller_steamdeck_paddle3 = make_controller_icon("__core__/graphics/icons/controller/steam-deck/color/L5.png"),
    controller_steamdeck_paddle4 = make_controller_icon("__core__/graphics/icons/controller/steam-deck/color/R5.png"),
    controller_steamdeck_righttrigger = make_controller_icon("__core__/graphics/icons/controller/steam-deck/color/R2.png"),
    controller_steamdeck_lefttrigger = make_controller_icon("__core__/graphics/icons/controller/steam-deck/color/L2.png"),
    controller_steamdeck_left_stick = make_controller_icon("__core__/graphics/icons/controller/joycon/color/L-stick.png"),
    controller_steamdeck_right_stick = make_controller_icon("__core__/graphics/icons/controller/joycon/color/R-stick.png"),

    controller_steamdeck_black_a = make_controller_icon("__core__/graphics/icons/controller/joycon/black/A.png"),
    controller_steamdeck_black_b = make_controller_icon("__core__/graphics/icons/controller/joycon/black/B.png"),
    controller_steamdeck_black_x = make_controller_icon("__core__/graphics/icons/controller/joycon/black/X.png"),
    controller_steamdeck_black_y = make_controller_icon("__core__/graphics/icons/controller/joycon/black/Y.png"),
    controller_steamdeck_black_back = make_controller_icon("__core__/graphics/icons/controller/steam-deck/black/square.png"),
    controller_steamdeck_black_start = make_controller_icon("__core__/graphics/icons/controller/steam-deck/black/menu.png"),
    controller_steamdeck_black_leftstick = make_controller_icon("__core__/graphics/icons/controller/joycon/black/L-stick-press.png"),
    controller_steamdeck_black_rightstick = make_controller_icon("__core__/graphics/icons/controller/joycon/black/R-stick-press.png"),
    controller_steamdeck_black_leftshoulder = make_controller_icon("__core__/graphics/icons/controller/steam-deck/black/L1.png"),
    controller_steamdeck_black_rightshoulder = make_controller_icon("__core__/graphics/icons/controller/steam-deck/black/R1.png"),
    controller_steamdeck_black_dpup = make_controller_icon("__core__/graphics/icons/controller/ps/black/dpad-up.png"),
    controller_steamdeck_black_dpdown = make_controller_icon("__core__/graphics/icons/controller/ps/black/dpad-down.png"),
    controller_steamdeck_black_dpleft = make_controller_icon("__core__/graphics/icons/controller/ps/black/dpad-left.png"),
    controller_steamdeck_black_dpright = make_controller_icon("__core__/graphics/icons/controller/ps/black/dpad-right.png"),
    controller_steamdeck_black_paddle1 = make_controller_icon("__core__/graphics/icons/controller/steam-deck/black/L4.png"),
    controller_steamdeck_black_paddle2 = make_controller_icon("__core__/graphics/icons/controller/steam-deck/black/R4.png"),
    controller_steamdeck_black_paddle3 = make_controller_icon("__core__/graphics/icons/controller/steam-deck/black/L5.png"),
    controller_steamdeck_black_paddle4 = make_controller_icon("__core__/graphics/icons/controller/steam-deck/black/R5.png"),
    controller_steamdeck_black_righttrigger = make_controller_icon("__core__/graphics/icons/controller/steam-deck/black/R2.png"),
    controller_steamdeck_black_lefttrigger = make_controller_icon("__core__/graphics/icons/controller/steam-deck/black/L2.png"),
    controller_steamdeck_black_left_stick = make_controller_icon("__core__/graphics/icons/controller/joycon/black/L-stick.png"),
    controller_steamdeck_black_right_stick = make_controller_icon("__core__/graphics/icons/controller/joycon/black/R-stick.png"),

  }
})

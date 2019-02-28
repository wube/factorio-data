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
    flags = {"icon"}
  }
end

data:extend(
{
  {
    type = "sprite",
    name = "info",
    filename = "__core__/graphics/icons/info-blue.png",
    priority = "extra-high-no-scale",
    width = 16,
    height = 40,
    flags = {"no-crop"},
    scale = 0.5
  },
  {
    type = "sprite",
    name = "restart_required",
    filename = "__core__/graphics/icons/needs-restart.png",
    priority = "extra-high-no-scale",
    width = 16,
    height = 40,
    flags = {"no-crop"},
    scale = 0.5
  },
  {
    type = "sprite",
    name = "developer",
    filename = "__core__/graphics/icons/developer.png",
    priority = "extra-high-no-scale",
    width = 16,
    height = 40,
    flags = {"no-crop"},
    scale = 0.5
  },
  {
    type = "sprite",
    name = "quantity-time",
    filename = "__core__/graphics/icons/quantity-time.png",
    priority = "extra-high-no-scale",
    width = 28,
    height = 40,
    flags = {"no-crop"},
    scale = 0.5
  },
  {
    type = "sprite",
    name = "quantity-multiplier",
    filename = "__core__/graphics/icons/quantity-multiplier.png",
    priority = "extra-high-no-scale",
    width = 20,
    height = 40,
    flags = {"no-crop"},
    scale = 0.5
  },
  {
    type = "sprite",
    name = "infinity",
    filename = "__core__/graphics/icons/infinity.png",
    priority = "extra-high-no-scale",
    width = 24,
    height = 32,
    flags = {"no-crop", "icon"},
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
    remove =
    {
      filename = "__core__/graphics/remove-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    play =
    {
      filename = "__core__/graphics/icons/play.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    pause =
    {
      filename = "__core__/graphics/icons/pause.png",
      priority = "medium",
      width = 128,
      height = 128,
      flags = {"icon"}
    },
    stop =
    {
      filename = "__core__/graphics/icons/stop.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    speed_down =
    {
      filename = "__core__/graphics/speed-down.png",
      priority = "medium",
      width = 128,
      height = 128,
      flags = {"icon"}
    },
    speed_up =
    {
      filename = "__core__/graphics/speed-up.png",
      priority = "medium",
      width = 128,
      height = 128,
      flags = {"icon"}
    },
    editor_speed_down =
    {
      filename = "__core__/graphics/editor-speed-down-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    editor_pause =
    {
      filename = "__core__/graphics/editor-pause-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    editor_play =
    {
      filename = "__core__/graphics/editor-play-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    editor_speed_up =
    {
      filename = "__core__/graphics/editor-speed-up-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    tick_once =
    {
      filename = "__core__/graphics/editor-tick-once-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    tick_sixty =
    {
      filename = "__core__/graphics/editor-tick-sixty-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    tick_custom =
    {
      filename = "__core__/graphics/editor-tick-custom-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    clear =
    {
      filename = "__core__/graphics/clear.png",
      priority = "medium",
      width = 128,
      height = 128,
      flags = {"icon"}
    },
    search_icon =
    {
      filename = "__core__/graphics/icons/search.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
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
      filename = "__core__/graphics/electricity-icon-red.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    fuel_icon =
    {
      filename = "__core__/graphics/fuel-icon-red.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    ammo_icon =
    {
      filename = "__core__/graphics/ammo-icon-red.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    fluid_icon =
    {
      filename = "__core__/graphics/fluid-icon-red.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    warning_icon =
    {
      filename = "__core__/graphics/warning-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    too_far_from_roboport_icon =
    {
      filename = "__core__/graphics/too-far-from-roboport-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    danger_icon =
    {
      filename = "__core__/graphics/danger-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    destroyed_icon =
    {
      filename = "__core__/graphics/destroyed-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    recharge_icon =
    {
      filename = "__core__/graphics/recharge-icon.png",
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
      filename = "__core__/graphics/not-enough-repair-packs-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    not_enough_construction_robots_icon =
    {
      filename = "__core__/graphics/not-enough-construction-robots-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    no_building_material_icon =
    {
      filename = "__core__/graphics/no-building-material-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    no_storage_space_icon =
    {
      filename = "__core__/graphics/no-storage-space-icon.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    electricity_icon_unplugged =
    {
      filename = "__core__/graphics/electricity-icon-unplugged.png",
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
      width = 32,
      height = 32,
      flags = {"icon"}
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
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    slot_icon_armor =
    {
      filename = "__core__/graphics/slot-icon-armor.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    slot_icon_blueprint =
    {
      filename = "__core__/graphics/slot-icon-blueprint.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    slot_icon_gun =
    {
      filename = "__core__/graphics/slot-icon-gun.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    slot_icon_ammo =
    {
      filename = "__core__/graphics/slot-icon-ammo.png",
      priority = "medium",
      width = 32,
      height = 32,
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
      width = 32,
      height = 32,
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
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    slot_icon_robot_material =
    {
      filename = "__core__/graphics/slot-icon-robot-material.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    slot_icon_upgrade =
    {
      filename = "__core__/graphics/slot-icon-upgrade.png",
      priority = "medium",
      width = 32,
      height = 32,
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
      filename = "__core__/graphics/gui.png",
      priority = "medium",
      width = 32,
      height = 32,
      x = 43,
      y = 77,
      flags = {"icon"},
      scale = 1
    },
    equipment_collision =
    {
      filename = "__core__/graphics/gui.png",
      priority = "medium",
      width = 32,
      height = 32,
      x = 43,
      y = 109,
      flags = {"icon"},
      scale = 1
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
      filename = "__core__/graphics/confirm.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    export_slot =
    {
      filename = "__core__/graphics/export.png",
      priority = "medium",
      width = 64,
      height = 64,
      flag = {"icon"}
    },
    import_slot =
    {
      filename = "__core__/graphics/import.png",
      priority = "medium",
      width = 64,
      height = 64,
      flag = {"icon"}
    },
    tile_editor_icon =
    {
      filename = "__core__/graphics/tile-editor-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    clone_editor_icon =
    {
      filename = "__core__/graphics/clone-editor-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    scripting_editor_icon=
    {
      filename = "__core__/graphics/scripting-editor-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    decorative_editor_icon =
    {
      filename = "__core__/graphics/decorative-editor-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    resource_editor_icon =
    {
      filename = "__core__/graphics/resource-editor-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
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
      filename = "__core__/graphics/none-editor-icon.png",
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
      filename = "__core__/graphics/surface-editor-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
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
      filename = "__core__/graphics/cliff-editor-icon.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    paint_bucket_icon =
    {
      filename = "__core__/graphics/paint-bucket-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    brush_icon =
    {
      filename = "__core__/graphics/brush-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    spray_icon =
    {
      filename = "__core__/graphics/spray-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    cursor_icon =
    {
      filename = "__core__/graphics/cursor-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    area_icon =
    {
      filename = "__core__/graphics/area-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    line_icon =
    {
      filename = "__core__/graphics/line-icon.png",
      priority = "medium",
      width = 64,
      height = 64,
      flags = {"icon"}
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
      filename = "__core__/graphics/brush-square-shape.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    brush_circle_shape =
    {
      filename = "__core__/graphics/brush-circle-shape.png",
      priority = "medium",
      width = 32,
      height = 32,
      flags = {"icon"}
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
    side_menu_menu_icon =
    {
      filename = "__core__/graphics/side-menu-icons.png",
      priority = "high",
      width = 64,
      height = 64,
      y = data.is_demo and 384 or 0,
      flags = {"icon"}
    },
    side_menu_production_icon =
    {
      filename = "__core__/graphics/side-menu-icons.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 0,
      y = 64,
      flags = {"icon"}
    },
    side_menu_bonus_icon =
    {
      filename = "__core__/graphics/side-menu-icons.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 0,
      y = 128,
      flags = {"icon"}
    },
    side_menu_map_icon =
    {
      filename = "__core__/graphics/side-menu-icons.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 0,
      y = data.is_demo and 448 or 192,
      flags = {"icon"}
    },
    side_menu_tutorials_icon =
    {
      filename = "__core__/graphics/side-menu-icons.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 0,
      y = 192,
      flags = {"icon"}
    },
    side_menu_train_icon =
    {
      filename = "__core__/graphics/side-menu-icons.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 0,
      y = 256,
      flags = {"icon"}
    },
    side_menu_achievements_icon =
    {
      filename = "__core__/graphics/side-menu-icons.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 0,
      y = 320,
      flags = {"icon"}
    },
    side_menu_menu_hover_icon =
    {
      filename = "__core__/graphics/side-menu-icons.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      y = data.is_demo and 384 or 0,
      flags = {"icon"}
    },
    side_menu_production_hover_icon =
    {
      filename = "__core__/graphics/side-menu-icons.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      y = 64,
      flags = {"icon"}
    },
    side_menu_bonus_hover_icon =
    {
      filename = "__core__/graphics/side-menu-icons.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      y = 128,
      flags = {"icon"}
    },
    side_menu_map_hover_icon =
    {
      filename = "__core__/graphics/side-menu-icons.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      y = data.is_demo and 448 or 192,
      flags = {"icon"}
    },
    side_menu_train_hover_icon =
    {
      filename = "__core__/graphics/side-menu-icons.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      y = 256,
      flags = {"icon"}
    },
    side_menu_achievements_hover_icon =
    {
      filename = "__core__/graphics/side-menu-icons.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      y = 320,
      flags = {"icon"}
    },
    circuit_network_panel =
    {
      filename = "__core__/graphics/circuit-network-panel.png",
      priority = "high",
      width = 16,
      height = 16,
      flags = {"icon"}
    },
    logistic_network_panel =
    {
      filename = "__core__/graphics/logistic-network-panel.png",
      priority = "high",
      width = 16,
      height = 16,
      flags = {"icon"}
    },
    electric_network_info =
    {
      filename = "__core__/graphics/electric-network-info.png",
      priority = "high",
      width = 16,
      height = 16,
      flags = {"icon"}
    },
    rename_icon_small =
    {
      filename = "__core__/graphics/rename-small.png",
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
      width = 64,
      height = 64,
      scale = 0.5
    },
    fluid_indication_arrow =
    {
      filename = "__core__/graphics/arrows/fluid-indication-arrow.png",
      priority = "extra-high-no-scale",
      width = 48,
      height = 48,
      scale = 0.5
    },
    fluid_indication_arrow_both_ways =
    {
      filename = "__core__/graphics/arrows/fluid-indication-arrow-both-ways.png",
      priority = "extra-high-no-scale",
      width = 48,
      height = 48,
      scale = 0.5
    },
    heat_exchange_indication =
    {
      filename = "__core__/graphics/arrows/heat-exchange-indication.png",
      priority = "extra-high-no-scale",
      width = 48,
      height = 48,
      scale = 0.5
    },
    rail_planner_indication_arrow =
    {
      filename = "__core__/graphics/arrows/rail-planner-indication-arrow.png",
      priority = "extra-high-no-scale",
      width = 82,
      height = 44,
      scale = 0.5
    },
    rail_planner_indication_arrow_too_far =
    {
      filename = "__core__/graphics/arrows/rail-planner-indication-arrow-too-far.png",
      priority = "extra-high-no-scale",
      width = 82,
      height = 44,
      scale = 0.5
    },
    indication_line =
    {
      filename = "__core__/graphics/arrows/indication-line.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      scale = 0.5
    },
    short_indication_line =
    {
      filename = "__core__/graphics/arrows/short-indication-line.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      scale = 0.5
    },
    rail_signal_placement_indicator =
    {
      filename = "__core__/graphics/rail-placement-indicators.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      scale = 0.5
    },
    train_stop_placement_indicator =
    {
      filename = "__core__/graphics/rail-placement-indicators.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    placement_indicator_leg =
    {
      filename = "__core__/graphics/rail-placement-indicators.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      x = 128,
      scale = 0.5
    },
    grey_rail_signal_placement_indicator =
    {
      filename = "__core__/graphics/rail-placement-indicators.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      y = 64,
      scale = 0.5
    },
    grey_placement_indicator_leg =
    {
      filename = "__core__/graphics/rail-placement-indicators.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      x = 128,
      y = 64,
      scale = 0.5
    },
    battery_indicator =
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
    show_logistics_network_in_map_view =
    {
      filename = "__core__/graphics/show-logistics-network-in-map-view.png",
      priority = "extra-high-no-scale",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    show_electric_network_in_map_view =
    {
      filename = "__core__/graphics/show-electric-network-in-map-view.png",
      priority = "extra-high-no-scale",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    show_turret_range_in_map_view =
    {
      filename = "__core__/graphics/show-turret-range-in-map-view.png",
      priority = "extra-high-no-scale",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    show_pollution_in_map_view =
    {
      filename = "__core__/graphics/show-pollution-in-map-view.png",
      priority = "extra-high-no-scale",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    show_train_station_names_in_map_view =
    {
      filename = "__core__/graphics/show-train-station-names-in-map-view.png",
      priority = "extra-high-no-scale",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    show_player_names_in_map_view =
    {
      filename = "__core__/graphics/show-player-names-in-map-view.png",
      priority = "extra-high-no-scale",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    train_stop_in_map_view =
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
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    underground_remove_pipes =
    {
      filename = "__core__/graphics/arrows/underground-lines-remove.png",
      priority = "high",
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

    expand =
    {
      filename = "__core__/graphics/icons/expand.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      flags = {"icon"}
    },

    expand_dark =
    {
      filename = "__core__/graphics/icons/expand-dark.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      flags = {"icon"}
    },

    collapse =
    {
      filename = "__core__/graphics/icons/collapse.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      flags = {"icon"}
    },

    collapse_dark =
    {
      filename = "__core__/graphics/icons/collapse-dark.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      flags = {"icon"}
    },

    ----- new icons

    close_white =
    {
      filename = "__core__/graphics/icons/close-white.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    close_black =
    {
      filename = "__core__/graphics/icons/close-black.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    close_fat =
    {
      filename = "__core__/graphics/icons/close-fat.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    dropdown =
    {
      filename = "__core__/graphics/icons/dropdown.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    expand_dots =
    {
      filename = "__core__/graphics/icons/open-panel-options-8x16.png",
      priority = "extra-high-no-scale",
      width = 8,
      height = 16,
      scale = 1,
      flags = {"icon"}
    },
    expand_dots_white =
    {
      filename = "__core__/graphics/icons/open-panel-options-8x16-white.png",
      priority = "extra-high-no-scale",
      width = 8,
      height = 16,
      scale = 1,
      flags = {"icon"}
    },
    export =
    {
      filename = "__core__/graphics/icons/export.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    import =
    {
      filename = "__core__/graphics/icons/import.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    map_exchange_string =
    {
      filename = "__core__/graphics/icons/map-exchange-string.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    preset =
    {
      filename = "__core__/graphics/icons/preset.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    refresh =
    {
      filename = "__core__/graphics/icons/refresh.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    reset =
    {
      filename = "__core__/graphics/icons/reset.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    reset_white =
    {
      filename = "__core__/graphics/icons/reset-white.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    shuffle =
    {
      filename = "__core__/graphics/icons/shuffle.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    sync_mods =
    {
      filename = "__core__/graphics/icons/sync-mods.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    trash =
    {
      filename = "__core__/graphics/icons/trash.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    trash_white =
    {
      filename = "__core__/graphics/icons/trash-white.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    warning =
    {
      filename = "__core__/graphics/icons/warning.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    color_picker =
    {
      filename = "__core__/graphics/icons/color-picker.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    map =
    {
      filename = "__core__/graphics/icons/map.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    center =
    {
      filename = "__core__/graphics/icons/center.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    station_name =
    {
      filename = "__core__/graphics/icons/station-name.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    not_available =
    {
      filename = "__core__/graphics/icons/not-available.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 1,
      flags = {"icon"}
    },
    mod_dependency_arrow =
    {
      filename = "__core__/graphics/icons/go-to-minibutton-arrow.png",
      priority = "extra-high-no-scale",
      size = 16,
      flags = {"icon"}
    },
    missing_mod_icon =
    {
      filename = "__core__/graphics/missing-thumbnail.png",
      size = 144,
      scale = 0.5,
      flags = {"icon"}
    },
    warning_white =
    {
      filename = "__core__/graphics/icons/warning-white.png",
      size = 32,
      scale = 0.5,
      flags = {"icon"}
    },
    check_mark_white =
    {
      filename = "__core__/graphics/icons/check-mark-white.png",
      size = 32,
      scale = 0.5,
      flags = {"icon"}
    },
    downloading =
    {
      filename = "__core__/graphics/icons/downloading.png",
      size = 32,
      scale = 0.5,
      flags = {"icon"}
    },
    downloading_white =
    {
      filename = "__core__/graphics/icons/downloading-white.png",
      size = 32,
      scale = 0.5,
      flags = {"icon"}
    },
    downloaded =
    {
      filename = "__core__/graphics/icons/downloaded.png",
      size = 32,
      scale = 0.5,
      flags = {"icon"}
    },
    downloaded_white =
    {
      filename = "__core__/graphics/icons/downloaded-white.png",
      size = 32,
      scale = 0.5,
      flags = {"icon"}
    }
  }
})

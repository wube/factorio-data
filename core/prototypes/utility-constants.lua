require ("bonus-gui-ordering")

function premultiply_alpha(color)
 return {r = color.r * color.a, g = color.g * color.a, b = color.b * color.a, a = color.a}
end

data:extend(
{
  {
    type = "utility-constants",
    name = "default",

    clipboard_history_size = 20,
    entity_button_background_color = {r = 0.6, g =  0.6, b = 0.6, a = 0.6},
    building_buildable_too_far_tint = {r = 0.6, g = 0.6, b = 0.3, a = 0.1},
    building_buildable_tint = {r = 0.4, g = 1, b = 0.4, a = 1},
    building_not_buildable_tint = {r = 1, g = 0.4, b = 0.4, a = 1},
    building_ignorable_tint = {r = 0.4, g = 0.4, b = 1, a = 1},
    building_no_tint = {r = 1, g = 1, b = 1, a = 1},
    ghost_tint = {r = 0.6, g = 0.6, b = 0.6, a = 0.3},
    tile_ghost_tint = {r = 0.8, g = 0.8, b = 0.8, a = 0.4},
    equipment_default_background_color = premultiply_alpha{ r = 200 / 255, g = 200 / 255, b = 200 / 255, a = 0.3 },
    equipment_default_background_border_color = { r = 36 / 255, g = 35 / 255, b = 36 / 255 },
    equipment_default_grabbed_background_color = premultiply_alpha{ r = 1, g = 1, b = 1, a = 0.3 },
    turret_range_visualization_color = { r = 0.05, g = 0.1, b = 0.05, a = 0.15 },
    capsule_range_visualization_color = { r = 0.05, g = 0.1, b = 0.05, a = 0.15 },
    artillery_range_visualization_color = { r = 0.12, g = 0.0375, b = 0.0375, a = 0.15 },
    chart =
    {
      electric_lines_color = {r = 0, g = 212, b = 255, a = 255},
      electric_lines_color_switch_enabled = {r = 0, g = 255, b = 0, a = 255},
      electric_lines_color_switch_disabled = {r = 255, g = 0, b = 0, a = 255},
      electric_power_pole_color = {r = 0, g = 158, b = 163, a = 255},
      switch_color = {r = 60, g = 0, b = 160, a = 255},
      electric_line_width = 1.5,
      electric_line_minimum_absolute_width = 2,
      turret_range_color = {r = 0.8, g = 0.25, b = 0.25, a = 1},
      artillery_range_color = {r = 0.8, g = 0.25, b = 0.25, a = 1},
      default_friendly_color = {r = 0, g = 0.38, b = 0.57},
      default_enemy_color = {r = 1, g = 0.1, b = 0.1},
      rail_color = {r = 0.55, g = 0.55, b = 0.55},
      entity_ghost_color = {r = 0.57, g = 0.38, b = 0.57},
      default_friendly_color_by_type =
      {
        ["ammo-turret"] = {r = 202, g = 167, b = 24},
        ["electric-turret"] = {r = 0.85, g = 0.18, b = 0.18},
        ["fluid-turret"] = {r = 0.92, g = 0.46, b = 0.1},
        ["transport-belt"] = {r = 0.8, g = 0.63, b = 0.28},
        ["splitter"] = {r = 1, g = 0.82, b = 0},
        ["underground-belt"] = {r = 0.44, g = 0.36, b = 0},
        ["solar-panel"] = {r = 0.12, g = 0.13, b = 0.14},
        ["accumulator"] = {r = 0.48, g = 0.48, b = 0.48},
        ["wall"] = {r = 0.8, g = 0.85, b = 0.8},
        ["gate"] = {r = 0.5, g = 0.5, b = 0.5},
        ["heat-pipe"] = {r = 58, g = 130, b = 172},
        ["pipe"] = {r = 69, g = 130, b = 165},
        ["pipe-to-ground"] = {r = 25, g = 103, b = 150},
        ["pump"] = {r = 109, g = 154, b = 181},
        ["storage-tank"] = {r = 131, g = 166, b = 188},
        ["beacon"] = {r = 7, g = 68, b = 104},
        ["generator"] = {r = 0, g = 127, b = 160},
        ["roboport"] = {r = 211, g = 207, b = 136}
      },
      default_color_by_type =
      {
        ["tree"] = {r = 0.19, g = 0.39, b = 0.19, a = 0.40},
      },
      chart_train_stop_text_color = {r = 1, g = 1, b = 1},
      chart_train_stop_disabled_text_color = {r = 0.9,  g = 0.2, b = 0.2},
      vehicle_outer_color = {r = 1, g = 0.1, b = 0.1},
      vehicle_outer_color_selected = {r = 1, g = 1, b = 1},
      vehicle_inner_color = {r = 0.9, g = 0.9, b = 0.9},
      vehicle_wagon_connection_color = { r = 1, g = 0.1, b = 0.1 },
      resource_outline_selection_color = {r = 1, g = 1, b = 1},
      custom_tag_scale = 0.6*30/32,
      custom_tag_selected_overlay_tint = { r = 1, g = 1, b = 1, a = 0},
      red_signal_color = { r = 1, g = 0, b = 0 },
      green_signal_color = { r = 0, g = 1, b = 0 },
      blue_signal_color = { r = 0, g = 0, b = 1 },
      yellow_signal_color = { r = 1, g = 1, b = 0 },
      explosion_visualization_duration = 48,
      train_path_color = { r = 1, g = 1, b = 1 },
      train_preview_path_outline_color = { r = 0, g = 1, b = 0 },
      train_current_path_outline_color ={ r = 1, g = 0, b = 0 }
    },
    default_player_force_color = { r = 0.869, g = 0.5, b = 0.130, a = 0.5 },
    default_enemy_force_color = { r = 0.815, g = 0.024, b = 0.0, a = 0.5 },
    default_other_force_color = { r = 0.2, g = 0.2, b = 0.2 },
    deconstruct_mark_tint = { r = 0.65, g = 0.65, b = 0.65, a = 0.65 },

    zoom_to_world_can_use_nightvision = false,
    zoom_to_world_effect_strength = 0.05,
    max_terrain_building_size = 255, -- the min of this or the player build reach is used
    small_area_size = 1.5, -- less than this plays the 'small' sound variants
    medium_area_size = 6.5, -- less than this plays the 'medium' sound variants, larger and equal plays the 'big' sound variants.
    rail_segment_colors =
    {
      { r = 0   , g = 1    , b = 1   },
      { r = 1   , g = 0    , b = 1   },
      { r = 1   , g = 1    , b = 0   },
      { r = 0.1 , g = 0.1  , b = 0.7 },
      { r = 1   , g = 1    , b = 1   },
      { r = 0.1 , g = 0.1  , b = 0.1 },
      { r = 0.2 , g = 0.7  , b = 0.7 },
    },
    player_colors =
    {
      { name = "default", player_color = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 }, chat_color = { r = 1.000, g = 0.630, b = 0.259 } },
      { name = "red"    , player_color = { r = 0.815, g = 0.024, b = 0.0  , a = 0.5 }, chat_color = { r = 1.000, g = 0.166, b = 0.141 } },
      { name = "green"  , player_color = { r = 0.093, g = 0.768, b = 0.172, a = 0.5 }, chat_color = { r = 0.173, g = 0.824, b = 0.250 } },
      { name = "blue"   , player_color = { r = 0.155, g = 0.540, b = 0.898, a = 0.5 }, chat_color = { r = 0.343, g = 0.683, b = 1.000 } },
      { name = "orange" , player_color = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 }, chat_color = { r = 1.000, g = 0.630, b = 0.259 } },
      { name = "yellow" , player_color = { r = 0.835, g = 0.666, b = 0.077, a = 0.5 }, chat_color = { r = 1.000, g = 0.828, b = 0.231 } },
      { name = "pink"   , player_color = { r = 0.929, g = 0.386, b = 0.514, a = 0.5 }, chat_color = { r = 1.000, g = 0.520, b = 0.633 } },
      { name = "purple" , player_color = { r = 0.485, g = 0.111, b = 0.659, a = 0.5 }, chat_color = { r = 0.821, g = 0.440, b = 0.998 } },
      { name = "white"  , player_color = { r = 0.8  , g = 0.8  , b = 0.8  , a = 0.5 }, chat_color = { r = 0.9  , g = 0.9  , b = 0.9   } },
      { name = "black"  , player_color = { r = 0.1  , g = 0.1  , b = 0.1,   a = 0.5 }, chat_color = { r = 0.5  , g = 0.5  , b = 0.5   } },
      { name = "gray"   , player_color = { r = 0.4  , g = 0.4  , b = 0.4,   a = 0.5 }, chat_color = { r = 0.7  , g = 0.7  , b = 0.7   } },
      { name = "brown"  , player_color = { r = 0.300, g = 0.117, b = 0.0,   a = 0.5 }, chat_color = { r = 0.757, g = 0.522, b = 0.371 } },
      { name = "cyan"   , player_color = { r = 0.275, g = 0.755, b = 0.712, a = 0.5 }, chat_color = { r = 0.335, g = 0.918, b = 0.866 } },
      { name = "acid"   , player_color = { r = 0.559, g = 0.761, b = 0.157, a = 0.5 }, chat_color = { r = 0.708, g = 0.996, b = 0.134 } }
    },
    train_path_finding =
    {
      train_stop_penalty = 2000,
      stopped_manually_controlled_train_penalty = 2000,
      stopped_manually_controlled_train_without_passenger_penalty = 7000,
      signal_reserved_by_circuit_network_penalty = 1000,
      train_in_station_penalty = 500,
      train_in_station_with_no_other_valid_stops_in_schedule = 1000,
      train_arriving_to_station_penalty = 100,
      train_arriving_to_signal_penalty = 100,
      train_waiting_at_signal_penalty = 100,
      train_waiting_at_signal_tick_multiplier_penalty = 0.1,
      train_with_no_path_penalty = 1000
    },
    server_command_console_chat_color = { r = 0.75, g = 0.75, b = 0.75, a = 1 },
    script_command_console_chat_color = { r = 0.75, g = 0.75, b = 0.75, a = 1 },
    enabled_recipe_slot_tint = {r = 1, g = 1, b = 1},
    disabled_recipe_slot_tint = { r = 0.7, g = 0.7, b = 0.7, a = 0.7 },
    disabled_recipe_slot_background_tint = { r = 0.7, g = 0.7, b = 0.7, a = 1 },
    forced_enabled_recipe_slot_background_tint = { r = 0.70, g = 0.7, b = 0.0, a = 0.8 },

    default_alert_icon_scale = 0.5,
    default_alert_icon_scale_by_type = {},

    item_outline_color = { 0, 0, 0, 1 },
    item_outline_radius = 16,
    item_outline_inset = 0,
    item_outline_sharpness = 0,
    filter_outline_color = { 0, 0, 0, 1 },

    icon_shadow_radius = 17.248,
    icon_shadow_inset = 9.888,
    icon_shadow_sharpness = 0,
    icon_shadow_color = { a = 1 },

    bonus_gui_ordering = bonus_gui_ordering,

    map_editor =
    {
      clone_editor_copy_source_color = { r = 0, g = 1, b = 0 },
      clone_editor_copy_destination_allowed_color = { r = 1, g = 1, b = 1 },
      clone_editor_copy_destination_not_allowed_color = { r = 1, g = 0, b = 0 },
      clone_editor_brush_source_color = { r = 1, g = 1, b = 0 },
      clone_editor_brush_destination_color = { r = 0, g = 1, b = 0 },
      clone_editor_brush_cursor_preview_tint = {r = 0.8, g = 0.8, b = 0.8, a = 0.9},
      clone_editor_brush_world_preview_tint = {r = 0.8, g = 0.8, b = 0.8, a = 0.4},
      script_editor_select_area_color = { r = 1, g = 1, b = 1 },
      script_editor_drag_area_color = { r = 1, g = 1, b = 1, a = 0.5 },
      force_editor_select_area_color = { r = 0, g = 1, b = 0 },
      cliff_editor_remove_cliffs_color = { r = 1, g = 0, b = 0 },
      tile_editor_area_selection_color = { r = 0, g = 1, b = 0 },
      tile_editor_selection_preview_tint = { r = 0.15, g = 0.15, b = 0.15, a = 0.15 },
      tile_editor_selection_preview_radius = 6,
      decorative_editor_selection_preview_tint = { r = 0.25, g = 0.25, b = 0.25, a = 0.25 },
      decorative_editor_selection_preview_radius = 10
    },

    default_trigger_target_mask_by_type =
    {
      ["character"] = { "common", "ground-unit" },
      ["car"] = { "common", "ground-unit" },
      ["unit"] = { "common", "ground-unit" }
    },

    recipe_step_limit = 50000, -- number of steps before calculating total-raw/times-can-be-crafted is aborted for a given recipe
    manual_rail_building_reach_modifier = 3,
    train_temporary_stop_wait_time =  60 * 5,
    train_time_wait_condition_default = 60 * 30,
    train_inactivity_wait_condition_default = 60 * 5,

    unit_group_pathfind_resolution = 0,
    unit_group_max_pursue_distance = 50,

    -- we render a bit more to compensate for electric poles, shadows, decoratives and tall entities
    -- with decoratives being most demanding on that, using them as heuristic
    entity_renderer_search_box_limits =
    {
      left = 6, -- to compensate for shadows
      top = 3,
      right = 3,
      bottom = 4 -- to compensate for tall entities like electric poles
    },

    light_renderer_search_distance_limit = 15,

    tree_leaf_distortion_strength_far = { 0.46, 0.47 },
    tree_leaf_distortion_distortion_far = { 7.6, 9.1 },
    tree_leaf_distortion_speed_far = { 4.31, 6.1 },
    tree_leaf_distortion_strength_near = { 0.15, 0.12 },
    tree_leaf_distortion_distortion_near = { 7.5, 15.6 },
    tree_leaf_distortion_speed_near = { 2.25, 2.25 },
    tree_shadow_roughness = 1.01,
    tree_shadow_speed = 0.93,

    missing_preview_sprite_location = "__core__/graphics/missing-preview.png",
    main_menu_background_image_location = "__core__/graphics/background-image.jpg",

    default_scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000},

    color_filters =
    {
      -- matrices based on http://blog.noblemaster.com/wp-content/uploads/2013/10/2013-10-26-ColorCorrection.txt
      -- which was based on http://tylerdavidhoward.com/thesis/

      -- Matrices are row-major, of course.
      {
        name = "protanopia",
        localised_name = {"gui-graphics-settings.color-filter-protanopia"},
        matrix =
        {
          {  1.1701, -0.2554,  0.0438,  0.0000 },
          {  0.1313,  0.8029,  0.0338,  0.0000 },
          {  0.1051, -0.1578,  1.0271,  0.0000 },
          {  0.0000,  0.0000,  0.0000,  1.0000 }
        }
      },
      {
        name = "deuteranopia",
        localised_name = {"gui-graphics-settings.color-filter-deuteranopia"},
        matrix =
        {
          {  1.1701, -0.2554,  0.0438,  0.0000 },
          {  0.1313,  0.8029,  0.0338,  0.0000 },
          {  0.1051, -0.1578,  1.0271,  0.0000 },
          {  0.0000,  0.0000,  0.0000,  1.0000 }
        }
      },
      {
        name = "tritanopia",
        localised_name = {"gui-graphics-settings.color-filter-tritanopia"},
        matrix =
        {
          {  1.0531,  0.2640, -0.4159,  0.0000 },
          {  0.0410,  1.2038, -0.3210,  0.0000 },
          {  0.0328,  0.1631,  0.7431,  0.0000 },
          {  0.0000,  0.0000,  0.0000,  1.0000 }
        }
      }
    },

    -- Should be based on the default day/night times, ie
    -- sun starts to set at 0.25
    -- sun fully set at 0.45
    -- sun starts to rise at 0.55
    -- sun fully risen at 0.75
    daytime_color_lookup =
    {
      {0.00, "identity"},
      {0.15, "identity"},
      {0.20, "identity"},
      {0.45, "__core__/graphics/color_luts/lut-night.png"},
      {0.55, "__core__/graphics/color_luts/lut-night.png"},
      {0.80, "identity"},
      {0.85, "identity"},
    },

    zoom_to_world_daytime_color_lookup =
    {
      {0.25, "identity"},
      {0.45, "__core__/graphics/color_luts/night.png"},
      {0.55, "__core__/graphics/color_luts/night.png"},
      {0.75, "identity"},
    },
  }
})

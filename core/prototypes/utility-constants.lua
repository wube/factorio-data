require ("bonus-gui-ordering")
require ("util")

function premultiply_alpha(color)
 return {r = color[1] * color[4], g = color[2] * color[4], b = color[3] * color[4], a = color[4]}
end

data:extend(
{
  {
    type = "utility-constants",
    name = "default",

    clipboard_history_size = 20,
    entity_button_background_color = {0.6, 0.6, 0.6, 0.6},
    building_buildable_too_far_tint = {0.6, 0.6, 0.3, 0.1},
    building_buildable_tint = {0.4, 1, 0.4, 1},
    building_not_buildable_tint = {1, 0.4, 0.4, 1},
    building_ignorable_tint = {0.4, 0.4, 1, 1},
    building_no_tint = {1, 1, 1, 1},
    underground_belt_max_distance_tint = {0, 1, 0, 1},
    underground_pipe_max_distance_tint = {0, 1, 0, 1},
    ghost_shader_tint =
    {
      ghost_tint = {118, 135, 209, 77},
      ghost_delivery_tint = {168,214,196,77},
      tile_ghost_tint = {37, 123, 194, 255},
      tile_ghost_delivery_tint = {174, 221, 242, 255},
      wire_tint = {118, 135, 209, 77}
    },
    ghost_shaderless_tint =
    {
      ghost_tint = {15, 133, 255, 112},
      ghost_delivery_tint = {68, 198, 242, 77},
      tile_ghost_tint = {4, 115, 255, 112},
      tile_ghost_delivery_tint = {54, 224, 255, 112},
      wire_tint = {118, 135, 209, 77}
    },
    ghost_shimmer_settings =
    {
      tint = {0.225995,0.412745,0.465686,0.629000},
      distortion = 12,
      blend_mode = 6, --color dodge
      visualize_borders = false,
      proportional_distortion = false,
      world_uv_modulo = 512,
      overlay_layers =
      {
        { --1
          blend_mode = 11, --difference
          shape = 4, --scanlines
          x = 9.04,
          y = 6.04,
          tint = {0.000000,0.841000,1.000000,0.494000},
          cutoff = 0
        },
        { --2
          blend_mode = 10, --subtract
          shape = 1, --scanlines
          x = 1,
          y = 1,
          tint = {0.529412,0.282353,0.000000,0.07843},
          cutoff = 0
        },
        { --3
          blend_mode = 3,
          shape = 1, --fill
          x = 1,
          y = 1,
          tint = {0.117647,0.543483,0.674510,0.756863},
          cutoff = -1
        },
        { --4
          blend_mode = 2, --multiply
          shape = 4, --scanlines
          x = 5.7,
          y = 8.28,
          tint = {1.000000,0.000000,0.000000,0.996000},
          cutoff = -0.730000,
        },
        { --5
          blend_mode = 1, --screen
          shape = 1, --fill
          x = 1,
          y = 1,
          tint = {0.098904,0.605912,0.960784,0.161000},
          cutoff = -1
        },
        { --6
          blend_mode = 1, --screen
          shape = 4, --scanlines
          x = 10,
          y = -7.12,
          tint = {0.000000,1.000000,0.088000,0.510000},
          cutoff = 0.09,
        }
      },
      distortion_layers =
      {
        { --1
          shape = 1, --scanlines
          intensity = 1,
          x = 1,
          y = 1,
        },
        { --2
          shape = 3, --none
          intensity = 0.1,
          x = 5.000000,
          y = 1.060000,
        },
        { --3
          shape = 0, --none
          intensity = 1,
          x = 1,
          y = 1,
        },
        { --4
          shape = 0, --none
          intensity = 1,
          x = 1,
          y = 1,
        },
        { --5
          shape = 0, --none
          intensity = 1,
          x = 1,
          y = 1,
        },
        { --6
          shape = 0, --none
          intensity = 1,
          x = 1,
          y = 1,
        }
      }
    },
    probability_product_count_tint = {255, 220, 170, 255},
    zero_count_value_tint = {255, 255, 255, 64},
    equipment_default_background_color = premultiply_alpha{200 / 255, 200 / 255, 200 / 255, 0.3},
    equipment_default_background_border_color = {36 / 255, 35 / 255, 36 / 255},
    equipment_default_grabbed_background_color = premultiply_alpha{1, 1, 1, 0.3},
    turret_range_visualization_color = {0.05, 0.1, 0.05, 0.15},
    capsule_range_visualization_color = {0.05, 0.1, 0.05, 0.15},
    agricultural_range_visualization_color = {0.05, 0.1, 0.05, 0.15},
    artillery_range_visualization_color = {0.12, 0.0375, 0.0375, 0.15},
    chart =
    {
      copper_wire_color = {0, 212, 255, 255},
      electric_power_pole_color = {0, 158, 163, 255},
      enabled_switch_color = {0, 255, 0, 255},
      disabled_switch_color = {255, 0, 0, 255},
      electric_line_width = 0.5,
      electric_line_minimum_absolute_width = 2,
      red_wire_color = {255, 0, 0, 255},
      green_wire_color = {0, 255, 0, 255},
      circuit_network_member_color = {0, 64, 128, 255},
      turret_range_color = {0.8, 0.25, 0.25, 1},
      artillery_range_color = {0.8, 0.25, 0.25, 1},
      default_friendly_color = {0, 0.38, 0.57},
      default_enemy_color = {1, 0.1, 0.1},
      default_enemy_territory_color = {0.3, 0.03, 0.03, 0.3},
      rail_color = {0.55, 0.55, 0.55},
      elevated_rail_color = {0.73, 0.73, 0.73},
      rail_ramp_color = {0.65, 0.65, 0.65},
      entity_ghost_color = {0.57, 0.38, 0.57},
      tile_ghost_color = {0.47, 0.28, 0.47},
      default_friendly_color_by_type =
      {
        ["ammo-turret"] = {202, 167, 24},
        ["electric-turret"] = {0.85, 0.18, 0.18},
        ["fluid-turret"] = {0.92, 0.46, 0.1},
        ["transport-belt"] = {0.8, 0.63, 0.28},
        ["splitter"] = {1, 0.82, 0},
        ["underground-belt"] = {0.44, 0.36, 0},
        ["solar-panel"] = {0.12, 0.13, 0.14},
        ["accumulator"] = {0.48, 0.48, 0.48},
        ["wall"] = {0.8, 0.85, 0.8},
        ["gate"] = {0.5, 0.5, 0.5},
        ["heat-pipe"] = {58, 130, 172},
        ["pipe"] = {69, 130, 165},
        ["pipe-to-ground"] = {25, 103, 150},
        ["pump"] = {109, 154, 181},
        ["storage-tank"] = {131, 166, 188},
        ["beacon"] = {7, 68, 104},
        ["generator"] = {0, 127, 160},
        ["fusion-generator"] = {0, 127, 160},
        ["fusion-reactor"] = {140, 160, 20},
        ["cargo-bay"] = {78, 146, 198},
        ["cargo-landing-pad"] = {103, 178, 235},
        ["space-platform-hub"] = {103, 178, 235},
        ["roboport"] = {211, 207, 136}
      },
      default_color_by_type =
      {
        ["tree"] = {0.19, 0.39, 0.19, 0.40}
      },
      chart_train_stop_text_color = {1, 1, 1},
      chart_train_stop_disabled_text_color = {0.9, 0.2, 0.2},
      chart_train_stop_full_text_color = {0.5, 0.5, 0.9},
      vehicle_outer_color = {1, 0.1, 0.1},
      vehicle_outer_color_selected = {1, 1, 1},
      vehicle_inner_color = {0.9, 0.9, 0.9},
      vehicle_wagon_connection_color = {1, 0.1, 0.1},
      resource_outline_selection_color = {1, 1, 1},
      custom_tag_scale = 18,
      custom_tag_max_scale = 8,
      custom_tag_selected_overlay_tint = {1, 1, 1, 0},
      red_signal_color = {1, 0, 0},
      green_signal_color = {0, 1, 0},
      blue_signal_color = {0, 0, 1},
      yellow_signal_color = {1, 1, 0},
      explosion_visualization_duration = 48,
      train_path_color = {1, 1, 1},
      train_preview_path_outline_color = {0, 1, 0},
      train_current_path_outline_color = {1, 0, 0},

      chart_logistic_robot_color = {1, 1, 1},
      chart_construction_robot_color = {1, 1, 0},
      chart_mobile_construction_robot_color = {0, 1, 1},
      chart_personal_construction_robot_color = {0, 1, 0},
      chart_delivery_to_me_logistic_robot_color = {1, 0, 0},

      zoom_threshold_to_draw_spider_path = 0,

      chart_deconstruct_tint = {0.75, 0.2, 0.2, 1},
      chart_deconstruct_active_color = {1, 0, 0, 1},
      chart_player_circle_size = 3,
    },
    gui_remark_color = {34, 181, 255},
    gui_search_match_foreground_color = gui_color.caption,
    gui_search_match_background_color = {109, 86, 5},
    default_player_force_color = {0.869, 0.5, 0.130, 0.5},
    default_enemy_force_color = {0.815, 0.024, 0.0, 0.5},
    default_other_force_color = {0.2, 0.2, 0.2},
    deconstruct_mark_tint = {0.65, 0.65, 0.65, 0.65},
    rail_planner_count_button_color = {1, 1, 1},
    count_button_size = 40,

    logistic_gui_unselected_network_highlight_tint = {0.20, 0.20, 0.20, 0.1},
    logistic_gui_selected_network_highlight_tint = {0.5, 0.5, 0.5, 0.5},

    chart_search_highlight = {1, 1, 0},
    selected_chart_search_highlight = {0.3, 0.7, 0.7},

    lightning_attractor_collection_range_color = {0.0, 0.1, 0.0, 0.1},
    lightning_attractor_protection_range_color = {0.0, 0.2, 0.2, 0.2},

    zoom_to_world_can_use_nightvision = false,
    zoom_to_world_effect_strength = 1.0,
    max_logistic_filter_count = 1000,
    max_terrain_building_size = 255, -- the min of this or the player build reach is used
    small_area_size = 1.5, -- less than this plays the 'small' sound variants
    medium_area_size = 6.5, -- less than this plays the 'medium' sound variants
    large_area_size = 15, -- less than this plays the 'large' sound variants, otherwise plays the 'huge' sound variants.
    huge_platform_animation_sound_area = 81, -- 9x9 area - anything larger than this, the engine will speed up the animation so it ends as if it was this size

    small_blueprint_area_size = 50, -- less than this plays the 'small' sound variants
    medium_blueprint_area_size = 200, -- less than this plays the 'medium' sound variants
    large_blueprint_area_size = 400, -- less than this plays the 'large' sound variants, larger and equal plays the 'huge' sound variants.
    rail_segment_colors =
    {
      {0, 1, 1},
      {1, 0, 1},
      {1, 1, 0},
      {0.1, 0.1, 0.7},
      {1, 1, 1},
      {0.1, 0.1, 0.1},
      {0.2, 0.7, 0.7}
    },
    player_colors =
    {
      { name = "default", player_color = {0.869, 0.5, 0.130, 0.5}, chat_color = {1.000, 0.630, 0.259} },
      { name = "red"    , player_color = {0.815, 0.024, 0.0, 0.5}, chat_color = {1.000, 0.166, 0.141} },
      { name = "green"  , player_color = {0.093, 0.768, 0.172, 0.5}, chat_color = {0.173, 0.824, 0.250} },
      { name = "blue"   , player_color = {0.155, 0.540, 0.898, 0.5}, chat_color = {0.343, 0.683, 1.000} },
      { name = "orange" , player_color = {0.869, 0.5, 0.130, 0.5}, chat_color = {1.000, 0.630, 0.259} },
      { name = "yellow" , player_color = {0.835, 0.666, 0.077, 0.5}, chat_color = {1.000, 0.828, 0.231} },
      { name = "pink"   , player_color = {0.929, 0.386, 0.514, 0.5}, chat_color = {1.000, 0.520, 0.633} },
      { name = "purple" , player_color = {0.485, 0.111, 0.659, 0.5}, chat_color = {0.821, 0.440, 0.998} },
      { name = "white"  , player_color = {0.8, 0.8, 0.8, 0.5}, chat_color = {0.9, 0.9, 0.9} },
      { name = "black"  , player_color = {0.1, 0.1, 0.1, 0.5}, chat_color = {0.5, 0.5, 0.5} },
      { name = "gray"   , player_color = {0.4, 0.4, 0.4, 0.5}, chat_color = {0.7, 0.7, 0.7} },
      { name = "brown"  , player_color = {0.300, 0.117, 0.0, 0.5}, chat_color = {0.757, 0.522, 0.371} },
      { name = "cyan"   , player_color = {0.275, 0.755, 0.712, 0.5}, chat_color = {0.335, 0.918, 0.866} },
      { name = "acid"   , player_color = {0.559, 0.761, 0.157, 0.5}, chat_color = {0.708, 0.996, 0.134} }
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
      train_with_no_path_penalty = 1000,
      train_auto_without_schedule_penalty = 7000
    },
    server_command_console_chat_color = {0.75, 0.75, 0.75, 1},
    script_command_console_chat_color = {0.75, 0.75, 0.75, 1},
    enabled_recipe_slot_tint = {1, 1, 1},
    disabled_recipe_slot_tint = {0.7, 0.7, 0.7, 0.7},
    disabled_recipe_slot_background_tint = {0.7, 0.7, 0.7, 1},
    forced_enabled_recipe_slot_background_tint = {0.70, 0.7, 0.0, 0.8},

    default_alert_icon_scale = 0.5,
    default_alert_icon_scale_by_type = {},

    item_outline_color = { 0, 0, 0, 1 },
    item_outline_radius = 16,
    item_outline_inset = 0,
    item_outline_sharpness = 0,
    item_default_random_tint_strength = {0.93, 0.93, 0.93, 1},
    spawner_evolution_factor_health_modifier = 10,
    filter_outline_color = { 0, 0, 0, 1 },
    item_health_bar_colors =
    {
      { threshold = 0/3, color = { 0.78, 0, 0 } },
      { threshold = 1/3, color = { 1, 0.85, 0 } }, -- the same yellow that the entity health pips use
      { threshold = 2/3, color = { 0, 0.78, 0 } },
    },
    item_ammo_magazine_left_bar_color = { 0, 1, 0 },
    item_tool_durability_bar_color = { 0, 1, 0 },

    icon_shadow_radius = 17.248,
    icon_shadow_inset = 9.888,
    icon_shadow_sharpness = 0,
    icon_shadow_color = { a = 1 },

    bonus_gui_ordering = bonus_gui_ordering,

    map_editor =
    {
      clone_editor_copy_source_color = {0, 1, 0},
      clone_editor_copy_destination_allowed_color = {1, 1, 1},
      clone_editor_copy_destination_not_allowed_color = {1, 0, 0},
      clone_editor_brush_source_color = {1, 1, 0},
      clone_editor_brush_destination_color = {0, 1, 0},
      clone_editor_brush_cursor_preview_tint = {0.8, 0.8, 0.8, 0.9},
      clone_editor_brush_world_preview_tint = {0.8, 0.8, 0.8, 0.4},
      script_editor_select_area_color = {1, 1, 1},
      script_editor_drag_area_color = {1, 1, 1, 0.5},
      force_editor_select_area_color = {0, 1, 0},
      cliff_editor_remove_cliffs_color = {1, 0, 0},
      tile_editor_area_selection_color = {0, 1, 0},
      tile_editor_selection_preview_tint = {0.15, 0.15, 0.15, 0.15},
      tile_editor_selection_preview_radius = 6,
      decorative_editor_selection_preview_tint = {0.25, 0.25, 0.25, 0.25},
      decorative_editor_selection_preview_radius = 10
    },
    drop_item_radius = 2.0,
    checkerboard_white = {56, 56, 56},
    checkerboard_black = {42, 42, 42},

    default_trigger_target_mask_by_type =
    {
      ["character"] = { "common", "ground-unit" },
      ["car"] = { "common", "ground-unit" },
      ["unit"] = { "common", "ground-unit" },
      ["construction-robot"] = { "common", "flying-robot" },
      ["logistic-robot"] = { "common", "flying-robot" },
      ["combat-robot"] = { "common", "flying-robot" },
      ["capture-robot"] = { "common", "flying-robot" }
    },

    recipe_step_limit = 50000, -- number of steps before calculating total-raw/times-can-be-crafted is aborted for a given recipe
    manual_rail_building_reach_modifier = 3,
    train_temporary_stop_wait_time =  60 * 5,
    train_time_wait_condition_default = 60 * 30,
    train_inactivity_wait_condition_default = 60 * 5,

    unit_group_pathfind_resolution = 0,
    unit_group_max_pursue_distance = 50,

    -- 1.166 is a magic number representing the maximum number of seconds it takes for a base game inserter to do one cycle.
    -- the calculated overload multiplier is the number of crafts we can complete during one inserter full swing + 1
    dynamic_recipe_overload_factor = 1.166,
    minimum_recipe_overload_multiplier = 2,
    maximum_recipe_overload_multiplier = 100,

    -- we render a bit more to compensate for electric poles, shadows, decoratives and tall entities
    -- with decoratives being most demanding on that, using them as heuristic
    entity_renderer_search_box_limits =
    {
      -- In 1.1 it was left = 6 to compensate for shadows, bottom = 4 to compensate for tall entities like trees and electric poles and top and right 3.
      -- In 2.0 they all are set to 6 because of robot optimization which makes them move only once per 20 ticks,
      -- so they "teleport" into the view if they are fast enough (https://forums.factorio.com/124268). This doesn't fix the issue fully,
      -- it will start to appear if bots have high enough speed.
      left = 6,
      top = 6,
      right = 6,
      bottom = 6
    },

    light_renderer_search_distance_limit = 20,

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
    main_menu_background_vignette_intensity = 30,
    main_menu_background_vignette_sharpness = 0.444,

    feedback_screenshot_subfolder_name = "feedback",
    feedback_screenshot_file_name = "feedback_screenshot",

    default_scorch_mark_color = {0.373, 0.307, 0.243, 1.000},

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
      {0.85, "identity"}
    },

    zoom_to_world_daytime_color_lookup =
    {
      {0.25, "identity"},
      {0.45, "__core__/graphics/color_luts/night.png"},
      {0.55, "__core__/graphics/color_luts/night.png"},
      {0.75, "identity"}
    },
    frozen_color_lookup = "__core__/graphics/color_luts/frozen.png",

    select_group_row_count = 6,
    select_slot_row_count = 10,
    logistic_slots_per_row = 10,
    crafting_queue_slots_per_row = 10,
    blueprint_big_slots_per_row = 6,
    blueprint_small_slots_per_row = 10,
    inventory_width = 10,
    module_inventory_width = 10,
    trash_inventory_width = 10,
    tooltip_monitor_edge_border = 10,
    flying_text_ttl = 80,

    minimap_slot_hovered_tint = {r = 255 / 255, g = 162 / 255, b = 0, a = 0.7},
    minimap_slot_clicked_tint = {r = 219 / 255, g = 122 / 255, b = 0, a = 0.7},

    clear_cursor_volume_modifier = 0.6,
    weapons_in_simulation_volume_modifier = 0.7,
    explosions_in_simulation_volume_modifier = 0.5,
    enemies_in_simulation_volume_modifier = 0.9,

    low_energy_robot_estimate_multiplier = 1.2,

    asteroid_spawning_offset = {{-48, -72}, {48, 48}},
    asteroid_fading_range = 16,
    asteroid_spawning_with_random_orientation_max_speed = 0.02,
    asteroid_position_offset_to_speed_coefficient = 1 / 120,

    asteroid_collector_navmesh_refresh_tick_interval = 30,
    asteroid_collector_blockage_update_tile_distance = 3,
    asteroid_collector_max_nurbs_control_point_separation = 5.0,
    asteroid_collector_static_head_swing_strength_scale = 1.0;
    asteroid_collector_static_head_swing_segment_count = 12;

    -- drag_coefficient = width * 0.5
    -- drag = ((1500 * speed * speed + 1500 * abs(speed)) * drag_coefficient + 10000) * sign(speed)
    -- final_thrust = thrust / (1 + weight / 10000000)
    -- acceleration = (final_thrust - drag) / weight / 60
    space_platform_acceleration_expression = "(thrust / (1 + weight / 10000000) - ((1500 * speed * speed + 1500 * abs(speed)) * (width * 0.5) + 10000) * sign(speed)) / weight / 60",
    space_platform_relative_speed_factor = 0.035,
    space_platform_starfield_movement_vector = { 0, -0.02 },
    space_platform_max_size = {{-1000000, -200}, {1000000, 1000000}},
    space_platform_dump_cooldown = 30 * second,
    space_platform_manual_dump_cooldown = 2 * second,
    space_platform_max_relative_speed_deviation_for_asteroid_chunks_update = 1/second,
    space_platform_asteroid_chunk_trajectory_updates_per_tick = 1,

    default_item_weight = 100,
    rocket_lift_weight = 1000000, -- 1 000 kg

    factoriopedia_recycling_recipe_categories = { "recycling", "recycling-or-hand-crafting" },

    max_fluid_flow = 100,
    default_pipeline_extent = 320, -- Can be overridden on a per-fluidbox basis

    default_platform_procession_set =
    {
      departure = {"default-a"},
      arrival = {"default-b"}
    },
    default_planet_procession_set =
    {
      departure = {"default-rocket-a"},
      arrival = {"default-b"}
    },
    landing_area_clear_zone_radius = 8,
    landing_area_max_radius = 16,

    landing_squash_immunity = 5 * second,

    ejected_item_lifetime = 25 * second,
    ejected_item_speed = 0.005,
    ejected_item_direction_variation = 0.05,
    ejected_item_friction = 0.999,

    default_collision_masks = require("__core__.lualib.collision-mask-defaults"),

    show_chunk_components_collision_mask = {layers={player=true, train=true, is_object=true}}, -- used by "show-chunk-components" debug visualization. Its good idea to keep this similar to default unit collision mask
    building_collision_mask = {layers={item=true, object=true, player=true, water_tile=true, meltable=true}}, -- used by Commander::findNewBasePosition, ExpansionPlanner::isChunkValidCandidate and LandMinePrototype(default triggerCollisionMask)
    water_collision_mask = {layers={water_tile=true}}, -- if a tile occupies one of those layers it will be considered "water". That is used to trigger ArtilleryFlare::endedInWaterTriggerEffect and Particle::endedInWaterTriggerEffect
    ghost_layer = "ghost",

    train_pushed_by_player_max_speed = 0.05,
    train_pushed_by_player_max_acceleration = 0.0001,
    train_pushed_by_player_ignores_friction = true,

    freezing_temperature = 30,

    train_visualization =
    {
      not_last_box_color = {r=1, g=1, b=1}, -- white
      last_box_color = {r=1, g=1, b=0}, -- yellow
      reverse_box_color = {r=0.7, g=0.7, b=0.7},
      last_reverse_box_color = {r=0.7, g=0.7, b=0},
      box_width = 1.6,
      box_length = 6.0,
      joint_distance = 4.0,
      connection_distance = 3.0,
      final_margin = 1.0,
      stock_number_scale = 2.0,
    },

    train_on_elevated_rail_shadow_shift_multiplier = { 1.41421356237, 1 },
    gui_move_switch_vibration =
    {
      filename = "__core__/sound/gui-game-controller-move.bnvib"
    },

    max_belt_stack_size = 4,
    inserter_hand_stack_items_per_sprite = 2,
    inserter_hand_stack_max_sprites = 8,

    remote_view_LPF_min_cutoff_frequency = 4000.0,
    remote_view_LPF_max_cutoff_frequency = 15000.0,
    space_LPF_min_cutoff_frequency = 200,
    space_LPF_max_cutoff_frequency = 500,

    walking_sound_count_reduction_rate = 0.3,
    moving_sound_count_reduction_rate = 0.5,

    environment_sounds_transition_fade_in_ticks = 20,

    starmap_orbit_default_color = gui_color.grey,
    starmap_orbit_hovered_color = gui_color.orange,
    starmap_orbit_clicked_color = gui_color.light_orange,
    starmap_orbit_disabled_color = {0.25, 0.25, 0.25},

    time_to_show_full_health_bar = 5,

    capture_water_mask_at_layer = 200, -- need to capture water close to layer in which decals that need to be masked are rendered,
                                      -- otherwise we risk that some tiles that are supposed to be under the decals and not mask them
                                      -- would not be rendered yet and therefore would have value 0 in water mask

    logistic_robots_use_busy_robots_queue = true,
    construction_robots_use_busy_robots_queue = true,
    quality_selector_dropdown_threshold = 6,
  }
})

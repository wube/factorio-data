data:extend(
{
  {
    type = "utility-constants",
    name = "default",

    entity_button_background_color = {r = 0.6, g =  0.6, b = 0.6, a = 0.6},
    building_invalid_recipe_tint = {r = 1, g = 0.33, b = 1, a = 1},
    building_buildable_too_far_tint = {r = 0.6, g = 0.6, b = 0.3, a = 0.1},
    building_buildable_tint = {r = 0.4, g = 1, b = 0.4, a = 1},
    building_not_buildable_tint = {r = 1, g = 0.4, b = 0.4, a = 1},
    building_ignorable_tint = {r = 0.4, g = 0.4, b = 1, a = 1},
    building_no_tint = {r = 1, g = 1, b = 1, a = 1},
    ghost_tint = {r = 0.6, g = 0.6, b = 0.6, a = 0.3},
    turret_range_visualization_color = { r = 0.05, g = 0.1, b = 0.05, a = 0.15 },
    capsule_range_visualization_color = { r = 0.05, g = 0.1, b = 0.05, a = 0.15 },
    chart =
    {
      electric_lines_color = {r = 0, g = 212, b = 255, a = 255},
      electric_power_pole_color = {r = 0, g = 158, b = 163, a = 255},
      electric_line_width = 1.5,
      electric_line_minimum_absolute_width = 2,
      turret_range_color = {r = 0.8, g = 0.25, b = 0.25, a = 1},
      default_friendly_color = {r = 0, g = 0.38, b = 0.57},
      default_enemy_color = {r = 1, g = 0.1, b = 0.1},
      rail_color = {r = 0.55, g = 0.55, b = 0.55},
      default_friendly_color_by_type =
      {
        ["ammo-turret"] = {r = 202, g = 167, b = 24},
        ["electric-turret"] = {r = 0.85, g = 0.18, b = 0.18},
        ["fluid-turret"] = {r = 0.92, g = 0.46, b = 0.1},
        ["transport-belt"] = {r = 0.8, g = 0.63, b = 0.28},
        ["splitter"] = {r = 1, g = 0.82, b = 0},
        ["underground-belt"] = {r = 0.56, g = 0.46, b = 0},
        ["solar-panel"] = {r = 0.12, g = 0.13, b = 0.14},
        ["accumulator"] = {r = 0.42, g = 0.42, b = 0.42},
        ["wall"] = {r = 0.75, g = 0.8, b = 0.75},
        ["gate"] = {r = 0.5, g = 0.5, b = 0.5}
      },
      default_color_by_type =
      {
        ["tree"] = {r = 0.19, g = 0.39, b = 0.19, a = 0.19},
      },
      chart_train_stop_disabled_text_color = {r = 0.9,  g = 0.2, b = 0.2},
      vehicle_outer_color = {r = 1, g = 0.1, b = 0.1},
      vehicle_outer_color_selected = {r = 1, g = 1, b = 1},
      vehicle_inner_color = {r = 0.9, g = 0.9, b = 0.9},
      vehicle_cargo_wagon_color = {r = 238, g = 162, b = 0},
      vehicle_fluid_wagon_color = {r = 0, g = 233, b = 118},
      vehicle_wagon_connection_color = { r = 1, g = 0.1, b = 0.1 },
      resource_outline_selection_color = {r = 1, g = 1, b = 1},
      custom_tag_scale = 0.6*30/32,
      custom_tag_selected_scale = 0.6*30/32, -- 1*30/32
      custom_tag_selected_overlay_tint = { r = 1, g = 1, b = 1, a = 0},
    },
    
    zoom_to_world_draw_map_under_entities = false,
    zoom_to_world_can_use_nightvision = false,
    zoom_to_world_darkness_multiplier = 0.5,
    zoom_to_world_effect_strength = 0.05,

    enabled_recipe_slot_tint = {r = 1, g = 1, b = 1},
    disabled_recipe_slot_tint = { r = 0.55, g = 0.55, b = 0.55, a = 0.55 }
  }
})

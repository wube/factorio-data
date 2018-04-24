default_container_padding = 8
default_orange_color = { r=0.98, g=0.66, b=0.22}
default_light_orange_color = { r=1, g=0.74, b=0.40 }
warning_red_color = {r=1, g=0.2, b=0.3}

function color(hex)  -- supports 'rrggbb', 'rgb', 'rrggbbaa', 'rgba', 'ww', 'w'
  function h(i,j)
    return j and tonumber("0x"..hex:sub(i,j)) / 255 or tonumber("0x"..hex:sub(i,i)) / 15
  end

  hex = hex:gsub("#","")
  return #hex == 6 and { r = h(1,2), g = h(3,4), b = h(5,6) }
      or #hex == 3 and { r = h(1), g = h(2), b = h(3) }
      or #hex == 8 and { r = h(1,2), g = h(3,4), b = h(5,6), a = h(7,8) }
      or #hex == 4 and { r = h(1), g = h(2), b = h(3), a = h(4) }
      or #hex == 2 and { r = h(1,2), g = h(1,2), b = h(1,2) }
      or #hex == 1 and { r = h(1), g = h(1), b = h(1) }
      or { r=1, g=1, b=1 }
end


achievement_green_color = color "96ce82"
achievement_tan_color = color "d1c58e"

function make_cursor_box(x, y, side_length, shift)
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
   max_side_length = side_length,
  }
end

function make_full_cursor_box(x, y, side_length, side_height)
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

function orangebuttongraphcialset()
  return
  {
    type = "monolith",
    top_monolith_border = 1,
    right_monolith_border = 1,
    bottom_monolith_border = 1,
    left_monolith_border = 1,
    monolith_image =
    {
      filename = "__core__/graphics/gui.png",
      priority = "extra-high-no-scale",
      width = 36,
      height = 36,
      x = 75,
      y = 108
    }
  }
end

function bluebuttongraphcialset(state)
  local offset = nil
  if state == "default" then
    offset = { x = 221, y = 36 }
  elseif state == "hovered" then
    offset = { x = 221, y = 72 }
  elseif state == "clicked" then
    offset = { x = 221, y = 108 }
  end

  return
  {
    type = "monolith",
    top_monolith_border = 1,
    right_monolith_border = 1,
    bottom_monolith_border = 1,
    left_monolith_border = 1,
    monolith_image =
    {
      filename = "__core__/graphics/gui.png",
      priority = "extra-high-no-scale",
      width = 36,
      height = 36,
      x = offset.x,
      y = offset.y
    }
  }
end

data:extend(
{
  {
    type = "gui-style",
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

    label_style =
    {
      type = "label_style",
      font = "default",
      font_color = {r=1, g=1, b=1}
    },
    bold_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font = "default-bold",
    },
    bold_red_label_style =
    {
      type = "label_style",
      parent = "bold_label_style",
      font_color = {r=1, g=0, b=0}
    },
    bold_green_label_style =
    {
      type = "label_style",
      parent = "bold_label_style",
      font_color = {r=0, g=1, b=0}
    },
    -- Used as table caption, or in "Caption: value"
    caption_label_style =
    {
      type = "label_style",
      parent = "bold_label_style",
      font_color = default_orange_color
    },
    invalid_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font_color = warning_red_color
    },
    scenario_message_dialog_label_style=
    {
      type = "label_style",
      parent = "label_style",
      width = 400,
      font = "scenario-message-dialog",
      font_color = {r=0, g=0, b=0}
    },
    goal_label_style=
    {
      type = "label_style",
      parent = "label_style",
      font = "scenario-message-dialog",
      width = 364,
      font_color = {r=1, g=1, b=1}
    },
    electric_usage_label_style=
    {
      type = "label_style",
      parent = "label_style",
      width = 60
    },
    mod_dependency_invalid_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font_color = warning_red_color
    },
    description_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font = "default-semibold"
    },
    description_value_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font = "default",
      font_color = default_light_orange_color
    },
    description_remark_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font = "default-semibold",
    },
    description_title_label_style =
    {
      type = "label_style",
      parent = "description_label_style",
      font = "default-bold",
      minimal_width = 210
    },
    tool_equip_gui_label_style =
    {
      type = "label_style",
      parent = "description_label_style"
    },
    tooltip_label_style =
    {
      type = "label_style",
      parent = "description_label_style"
    },
    tooltip_title_label_style =
    {
      type = "label_style",
      parent = "description_label_style",
      font = "default-bold",
      minimal_width = 100,
      maximal_width = 350,
    },
    tooltip_description_label_style=
    {
      type = "label_style",
      parent = "description_label_style",
      minimal_width = 210
    },
    recipe_tooltip_cannot_craft_label_style =
    {
      type = "label_style",
      parent = "tooltip_label_style",
      font_color = warning_red_color,
    },
    recipe_tooltip_transitive_craft_label_style =
    {
      type = "label_style",
      parent = "tooltip_label_style",
      font_color = default_orange_color,
    },
    frame_caption_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font = "default-frame",
      font_color={r=1, g=1, b=1}
    },
    mod_list_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font = "default-bold",
      font_color={r=0.9, g=0.9, b=0.1},
      minimal_width = 210
   },
    menu_message_style =
    {
      type = "label_style",
      parent = "label_style",
      font = "default-bold",
      font_color = default_orange_color,
      minimal_width = 300
    },
    button_style =
    {
      type = "button_style",
      font = "default-button",
      default_font_color={r=1, g=1, b=1},
      align = "center",
      top_padding = 5,
      right_padding = 5,
      bottom_padding = 5,
      left_padding = 5,
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        load_in_minimal_mode = true,
        corner_size = {3, 3},
        position = {0, 0}
      },
      hovered_font_color = {r=0, g=0, b=0},
      hovered_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        load_in_minimal_mode = true,
        corner_size = {3, 3},
        position = {0, 8}
      },
      clicked_font_color={r=1, g=1, b=1},
      clicked_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        load_in_minimal_mode = true,
        corner_size = {3, 3},
        position = {0, 40}
      },
      disabled_font_color={r=0.5, g=0.5, b=0.5},
      disabled_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        load_in_minimal_mode = true,
        corner_size = {3, 3},
        position = {0, 16}
      },
      pie_progress_color = {r=1, g=1, b=1}
    },

    horizontal_line_style =
    {
      type = "button_style",
      line_color = default_orange_color,
      line_width = 1
    },

    browse_games_gui_line_style =
    {
      parent = "horizontal_line_style",
      top_padding = 10,
      bottom_padding = 10
    },

    achievement_title_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font = "default-bold",
      font_color = color "ff",
      minimal_width = 250,
      maximal_width = 250
    },
    achievement_percent_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font = "default-large-semibold",
      font_color = achievement_green_color
    },
    achievement_unlocked_title_label_style =
    {
      type = "label_style",
      parent = "achievement_title_label_style",
      font_color = achievement_green_color
    },
    achievement_locked_title_label_style =
    {
      type = "label_style",
      parent = "achievement_title_label_style",
      font_color = achievement_tan_color
    },
    achievement_failed_title_label_style =
    {
      type = "label_style",
      parent = "achievement_title_label_style",
      font_color = color "8f7676"
    },

    achievement_description_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font = "default",
      font_color = color "ff"
    },
    achievement_unlocked_description_label_style =
    {
      type = "label_style",
      parent = "achievement_description_label_style",
    },
    achievement_locked_description_label_style =
    {
      type = "label_style",
      parent = "achievement_description_label_style",
    },
    achievement_failed_description_label_style =
    {
      type = "label_style",
      parent = "achievement_description_label_style",
      font_color = color "8f7676"
    },

    achievement_locked_progress_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font = "default-semibold",
      font_color = achievement_tan_color
    },
    achievement_failed_reason_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font = "default-small",
      font_color = color "e2dbdb"
    },

    tutorial_list_description_label_style =
    {
      type = "label_style",
      parent = "label_style",
      --font = "scenario-message-dialog",
      font = "default",
      --width = 364,
      font_color = {r=1, g=1, b=1}
    },
    
    tutorial_title_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font = "default-large-bold",
      font_color = achievement_tan_color,
      minimal_width = 250,
      maximal_width = 250
    },
    tutorial_locked_title_label_style =
    {
      type = "label_style",
      parent = "tutorial_title_label_style"
    },
    tutorial_completed_title_label_style =
    {
      type = "label_style",
      parent = "tutorial_title_label_style",
      font_color = achievement_green_color,
    },

    tutorial_description_label_style =
    {
      type = "label_style",
      parent = "label_style",
      --font = "scenario-message-dialog",
      font = "default",
      width = 364,
      font_color = {r=1, g=1, b=1}
    },

    tutorial_notice_title_label_style =
    {
      type = "label_style",
      parent = "label_style",
      --font = "default",
      font = "default-large-bold",
      font_color = color "ff",
      minimal_width = 250,
      maximal_width = 250
    },
    tutorial_notice_name_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font = "default-large",
      font_color = color "ff",
    },
    tutorial_notice_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font_color = color "ff",
    },

    installed_mod_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font_color = {r=0, g=0.9, b=0}
    },

    downloading_mod_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font_color = {r=255, g=255, b=50}
    },

    to_be_downloaded_mod_label_style =
    {
      type = "label_style",
      parnet = "label_style",
      font_color = {r=50, g=255, b=255}
    },

    out_of_date_mod_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font_color = {r=0.9, g=0.9, b=0}
    },

    incompatible_mod_label_style =
    {
      type = "label_style",
      parent = "label_style",
      font_color = warning_red_color
    },

    flip_button_style_left =
    {
      type = "button_style",
      font = "default-button",
      default_font_color={r=1, g=1, b=1},
      align = "center",
      width = 32,
      height = 15,
      top_padding = 5,
      right_padding = 5,
      bottom_padding = 5,
      left_padding = 5,
      default_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/switch-button-gui.png",
          priority = "extra-high-no-scale",
          load_in_minimal_mode = true,
          width = 32,
          height = 15
        }
      },
      clicked_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/switch-button-gui.png",
          priority = "extra-high-no-scale",
          load_in_minimal_mode = true,
          width = 32,
          height = 15,
          y = 30
        }
      },
      hovered_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/switch-button-gui.png",
          priority = "extra-high-no-scale",
          load_in_minimal_mode = true,
          width = 32,
          height = 15,
          y = 15
        }
      },
      pie_progress_color = {r=1, g=1, b=1}
    },

    flip_button_style_right =
    {
      type = "button_style",
      font = "default-button",
      default_font_color={r=1, g=1, b=1},
      align = "center",
      width = 32,
      height = 15,
      top_padding = 5,
      right_padding = 5,
      bottom_padding = 5,
      left_padding = 5,
      default_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/switch-button-gui.png",
          priority = "extra-high-no-scale",
          width = 32,
          height = 15,
          x = 32
        }
      },
      clicked_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/switch-button-gui.png",
          priority = "extra-high-no-scale",
          width = 32,
          height = 15,
          x = 32,
          y = 30
        }
      },
      hovered_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/switch-button-gui.png",
          priority = "extra-high-no-scale",
          width = 32,
          height = 15,
          x = 32,
          y = 15
        }
      },
      pie_progress_color = {r=1, g=1, b=1}
    },

    fake_disabled_button_style =
    {
      type = "button_style",
      parent = "button_style",

      default_font_color={r=0.5, g=0.5, b=0.5},
      hovered_font_color={r=0.5, g=0.5, b=0.5},
      hovered_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 0}
      },
      clicked_font_color={r=0.5, g=0.5, b=0.5},
      clicked_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 0}
      }
    },
    dialog_button_style =
    {
      type = "button_style",
      parent = "button_style",
      minimal_width = 100,
      minimal_height = 30,
      left_click_sound =
      {
        {
          filename = "__core__/sound/gui-click.ogg",
          volume = 1
        }
      }
    },

    play_tutorial_button_style =
    {
      type = "button_style",
      parent = "button_style",
      font = "default",
      left_click_sound =
      {
        {
          filename = "__core__/sound/gui-click.ogg",
          volume = 1
        }
      }
    },
    play_completed_tutorial_button_style =
    {
      type = "button_style",
      parent = "play_tutorial_button_style",
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 24}
      }
    },
    play_locked_tutorial_button_style =
    {
      type = "button_style",
      parent = "play_tutorial_button_style",
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 32}
      }
    },
    play_tutorial_disabled_button_style =
    {
      type = "button_style",
      parent = "fake_disabled_button_style",
      font = "default"
    },

    menu_button_style =
    {
      type = "button_style",
      parent = "button_style",
      font = "default-button",
      minimal_width = 300,
      minimal_height = 50,
      left_click_sound =
      {
        {
          filename = "__core__/sound/gui-click.ogg",
          volume = 1
        }
      }
    },

    search_mods_button_style =
    {
      type = "button_style",
      parent = "button_style",
      top_padding = 2,
      right_padding = 2,
      bottom_padding = 2,
      left_padding = 2,
    },

    icon_button_style =
    {
      type = "button_style",
      parent = "button_style",
      scalable = true,
      default_font_color={r=0, g=0, b=0},
      width = 38,
      height = 38,
      top_padding = 1,
      right_padding = 0,
      bottom_padding = 1,
      left_padding = 0,
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {8, 0}
      }
    },

    side_menu_button_style =
    {
      type = "button_style",
      parent = "icon_button_style"
    },
    map_view_options_button_style =
    {
      type = "button_style",
      parent = "icon_button_style"
    },

    mod_gui_button_style =
    {
      type = "button_style",
      parent = "button_style",
      scalable = true,
      minimal_width = 36,
      height = 36,
      top_padding = 1,
      right_padding = 1,
      bottom_padding = 1,
      left_padding = 1,
      left_click_sound =
      {
        {
          filename = "__core__/sound/gui-click.ogg",
          volume = 1
        }
      },
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {8, 0}
      }
    },

    image_tab_slot_style =
    {
      type = "button_style",
      parent = "slot_button_style",
      scalable = false,
      width = 68,
      height = 68,
      default_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 111,
          y = 144,
        }
      },
      clicked_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 111
        }
      },
      hovered_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 148,
          y = 144
        }
      }
    },
    image_tab_selected_slot_style =
    {
      type = "button_style",
      parent = "image_tab_slot_style",
      scalable = false,
      width = 68,
      height = 68,
      default_graphical_set = orangebuttongraphcialset(),
      hovered_graphical_set =  orangebuttongraphcialset(),
      clicked_graphical_set = orangebuttongraphcialset()
    },
    logistic_button_slot_style =
    {
      type = "button_style",
      parent = "slot_button_style"
    },
    logistic_button_selected_slot_style =
    {
      type = "button_style",
      parent = "slot_button_style",
      default_graphical_set = orangebuttongraphcialset(),
      hovered_graphical_set =  orangebuttongraphcialset(),
      clicked_graphical_set = orangebuttongraphcialset()
    },
    ability_slot_style =
    {
      type = "button_style",
      parent = "slot_button_style"
    },

    red_circuit_network_content_slot_style =
    {
      type = "button_style",
      parent = "slot_button_style",
      default_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 111,
          y = 36
        }
      }
    },

    green_circuit_network_content_slot_style =
    {
      type = "button_style",
      parent = "slot_button_style",
      scalable = false,
      default_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 111,
          y = 108
        }
      }
    },

    slot_button_style =
    {
      type = "button_style",
      parent = "button_style",
      scalable = false,
      width = 36,
      height = 36,
      top_padding = 1,
      right_padding = 1,
      bottom_padding = 1,
      left_padding = 1,
      default_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 111
        }
      },
      hovered_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 148
        }
      },
      clicked_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 185
        }
      },
      pie_progress_color = {r=0.98, g=0.66, b=0.22, a = 0.5}
    },

    recipe_slot_button_style =
    {
      type = "button_style",
      parent = "slot_button_style",
      scalable = false,
      width = 36,
      height = 36,
      top_padding = 1,
      right_padding = 1,
      bottom_padding = 1,
      left_padding = 1,
      default_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 111,
          y = 144,
        }
      },
      hovered_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 148,
          y = 144,
        }
      },
      clicked_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 185,
          y = 144,
        }
      },
      pie_progress_color = {r=0.98, g=0.66, b=0.22, a = 0.5}
    },

    switch_quickbar_button_style =
    {
      type = "button_style",
      parent = "button_style",
      scalable = false,
      width = 22,
      height = 22,
      top_padding = 1,
      right_padding = 1,
      bottom_padding = 1,
      left_padding = 1,
      default_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/switch-quickbar.png",
          priority = "extra-high-no-scale",
          width = 24,
          height = 24
        },
        stretch_monolith_image_to_size = false
      },
      hovered_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/switch-quickbar.png",
          priority = "extra-high-no-scale",
          width = 24,
          height = 24,
          x = 24
        },
        stretch_monolith_image_to_size = false
      },
      clicked_graphical_set =
      {
       type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/switch-quickbar.png",
          priority = "extra-high-no-scale",
          width = 24,
          height = 24,
          x = 24
        },
        stretch_monolith_image_to_size = false
      }
    },

    small_slot_button_style =
    {
      type = "button_style",
      parent = "slot_button_style",
      width = 20,
      height = 20,
      scalable = false
    },

    tracking_off_button_style =
    {
      type = "button_style",
      parent = "button_style",
      scalable = false,
      top_padding = 0,
      right_padding = 0,
      bottom_padding = 0,
      left_padding = 0,
      width = 3+16+3,
      height = 3+16+3,
    },

    tracking_on_button_style =
    {
      type = "button_style",
      parent = "tracking_off_button_style",
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 40}
      },
      hovered_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 48}
      },
      -- pressed is the same as default
    },

    technology_slot_button_style =
    {
      type = "button_style",
      parent = "crafting_queue_slot_style",
      scalable = false,
      width = 68,
      height = 68
    },

    blueprint_record_slot_button_style =
    {
      type = "button_style",
      parent = "button_style",
      width = 76,
      height = 76,
      scalable = false
    },

    blueprint_drop_slot_button_style =
    {
      type = "button_style",
      parent = "button_style",
      width = 76,
      height = 76,
      scalable = false
    },

    search_button_style =
    {
      type = "button_style",
      parent = "slot_button_style",
      width = 28,
      height = 28
    },

    edit_label_button_style =
    {
      type = "button_style",
      parent = "slot_button_style",
      width = 28,
      height = 28
    },

    selected_slot_button_style =
    {
      type = "button_style",
      parent = "slot_button_style",
      default_graphical_set =  orangebuttongraphcialset(),
      hovered_graphical_set =  orangebuttongraphcialset(),
      clicked_graphical_set = orangebuttongraphcialset()
    },

    slot_with_filter_button_style =
    {
      type = "button_style",
      parent = "slot_button_style",
      default_graphical_set =  bluebuttongraphcialset("default"),
      hovered_graphical_set =  bluebuttongraphcialset("hovered"),
      clicked_graphical_set = bluebuttongraphcialset("clicked")
    },

    not_available_slot_button_style =
    {
      type = "button_style",
      parent = "slot_button_style",
      default_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 111,
          y = 36
        }
      },
      hovered_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 148,
          y = 36
        }
      },
      clicked_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 185,
          y = 36
        }
      }
    },
    circuit_condition_sign_button_style =
    {
      type = "button_style",
      parent = "button_style",
      top_padding = 0,
      right_padding = 5,
      bottom_padding = 1,
      left_padding = 5
    },

    available_technology_slot_style =
    {
      type = "button_style",
      parent = "slot_button_style",
      scalable = false,
      width = 68,
      height = 68 + 16,
      default_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 111,
          y = 216
        }
      },
      clicked_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 185,
          y = 216,
        }
      },
      hovered_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 148,
          y = 216
        }
      }
    },

    red_slot_button_style =
    {
      type = "button_style",
      parent = "slot_button_style",
      scalable = false,
      default_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 111,
          y = 36
        }
      },
      hovered_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 148,
          y = 36
        }
      },
      clicked_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 185,
          y = 36
        }
      }
    },

    not_available_technology_slot_style =
    {
      type = "button_style",
      parent = "red_slot_button_style",
      scalable = false,
      width = 68,
      height = 68 + 16,
      default_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 111,
          y = 180
        }
      },
      clicked_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 185,
          y = 180
        }
      },
      hovered_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 148,
          y = 180
        }
      }
    },

    disabled_technology_slot_style =
    {
      type = "button_style",
      parent = "slot_button_style",
      scalable = false,
      visible = false,
      width = 68,
      height = 68
    },

    green_slot_button_style =
    {
      type = "button_style",
      parent = "slot_button_style",
      scalable = false,
      default_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 111,
          y = 108
        }
      },
      hovered_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 148,
          y = 108
        }
      },
      clicked_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 185,
          y = 108
        }
      }
    },

    working_weapon_button_style =
    {
      type = "button_style",
      parent = "green_slot_button_style"
    },

    not_working_weapon_button_style =
    {
      type = "button_style",
      parent = "red_slot_button_style"
    },

    researched_technology_slot_style =
    {
      type = "button_style",
      parent = "green_slot_button_style",
      scalable = false,
      width = 68,
      height = 68 + 16,
       default_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 111,
          y = 252
        }
      },
      clicked_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 185,
          y = 252
        }
      },
      hovered_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 148,
          y = 252
        }
      }
    },

    available_preview_technology_slot_style =
    {
      type = "button_style",
      parent = "available_technology_slot_style",
      scalable = false,
      width = 132,
      height = 132
    },

    not_available_preview_technology_slot_style =
    {
      type = "button_style",
      parent = "not_available_technology_slot_style",
      scalable = false,
      width = 132,
      height = 132
    },

    omitted_technology_slot_style =
    {
      type = "button_style",
      scalable = false,
      width = 10,
      height = 8,
      top_padding = 0,
      right_padding = 0,
      bottom_padding = 0,
      left_padding = 0,
      default_graphical_set =
      {
         type = "none"
      },
      hovered_graphical_set =
      {
         type = "none"
      }
    },

    researched_preview_technology_slot_style =
    {
      type = "button_style",
      parent = "researched_technology_slot_style",
      scalable = false,
      width = 132,
      height = 132
    },

    crafting_queue_slot_style=
    {
      type = "button_style",
      parent = "slot_button_style",
      pie_progress_color = {r=0.98, g=0.66, b=0.22, a = 0.5},
      scalable = false
    },
    promised_crafting_queue_slot_style=
    {
      type = "button_style",
      parent = "crafting_queue_slot_style",
      scalable = false,
      default_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 221,
          y = 36
        }
      },
      hovered_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 221,
          y = 72
        }
      },
      clicked_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 221,
          y = 108
        }
      }
    },
    partially_promised_crafting_queue_slot_style =
    {
      type = "button_style",
      parent = "crafting_queue_slot_style",
      scalable = false,
      default_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 257,
          y = 36
        }
      },
      hovered_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 257,
          y = 72
        }
      },
      clicked_graphical_set =
      {
        type = "monolith",
        top_monolith_border = 1,
        right_monolith_border = 1,
        bottom_monolith_border = 1,
        left_monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 257,
          y = 108
        }
      }
    },
    controls_settings_button_style =
    {
      type = "button_style",
      parent = "button_style",
      font = "default-bold",
      align = "left",
      minimal_width = 225,
      maximal_width = 225,
      top_padding = 0,
      right_padding = 2,
      bottom_padding = 0,
      left_padding = 2,
      default_font_color={},
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {8, 8}
      }
    },
    auth_actions_button_style =
    {
      type = "button_style",
      parent = "button_style",
      font = "default-bold",
      align = "left",
      top_padding = 0,
      right_padding = 2,
      bottom_padding = 0,
      left_padding = 2
    },
    dropdown_style =
    {
      type = "dropdown_style",
      font = "default",
      default_font_color = {r=1, g=1, b=1},
      hovered_font_color = {r=0, g=0, b=0},
      top_padding = 3,
      right_padding = 6,
      left_padding = 6,
      bottom_padding = 3,
      triangle_image =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 10,
        height = 5,
        x = 36,
        y = 6
      },
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 0}
      },
      hovered_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 8}
      },
      clicked_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 16}
      },
      listbox_style=
      {
        font = "default"
      }
    },
    map_settings_dropdown_style =
    {
      type = "dropdown_style",
      parent = "dropdown_style",
      minimal_width = 200
    },
    listbox_item_style =
    {
      type = "listbox_item_style",
      strikethrough_color = {r=0.5, g=0.5, b=0.5},
      default =
      {
        font_color = {r=1, g=1, b=1},
        background_color = {}
      },
      hovered =
      {
        font_color = {r=1, g=1, b=1},
        background_color = {r=0.4, g=0.4, b=0.4}
      },
      selected =
      {
        font_color = {r=0, g=0, b=0},
        background_color = { r=0.98, g=0.66, b=0.22}
      }
    },
    mod_invalid_listbox_item_style =
    {
      type = "listbox_item_style",
      parent = "listbox_item_style",
      default =
      {
        font_color = warning_red_color,
      },
      hovered =
      {
        font_color = warning_red_color,
      },
      selected =
      {
        font_color = warning_red_color,
      }
    },
    mod_disabled_listbox_item_style =
    {
      type = "listbox_item_style",
      parent = "listbox_item_style",
      default =
      {
        font_color = {r=0.5, g=0.5, b=0.5}
      },
      hovered =
      {
        font_color = {r=0.5, g=0.5, b=0.5}
      },
      selected =
      {
        font_color = {r=0.5, g=0.5, b=0.5}
      }
    },
    mod_updates_available_listbox_item_style =
    {
      type = "listbox_item_style",
      parent = "listbox_item_style",
      default =
      {
        font_color = {r=0.9, g=0.9, b=0}
      },
      hovered =
      {
        font_color = {r=1.0, g=1.0, b=0}
      },
      selected =
      {
        font_color = {r=1.0, g=1.0, b=0}
      }
    },
    listbox_style =
    {
      type = "listbox_style",
      font = "default-listbox",
      item_style = {
        parent = "listbox_item_style"
      },
      left_click_sound =
      {
        {
          filename = "__core__/sound/listbox-click.ogg",
          volume = 1
        }
      }
    },
    saves_listbox_style =
    {
      type = "listbox_style",
      width = 300,
      minimal_height = 100
    },
    mods_listbox_style =
    {
      type = "listbox_style",
      width = 300,
      height = 350,
      item_style = {
        parent = "listbox_item_style",
        default =
        {
          font_color = {r=1, g=1, b=1},
        },
        hovered =
        {
          font_color = {r=1, g=1, b=1},
        },
        selected =
        {
          font_color = {r=1, g=1, b=1},
        }
      }
    },
    campaigns_listbox_style =
    {
      type = "listbox_style",
      width = 300,
      height = 450
    },
    campaign_levels_listbox_style =
    {
      type = "listbox_style",
      width = 300,
      height = 350
    },
    custom_games_listbox_style =
    {
      type = "listbox_style",
      width = 300,
      height = 250
    },
    permissions_groups_listbox_style =
    {
      type = "listbox_style",
      minimal_width = 250,
      maximal_width = 250,
      minimal_height = 400,
      maximal_height = 400
    },
    permissions_players_listbox_style =
    {
      type = "listbox_style",
      minimal_width = 250,
      maximal_width = 250,
      minimal_height = 400,
      maximal_height = 400
    },
    train_station_listbox_style =
    {
      type = "listbox_style",
      minimal_height = 130,
      maximal_height = 400
    },
    floating_train_station_listbox_style =
    {
      type = "listbox_style",
      parent = "train_station_listbox_style",
      maximal_height = 800,
      minimal_width = 300
    },
    train_station_schedule_listbox_style =
    {
      type = "listbox_style",
      parent = "train_station_listbox_style",
      minimal_height = 50
    },
    load_game_mods_listbox_style =
    {
      type = "listbox_style",
      parent = "listbox_style",
      font = "default",
      item_style =
      {
        parent = "listbox_item_style",
        default =
        {
          font_color = {r=1, g=1, b=1},
          background_color = {r=0, g=0, b=0, a=0}
        },
        hovered =
        {
          font_color = {r=1, g=1, b=1},
          background_color = {r=0, g=0, b=0, a=0}
        },
        selected =
        {
          font_color = default_orange_color,
          background_color = {r=0, g=0, b=0, a=0}
        }
      }
    },

    schedule_in_train_view_list_box_style =
    {
      type = "listbox_style",
      parent = "load_game_mods_listbox_style",
      item_style =
      {
        parent = "listbox_item_style",
        default =
        {
          font_color = {r=1, g=1, b=1},
          background_color = {r=0, g=0, b=0, a=0}
        },
        hovered =
        {
          font_color = { r=0.99, g=0.83, b=0.61},
          background_color = {r=0, g=0, b=0, a=0}
        },
        selected =
        {
          font_color = { r=0.99, g=0.83, b=0.61},
          background_color = {r=0, g=0, b=0, a=0}
        }
      }
    },

    target_station_in_schedule_in_train_view_listbox_item_style =
    {
      type = "listbox_item_style",
      default =
      {
        font_color = default_orange_color,
        background_color = {r=0, g=0, b=0, a=0}
      },
      hovered =
      {
        font_color = { r=0.97, g=0.54, b=0.15},
        background_color = {r=0, g=0, b=0, a=0}
      },
      selected =
      {
        font_color = { r=0.97, g=0.54, b=0.15},
        background_color = {r=0, g=0, b=0, a=0}
      }
    },

    no_path_station_in_schedule_in_train_view_listbox_item_style =
    {
      type = "listbox_item_style",
      default =
      {
        font_color = {r=1, g=0.2, b=0.3},
        background_color = {r=0, g=0, b=0, a=0}
      },
      hovered =
      {
        font_color = {r=0.8, g=0.15, b=0.12},
        background_color = {r=0, g=0, b=0, a=0}
      },
      selected =
      {
        font_color = {r=0.8, g=0.15, b=0.12},
        background_color = {r=0, g=0, b=0, a=0}
      }
    },
    default_permission_group_listbox_item_style =
    {
      type = "listbox_item_style",
      parent = "listbox_item_style",
      default =
      {
        font_color = {r=0.55, g=0.55, b=1}
      },
      hovered =
      {
        font_color = {r=0.8, g=0.8, b=1.0}
      },
      selected =
      {
        font_color = {r=0.2, g=0.2, b=0.8}
      }
    },

    player_listbox_item_style =
    {
      type = "listbox_item_style",
      parent = "listbox_item_style"
    },
    steam_friend_listbox_item_style =
    {
      type = "listbox_item_style",
      parent = "player_listbox_item_style",
      default =
      {
        font_color = {r=0.28, g=0.58, b=0.7},
        background_color = {r=0, g=0, b=0, a=0}
      },
      hovered =
      {
        font_color = {r=0.28, g=0.58, b=0.7},
        background_color = {r=0, g=0, b=0, a=0}
      },
      selected =
      {
        font_color = {r=0.28, g=0.58, b=0.7},
        background_color = {r=0, g=0, b=0, a=0}
      }
    },

    load_game_mod_invalid_listbox_item_style =
    {
      type = "listbox_item_style",
      parent = "listbox_item_style",
      default =
      {
        font_color = warning_red_color,
        background_color = {r=0, g=0, b=0, a=0}
      },
      hovered =
      {
        font_color = warning_red_color,
        background_color = {r=0, g=0, b=0, a=0}
      },
      selected =
      {
        font_color = warning_red_color,
        background_color = {r=0, g=0, b=0, a=0}
      }
    },
    load_game_mod_disabled_listbox_item_style =
    {
      type = "listbox_item_style",
      parent = "listbox_item_style",
      default =
      {
        font_color = {r=0.5, g=0.5, b=0.5},
        background_color = {r=0, g=0, b=0, a=0}
      },
      hovered =
      {
        font_color = {r=0.5, g=0.5, b=0.5},
        background_color = {r=0, g=0, b=0, a=0}
      },
      selected =
      {
        font_color = {r=0.5, g=0.5, b=0.5},
        background_color = {r=0, g=0, b=0, a=0}
      }
    },
    flow_style =
    {
      type = "flow_style",
      horizontal_spacing = default_container_padding,
      vertical_spacing = default_container_padding,
      max_on_row = 0,
      resize_row_to_width = false,
      resize_to_row_height = false
    },
    tracked_achievements_flow_style =
    {
      type = "flow_style",
      parent = "flow_style",
      vertical_spacing = 0
    },
    achievements_flow_style =
    {
      type = "flow_style",
      parent = "flow_style",
      horizontal_spacing = 0,
      vertical_spacing = 0,
      top_padding = 0,
      right_padding = 0,
      bottom_padding = 0,
      left_padding = 0,
    },
    search_flow_style =
    {
      type = "flow_style",
      parent = "flow_style",
      top_padding = 5
    },
    description_flow_style =
    {
      type = "flow_style",
      parent = "flow_style",
      vertical_spacing = 2
    },
    mod_info_flow_style =
    {
      type = "listbox_style",
      minimal_width = 500
    },
    mod_dependency_flow_style =
    {
      type = "listbox_style",
      vertical_spacing = 1
    },
    machine_right_part_flow_style =
    {
      type = "flow_style",
      vertical_spacing = 5
    },
    table_spacing_flow_style =
    {
      type = "flow_style",
      horizontal_spacing = 5,
      vertical_spacing = 5
    },
    slot_table_spacing_flow_style =
    {
      type = "flow_style",
      horizontal_spacing = 2,
      vertical_spacing = 2
    },
    tooltip_flow_style =
    {
      type = "flow_style",
      parent = "flow_style",
      max_on_row = 1,
      resize_row_to_width = true
    },
    blueprint_shelf_flow_style =
    {
      type = "flow_style",
      parent = "flow_style",
      top_padding = 5,
      right_padding = 5,
      bottom_padding = 5,
      left_padding = 5
    },
    technology_effects_flow_style =
    {
      type = "flow_style",
      parent = "flow_style",
      horizontal_spacing = 2,
      vertical_spacing = 2,
      max_on_row = 12
    },
    table_style =
    {
      type = "table_style",
      horizontal_spacing = 5,
      vertical_spacing = 5
    },
    electric_network_sections_table_style =
    {
      type = "table_style",
      cell_padding = 5,
      horizontal_spacing=0,
      vertical_spacing=0,
      -- same as frame
      column_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {8, 0}
      }
    },
    slot_table_style=
    {
      type = "table_style",
      horizontal_spacing = 2,
      vertical_spacing = 2
    },
    control_settings_table_style =
    {
      type = "table_style",
      horizontal_spacing = 5,
      top_padding = 20,
      vertical_spacing = 7
    },
    control_settings_mod_table_style =
    {
      type = "table_style",
      parent = "control_settings_table_style",
      top_padding = 10,
      bottom_padding = 10
    },
    browse_games_table_style =
    {
      type = "table_style",
      -- default orange with alfa
      hovered_row_color = {r=0.98, g=0.66, b=0.22, a=0.7},
      selected_row_color = default_orange_color,
      cell_padding = 1,
      horizontal_spacing = 20,
      top_padding = 5,
      vertical_spacing = 5,
      odd_row_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {0, 0},
        position = {78, 18},
        opacity = 0.7
      },
      column_ordering_ascending_indicator =
      {
        type = "monolith",
        top_monolith_border = 0,
        right_monolith_border = 0,
        bottom_monolith_border = 0,
        left_monolith_border = 0,
        monolith_image =
        {
          filename = "__core__/graphics/arrows/indication-arrow-gui-ascending.png",
          priority = "extra-high-no-scale",
          width = 44,
          height = 24,
          scale = 0.5
        }
      },
      column_ordering_descending_indicator =
      {
        type = "monolith",
        top_monolith_border = 0,
        right_monolith_border = 0,
        bottom_monolith_border = 0,
        left_monolith_border = 0,
        monolith_image =
        {
          filename = "__core__/graphics/arrows/indication-arrow-gui-descending.png",
          priority = "extra-high-no-scale",
          width = 44,
          height = 24,
          scale = 0.5
        }
      }
    },
    browse_mods_table_style =
    {
      type = "table_style",
      -- default orange with alfa
      hovered_row_color = {r=0.98, g=0.66, b=0.22, a=0.7},
      selected_row_color = default_orange_color,
      cell_padding = 1,
      horizontal_spacing = 20,
      top_padding = 5,
      vertical_spacing = 5,
      odd_row_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {0, 0},
        position = {78, 18},
        opacity = 0.7
      },
      column_ordering_ascending_indicator =
      {
        type = "monolith",
        top_monolith_border = 0,
        right_monolith_border = 0,
        bottom_monolith_border = 0,
        left_monolith_border = 0,
        monolith_image =
        {
          filename = "__core__/graphics/arrows/indication-arrow-gui-ascending.png",
          priority = "extra-high-no-scale",
          width = 44,
          height = 24,
          scale = 0.5
        }
      },
      column_ordering_descending_indicator =
      {
        type = "monolith",
        top_monolith_border = 0,
        right_monolith_border = 0,
        bottom_monolith_border = 0,
        left_monolith_border = 0,
        monolith_image =
        {
          filename = "__core__/graphics/arrows/indication-arrow-gui-descending.png",
          priority = "extra-high-no-scale",
          width = 44,
          height = 24,
          scale = 0.5
        }
      }

    },
    textfield_style =
    {
      type = "textfield_style",
      left_padding = 3,
      right_padding = 2,
      minimal_width = 150,
      maximal_width = 150,
      font = "default",
      font_color = {},
      graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {16, 0}
      },
      selection_background_color= {r=0.66, g=0.7, b=0.83}
    },
    search_textfield_style =
    {
      type = "textfield_style",
      maximal_height = 26,
      graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {16, 0}
      },
    },
    console_input_textfield_style =
    {
      type = "textfield_style",
      font = "default-game",
      font_color = { r=1, g=1, b=1 },
      graphical_set =
      {
        type = "monolith",
        top_monolith_border = 2,
        right_monolith_border = 0,
        bottom_monolith_border = 2,
        left_monolith_border = 0,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 1,
          height = 1,
          x = 8,
          y = 16
        }
      }
    },
    invalid_value_textfield_style =
    {
      type = "textfield_style",
      parent = "textfield_style",
      graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {16, 16},
      },
    },
    textbox_style =
    {
      type = "textbox_style",
      font = "default",
      font_color = {},
      graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {16, 0}
      },
      selection_background_color= {r=0.66, g=0.7, b=0.83}
    },
    notice_textbox_style=
    {
      type = "textbox_style",
      parent = "textbox_style",
      graphical_set =
      {
        type = "none",
        opacity = 0
      },

      font = "default",
      font_color = {r=1, g=1, b=1},
      selection_background_color = {r=0.66, g=0.7, b=0.83},

      top_padding = 0,
      right_padding = 0,
      bottom_padding = 0,
      left_padding = 0,
    },
    number_textfield_style =
    {
      type = "textfield_style",
      minimal_width = 50
    },
    frame_style =
    {
      type = "frame_style",
      font = "default-frame",
      font_color = {r=1, g=1, b=1},
      -- padding of the title area of the frame, when the frame title
      -- is empty, the area doesn't exist and these values are not used
      title_top_padding = 0,
      title_left_padding = 0,
      title_bottom_padding = 15,
      title_right_padding = 0,
      -- padding of the content area of the frame
      top_padding  = default_container_padding - 6,
      right_padding = default_container_padding,
      bottom_padding = default_container_padding,
      left_padding = default_container_padding,
      graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        load_in_minimal_mode = true,
        corner_size = {3, 3},
        position = {8, 0}
      },
      flow_style=
      {
        horizontal_spacing = default_container_padding,
        vertical_spacing = default_container_padding
      }
    },
    -- used for frames that contains exclusively other inner frames
    outer_frame_style =
    {
      type = "frame_style",
      top_padding = 0,
      right_padding = 0,
      bottom_padding = 0,
      left_padding = 0,
      title_bottom_padding = 0,
      graphical_set = { type = "none" },
      flow_style=
      {
        horizontal_spacing = 0,
        vertical_spacing = 0,
        resize_row_to_width = true,
        resize_to_row_height = true
      }
    },
    drop_target_button_style =
    {
      type = "button_style",
      font = "default",
      default_font_color={r=1, g=1, b=1},
      align = "center",
      top_padding = 5,
      right_padding = 5,
      bottom_padding = 5,
      left_padding = 5,
      default_graphical_set =
      {
        type = "tiled_composition",
        filename = "__core__/graphics/blueprint-slot-tileset.png",
        priority = "extra-high-no-scale",
        corner_size = {9, 9},
        position = {0, 0},
        top_width = 9,
        bottom_width = 9,
        left_height = 9,
        right_height = 9,
        center_width = 9,
        center_height = 9
      },
      hovered_font_color={r=1, g=1, b=1},
      hovered_graphical_set =
      {
        type = "tiled_composition",
        filename = "__core__/graphics/blueprint-slot-tileset.png",
        priority = "extra-high-no-scale",
        corner_size = {9, 9},
        position = {27, 0},
        top_width = 9,
        bottom_width = 9,
        left_height = 9,
        right_height = 9,
        center_width = 9,
        center_height = 9
      },
      clicked_font_color={r=1, g=1, b=1},
      clicked_graphical_set =
      {
        type = "tiled_composition",
        filename = "__core__/graphics/blueprint-slot-tileset.png",
        priority = "extra-high-no-scale",
        corner_size = {9, 9},
        position = {27, 0},
        top_width = 9,
        bottom_width = 9,
        left_height = 9,
        right_height = 9,
        center_width = 9,
        center_height = 9
      },
      disabled_font_color={r=0.5, g=0.5, b=0.5},
      disabled_graphical_set =
      {
        type = "tiled_composition",
        filename = "__core__/graphics/blueprint-slot-tileset.png",
        priority = "extra-high-no-scale",
        corner_size = {9, 9},
        position = {0, 0},
        top_width = 9,
        bottom_width = 9,
        left_height = 9,
        right_height = 9,
        center_width = 9,
        center_height = 9
      },
      pie_progress_color = {r=1, g=1, b=1}
    },
    inner_frame_in_outer_frame_style =
    {
      title_bottom_padding = 10,
      type = "frame_style",
    },
    machine_frame_style =
    {
      type = "frame_style",
      parent = "inner_frame_in_outer_frame_style",
      flow_style =
      {
        horizontal_spacing = 5
      }
    },
    inner_frame_style =
    {
      type = "frame_style",
      top_padding = 0,
      right_padding = 0,
      bottom_padding = 0,
      left_padding = 0,
      title_bottom_padding = 5,
      graphical_set = { type = "none" }
    },
    tooltip_frame_style =
    {
      type = "frame_style",
      graphical_set =
      {
        type = "monolith",
        top_monolith_border = 0,
        right_monolith_border = 0,
        bottom_monolith_border = 0,
        left_monolith_border = 0,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          load_in_minimal_mode = true,
          width = 1,
          height = 1,
          x = 11,
          y = 3
        }
      }
    },
    naked_frame_style =
    {
      type = "frame_style",
      parent = "inner_frame_style",
      title_bottom_padding = 5,
    },
    technology_preview_frame_style =
    {
      type = "frame_style",
      parent = "inner_frame_in_outer_frame_style",
      flow_style =
      {
        max_on_row = 1,
        minimal_width = 520,
        resize_row_to_width = true
      }
    },
    scenario_message_dialog_style =
    {
      type = "frame_style",
      top_padding  = default_container_padding,
      graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/arrows/hint-orange-box.png",
        priority = "extra-high-no-scale",
        corner_size = {13, 13},
        position = {0, 0}
      },
      top_padding = 0,
      right_padding = 0,
      bottom_padding = 10,
      left_padding = 5
    },
    goal_frame_style =
    {
      type = "frame_style",
      parent = "frame_style"
    },
    unlocked_tutorial_card_frame_style =
    {
      type = "frame_style",
      parent = "locked_achievement_frame_style",
      bottom_padding = 4,
    },
    completed_tutorial_card_frame_style =
    {
      type = "frame_style",
      parent = "unlocked_achievement_frame_style"
    },
    locked_tutorial_card_frame_style =
    {
      type = "frame_style",
      parent = "failed_achievement_frame_style"
    },
    menu_frame_style =
    {
      type = "frame_style",
      flow_style=
      {
        vertical_spacing = 0
      }
    },
    frame_in_right_container_style =
    {
      type = "frame_style",
    },
    minimap_frame_style =
    {
      type = "frame_style",
      parent = "frame_in_right_container_style",
      minimal_height = 256
    },
    quick_bar_frame_style =
    {
      type = "frame_style",
      top_padding = default_container_padding
    },
    tool_bar_frame_style =
    {
      type = "frame_style",
      top_padding = default_container_padding
    },
    right_container_frame_style =
    {
      type = "frame_style",
      parent = "outer_frame_style",
      flow_style =
      {
        minimum_width = 10,
        horizontal_spacing = 0,
        vertical_spacing = 0,
        max_on_row = 1,
        resize_row_to_width = true
      }
    },
    right_bottom_container_frame_style =
    {
      type = "frame_style",
      parent = "outer_frame_style",
      flow_style =
      {
        horizontal_spacing = 0,
        vertical_spacing = 0,
        resize_row_to_width = true
      }
    },
    captionless_frame_style =
    {
      type = "frame_style",
      parent = "frame_style",
      top_padding = 3,
      left_padding = 3,
      right_padding = 3,
      bottom_padding = 3,
      flow_style =
      {
        horizontal_spacing = 2,
        vertical_spacing = 2,
        max_on_row = 1,
        resize_row_to_width = true
      }
    },
    side_menu_frame_style =
    {
      type = "frame_style",
      parent = "captionless_frame_style",
      flow_style =
      {
        horizontal_spacing = 2,
        vertical_spacing = 2,
        max_on_row = 1,
        resize_row_to_width = true
      }
    },
    map_view_options_frame_style =
    {
      type = "frame_style",
      parent = "captionless_frame_style",
      flow_style =
      {
        horizontal_spacing = 2,
        vertical_spacing = 2,
        max_on_row = 1,
        resize_row_to_width = true
      }
    },
    locked_achievement_frame_style =
    {
      type = "frame_style",
      parent = "frame_style",
      top_padding = default_container_padding
    },
    unlocked_achievement_frame_style =
    {
      type = "frame_style",
      parent = "frame_style",
      top_padding = default_container_padding,
      graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 24}
      }
    },
    failed_achievement_frame_style =
    {
      type = "frame_style",
      parent = "frame_style",
      top_padding = default_container_padding,
      graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 32}
      }
    },
    achievement_notification_frame_style =
    {
      type = "frame_style",
      parent = "frame_style",
      top_padding = 0,
      left_padding = 0,
      right_padding = 0,
      bottom_padding = 0,
      minimal_width = 380,
      graphical_set = { type = "none" }
    },
    progressbar_style =
    {
      type = "progressbar_style",
      progressbar_type = "smooth",
      smooth_size = 200,
      smooth_color = {g=1},
      other_smooth_colors = {},
      smooth_bar =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 5,
        x = 221,
      },
      smooth_bar_background =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 7,
        x = 222,
      },
      -- diode specifications are not used when type is smooth, but
      -- are defined here, so the derived (or this style) can just
      -- switch to diode style without specifying them
      diode_count = 10,
      diode_full =
      {
        filename = "__core__/graphics/diode-green.png",
        priority = "extra-high-no-scale",
        width = 20,
        height = 20,
      },
      diode_empty =
      {
        filename = "__core__/graphics/diode-grey.png",
        priority = "extra-high-no-scale",
        width = 20,
        height = 20,
      },
      font = "default",
      font_color = {r=1, g=1, b=1}
    },
    activity_bar_style =
    {
      type = "activity_bar_style",
      speed = 0.01,
      size = 200,
      color = {g=1},
      bar =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 5,
        x = 221,
      },
      bar_size_ratio = 0.07,
      bar_background =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 7,
        x = 222,
      },
    },
    multiplayer_activity_bar_style =
    {
      type = "activity_bar_style",
      -- exact size is calculated dynamically
    },
    production_progressbar_style =
    {
      type = "progressbar_style",
      smooth_size = 10 -- minimum
    },
    burning_progressbar_style =
    {
      type = "progressbar_style",
      smooth_color = {r=1},
      smooth_size = 10 -- minimum
    },
    health_progressbar_style =
    {
      type = "progressbar_style",
      smooth_size = 500,
      smooth_color = {g=1},
      smooth_bar =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 11,
        x = 223,
      },
      smooth_bar_background =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 13,
        x = 224
      }
    },
    achievement_progressbar_style =
    {
      type = "progressbar_style",
      progressbar_type = "smooth",
      smooth_size = 300,
      smooth_color = color "fff",
      other_smooth_colors = {},
      smooth_bar_background =
      {
        filename = "__core__/graphics/scrollbar-mini.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 7,
        x = 1,
        y = 0,
      },
      smooth_bar =
      {
        filename = "__core__/graphics/scrollbar-mini.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 5,
        x = 4,
        y = 1,
      },
      font = "default-large-semibold",
      font_color = achievement_green_color
    },
    achievement_card_progressbar_style =
    {
      type = "progressbar_style",
      parent = "achievement_progressbar_style",
      smooth_size = 252,
      maximal_width = 252,
      smooth_bar =
      {
        filename = "__core__/graphics/scrollbar-mini.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 5,
        x = 3,
        y = 1,
      },
      font = "default-semibold",
      font_color = achievement_tan_color,
    },
    achievement_pinned_card_progressbar_style =
    {
      type = "progressbar_style",
      parent = "achievement_card_progressbar_style",
      font = "default-small-semibold",
      smooth_size = 100,
    },
    vehicle_health_progressbar_style =
    {
      type = "progressbar_style",
      parent = "health_progressbar_style",
      smooth_color = {r=0.8, g=0.8, b=0.8}
    },
    mining_progressbar_style =
    {
      type = "progressbar_style",
      parent = "health_progressbar_style",
      smooth_color = default_orange_color
    },
    shield_progressbar_style =
    {
      type = "progressbar_style",
      parent = "health_progressbar_style",
      smooth_color = {r = 0.8, g = 0.2, b = 0.8}
    },
    bonus_progressbar_style =
    {
      type = "progressbar_style",
      parent = "production_progressbar_style",
      smooth_color = {r = 0.8, b = 0.8}
    },
    battery_progressbar_style =
    {
      type = "progressbar_style",
      smooth_size = 500,
      smooth_color = {g=1},
      smooth_bar =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 11,
        x = 223,
      },
      other_smooth_colors =
      {
        {
          less_than = 0.33,
          color = {r = 1}
        },
        {
          less_than = 0.66,
          color = {r = 1, g = 0.5, b = 0.25}
        },
        {
          less_than = 1,
          color = {g = 1}
        }
      }
    },
    statistics_progressbar_style =
    {
      type = "progressbar_style",
      parent = "progressbar_style"
    },
    electric_satisfaction_progressbar_style =
    {
      type = "progressbar_style",
      parent = "progressbar_style",
      other_smooth_colors =
      {
       {
          less_than = 0.5,
          color = {r = 1, g = 0, b = 0}
        },
        {
          less_than = 1,
          color = {r = 1, g = 1, b = 0}
        }
      }
    },
    electric_satisfaction_in_description_progressbar_style =
    {
      type = "progressbar_style",
      parent = "electric_satisfaction_progressbar_style",
      top_padding = 4,
      smooth_size = 10, -- minimum
    },
    checkbox_style =
    {
      type = "checkbox_style",
      font = "default",
      font_color = {r=1, g=1, b=1},
      default_background =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 16,
        height = 16,
        x = 43,
        y = 17
      },
      hovered_background =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 16,
        height = 16,
        x = 60,
        y = 17
      },
      clicked_background =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 16,
        height = 16,
        x = 77,
        y = 17
      },
      checked =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 16,
        height = 16,
        x = 94,
        y = 17
      }
    },
    radiobutton_style =
    {
      type = "radiobutton_style",
      font = "default",
      font_color = {r=1, g=1, b=1},
      default_background =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 10,
        height = 10,
        x = 43,
        y = 34
      },
      hovered_background =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 10,
        height = 10,
        x = 54,
        y = 34
      },
      clicked_background =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 10,
        height = 10,
        x = 65,
        y = 34
      },
      selected =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 10,
        height = 10,
        x = 75,
        y = 34
      }
    },
    scrollbar_style =
    {
      type = "scrollbar_style",
      background_color = {r=0.5, g=0.5, b=0.5}
    },
    tab_style =
    {
      type = "tab_style",
      font = "default-bold",
      border_color = {r = 0.6, g = 0.6, b = 0.6},
      default_font_color = {r = 1, g = 1, b = 1},
      selected_font_color = default_orange_color,
      top_padding = 8,
      right_padding = 8,
      bottom_padding = 8,
      left_padding = 8
    },
    graph_style =
    {
      type = "graph_style",
      width = 550,
      height = 200,
      background_color = {r=0.1, g=0.1, b=0.1, a=0.9},
      line_colors=
      {
        {r=0.22, g=0.41, b=0.69},
        {r=0.85, g=0.48, b=0.18},
        {r=0.24, g=0.58, b=0.31},
        {r=0.8, g=0.1, b=0.16},
        {r=0.553, g=0.365, b=0.675},
        {r=0.87, g=0.72, b=0},
        {r=0, g=0.667, b=0.7},
        {r=0.47, g=0.47, b=0.47},
        {r=0.816, g=0.533, b=0.72},
        {r=0.565, g=0.33, b=0.22},
        {r=0.49, g=0.7, b=0},
        {r=0.58, g=0.69, b=0.898},
        {r=0.937, g=0.714, b=0.604},
        {r=0.518, g=0.753, b=0.592},
        {r=1, g=0.57, b=0.565},
        {r=0.78, g=0.682, b=0.87},
        {r=0.945, g=0.86, b=0.467},
        {r=0.514, g=0.843, b=0.81},
        {r=0.733, g=0.733, b=0.733},
        {r=0.906, g=0.733, b=0.84},
        {r=0.67, g=0.855, b=0.486},
        {r=0.72, g=0.604, b=0.553}
      }
    },
    slider_style=
    {
      type = "slider_style",
      width = 300,
      height = 15,
      left_side_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 8}
      },
      right_side_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {16, 0}
      },
      button_style=
      {
        width = 15,
        height = 15,
        top_padding = 0,
        right_padding = 0,
        bottom_padding = 0,
        left_padding = 0,
        default_graphical_set =
        {
          type = "monolith",
          monolith_image =
          {
            filename = "__core__/graphics/gui.png",
            priority = "extra-high-no-scale",
            width = 15,
            height = 15,
            x = 47
          }
        },
        hovered_graphical_set =
        {
          type = "monolith",
          monolith_image =
          {
            filename = "__core__/graphics/gui.png",
            priority = "extra-high-no-scale",
            width = 15,
            height = 15,
            x = 63
          }
        },
        clicked_graphical_set =
        {
          type = "monolith",
          monolith_image =
          {
            filename = "__core__/graphics/gui.png",
            priority = "extra-high-no-scale",
            width = 15,
            height = 15,
            x = 79
          }
        }
      }
    },
    scroll_pane_style =
    {
      type = "scroll_pane_style",
      vertical_scroll_bar_spacing = default_container_padding,
      horizontal_scroll_bar_spacing = default_container_padding,
      flow_style =
      {
        parent = "flow_style"
      }
    },
    browse_games_scroll_pane_style =
    {
      type = "scroll_pane_style",
      parent = "scroll_pane_style",
      vertical_scroll_bar_spacing = 5
    },
    browse_mods_scroll_pane_style =
    {
      type = "scroll_pane_style",
      parent = "scroll_pane_style",
      vertical_scroll_bar_spacing = 5
    }
  }
}
)

local util = require("util")
local color = util.color

default_container_padding = 8
-- As the frame font is too high, this value is used to decrease the frame font top padding so the title top marging looks proper
default_frame_font_vertical_compensation = -6
default_orange_color = {r = 0.98, g = 0.66, b = 0.22}
default_light_orange_color = {r = 1, g = 0.74, b = 0.40}
warning_red_color = {r = 1, g = 0.2, b = 0.3}

achievement_green_color = color "96ce82"
achievement_tan_color = color "d1c58e"

function orangebuttongraphcialset()
  return
  {
    type = "monolith",
    monolith_border = 1,
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
    monolith_border = 1,
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

    label =
    {
      type = "label_style",
      font = "default",
      font_color = {r=1, g=1, b=1},
      single_line = true,
      want_ellipsis = false
    },
    fake_disabled_label =
    {
      type = "label_style",
      font_color = {r=0.5, g=0.5, b=0.5}
    },
    bold_label =
    {
      type = "label_style",
      font = "default-bold",
    },
    hoverable_bold_label =
    {
      type = "label_style",
      font = "default-bold",
      hovered_font_color = {r = 0.5 * (1 + default_orange_color.r),
                            g = 0.5 * (1 + default_orange_color.g),
                            b = 0.5 * (1 + default_orange_color.b)}
    },
    bold_red_label =
    {
      type = "label_style",
      parent = "bold_label",
      font_color = {r=1, g=0, b=0}
    },
    bold_green_label =
    {
      type = "label_style",
      parent = "bold_label",
      font_color = {r=0, g=1, b=0}
    },
    -- Used as table caption, or in "Caption: value"
    caption_label =
    {
      type = "label_style",
      parent = "bold_label",
      font_color = default_orange_color
    },
    large_caption_label =
    {
      type = "label_style",
      parent = "caption_label",
      font = "default-large-bold"
    },
    invalid_label =
    {
      type = "label_style",
      parent = "label",
      font_color = warning_red_color
    },
    scenario_message_dialog_label=
    {
      type = "label_style",
      parent = "label",
      width = 400,
      font = "scenario-message-dialog",
      font_color = {r=0, g=0, b=0}
    },
    goal_label =
    {
      type = "label_style",
      parent = "label",
      font = "scenario-message-dialog",
      width = 364,
      font_color = {r=1, g=1, b=1}
    },
    electric_usage_label =
    {
      type = "label_style",
      parent = "label",
      width = 60
    },
    mod_dependency_invalid_label =
    {
      type = "label_style",
      parent = "label",
      font_color = warning_red_color
    },
    mod_optional_dependency_invalid_label =
    {
      type = "label_style",
      parent = "label",
      font_color = default_orange_color
    },
    mod_manager_label =
    {
      type = "label_style",
      parent = "label",
      maximal_width = 350,
      single_line = false
    },
    description_label =
    {
      type = "label_style",
      parent = "label",
      font = "default-semibold"
    },
    description_value_label =
    {
      type = "label_style",
      parent = "label",
      font = "default",
      font_color = default_light_orange_color
    },
    description_remark_label =
    {
      type = "label_style",
      parent = "label",
      font = "default-semibold",
    },
    description_title_label =
    {
      type = "label_style",
      parent = "description_label",
      font = "default-bold"
    },
    tool_equip_gui_label =
    {
      type = "label_style",
      parent = "description_label"
    },
    tooltip_label =
    {
      type = "label_style",
      parent = "description_label"
    },
    tooltip_title_label =
    {
      type = "label_style",
      parent = "description_label",
      font = "default-bold",
      minimal_width = 100,
      maximal_width = 350,
    },
    recipe_tooltip_cannot_craft_label =
    {
      type = "label_style",
      parent = "tooltip_label",
      font_color = warning_red_color,
    },
    recipe_tooltip_transitive_craft_label =
    {
      type = "label_style",
      parent = "tooltip_label",
      font_color = default_orange_color,
    },
    frame_caption_label =
    {
      type = "label_style",
      parent = "label",
      font = "default-frame",
      font_color = {r=1, g=1, b=1}
    },
    mod_list_label =
    {
      type = "label_style",
      parent = "label",
      font = "default-bold",
      font_color = {r=0.9, g=0.9, b=0.1},
      minimal_width = 210
    },
    menu_message =
    {
      type = "label_style",
      font = "default-bold",
      font_color = default_orange_color
    },
    button =
    {
      type = "button_style",
      font = "default-button",
      default_font_color = {r=1, g=1, b=1},
      align = "middle-center",
      padding = 5,
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
      clicked_font_color = {r=1, g=1, b=1},
      clicked_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        load_in_minimal_mode = true,
        corner_size = {3, 3},
        position = {0, 40}
      },
      disabled_font_color = {r=0.5, g=0.5, b=0.5},
      disabled_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        load_in_minimal_mode = true,
        corner_size = {3, 3},
        position = {0, 16}
      },
      pie_progress_color = {r=1, g=1, b=1},
      left_click_sound =
      {
        {
          filename = "__core__/sound/gui-click.ogg",
          volume = 1
        }
      }
    },

    horizontal_line =
    {
      type = "horizontal_line_style",
      line_color = {r=1, g=1, b=1},
      line_width = 1,
      height = 3
    },

    achievement_title_label =
    {
      type = "label_style",
      parent = "label",
      font = "default-bold",
      font_color = color "ff"
    },
    achievement_percent_label =
    {
      type = "label_style",
      parent = "label",
      font = "default-large-semibold",
      font_color = achievement_green_color
    },
    achievement_unlocked_title_label =
    {
      type = "label_style",
      parent = "achievement_title_label",
      font_color = achievement_green_color
    },
    achievement_locked_title_label =
    {
      type = "label_style",
      parent = "achievement_title_label",
      font_color = achievement_tan_color
    },
    achievement_failed_title_label =
    {
      type = "label_style",
      parent = "achievement_title_label",
      font_color = color "8f7676"
    },

    achievement_description_label =
    {
      type = "label_style",
      parent = "label",
      font = "default",
      font_color = color "ff"
    },
    achievement_unlocked_description_label =
    {
      type = "label_style",
      parent = "achievement_description_label",
    },
    achievement_locked_description_label =
    {
      type = "label_style",
      parent = "achievement_description_label",
    },
    achievement_failed_description_label =
    {
      type = "label_style",
      parent = "achievement_description_label",
      font_color = color "8f7676"
    },

    achievement_locked_progress_label =
    {
      type = "label_style",
      parent = "label",
      font = "default-semibold",
      font_color = achievement_tan_color
    },
    achievement_failed_reason_label =
    {
      type = "label_style",
      parent = "label",
      font = "default-small",
      font_color = color "e2dbdb"
    },

    tutorial_list_description_label =
    {
      type = "label_style",
      parent = "label",
      --font = "scenario-message-dialog",
      font = "default",
      --width = 364,
      font_color = {r=1, g=1, b=1}
    },

    tutorial_title_label =
    {
      type = "label_style",
      parent = "label",
      font = "default-large-bold",
      font_color = achievement_tan_color,
      minimal_width = 250,
      maximal_width = 250
    },
    tutorial_locked_title_label =
    {
      type = "label_style",
      parent = "tutorial_title_label"
    },
    tutorial_completed_title_label =
    {
      type = "label_style",
      parent = "tutorial_title_label",
      font_color = achievement_green_color,
    },

    tutorial_description_label =
    {
      type = "label_style",
      parent = "label",
      --font = "scenario-message-dialog",
      font = "default",
      width = 364,
      font_color = {r=1, g=1, b=1}
    },

    tutorial_notice_title_label =
    {
      type = "label_style",
      parent = "label",
      --font = "default",
      font = "default-large-bold",
      font_color = color "ff",
      minimal_width = 250,
      maximal_width = 250
    },
    tutorial_notice_name_label =
    {
      type = "label_style",
      parent = "label",
      font = "default-large",
      font_color = color "ff",
    },
    tutorial_notice_label =
    {
      type = "label_style",
      parent = "label",
      font_color = color "ff",
    },
    tutorial_icon_image =
    {
      type = "image_style",
      width = 96,
      height = 96
    },
    achievement_image =
    {
      type = "image_style",
      width = 100,
      height = 100
    },

    installed_mod_label =
    {
      type = "label_style",
      font_color = {r=0, g=0.9, b=0}
    },

    downloading_mod_label =
    {
      type = "label_style",
      font_color = {r=255, g=255, b=50}
    },

    to_be_downloaded_mod_label =
    {
      type = "label_style",
      font_color = {r=50, g=255, b=255}
    },

    out_of_date_mod_label =
    {
      type = "label_style",
      font_color = {r=0.9, g=0.9, b=0}
    },

    incompatible_mod_label =
    {
      type = "label_style",
      font_color = warning_red_color
    },

    invalid_mod_label =
    {
      type = "label_style",
      font_color = warning_red_color
    },

    disabled_mod_label =
    {
      type = "label_style",
      font_color = {r=0.5, g=0.5, b=0.5}
    },

    flip_button_left =
    {
      type = "button_style",
      font = "default-button",
      default_font_color = {r=1, g=1, b=1},
      width = 32,
      height = 15,
      padding = 5,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
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
        monolith_border = 1,
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
        monolith_border = 1,
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

    flip_button_right =
    {
      type = "button_style",
      font = "default-button",
      default_font_color = {r=1, g=1, b=1},
      width = 32,
      height = 15,
      padding = 5,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
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
        monolith_border = 1,
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
        monolith_border = 1,
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

    flip_button_middle =
    {
      type = "button_style",
      font = "default-button",
      default_font_color = {r=1, g=1, b=1},
      width = 32,
      height = 15,
      padding = 5,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/switch-button-gui.png",
          priority = "extra-high-no-scale",
          width = 32,
          height = 15,
          x = 64
        }
      },
      clicked_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/switch-button-gui.png",
          priority = "extra-high-no-scale",
          width = 32,
          height = 15,
          x = 64,
          y = 30
        }
      },
      hovered_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/switch-button-gui.png",
          priority = "extra-high-no-scale",
          width = 32,
          height = 15,
          x = 64,
          y = 15
        }
      },
      pie_progress_color = {r=1, g=1, b=1}
    },

    fake_disabled_button =
    {
      type = "button_style",
      parent = "button",

      default_font_color = {r=0.5, g=0.5, b=0.5},
      hovered_font_color = {r=0.5, g=0.5, b=0.5},
      hovered_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 0}
      },
      clicked_font_color = {r=0.5, g=0.5, b=0.5},
      clicked_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 0}
      }
    },
    dialog_button =
    {
      type = "button_style",
      parent = "button",
      minimal_width = 100,
      minimal_height = 30,
    },

    play_tutorial_button =
    {
      type = "button_style",
      parent = "button",
      font = "default",
    },
    play_completed_tutorial_button =
    {
      type = "button_style",
      parent = "play_tutorial_button",
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 24}
      }
    },
    play_locked_tutorial_button =
    {
      type = "button_style",
      parent = "play_tutorial_button",
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 32}
      }
    },
    play_tutorial_disabled_button =
    {
      type = "button_style",
      parent = "fake_disabled_button",
      font = "default"
    },

    menu_button =
    {
      type = "button_style",
      parent = "button",
      font = "default-button",
      minimal_width = 300,
      minimal_height = 50,
    },

    search_mods_button =
    {
      type = "button_style",
      parent = "button",
      padding = 2
    },

    icon_button =
    {
      type = "button_style",
      parent = "button",
      scalable = true,
      default_font_color = {r=0, g=0, b=0},
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

    side_menu_button =
    {
      type = "button_style",
      parent = "icon_button"
    },
    side_menu_button_hovered =
    {
      type = "button_style",
      parent = "icon_button",
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        corner_size = {3, 3},
        position = {0, 8}
      },
    },
    map_view_options_button =
    {
      type = "button_style",
      parent = "icon_button"
    },

    mod_gui_button =
    {
      type = "button_style",
      parent = "button",
      scalable = true,
      minimal_width = 36,
      height = 36,
      padding = 1,
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {8, 0}
      }
    },

    image_tab_slot =
    {
      type = "button_style",
      parent = "slot_button",
      scalable = false,
      width = 68,
      height = 68,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
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
        monolith_border = 1,
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
        monolith_border = 1,
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
    image_tab_selected_slot =
    {
      type = "button_style",
      parent = "image_tab_slot",
      scalable = false,
      width = 68,
      height = 68,
      default_graphical_set = orangebuttongraphcialset(),
      hovered_graphical_set =  orangebuttongraphcialset(),
      clicked_graphical_set = orangebuttongraphcialset()
    },
    logistic_button_slot =
    {
      type = "button_style",
      parent = "slot_button"
    },
    logistic_button_selected_slot =
    {
      type = "button_style",
      parent = "slot_button",
      default_graphical_set = orangebuttongraphcialset(),
      hovered_graphical_set =  orangebuttongraphcialset(),
      clicked_graphical_set = orangebuttongraphcialset()
    },
    red_circuit_network_content_slot =
    {
      type = "button_style",
      parent = "slot_button",
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
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

    green_circuit_network_content_slot =
    {
      type = "button_style",
      parent = "slot_button",
      scalable = false,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
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

    slot_button =
    {
      type = "button_style",
      parent = "button",
      scalable = false,
      width = 36,
      height = 36,
      padding = 1,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
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
        monolith_border = 1,
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
        monolith_border = 1,
        monolith_image =
        {
          filename = "__core__/graphics/gui.png",
          priority = "extra-high-no-scale",
          width = 36,
          height = 36,
          x = 185
        }
      },
      pie_progress_color = {r=0.98, g=0.66, b=0.22, a = 0.5},
      left_click_sound = {}
    },

    recipe_slot_button =
    {
      type = "button_style",
      parent = "slot_button",
      scalable = false,
      width = 36,
      height = 36,
      padding = 1,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
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
        monolith_border = 1,
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
        monolith_border = 1,
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

    switch_quickbar_button =
    {
      type = "button_style",
      parent = "button",
      scalable = false,
      width = 22,
      height = 22,
      padding = 1,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
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
        monolith_border = 1,
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
        monolith_border = 1,
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

    small_slot_button =
    {
      type = "button_style",
      parent = "slot_button",
      width = 20,
      height = 20,
      scalable = false
    },

    tracking_off_button =
    {
      type = "button_style",
      parent = "button",
      scalable = false,
      padding = 0,
      width = 3+16+3,
      height = 3+16+3,
    },

    tracking_on_button =
    {
      type = "button_style",
      parent = "tracking_off_button",
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

    technology_slot_button =
    {
      type = "button_style",
      parent = "crafting_queue_slot",
      scalable = false,
      width = 68,
      height = 68
    },

    blueprint_record_slot_button =
    {
      type = "button_style",
      parent = "button",
      width = 76,
      height = 76,
      scalable = false
    },

    blueprint_drop_slot_button =
    {
      type = "button_style",
      parent = "button",
      width = 76,
      height = 76,
      scalable = false
    },

    search_button =
    {
      type = "button_style",
      parent = "slot_button",
      width = 28,
      height = 28
    },

    edit_label_button =
    {
      type = "button_style",
      parent = "slot_button",
      width = 28,
      height = 28
    },

    selected_slot_button =
    {
      type = "button_style",
      parent = "slot_button",
      default_graphical_set =  orangebuttongraphcialset(),
      hovered_graphical_set =  orangebuttongraphcialset(),
      clicked_graphical_set = orangebuttongraphcialset()
    },

    slot_with_filter_button =
    {
      type = "button_style",
      parent = "slot_button",
      default_graphical_set =  bluebuttongraphcialset("default"),
      hovered_graphical_set =  bluebuttongraphcialset("hovered"),
      clicked_graphical_set = bluebuttongraphcialset("clicked")
    },

    not_available_slot_button =
    {
      type = "button_style",
      parent = "slot_button",
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
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
        monolith_border = 1,
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
        monolith_border = 1,
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
    circuit_condition_sign_button =
    {
      type = "button_style",
      parent = "button",
      top_padding = 0,
      right_padding = 5,
      bottom_padding = 1,
      left_padding = 5
    },

    available_technology_slot =
    {
      type = "button_style",
      parent = "slot_button",
      scalable = false,
      width = 68,
      height = 68 + 16,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
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
        monolith_border = 1,
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
        monolith_border = 1,
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

    red_slot_button =
    {
      type = "button_style",
      parent = "slot_button",
      scalable = false,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
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
        monolith_border = 1,
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
        monolith_border = 1,
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

    not_available_technology_slot =
    {
      type = "button_style",
      parent = "red_slot_button",
      scalable = false,
      width = 68,
      height = 68 + 16,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
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
        monolith_border = 1,
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
        monolith_border = 1,
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

    disabled_technology_slot =
    {
      type = "button_style",
      parent = "slot_button",
      scalable = false,
      visible = false,
      width = 68,
      height = 68
    },

    green_slot_button =
    {
      type = "button_style",
      parent = "slot_button",
      scalable = false,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
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
        monolith_border = 1,
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
        monolith_border = 1,
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

    working_weapon_button =
    {
      type = "button_style",
      parent = "green_slot_button"
    },

    not_working_weapon_button =
    {
      type = "button_style",
      parent = "red_slot_button"
    },

    researched_technology_slot =
    {
      type = "button_style",
      parent = "green_slot_button",
      scalable = false,
      width = 68,
      height = 68 + 16,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
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
        monolith_border = 1,
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
        monolith_border = 1,
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

    available_preview_technology_slot =
    {
      type = "button_style",
      parent = "available_technology_slot",
      scalable = false,
      width = 132,
      height = 132
    },

    not_available_preview_technology_slot =
    {
      type = "button_style",
      parent = "not_available_technology_slot",
      scalable = false,
      width = 132,
      height = 132
    },

    omitted_technology_slot =
    {
      type = "button_style",
      scalable = false,
      width = 10,
      height = 8,
      padding = 0,
      default_graphical_set =
      {
        type = "none"
      },
      hovered_graphical_set =
      {
        type = "none"
      }
    },

    researched_preview_technology_slot =
    {
      type = "button_style",
      parent = "researched_technology_slot",
      scalable = false,
      width = 132,
      height = 132
    },

    crafting_queue_slot =
    {
      type = "button_style",
      parent = "slot_button",
      pie_progress_color = {r=0.98, g=0.66, b=0.22, a = 0.5},
      scalable = false
    },
    promised_crafting_queue_slot =
    {
      type = "button_style",
      parent = "crafting_queue_slot",
      scalable = false,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
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
        monolith_border = 1,
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
        monolith_border = 1,
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
    partially_promised_crafting_queue_slot =
    {
      type = "button_style",
      parent = "crafting_queue_slot",
      scalable = false,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 1,
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
        monolith_border = 1,
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
        monolith_border = 1,
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
    controls_settings_button =
    {
      type = "button_style",
      parent = "button",
      font = "default-bold",
      align = "left",
      minimal_width = 225,
      maximal_width = 225,
      top_padding = 0,
      right_padding = 2,
      bottom_padding = 0,
      left_padding = 2,
      default_font_color = {},
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {8, 8}
      }
    },
    controls_settings_disabled_button =
    {
      type = "button_style",
      parent = "controls_settings_button",
      default_font_color = {r=0.5, g=0.5, b=0.5},
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        load_in_minimal_mode = true,
        corner_size = {3, 3},
        position = {0, 16}
      },
    },
    auth_actions_button =
    {
      type = "button_style",
      parent = "button",
      font = "default-bold",
      align = "left",
      top_padding = 0,
      right_padding = 2,
      bottom_padding = 0,
      left_padding = 2
    },
    delete_achievements_button =
    {
      type = "button_style",
      parent = "button",
      font = "default-bold",
      align = "left",
      top_padding = 0,
      right_padding = 2,
      bottom_padding = 0,
      left_padding = 2
    },
    dropdown =
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
      list_box_style =
      {
        type = "list_box_style",
        font = "default"
      }
    },
    map_settings_dropdown =
    {
      type = "dropdown_style",
      parent = "dropdown",
      minimal_width = 200
    },
    logistic_networks_dropdown =
    {
      type = "dropdown_style",
      parent = "dropdown",
      minimal_width = 200
    },
    list_box_item =
    {
      type = "list_box_item_style",
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
    mod_invalid_list_box_item =
    {
      type = "list_box_item_style",
      parent = "list_box_item",
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
    mod_disabled_list_box_item =
    {
      type = "list_box_item_style",
      parent = "list_box_item",
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
    mod_updates_available_list_box_item =
    {
      type = "list_box_item_style",
      parent = "list_box_item",
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
    list_box =
    {
      type = "list_box_style",
      font = "default-listbox",
      item_style =
      {
        type = "list_box_item_style",
        parent = "list_box_item"
      },
      left_click_sound =
      {
        {
          filename = "__core__/sound/list-box-click.ogg",
          volume = 1
        }
      }
    },
    map_generation_settings_presets_list_box =
    {
      type = "list_box_style",
      width = 300,
      minimal_height = 125
    },
    saves_list_box =
    {
      type = "list_box_style",
      width = 300,
      minimal_height = 100
    },
    mods_list_box =
    {
      type = "list_box_style",
      width = 300,
      height = 350,
      item_style =
      {
        type = "list_box_item_style",
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
    campaigns_list_box =
    {
      type = "list_box_style",
      width = 300,
      height = 450
    },
    campaign_levels_list_box =
    {
      type = "list_box_style",
      width = 300,
      height = 350
    },
    custom_games_list_box =
    {
      type = "list_box_style",
      width = 300,
      height = 250
    },
    permissions_groups_list_box =
    {
      type = "list_box_style",
      minimal_width = 250,
      maximal_width = 250,
      minimal_height = 400,
      maximal_height = 400
    },
    permissions_players_list_box =
    {
      type = "list_box_style",
      minimal_width = 250,
      maximal_width = 250,
      minimal_height = 400,
      maximal_height = 400
    },
    train_station_list_box =
    {
      type = "list_box_style",
      minimal_height = 130,
      maximal_height = 400,
      minimal_width = 300
    },
    floating_train_station_list_box =
    {
      type = "list_box_style",
      parent = "train_station_list_box",
      maximal_height = 800,
      minimal_width = 300
    },
    train_station_schedule_list_box =
    {
      type = "list_box_style",
      parent = "train_station_list_box",
      minimal_height = 50
    },
    load_game_mods_list_box =
    {
      type = "list_box_style",
      font = "default",
      item_style =
      {
        type = "list_box_item_style",
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

    schedule_in_train_view_list_box =
    {
      type = "list_box_style",
      parent = "load_game_mods_list_box",
      item_style =
      {
        type = "list_box_item_style",
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
      },
      width = 200,
      height = 80
    },

    locomotive_minimap_button =
    {
      type = "button_style",
      parent = "button",
      width = 200,
      height = 150
    },
    target_station_in_schedule_in_train_view_list_box_item =
    {
      type = "list_box_item_style",
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

    no_path_station_in_schedule_in_train_view_list_box_item =
    {
      type = "list_box_item_style",
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
    default_permission_group_list_box_item =
    {
      type = "list_box_item_style",
      parent = "list_box_item",
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

    player_list_box_item =
    {
      type = "list_box_item_style",
      parent = "list_box_item"
    },
    steam_friend_list_box_item =
    {
      type = "list_box_item_style",
      parent = "player_list_box_item",
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

    load_game_mod_invalid_list_box_item =
    {
      type = "list_box_item_style",
      parent = "list_box_item",
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
    load_game_mod_disabled_list_box_item =
    {
      type = "list_box_item_style",
      parent = "list_box_item",
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
    flow =
    {
      type = "flow_style",
      horizontal_spacing = default_container_padding,
      vertical_spacing = default_container_padding,
      max_on_row = 0
    },

    horizontal_flow =
    {
      type = "horizontal_flow_style",
      horizontal_spacing = default_container_padding,
    },

    vertical_flow =
    {
      type = "vertical_flow_style",
      vertical_spacing = default_container_padding,
    },

    tips_inner_flow =
    {
      type = "flow_style",
      left_padding = 25,
      right_padding = 25,
      vertical_spacing = 2
    },
    goal_holder_vertical_flow =
    {
      type = "vertical_flow_style",
      vertical_spacing = 0
    },
    browse_games_right_part_vertical_flow =
    {
      type = "vertical_flow_style",
      width = 400
    },
    tracked_achievements_vertical_flow =
    {
      type = "vertical_flow_style",
      vertical_spacing = 0
    },
    achievements_vertical_flow =
    {
      type = "vertical_flow_style",
      vertical_spacing = 0
    },
    description_vertical_flow =
    {
      type = "vertical_flow_style",
      vertical_spacing = 2
    },
    mod_info_vertical_flow =
    {
      type = "vertical_flow_style",
      width = 500
    },
    mod_dependency_vertical_flow =
    {
      type = "vertical_flow_style",
      vertical_spacing = 1
    },
    machine_right_part_flow =
    {
      type = "flow_style",
      vertical_spacing = 5
    },
    machine_right_part_vertical_flow =
    {
      type = "vertical_flow_style",
      vertical_spacing = 5
    },
    table_spacing_flow =
    {
      type = "flow_style",
      horizontal_spacing = 5,
      vertical_spacing = 5
    },
    table_spacing_vertical_flow =
    {
      type = "vertical_flow_style",
      vertical_spacing = 5
    },
    slot_table_spacing_flow =
    {
      type = "flow_style",
      horizontal_spacing = 2,
      vertical_spacing = 2
    },
    slot_table_spacing_vertical_flow =
    {
      type = "vertical_flow_style",
      vertical_spacing = 2
    },
    slot_table_spacing_horizontal_flow =
    {
      type = "horizontal_flow_style",
      horizontal_spacing = 2
    },
    blueprint_shelf_flow =
    {
      type = "vertical_flow_style",
      padding = 5
    },
    circuit_buttons_in_frame_title_flow =
    {
      type = "horizontal_flow_style",
      top_padding = -default_frame_font_vertical_compensation
    },
    table =
    {
      type = "table_style",
      horizontal_spacing = 5,
      vertical_spacing = 5
    },
    table_with_selection =
    {
      type = "table_style",
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
      column_ordering_ascending_button_style =
      {
        type = "button_style",
        width = 22,
        height = 12,
        padding = 0,
        default_graphical_set =
        {
          type = "monolith",
          monolith_border = 0,
          monolith_image =
          {
            filename = "__core__/graphics/arrows/indication-arrow-gui-ascending.png",
            priority = "extra-high-no-scale",
            width = 44,
            height = 24
          }
        },
        hovered_graphical_set =
        {
          type = "monolith",
          monolith_border = 0,
          monolith_image =
          {
            filename = "__core__/graphics/arrows/indication-arrow-gui-ascending-hovered.png",
            priority = "extra-high-no-scale",
            width = 44,
            height = 24
          }
        },
        clicked_graphical_set =
        {
          type = "monolith",
          monolith_border = 0,
          monolith_image =
          {
            filename = "__core__/graphics/arrows/indication-arrow-gui-ascending.png",
            priority = "extra-high-no-scale",
            width = 44,
            height = 24
          }
        },
        disabled_graphical_set =
        {
          type = "monolith",
          monolith_border = 0,
          monolith_image =
          {
            filename = "__core__/graphics/arrows/indication-arrow-gui-ascending.png",
            priority = "extra-high-no-scale",
            width = 44,
            height = 24
          }
        }
      },

      column_ordering_descending_button_style =
      {
        type = "button_style",
        width = 22,
        height = 12,
        default_graphical_set =
        {
          type = "monolith",
          monolith_border = 0,
          monolith_image =
          {
            filename = "__core__/graphics/arrows/indication-arrow-gui-descending.png",
            priority = "extra-high-no-scale",
            width = 44,
            height = 24
          }
        },
        hovered_graphical_set =
        {
          type = "monolith",
          monolith_border = 0,
          monolith_image =
          {
            filename = "__core__/graphics/arrows/indication-arrow-gui-descending-hovered.png",
            priority = "extra-high-no-scale",
            width = 44,
            height = 24
          }
        },
        clicked_graphical_set =
        {
          type = "monolith",
          monolith_border = 0,
          monolith_image =
          {
            filename = "__core__/graphics/arrows/indication-arrow-gui-descending.png",
            priority = "extra-high-no-scale",
            width = 44,
            height = 24
          }
        },
        disabled_graphical_set =
        {
          type = "monolith",
          monolith_border = 0,
          monolith_image =
          {
            filename = "__core__/graphics/arrows/indication-arrow-gui-descending.png",
            priority = "extra-high-no-scale",
            width = 44,
            height = 24
          }
        }
      },
      inactive_column_ordering_ascending_button_style =
      {
        type = "button_style",
        width = 22,
        height = 12,
        default_graphical_set =
        {
          type = "monolith",
          monolith_border = 0,
          monolith_image =
          {
            filename = "__core__/graphics/arrows/inactive-arrow-gui-ascending.png",
            priority = "extra-high-no-scale",
            width = 44,
            height = 24
          }
        },
        hovered_graphical_set =
        {
          type = "monolith",
          onolith_border = 0,
          monolith_image =
          {
            filename = "__core__/graphics/arrows/inactive-arrow-gui-ascending-hovered.png",
            priority = "extra-high-no-scale",
            width = 44,
            height = 24
          }
        },
        clicked_graphical_set =
        {
          type = "monolith",
          monolith_border = 0,
          monolith_image =
          {
            filename = "__core__/graphics/arrows/inactive-arrow-gui-ascending.png",
            priority = "extra-high-no-scale",
            width = 44,
            height = 24
          }
        },
        disabled_graphical_set =
        {
          type = "monolith",
          monolith_border = 0,
          monolith_image =
          {
            filename = "__core__/graphics/arrows/inactive-arrow-gui-ascending.png",
            priority = "extra-high-no-scale",
            width = 44,
            height = 24
          }
        }
      },
      inactive_column_ordering_descending_button_style =
      {
        type = "button_style",
        width = 22,
        height = 12,
        default_graphical_set =
        {
          type = "monolith",
          monolith_border = 0,
          monolith_image =
          {
            filename = "__core__/graphics/arrows/inactive-arrow-gui-descending.png",
            priority = "extra-high-no-scale",
            width = 44,
            height = 24
          }
        },
        hovered_graphical_set =
        {
          type = "monolith",
          onolith_border = 0,
          monolith_image =
          {
            filename = "__core__/graphics/arrows/inactive-arrow-gui-descending-hovered.png",
            priority = "extra-high-no-scale",
            width = 44,
            height = 24
          }
        },
        clicked_graphical_set =
        {
          type = "monolith",
          monolith_border = 0,
          monolith_image =
          {
            filename = "__core__/graphics/arrows/inactive-arrow-gui-descending.png",
            priority = "extra-high-no-scale",
            width = 44,
            height = 24
          }
        },
        disabled_graphical_set =
        {
          type = "monolith",
          monolith_border = 0,
          monolith_image =
          {
            filename = "__core__/graphics/arrows/inactive-arrow-gui-descending.png",
            priority = "extra-high-no-scale",
            width = 44,
            height = 24
          }
        }
      }
    },
    electric_network_sections_table =
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
    slot_table=
    {
      type = "table_style",
      horizontal_spacing = 2,
      vertical_spacing = 2
    },
    control_settings_table =
    {
      type = "table_style",
      horizontal_spacing = 5,
      vertical_spacing = 7
    },
    browse_games_table =
    {
      type = "table_style",
      parent = "table_with_selection",
      -- default orange with alfa
      hovered_row_color = {r=0.98, g=0.66, b=0.22, a=0.7},
      selected_row_color = default_orange_color,
      cell_padding = 1,
      horizontal_spacing = 20,
      top_padding = 5,
      left_padding = 10,
      vertical_spacing = 5,
      column_widths =
      {
        { -- favorite
          column = 1,
          width = 20
        },
        { -- game name
          column = 2,
          width = 310
        },
        { -- players
          column = 3,
          width = 100
        },
        { -- playtime
          column = 4,
          width = 100
        }
      }
    },
    browse_games_on_lan_table =
    {
      type = "table_style",
      parent = "browse_games_table",
      column_widths =
      {
        { -- game name
          column = 1,
          width = 310
        },
        { -- players
          column = 2,
          width = 100
        },
        { -- playtime
          column = 3,
          width = 100
        }
      }
    },
    browse_games_gui_favorites_header_image =
    {
      type = "image_style",
      width = 16,
      height = 16
    },
    browse_games_gui_toggle_favorite_on_button =
    {
      type = "button_style",
      width = 16,
      height = 16,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 0,
        monolith_image =
        {
          filename = "__core__/graphics/favourite.png",
          priority = "extra-high-no-scale",
          width = 64,
          height = 64
        }
      },
      hovered_graphical_set =
      {
        type = "monolith",
        monolith_border = 0,
        monolith_image =
        {
          filename = "__core__/graphics/favourite-hovered.png",
          priority = "extra-high-no-scale",
          width = 64,
          height = 64
        }
      },
      clicked_graphical_set =
      {
        type = "monolith",
        monolith_border = 0,
        monolith_image =
        {
          filename = "__core__/graphics/favourite-hovered.png",
          priority = "extra-high-no-scale",
          width = 64,
          height = 64
        }
      },
      disabled_graphical_set =
      {
        type = "monolith",
        monolith_border = 0,
        monolith_image =
        {
          filename = "__core__/graphics/favourite.png",
          priority = "extra-high-no-scale",
          width = 64,
          height = 64
        }
      }
    },

    browse_games_gui_toggle_favorite_off_button =
    {
      type = "button_style",
      width = 16,
      height = 16,
      default_graphical_set =
      {
        type = "monolith",
        monolith_border = 0,
        monolith_image =
        {
          filename = "__core__/graphics/favourite-grey.png",
          priority = "extra-high-no-scale",
          width = 64,
          height = 64
        }
      },
      hovered_graphical_set =
      {
        type = "monolith",
        monolith_border = 0,
        monolith_image =
        {
          filename = "__core__/graphics/favourite-grey-hovered.png",
          priority = "extra-high-no-scale",
          width = 64,
          height = 64
        }
      },
      clicked_graphical_set =
      {
        type = "monolith",
        monolith_border = 0,
        monolith_image =
        {
          filename = "__core__/graphics/favourite-grey-hovered.png",
          priority = "extra-high-no-scale",
          width = 64,
          height = 64
        }
      },
      disabled_graphical_set =
      {
        type = "monolith",
        monolith_border = 0,
        monolith_image =
        {
          filename = "__core__/graphics/favourite-grey.png",
          priority = "extra-high-no-scale",
          width = 64,
          height = 64
        }
      }
    },

    browse_mods_table =
    {
      type = "table_style",
      parent = "table_with_selection",
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
        monolith_border = 0,
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
        monolith_border = 0,
        monolith_image =
        {
          filename = "__core__/graphics/arrows/indication-arrow-gui-descending.png",
          priority = "extra-high-no-scale",
          width = 44,
          height = 24,
          scale = 0.5
        }
      },
      column_widths =
      {
        { -- mod name
          column = 1,
          width = 300
        },
        { -- version
          column = 2,
          minimal_width = 50
        },
        { -- downloads
          column = 3,
          minimal_width = 95
        },
        { -- last updated
          column = 4,
          minimal_width = 110
        }
      }
    },
    textfield =
    {
      type = "textfield_style",
      left_padding = 3,
      right_padding = 2,
      width = 150,
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
      disabled_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {16, 24}
      },
      selection_background_color= {r=0.66, g=0.7, b=0.83}
    },
    info_box_textbox =
    {
      type = "textbox_style",
      parent = "notice_textbox",
      width = 300
    },
    search_textfield =
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
    console_input_textfield =
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
    invalid_value_textfield =
    {
      type = "textfield_style",
      parent = "textfield",
      graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {16, 16},
      },
    },
    textbox =
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
    notice_textbox =
    {
      type = "textbox_style",
      parent = "textbox",
      graphical_set =
      {
        type = "none",
        opacity = 0
      },

      font = "default",
      font_color = {r=1, g=1, b=1},
      selection_background_color = {r=0.66, g=0.7, b=0.83},
      padding = 0
    },
    mod_startup_settings_mismatch_notice_box =
    {
      type = "textbox_style",
      parent = "notice_textbox",
      width = 400
    },
    changelog_textbox =
    {
      type = "textbox_style",
      parent = "textbox",
      minimal_width = 850,
      vertically_stretchable = "on",
      horizontally_stretchable = "on"
    },
    reader_textbox =
    {
      type = "textbox_style",
      parent = "textbox",
      minimal_width = 600,
      height = 500
    },
    number_textfield =
    {
      type = "textfield_style",
      minimal_width = 50
    },
    frame =
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
      top_padding  = default_container_padding + default_frame_font_vertical_compensation,
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
      flow_style =
      {
        type = "flow_style",
        horizontal_spacing = default_container_padding,
        vertical_spacing = default_container_padding
      },

      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        horizontal_spacing = default_container_padding,
      },

      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = default_container_padding
      },

      header_flow_style =
      {
        type = "horizontal_flow_style",
        top_padding = 5
      }
    },
    -- used for frames that contains exclusively other inner frames
    outer_frame =
    {
      type = "frame_style",
      padding = 0,
      title_bottom_padding = 0,
      graphical_set = { type = "none" },
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        horizontal_spacing = 0,
      },
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 0,
      }
    },
    drop_target_button =
    {
      type = "button_style",
      font = "default",
      default_font_color={r=1, g=1, b=1},
      padding = 5,
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
    inner_frame_in_outer_frame =
    {
      title_bottom_padding = 10,
      type = "frame_style",
    },
    machine_frame =
    {
      type = "frame_style",
      parent = "inner_frame_in_outer_frame",
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        horizontal_spacing = 5
      }
    },
    inner_frame =
    {
      type = "frame_style",
      padding = 0,
      title_bottom_padding = 5,
      graphical_set = { type = "none" }
    },
    tooltip_frame =
    {
      type = "frame_style",
      graphical_set =
      {
        type = "monolith",
        monolith_border = 0,
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
      },
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 2
      }
    },
    tooltip_generated_from_description_frame =
    {
      type = "frame_style",
      parent = "tooltip_frame",
      maximal_width = 350
    },
    naked_frame =
    {
      type = "frame_style",
      parent = "inner_frame",
      title_bottom_padding = 5,
    },
    technology_preview_frame =
    {
      type = "frame_style",
      parent = "inner_frame_in_outer_frame",
    },
    scenario_message_dialog =
    {
      type = "frame_style",
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
    goal_frame =
    {
      type = "frame_style",
      parent = "frame",
      top_padding = 2,
      left_padding = 2
    },
    image_frame =
    {
      type = "frame_style",
      parent = "frame",
      graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        load_in_minimal_mode = true,
        corner_size = {3, 3},
        position = {0, 40}
      },
      padding = 0
    },
    tips_frame =
    {
      type = "frame_style",
      parent = "frame",
      left_padding = 30,
      right_padding = 30,
      width = 704,
      minimal_height = 576,
      scalable = false,
    },
    unlocked_tutorial_card_frame =
    {
      type = "frame_style",
      parent = "locked_achievement_in_sidebar_frame",
      bottom_padding = 4,
    },
    completed_tutorial_card_frame =
    {
      type = "frame_style",
      parent = "unlocked_achievement_in_sidebar_frame"
    },
    locked_tutorial_card_frame =
    {
      type = "frame_style",
      parent = "failed_achievement_in_sidebar_frame"
    },
    menu_frame =
    {
      type = "frame_style",
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 0
      }
    },
    frame_in_right_container =
    {
      type = "frame_style",
    },
    minimap_frame =
    {
      type = "frame_style",
      parent = "frame_in_right_container",
      minimal_height = 256
    },
    quick_bar_frame =
    {
      type = "frame_style",
      top_padding = default_container_padding
    },
    tool_bar_frame =
    {
      type = "frame_style",
      top_padding = default_container_padding
    },
    right_container_frame =
    {
      type = "frame_style",
      parent = "outer_frame",
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        minimum_width = 10,
        vertical_spacing = 0,
      }
    },
    right_bottom_container_frame =
    {
      type = "frame_style",
      parent = "outer_frame",
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 0
      }
    },
    captionless_frame =
    {
      type = "frame_style",
      parent = "frame",
      padding = 3
    },
    side_menu_frame =
    {
      type = "frame_style",
      parent = "captionless_frame",
      right_padding = default_container_padding,
      left_padding = default_container_padding,
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        horizontal_spacing = 2
      }
    },
    map_view_options_frame =
    {
      type = "frame_style",
      parent = "captionless_frame",
      right_padding = default_container_padding,
      left_padding = default_container_padding,
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        horizontal_spacing = 2
      }
    },
    locked_achievement_in_sidebar_frame =
    {
      type = "frame_style",
      parent = "frame",
      top_padding = default_container_padding
    },
    locked_achievement_frame =
    {
      type = "frame_style",
      parent = "locked_achievement_in_sidebar_frame",
      width = 400,
    },

    unlocked_achievement_in_sidebar_frame =
    {
      type = "frame_style",
      parent = "frame",
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
    unlocked_achievement_frame =
    {
      type = "frame_style",
      parent = "unlocked_achievement_in_sidebar_frame",
      width = 400,
    },

    failed_achievement_in_sidebar_frame =
    {
      type = "frame_style",
      parent = "frame",
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
    failed_achievement_frame =
    {
      type = "frame_style",
      parent = "failed_achievement_in_sidebar_frame",
      width = 400
    },
    achievement_notification_frame =
    {
      type = "frame_style",
      parent = "frame",
      padding = 0,
      width = 400,
      graphical_set = { type = "none" }
    },
    blueprint_library_frame =
    {
      type = "frame_style",
      parent = "outer_frame",
      height = 600
    },
    progressbar =
    {
      type = "progressbar_style",
      minimal_width = 10,
      natural_width = 200,
      bar_width = 7, -- thickness of the bar, not horizontal size
      color = {g=1},
      other_colors = {},
      bar =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 5,
        x = 221,
      },
      bar_background =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 7,
        x = 222,
      },
      font = "default",
      font_color = {r=1, g=1, b=1}
    },
    activity_bar =
    {
      type = "activity_bar_style",
      speed = 0.01, -- % of bar length per render frame
      minimal_width = 10,
      natural_width = 200,
      bar_width = 7, -- thickness of the bar, not horizontal size
      color = {g=1},
      bar =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 5,
        x = 221,
      },
      bar_size_ratio = 0.07, -- length of the moving bar as % of total length
      bar_background =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 7,
        x = 222,
      },
    },
    multiplayer_activity_bar =
    {
      type = "activity_bar_style",
      -- exact size is calculated dynamically
    },
    info_box_activity_bar =
    {
      type = "activity_bar_style",
      width = 300
    },
    info_box_progressbar =
    {
      type = "progressbar_style",
      width = 300
    },
    production_progressbar =
    {
      type = "progressbar_style"
    },
    burning_progressbar =
    {
      type = "progressbar_style",
      color = {r=1}
    },
    health_progressbar =
    {
      type = "progressbar_style",
      horizontally_stretchable = "on",
      horizontally_stretchable = "on",
      bar_width = 13,
      color = {g=1},
      bar =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 11,
        x = 223,
      },
      bar_background =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 13,
        x = 224
      }
    },
    achievement_progressbar =
    {
      type = "progressbar_style",
      minimal_width = 300,
      bar_width = 7,
      color = color "fff",
      other_colors = {},
      bar_background =
      {
        filename = "__core__/graphics/scrollbar-mini.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 7,
        x = 1,
        y = 0,
      },
      bar =
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
    achievement_card_progressbar =
    {
      type = "progressbar_style",
      parent = "achievement_progressbar",
      right_padding = 10,
      bar =
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
    achievement_pinned_card_progressbar =
    {
      type = "progressbar_style",
      parent = "achievement_card_progressbar",
      font = "default-small-semibold",
      right_padding = 3,
    },
    vehicle_health_progressbar =
    {
      type = "progressbar_style",
      parent = "health_progressbar",
      color = {r=0.8, g=0.8, b=0.8}
    },
    mining_progressbar =
    {
      type = "progressbar_style",
      parent = "health_progressbar",
      color = default_orange_color
    },
    shield_progressbar =
    {
      type = "progressbar_style",
      parent = "health_progressbar",
      color = {r = 0.8, g = 0.2, b = 0.8}
    },
    bonus_progressbar =
    {
      type = "progressbar_style",
      parent = "production_progressbar",
      color = {r = 0.8, b = 0.8}
    },
    battery_progressbar =
    {
      type = "progressbar_style",
      bar_width = 13,
      height = 33,
      color = {g=1},
      bar =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 1,
        height = 11,
        x = 223,
      },
      other_colors =
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
    statistics_progressbar =
    {
      type = "progressbar_style"
    },
    electric_satisfaction_progressbar =
    {
      type = "progressbar_style",
      other_colors =
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
    electric_satisfaction_in_description_progressbar =
    {
      type = "progressbar_style",
      parent = "electric_satisfaction_progressbar",
      top_padding = 2, -- to compensate the text not looking centered
      height = 9
    },
    checkbox =
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
      disabled_background =
      {
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        width = 16,
        height = 16,
        x = 26,
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
    radiobutton =
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
    horizontal_scrollbar =
    {
      type = "horizontal_scrollbar_style",
      height = 16,
      background_color = {r=0.5, g=0.5, b=0.5},
      thumb_button_style =
      {
        type = "button_style",
        left_click_sound = {},
        height = 16
      },
      top_button_style =
      {
        type = "button_style",
        width = 16,
        height = 16
      },
      bottom_button_style =
      {
        type = "button_style",
        width = 16,
        height = 16,
      }
    },
    vertical_scrollbar =
    {
      type = "vertical_scrollbar_style",
      width = 16,
      background_color = {r=0.5, g=0.5, b=0.5},
      thumb_button_style =
      {
        type = "button_style",
        left_click_sound = {},
        width = 16
      },
      top_button_style =
      {
        type = "button_style",
        width = 16,
        height = 16
      },
      bottom_button_style =
      {
        type = "button_style",
        width = 16,
        height = 16
      }
    },
    tab =
    {
      type = "tab_style",
      font = "default-bold",
      border_color = {r = 0.6, g = 0.6, b = 0.6},
      default_font_color = {r = 1, g = 1, b = 1},
      selected_font_color = default_orange_color,
      padding = 8
    },
    graph =
    {
      type = "graph_style",
      natural_width = 550, -- it resizes to 550 by default, but it can be squashed to be smaller
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
    slider =
    {
      type = "slider_style",
      minimal_width = 200,
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
      button_style =
      {
        type = "button_style",
        width = 15,
        height = 15,
        padding = 0,
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
        },
        left_click_sound = {}
      }
    },
    scroll_pane =
    {
      type = "scroll_pane_style",
      vertical_scroll_bar_spacing = default_container_padding,
      horizontal_scroll_bar_spacing = default_container_padding,
      vertically_squashable = "on",
      horizontally_squashable = "on",
    },

    browse_games_scroll_pane =
    {
      type = "scroll_pane_style",
      vertical_scroll_bar_spacing = 5
    },
    browse_mods_scroll_pane =
    {
      type = "scroll_pane_style",
      vertical_scroll_bar_spacing = 5
    },
    machine_ingredients_scroll_pane =
    {
      type = "scroll_pane_style",
      vertically_squashable = "off",
      maximal_height = 100,
    },
    machine_outputs_scroll_pane =
    {
      type = "scroll_pane_style",
      vertically_squashable = "off",
      maximal_height = 100,
    },
    module_inventory_scroll_pane =
    {
      type = "scroll_pane_style",
      vertically_squashable = "off",
      maximal_height = 100
    },
    trash_slots_scroll_pane =
    {
      type = "scroll_pane_style",
      vertically_squashable = "off",
      maximal_height = 100
    },
    logistic_gui_scroll_pane =
    {
      type = "scroll_pane_style",
      height = 400,
      width = 570
    },
    camera =
    {
      type = "camera_style",
    },
    minimap =
    {
      type = "minimap_style",
      minimal_height = 256,
      minimal_width = 256
    },
    image =
    {
      type = "image_style",
    },
    tabbed_pane =
    {
      type = "tabbed_pane_style",
      vertical_spacing = default_container_padding
    },
    empty_widget =
    {
      type = "empty_widget_style"
    },
    entity_button =
    {
      type = "entity_button_style",
      width = 100,
      height = 100
    },
    entity_button_base =
    {
      type = "empty_widget_style",
      width = 100,
      height = 100
    },
    fluid_wagon_entity_button =
    {
      type = "empty_widget_style",
      width = 150,
      height = 150
    },
    battery_widget =
    {
      type = "empty_widget_style",
      width = 21,
      height = 54
    }
  }
}
)

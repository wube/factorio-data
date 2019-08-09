local add_styles = function(styles)
  local default_styles = data.raw["gui-style"].default
  for name, style in pairs(styles) do
    default_styles[name] = style
  end
end

add_styles(
  {
    quest_item_description =
    {
      type = "label_style",
      font = "default",
      font_color = {r=1, g=1, b=1},
      rich_text_setting = "enabled",
      single_line = false,
      maximal_width = 250,
      left_padding = 3,
      top_padding = 2,
      horizontal_align = "left"
    },

    quest_item_subheading =
    {
      type = "label_style",
      font_color = {r=255, g=230, b=192},
      font = "default-semibold",
      single_line = true,
      left_padding = 3,
      horizontal_align = "left"
    },
    quest_item_description_uncomplete =
    {
      type = "label_style",
      parent = "quest_item_description",
      font_color = {r=1, g=1, b=1},
    },
    quest_item_description_progressing =
    {
      type = "label_style",
      parent = "quest_item_description",
      font_color = {r=255, g=204, b=0},
    },
    quest_item_description_complete =
    {
      type = "label_style",
      parent = "quest_item_description",
      font_color = {r=210, g=253, b=145},
    },
    quest_item_description_failed =
    {
      type = "label_style",
      parent = "quest_item_description",
      font_color = {r=250, g=90, b=90},
    },
    quest_item_description_info =
    {
      type = "label_style",
      parent = "quest_item_description",
      font_color = {r=128, g=206, b=240},
    },
    quest_item_description_first =
    {
      type = "label_style",
      parent = "quest_item_description",
      font_color = heading_font_color,
    },
    quest_gui_frame =
    {
      type = "frame_style",
      parent = "frame",
      padding = 0,
      use_header_filler = false,
      horizontally_stretchable = "on",

      top_padding = 0,
      left_padding = 8,
      right_padding = 8,
      bottom_padding = 4,

      right_margin = 10,
      bottom_margin = 10,
    },
    quest_item_table =
    {
      type = "table_style",
      parent = "table",
      cell_padding = 0,
      top_padding = 0,
      left_padding = 4,
      right_padding = 4,
      bottom_padding = 4,
      vertical_spacing = 0,
      horizontally_stretchable = "on",
      odd_row_graphical_set =
      {
        base = {position = {324, 8}, size = {1, 1}},
      }
    },

    quest_gui_entry_wrapper_common =
    {
      type = "horizontal_flow_style",
      horizontal_spacing = 2,
      minimal_height = 24,
      vertical_align = 'top'
    },

    quest_hint_row =
    {
      type = "horizontal_flow_style",
      horizontal_spacing = 2,
      top_padding = 0,
      bottom_padding = 0,
      left_padding = 0,
      right_padding = 0,
      vertically_stretchable = "off",
      horizontally_stretchable = "on",
    },
    quest_hint_description_wrapper =
    {
      type = "horizontal_flow_style",
      parent = 'quest_gui_entry_wrapper_common'
    },
    quest_hint_description =
    {
      type = "label_style",
      font = "default",
      font_color = { r = 255, g = 255, b = 255 },
      rich_text_setting = "enabled",
      single_line = false,
      left_padding = 3,
      horizontal_align = "left",
      maximal_width = 350
    },

    quest_item_description_wrapper =
    {
      type = "horizontal_flow_style",
      parent = 'quest_gui_entry_wrapper_common',
    },
    quest_item_count_wrapper =
    {
      type = "horizontal_flow_style",
      parent = 'quest_gui_entry_wrapper_common',
      left_padding = 4
    },
    quest_item_icons_wrapper =
    {
      type = "horizontal_flow_style",
      parent = 'quest_gui_entry_wrapper_common',
      horizontal_align = "left",
      left_padding = 15
    },
    quest_item_icons_label =
    {
      type = "label_style",
      parent = "label",
      font = 'default'
    },
    open_close_hints_button =
    {
      type = "button_style",
      default_graphical_set =
      {
        base = {position = {0, 0}, corner_size = 8},
        shadow = default_shadow
      },
      font = 'heading-2',
      default_font_color = heading_font_color,
      width = 28,
      height = 28,

      padding = 0,
      right_margin = 12,
    },

    quest_gui_inner_frame =
    {
      type = "frame_style",
      parent = "frame",
      graphical_set =
      {
        base =
        {
          center =
          {
            position = {76, 8},
            size = {1, 1}
          },

          position = {17, 0},
          corner_size = 8,
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },

      top_margin = 4,
      bottom_margin = 4,

      padding = 0,
    },

    quest_gui_inner_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "scroll_pane",
      graphical_set =
      {
        base =
        {
          center =
          {
            position = {76, 8},
            size = {1, 1}
          },

          position = {17, 0},
          corner_size = 8,
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },

      top_margin = 4,
      bottom_margin = 4,
    },

    quest_hint_info_sprite =
    {
      type = "image_style",
      width = 8,
      height = 8,
      left_margin = 8,
      right_margin = 4,
      top_margin = 6,
      stretch_image_to_widget_size = true,
    },
  }
)
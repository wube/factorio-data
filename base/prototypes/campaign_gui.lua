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
    quest_vertical_flow =
    {
      type = "vertical_flow_style",
      vertical_spacing = 0,
    },
    quest_gui_frame =
    {
      type = "frame_style",
      parent = "frame",
      padding = 0,
      use_header_filler = false,
      horizontally_stretchable = "on"
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
        base = {position = {43, 8}, size = {1, 1}},
      }
    },

    quest_gui_entry_wrapper_common =
    {
      type = "horizontal_flow_style",
      horizontal_spacing = 2,
      minimal_height = 26,
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
    quest_hint_wrapper =
    {
      type = "horizontal_flow_style",
      parent = "quest_gui_entry_wrapper_common",
      minimal_width = 30,
      horizontal_align = "center"
    },
    quest_hint_icon_label =
    {
      type = "label_style",
      parent = "label",
      font = 'default'
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
      font_color = { r = 128, g = 206, b = 240 },
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
      left_padding = 4
    },
    quest_item_icons_label =
    {
      type = "label_style",
      parent = "label",
      font = 'default'
    },
    quest_item_state_icon_wrapper =
    {
      type = "horizontal_flow_style",
      parent = 'quest_gui_entry_wrapper_common',
      horizontal_align = 'center',
      left_padding = 4
    },
    quest_item_state_icon_label =
    {
      type = "label_style",
      parent = "label",
      font = 'default'
    },
    quest_gui_more_button =
    {
      type = "button_style",
      default_graphical_set =
      {
        base = {position = {0, 0}, corner_size = 8},
        shadow = default_shadow
      },
      font = 'heading-2',
      default_font_color = heading_font_color,
      horizontally_stretchable = "on",
      height = 25,
    }
  }
)
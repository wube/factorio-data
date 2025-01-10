local util = require("util")
local color = util.color

default_glow_color = {225, 177, 106, 255}
default_shadow_color = {0, 0, 0, 0.35}
hard_shadow_color = {0, 0, 0, 1}
default_dirt_color = {15, 7, 3, 100}
default_dirt_color_filler = {15, 7, 3, 56}
default_container_padding = 4
default_container_spacing = 4 -- one module spacing

-- Button
button_default_font_color = {} -- less surface of black (not bold), we need it to be pure black
button_hovered_font_color = {}
button_default_bold_font_color = {28, 28, 28} -- more surface of black, we don't need it to be pure black
-- slots
default_slot_glow_color = {255, 174, 0, 128}
red_slot_glow_color = {255, 166, 123, 128}
green_slot_glow_color = {34, 255, 75, 128}
blue_slot_glow_color = {34, 181, 255, 128}

technology_slot_base_width = 88
technology_slot_base_height = 88
featured_technology_slot_base_width = 136
featured_technology_slot_base_height = 168

green_button_glow_color = {135, 216, 139, 128}
red_button_glow_color = {254, 90, 90, 128}

red_body_text_color = {255, 136, 136}

arrow_tileset_width = 48
arrow_tileset_height = 64
arrow_tileset_composition_corner_size = 8

grey_arrow_tileset = {arrows_tileset = {0, 232}, composition_tileset = {0, 17}}
green_arrow_tileset = {arrows_tileset = {0, 296}, composition_tileset = {68, 17}}
red_arrow_tileset = {arrows_tileset = {0, 360}, composition_tileset = {136, 17}}

arrow_idle_index = 0
arrow_disabled_index = 1
arrow_hovered_index = 2
arrow_clicked_index = 3


gui_color =
{
  white = {1, 1, 1},
  white_with_alpha = {1, 1, 1, 0.5},
  grey = {0.5, 0.5, 0.5},
  green = {0, 1, 0},
  red = {255, 142, 142},
  orange = {0.98, 0.66, 0.22},
  light_orange = {1, 0.74, 0.40},
  caption = {255, 230, 192},
  achievement_green = {210, 253, 145},
  achievement_tan = {255, 230, 192},
  achievement_failed = {176, 171, 171},
  achievement_failed_body = {255, 136, 136},
  blue = {128, 206, 240}
}

-- Determined by the subheader height plus a number of list box items in the station view
-- It doesn't have to be... but its nice when they all align perfectly
train_gui_minimap_size = 36 + (28 * 8)

slot_size = 40
slot_table_column_count = 10
slot_table_width = slot_size * slot_table_column_count

-- 10 slots width
entity_button_width = slot_table_width
-- 4 slots height, -8 for the vertical spacing so the next line of slots align
entity_button_height = (4 * slot_size) - 8

right_menu_width = 6 * slot_size

production_graph_width = 556

function back_button_glow(glow_color)
  return
  {
    left = {position = {304, 424}, size = {32, 80}},
    right_top = {position = {209, 128}, size = arrow_tileset_composition_corner_size},
    right = {position = {209, 128 + arrow_tileset_composition_corner_size}, size = {arrow_tileset_composition_corner_size, 1}},
    right_bottom = {position = {209, 128 + arrow_tileset_composition_corner_size + 1}, size = arrow_tileset_composition_corner_size},
    center = {position = {336, 424}, size = {1, 80}},
    left_outer_border_shift = 12,
    tint = glow_color,
    draw_type = "outer"
  }
end

function forward_button_glow(glow_color)
  return
  {
    right = {position = {336, 424}, size = {32, 80}},
    left_top = {position = {200, 128}, size = arrow_tileset_composition_corner_size},
    left = {position = {200, 128 + arrow_tileset_composition_corner_size}, size = {arrow_tileset_composition_corner_size, 1}},
    left_bottom = {position = {200, 128 + arrow_tileset_composition_corner_size + 1}, size = arrow_tileset_composition_corner_size},
    center = {position = {336, 424}, size = {1, 80}},
    right_outer_border_shift = -12,
    tint = glow_color,
    draw_type = "outer"
  }
end

function double_arrow_forward_button_glow(glow_color)
  return
  {
    right = {position = {336, 424}, size = {32, 80}},
    left = {position = {305, 504}, size = {32, 80}},
    center = {position = {336, 424}, size = {1, 80}},
    top_outer_border_shift = -4,
    bottom_outer_border_shift = 4,
    right_outer_border_shift = -12,
    left_outer_border_shift = 12,
    tint = glow_color,
    draw_type = "outer"
  }
end

function notched_slider_glow(glow_color)
  return
  {
    center = {position = {96, 184}, size = {40, 48}},
    top_outer_border_shift = -2,
    left_outer_border_shift = -4,
    right_outer_border_shift = 4,
    bottom_outer_border_shift = 4,
    tint = glow_color,
    draw_type = "outer"
  }
end

function left_slider_glow(glow_color)
  return
  {
    center = {position = {481, 96}, size = {56, 40}},
    top_outer_border_shift = -4,
    left_outer_border_shift = -4,
    right_outer_border_shift = 4,
    bottom_outer_border_shift = 4,
    tint = glow_color,
    draw_type = "outer"
  }
end

function right_slider_glow(glow_color)
  return
  {
    center = {position = {537, 96}, size = {56, 40}},
    top_outer_border_shift = -4,
    left_outer_border_shift = -4,
    right_outer_border_shift = 4,
    bottom_outer_border_shift = 4,
    tint = glow_color,
    draw_type = "outer"
  }
end

function arrow_back(tileset, index, glow_name, glow_color)
  local arrow_shift = index * arrow_tileset_width * 2
  local composition_shift = index * (arrow_tileset_composition_corner_size * 2 + 1)
  local result =
  {
    base =
    {
      left = {position = {tileset.arrows_tileset[1] + arrow_shift, tileset.arrows_tileset[2]},
              size = {arrow_tileset_width / 2, arrow_tileset_height}},
      right_top = {position = {tileset.composition_tileset[1] + arrow_tileset_composition_corner_size + 1 + composition_shift,
                               tileset.composition_tileset[2]},
                   size = arrow_tileset_composition_corner_size},
      right = {position = {tileset.composition_tileset[1] + arrow_tileset_composition_corner_size + 1 + composition_shift,
                           tileset.composition_tileset[2] + arrow_tileset_composition_corner_size},
               size = {arrow_tileset_composition_corner_size, 1}},
      right_bottom = {position = {tileset.composition_tileset[1] + arrow_tileset_composition_corner_size + 1 + composition_shift,
                                  tileset.composition_tileset[2] + arrow_tileset_composition_corner_size + 1},
                      size = arrow_tileset_composition_corner_size},
      center = {position = {tileset.arrows_tileset[1] + arrow_tileset_width / 2 + arrow_shift,
                            tileset.arrows_tileset[2]},
                size = {1, arrow_tileset_height}}
    }
  }
  if (glow_name) then
    result[glow_name] = back_button_glow(glow_color)
  end
  return result
end

function arrow_forward(tileset, index, glow_name, glow_color)
  local arrow_shift = index * arrow_tileset_width * 2
  local composition_shift = index * (arrow_tileset_composition_corner_size * 2 + 1)
  local result =
  {
    base =
    {
      right = {position = {tileset.arrows_tileset[1] + arrow_tileset_width / 2 + arrow_shift, tileset.arrows_tileset[2]},
               size = {arrow_tileset_width / 2, arrow_tileset_height}},
      left_top = {position = {tileset.composition_tileset[1] + composition_shift,
                              tileset.composition_tileset[2]},
                   size = arrow_tileset_composition_corner_size},
      left = {position = {tileset.composition_tileset[1] + composition_shift,
                          tileset.composition_tileset[2] + arrow_tileset_composition_corner_size},
              size = {arrow_tileset_composition_corner_size, 1}},
      left_bottom = {position = {tileset.composition_tileset[1] + composition_shift,
                                 tileset.composition_tileset[2] + arrow_tileset_composition_corner_size + 1},
                     size = arrow_tileset_composition_corner_size},
      center = {position = {tileset.arrows_tileset[1] + arrow_tileset_width / 2 + arrow_shift,
                            tileset.arrows_tileset[2]},
                size = {1, arrow_tileset_height}}
    }
  }
  if (glow_name) then
    result[glow_name] = forward_button_glow(glow_color)
  end
  return result
end

function double_arrow_forward(tileset, index, glow_name, glow_color)
  local arrow_shift = index * arrow_tileset_width * 2
  local composition_shift = index * (arrow_tileset_composition_corner_size * 2 + 1)
  local result =
  {
    base =
    {
      right = {position = {tileset.arrows_tileset[1] + arrow_tileset_width / 2 + arrow_shift, tileset.arrows_tileset[2]},
               size = {arrow_tileset_width / 2, arrow_tileset_height}},
      left = {position = {tileset.arrows_tileset[1] + arrow_tileset_width + arrow_shift, tileset.arrows_tileset[2]},
               size = {arrow_tileset_width / 2, arrow_tileset_height}},
      center = {position = {tileset.arrows_tileset[1] + arrow_tileset_width / 2 + arrow_shift,
                            tileset.arrows_tileset[2]},
                size = {1, arrow_tileset_height}}
    }
  }
  if (glow_name) then
    result[glow_name] = double_arrow_forward_button_glow(glow_color)
  end
  return result
end

function default_inner_glow(tint_value, scale_value)
  return
  {
    position = {183, 128},
    corner_size = 8,
    tint = tint_value,
    scale = scale_value,
    draw_type = "inner"
  }
end

function default_glow(tint_value, scale_value)
  return
  {
    position = {200, 128},
    corner_size = 8,
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end

function offset_by_2_default_glow(tint_value, scale_value)
  return
  {
    position = {280, 736},
    corner_size = 16,
    tint = tint_value,
    scale = scale_value,
    top_outer_border_shift = 4,
    bottom_outer_border_shift = -4,
    left_outer_border_shift = 4,
    right_outer_border_shift = -4,
    draw_type = "outer"
  }
end

offset_by_4_rounded_corners_shallow_inset =
{
  position = {345, 103},
  corner_size = 16,
  draw_type = "outer",
  top_outer_border_shift = 4,
  bottom_outer_border_shift = -4,
  left_outer_border_shift = 4,
  right_outer_border_shift = -4
}

function tab_glow(tint_value, scale_value)
  return
  {
    left_top = {position = {216, 0}, size = 16},
    top = {position = {208, 128}, size = {1, 8}},
    right_top = {position = {232, 0}, size = 16},
    left = {position = {200, 136}, size = {8, 1}},
    right = {position = {209, 136}, size = {8, 1}},
    top_outer_border_shift = 4,
    left_outer_border_shift = 4,
    right_outer_border_shift = -4,
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end

function top_and_bottom_inner_glow(tint_value, scale_value)
  return
  {
    top = {position = {191, 128}, size = {1, 8}},
    bottom = {position = {191, 137}, size = {1, 8}},
    tint = tint_value,
    scale = scale_value,
    draw_type = "inner"
  }
end

function top_glow(tint_value, scale_value) --only top side
  return
  {
    top = {position = {208, 128}, size = {1, 8}},
    center = {position = {208, 136}, size = {1, 1}},
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end

function bottom_glow(tint_value, scale_value) --only bottom side
  return
  {
    bottom = {position = {208, 137}, size = {1, 8}},
    center = {position = {208, 136}, size = {1, 1}},
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end

function top_bottom_glow(tint_value, scale_value) --only top and bottom side
  return
  {
    top = {position = {208, 128}, size = {1, 8}},
    bottom = {position = {208, 137}, size = {1, 8}},
    center = {position = {208, 136}, size = {1, 1}},
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end

function top_glow(tint_value, scale_value) --only top side
  return
  {
    top = {position = {208, 128}, size = {1, 8}},
    center = {position = {208, 136}, size = {1, 1}},
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end

function glow_without_left(tint_value, scale_value)
  return
  {
    top = {position = {208, 128}, size = {1, 8}},
    right_top = {position = {209, 128}, size = {8, 8}},
    right = {position = {209, 136}, size = {8, 1}},
    right_bottom = {position = {209, 137}, size = {8, 8}},
    bottom = {position = {208, 137}, size = {1, 8}},
    center = {position = {208, 136}, size = {1, 1}},
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end

function glow_without_right(tint_value, scale_value)
  return
  {
    top = {position = {208, 128}, size = {1, 8}},
    left_top = {position = {200, 128}, size = {8, 8}},
    left = {position = {200, 136}, size = {8, 1}},
    left_bottom = {position = {200, 137}, size = {8, 8}},
    bottom = {position = {208, 137}, size = {1, 8}},
    center = {position = {208, 136}, size = {1, 1}},
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end

function glow_without_top(tint_value, scale_value)
  return
  {
    right = {position = {209, 136}, size = {8, 1}},
    left = {position = {200, 136}, size = {8, 1}},
    left_bottom = {position = {200, 137}, size = {8, 8}},
    bottom = {position = {208, 137}, size = {1, 8}},
    right_bottom = {position = {209, 137}, size = {8, 8}},
    center = {position = {208, 136}, size = {1, 1}},
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end

function glow_without_bottom(tint_value, scale_value)
  return
  {
    top = {position = {208, 128}, size = {1, 8}},
    right_top = {position = {209, 128}, size = {8, 8}},
    right = {position = {209, 136}, size = {8, 1}},
    left = {position = {200, 136}, size = {8, 1}},
    left_top = {position = {200, 128}, size = {8, 8}},
    center = {position = {208, 136}, size = {1, 1}},
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end

function top_right_glow(tint_value, scale_value)
  return
  {
    top = {position = {208, 128}, size = {1, 8}},
    right_top = {position = {209, 128}, size = {8, 8}},
    right = {position = {209, 136}, size = {8, 1}},
    center = {position = {208, 136}, size = {1, 1}},
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end

function top_left_glow(tint_value, scale_value)
  return
  {
    top = {position = {208, 128}, size = {1, 8}},
    --right_top = {position = {209, 128}, size = {8, 8}},
    left = {position = {200, 136}, size = {8, 1}},
    left_top = {position = {200, 128}, size = {8, 8}},
    center = {position = {208, 136}, size = {1, 1}},
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end

function bottom_right_glow(tint_value, scale_value)
  return
  {
    right = {position = {209, 136}, size = {8, 1}},
    right_bottom = {position = {209, 137}, size = {8, 8}},
    bottom = {position = {208, 137}, size = {1, 8}},
    center = {position = {208, 136}, size = {1, 1}},
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end

function top_glow_with_left_corner(tint_value, scale_value) --only top side
  return
  {
    top = {position = {208, 128}, size = {1, 8}},
    left_top = {position = {200, 128}, size = {8, 8}},
    left = {position = {250, 105}, size = {1, 8}}, -- empty area
    center = {position = {208, 136}, size = {1, 1}},
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end

function top_right_glow_with_top_corner(tint_value, scale_value)
  return
  {
    top = {position = {208, 128}, size = {1, 8}},
    left_top = {position = {200, 128}, size = {8, 8}},
    left = {position = {250, 105}, size = {1, 8}}, -- empty area
    right_top = {position = {209, 128}, size = {8, 8}},
    right = {position = {209, 136}, size = {8, 1}},
    center = {position = {208, 136}, size = {1, 1}},
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end

function top_left_glow_with_top_corner(tint_value, scale_value)
  return
  {
    top = {position = {208, 128}, size = {1, 8}},
    left = {position = {200, 136}, size = {8, 1}},
    left_top = {position = {200, 128}, size = {8, 8}},
    right_top = {position = {209, 128}, size = {8, 8}},
    right = {position = {250, 105}, size = {1, 8}}, -- empty area
    center = {position = {208, 136}, size = {1, 1}},
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end

function expand_graphical_set(position, corner_size)
  local x = position[1]
  local y = position[2]
  return
  {
    top = {position = {x + corner_size, y}, size = {1, corner_size}},
    left = {position = {x, y + corner_size}, size = {corner_size, 1}},
    left_top = {position = {x, y}, size = {corner_size, corner_size}},
    right_top = {position = {x + corner_size + 1, y}, size = {corner_size, corner_size}},
    left_bottom = {position = {x, y + corner_size + 1}, size = {corner_size, corner_size}},
    right_bottom = {position = {x + corner_size + 1, y + corner_size + 1}, size = {corner_size, corner_size}},
    right = {position = {x + corner_size + 1, y + corner_size}, size = {corner_size, 1}},
    bottom = {position = {x + corner_size, y + corner_size + 1}, size = {1, corner_size}},
    center = {position = {x + corner_size, y + corner_size}, size = {1, 1}}
  }
end

-- used for textbox and virtual slots (not tab, it is more rounded and uses different style)
function rounded_corners_glow(tint_value)
  return
  {
    position = {240, 783},
    corner_size = 16,
    tint = tint_value,
    top_outer_border_shift = 4,
    bottom_outer_border_shift = -4,
    left_outer_border_shift = 4,
    right_outer_border_shift = -4,
    draw_type = "outer"
  }
end

-- used for textbox and virtual slots (not tab, it is more rounded and uses different style)
function rounded_button_glow(tint_value)
  return
  {
    position = {256, 191},
    corner_size = 16,
    tint = tint_value,
    top_outer_border_shift = 4,
    bottom_outer_border_shift = -4,
    left_outer_border_shift = 4,
    right_outer_border_shift = -4,
    draw_type = "outer"
  }
end

-- used for virtual slots used in the quick bar for example
function offset_by_2_rounded_corners_glow(tint_value)
  return
  {
    position = {240, 736},
    corner_size = 16,
    tint = tint_value,
    top_outer_border_shift = 4,
    bottom_outer_border_shift = -4,
    left_outer_border_shift = 4,
    right_outer_border_shift = -4,
    draw_type = "outer"
  }
end

textbox_dirt = rounded_corners_glow(default_dirt_color)

function radiobutton_glow(tint_value, scale_value)
  return
  {
    stretch_monolith_image_to_size = false,
    center =
    {
      position = {123, 156},
      size = {34, 34},
      tint = tint_value,
      scale = scale_value
    }
  }
end

function deep_slot_background_tiling(width, height, custom_widths, custom_heights, extra_padding, extra_spacing)
  -- extra_spacing may be either a number or a table
  -- if a table, fields are 'horizontal' and 'vertical'
  -- extra_spacing.horizontal and extra_spacing.vertical may either be numbers or arrays
  -- if arrays, each entry is the extra spacing to insert after the tiled background at that index
  local spacing = {}
  if type(extra_spacing) == "table" then
    if type(extra_spacing.horizontal) == "table" then
      spacing.horizontal = {}
      for k,v in pairs(extra_spacing.horizontal) do
        spacing.horizontal[k] = 8 + v
      end
    else
      spacing.horizontal = 8 + (extra_spacing.horizontal or 0)
    end
    if type(extra_spacing.vertical) == "table" then
      spacing.vertical = {}
      for k,v in pairs(extra_spacing.vertical) do
        spacing.vertical[k] = 8 + v
      end
    else
      spacing.vertical = 8 + (extra_spacing.vertical or 0)
    end
  else
    spacing.horizontal = 8 + (extra_spacing or 0)
    spacing.vertical = 8 + (extra_spacing or 0)
  end
  return
  {
    position = {282, 17},
    corner_size = 8,
    overall_tiling_horizontal_size = width and (width - 8) or nil,
    overall_tiling_vertical_size = height and (height - 8) or nil,
    overall_tiling_horizontal_padding = 4 + (extra_padding or 0),
    overall_tiling_horizontal_spacing = type(spacing.horizontal) == "number" and spacing.horizontal or nil,
    overall_tiling_vertical_padding = 4 + (extra_padding or 0),
    overall_tiling_vertical_spacing = type(spacing.vertical) == "number" and spacing.vertical or nil,
    custom_horizontal_tiling_sizes = custom_widths,
    custom_vertical_tiling_sizes = custom_heights,
    custom_horizontal_tiling_spacings = type(spacing.horizontal) == "table" and spacing.horizontal or nil,
    custom_vertical_tiling_spacings = type(spacing.vertical) == "table" and spacing.vertical or nil,
  }
end

default_shadow = default_glow(default_shadow_color, 0.5)
default_dirt = default_glow(default_dirt_color, 0.5)
default_inner_shadow = default_inner_glow(hard_shadow_color, 0.5)

top_shadow = top_glow(default_shadow_color, 0.5)
bottom_shadow = bottom_glow(default_shadow_color, 0.5)
top_bottom_shadow = top_bottom_glow(default_shadow_color, 0.5)
shadow_without_left = glow_without_left(default_shadow_color, 0.5)
shadow_without_right = glow_without_right(default_shadow_color, 0.5)
shadow_without_bottom = glow_without_bottom(default_shadow_color, 0.5)
shadow_without_top = glow_without_top(default_shadow_color, 0.5)
top_right_shadow = top_right_glow(default_shadow_color, 0.5)
top_left_shadow = top_left_glow(default_shadow_color, 0.5)
top_shadow_with_left_corner = top_glow_with_left_corner(default_shadow_color, 0.5)
top_right_shadow_with_top_corner = top_right_glow_with_top_corner(default_shadow_color, 0.5)
top_left_shadow_with_top_corner = top_left_glow_with_top_corner(default_shadow_color, 0.5)
bottom_right_shadow = bottom_right_glow(default_shadow_color, 0.5)

-- lines for a table grid / frame border
function border_image_set()
  return
  {
    border_width = 8,
    vertical_line = {position = {0, 40}, size = {8, 1}},
    horizontal_line = {position = {8, 40}, size = {1, 8}},
    top_right_corner = {position = {16, 40}, size = {8, 8}},
    bottom_right_corner = {position = {24, 40}, size = {8, 8}},
    bottom_left_corner = {position = {32, 40}, size = {8, 8}},
    top_left_coner = {position = {40, 40}, size = {8, 8}},
    top_t = {position = {64, 40}, size = {8, 8}},
    right_t = {position = {72, 40}, size = {8, 8}},
    bottom_t = {position = {48, 40}, size = {8, 8}},
    left_t = {position = {56, 40}, size = {8, 8}},
    cross = {position = {80, 40}, size = {8, 8}},
    top_end = {position = {88, 40}, size = {8, 8}},
    right_end = {position = {96, 40}, size = {8, 8}},
    bottom_end = {position = {104, 40}, size = {8, 8}},
    left_end = {position = {112, 40}, size = {8, 8}}
  }
end

function frame_around_graphical_set(type)
  local graphical_set = expand_graphical_set({0, 0}, 8)
  if type == "top" then
    graphical_set.bottom = nil
    graphical_set.left_bottom = nil
    graphical_set.right_bottom = nil
  end
  if type == "bottom" then
    graphical_set.top = nil
    graphical_set.left_top = nil
    graphical_set.right_top = nil
  end
  if type == "left" then
    graphical_set.left_bottom = nil
    graphical_set.right_bottom = nil
    graphical_set.left_top = nil
    graphical_set.right_top = nil
    graphical_set.right = nil
    graphical_set.top = nil
    graphical_set.bottom = nil
  end
  if type == "right" then
    graphical_set.left_bottom = nil
    graphical_set.right_bottom = nil
    graphical_set.left_top = nil
    graphical_set.right_top = nil
    graphical_set.left = nil
    graphical_set.top = nil
    graphical_set.bottom = nil
  end
  return
  {
    base = graphical_set
  }
end

function outer_frame_light()
return
  {
    base = {position = {17, 0}, corner_size = 8, draw_type = "outer"},
    shadow = default_inner_shadow
  }
end

function inner_frame_tab_pane()
return
  {
    base = {position = {85, 0}, corner_size = 8, draw_type = "outer"},
    shadow = default_inner_shadow
  }
end

tabbed_pane_graphical_set =
{
  base =
  {
    -- tabbed pane is always an inset frame touching the sides under the shadow, so sides should not draw
    top = {position = {76, 0}, size = {1, 8}},
    bottom = {position = {76, 9}, size = {1, 8}},
    center = {position = {76, 8}, size = {1, 1}}
  },
  shadow = top_shadow
}

function tinted_draggable_space(tint)
  return
  {
    base =
    {
      top =
      {
        position = {446, 78},
        size = {8, 8},
        tint = tint
      },
      top_tiling = true,
      center =
      {
        position = {454, 78},
        size = {8, 8},
        tint = tint
      },
      center_tiling_horizontal = true,
      bottom =
      {
        position = {462, 78},
        size = {8, 8},
        tint = tint
      },
      bottom_tiling = true,
    }
  }
end

data:extend(
{
  {
    type = "gui-style",
    name = "default",
    default_tileset = "__core__/graphics/gui-new.png",
    default_sprite_scale = 0.5,
    default_sprite_priority = "extra-high-no-scale",

    label =
    {
      type = "label_style",
      font = "default",
      font_color = {1, 1, 1},
      disabled_font_color = {1, 1, 1, 0.5},
      parent_hovered_font_color = {0, 0, 0},
      rich_text_setting = "enabled",
      game_controller_hovered_font_color = {1, 0.68, 0},
      single_line = true,
      rich_text_highlight_error_color = {255, 0, 0},
      rich_text_highlight_warning_color = {255, 255, 0},
      rich_text_highlight_ok_color = {0, 255, 0}
    },

    finished_game_label =
    {
      type = "label_style",
      parent = "label",
      maximal_width = 420,
      single_line = false
    },

    tooltip_item_label =
    {
      type = "label_style",
      parent = "label",
      maximal_width = 200
    },

    clickable_label =
    {
      type = "label_style",
      hovered_font_color = gui_color.light_orange,
      clicked_font_color = gui_color.orange
    },

    clickable_squashable_label =
    {
      type = "label_style",
      parent = "clickable_label",
      horizontally_squashable = "on"
    },

    black_clickable_label =
    {
      type = "label_style",
      parent = "black_label",
      hovered_font_color = gui_color.light_orange,
      clicked_font_color = gui_color.orange
    },

    black_clickable_squashable_label =
    {
      type = "label_style",
      parent = "black_clickable_label",
      horizontally_squashable = "on"
    },

    semibold_label =
    {
      type = "label_style",
      parent = "label",
      font = "default-semibold"
    },

    bold_label =
    {
      type = "label_style",
      parent = "label",
      font = "default-bold"
    },

    red_label =
    {
      type = "label_style",
      parent = "label",
      font_color = gui_color.red
    },

    bold_black_label =
    {
      type = "label_style",
      parent = "bold_label",
      font_color = {0, 0, 0}
    },

    bold_red_label =
    {
      type = "label_style",
      parent = "red_label",
      font = "default-bold"
    },

    green_label =
    {
      type = "label_style",
      font_color = gui_color.green,
      font = "default"
    },

    bold_green_label =
    {
      type = "label_style",
      parent = "green_label",
      font = "default-bold"
    },

    grey_label =
    {
      type = "label_style",
      parent = "label",
      font_color = gui_color.grey
    },

    bold_grey_label =
    {
      type = "label_style",
      parent = "grey_label",
      font = "default-bold"
    },

    -- Used as table caption, or in "Caption: value"
    caption_label =
    {
      type = "label_style",
      parent = "bold_label",
      font_color = gui_color.caption,
      ignored_by_search = true
    },

    semibold_caption_label =
    {
      type = "label_style",
      parent = "caption_label",
      font = "default-semibold"
    },

    electric_usage_label =
    {
      type = "label_style",
      parent = "label",
      width = 60
    },

    count_label =
    {
      type = "label_style",
      parent = "label",
      font = "count-font"
    },

    recipe_count_line_label =
    {
      type = "label_style",
      parent = "count_label",
      top_padding = 16
    },

    frame_subheading_label =
    {
      type = "label_style",
      parent = "label",
      top_padding = 4
    },

    tooltip_label =
    {
      type = "label_style",
      parent = "label",
      minimal_width = 50,
      maximal_width = 356
    },

    tooltip_title_label =
    {
      type = "label_style",
      parent = "label",
      font = "default-bold",
      minimal_width = 50,
      maximal_width = 356
    },

    subheader_label =
    {
      type = "label_style",
      parent = "label",
      left_padding = 8
    },

    subheader_caption_label =
    {
      type = "label_style",
      parent = "heading_2_label",
      left_padding = 8
    },

    subheader_semibold_label =
    {
      type = "label_style",
      parent = "semibold_label",
      left_padding = 8
    },

    subheader_right_aligned_label =
    {
      type = "label_style",
      parent = "label",
      right_padding = 8
    },

    heading_2_label =
    {
      type = "label_style",
      parent = "label",
      font = "heading-2",
      font_color = gui_color.caption
    },

    orange_label =
    {
      type = "label_style",
      font = "default",
      font_color = gui_color.orange
    },

    bold_orange_label =
    {
      type = "label_style",
      parent = "orange_label",
      font = "default-bold"
    },

    button =
    {
      type = "button_style",
      font = "default-semibold",
      horizontal_align = "center",
      vertical_align = "center",
      icon_horizontal_align = "center",
      ignored_by_search = true,
      top_padding = 0,
      bottom_padding = 0,
      left_padding = 8,
      right_padding = 8,
      minimal_width = 108,
      minimal_height = 28,
      default_font_color = button_default_font_color,
      default_graphical_set =
      {
        base = {position = {0, 17}, corner_size = 8},
        shadow = default_dirt
      },
      hovered_font_color = button_hovered_font_color,
      hovered_graphical_set =
      {
        base = {position = {34, 17}, corner_size = 8},
        shadow = default_dirt,
        glow = default_glow(default_glow_color, 0.5)
      },
      clicked_font_color = button_hovered_font_color,
      clicked_vertical_offset = 1, -- text/icon goes down on click
      clicked_graphical_set =
      {
        base = {position = {51, 17}, corner_size = 8},
        shadow = default_dirt
      },
      disabled_font_color = {179, 179, 179},
      disabled_graphical_set =
      {
        base = {position = {17, 17}, corner_size = 8},
        shadow = default_dirt
      },
      selected_font_color = button_hovered_font_color,
      selected_graphical_set =
      {
        base = {position = {225, 17}, corner_size = 8},
        shadow = default_dirt
      },
      selected_hovered_font_color = button_hovered_font_color,
      selected_hovered_graphical_set =
      {
        base = {position = {369, 17}, corner_size = 8},
        shadow = default_dirt
      },
      selected_clicked_font_color = button_hovered_font_color,
      selected_clicked_graphical_set =
      {
        base = {position = {352, 17}, corner_size = 8},
        shadow = default_dirt
      },
      strikethrough_color = gui_color.grey,
      pie_progress_color = {1, 1, 1},
      left_click_sound = "__core__/sound/gui-click.ogg"
    },

    green_button =
    {
      type = "button_style",
      parent = "button",
      default_graphical_set =
      {
        base = {position = {68, 17}, corner_size = 8},
        shadow = default_dirt
      },
      hovered_graphical_set =
      {
        base = {position = {102, 17}, corner_size = 8},
        shadow = default_dirt,
        glow = default_glow(green_button_glow_color, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {119, 17}, corner_size = 8},
        shadow = default_dirt
      },
      disabled_graphical_set =
      {
        base = {position = {85, 17}, corner_size = 8},
        shadow = default_dirt
      },
      left_click_sound = "__core__/sound/gui-green-confirm.ogg",
      tooltip = "gui.confirm-instruction"
    },

    rounded_button =
    {
      type = "button_style",
      default_graphical_set =
      {
        base = {position = {168, 200}, corner_size = 8},
        shadow = rounded_button_glow(default_dirt_color)
      },
      hovered_graphical_set =
      {
        base = {position = {202, 200}, corner_size = 8},
        shadow = rounded_button_glow(default_dirt_color),
        glow = rounded_button_glow(default_glow_color)
      },
      clicked_graphical_set =
      {
        base = {position = {219, 200}, corner_size = 8},
        shadow = rounded_button_glow(default_dirt_color)
      },
      disabled_graphical_set =
      {
        base = {position = {185, 200}, corner_size = 8},
        shadow = rounded_button_glow(default_dirt_color)
      },
      selected_graphical_set =
      {
        base = {position = {236, 200}, corner_size = 8},
        shadow = rounded_button_glow(default_dirt_color)
      },
      selected_hovered_graphical_set =
      {
        base = {position = {236, 200}, corner_size = 8},
        shadow = rounded_button_glow(default_dirt_color)
      },
      selected_clicked_graphical_set =
      {
        base = {position = {236, 200}, corner_size = 8},
        shadow = rounded_button_glow(default_dirt_color)
      }
    },

    back_button =
    {
      type = "button_style",
      parent = "dialog_button",
      horizontal_align = "left",
      default_graphical_set = arrow_back(grey_arrow_tileset, arrow_idle_index, "shadow", default_dirt_color),
      hovered_graphical_set = arrow_back(grey_arrow_tileset, arrow_hovered_index, "glow", default_glow_color),
      clicked_graphical_set = arrow_back(grey_arrow_tileset, arrow_clicked_index),
      disabled_graphical_set = arrow_back(grey_arrow_tileset, arrow_disabled_index, "glow", default_dirt_color)
    },

    red_back_button =
    {
      type = "button_style",
      parent = "dialog_button",
      horizontal_align = "left",
      default_graphical_set = arrow_back(red_arrow_tileset, arrow_idle_index, "shadow", default_dirt_color),
      hovered_graphical_set = arrow_back(red_arrow_tileset, arrow_hovered_index, "glow", red_button_glow_color),
      clicked_graphical_set = arrow_back(red_arrow_tileset, arrow_clicked_index),
      disabled_font_color = gui_color.grey,
      disabled_graphical_set = arrow_back(red_arrow_tileset, arrow_disabled_index, "glow", default_dirt_color)
    },

    forward_button = -- grey right arrow, flat left
    {
      type = "button_style",
      parent = "dialog_button",
      horizontal_align = "right",
      default_graphical_set = arrow_forward(grey_arrow_tileset, arrow_idle_index, "shadow", default_dirt_color),
      hovered_graphical_set = arrow_forward(grey_arrow_tileset, arrow_hovered_index, "glow", default_glow_color),
      clicked_graphical_set = arrow_forward(grey_arrow_tileset, arrow_clicked_index),
      disabled_graphical_set = arrow_forward(grey_arrow_tileset, arrow_disabled_index, "glow", default_dirt_color),
      left_click_sound = { filename = "__core__/sound/gui-forward-button-click.ogg", volume = 0.8 }
    },

    confirm_button =
    {
      type = "button_style",
      parent = "dialog_button",
      horizontal_align = "right",
      default_graphical_set = arrow_forward(green_arrow_tileset, arrow_idle_index, "shadow", default_dirt_color),
      hovered_graphical_set = arrow_forward(green_arrow_tileset, arrow_hovered_index, "glow", green_button_glow_color),
      clicked_graphical_set = arrow_forward(green_arrow_tileset, arrow_clicked_index),
      disabled_graphical_set = arrow_forward(green_arrow_tileset, arrow_disabled_index, "glow", default_dirt_color),
      left_click_sound = "__core__/sound/gui-green-confirm.ogg",
      tooltip = "gui.confirm-instruction"
    },

    confirm_button_without_tooltip =
    {
      type = "button_style",
      parent = "confirm_button",
      tooltip = ""
    },

    confirm_double_arrow_button =
    {
      type = "button_style",
      parent = "dialog_button",
      horizontal_align = "right",
      default_graphical_set = double_arrow_forward(green_arrow_tileset, arrow_idle_index, "shadow", default_dirt_color),
      hovered_graphical_set = double_arrow_forward(green_arrow_tileset, arrow_hovered_index, "glow", green_button_glow_color),
      clicked_graphical_set = double_arrow_forward(green_arrow_tileset, arrow_clicked_index),
      disabled_graphical_set = double_arrow_forward(green_arrow_tileset, arrow_disabled_index, "glow", default_dirt_color),
      tooltip = "gui.confirm-instruction"
    },

    tips_and_tricks_notification_button = -- grey right arrow, flat left
    {
      type = "button_style",
      parent = "dialog_button",
      horizontal_align = "left",
      default_graphical_set = arrow_forward(grey_arrow_tileset, arrow_idle_index, "shadow", default_dirt_color),
      hovered_graphical_set = arrow_forward(grey_arrow_tileset, arrow_hovered_index, "glow", default_glow_color),
      clicked_graphical_set = arrow_forward(grey_arrow_tileset, arrow_clicked_index),
      disabled_graphical_set = arrow_forward(grey_arrow_tileset, arrow_disabled_index, "glow", default_dirt_color),
      left_click_sound = { filename = "__core__/sound/gui-forward-button-click.ogg", volume = 0.8 }
    },

    map_generator_preview_button =
    {
      type = "button_style",
      parent = "forward_button",
      icon_horizontal_align = "left"
    },

    map_generator_close_preview_button =
    {
      type = "button_style",
      parent = "back_button",
      icon_horizontal_align = "left",
      left_padding = -4
    },

    map_generator_confirm_button =
    {
      type = "button_style",
      parent = "confirm_double_arrow_button",
      width = 208
    },

    confirm_in_load_game_button =
    {
      type = "button_style",
      parent = "confirm_button",
      natural_width = 300,
      horizontally_squashable = "on"
    },

    red_confirm_button =
    {
      type = "button_style",
      parent = "dialog_button",
      horizontal_align = "right",
      left_click_sound = { filename = "__core__/sound/gui-red-confirm.ogg", volume = 0.7 },
      default_graphical_set = arrow_forward(red_arrow_tileset, arrow_idle_index, "shadow", default_dirt_color),
      hovered_graphical_set = arrow_forward(red_arrow_tileset, arrow_hovered_index, "glow", red_button_glow_color),
      clicked_graphical_set = arrow_forward(red_arrow_tileset, arrow_clicked_index),
      disabled_font_color = gui_color.grey,
      disabled_graphical_set = arrow_forward(red_arrow_tileset, arrow_disabled_index, "glow", default_dirt_color)
    },

    red_button =
    {
      type = "button_style",
      parent = "button",
      default_graphical_set =
      {
        base = {position = {136, 17}, corner_size = 8},
        shadow = default_dirt
      },
      hovered_graphical_set =
      {
        base = {position = {170, 17}, corner_size = 8},
        shadow = default_dirt,
        glow = default_glow(red_button_glow_color, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {187, 17}, corner_size = 8},
        shadow = default_dirt
      },
      disabled_graphical_set =
      {
        base = {position = {153, 17}, corner_size = 8},
        shadow = default_dirt
      },
      left_click_sound = { filename = "__core__/sound/gui-red-button.ogg", volume = 0.5 }
    },

    tool_button_red =
    {
      type = "button_style",
      parent = "red_button",
      padding = 2,
      size = 28,
      left_click_sound = "__core__/sound/gui-tool-button.ogg",
      invert_colors_of_picture_when_disabled = true
    },

    tool_button_flush_fluid =
    {
      type = "button_style",
      parent = "tool_button_red",
      left_click_sound = { filename = "__core__/sound/gui-flush-fluid.ogg", volume = 0.7 }
    },

    tool_button =
    {
      type = "button_style",
      padding = 2,
      height = 28,
      minimal_width = 28,
      left_click_sound = "__core__/sound/gui-tool-button.ogg",
      invert_colors_of_picture_when_disabled = true
    },

    tool_button_without_padding =
    {
      type = "button_style",
      parent = "tool_button",
      padding = 0
    },

    tool_button_green =
    {
      type = "button_style",
      parent = "tool_button",
      default_graphical_set =
      {
        base = {position = {432, 48}, corner_size = 8},
        shadow = default_dirt
      },
      hovered_graphical_set =
      {
        base = {position = {449, 48}, corner_size = 8},
        shadow = default_dirt,
        glow = default_glow({110, 164, 104, 127}, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {466, 48}, corner_size = 8},
        shadow = default_dirt
      },
      selected_graphical_set = -- same as clicked
      {
        base = {position = {466, 48}, corner_size = 8},
        shadow = default_dirt
      }
    },

    entity_frame =
    {
      type = "frame_style",
      parent = "inside_shallow_frame_with_padding",
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        parent = "two_module_spacing_vertical_flow"
      },
      top_padding = 8
    },

    wide_entity_button =
    {
      type = "empty_widget_style",
      horizontally_stretchable = "on",
      height = entity_button_height
    },

    tool_button_blue =
    {
      type = "button_style",
      parent = "tool_button",
      default_graphical_set =
      {
        base = {position = {330, 48}, corner_size = 8},
        shadow = default_dirt
      },
      hovered_graphical_set =
      {
        base = {position = {347, 48}, corner_size = 8},
        shadow = default_dirt,
        glow = default_glow({110, 101, 164, 127}, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {364, 48}, corner_size = 8},
        shadow = default_dirt
      }
    },

    mini_tool_button_red =
    {
      type = "button_style",
      parent = "red_button",
      padding = 0,
      size = 16,
      left_click_sound = {{ filename = "__core__/sound/gui-tool-button.ogg", volume = 1 }}
    },

    mini_button =
    {
      type = "button_style",
      padding = 0,
      size = 16,
      left_click_sound = "__core__/sound/gui-button-mini.ogg"
    },

    mini_button_aligned_to_text_vertically =
    {
      type = "button_style",
      padding = 0,
      size = 16,
      top_margin = 3,
      left_click_sound = "__core__/sound/gui-button-mini.ogg"
    },

    mini_button_aligned_to_text_vertically_when_centered =
    {
      type = "button_style",
      padding = 0,
      size = 16,
      top_margin = 1,
      left_click_sound = "__core__/sound/gui-button-mini.ogg"
    },

    highlighted_tool_button =
    {
      type = "button_style",
      parent = "tool_button",
      default_graphical_set =
      {
        base = {position = {34, 17}, corner_size = 8},
        shadow = default_dirt,
        glow = default_glow(default_glow_color, 0.5)
      }
    },

    line =
    {
      type = "line_style",
      border = border_image_set()
    },

    inside_shallow_frame_with_padding_line =
    {
      type = "line_style",
      left_margin = -12,
      right_margin = -12
    },

    tooltip_horizontal_line =
    {
      type = "line_style",
      border =
      {
        border_width = 8,
        left_end = {position = {248, 40}, size = {8, 8}},
        horizontal_line = {position = {256, 40}, size = {1, 8}},
        right_end = {position = {257, 40}, size = {8, 8}}
      }
    },

    dark_line =
    {
      type = "line_style",
      top_margin = -3,
      bottom_margin = -(4 + 1),
      border =
      {
        border_width = 8,
        vertical_line = {position = {208, 40}, size = {8, 1}},
        top_end = {position = {200, 40}, size = 8},
        bottom_end = {position = {216, 40}, size = 8}
      }
    },

    tooltip_category_line =
    {
      type = "line_style",
      border =
      {
        border_width = 8,
        left_end = {position = {184, 40}, size = 8},
        horizontal_line = {position = {176, 40}, size = {1, 8}},
        right_end = {position = {192, 40}, size = 8}
      }
    },

    blurry_panel_horizontal_line =
    {
      type = "line_style",
      top_padding = 4,
      bottom_padding = 4,
      border =
      {
        border_width = 4,
        left_end = {position = {336, 0}, size = {4, 4}},
        horizontal_line = {position = {340, 0}, size = {1, 4}},
        right_end = {position = {341, 0}, size = {4, 4}}
      }
    },

    achievement_unlocked_title_label =
    {
      type = "label_style",
      parent = "bold_label",
      font_color = gui_color.achievement_green
    },

    achievement_locked_title_label =
    {
      type = "label_style",
      parent = "bold_label",
      font_color = gui_color.achievement_tan
    },

    achievement_failed_title_label =
    {
      type = "label_style",
      parent = "bold_label",
      font_color = gui_color.achievement_failed
    },

    achievement_failed_description_label =
    {
      type = "label_style",
      font_color = gui_color.achievement_failed_body
    },

    achievement_failed_reason_label =
    {
      type = "label_style",
      font_color = gui_color.achievement_failed_body
    },

    tips_and_tricks_title_label =
    {
      type = "label_style",
      parent = "bold_label",
      font_color = gui_color.grey
    },

    achievement_image =
    {
      type = "image_style",
      size = 100
    },

    tool_equip_equipment_image =
    {
      type = "image_style",
      padding = 4,
      size = 40
    },

    tooltip_heading_label =
    {
      type = "label_style",
      font = "default-bold",
      font_color = {0.0, 0.0, 0.0},
      horizontally_squashable = "on",
      single_line = false
    },

    tooltip_heading_label_category =
    {
      type = "label_style",
      font = "default-bold",
      font_color = {1, 0.8275, 0.29}
    },

    switch =
    {
      type = "switch_style",
      active_label =
      {
        type = "label_style",
        font_color = {241, 190, 100},
        font = "default-bold"
      },
      inactive_label =
      {
        type = "label_style",
        font_color = gui_color.white,
        hovered_font_color = {255, 230, 192},
        font = "default"
      },
      width = 32,
      height = 16,
      padding = 0,
      left_button_position = 2, -- position on the background where the button will be drawn
      middle_button_position = 9,
      right_button_position = 16,
      default_background = {position = {0, 96}, size = {64, 32}},
      hover_background = {position = {64, 96}, size = {64, 32}},
      disabled_background = {position = {0, 96}, size = {64, 32}}, -- we don't have a proper one, so we use the idle for now
      button =
      {
        type = "button_style",
        width = 14,
        height = 14,
        default_graphical_set = {position = {128, 96}, size = 28},
        hovered_graphical_set = {position = {156, 96}, size = 28},
        clicked_graphical_set = {position = {184, 96}, size = 28},
        disabled_graphical_set = {position = {128, 96}, size = 28}, -- we don't have a proper one, so we use the idle for now
        left_click_sound = { filename = "__core__/sound/gui-switch.ogg", volume = 0.7 }
      }
    },

    dialog_button =
    {
      type = "button_style",
      font = "default-dialog-button",
      parent = "button",
      default_font_color = button_default_bold_font_color,
      hovered_font_color = button_default_bold_font_color,
      clicked_font_color = button_default_bold_font_color,
      disabled_font_color = gui_color.grey,
      bottom_padding = 2,
      height = 32,
      minimal_width = 112
    },

    menu_button =
    {
      type = "button_style",
      parent = "button",
      font = "default-dialog-button",
      default_font_color = button_default_bold_font_color,
      hovered_font_color = button_default_bold_font_color,
      clicked_font_color = button_default_bold_font_color,
      minimal_width = 320,
      maximal_width = 320,
      minimal_height = 50,
      top_padding = 4,
      bottom_padding = 4
    },

    menu_button_continue =
    {
      type = "button_style",
      parent = "menu_button",
      default_graphical_set =
      {
        base = {position = {68, 17}, corner_size = 8},
        shadow = default_dirt
      },
      hovered_graphical_set =
      {
        base = {position = {102, 17}, corner_size = 8},
        shadow = default_dirt,
        glow = default_glow(green_button_glow_color, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {119, 17}, corner_size = 8},
        shadow = default_dirt
      },
      disabled_graphical_set =
      {
        base = {position = {85, 25}, corner_size = 8},
        shadow = default_dirt
      },
      left_click_sound = "__core__/sound/gui-green-confirm.ogg",
      tooltip = "gui.confirm-instruction"
    },

    side_menu_button =
    {
      type = "button_style",
      parent = "button",
      default_font_color = {},
      size = 40,
      padding = 0,
      left_click_sound = "__core__/sound/gui-square-button.ogg",
      invert_colors_of_picture_when_hovered_or_toggled = true,
      default_graphical_set =
      {
        position = {0, 0},
        corner_size = 8
      }
    },

    map_view_add_button =
    {
      type = "button_style",
      parent = "slot_sized_button",
      height = 28,
      width = 120
    },

    mod_gui_button = --used by mod gui lua
    {
      type = "button_style",
      parent = "button",
      minimal_width = 40,
      height = 40,
      padding = 0
    },

    image_tab_slot =
    {
      type = "button_style",
      parent = "slot_sized_button",
      size = 68
    },

    image_tab_selected_slot =
    {
      type = "button_style",
      parent = "slot_sized_button_pressed",
      size = 68
    },

    red_circuit_network_content_slot =
    {
      type = "button_style",
      parent = "compact_slot",
      default_graphical_set =
      {
        border = 1,
        filename = "__core__/graphics/gui.png",
        position = {111, 36},
        size = 36,
        scale = 1
      }
    },

    green_circuit_network_content_slot =
    {
      type = "button_style",
      parent = "compact_slot",
      default_graphical_set =
      {
        border = 1,
        filename = "__core__/graphics/gui.png",
        position = {111, 108},
        size = 36,
        scale = 1
      }
    },

    compact_slot =
    {
      type = "button_style",
      parent = "button",
      size = 36,
      padding = 1,
      default_graphical_set =
      {
        border = 1,
        filename = "__core__/graphics/gui.png",
        position = {111, 0},
        size = 36,
        scale = 1
      },
      hovered_graphical_set =
      {
        border = 1,
        filename = "__core__/graphics/gui.png",
        position = {148, 0},
        size = 36,
        scale = 1
      },
      clicked_graphical_set =
      {
        border = 1,
        filename = "__core__/graphics/gui.png",
        size = 36,
        x = 185,
        scale = 1
      },
      pie_progress_color = {0.98, 0.66, 0.22, 0.5}
    },

    slot =
    {
      type = "button_style",
      parent = "button",
      size = slot_size,
      padding = 0,
      default_graphical_set =
      {
        base = {border = 4, position = {0, 424}, size = 80}
        },
      hovered_graphical_set = { base = {border = 4, position = {80, 424}, size = 80}}, -- glow = default_glow(default_slot_glow_color, 0.5)
      clicked_graphical_set = { base = {border = 4, position = {160, 424}, size = 80}},
      pie_progress_color = {0.98, 0.66, 0.22, 0.5},
      left_click_sound = { filename = "__core__/sound/gui-inventory-slot-button.ogg", volume = 0.6 }
    },

    red_slot =
    {
      type = "button_style",
      parent = "slot",
      default_graphical_set = { base = {border = 4, position = {240, 816}, size = 80}},
      hovered_graphical_set = { base = {border = 4, position = {320, 816}, size = 80}},
      clicked_graphical_set = { base = {border = 4, position = {400, 816}, size = 80}},
      selected_graphical_set = { base = {border = 4, position = {320, 816}, size = 80}}
    },

    yellow_slot =
    {
      type = "button_style",
      parent = "slot",
      default_graphical_set = { base = {border = 4, position = {0, 816}, size = 80}},
      hovered_graphical_set = { base = {border = 4, position = {80, 816}, size = 80}},
      clicked_graphical_set = { base = {border = 4, position = {160, 816}, size = 80}},
      selected_graphical_set = { base = {border = 4, position = {80, 816}, size = 80}}
    },

    green_slot =
    {
      type = "button_style",
      parent = "slot",
      default_graphical_set = { base = {border = 4, position = {504, 136}, size = 80}},
      hovered_graphical_set = { base = {border = 4, position = {504, 216}, size = 80}},
      clicked_graphical_set = { base = {border = 4, position = {504, 296}, size = 80}}
    },

    blue_slot =
    {
      type = "button_style",
      parent = "slot",
      default_graphical_set = { base = {border = 4, position = {0, 504}, size = 80}},
      hovered_graphical_set = { base = {border = 4, position = {80, 504}, size = 80}},
      clicked_graphical_set = { base = {border = 4, position = {160, 504}, size = 80}}
    },

    tool_equip_ammo_slot =
    {
      type = "button_style",
      parent = "slot",
      default_graphical_set =
      {
        base = {border = 4, position = {0, 424}, size = 80},
        shadow =
        {
          left = {position = {68, 8}, size = {8, 1}},
          right = {position = {77, 8}, size = {8, 1}}
        }
      },
      hovered_graphical_set =
      {
        base = {border = 4, position = {80, 424}, size = 80},
        shadow =
        {
          left = {position = {68, 8}, size = {8, 1}},
          right = {position = {77, 8}, size = {8, 1}}
        }
      },
      clicked_graphical_set =
      {
        base = {border = 4, position = {160, 424}, size = 80},
        shadow =
        {
          left = {position = {68, 8}, size = {8, 1}},
          right = {position = {77, 8}, size = {8, 1}}
        }
      },
      selected_graphical_set =
      {
        base = {border = 4, position = {160, 504}, size = 80},
        shadow =
        {
          left = {position = {68, 8}, size = {8, 1}},
          right = {position = {77, 8}, size = {8, 1}}
        }
      },
      selected_hovered_graphical_set =
      {
        base = {border = 4, position = {160, 504}, size = 80},
        shadow =
        {
          left = {position = {68, 8}, size = {8, 1}},
          right = {position = {77, 8}, size = {8, 1}}
        }
      },
      selected_clicked_graphical_set =
      {
        base = {border = 4, position = {160, 504}, size = 80},
        shadow =
        {
          left = {position = {68, 8}, size = {8, 1}},
          right = {position = {77, 8}, size = {8, 1}}
        }
      },
      left_click_sound = {}
    },

    inventory_slot =
    {
      type = "button_style",
      parent = "slot",
      --inventory_slot_buttons get selected(toggled) when we select a filter. So we use the blue clicked style
      selected_graphical_set = { base = {border = 4, position = {160, 504}, size = 80}},
      selected_hovered_graphical_set = { base = {border = 4, position = {160, 504}, size = 80}},
      selected_clicked_graphical_set = { base = {border = 4, position = {160, 504}, size = 80}},
      left_click_sound = {}
    },

    filter_inventory_slot =
    {
      type = "button_style",
      parent = "blue_slot",
      left_click_sound = {}
    },

    closed_inventory_slot =
    {
      type = "button_style",
      parent = "slot",
      default_graphical_set = { base = {border = 4, position = {504, 376}, size = 80}},
      hovered_graphical_set = { base = {border = 4, position = {504, 456}, size = 80}},
      clicked_graphical_set = { base = {border = 4, position = {504, 536}, size = 80}},
      selected_graphical_set = { base = {border = 4, position = {504, 456}, size = 80}},
      left_click_sound = {}
    },

    red_inventory_slot =
    {
      type = "button_style",
      parent = "inventory_slot",
      default_graphical_set = { base = {border = 4, position = {240, 816}, size = 80}},
      hovered_graphical_set = { base = {border = 4, position = {320, 816}, size = 80}},
      clicked_graphical_set = { base = {border = 4, position = {400, 816}, size = 80}},
      selected_graphical_set = { base = {border = 4, position = {320, 816}, size = 80}}
    },

    yellow_inventory_slot =
    {
      type = "button_style",
      parent = "inventory_slot",
      default_graphical_set = { base = {border = 4, position = {0, 816}, size = 80}},
      hovered_graphical_set = { base = {border = 4, position = {80, 816}, size = 80}},
      clicked_graphical_set = { base = {border = 4, position = {160, 816}, size = 80}},
      selected_graphical_set = { base = {border = 4, position = {80, 816}, size = 80}}
    },

    technology_list_scroll_pane =
    {
      type = "scroll_pane_style",
      extra_padding_when_activated = 0,
      padding = 4,
      graphical_set =
      {
        base =
        {
          position = {17, 0}, corner_size = 8,
          center = {position = {42, 8}, size = {1, 1}},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
      background_graphical_set = deep_slot_background_tiling(72, 100)
    },

    statistics_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "scroll_pane",
      always_draw_borders = true,
      graphical_set =
      {
        base = {center = {position = {42, 8}, width = 1, height = 1}},
      },
      background_graphical_set = deep_slot_background_tiling((production_graph_width / 2), 56),
      width = production_graph_width,
      extra_padding_when_activated = 0
    },

    technology_gui_outer_frame =
    {
      type = "frame_style",
      parent = "invisible_frame",
      top_padding = 4,
      bottom_padding = 36,
      right_padding = 8,
      graphical_set =
      {
        position = {0, 0},
        corner_size = 8,
        center = {}
      },
      use_header_filler = false,
      header_background =
      {
        center = {x = 8, y = 8, width = 1, height = 1}
      }
    },

    technology_gui_left_frame =
    {
      type = "frame_style",
      padding = 0,
      left_padding = 8,
      right_padding = 12,
      use_header_filler = false,
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        parent = "two_module_spacing_vertical_flow"
      },
      graphical_set =
      {
        center = {position = {8, 8}, size = 1}
      },
      horizontally_stretchable = "off"
    },

    technology_graph_title_frame =
    {
      type = "frame_style",
      use_header_filler = false,
      padding = 0,
      graphical_set =
      {
        center = {position = {8, 8}, size = 1}
      }
    },

    research_queue_table =
    {
      type = "table_style",
      parent = "slot_table",
      padding = 4,
      horizontal_spacing = {{index = 1, spacing = 12}},
      background_graphical_set = deep_slot_background_tiling(72, 100, nil, nil, 4, {horizontal = {12, 0, 0, 0, 0, 0, 0}})
    },

    research_queue_cancel_button =
    {
      type = "button_style",
      parent = "red_button",
      size = {32, 20},
      padding = -4
    },

    research_queue_drag_handle =
    {
      type = "empty_widget_style",
      parent = "draggable_space",
      size = {40, 20}
    },

    technology_slot =
    {
      type = "technology_slot_style",
      font = "default-dialog-button",
      strikethrough_color = gui_color.grey,
      default_font_color = {1, 1, 1},
      hovered_font_color = {1, 1, 1},
      clicked_font_color = {1, 1, 1},
      disabled_font_color = {1, 1, 1},
      selected_font_color = {1, 1, 1},
      selected_hovered_font_color = {1, 1, 1},
      selected_clicked_font_color = {1, 1, 1},
      pie_progress_color = {1, 0, 0},
      horizontal_align = "center",
      vertical_align = "center",
      left_click_sound = "__core__/sound/gui-square-button-large.ogg",
      default_graphical_set = {},
      hovered_graphical_set = {},
      clicked_graphical_set = {},
      disabled_graphical_set = {},
      highlighted_graphical_set = {},
      selected_graphical_set = {},
      selected_hovered_graphical_set = {},
      selected_clicked_graphical_set = {},
      default_background_shadow = {position = {392, 328}, size = 88},
      level_band = {position = {381, 136}, corner_size = 8},
      hovered_level_band = {position = {381, 136}, corner_size = 8},
      level_offset_x = 12,
      level_offset_y = -2.5,
      level_band_width = 28,
      level_band_height = 12,
      level_font = "technology-slot-level-font",
      level_font_color = {0, 0, 0},
      hovered_level_font_color = {0, 0, 0},
      width = 72,
      height = 100,

      level_range_band = {position = {397, 136}, corner_size = 8},
      hovered_level_range_band = {position = {397, 136}, corner_size = 8},
      level_range_offset_x = -4,
      level_range_offset_y = -2.5,
      level_range_font = "technology-slot-level-font",
      level_range_font_color = {1, 1, 1},
      hovered_level_range_font_color = {1, 1, 1},

      ingredients_height = 20,
      default_ingredients_background = {position = {347, 136}, corner_size = 8},
      hovered_ingredients_background = {position = {364, 136}, corner_size = 8},
      clicked_ingredients_background = {position = {364, 136}, corner_size = 8},
      disabled_ingredients_background = {position = {347, 136}, corner_size = 8},

      highlighted_ingredients_background = {position = {364, 136}, corner_size = 8},
      ingredients_padding = 0,
      ingredient_icon_size = 16,
      ingredient_icon_overlap = 4,

      clicked_overlay =
      {
        left_top = {position = {456, 136}, size = {16, 16}},
        top = {position = {472, 136}, size = {1, 16}},
        right_top = {position = {473, 136}, size = {16, 16}},
        left = {position = {456, 152}, size = {16, 1}},
        center = {position = {472, 152}, size = {1, 1}},
        right = {position = {473, 152}, size = {16, 1}},

        left_bottom = {position = {416, 136}, size = {16, 16}},
        bottom = {position = {432, 136}, size = {1, 16}},
        right_bottom = {position = {433, 136}, size = {16, 16}}
      },

      progress_bar_background = {position = {296, 39}, corner_size = 4},
      progress_bar = {position = {305, 39}, corner_size = 4},
      progress_bar_shadow =
      {
        left = {position = {456, 152}, size = {16, 1}},
        center = {position = {472, 152}, size = {1, 1}},
        right = {position = {473, 152}, size = {16, 1}}
      },
      progress_bar_height = 4,
      progress_bar_color = {g = 1},

      drag_handle_style =
      {
        type = "empty_widget_style",
        parent = "research_queue_drag_handle",
        graphical_set = tinted_draggable_space({143, 123, 61})
      }
    },

    clickable_empty_technology_slot =
    {
      type = "technology_slot_style",
      parent = "technology_slot",
      hovered_graphical_set = {position = {34, 17}, corner_size = 8},
      clicked_graphical_set = {position = {51, 17}, corner_size = 8},
    },

    disabled_technology_slot =
    {
      type = "technology_slot_style",
      parent = "technology_slot",
      default_graphical_set =
      {
        base = {position = {313, 619}, corner_size = 8},
        shadow = default_shadow
      },
      hovered_graphical_set =
      {
        base = {position = {330, 619}, corner_size = 8},
        shadow = default_shadow
      },
      selected_hovered_graphical_set =
      {
        base = {position = {330, 619}, corner_size = 8},
        shadow = default_shadow
      },
      clicked_graphical_set =
      {
        base = {position = {330, 619}, corner_size = 8},
        shadow = default_shadow
      },
      selected_graphical_set =
      {
        base = {position = {330, 619}, corner_size = 8},
        shadow = default_shadow
      },
      selected_clicked_graphical_set =
      {
        base = {position = {330, 619}, corner_size = 8},
        shadow = default_shadow
      },
      disabled_graphical_set =
      {
        base = {position = {313, 619}, corner_size = 8},
        shadow = default_shadow
      },
      highlighted_graphical_set =
      {
        base = {position = {381, 619}, corner_size = 8},
        shadow = default_shadow
      },
      level_band = {position = {398, 619}, corner_size = 8},
      hovered_level_band = {position = {433, 602}, corner_size = 8},
      level_range_band = {position = {415, 619}, corner_size = 8},
      hovered_level_range_band = {position = {448, 602}, corner_size = 8},
      default_ingredients_background = {position = {364, 619}, corner_size = 8},
      hovered_ingredients_background = {position = {347, 619}, corner_size = 8},
      clicked_ingredients_background = {position = {347, 619}, corner_size = 8},
      disabled_ingredients_background = {position = {364, 619}, corner_size = 8},
      highlighted_ingredients_background = {position = {347, 619}, corner_size = 8},
      level_font_color = {132, 132, 132},
      hovered_level_font_color = {255, 255, 255},
      level_range_font_color = {132, 132, 132},
      hovered_level_range_font_color = {255, 255, 255},

      clicked_overlay =
      {
        left_top = {position = {456, 136}, size = {16, 16}},
        top = {position = {472, 136}, size = {1, 16}},
        right_top = {position = {473, 136}, size = {16, 16}},
        left = {position = {456, 152}, size = {16, 1}},
        center = {position = {472, 152}, size = {1, 1}},
        right = {position = {473, 152}, size = {16, 1}},

        left_bottom = {position = {416, 204}, size = {16, 16}},
        bottom = {position = {432, 204}, size = {1, 16}},
        right_bottom = {position = {433, 204}, size = {16, 16}}
      }
    },

    disabled_index_technology_slot =
    {
      type = "technology_slot_style",
      parent = "technology_slot",
      default_graphical_set =
      {
        base = {position = {313, 639}, corner_size = 8},
        shadow = default_shadow
      },
      hovered_graphical_set =
      {
        base = {position = {330, 639}, corner_size = 8},
        shadow = default_shadow
      },
      selected_hovered_graphical_set =
      {
        base = {position = {330, 639}, corner_size = 8},
        shadow = default_shadow
      },
      clicked_graphical_set =
      {
        base = {position = {330, 639}, corner_size = 8},
        shadow = default_shadow
      },
      selected_graphical_set =
      {
        base = {position = {330, 639}, corner_size = 8},
        shadow = default_shadow
      },
      selected_clicked_graphical_set =
      {
        base = {position = {330, 639}, corner_size = 8},
        shadow = default_shadow
      },
      disabled_graphical_set =
      {
        base = {position = {313, 639}, corner_size = 8},
        shadow = default_shadow
      },
      highlighted_graphical_set =
      {
        base = {position = {381, 639}, corner_size = 8},
        shadow = default_shadow
      },
      level_band = {position = {466, 639}, corner_size = 8},
      hovered_level_band = {position = {381, 639}, corner_size = 8},
      level_range_band = {position = {415, 639}, corner_size = 8},
      hovered_level_range_band = {position = {398, 639}, corner_size = 8},
      default_ingredients_background = {position = {364, 639}, corner_size = 8},
      hovered_ingredients_background = {position = {347, 639}, corner_size = 8},
      clicked_ingredients_background = {position = {347, 639}, corner_size = 8},
      disabled_ingredients_background = {position = {364, 639}, corner_size = 8},
      highlighted_ingredients_background = {position = {347, 639}, corner_size = 8},
      level_font_color = {132, 132, 132},
      hovered_level_font_color = {255, 255, 255},
      level_range_font_color = {132, 132, 132},
      hovered_level_range_font_color = {255, 255, 255},

      clicked_overlay =
      {
        left_top = {position = {456, 136}, size = {16, 16}},
        top = {position = {472, 136}, size = {1, 16}},
        right_top = {position = {473, 136}, size = {16, 16}},
        left = {position = {456, 152}, size = {16, 1}},
        center = {position = {472, 152}, size = {1, 1}},
        right = {position = {473, 152}, size = {16, 1}},

        left_bottom = {position = {416, 204}, size = {16, 16}},
        bottom = {position = {432, 204}, size = {1, 16}},
        right_bottom = {position = {433, 204}, size = {16, 16}}
      }
    },

    researched_technology_slot =
    {
      type = "technology_slot_style",
      parent = "technology_slot",
      default_graphical_set =
      {
        base = {position = {296, 187}, corner_size = 8},
        shadow = default_shadow
      },
      hovered_graphical_set =
      {
        base = {position = {312, 187}, corner_size = 8},
        shadow = default_shadow
      },
      selected_hovered_graphical_set =
      {
        base = {position = {312, 187}, corner_size = 8},
        shadow = default_shadow
      },
      clicked_graphical_set =
      {
        base = {position = {312, 187}, corner_size = 8},
        shadow = default_shadow
      },
      selected_graphical_set =
      {
        base = {position = {312, 187}, corner_size = 8},
        shadow = default_shadow
      },
      selected_clicked_graphical_set =
      {
        base = {position = {312, 187}, corner_size = 8},
        shadow = default_shadow
      },
      disabled_graphical_set =
      {
        base = {position = {296, 187}, corner_size = 8},
        shadow = default_shadow
      },
      highlighted_graphical_set =
      {
        base = {position = {330, 187}, corner_size = 8},
        shadow = default_shadow
      },
      level_band = {position = {381, 187}, corner_size = 8},
      hovered_level_band = {position = {381, 187}, corner_size = 8},
      level_range_band = {position = {397, 187}, corner_size = 8},
      hovered_level_range_band = {position = {397, 187}, corner_size = 8},
      default_ingredients_background = {position = {347, 187}, corner_size = 8},
      hovered_ingredients_background = {position = {364, 187}, corner_size = 8},
      clicked_ingredients_background = {position = {364, 187}, corner_size = 8},
      disabled_ingredients_background = {position = {347, 187}, corner_size = 8},
      highlighted_ingredients_background = {position = {364, 187}, corner_size = 8},
      level_font_color = {0, 84, 5},
      hovered_level_font_color = {0, 84, 5},
      level_range_font_color = {165, 255, 171},
      hovered_level_range_font_color = {165, 255, 171},
      clicked_overlay =
      {
        left_top = {position = {456, 136}, size = {16, 16}},
        top = {position = {472, 136}, size = {1, 16}},
        right_top = {position = {473, 136}, size = {16, 16}},
        left = {position = {456, 152}, size = {16, 1}},
        center = {position = {472, 152}, size = {1, 1}},
        right = {position = {473, 152}, size = {16, 1}},

        left_bottom = {position = {416, 187}, size = {16, 16}},
        bottom = {position = {432, 187}, size = {1, 16}},
        right_bottom = {position = {433, 187}, size = {16, 16}}
      },
      drag_handle_style =
      {
        type = "empty_widget_style",
        parent = "research_queue_drag_handle",
        graphical_set = tinted_draggable_space({170, 230, 151})
      }
    },

    available_technology_slot =
    {
      type = "technology_slot_style",
      parent = "technology_slot",
      default_graphical_set =
      {
        base = {position = {296, 136}, corner_size = 8},
        shadow = default_shadow
      },
      hovered_graphical_set =
      {
        base = {position = {312, 136}, corner_size = 8},
        shadow = default_shadow
      },
      selected_hovered_graphical_set =
      {
        base = {position = {312, 136}, corner_size = 8},
        shadow = default_shadow
      },
      clicked_graphical_set =
      {
        base = {position = {312, 136}, corner_size = 8},
        shadow = default_shadow
      },
      selected_graphical_set =
      {
        base = {position = {312, 136}, corner_size = 8},
        shadow = default_shadow
      },
      selected_clicked_graphical_set =
      {
        base = {position = {312, 136}, corner_size = 8},
        shadow = default_shadow
      },
      disabled_graphical_set =
      {
        base = {position = {296, 136}, corner_size = 8},
        shadow = default_shadow
      },
      highlighted_graphical_set =
      {
        base = {position = {330, 136}, corner_size = 8},
        shadow = default_shadow
      },
      level_band = {position = {381, 136}, corner_size = 8},
      hovered_level_band = {position = {381, 136}, corner_size = 8},
      level_range_band = {position = {397, 136}, corner_size = 8},
      hovered_level_range_band = {position = {397, 136}, corner_size = 8},
      level_font_color = {77, 71, 48},
      hovered_level_font_color = {77, 71, 48},
      level_range_font_color = {255, 241, 183},
      hovered_level_range_font_color = {255, 241, 183},

      clicked_overlay =
      {
        left_top = {position = {456, 136}, size = {16, 16}},
        top = {position = {472, 136}, size = {1, 16}},
        right_top = {position = {473, 136}, size = {16, 16}},
        left = {position = {456, 152}, size = {16, 1}},
        center = {position = {472, 152}, size = {1, 1}},
        right = {position = {473, 152}, size = {16, 1}},

        left_bottom = {position = {416, 136}, size = {16, 16}},
        bottom = {position = {432, 136}, size = {1, 16}},
        right_bottom = {position = {433, 136}, size = {16, 16}}
      }
    },

    conditionally_available_technology_slot =
    {
      type = "technology_slot_style",
      parent = "technology_slot",
      default_graphical_set =
      {
        base = {position = {296, 153}, corner_size = 8},
        shadow = default_shadow
      },
      hovered_graphical_set =
      {
        base = {position = {312, 153}, corner_size = 8},
        shadow = default_shadow
      },
      selected_hovered_graphical_set =
      {
        base = {position = {312, 153}, corner_size = 8},
        shadow = default_shadow
      },
      clicked_graphical_set =
      {
        base = {position = {312, 153}, corner_size = 8},
        shadow = default_shadow
      },
      selected_graphical_set =
      {
        base = {position = {312, 153}, corner_size = 8},
        shadow = default_shadow
      },
      selected_clicked_graphical_set =
      {
        base = {position = {312, 153}, corner_size = 8},
        shadow = default_shadow
      },
      disabled_graphical_set =
      {
        base = {position = {296, 153}, corner_size = 8},
        shadow = default_shadow
      },
      highlighted_graphical_set =
      {
        base = {position = {330, 153}, corner_size = 8},
        shadow = default_shadow
      },
      level_band = {position = {381, 153}, corner_size = 8},
      hovered_level_band = {position = {381, 153}, corner_size = 8},
      level_range_band = {position = {397, 153}, corner_size = 8},
      hovered_level_range_band = {position = {397, 153}, corner_size = 8},
      default_ingredients_background = {position = {347, 153}, corner_size = 8},
      hovered_ingredients_background = {position = {364, 136}, corner_size = 8},
      clicked_ingredients_background = {position = {364, 136}, corner_size = 8},
      disabled_ingredients_background = {position = {347, 136}, corner_size = 8},
      highlighted_ingredients_background = {position = {364, 136}, corner_size = 8},
      level_font_color = {95, 68, 32},
      hovered_level_font_color = {95, 68, 32},
      level_range_font_color = {255, 234, 206},
      hovered_level_range_font_color = {255, 234, 206},
      clicked_overlay =
      {
        left_top = {position = {456, 136}, size = {16, 16}},
        top = {position = {472, 136}, size = {1, 16}},
        right_top = {position = {473, 136}, size = {16, 16}},
        left = {position = {456, 152}, size = {16, 1}},
        center = {position = {472, 152}, size = {1, 1}},
        right = {position = {473, 152}, size = {16, 1}},

        left_bottom = {position = {416, 153}, size = {16, 16}},
        bottom = {position = {432, 153}, size = {1, 16}},
        right_bottom = {position = {433, 153}, size = {16, 16}}
      },
      drag_handle_style =
      {
        type = "empty_widget_style",
        parent = "research_queue_drag_handle",
        graphical_set = tinted_draggable_space({143, 123, 61})
      }
    },

    unavailable_technology_slot =
    {
      type = "technology_slot_style",
      parent = "technology_slot",
      default_graphical_set =
      {
        base = {position = {296, 170}, corner_size = 8},
        shadow = default_shadow
      },
      hovered_graphical_set =
      {
        base = {position = {312, 170}, corner_size = 8},
        shadow = default_shadow
      },
      selected_hovered_graphical_set =
      {
        base = {position = {312, 170}, corner_size = 8},
        shadow = default_shadow
      },
      clicked_graphical_set =
      {
        base = {position = {312, 170}, corner_size = 8},
        shadow = default_shadow
      },
      selected_graphical_set =
      {
        base = {position = {312, 170}, corner_size = 8},
        shadow = default_shadow
      },
      selected_clicked_graphical_set =
      {
        base = {position = {312, 170}, corner_size = 8},
        shadow = default_shadow
      },
      disabled_graphical_set =
      {
        base = {position = {296, 170}, corner_size = 8},
        shadow = default_shadow
      },
      highlighted_graphical_set =
      {
        base = {position = {330, 170}, corner_size = 8},
        shadow = default_shadow
      },
      level_band = {position = {381, 170}, corner_size = 8},
      hovered_level_band = {position = {381, 170}, corner_size = 8},
      level_range_band = {position = {397, 170}, corner_size = 8},
      hovered_level_range_band = {position = {397, 170}, corner_size = 8},
      default_ingredients_background = {position = {347, 170}, corner_size = 8},
      hovered_ingredients_background = {position = {364, 170}, corner_size = 8},
      clicked_ingredients_background = {position = {364, 170}, corner_size = 8},
      disabled_ingredients_background = {position = {347, 170}, corner_size = 8},
      highlighted_ingredients_background = {position = {364, 170}, corner_size = 8},
      level_font_color = {116, 34, 32},
      hovered_level_font_color = {116, 34, 32},
      level_range_font_color = {255, 214, 213},
      hovered_level_range_font_color = {255, 214, 213},
      clicked_overlay =
      {
        left_top = {position = {456, 136}, size = {16, 16}},
        top = {position = {472, 136}, size = {1, 16}},
        right_top = {position = {473, 136}, size = {16, 16}},
        left = {position = {456, 152}, size = {16, 1}},
        center = {position = {472, 152}, size = {1, 1}},
        right = {position = {473, 152}, size = {16, 1}},

        left_bottom = {position = {416, 170}, size = {16, 16}},
        bottom = {position = {432, 170}, size = {1, 16}},
        right_bottom = {position = {433, 170}, size = {16, 16}}
      },
      drag_handle_style =
      {
        type = "empty_widget_style",
        parent = "research_queue_drag_handle",
        graphical_set = tinted_draggable_space({157, 89, 88})
      }
    },

    disabled_preview_technology_slot =
    {
      type = "technology_slot_style",
      parent = "disabled_technology_slot",
      width = featured_technology_slot_base_width,
      height = featured_technology_slot_base_height + 32,
      ingredients_padding = 32
    },

    disabled_preview_index_technology_slot =
    {
      type = "technology_slot_style",
      parent = "disabled_index_technology_slot",
      width = featured_technology_slot_base_width,
      height = featured_technology_slot_base_height + 32,
      ingredients_padding = 32
    },

    researched_preview_technology_slot =
    {
      type = "technology_slot_style",
      parent = "researched_technology_slot",
      width = featured_technology_slot_base_width,
      height = featured_technology_slot_base_height + 32,
      ingredients_padding = 32
    },

    available_preview_technology_slot =
    {
      type = "technology_slot_style",
      parent = "available_technology_slot",
      width = featured_technology_slot_base_width,
      height = featured_technology_slot_base_height + 32,
      ingredients_padding = 32
    },

    conditionally_available_preview_technology_slot =
    {
      type = "technology_slot_style",
      parent = "conditionally_available_technology_slot",
      width = featured_technology_slot_base_width,
      height = featured_technology_slot_base_height + 32,
      ingredients_padding = 32
    },

    unavailable_preview_technology_slot =
    {
      type = "technology_slot_style",
      parent = "unavailable_technology_slot",
      width = featured_technology_slot_base_width,
      height = featured_technology_slot_base_height + 32,
      ingredients_padding = 32
    },

    featured_technology_description_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "scroll_pane",
      always_draw_borders = true,
      height = featured_technology_slot_base_height + 32 + 2 * 4,
      extra_padding_when_activated = 0,
      extra_right_padding_when_activated = -4,
      graphical_set = {},
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        parent = "vertical_flow",
        left_padding = 8,
        right_padding = 8,
        top_padding = 4
      }
    },

    transparent_slot =
    {
      type = "button_style",
      parent = "button",
      size = 32,
      padding = 0,
      default_graphical_set = {},
      clicked_graphical_set = {},
      hovered_graphical_set = {},
      clicked_vertical_offset = 0,
      draw_shadow_under_picture = true,
      pie_progress_color = {0.98, 0.66, 0.22, 0.5},
      left_click_sound = {}
    },

    universe_frame =
    {
      type = "frame_style",
      parent = "inside_deep_frame",
      graphical_set =
      {
        base =
        {
          position = {17, 0}, corner_size = 8,
          center = {position = {332, 0}, size = {1, 1}},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
    },

    -- TODO raiguard: Remove this
    universe_widget =
    {
      type = "empty_widget_style",
      horizontally_stretchable = "on",
      vertically_stretchable = "on"
    },

    universe_planet_button =
    {
      type = "button_style",
      parent = "transparent_slot",
      size = 40,
    },

    universe_connection_button =
    {
      type = "button_style",
      minimal_width = 0,
      minimal_height = 0,
      padding = 8,
      default_graphical_set = {},
      hovered_graphical_set = {},
      clicked_graphical_set = {},
      disabled_graphical_set = {},
    },

    universe_platform_button =
    {
      type = "button_style",
      parent = "transparent_slot",
      size = 16,
    },

    frame_button =
    {
      type = "button_style",
      parent = "button",
      padding = 0,
      default_graphical_set =
      {
        base = {position = {0, 0}, corner_size = 8},
        shadow = {position = {440, 24}, corner_size = 8, draw_type = "outer"}
      },
      hovered_graphical_set =
      {
        base = {position = {34, 17}, corner_size = 8},
        shadow = {position = {440, 24}, corner_size = 8, draw_type = "outer"},
        glow = default_glow(default_glow_color, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {51, 17}, corner_size = 8},
        shadow = {position = {440, 24}, corner_size = 8, draw_type = "outer"}
      },
      disabled_graphical_set =
      {
        base = {position = {17, 17}, corner_size = 8},
        shadow = {position = {440, 24}, corner_size = 8, draw_type = "outer"}
      },
      selected_graphical_set =
      {
        base = {position = {369, 17}, corner_size = 8},
        shadow = {position = {440, 24}, corner_size = 8, draw_type = "outer"}
      },
      selected_hovered_graphical_set =
      {
        base = {position = {352, 17}, corner_size = 8},
        shadow = {position = {440, 24}, corner_size = 8, draw_type = "outer"}
      }
    },

    -- square buttons on the frame top right, such as close and search.
    frame_action_button =
    {
      type = "button_style",
      parent = "frame_button",
      invert_colors_of_picture_when_hovered_or_toggled = true,
      size = 24,
      left_click_sound = "__core__/sound/gui-tool-button.ogg"
    },

    blueprint_record_slot_button =
    {
      type = "button_style",
      parent = "inventory_slot",
      size = 80,
      padding = 4
    },

    blueprint_record_selection_button =
    {
      type = "button_style",
      parent = "big_slot_button",
      padding = 4
    },

    blueprint_drop_slot_button =
    {
      type = "empty_widget_style",
      size = 76
    },

    blueprint_preview =
    {
      type = "empty_widget_style",
      size = 64
    },

    blueprint_icon_preview =
    {
      type = "empty_widget_style",
      size = 64
    },

    color_indicator =
    {
      type = "empty_widget_style",
      size = 28,
      graphical_set = {position = {195, 72}, corner_size = 8}
    },

    drop_target_button =
    {
      type = "button_style",
      font = "default",
      default_font_color={1, 1, 1},
      padding = 5,
      default_graphical_set =
      {
        filename = "__core__/graphics/blueprint-slot-tileset.png",
        corner_size = 9,
        left_tiling = true,
        right_tiling = true,
        bottom_tiling = true,
        top_tiling = true,
        position = {0, 0},
        top_width = 9,
        bottom_width = 9,
        left_height = 9,
        right_height = 9,
        center_width = 9,
        center_height = 9
      },
      hovered_font_color={1, 1, 1},
      hovered_graphical_set =
      {
        filename = "__core__/graphics/blueprint-slot-tileset.png",
        corner_size = 9,
        left_tiling = true,
        right_tiling = true,
        bottom_tiling = true,
        top_tiling = true,
        position = {27, 0},
        top_width = 9,
        bottom_width = 9,
        left_height = 9,
        right_height = 9,
        center_width = 9,
        center_height = 9
      },
      clicked_font_color={1, 1, 1},
      clicked_graphical_set =
      {
        filename = "__core__/graphics/blueprint-slot-tileset.png",
        corner_size = 9,
        left_tiling = true,
        right_tiling = true,
        bottom_tiling = true,
        top_tiling = true,
        position = {27, 0},
        top_width = 9,
        bottom_width = 9,
        left_height = 9,
        right_height = 9,
        center_width = 9,
        center_height = 9
      },
      disabled_font_color={0.5, 0.5, 0.5},
      disabled_graphical_set =
      {
        filename = "__core__/graphics/blueprint-slot-tileset.png",
        corner_size = 9,
        left_tiling = true,
        right_tiling = true,
        bottom_tiling = true,
        top_tiling = true,
        position = {0, 0},
        top_width = 9,
        bottom_width = 9,
        left_height = 9,
        right_height = 9,
        center_width = 9,
        center_height = 9
      },
      pie_progress_color = {1, 1, 1},
      left_click_sound = "__core__/sound/gui-drop-target.ogg"
    },

    search_popup_frame =
    {
      type = "frame_style",
      padding = 0,
      vertical_align = "center",
      graphical_set = { base = { center = {position = {8, 8}, size = {1, 1}} } },
      left_padding = 4,
      right_margin = 4,
      right_padding = 4
    },

    compact_red_slot =
    {
      type = "button_style",
      parent = "compact_slot",
      default_graphical_set =
      {
        border = 1,
        filename = "__core__/graphics/gui.png",
        size = 36,
        position = {111, 36},
        scale = 1
      },
      hovered_graphical_set =
      {
        border = 1,
        filename = "__core__/graphics/gui.png",
        position = {148, 36},
        size = 36,
        scale = 1
      },
      clicked_graphical_set =
      {
        border = 1,
        filename = "__core__/graphics/gui.png",
        position = {185, 36},
        size = 36,
        scale = 1
      },
      left_click_sound = "__core__/sound/gui-slot-unavailable.ogg"
    },

    inventory_limit_slot_button =
    {
      type = "button_style",
      parent = "slot_sized_button",
      default_graphical_set =
      {
        base = {position = {0, 896}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      hovered_graphical_set =
      {
        base = {position = {18, 896}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5),
        glow = offset_by_2_default_glow({236, 130, 130, 127}, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {36, 896}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      selected_graphical_set =
      {
        base = {position = {36, 896}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      selected_hovered_graphical_set =
      {
        base = {position = {36, 896}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5),
        glow = offset_by_2_default_glow({236, 130, 130, 127}, 0.5)
      },
      selected_clicked_graphical_set =
      {
        base = {position = {36, 896}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      }
    },

    working_weapon_button =
    {
      type = "button_style",
      parent = "green_slot",
      default_graphical_set =
      {
        base = {border = 4, position = {504, 136}, size = 80},
        shadow =
        {
          left = {position = {68, 8}, size = {8, 1}},
          right = {position = {77, 8}, size = {8, 1}}
        }
      },
      hovered_graphical_set =
      {
        base = {border = 4, position = {504, 216}, size = 80},
        shadow =
        {
          left = {position = {68, 8}, size = {8, 1}},
          right = {position = {77, 8}, size = {8, 1}}
        }
      },
      clicked_graphical_set =
      {
        base = {border = 4, position = {504, 296}, size = 80},
        shadow =
        {
          left = {position = {68, 8}, size = {8, 1}},
          right = {position = {77, 8}, size = {8, 1}}
        }
      },
      left_click_sound = {},
      draw_shadow_under_picture = true
    },

    not_working_weapon_button =
    {
      type = "button_style",
      parent = "red_slot",
      default_graphical_set =
      {
        base = {border = 4, position = {240, 816}, size = 80},
        shadow =
        {
          left = {position = {68, 8}, size = {8, 1}},
          right = {position = {77, 8}, size = {8, 1}}
        }
      },
      hovered_graphical_set =
      {
        base = {border = 4, position = {320, 816}, size = 80},
        shadow =
        {
          left = {position = {68, 8}, size = {8, 1}},
          right = {position = {77, 8}, size = {8, 1}}
        },
        glow = offset_by_2_rounded_corners_glow(red_slot_glow_color)
      },
      clicked_graphical_set =
      {
        base = {border = 4, position = {400, 816}, size = 80},
        shadow =
        {
          left = {position = {68, 8}, size = {8, 1}},
          right = {position = {77, 8}, size = {8, 1}}
        }
      },
      selected_graphical_set =
      {
        base = {border = 4, position = {320, 816}, size = 80},
        shadow =
        {
          left = {position = {68, 8}, size = {8, 1}},
          right = {position = {77, 8}, size = {8, 1}}
        }
      },
      left_click_sound = {},
      draw_shadow_under_picture = true
    },

    omitted_technology_slot =
    {
      type = "button_style",
      size = {10, 8},
      padding = 0,
      default_graphical_set = {},
      hovered_graphical_set = {}
    },

    crafting_queue_flow =
    {
      type = "flow_style",
      left_margin = 8,
      right_margin = 8,
      vertical_spacing = 0,
      horizontal_spacing = 0,
      horizontally_stretchable = "on"
    },

    crafting_queue_slot =
    {
      type = "button_style",
      size = 40,
      padding = 0,
      default_graphical_set =
      {
        position = {48, 584},
        corner_size = 8
      },
      hovered_graphical_set =
      {
        position = {64, 584},
        corner_size = 8
      },
      clicked_graphical_set =
      {
        position = {80, 584},
        corner_size = 8
      },
      pie_progress_color = {0.98, 0.66, 0.22, 0.5}
    },

    promised_crafting_queue_slot =
    {
      type = "button_style",
      parent = "crafting_queue_slot",
      default_graphical_set =
      {
        position = {0, 584},
        corner_size = 8
      },
      hovered_graphical_set =
      {
        position = {16, 584},
        corner_size = 8
      },
      clicked_graphical_set =
      {
        position = {32, 584},
        corner_size = 8
      }
    },

    control_settings_button =
    {
      type = "button_style",
      parent = "rounded_button",
      horizontal_align = "left",
      width = 225
    },

    control_settings_bordered_table =
    {
      type = "table_style",
      parent = "bordered_table",
      left_margin = -4,
      right_margin = -4,
      bottom_margin = -4,
      top_margin = 4
    },

    control_settings_section_button =
    {
      type = "button_style",
      parent = "tool_button",
      invert_colors_of_picture_when_hovered_or_toggled = true,
      default_graphical_set = {position = {68, 0}, corner_size = 8}
    },

    dropdown_button =
    {
      type = "button_style",
      padding = 0,
      horizontal_align = "left",
      font = "default-dropdown",
      left_click_sound = "__core__/sound/gui-click.ogg"
    },

    dropdown =
    {
      type = "dropdown_style",
      ignored_by_search = true,
      minimal_width = 116,
      minimal_height = 28,
      top_padding = -1,
      bottom_padding = 1,
      left_padding = 8,
      right_padding = 4,
      selector_and_title_spacing = 8,
      opened_sound = { filename = "__core__/sound/gui-dropdown-open.ogg" },
      button_style =
      {
        type = "button_style",
        parent = "dropdown_button"
      },
      icon =
      {
        filename = "__core__/graphics/icons/mip/dropdown.png",
        priority = "extra-high-no-scale",
        size = 32,
        scale = 0.5,
        --flags = {"icon", "no-crop"},
        flags = {"gui-icon"},
        mipmap_count = 2
      },
      list_box_style =
      {
        type = "list_box_style",
        maximal_height = 400,
        scroll_pane_style =
        {
          type = "scroll_pane_style",
          always_draw_borders = true,
          padding = 0,
          extra_padding_when_activated = 0,
          graphical_set = {shadow = default_shadow}
        }
      }
    },

    locale_dropdown =
    {
      type = "dropdown_style",
      parent = "dropdown",
      list_box_style =
      {
        type = "list_box_style",
        maximal_height = 400,
        item_style =
        {
          type = "button_style",
          parent = "button",
          font = "locale-pick"
        },
        scroll_pane_style =
        {
          type = "scroll_pane_style",
          padding = 0,
          extra_padding_when_activated = 0,
          graphical_set = {shadow = default_shadow}
        }
      }
    },

    game_controller_icons_dropdown =
    {
      type = "dropdown_style",
      parent = "dropdown",
      list_box_style =
      {
        type = "list_box_style",
        maximal_height = 400,
        item_style =
        {
          type = "button_style",
          parent = "button",
          horizontal_align = "left",
          font = "default-dropdown",
        },
        scroll_pane_style =
        {
          type = "scroll_pane_style",
          padding = 0,
          extra_padding_when_activated = 0,
          graphical_set = {shadow = default_shadow}
        }
      }
    },

    circuit_condition_comparator_dropdown =
    {
      type = "dropdown_style",
      minimal_width = 0,
      left_padding = 4,
      right_padding = 0,
      height = 40,
      -- semi-hack redefining the graphical set to put shadow in to glow layer to be on top of the neighbour inset
      button_style =
      {
        type = "button_style",
        parent = "dropdown_button",
        default_graphical_set =
        {
          base = {position = {0, 17}, corner_size = 8},
          glow = default_dirt
        },
        hovered_graphical_set =
        {
          base = {position = {34, 17}, corner_size = 8},
          glow = default_glow(default_glow_color, 0.5)
        },
        clicked_graphical_set =
        {
          base = {position = {51, 17}, corner_size = 8},
          glow = default_dirt
        },
        disabled_graphical_set =
        {
          base = {position = {17, 17}, corner_size = 8},
          glow = default_dirt
        },
        selected_graphical_set =
        {
          base = {position = {225, 17}, corner_size = 8},
          glow = default_dirt
        },
        selected_hovered_graphical_set =
        {
          base = {position = {369, 17}, corner_size = 8},
          glow = default_dirt
        },
        selected_clicked_graphical_set =
        {
          base = {position = {352, 17}, corner_size = 8},
          glow = default_dirt
        }
      },
      list_box_style =
      {
        type = "list_box_style",
        maximal_height = 400,
        item_style =
        {
          type = "button_style",
          parent = "list_box_item",
          left_padding = 4,
          right_padding = 4
        },
        scroll_pane_style =
        {
          type = "scroll_pane_style",
          padding = 0,
          extra_padding_when_activated = 0,
          graphical_set = {shadow = default_shadow}
        }
      }
    },

    train_schedule_circuit_condition_comparator_dropdown =
    {
      type = "dropdown_style",
      parent = "circuit_condition_comparator_dropdown",
      height = 28
    },

    not_accessible_station_in_station_selection =
    {
      type = "button_style",
      parent = "list_box_item",
      default_font_color = gui_color.red,
      hovered_font_color = {61, 3, 0},
      selected_font_color = {61, 3, 0},
      selected_hovered_font_color = {61, 3, 0},
      selected_clicked_font_color = {61, 3, 0}
    },

    partially_accessible_station_in_station_selection =
    {
      type = "button_style",
      parent = "list_box_item",
      default_font_color = {110, 179, 255},
      hovered_font_color = {0, 23, 84},
      selected_font_color = {0, 23, 84},
      selected_hovered_font_color = {0, 23, 84},
      selected_clicked_font_color = {0, 23, 84}
    },

    new_game_header_list_box_item =
    {
      type = "button_style",
      parent = "list_box_item",
      font = "heading-2",
      default_font_color = gui_color.caption,
      hovered_font_color = gui_color.caption,
      selected_font_color = gui_color.caption,
      selected_hovered_font_color = gui_color.caption,
      selected_clicked_font_color = gui_color.caption,
      disabled_font_color = gui_color.caption,
      default_graphical_set = {position = {17, 17},  corner_size = 8},
      hovered_graphical_set = {position = {17, 17},  corner_size = 8},
      disabled_graphical_set = {position = {17, 17},  corner_size = 8}
    },

    list_box_item =
    {
      type = "button_style",
      font = "default-listbox",
      ignored_by_search = false,
      minimal_width = 0,
      horizontal_align = "left",
      default_font_color = gui_color.white,
      default_graphical_set = {position = {208, 17},  corner_size = 8},
      hovered_graphical_set =
      {
        base = {position = {34, 17}, corner_size = 8},
        --glow = default_glow(default_glow_color, 0.5) -- removed to avoid glow going outside when the item is partially covered
      },
      clicked_graphical_set = {position = {51, 17}, corner_size = 8},
      disabled_font_color = {179, 179, 179},
      disabled_graphical_set = {position = {17, 17}, corner_size = 8}
    },

    train_status_button =
    {
      type = "button_style",
      parent = "list_box_item",
      width = train_gui_minimap_size,
      horizontal_align = "center",
    },

    station_train_status_button =
    {
      type = "button_style",
      parent = "list_box_item",
      width = train_gui_minimap_size + 12
    },

    title_tip_item =
    {
      type = "button_style",
      parent = "list_box_item",
      font = "default-semibold"
    },

    list_box_scroll_pane =
    {
      type = "scroll_pane_style",
      never_hide_by_search = true,
      always_draw_borders = true,
      padding = 0,
      extra_padding_when_activated = 0,
      graphical_set =
      {
        base =
        {
          position = {17, 0},
          corner_size = 8,
          center = {position = {42, 8}, size = 1},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
      background_graphical_set = deep_slot_background_tiling(nil, 28)
    },

    list_box_under_subheader_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "list_box_scroll_pane",
      graphical_set =
      {
        base =
        {
          position = {17, 0},
          corner_size = 8,
          center = {position = {42, 8}, size = 1},
          top = {},
          left_top = {},
          right_top = {},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      }
    },

    list_box_in_shallow_frame_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "list_box_scroll_pane",
      graphical_set =
      {
        base =
        {
          position = {85, 0},
          corner_size = 8,
          center = {position = {42, 8}, size = 1},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      }
    },

    list_box_in_shallow_frame_under_subheader_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "list_box_scroll_pane",
      graphical_set =
      {
        base =
        {
          position = {85, 0},
          corner_size = 8,
          center = {position = {42, 8}, size = 1},
          top = {},
          left_top = {},
          right_top = {},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      }
    },

    pins_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "list_box_scroll_pane",
      background_graphical_set = deep_slot_background_tiling(28, 28),
      maximal_height = 28 * 10 -- 10 items
    },

    wide_list_box_in_shallow_frame =
    {
      type = "list_box_style",
      parent = "wide_list_box",
      scroll_pane_style =
      {
        type = "scroll_pane_style",
        parent = "list_box_in_shallow_frame_scroll_pane"
      }
    },

    wide_list_box_in_shallow_frame_under_subheader =
    {
      type = "list_box_style",
      parent = "wide_list_box",
      scroll_pane_style =
      {
        type = "scroll_pane_style",
        parent = "list_box_in_shallow_frame_under_subheader_scroll_pane"
      }
    },

    campaign_levels_list_box =
    {
      type = "list_box_style",
      scroll_pane_style =
      {
        type = "scroll_pane_style",
        parent = "list_box_in_shallow_frame_scroll_pane"
      },
      width = 180,
      height = 140
    },

    list_box =
    {
      type = "list_box_style",
      scroll_pane_style =
      {
        type = "scroll_pane_style",
        parent = "list_box_scroll_pane"
      },
      item_style =
      {
        type = "button_style",
        parent = "list_box_item"
      }
    },

    naked_list_box =
    {
      type = "list_box_style",
      parent = "list_box",
      scroll_pane_style =
      {
        type = "scroll_pane_style",
        parent = "naked_scroll_pane"
      }
    },

    chart_search_result_frame =
    {
      type = "frame_style",
      width = 350,
      maximal_height = 500
    },

    pins_frame =
    {
      type = "frame_style",
      width = 250,
      maximal_height = 300
    },

    list_box_in_shallow_frame =
    {
      type = "list_box_style",
      scroll_pane_style =
      {
        type = "scroll_pane_style",
        parent = "list_box_in_shallow_frame_scroll_pane"
      }
    },

    wide_list_box =
    {
      type = "list_box_style",
      width = 320 + 80 + 12, -- 80 for the last modified remark, 12 for the scroll bar
      minimal_height = 100
    },

    scroll_pane_under_subheader =
    {
      type = "scroll_pane_style",
      parent = "naked_scroll_pane",
      padding = 4,
    },

    train_schedule_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "list_box_in_shallow_frame_scroll_pane",
      scrollbars_go_outside = true,
      vertically_stretchable = "on",
      left_margin = 12 - 4,
      right_margin = 12 - 4,
      top_margin = 12 - 8,
      bottom_margin = 8 - 4,
      width = slot_table_width,
      padding = 4,
      background_graphical_set = deep_slot_background_tiling(nil, 36, {28, 56, 276}, nil, 0, 4)
    },

    train_interrupts_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "train_schedule_scroll_pane",
      scrollbars_go_outside = true,
      vertically_stretchable = "on",
      --width = slot_table_width - (24 * 2),
      margin = 0,
      background_graphical_set = deep_slot_background_tiling(nil, 36, {56, 276}, nil, 0, 4)
    },

    mods_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "naked_scroll_pane",
      background_graphical_set = deep_slot_background_tiling(nil, 28),
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 0,
      }
    },

    stations_trains_scroll_pane =
    {
      type = "scroll_pane_style",
      width = train_gui_minimap_size + 12,
      height = train_gui_minimap_size - 36,
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 0
      },
      parent = "list_box_in_shallow_frame_under_subheader_scroll_pane"
    },

    entity_frame_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "naked_scroll_pane",
      padding = 12,
    },

    shallow_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "scroll_pane",
      vertically_stretchable = "off",
      horizontally_stretchable = "off",
      scrollbars_go_outside = true,
      dont_force_clipping_rect_for_contents = true,
      extra_padding_when_activated = 0,
      graphical_set =
      {
        base =
        {
          top = {position = {76, 9}, size = {1, 8}},
          bottom = {position = {76, 0}, size = {1, 8}},
          draw_type = "outer"
        },
        shadow = top_and_bottom_inner_glow(default_shadow_color, 0.5)
      }
    },

    shallow_slots_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "shallow_scroll_pane",
      minimal_height = slot_size * 2,
      background_graphical_set =
      {
        position = {256, 136},
        corner_size = 16,
        overall_tiling_vertical_size = 24,
        overall_tiling_vertical_spacing = 16,
        overall_tiling_vertical_padding = 8,
        overall_tiling_horizontal_size = 24,
        overall_tiling_horizontal_spacing = 16,
        overall_tiling_horizontal_padding = 8
      }
    },

    deep_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "scroll_pane",
      extra_padding_when_activated = 0,
      always_draw_borders = true,
      scrollbars_go_outside = true,
      vertically_stretchable = "off",
      horizontally_stretchable = "off",
      dont_force_clipping_rect_for_contents = true,
      graphical_set =
      {
        base =
        {
          position = {85, 0}, corner_size = 8,
          center = {position = {42, 8}, size = {1, 1}},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      }
    },

    deep_scroll_pane_with_padding =
    {
      type = "scroll_pane_style",
      parent = "deep_scroll_pane",
      padding = 8
    },

    deep_slots_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "deep_scroll_pane",
      minimal_height = slot_size,
      background_graphical_set = deep_slot_background_tiling(40, 40),
      vertical_flow_style = { type = "vertical_flow_style", parent = "packed_vertical_flow" },
    },

    logistic_sections_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "deep_slots_scroll_pane",
      minimal_height = slot_size * 2
    },

    character_crafting_queue_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "deep_slots_scroll_pane",
      minimal_width = slot_size * 8,
      minimal_height = slot_size * 2,
    },

    achievement_slots_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "naked_scroll_pane",
      background_graphical_set = deep_slot_background_tiling(400, 120),
      vertical_flow_style = { type = "vertical_flow_style", parent = "packed_vertical_flow" }
    },

    logistic_gui_items_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "naked_scroll_pane",
      width = (40 * 6) + 12,
      background_graphical_set = deep_slot_background_tiling(40, 40)
    },

    factoriopedia_icon_grid_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "naked_scroll_pane",
      padding = 0,
      width = 400,
      background_graphical_set =
      {
        position = {256, 136},
        corner_size = 16,
        overall_tiling_vertical_size = 24,
        overall_tiling_vertical_spacing = 16,
        overall_tiling_vertical_padding = 8,
        overall_tiling_horizontal_size = 24,
        overall_tiling_horizontal_spacing = 16,
        overall_tiling_horizontal_padding = 8
      }
    },

    item_and_count_select_confirm =
    {
      type = "button_style",
      parent = "green_button",
      size = 28,
      padding = 0,
      invert_colors_of_picture_when_disabled = true
    },

    filter_tabbed_pane =
    {
      type = "tabbed_pane_style",
      parent = "tabbed_pane",
      top_margin = 0,
      tab_content_frame =
      {
        type = "frame_style",
        parent = "filter_frame"
      },
      tab_container =
      {
        type = "table_style",
        horizontal_spacing = 0,
        vertical_spacing = 0,
        background_graphical_set = deep_slot_background_tiling(71, 72)
      }
    },

    filter_group_tab =
    {
      type = "tab_style",
      height = 72,
      minimal_width = 71,
      left_padding = 3,
      right_padding = 4,
      top_padding = 4,
      bottom_padding = 4, -- so there is exactly 64X64 space for the icon
      horizontally_stretchable =  "on",
      default_graphical_set =
      {
        base =
        {
          -- basically button without bottom side
          left_top = {position = {0, 17}, size = {8, 8}},
          left = {position = {0, 25}, size = {8, 1}},
          left_bottom = {position = {0, 25}, size = {8, 1}},
          top = {position = {8, 17}, size = {1, 8}},
          center = {position = {8, 25}, size = {1, 1}},
          bottom = {position = {8, 25}, size = {1, 1}},
          right_top = {position = {9, 17}, size = {8, 8}},
          right = {position = {9, 25}, size = {8, 1}},
          right_bottom = {position = {9, 25}, size = {8, 1}}
        },
        shadow = default_glow(default_shadow_color, 0.5)
      },
      selected_graphical_set =
      {
        base =
        {
          left_top = {position = {68, 0}, size = {8, 8}},
          left = {position = {68, 8}, size = {8, 1}},
          left_bottom = {position = {136, 9}, size = {8, 8}},
          top = {position = {76, 0}, size = {1, 8}},
          center = {position = {76, 8}, size = {1, 1}},
          bottom = {position = {144, 9}, size = {1, 8}},
          right_top = {position = {77, 0}, size = {8, 8}},
          right = {position = {77, 8}, size = {8, 1}},
          right_bottom = {position = {145, 9}, size = {8, 8}}
        },
        shadow = default_glow(default_shadow_color, 0.5)
      },
      hovered_graphical_set =
      {
        base =
        {
          left_top = {position = {34, 17}, size = {8, 8}},
          left = {position = {34, 25}, size = {8, 1}},
          left_bottom = {position = {34, 25}, size = {8, 1}},
          top = {position = {42, 17}, size = {1, 8}},
          center = {position = {42, 25}, size = {1, 1}},
          bottom = {position = {42, 25}, size = {1, 1}},
          right_top = {position = {43, 17}, size = {8, 8}},
          right = {position = {43, 25}, size = {8, 1}},
          right_bottom = {position = {43, 25}, size = {8, 1}}
        },
        glow = default_glow(default_glow_color, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {51, 17}, corner_size = 8},
        shadow = default_glow(default_glow_color, 0.5)
      },
      disabled_graphical_set =
      {
        base = {position = {208, 17}, corner_size = 8},
        shadow = default_glow(default_shadow_color, 0.5)
      },
      override_graphics_on_edges = true,
      left_edge_selected_graphical_set =
      {
        base =
        {
          left_top = {position = {68, 0}, size = {8, 8}},
          left = {position = {68, 8}, size = {8, 1}},
          left_bottom = {position = {68, 4}, size = {8, 8}}, -- cutout from size of no.5 tile, need 8x8 for image set to work right.
          top = {position = {76, 0}, size = {1, 8}},
          center = {position = {76, 8}, size = {1, 1}},
          bottom = {position = {144, 9}, size = {1, 8}},
          right_top = {position = {77, 0}, size = {8, 8}},
          right = {position = {77, 8}, size = {8, 1}},
          right_bottom = {position = {145, 9}, size = {8, 8}}
        },
        shadow = default_glow(default_shadow_color, 0.5)
      },
      right_edge_selected_graphical_set =
      {
        base =
        {
          left_top = {position = {68, 0}, size = {8, 8}},
          left = {position = {68, 8}, size = {8, 1}},
          left_bottom = {position = {136, 9}, size = {8, 8}},
          top = {position = {76, 0}, size = {1, 8}},
          center = {position = {76, 8}, size = {1, 1}},
          bottom = {position = {144, 9}, size = {1, 8}},
          right_top = {position = {77, 0}, size = {8, 8}},
          right = {position = {77, 8}, size = {8, 1}},
          right_bottom = {position = {77, 8}, size = {8, 1}}
        },
        shadow = default_glow(default_shadow_color, 0.5)
      },
      left_click_sound = "__core__/sound/gui-square-button-large.ogg"
    },

    filter_group_slot_tab =
    {
      type = "tab_style",
      size = {71, 72}, --warning: width does not respect module size, but the current design requires it
      left_padding = 3,
      right_padding = 4,
      top_padding = 4,
      bottom_padding = 4, -- so there is exactly 64X64 space for the icon
      increase_height_when_selected = false,
      default_graphical_set =
      {
        base = {position = {0, 17}, corner_size = 8},
        shadow = default_dirt
      },
      selected_graphical_set =
      {
        base = {position = {363, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      disabled_graphical_set =
      {
        base = {position = {208, 17}, corner_size = 8},
        shadow = default_dirt
      },
      selected_font_color = button_hovered_font_color
    },

    editor_mode_selection_frame =
    {
      type = "frame_style",
      graphical_set =
      {
        base =
        {
          top = { position = {74, 9}, size = {1, 8}},
          center = {position = {42, 8}, size = {1, 1}},
          draw_type = "outer"
        }
      },
      padding = 0
    },

    editor_mode_selection_table =
    {
      type = "table_style",
      horizontal_spacing = 0,
      vertical_spacing = 0,
      background_graphical_set = deep_slot_background_tiling(75, 76)
    },

    filter_group_button_tab_slightly_larger =
    {
      type = "button_style",
      size = {71 + 4, 72 + 4},
      left_padding = 3 + 2,
      right_padding = 4 + 2,
      top_padding = 4 + 2,
      bottom_padding = 4 + 2, -- so there is exactly 64X64 space for the icon

      clicked_vertical_offset = 0,
      selected_graphical_set =
      {
        base = {position = {363, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      disabled_graphical_set =
      {
        base = {position = {208, 17}, corner_size = 8},
        shadow = default_dirt
      },
      selected_font_color = button_hovered_font_color,
      selected_hovered_font_color = button_hovered_font_color,
      selected_hovered_graphical_set =
      {
        base = {position = {363, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      selected_clicked_font_color = button_hovered_font_color,
      selected_clicked_graphical_set =
      {
        base = {position = {363, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      }
    },

    editor_inner_frame =
    {
      type = "frame_style",
      vertically_stretchable = "on",
      horizontally_stretchable = "on",
      top_padding = 6,
      right_padding = 12,
      bottom_padding = 4,
      left_padding = 12,
      use_header_filler = false,
      graphical_set = tabbed_pane_graphical_set
    },

    filter_frame =
    {
      type = "frame_style",
      vertically_stretchable = "on",
      padding = 12,
      top_padding = 12 - 4,
      bottom_padding = 12 - 4,
      graphical_set = tabbed_pane_graphical_set,
      natural_height = 12 + (slot_size * 5) + 12 + 8
    },

    train_schedule_unavailable_stop_label =
    {
      type = "label_style",
      font_color = {255, 138, 138},
      hovered_font_color = gui_color.orange,
      horizontally_squashable = "on"
    },

    train_schedule_non_existent_stop_label =
    {
      type = "label_style",
      font_color = {255, 138, 138},
      hovered_font_color = {255, 138, 138},
      horizontally_squashable = "on"
    },

    hyperlink_label =
    {
      type = "label_style",
      font_color = gui_color.blue,
      hovered_font_color = {154, 250, 255},
      underlined = true
    },

    wide_list_box_under_subheader =
    {
      type = "list_box_style",
      parent = "wide_list_box",
      scroll_pane_style =
      {
        type = "scroll_pane_style",
        parent = "list_box_under_subheader_scroll_pane"
      }
    },

    list_box_under_subheader =
    {
      type = "list_box_style",
      scroll_pane_style =
      {
        type = "scroll_pane_style",
        parent = "list_box_under_subheader_scroll_pane"
      }
    },

    new_game_difficulty_vertical_flow =
    {
      type = "vertical_flow_style",
      natural_width = 180,
    },

    campaigns_list_box =
    {
      type = "list_box_style",
      minimal_width = 300,
      maximal_width = 400,
      natural_height = 450,
      vertically_stretchable = "on"
    },

    custom_games_list_box =
    {
      type = "list_box_style",
      size = {300, 250}
    },

    permissions_groups_list_box =
    {
      type = "list_box_style",
      size = {250, 400}
    },

    permissions_players_list_box =
    {
      type = "list_box_style",
      size = {250, 400}
    },

    train_station_list_box =
    {
      type = "list_box_style",
      parent = "list_box_under_subheader",
      minimal_height = 130,
      maximal_height = 400,
      minimal_width = 300,
      maximal_width = 1000
    },

    button_with_shadow =
    {
      type = "button_style",
      -- same as button, just shadow instead of dirt
      default_graphical_set =
      {
        base = {position = {0, 17}, corner_size = 8},
        shadow = default_shadow
      },
      hovered_graphical_set =
      {
        base = {position = {34, 17}, corner_size = 8},
        shadow = default_shadow,
        glow = default_glow(default_glow_color, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {51, 17}, corner_size = 8},
        shadow = default_shadow
      },
      left_click_sound = "__core__/sound/gui-menu-small.ogg"
    },

    train_schedule_add_wait_condition_button =
    {
      type = "button_style",
      parent = "button_with_shadow",
      horizontal_align = "left",
      height = 36,
      width = 288
    },

    train_schedule_add_interrupt_station_button =
    {
      type = "button_style",
      parent = "button_with_shadow",
      horizontal_align = "left",
      height = 36,
      horizontally_stretchable = "on",
      --width = 328
    },

    train_schedule_add_station_button =
    {
      type = "button_style",
      parent = "button_with_shadow",
      horizontal_align = "left",
      horizontally_stretchable = "on",
      height = 36
    },

    train_schedule_mode_switch_horizontal_flow =
    {
      type = "horizontal_flow_style",
      left_margin = 8
    },

    train_schedule_action_button =
    {
      type = "button_style",
      padding = 0,
      size = 28,
      left_click_sound = "__core__/sound/gui-tool-button.ogg",
      disabled_graphical_set =
      {
        base = {position = {153, 17}, corner_size = 8},
        shadow = default_dirt
      }
    },

    train_schedule_condition_frame =
    {
      type = "frame_style",
      parent = "shallow_frame",
      padding = 0,
      width = 288,
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        parent = "player_input_horizontal_flow"
      }
    },

    blueprint_parameter_frame =
    {
      type = "frame_style",
      parent = "shallow_frame",
      padding = 0,
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        parent = "player_input_horizontal_flow"
      }
    },

    train_schedule_comparison_type_frame =
    {
      type = "frame_style",
      padding = 0,
      top_margin = -20,
      bottom_margin = 20,
      left_margin = 28
    },

    train_schedule_comparison_type_frame_indented =
    {
      type = "frame_style",
      padding = 0,
      top_margin = -20,
      bottom_margin = 20,
      left_margin = 20,
      right_margin = 8
    },

    train_schedule_comparison_type_frame_extra_indented =
    {
      type = "frame_style",
      parent = "train_schedule_comparison_type_frame",
      left_margin = 0,
      right_margin = 28
    },

    train_schedule_station_frame =
    {
      type = "frame_style",
      parent = "shallow_frame",
      padding = 0,
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        parent = "player_input_horizontal_flow"
      }
    },

    train_schedule_station_in_interrupt_frame =
    {
      type = "frame_style",
      parent = "train_schedule_station_frame",
      --width =
    },

    train_schedule_temporary_station_frame =
    {
      type = "frame_style",
      parent = "train_schedule_station_frame",
      graphical_set =
      {
        base = {position = {446, 86}, corner_size = 8},
        shadow = default_shadow
      }
    },

    sync_mods_default_status_frame =
    {
      type = "frame_style",
      padding = 4,
      graphical_set = {}
    },

    sync_mods_downloading_status_frame =
    {
      type = "frame_style",
      parent = "sync_mods_default_status_frame",
      padding = 0,
      graphical_set =
      {
        base = {position = {412, 86}, corner_size = 8},
        shadow = default_shadow
      }
    },

    sync_mods_table =
    {
      type = "table_style",
      parent = "bordered_table",
      cell_padding = 0,
      left_cell_padding = 4,
      right_cell_padding = 4
    },

    train_schedule_fullfilled_condition_frame =
    {
      type = "frame_style",
      padding = 0,
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        parent = "player_input_horizontal_flow"
      },
      graphical_set =
      {
        base = {position = {412, 86}, corner_size = 8},
        shadow = default_shadow
      }
    },
    train_schedule_comparison_type_button =
    {
      type = "button_style",
      left_padding = 4,
      right_padding = 4,
      width = 56,
      height = 28,
      left_click_sound = "__core__/sound/gui-menu-small.ogg"
    },

    floating_train_station_list_box =
    {
      parent = "list_box",
      type = "list_box_style",
      maximal_height = 800,
      minimal_height = 200
    },

    schedule_in_train_view_list_box =
    {
      type = "list_box_style",
      parent = "list_box_in_shallow_frame",
      width = 200,
      height = 3*28
    },

    locomotive_minimap_button =
    {
      type = "button_style",
      parent = "button",
      padding = 0,
      size = train_gui_minimap_size,
      default_graphical_set =
      {
        base =
        {
          position = {85, 0}, corner_size = 8,
          center = {position = {42, 8}, size = {1, 1}},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
      hovered_graphical_set =
      {
        base =
        {
          position = {85, 0}, corner_size = 8,
          center = {position = {42, 8}, size = {1, 1}},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
      clicked_graphical_set =
      {
        base =
        {
          position = {85, 0}, corner_size = 8,
          center = {position = {42, 8}, size = {1, 1}},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
      disabled_graphical_set =
      {
        base =
        {
          position = {85, 0}, corner_size = 8,
          center = {position = {42, 8}, size = {1, 1}},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
      selected_graphical_set =
      {
        base =
        {
          position = {85, 0}, corner_size = 8,
          center = {position = {42, 8}, size = {1, 1}},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
      selected_hovered_graphical_set =
      {
        base =
        {
          position = {85, 0}, corner_size = 8,
          center = {position = {42, 8}, size = {1, 1}},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
      selected_clicked_graphical_set =
      {
        base =
        {
          position = {85, 0}, corner_size = 8,
          center = {position = {42, 8}, size = {1, 1}},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
    },

    minimap_widget_under_subheader =
    {
      type = "empty_widget_style",
      -- we only show shadow on the top, to solve the problem of it not being casted from the subheader panel above
      graphical_set =
      {
        shadow =
        {
          top =
          {
            position = {191, 128},
            size = {1, 8},
            tint = hard_shadow_color
          }
        }
      }
    },

    target_station_in_schedule_in_train_view_list_box_item =
    {
      type = "button_style",
      parent = "list_box_item",
      default_font_color = gui_color.orange,
      hovered_font_color = {82, 47, 0},
      clicked_font_color = {82, 47, 0},
      selected_font_color = {82, 47, 0},
      selected_hovered_font_color = {82, 47, 0},
      selected_clicked_font_color = {82, 47, 0}
    },

    no_path_station_in_schedule_in_train_view_list_box_item =
    {
      type = "button_style",
      parent = "list_box_item",
      default_font_color = {1, 0.2, 0.3},
      hovered_font_color = {135, 0, 17},
      clicked_font_color = {135, 0, 17},
      selected_font_color = {135, 0, 17},
      selected_hovered_font_color = {135, 0, 17},
      selected_clicked_font_color = {135, 0, 17}
    },

    default_permission_group_list_box_item =
    {
      type = "button_style",
      parent = "list_box_item",
      default_font_color = {0.55, 0.55, 1},
      hovered_font_color = {0.8, 0.8, 1.0},
      selected_font_color = {0.2, 0.2, 0.8},
      selected_hovered_font_color = {0.2, 0.2, 0.8},
      selected_clicked_font_color = {0.2, 0.2, 0.8}
    },

    steam_friend_label =
    {
      type = "label_style",
      font_color = {0.28, 0.58, 0.7}
    },

    flow =
    {
      type = "flow_style",
      horizontal_spacing = default_container_spacing,
      vertical_spacing = default_container_spacing,
      max_on_row = 0
    },

    horizontal_flow =
    {
      type = "horizontal_flow_style",
      horizontal_spacing = default_container_spacing
    },

    vertical_flow =
    {
      type = "vertical_flow_style",
      vertical_spacing = default_container_spacing
    },

    mod_gui_spacing_horizontal_flow = --used by mod gui lua
    {
      type = "horizontal_flow_style",
      horizontal_spacing = 0,
      padding = 0 -- use equal paddings on all sides to avoid clipping frame shadows
    },

    blueprint_book_edit_frame =
    {
      type = "frame_style",
      minimal_width = 500
    },

    table =
    {
      type = "table_style",
      horizontal_spacing = 4,
      vertical_spacing = 4,
      border = {},
      column_ordering_ascending_button_style =
      {
        type = "button_style",
        size = {8, 8},
        padding = 0,
        default_graphical_set =
        {
          filename = "__core__/graphics/arrows/table-header-sort-arrow-up-active.png",
          size = {16, 16},
          scale = 0.5
        },
        hovered_graphical_set =
        {
          filename = "__core__/graphics/arrows/table-header-sort-arrow-up-hover.png",
          size = {16, 16},
          scale = 0.5
        },
        clicked_graphical_set =
        {
          filename = "__core__/graphics/arrows/table-header-sort-arrow-up-active.png",
          size = {16, 16},
          scale = 0.5
        },
        disabled_graphical_set =
        {
          filename = "__core__/graphics/arrows/table-header-sort-arrow-up-white.png",
          size = {16, 16},
          scale = 0.5
        }
      },
      column_ordering_descending_button_style =
      {
        type = "button_style",
        size = {8, 8},
        default_graphical_set =
        {
          filename = "__core__/graphics/arrows/table-header-sort-arrow-down-active.png",
          size = {16, 16},
          scale = 0.5
        },
        hovered_graphical_set =
        {
          filename = "__core__/graphics/arrows/table-header-sort-arrow-down-hover.png",
          size = {16, 16},
          scale = 0.5
        },
        clicked_graphical_set =
        {
          filename = "__core__/graphics/arrows/table-header-sort-arrow-down-active.png",
          size = {16, 16},
          scale = 0.5
        },
        disabled_graphical_set =
        {
          filename = "__core__/graphics/arrows/table-header-sort-arrow-down-white.png",
          size = {16, 16},
          scale = 0.5
        }
      },
      inactive_column_ordering_ascending_button_style =
      {
        type = "button_style",
        size = {8, 8},
        default_graphical_set =
        {
          filename = "__core__/graphics/arrows/table-header-sort-arrow-up-white.png",
          size = {16, 16},
          scale = 0.5
        },
        hovered_graphical_set =
        {
          filename = "__core__/graphics/arrows/table-header-sort-arrow-up-hover.png",
          size = {16, 16},
          scale = 0.5
        },
        clicked_graphical_set =
        {
          filename = "__core__/graphics/arrows/table-header-sort-arrow-up-white.png",
          size = {16, 16},
          scale = 0.5
        },
        disabled_graphical_set =
        {
          filename = "__core__/graphics/arrows/table-header-sort-arrow-up-white.png",
          size = {16, 16},
          scale = 0.5
        }
      },
      inactive_column_ordering_descending_button_style =
      {
        type = "button_style",
        size = {8, 8},
        default_graphical_set =
        {
          filename = "__core__/graphics/arrows/table-header-sort-arrow-down-white.png",
          size = {16, 16},
          scale = 0.5
        },
        hovered_graphical_set =
        {
          filename = "__core__/graphics/arrows/table-header-sort-arrow-down-hover.png",
          size = {16, 16},
          scale = 0.5
        },
        clicked_graphical_set =
        {
          filename = "__core__/graphics/arrows/table-header-sort-arrow-down-white.png",
          size = {16, 16},
          scale = 0.5
        },
        disabled_graphical_set =
        {
          filename = "__core__/graphics/arrows/table-header-sort-arrow-down-white.png",
          size = {16, 16},
          scale = 0.5
        }
      }
    },

    table_with_selection =
    {
      type = "table_style",
      horizontal_spacing = 0,
      vertical_spacing = 0,
      left_cell_padding = 8,
      top_cell_padding = 4,
      right_cell_padding = 8,
      bottom_cell_padding = 4,
      apply_row_graphical_set_per_column = true,
      default_row_graphical_set = {position = {208, 17},  corner_size = 8},
      hovered_graphical_set = {position = {34, 17}, corner_size = 8},
      clicked_graphical_set = {position = {51, 17}, corner_size = 8},
      selected_graphical_set = {position = {51, 17}, corner_size = 8},
      selected_hovered_graphical_set = {position = {369, 17}, corner_size = 8},
      selected_clicked_graphical_set = {position = {352, 17}, corner_size = 8}
    },

    players_table =
    {
      type = "table_style",
      parent = "table_with_selection",
      column_widths = {{column = 2, minimal_width = 200, maximal_width = 300}, {column = 3, minimal_width = 150, maximal_width = 300}}
    },

    mods_explore_results_table =
    {
      type = "table_style",
      parent = "table_with_selection",
      cell_padding = 8,
      default_row_graphical_set = {position = {68, 0},  corner_size = 8}
    },

    compact_slot_table =
    {
      type = "table_style",
      horizontal_spacing = 2,
      vertical_spacing = 2
    },

    slot_table =
    {
      type = "table_style",
      horizontal_spacing = 0,
      vertical_spacing = 0
    },

    filter_slot_table =
    {
      type = "table_style",
      parent = "slot_table",
      wide_as_column_count = true,
      column_widths = { minimal_width = slot_size }
    },

    browse_games_table =
    {
      type = "table_style",
      parent = "table_with_selection",
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
      },
    },

    browse_games_on_lan_table =
    {
      type = "table_style",
      parent = "table_with_selection",
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

    inset_frame_container_table =
    {
      type = "table_style",
      parent = "table",
      vertical_spacing = 12,
      horizontal_spacing = 12
    },

    inset_frame_container_horizontal_flow =
    {
      type = "horizontal_flow_style",
      horizontal_spacing = 12
    },

    inset_frame_container_horizontal_flow_in_tabbed_pane =
    {
      type = "horizontal_flow_style",
      horizontal_spacing = 12,
      left_padding = 8,
      right_padding = 8,
      bottom_padding = 4
    },

    inset_frame_container_vertical_flow =
    {
      type = "vertical_flow_style",
      vertical_spacing = 12
    },

    two_module_spacing_vertical_flow =
    {
      type = "vertical_flow_style",
      vertical_spacing = 8
    },

    two_module_spacing_horizontal_flow =
    {
      type = "horizontal_flow_style",
      horizontal_spacing = 8
    },

    map_generator_frequency_table =
    {
      type = "table_style",
      parent = "bordered_table",
      cell_padding = 8,
      column_widths =
      {
        { -- label
          column = 1,
          minimal_width = 116
        },
        -- other columns have width 108 or 116 by inside sliders
      },
      column_alignments =
      {
        { -- label
          column = 1,
          alignment = "middle-left"
        },
        { -- frequency
          column = 2,
          alignment = "middle-center"
        },
        { -- size
          column = 3,
          alignment = "middle-center"
        },
        { -- richness
          column = 4,
          alignment = "middle-center"
        }
      }
    },

    short_number_textfield =
    {
      type = "textbox_style",
      width = 80
    },

    invalid_value_short_number_textfield =
    {
      type = "textbox_style",
      parent = "invalid_value_textfield",
      width = 80
    },

    very_short_number_textfield =
    {
      type = "textbox_style",
      width = 40
    },

    long_number_textfield =
    {
      type = "textbox_style",
      width = 150
    },

    slider_value_textfield =
    {
      type = "textbox_style",
      parent = "short_number_textfield",
      horizontal_align = "center"
    },

    wide_slider_value_textfield =
    {
      type =  "textbox_style",
      parent = "slider_value_textfield",
      width = 100
    },

    stretchable_textfield =
    {
      type = "textbox_style",
      maximal_width = 0,
      horizontally_stretchable = "on"
    },

    browse_games_gui_toggle_favorite_on_button =
    {
      type = "button_style",
      size = 16,
      default_graphical_set =
      {
        filename = "__core__/graphics/gui-new.png",
        size = 32,
        position = {32, 600}
      },
      hovered_graphical_set =
      {
        filename = "__core__/graphics/gui-new.png",
        size = 32,
        position = {64, 600}
      },
      clicked_graphical_set =
      {
        filename = "__core__/graphics/gui-new.png",
        size = 32,
        position = {96, 600}
      },
      disabled_graphical_set =
      {
        filename = "__core__/graphics/gui-new.png",
        size = 32,
        position = {0, 600}
      }
    },

    browse_games_gui_toggle_favorite_off_button =
    {
      type = "button_style",
      size = 16,
      default_graphical_set =
      {
        filename = "__core__/graphics/gui-new.png",
        size = 32,
        position = {0, 600}
      },
      hovered_graphical_set =
      {
        filename = "__core__/graphics/gui-new.png",
        size = 32,
        position = {0, 600}
      },
      clicked_graphical_set =
      {
        filename = "__core__/graphics/gui-new.png",
        size = 32,
        position = {0, 600}
      },
      disabled_graphical_set =
      {
        filename = "__core__/graphics/gui-new.png",
        size = 32,
        position = {0, 600}
      }
    },

    mods_filter_exclude_button =
    {
      type = "button_style",
      parent = "transparent_slot",
      size = 16,
      left_margin = 8,
      default_graphical_set =
      {
        filename = "__core__/graphics/icons/mod-manager/ban.png",
        size = 32,
      },
      hovered_graphical_set =
      {
        filename = "__core__/graphics/icons/mod-manager/ban-hovered.png",
        size = 32,
      },
      clicked_graphical_set =
      {
        filename = "__core__/graphics/icons/mod-manager/ban-clicked.png",
        size = 32,
      },
      selected_graphical_set =
      {
        filename = "__core__/graphics/icons/mod-manager/ban-selected.png",
        size = 32,
      },
      selected_hovered_graphical_set =
      {
        filename = "__core__/graphics/icons/mod-manager/ban-hovered.png",
        size = 32,
      },
      selected_clicked_graphical_set =
      {
        filename = "__core__/graphics/icons/mod-manager/ban-clicked.png",
        size = 32,
      },
    },

    mods_filter_hit_count_label =
    {
      type = "label_style",
      font = "default-tiny-bold",
      font_color = gui_color.caption,
      -- To be properly vertically centered with the checkbox
      top_margin = 2,
      bottom_margin = -2,
    },

    mods_sorting_image =
    {
      type = "image_style",
      size = 16,
      left_margin = 8,
      right_margin = 4,
      stretch_image_to_widget_size = true,
    },

    recipe_tooltip_horizontal_image =
    {
      type = "image_style",
      size = 24,
      top_margin = 6,
      stretch_image_to_widget_size = true,
    },

    neutral_message_frame =
    {
      type = "frame_style",
      graphical_set =
      {
        base = {position = {386, 17}, corner_size = 8},
        shadow = default_shadow
      }
    },

    negative_message_frame =
    {
      type = "frame_style",
      graphical_set =
      {
        base = {position = {403, 17}, corner_size = 8},
        shadow = default_shadow
      }
    },

    positive_message_frame =
    {
      type = "frame_style",
      graphical_set =
      {
        base = {position = {420, 17}, corner_size = 8},
        shadow = default_shadow
      }
    },

    textbox =
    {
      type = "textbox_style",
      font = "default",
      ignored_by_search = true,
      font_color = {},
      left_padding = 3,
      right_padding = 2,
      -- sets a textfield to a total height of 28
      top_padding = 0,
      bottom_padding = 0,
      default_background =
      {
        base = {position = {248, 0}, corner_size = 8},
        shadow = textbox_dirt
      },
      disabled_font_color = util.premul_color {1, 1, 1, 0.5},
      active_background =
      {
        base = {position = {265, 0}, corner_size = 8},
        shadow = textbox_dirt
      },
      game_controller_hovered_background =
      {
        base = {position = {265, 0}, corner_size = 8},
        shadow = textbox_dirt
      },
      disabled_background =
      {
        base = {position = {282, 0}, corner_size = 8},
        shadow = textbox_dirt
      },
      selection_background_color= {241, 190, 100},
      width = 200,
      minimal_height = 28,
      rich_text_setting = "enabled",
      rich_text_highlight_error_color = {166, 10, 10},
      rich_text_highlight_warning_color = {255, 90, 0},
      rich_text_highlight_ok_color = {63, 105, 0},
      selected_rich_text_highlight_error_color = {166, 10, 10},
      selected_rich_text_highlight_warning_color = {182, 62, 4},
      selected_rich_text_highlight_ok_color = {50, 80, 0}
    },

    editor_lua_textbox =
    {
      type = "textbox_style",
      parent = "textbox",
      horizontally_stretchable = "on",
      height = 300,
      maximal_width = 600
    },

    notice_scroll_pane =
    {
      type = "scroll_pane_style",
      always_draw_borders = true,
      graphical_set =
      {
        base =
        {
          position = {17, 0},
          corner_size = 8,
          center = {position = {76, 8}, size = 1},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
      top_padding = 4,
      left_padding = 8,
      right_padding = 8,
      bottom_padding = 4
    },

    notice_textbox =
    {
      type = "textbox_style",
      parent = "textbox",
      default_background =
      {
        type = "none",
        opacity = 0
      },
      font_color = gui_color.white,
      maximal_width = 500,
      minimal_width = 0,
      padding = 0,
      minimal_height = 0
    },

    search_popup_textfield =
    {
      type = "textbox_style",
      width = 104
    },

    console_input_textfield =
    {
      type = "textbox_style",
      font = "default-game",
      font_color = gui_color.white,
      left_padding = 3,
      right_padding = 3,
      top_padding = 0,
      bottom_padding = 0,
      selection_background_color= {241, 190, 100},
      rich_text_setting = "highlight",
      rich_text_highlight_error_color = {255, 0, 0},
      rich_text_highlight_warning_color = {255, 255, 0},
      rich_text_highlight_ok_color = {0, 255, 0},
      selected_rich_text_highlight_error_color = {255, 0, 0},
      selected_rich_text_highlight_warning_color = {255, 255, 0},
      selected_rich_text_highlight_ok_color = {0, 255, 0},
      default_background =
      {
        position = {0, 1201},
        corner_size = 8
      },
      active_background =
      {
        position = {0, 1201},
        corner_size = 8
      }
    },

    highlighted_value_textfield =
    {
      type = "textbox_style",
      default_background =
      {
        base = {position = {17, 913}, corner_size = 8},
        shadow = textbox_dirt
      },
      active_background =
      {
        base = {position = {17, 913}, corner_size = 8},
        shadow = textbox_dirt
      }
    },

    invalid_value_textfield =
    {
      type = "textbox_style",
      default_background =
      {
        base = {position = {0, 913}, corner_size = 8},
        shadow = textbox_dirt
      },
      active_background =
      {
        base = {position = {0, 913}, corner_size = 8},
        shadow = textbox_dirt
      }
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
      font_color = {},
      padding = 8,
      top_padding = 4,
      bottom_padding = 4,
      width = 0,
      default_background =
      {
        base = {position = {248, 0}, corner_size = 8},
        shadow = textbox_dirt
      },
      disabled_font_color = util.premul_color {1, 1, 1, 0.5},
      selection_background_color = {241, 190, 100},
      vertically_stretchable = "on",
      rich_text_setting = "disabled"
    },

    big_notice_textbox =
    {
      type = "textbox_style",
      parent = "textbox",
      width = 1280 - 24, --make it fit on Nintendo Switch
      height = 720 - 96
    },

    small_notice_textbox =
    {
      type = "textbox_style",
      parent = "textbox",
      width = 1280/2,
      height = 720/2
    },

    edit_blueprint_description_textbox =
    {
      type = "textbox_style",
      horizontally_stretchable = "on",
      height = 120,
      maximal_width = 0
    },

    frame_title =
    {
      type = "label_style",
      parent = "label",
      font = "heading-1",
      font_color = gui_color.caption
    },

    frame_header_flow =
    {
      type = "horizontal_flow_style",
      horizontally_stretchable = "on",
      bottom_padding = 4,
      horizontal_spacing = 8,
      ignored_by_search = true
    },

    frame =
    {
      type = "frame_style",
      title_style =
      {
        type = "label_style",
        parent = "frame_title",
        top_margin = -3,
        bottom_padding = 3
      },
      -- padding of the content area of the frame
      top_padding = 4,
      right_padding = 8,
      bottom_padding = 8,
      left_padding = 8,
      graphical_set =
      {
        base = {position = {0, 0}, corner_size = 8},
        shadow = default_shadow
      },
      horizontal_flow_style = { type = "horizontal_flow_style" }, -- content in Gui::Direction::Horizontal
      vertical_flow_style = { type = "vertical_flow_style" }, -- content in Gui::Direction::Vertical
      header_flow_style =
      {
        type = "horizontal_flow_style",
        parent = "frame_header_flow"
      },
      header_filler_style =
      {
        type = "empty_widget_style",
        parent = "draggable_space_header",
        horizontally_stretchable = "on",
        vertically_stretchable = "on",
        height = 24
      },
      use_header_filler = true,
      drag_by_title = true,
      border = {}
    },

    frame_around_top =
    {
      type = "frame_style",
      parent = "frame",
      bottom_padding = -4,
      use_header_filler = false,
      graphical_set = frame_around_graphical_set("top")
    },

    frame_around_bottom =
    {
      type = "frame_style",
      parent = "frame",
      padding = 0,
      height = 8,
      graphical_set = frame_around_graphical_set("bottom")
    },

    frame_around_left =
    {
      type = "frame_style",
      parent = "frame",
      padding = 0,
      width = 8,
      graphical_set = frame_around_graphical_set("left")
    },

    frame_around_right =
    {
      type = "frame_style",
      parent = "frame",
      padding = 0,
      width = 8,
      graphical_set = frame_around_graphical_set("right")
    },

    frame_around_center =
    {
      type = "frame_style",
      padding = 0,
      margin = 4,
      graphical_set =
      {
        base =
        {
          position = {17, 0}, corner_size = 8,
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      }
    },

    -- used by mod gui lua, but also useful generically
    non_draggable_frame =
    {
      type = "frame_style",
      parent = "frame",
      use_header_filler = false,
      drag_by_title = false
    },

    speech_bubble =
    {
      type = "speech_bubble_style",

      frame_style =
      {
        type = "frame_style",
        graphical_set =
        {
          type = "composition",
          filename = "__core__/graphics/arrows/hint-orange-box.png",
          corner_size = {13, 13},
          position = {0, 0}
        },
        top_padding = 0,
        right_padding = 0,
        bottom_padding = 10,
        left_padding = 5
      },

      label_style =
      {
        type = "label_style",
        parent = "label",
        width = 400,
        font = "scenario-message-dialog",
        single_line = false
      },

      arrow_graphical_set =
      {
        top =
        {
          filename = "__core__/graphics/arrows/hint-orange-arrow-up.png",
          width = 62,
          height = 37
        },
        bottom =
        {
          filename = "__core__/graphics/arrows/hint-orange-arrow-down.png",
          width = 71,
          height = 35
        },
        right =
        {
          filename = "__core__/graphics/arrows/hint-orange-arrow-right.png",
          width = 38,
          height = 73
        },
        left =
        {
          filename = "__core__/graphics/arrows/hint-orange-arrow-left.png",
          width = 43,
          height = 73
        }
      },
      arrow_indent = 7,
      close_color = gui_color.caption,
      pass_through_mouse = false
    },

    cancel_close_button =
    {
      type = "button_style",
      parent = "frame_action_button",
      tooltip = "gui.cancel-instruction"
    },

    close_button =
    {
      type = "button_style",
      parent = "frame_action_button",
      tooltip = "gui.close-instruction"
    },

    compilatron_gui_message =
    {
      type = "speech_bubble_style",
      frame_style =
      {
        type = "frame_style",
        graphical_set =
        {
          filename = "__core__/graphics/gui-new.png",
          corner_size = 8,
          position = {433, 424},
          scale = 0.5
        },
        padding = 12
      },

      label_style =
      {
        type = "label_style",
        parent = "label",
        font = "default",
        maximal_width = 500,
        single_line = false,
        font_color = {255, 174, 24}
      },

      arrow_graphical_set =
      {
        top =
        {
          position = {433, 473},
          size = {32, 24}
        },
        bottom =
        {
          position = {465, 473},
          size = {32, 24}
        },
        right =
        {
          position = {458, 441},
          size = {24, 32}
        },
        left =
        {
          position = {433, 441},
          size = {24, 32}
        }
      },
      arrow_indent = 2.5,
      close_color = {0.361,0.894,0.278},
      pass_through_mouse = false
    },

    compilatron_speech_bubble_wrapper =
    {
      type = "flow_style",
      effect = "compilatron-hologram"
    },

    compilatron_speech_bubble =
    {
      type = "speech_bubble_style",

      frame_style =
      {
        type = "frame_style",
        graphical_set =
        {
          filename = "__core__/graphics/gui-new.png",
          corner_size = 8,
          position = {450, 498},
          scale = 0.5,
          opacity = 0.15
        },
        padding = 12
      },

      label_style =
      {
        type = "label_style",
        parent = "label",
        font = "default",
        maximal_width = 500,
        single_line = false,
        font_color = {255, 246, 113}
      },

      arrow_graphical_set =
      {
        top =
        {
          position = {433, 547},
          size = {32, 24}
        },
        bottom =
        {
          position = {465, 551},
          size = {32, 20}
        },
        right =
        {
          position = {458, 516},
          size = {24, 32}
        },
        left =
        {
          position = {433, 516},
          size = {24, 32}
        }
      },

      arrow_indent = 0,
      close_color = {0.361,0.894,0.278},
      pass_through_mouse = true
    },

    sign_post_speech_bubble =
    {
      type = "speech_bubble_style",
      parent = "compilatron_speech_bubble",
      label_style =
      {
        type = "label_style",
        parent = "label",
        font = "default-bold",
        maximal_width = 500,
        single_line = false,
        font_color = {255, 174, 24}
      }
    },

    current_research_info_button =
    {
      type = "button_style",
      padding = 0,
      width = right_menu_width,
      default_graphical_set =
      {
        base = {position = {0, 0}, corner_size = 8, draw_type = "inner"},
        shadow = {position = {17, 0}, corner_size = 8, draw_type = "outer"}
      },
    },

    current_research_info_image =
    {
      type = "image_style",
      height = 32,
      width = 0 + 32 + 4,
      left_padding = 0,
      right_padding = 4,
      margin = 0,
      stretch_image_to_widget_size = true
    },

    current_research_info_percent_label =
    {
      type = "label_style",
      parent = "label",
      font = "default-small",
      width = 28,
      padding = 0,
      right_margin = 8,
      height = 8,
      vertical_align = "center",
      horizontal_align = "center"
    },

    frame_with_even_paddings =
    {
      type = "frame_style",
      top_padding = 8
    },

    number_input_frame =
    {
      type = "frame_style",
      padding = 0,
      left_padding = 8
    },

    blurry_frame =
    {
      type = "frame_style",
      -- padding of the content area of the frame
      top_padding  = 8,
      right_padding = 12,
      bottom_padding = 12,
      left_padding = 12,
      graphical_set =
      {
        base =
        {
          center = {position = {336, 0}, size = {1, 1}},
          opacity = 0.75,
          background_blur = true
        },
        shadow = default_shadow
      }
    },

    no_header_filler_frame =
    {
      type = "frame_style",
      use_header_filler = false
    },

    dialog_buttons_horizontal_flow =
    {
      type = "horizontal_flow_style",
      top_padding = 8,
      vertically_stretchable = "off",
      horizontal_spacing = 8
    },

    map_details_frame =
    {
      type = "frame_style",
      parent = "blurry_frame",
      vertical_flow_style = { type = "vertical_flow_style" },
      width = 220
    },

    subheader_frame =
    {
      type = "frame_style",
      parent = "frame",
      graphical_set =
      {
        base =
        {
          center = {position = {256, 25}, size = {1, 1}},
          bottom = {position = {256, 26}, size = {1, 8}},
        },
        shadow = bottom_shadow
      },
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        vertical_align = "center"
      },
      vertical_align = "center",
      top_padding = 3, -- optical correction - move one pixel up from perfect position
      right_padding = 4,
      left_padding = 4,
      bottom_padding = 1,
      height = 36,
      -- bottom 4 come from border
      vertically_stretchable = "off",
      never_hide_by_search = true
    },

    repeated_subheader_frame =
    {
      type = "frame_style",
      parent = "subheader_frame",
      graphical_set =
      {
        base =
        {
          top = {position = {256, 17}, size = {1, 8}},
          center = {position = {256, 25}, size = {1, 1}},
          bottom = {position = {256, 26}, size = {1, 8}}
        },
        shadow = bottom_shadow
      }
    },

    negative_subheader_frame =
    {
      type = "frame_style",
      parent = "subheader_frame",
      bottom_margin = -36, -- so it "eats up" the contents of the thing under
      graphical_set =
      {
        base =
        {
          center = {position = {411, 25}, size = {1, 1}},
          bottom = {position = {411, 26}, size = {1, 8}}
        },
        shadow = bottom_shadow
      },
      header_flow_style =
      {
        type = "horizontal_flow_style",
        horizontal_align = "center",
        horizontally_stretchable = "on",
      },
      title_style =
      {
        type = "label_style",
        parent = "bold_label",
        height = 28,
        vertical_align = "center"
      },
      use_header_filler = false,
      horizontally_stretchable = "on"
    },

    shallow_frame =
    {
      type = "frame_style",
      graphical_set = {base = {position = {68, 0}, corner_size = 8}},
      padding = 4,
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        vertical_align = "center"
      }
    },

    control_settings_section_frame =
    {
      type = "frame_style",
      parent = "deep_frame_in_shallow_frame",
      graphical_set = {base = {position = {85, 0}, corner_size = 8, draw_type = "outer"}}
    },

    subfooter_frame =
    {
      type = "frame_style",
      parent = "frame",
      graphical_set =
      {
        base =
        {
          top = {position = {256, 17}, size = {1, 8}},
          center = {position = {256, 25}, size = {1, 1}}
        },
        shadow = top_shadow
      },
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        vertical_align = "center"
      },
      -- top 4 come from border
      top_padding = 0,
      left_padding = 8,
      padding = 4,
      height = 36
    },

    subfooter_frame_with_left_edge =
    {
      type = "frame_style",
      parent = "subfooter_frame",
      graphical_set =
      {
        base =
        {
          top = {position = {256, 17}, size = {1, 8}},
          center = {position = {256, 25}, size = {1, 1}},
          left_top = {position = {248, 17}, size = {8, 8}},
          left = {position = {248, 25}, size = {8, 1}},
          left_bottom = {position = {248, 26}, size = {8, 8}}
        },
        shadow = top_shadow
      }
    },

    invisible_frame =
    {
      type = "frame_style",
      padding = 0,
      graphical_set = {},
      use_header_filler = false,
      title_style =
      {
        type = "label_style",
        parent = "frame_title",
        bottom_padding = 5
      },
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        horizontal_spacing = 0
      },
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 0
      }
    },

    inset_frame_container_frame =
    {
      type = "frame_style",
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        parent = "inset_frame_container_vertical_flow"
      },
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        parent = "inset_frame_container_horizontal_flow"
      }
    },

    status_image =
    {
      type = "image_style",
      size = 16,
    },

    logistics_diode =
    {
      type = "image_style",
      size = 20,
    },

    relative_gui_top_flow =
    {
      type = "horizontal_flow_style",
      vertical_align = "bottom",
      horizontally_stretchable = "on",
      horizontal_spacing = 0
    },

    relative_gui_bottom_flow =
    {
      type = "horizontal_flow_style",
      vertical_align = "top",
      horizontally_stretchable = "on",
      horizontal_spacing = 0
    },

    relative_gui_left_flow =
    {
      type = "vertical_flow_style",
      horizontal_align = "right",
      vertically_stretchable = "on",
      vertical_spacing = 0
    },

    relative_gui_right_flow =
    {
      type = "vertical_flow_style",
      horizontal_align = "left",
      vertically_stretchable = "on",
      vertical_spacing = 0
    },

    train_stop_subheader =
    {
      type = "label_style",
      parent = "subheader_caption_label",
      maximal_width = (12 + slot_table_width + 12) - (8 + 4 + 16 + 4 + 4 + 28 + 4 + 28)
    },

    -- Dark deep frame for window content
    inside_deep_frame =
    {
      type = "frame_style",
      parent = "frame",
      padding = 0,
      graphical_set =
      {
        base =
        {
          position = {17, 0}, corner_size = 8,
          center = {position = {42, 8}, size = {1, 1}},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 0
      }
    },

    deep_frame_in_shallow_frame_for_description =
    {
      type = "frame_style",
      parent = "deep_frame_in_shallow_frame",
      padding = 8,
      horizontally_stretchable = "on",
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 4
      }
    },

    deep_frame_in_shallow_frame_for_description_with_fixed_width =
    {
      type = "frame_style",
      parent = "deep_frame_in_shallow_frame_for_description",
      width = 500
    },

    tab_deep_frame_in_entity_frame =
    {
      type = "frame_style",
      parent = "frame",
      margin = -12,
      top_margin = 8,
      padding = 0,
      graphical_set =
      {
        base =
        {
          position = {85, 0}, corner_size = 8,
          center = {position = {42, 8}, size = {1, 1}},
          draw_type = "outer"
        },
        shadow =
        {
          top =
          {
            position = {191, 128},
            size = {1, 8},
            tint = hard_shadow_color
          }
        }
      },
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 0
      }
    },

    mod_gui_inside_deep_frame =
    {
      type = "frame_style",
      parent = "inside_deep_frame",
      padding = 1,
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        horizontal_spacing = 2,
      }
    },

    -- Light deep frame for window content, e.g. for inventory frame
    inside_shallow_frame =
    {
      type = "frame_style",
      parent = "frame",
      padding = 0,
      horizontally_stretchable = "on",
      graphical_set =
      {
        base =
        {
          position = {17, 0}, corner_size = 8,
          center = {position = {76, 8}, size = {1, 1}},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 0
      }
    },

    shallow_frame_in_shallow_frame =
    {
      type = "frame_style",
      parent = "frame",
      padding = 0,
      graphical_set =
      {
        base =
        {
          position = {85, 0}, corner_size = 8,
          center = {position = {76, 8}, size = {1, 1}},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 0
      }
    },

    inside_shallow_frame_with_padding =
    {
      type = "frame_style",
      parent = "inside_shallow_frame",
      padding = 12
    },

    inside_shallow_frame_with_padding_and_vertical_spacing =
    {
      type = "frame_style",
      parent = "inside_shallow_frame_with_padding",
      vertical_flow_style = { type = "vertical_flow_style" },
      horizontal_flow_style = { type = "horizontal_flow_style" }
    },

    deep_frame_in_shallow_frame =
    {
      type = "frame_style",
      parent = "frame",
      padding = 0,
      graphical_set =
      {
        base =
        {
          position = {85, 0}, corner_size = 8,
          center = {position = {42, 8}, size = {1, 1}},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 0
      }
    },

    slot_button_deep_frame =
    {
      type = "frame_style",
      parent = "deep_frame_in_shallow_frame",
      background_graphical_set = deep_slot_background_tiling(40, 40),
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 0
      },
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        horizontal_spacing = 0
      }
    },

    inventory_frame_title_style =
    {
      type = "label_style",
      parent = "bold_label",
      bottom_padding = 4
    },

    inventory_frame =
    {
      type = "frame_style",
      graphical_set = {},
      padding = 0,
      use_header_filler = false,
      title_style =
      {
        type = "label_style",
        parent = "inventory_frame_title_style"
      },
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        parent = "two_module_spacing_vertical_flow"
      }
    },

    quick_panel_slot_button_deep_frame =
    {
      type = "frame_style",
      parent = "slot_button_deep_frame",
      size = 120 -- 3x3 grid
    },

    train_inventory_frame =
    {
      type = "frame_style",
      parent = "inventory_frame",
      left_padding = 12 - 4,
      right_padding = 12 - 4,
      bottom_padding = 12 - 4,
      top_padding = 12 - 8
    },

    open_armor_button =
    {
      type = "button_style",
      parent = "forward_button",
      padding = 7,
      height = 38,
      width = 76
    },

    -- frame with borders around it
    bordered_frame =
    {
      type = "frame_style",
      graphical_set = {},
      border = border_image_set(),
      use_header_filler = false,
      title_style =
      {
        type="label_style",
        parent = "caption_label"
      }
    },

    bordered_table =
    {
      type = "table_style",
      border = border_image_set(),
      cell_padding = 4,
      left_cell_padding = 8
    },

    horizontal_flow_with_extra_right_margin =
    {
      type = "horizontal_flow_style",
      right_margin = 4
    },

    removed_content_table =
    {
      type = "table_style",
      left_cell_padding = 8,
      right_cell_padding = 8,
      column_widths =
      {
        {
          column = 1,
          minimal_width = 332
        },
        {
          column = 2,
          minimal_width = 72
        },
        {
          column = 3,
          minimal_width = 72
        }
      },
      column_alignments =
      {
        {
          column = 2,
          alignment = "middle-right"
        },
        {
          column = 3,
          alignment = "middle-right"
        }
      },
      border = border_image_set(),
      odd_row_graphical_set =
      {
        filename = "__core__/graphics/gui-new.png",
        position = {472, 25},
        size = 1
      }
    },

    finished_game_table =
    {
      type = "table_style",
      parent = "removed_content_table",
      column_widths = {}
    },

    undelete_space_platforms_table =
    {
      type = "table_style",
      parent = "removed_content_table",
      column_widths =
      {
        {
          column = 2,
          width = 400
        },
        {
          column = 2,
          width = 400
        },
        {
          column = 3,
          width = 300
        }
      },
      column_alignments = {},
      border = border_image_set(),
      odd_row_graphical_set =
      {
        filename = "__core__/graphics/gui-new.png",
        position = {472, 25},
        size = 1
      }
    },

    player_input_horizontal_flow =
    {
      type = "horizontal_flow_style",
      horizontal_spacing = 8,
      vertical_align = "center",
      minimal_height = 28
    },

    player_input_table =
    {
      type = "table_style",
      horizontal_spacing = 8,
      vertical_spacing = 8,
      column_alignments =
      {
        {
          column = 1,
          alignment = "middle-left"
        },
        {
          column = 2,
          alignment = "middle-left"
        },
        {
          column = 3,
          alignment = "middle-left"
        }
      }
    },

    tooltip_frame =
    {
      type = "frame_style",
      graphical_set =
      {
        base = {position = {403, 0}, corner_size = 8, opacity = 0.88, background_blur_sigma = 4},
        shadow = default_shadow
      },
      top_padding = 0,
      bottom_padding = 0,
      left_padding = 4,
      right_padding = 4,
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 2
      }
    },

    tooltip_description_frame =
    {
      type = "frame_style",
      parent = "invisible_frame",
      maximal_width = 356
    },

    blueprint_tooltip_description_frame =
    {
      type = "frame_style",
      parent = "tooltip_description_frame",
      maximal_width = 600
    },

    goal_frame =
    {
      type = "frame_style",
      parent = "frame",
      use_header_filler = false,
      horizontally_stretchable = "on",
      maximal_width = 512 + 52 --Largest image width used in the mini-tutorials + the frame paddings
    },

    goal_inner_frame =
    {
      type = "frame_style",
      parent = "inside_shallow_frame_with_padding",
      top_padding = 8,
      bottom_padding = 8
    },

    minimap_frame =
    {
      type = "frame_style",
      padding = 0,
      graphical_set =
      {
        base = {position = {17, 0}, corner_size = 8, draw_type = "outer"},
        shadow = default_inner_shadow
      },
      size = right_menu_width
    },

    slot_window_frame =
    {
      type = "frame_style",
      padding = 4,
      use_header_filler = false,
      header_flow_style =
      {
        type = "horizontal_flow_style",
        parent = "frame_header_flow",
        bottom_padding = 8
      },
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        horizontal_spacing = 8
      }
    },

    quick_bar_slot_window_frame =
    {
      type = "frame_style",
      parent = "slot_window_frame",
      minimal_width = 468
    },

    shortcut_bar_window_frame =
    {
      type = "frame_style",
      left_padding = 4,
      right_padding = 0,
      bottom_padding = 4,
      use_header_filler = false
    },

    quick_bar_inner_panel =
    {
      type = "frame_style",
      padding = 0,
      graphical_set =
      {
        base =
        {
          center = {position = {42, 8}, size = {1, 1}}
        },
        shadow = {position = {440, 24}, corner_size = 8, draw_type = "outer"}
      },

      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        --spacing between tables
        horizontal_spacing = 4
      },
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 0
      }
    },

    tool_equip_inner_panel =
    {
      type = "frame_style",
      padding = 0,
      graphical_set =
      {
        base =
        {
          center = {position = {76, 8}, size = {1, 1}}
        },
        shadow = {position = {440, 24}, corner_size = 8, draw_type = "outer"}
      }
    },

    shortcut_bar_inner_panel =
    {
      type = "frame_style",
      parent = "quick_bar_inner_panel",
      padding = 0,
      background_graphical_set = deep_slot_background_tiling(40, 40),
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        horizontal_spacing = 0
      }
    },

    shortcut_bar_selection_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "list_box_scroll_pane",
      vertical_flow_style = { type = "vertical_flow_style", parent = "packed_vertical_flow" },
      background_graphical_set = deep_slot_background_tiling(nil, 28)
    },

    main_menu_version_label =
    {
      type = "label_style",
      font = "default-game",
      hovered_font_color = gui_color.orange
    },

    --this will keep the health/shield/mining bars in the correct place
    quickbar_holder_flow =
    {
      type = "vertical_flow_style",
      vertical_spacing = 0,
      vertical_align = "bottom",
      minimal_height = 96,
      minimal_width = 468
    },

    tooltip_title_frame_light =
    {
      type = "frame_style",
      horizontally_stretchable = "on",
      graphical_set = {position = {352, 0}, corner_size = 8, opacity = 0.88, background_blur_sigma = 4},
      top_padding = 0,
      bottom_padding = 0,
      left_padding = 4,
      right_padding = 4,
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 0
      }
    },

    tooltip_panel_background =
    {
      type = "frame_style",
      horizontally_stretchable = "on",
      graphical_set = {position = {403, 0}, corner_size = 8, opacity = 0.88, background_blur_sigma = 4},
      top_padding = 0,
      bottom_padding = 0,
      left_padding = 4,
      right_padding = 4,
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 0
      }
    },

    quick_bar_page_button =
    {
      type = "button_style",
      parent = "button",
      font = "default-bold",
      default_font_color = button_hovered_font_color,
      size = 40,
      padding = 0,
      margin = 0,
      default_graphical_set =
      {
        base = {position = {312, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      hovered_graphical_set =
      {
        base = {position = {346, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5),
        glow = offset_by_2_default_glow(default_glow_color, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {363, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      disabled_graphical_set =
      {
        base = {position = {329, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      left_click_sound = "__core__/sound/gui-square-button.ogg"
    },

    tool_bar_open_button =
    {
      type = "button_style",
      parent = "quick_bar_page_button",
      width = 52
    },

    tool_bar_empty_slot =
    {
      type = "empty_widget_style",
      width = 52,
      height = 40,
      graphical_set =
      {
        position = {282, 17},
        corner_size = 8
      }
    },

    dark_rounded_button =
    {
      type = "button_style",
      default_graphical_set =
      {
        base = {border = 4, position = {2, 738}, size = 76},
        shadow =
        {
          position = {378, 103},
          corner_size = 16,
          top_outer_border_shift = 4,
          bottom_outer_border_shift = -4,
          left_outer_border_shift = 4,
          right_outer_border_shift = -4,
          draw_type = "outer"
        }
      },
      hovered_graphical_set =
      {
        base = {border = 4, position = {82, 738}, size = 76},
        shadow =
        {
          position = {378, 103},
          corner_size = 16,
          top_outer_border_shift = 4,
          bottom_outer_border_shift = -4,
          left_outer_border_shift = 4,
          right_outer_border_shift = -4,
          draw_type = "outer"
        },
        glow = offset_by_2_rounded_corners_glow(default_glow_color)
      },
      clicked_graphical_set =
      {
        base = {border = 4, position = {162, 738}, size = 76},
        shadow =
        {
          position = {378, 103},
          corner_size = 16,
          top_outer_border_shift = 4,
          bottom_outer_border_shift = -4,
          left_outer_border_shift = 4,
          right_outer_border_shift = -4,
          draw_type = "outer"
        }
      }
    },

    train_schedule_item_select_button =
    {
      type = "button_style",
      parent = "dark_rounded_button",
      size = 28,
      padding = -3
    },

    train_schedule_fulfilled_item_select_button =
    {
      type = "button_style",
      parent = "train_schedule_item_select_button",
      default_graphical_set =
      {
        base = {border = 4, position = {2, 738}, size = 76},
        shadow =
        {
          position = {412, 103},
          corner_size = 16,
          top_outer_border_shift = 4,
          bottom_outer_border_shift = -4,
          left_outer_border_shift = 4,
          right_outer_border_shift = -4,
          draw_type = "outer"
        }
      },
      hovered_graphical_set =
      {
        base = {border = 4, position = {82, 738}, size = 76},
        shadow =
        {
          position = {412, 103},
          corner_size = 16,
          top_outer_border_shift = 4,
          bottom_outer_border_shift = -4,
          left_outer_border_shift = 4,
          right_outer_border_shift = -4,
          draw_type = "outer"
        },
        glow = offset_by_2_rounded_corners_glow(default_glow_color)
      },
      clicked_graphical_set =
      {
        base = {border = 4, position = {162, 736}, size = 76},
        shadow =
        {
          position = {412, 103},
          corner_size = 16,
          top_outer_border_shift = 4,
          bottom_outer_border_shift = -4,
          left_outer_border_shift = 4,
          right_outer_border_shift = -4,
          draw_type = "outer"
        }
      }
    },

    slot_button =
    {
      type = "button_style",
      parent = "button",
      draw_shadow_under_picture = true,
      size = 40,
      padding = 0,
      default_graphical_set =
      {
        base = {border = 4, position = {0, 736}, size = 80},
        shadow = offset_by_2_rounded_corners_glow(default_dirt_color)
      },
      hovered_graphical_set =
      {
        base = {border = 4, position = {80, 736}, size = 80},
        shadow = offset_by_2_rounded_corners_glow(default_dirt_color),
        glow = offset_by_2_rounded_corners_glow(default_glow_color)
      },
      clicked_graphical_set =
      {
        base = {border = 4, position = {160, 736}, size = 80},
        shadow = offset_by_2_rounded_corners_glow(default_dirt_color)
      },
      selected_graphical_set =
      {
        base = {border = 4, position = {80, 736}, size = 80},
        shadow = offset_by_2_rounded_corners_glow(default_dirt_color)
      },
      selected_hovered_graphical_set =
      {
        base = {border = 4, position = {80, 736}, size = 80},
        shadow = offset_by_2_rounded_corners_glow(default_dirt_color),
        glow = offset_by_2_rounded_corners_glow(default_glow_color)
      },
      selected_clicked_graphical_set =
      {
        base = {border = 4, position = {160, 736}, size = 80},
        shadow = offset_by_2_rounded_corners_glow(default_dirt_color)
      },
      pie_progress_color = {0.98, 0.66, 0.22, 0.5},
      left_click_sound = { filename = "__core__/sound/gui-inventory-slot-button.ogg", volume = 0.6 }
    },

    big_slot_button =
    {
      type = "button_style",
      parent = "button",
      draw_shadow_under_picture = true,
      size = 80,
      padding = 0,
      default_graphical_set =
      {
        base = {border = 4, position = {0, 1040}, size = 160},
        shadow = offset_by_2_rounded_corners_glow(default_dirt_color)
      },
      hovered_graphical_set =
      {
        base = {border = 4, position = {160, 1040}, size = 160},
        shadow = offset_by_2_rounded_corners_glow(default_dirt_color),
        glow = offset_by_2_rounded_corners_glow(default_glow_color)
      },
      clicked_graphical_set =
      {
        base = {border = 4, position = {320, 1040}, size = 160},
        shadow = offset_by_2_rounded_corners_glow(default_dirt_color)
      }
    },

    slot_button_in_shallow_frame =
    {
      type = "button_style",
      parent = "slot_button",
      default_graphical_set =
      {
        base = {border = 4, position = {0, 736}, size = 80},
        shadow = offset_by_4_rounded_corners_shallow_inset
      },
      hovered_graphical_set =
      {
        base = {border = 4, position = {80, 736}, size = 80},
        shadow = offset_by_4_rounded_corners_shallow_inset
      },
      clicked_graphical_set =
      {
        base = {border = 4, position = {160, 736}, size = 80},
        shadow = offset_by_4_rounded_corners_shallow_inset
      },
      selected_graphical_set =
      {
        base = {border = 4, position = {80, 736}, size = 80},
        shadow = offset_by_4_rounded_corners_shallow_inset
      },
      selected_hovered_graphical_set =
      {
        base = {border = 4, position = {80, 736}, size = 80},
        shadow = offset_by_4_rounded_corners_shallow_inset
      },
      selected_clicked_graphical_set =
      {
        base = {border = 4, position = {160, 736}, size = 80},
        shadow = offset_by_4_rounded_corners_shallow_inset
      },
      disabled_graphical_set =
      {
        base = {border = 4, position = {480, 816}, size = 80},
        shadow = offset_by_4_rounded_corners_shallow_inset
      },
      left_click_sound = "__core__/sound/gui-square-button.ogg"
    },

    yellow_slot_button =
    {
      type = "button_style",
      parent = "slot_button",
      default_graphical_set =
      {
        base = {border = 4, position = {0, 656}, size = 80},
        shadow = offset_by_2_rounded_corners_glow(default_dirt_color)
      },
      hovered_graphical_set =
      {
        base = {border = 4, position = {80, 656}, size = 80},
        shadow = offset_by_2_rounded_corners_glow(default_dirt_color),
        glow = offset_by_2_rounded_corners_glow(default_glow_color)
      },
      clicked_graphical_set =
      {
        base = {border = 4, position = {160, 656}, size = 80},
        shadow = offset_by_2_rounded_corners_glow(default_dirt_color)
      },
      disabled_graphical_set =
      {
        base = {position = {225, 17}, corner_size = 8},
        shadow = default_dirt
      },
      -- selected is default
    },

    red_slot_button =
    {
      type = "button_style",
      parent = "slot_button",
      default_graphical_set =
      {
        base = {border = 4, position = {240, 656}, size = 80},
        shadow = offset_by_2_rounded_corners_glow(default_dirt_color)
      },
      hovered_graphical_set =
      {
        base = {border = 4, position = {320, 656}, size = 80},
        shadow = offset_by_2_rounded_corners_glow(default_dirt_color),
        glow = offset_by_2_rounded_corners_glow(red_slot_glow_color)
      },
      clicked_graphical_set =
      {
        base = {border = 4, position = {400, 656}, size = 80},
        shadow = offset_by_2_rounded_corners_glow(default_dirt_color)
      },
      disabled_graphical_set =
      {
        base = {position = {153, 17}, corner_size = 8},
        shadow = default_dirt
      }
      -- selected is default
    },

    slot_sized_button =
    {
      type = "button_style",
      parent = "button",
      default_graphical_set =
      {
        base = {position = {312, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      disabled_graphical_set =
      {
        base = {position = {329, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      hovered_graphical_set =
      {
        base = {position = {346, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5),
        glow = offset_by_2_default_glow(default_glow_color, 0.5)
      },
      left_click_sound = "__core__/sound/gui-square-button.ogg",
      clicked_graphical_set =
      {
        base = {position = {363, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      selected_graphical_set =
      {
        base = {position = {363, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      selected_hovered_graphical_set = -- same as normal hovered currently
      {
        base = {position = {346, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5),
        glow = offset_by_2_default_glow(default_glow_color, 0.5)
      },
      size = 40,
      padding = 0
    },

    compact_slot_sized_button =
    {
      type = "button_style",
      parent = "slot_sized_button",
      size = 36
    },

    slot_sized_button_pressed =
    {
      type = "button_style",
      parent = "button",
      default_graphical_set =
      {
        base = {position = {363, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      disabled_graphical_set =
      {
        base = {position = {329, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      hovered_graphical_set =
      {
        base = {position = {363, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {363, 744}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      size = 40,
      padding = 0
    },

    slot_sized_button_blue =
    {
      type = "button_style",
      parent = "slot_sized_button",
      default_graphical_set =
      {
        base = {position = {312, 760}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      disabled_graphical_set =
      {
        base = {position = {329, 760}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      hovered_graphical_set =
      {
        base = {position = {346, 760}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5),
        glow = offset_by_2_default_glow({132, 177, 198, 127}, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {363, 760}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      }
    },

    slot_sized_button_red =
    {
      type = "button_style",
      parent = "slot_sized_button",
      default_graphical_set =
      {
        base = {position = {312, 776}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      disabled_graphical_set =
      {
        base = {position = {329, 776}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      hovered_graphical_set =
      {
        base = {position = {346, 776}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5),
        glow = offset_by_2_default_glow({236, 130, 130, 127}, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {363, 776}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      }
    },

    slot_sized_button_green =
    {
      type = "button_style",
      parent = "slot_sized_button",
      default_graphical_set =
      {
        base = {position = {312, 792}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      disabled_graphical_set =
      {
        base = {position = {329, 792}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      },
      hovered_graphical_set =
      {
        base = {position = {346, 792}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5),
        glow = offset_by_2_default_glow({110, 164, 104, 127}, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {363, 792}, corner_size = 8},
        shadow = offset_by_2_default_glow(default_dirt_color, 0.5)
      }
    },

    shortcut_bar_button =
    {
      type = "button_style",
      parent = "slot_sized_button",
      padding = 2,
      invert_colors_of_picture_when_disabled = true
    },

    shortcut_bar_button_blue =
    {
      type = "button_style",
      parent = "slot_sized_button_blue",
      padding = 2
    },

    shortcut_bar_button_red =
    {
      type = "button_style",
      parent = "slot_sized_button_red",
      padding = 2
    },

    shortcut_bar_button_green =
    {
      type = "button_style",
      parent = "slot_sized_button_green",
      padding = 2
    },

    shortcut_bar_button_small =
    {
      type = "button_style",
      parent = "slot_sized_button",
      size = 20,
      padding = 0,
      invert_colors_of_picture_when_disabled = true,
      left_click_sound = "__core__/sound/gui-button-mini.ogg"
    },

    shortcut_bar_button_small_green =
    {
      type = "button_style",
      parent = "slot_sized_button_green",
      size = 20,
      padding = 0,
      left_click_sound = "__core__/sound/gui-button-mini.ogg"
    },

    shortcut_bar_button_small_red =
    {
      type = "button_style",
      parent = "slot_sized_button_red",
      size = 20,
      padding = 0,
      left_click_sound = "__core__/sound/gui-button-mini.ogg"
    },

    shortcut_bar_button_small_blue =
    {
      type = "button_style",
      parent = "slot_sized_button_blue",
      size = 20,
      padding = 0,
      left_click_sound = "__core__/sound/gui-button-mini.ogg"
    },

    right_container_frame =
    {
      type = "frame_style",
      parent = "invisible_frame",
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        minimal_width = 10,
        vertical_spacing = 0
      },
      width = 8 + right_menu_width + 8
    },

    side_menu_frame =
    {
      type = "frame_style",
      parent = "inside_deep_frame",
      graphical_set =
      {
        base =
        {
          position = {17, 0}, corner_size = 8,
          center = {position = {42, 8}, size = {1, 1}},
          draw_type = "outer"
        }
      },
      background_graphical_set = deep_slot_background_tiling(40, 40),
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        parent = "packed_horizontal_flow"
      }
    },

    right_side_frame =
    {
      type = "frame_style",
      padding = 4,
      width = 8 + right_menu_width + 8,
      use_header_filler = false,
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 8
      }
    },

    achievement_frame =
    {
      type = "frame_style",
      parent = "frame",
      width = slot_table_width
    },

    completed_achievement_frame =
    {
      type = "frame_style",
      parent = "achievement_frame",
      graphical_set =
      {
        base = {position = {576, 17}, corner_size = 8},
        shadow = default_shadow
      }
    },

    failed_achievement_frame =
    {
      type = "frame_style",
      parent = "achievement_frame",
      graphical_set =
      {
        base = {position = {576, 0}, corner_size = 8},
        shadow = default_shadow
      }
    },

    achievement_notification_frame =
    {
      type = "frame_style",
      parent = "frame",
      padding = 0,
      width = 400,
      graphical_set = {}
    },

    tips_and_tricks_notification_frame =
    {
      type = "frame_style",
      parent = "frame",
      padding = 0,
      graphical_set = {}
    },

    tips_and_tricks_frame =
    {
      type = "frame_style",
      parent = "frame"
    },

    progressbar =
    {
      type = "progressbar_style",
      minimal_width = 10,
      natural_width = 200,
      bar_width = 8, -- thickness of the bar, not horizontal size
      color = {g=1},
      other_colors = {},
      side_text_padding = 8,
      bar_background =
      {
        base = {position = {296, 48}, corner_size = 8},
        shadow = default_dirt
      },
      bar = {position = {313, 48}, corner_size = 8},
      font = "default",
      font_color = {1, 1, 1},
      embed_text_in_bar = false
    },
    activity_bar =
    {
      type = "activity_bar_style",
      speed = 0.01, -- % of bar length per render frame
      minimal_width = 10,
      natural_width = 200,
      bar_width = 8, -- thickness of the bar, not horizontal size
      color = {g=1},
      bar_size_ratio = 0.07, -- length of the moving bar as % of total length
      bar = {position = {313, 48}, corner_size = 8},
      bar_background =
      {
        base = {position = {296, 48}, corner_size = 8},
        shadow = default_dirt
      }
    },
    production_progressbar =
    {
      type = "progressbar_style",
      filled_font_color = {0, 0, 0},
      horizontal_align = "right",
      color = {43, 227, 39},
      height = 24,
      bar_width = 24,
      embed_text_in_bar = true
    },
    heat_progressbar =
    {
      type = "progressbar_style",
      filled_font_color = {0, 0, 0},
      horizontal_align = "right",
      color = {218, 69, 53},
      height = 24,
      bar_width = 24,
      embed_text_in_bar = true
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
      bar_width = 13,
      color = {g=1},
      bar =
      {
        filename = "__core__/graphics/gui.png",
        position = {223, 0},
        size = {1, 11},
        scale = 1
      },
      bar_background =
      {
        filename = "__core__/graphics/gui.png",
        position = {224, 0},
        size = {1, 13},
        scale = 1
      }
    },

    thick_progressbar =
    {
      type = "progressbar_style",
      bar_width = 28,
      embed_text_in_bar = true,
      filled_font_color = {0, 0, 0},
      horizontal_align = "right"
    },

    achievement_progressbar =
    {
      type = "progressbar_style",
      parent = "thick_progressbar",
      bar_width = 24,
      left_margin = 4,
      right_margin = 4,
    },

    achievement_card_progressbar =
    {
      type = "progressbar_style",
      parent = "thick_progressbar",
      top_margin = 8
    },

    vehicle_health_progressbar =
    {
      type = "progressbar_style",
      parent = "health_progressbar",
      color = {0.8, 0.8, 0.8}
    },

    mining_progressbar =
    {
      type = "progressbar_style",
      parent = "health_progressbar",
      color = gui_color.orange
    },

    shield_progressbar =
    {
      type = "progressbar_style",
      parent = "health_progressbar",
      color = {0.8, 0.2, 0.8}
    },

    bonus_progressbar =
    {
      type = "progressbar_style",
      color = {0.8, 0.1, 0.8},
      height = 8,
      bar_width = 8,
    },

    rocket_weight_used_progress_bar =
    {
      type = "progressbar_style",
      filled_font_color = {0, 0, 0},
      height = 20,
      bar_width = 20,
      horizontal_align = "right",
      embed_text_in_bar = true,
    },

    battery_progressbar =
    {
      type = "progressbar_style",
      bar_width = 8,
      width = 12,
      right_margin = -2,
      left_margin = 1,
      padding = 2,
      height = 38,
      color = {g=1},
      other_colors =
      {
        {less_than = 0.33, color = {r = 1}},
        {less_than = 0.66, color = {1, 0.5, 0.25}},
        {less_than = 1, color = {g = 1}}
      },
      bar = {position = {415, 48}, corner_size = 8},
    },

    electric_satisfaction_progressbar =
    {
      type = "progressbar_style",
      filled_font_color = {0, 0, 0},
      horizontal_align = "right",
      color = {43, 227, 39},
      other_colors =
      {
        {less_than = 0.5, color = {218, 69, 53}},
        {less_than = 1, color = {219, 176, 22}}
      }
    },

    electric_satisfaction_statistics_progressbar =
    {
      type = "progressbar_style",
      parent = "electric_satisfaction_progressbar",
      height = 28,
      bar_width = 28,
      embed_text_in_bar = true,
      bar_background =
      {
        base =
        {
          top = {position = {304, 48}, width = 1, height = 8},
          center = {position = {304, 56}, size = 1}
        },
        shadow = default_dirt
      }
    },

    electric_statistics_progressbar =
    {
      type = "progressbar_style",
      parent = "electric_satisfaction_statistics_progressbar",
      other_colors = {}
    },

    electric_satisfaction_in_description_progressbar =
    {
      type = "progressbar_style",
      parent = "electric_satisfaction_progressbar",
      top_padding = 2, -- to compensate the text not looking centered
      height = 9
    },
    disk_usage_progressbar =
    {
      type = "progressbar_style",
      color = {218, 69, 53},
      other_colors =
      {
        {less_than = 0.8, color = {43, 227, 39}},
        {less_than = 0.9, color = {219, 176, 22}}
      }
    },

    item_spoilage_in_description_progress_bar =
    {
      type = "progressbar_style",
      filled_font_color = {0, 0, 0},
      horizontal_align = "left",
      minimal_width = 150,
      height = 24,
      bar_width = 24,
      color = {255, 255, 255},
      embed_text_in_bar = true
    },

    checkbox =
    {
      type = "checkbox_style",
      font = "default",
      font_color = gui_color.white,
      disabled_font_color = gui_color.white_with_alpha,
      default_graphical_set =
      {
        base = {position = {0, 132}, size = {28, 28}},
        shadow = default_dirt
      },
      hovered_graphical_set =
      {
        base = {position = {56, 132}, size = {28, 28}},
        glow = default_glow(default_glow_color, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {84, 132}, size = {28, 28}},
        glow = default_glow(default_glow_color, 0.5)
      },
      disabled_graphical_set =
      {
        base = {position = {28, 132}, size = {28, 28}},
        shadow = default_dirt
      },
      selected_graphical_set =
      {
        base = {position = {56, 132}, size = {28, 28}},
        shadow = default_dirt
      },
      selected_hovered_graphical_set =
      {
        base = {position = {56, 132}, size = {28, 28}},
        glow = default_glow(default_glow_color, 0.5)
      },
      selected_clicked_graphical_set =
      {
        base = {position = {84, 132}, size = {28, 28}},
        glow = default_glow(default_glow_color, 0.5)
      },
      left_click_sound = { filename = "__core__/sound/gui-checkbox-click.ogg" },
      checkmark = {position = {112, 132}, size = {28, 28}},
      disabled_checkmark = {position = {456, 188}, size = {28, 28}},
      intermediate_mark = {position = {456, 160}, size = {28, 28}},
      vertical_align = "center",
      text_padding = 8
    },
    caption_checkbox =
    {
      type = "checkbox_style",
      font = "default-bold",
      font_color = gui_color.caption
    },
    subheader_caption_checkbox =
    {
      type = "checkbox_style",
      parent = "caption_checkbox",
      left_margin = 8
    },
    black_checkbox =
    {
      type = "checkbox_style",
      font_color = {0, 0, 0}
    },
    caption_radiobutton =
    {
      type = "radiobutton_style",
      font = "default-bold",
      font_color = gui_color.caption
    },
    radiobutton =
    {
      type = "radiobutton_style",
      font = "default",
      font_color = gui_color.white,
      disabled_font_color = gui_color.white_with_alpha,
      default_graphical_set =
      {
        base = {position = {0, 160}, size = {24, 24}},
        shadow = radiobutton_glow(default_dirt_color, 0.5)
      },
      hovered_graphical_set =
      {
        base = {position = {24, 160}, size = {24, 24}},
        shadow = radiobutton_glow(default_glow_color, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {48, 160}, size = {24, 24}},
        shadow = radiobutton_glow(default_dirt_color, 0.5)
      },
      disabled_graphical_set =
      {
        base = {position = {96, 160}, size = {24, 24}},
        shadow = radiobutton_glow(default_dirt_color, 0.5)
      },
      selected_graphical_set =
      {
        base = {position = {72, 160}, size = {24, 24}},
        shadow = radiobutton_glow(default_dirt_color, 0.5)
      },
      selected_hovered_graphical_set =
      {
        base = {position = {24, 160}, size = {24, 24}},
        shadow = radiobutton_glow(default_glow_color, 0.5)
      },
      selected_clicked_graphical_set =
      {
        base = {position = {48, 160}, size = {24, 24}},
        shadow = radiobutton_glow(default_dirt_color, 0.5)
      },
      left_click_sound = "__core__/sound/gui-radio-button.ogg",
      text_padding = 8
    },
    horizontal_scrollbar =
    {
      type = "horizontal_scrollbar_style",
      height = 12,
      background_graphical_set = { position = {0, 72}, corner_size = 8},
      thumb_button_style =
      {
        type = "button_style",
        left_click_sound = {},
        height = 10,
        default_graphical_set =
        {
          base =
          {
            left = {position = {224, 48}, size = {8, 20}},
            center = {position = {232, 48}, size = {8, 20}},
            right = {position = {240, 48}, size = {8, 20}},
            center_tiling_horizontal = true
          },
          shadow = default_shadow
        },
        hovered_graphical_set =
        {
          base =
          {
            left = {position = {248, 48}, size = {8, 20}},
            center = {position = {256, 48}, size = {8, 20}},
            right = {position = {264, 48}, size = {8, 20}},
            center_tiling_horizontal = true
          },
          glow = default_glow(default_glow_color, 0.5)
        },
        clicked_graphical_set =
        {
          base =
          {
            left = {position = {272, 48}, size = {8, 20}},
            center = {position = {280, 48}, size = {8, 20}},
            right = {position = {288, 48}, size = {8, 20}},
            center_tiling_horizontal = true
          },
          shadow = default_shadow
        }
      }
    },
    vertical_scrollbar =
    {
      type = "vertical_scrollbar_style",
      width = 12,
      background_graphical_set = { position = {0, 72}, corner_size = 8},
      thumb_button_style =
      {
        type = "button_style",
        left_click_sound = {},
        width = 10,
        default_graphical_set =
        {
          base =
          {
            top = {position = {0, 48}, size = {20, 7}},
            center = {position = {0, 55}, size = {20, 8}},
            bottom = {position = {0, 63}, size = {20, 7}},
            center_tiling_vertical = true
          },
          shadow = default_shadow
        },
        hovered_graphical_set =
        {
          base =
          {
            top = {position = {20, 48}, size = {20, 7}},
            center = {position = {20, 55}, size = {20, 8}},
            bottom = {position = {20, 63}, size = {20, 7}},
            center_tiling_vertical = true
          },
          glow = default_glow(default_glow_color, 0.5)
        },
        clicked_graphical_set =
        {
          base =
          {
            top = {position = {40, 48}, size = {20, 7}},
            center = {position = {40, 55}, size = {20, 8}},
            bottom = {position = {40, 63}, size = {20, 7}},
            center_tiling_vertical = true
          },
          shadow = default_shadow
        }
      }
    },

    tab =
    {
      type = "tab_style",
      font = "default-bold",
      badge_font = "default-tiny-bold",
      default_font_color = button_default_font_color,
      selected_font_color = gui_color.caption,
      disabled_font_color = {1, 1, 1, 0.5},
      default_badge_font_color = {142, 142, 142},
      selected_badge_font_color = {64, 64, 64},
      disabled_badge_font_color = gui_color.white_with_alpha,
      badge_horizontal_spacing = 4, -- one module
      minimal_width = 84,
      horizontal_align = "center",
      vertical_align = "center",
      top_padding = 7,
      right_padding = 8,
      bottom_padding = 9,
      left_padding = 8,
      default_graphical_set =
      {
        base = {position = {102, 0}, corner_size = 8},
        shadow = tab_glow(default_shadow_color, 0.5)
      },
      selected_graphical_set =
      {
        base = {position = {136, 0}, corner_size = 8},
        shadow = tab_glow(default_shadow_color, 0.5)
      },
      hovered_graphical_set =
      {
        base = {position = {153, 0}, corner_size = 8},
        glow = tab_glow(default_glow_color, 0.5)
      },
      game_controller_selected_hovered_graphical_set =
      {
        base = {position = {136, 0}, corner_size = 8},
        glow = tab_glow(default_glow_color, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {170, 0}, corner_size = 8},
        shadow = tab_glow(default_shadow_color, 0.5)
      },
      disabled_graphical_set =
      {
        base = {position = {119, 0}, corner_size = 8},
        shadow = tab_glow(default_shadow_color, 0.5)
      },
      override_graphics_on_edges = false, -- used when tab container padding is 0, to connect to frame edges
      increase_height_when_selected = true,
      left_edge_selected_graphical_set = {},
      right_edge_selected_graphical_set = {},
      default_badge_graphical_set =
      {
        base = {position = {176, 72}, corner_size = 8}
      },
      selected_badge_graphical_set =
      {
        base = {position = {296, 71}, corner_size = 8}
      },
      hover_badge_graphical_set =
      {
        base = {position = {176, 72}, corner_size = 8}
      },
      press_badge_graphical_set =
      {
        base = {position = {296, 71}, corner_size = 8}
      },
      disabled_badge_graphical_set =
      {
        base = {position = {176, 72}, corner_size = 8}
      },
      left_click_sound = "__core__/sound/gui-tab.ogg"
    },

    slightly_smaller_tab =
    {
      type = "tab_style",
      minimal_width = 64
    },

    graph =
    {
      type = "graph_style",
      natural_width = 550, -- it resizes to 550 by default, but it can be squashed to be smaller
      height = 200,
      background_color = {r=0.05, g=0.05, b=0.05, a=0.9},
      line_colors =
      {
        {0, 109, 255},
        {255, 100, 0},
        {80, 178, 14},
        {204, 25, 40},
        {212, 158, 27},
        {232, 0, 213},
        {0, 159, 173},
        {133, 69, 40},
        {137, 0, 161},
        {83, 117, 59},
        {224, 127, 126},
        {142, 106, 169},
        {98, 172, 101},
        {73, 123, 155},
        {134, 129, 78},
        {133, 104, 49},
        {208, 104, 0},
        {145, 75, 75}
      },
      horizontal_label_style =
      {
        type = "label_style",
        parent = "label",
        font = "default-small",
        right_padding = 0,
        font_color = {100, 100, 100}
      },
      vertical_label_style =
      {
        type = "label_style",
        parent = "label",
        font = "default-small",
        right_padding = 4,
        left_padding = 0,
        font_color = {100, 100, 100}
      },
      minimal_horizontal_label_spacing = 25,
      minimal_vertical_label_spacing = 22,
      horizontal_labels_margin = 24,
      vertical_labels_margin = 36,
      graph_top_margin = 12,
      graph_right_margin = 12,
      -- how close do you need to hover a data line for it to be highlited and the tooltip to appear
      data_line_highlight_distance = 20,
      -- the size of the dot that shows the currently selected data point
      selection_dot_radius = 3,
      grid_lines_color = {0.15, 0.15, 0.15},
      guide_lines_color = {0.9, 0.9, 0.9},
      font = "default"
    },

    production_graph =
    {
      type = "graph_style",
      width = production_graph_width
    },

    research_info_tooltip_graph =
    {
      type = "graph_style",
      parent = "graph",
      line_colors = {gui_color.light_orange}
    },

    slider_button =
    {
      type = "button_style",
      width = 20,
      height = 12,
      padding = 0,
      default_graphical_set =
      {
        base = {position = {64, 48}, size = {40, 24}},
        shadow = default_shadow
      },
      hovered_graphical_set =
      {
        base = {position = {144, 48}, size = {40, 24}},
        glow = default_glow(default_glow_color, 0.5)
      },
      clicked_graphical_set =
      {
        base = {position = {184, 48}, size = {40, 24}},
        shadow = default_shadow
      },
      disabled_graphical_set =
      {
        base = {position = {104, 48}, size = {40, 24}},
        shadow = default_shadow
      },
      left_click_sound = "__core__/sound/gui-click.ogg"
    },

    -- for double slider
    left_slider_button =
    {
      type = "button_style",
      parent = "slider_button",
      default_graphical_set =
      {
        base = {position = {489, 0}, size = {40, 24}},
        shadow = left_slider_glow(default_shadow_color)
      },
      hovered_graphical_set =
      {
        base = {position = {489, 48}, size = {40, 24}},
        glow = left_slider_glow(default_glow_color)
      },
      clicked_graphical_set =
      {
        base = {position = {489, 72}, size = {40, 24}},
        shadow = left_slider_glow(default_shadow_color)
      },
      disabled_graphical_set =
      {
        base = {position = {489, 24}, size = {40, 24}},
        shadow = left_slider_glow(default_shadow_color)
      },
      left_click_sound = "__core__/sound/gui-slider.ogg"
    },

    right_slider_button =
    {
      type = "button_style",
      parent = "slider_button",
      default_graphical_set =
      {
        base = {position = {529, 0}, size = {40, 24}},
        shadow = right_slider_glow(default_shadow_color)
      },
      hovered_graphical_set =
      {
        base = {position = {529, 48}, size = {40, 24}},
        glow = right_slider_glow(default_glow_color)
      },
      clicked_graphical_set =
      {
        base = {position = {529, 72}, size = {40, 24}},
        shadow = right_slider_glow(default_shadow_color)
      },
      disabled_graphical_set =
      {
        base = {position = {529, 24}, size = {40, 24}},
        shadow = right_slider_glow(default_shadow_color)
      },
      left_click_sound = "__core__/sound/gui-slider.ogg"
    },

    slider =
    {
      type = "slider_style",
      minimal_width = 160,
      height = 12,
      ignored_by_search = true,
      full_bar =
      {
        base = {position = {73, 72}, corner_size = 8},
        shadow = default_dirt
      },
      full_bar_disabled =
      {
        base = {position = {90, 72}, corner_size = 8},
        shadow = default_dirt
      },
      empty_bar =
      {
        base =
        {
          left = {position = {56, 72}, size = {8, 8}},
          right = {position = {65, 72}, size = {8, 8}},
          center = {position = {64, 72}, size = {1, 8}}
        },
        shadow = default_dirt
      },
      empty_bar_disabled =
      {
        base =
        {
          left = {position = {56, 80}, size = {8, 8}},
          right = {position = {65, 80}, size = {8, 8}},
          center = {position = {65, 80}, size = {1, 8}}
        },
        shadow = default_dirt
      },
      draw_notches = false,
      notch =
      {
        base = {position = {138, 200}, size = {4, 16}},
        shadow =
        {
          position = {146, 192},
          size = {20, 32},
          draw_type = "outer",
          tint = default_dirt_color,
          top_outer_border_shift = -4,
          bottom_outer_border_shift = 4,
          left_outer_border_shift = -4,
          right_outer_border_shift = 4
        }
      },
      button =
      {
        type = "button_style",
        parent = "slider_button",
        width = 20,
        height = 12,
        padding = 0,
        default_graphical_set =
        {
          base = {position = {64, 48}, size = {40, 24}},
          shadow = default_shadow
        },
        hovered_graphical_set =
        {
          base = {position = {144, 48}, size = {40, 24}},
          glow = default_glow(default_glow_color, 0.5)
        },
        clicked_graphical_set =
        {
          base = {position = {184, 48}, size = {40, 24}},
          shadow = default_shadow
        },
        disabled_graphical_set =
        {
          base = {position = {104, 48}, size = {40, 24}},
          shadow = default_shadow
        },
        left_click_sound = "__core__/sound/gui-slider.ogg"
      }
    },

    notched_slider =
    {
      type = "slider_style",
      parent = "slider",
      height = 20,
      draw_notches = true,
      button =
      {
        type = "button_style",
        width = 12,
        height = 17,
        padding = 0,
        default_graphical_set =
        {
          base = {position = {0, 189}, size = {24, 35}},
          shadow = notched_slider_glow(default_shadow_color)
        },
        hovered_graphical_set =
        {
          base = {position = {48, 189}, size = {24, 35}},
          glow = notched_slider_glow(default_glow_color)
        },
        clicked_graphical_set =
        {
          base = {position = {72, 189}, size = {24, 35}},
          shadow = notched_slider_glow(default_shadow_color)
        },
        disabled_graphical_set =
        {
          base = {position = {24, 189}, size = {24, 35}},
          shadow = notched_slider_glow(default_shadow_color)
        },
        left_click_sound = "__core__/sound/gui-slider.ogg"
      }
    },

    double_slider =
    {
      type = "double_slider_style",
      button =
      {
        type = "button_style",
        parent = "left_slider_button"
      },
      high_button =
      {
        type = "button_style",
        parent = "right_slider_button"
      },
      minimal_width = 160,
      height = 12,
      full_bar =
      {
        base = {position = {73, 72}, corner_size = 8},
        shadow = default_dirt
      },
      full_bar_disabled =
      {
        base = {position = {90, 72}, corner_size = 8},
        shadow = default_dirt
      },
      empty_bar =
      {
        base =
        {
          left = {position = {56, 72}, size = {8, 8}},
          right = {position = {65, 72}, size = {8, 8}},
          center = {position = {64, 72}, size = {1, 8}}
        },
        shadow = default_dirt
      },
      empty_bar_disabled =
      {
        base =
        {
          left = {position = {56, 80}, size = {8, 8}},
          right = {position = {65, 80}, size = {8, 8}},
          center = {position = {65, 80}, size = {1, 8}}
        },
        shadow = default_dirt
      },
      draw_notches = false,
      notch =
      {
        base = {position = {138, 200}, size = {4, 16}},
        shadow =
        {
          position = {146, 192},
          size = {20, 32},
          draw_type = "outer",
          tint = default_dirt_color,
          top_outer_border_shift = -4,
          bottom_outer_border_shift = 4,
          left_outer_border_shift = -4,
          right_outer_border_shift = 4
        }
      }
    },

    notched_double_slider =
    {
      type = "double_slider_style",
      draw_notches = true,
      height = 20
    },

    red_slider =
    {
      type = "slider_style",
      full_bar =
      {
        base = {position = {240, 71}, corner_size = 8},
        shadow = default_dirt
      }
    },

    green_slider =
    {
      type = "slider_style",
      full_bar =
      {
        base = {position = {257, 71}, corner_size = 8},
        shadow = default_dirt
      }
    },

    blue_slider =
    {
      type = "slider_style",
      full_bar =
      {
        base = {position = {274, 71}, corner_size = 8},
        shadow = default_dirt
      }
    },

    map_generator_notched_slider =
    {
      type = "slider_style",
      parent = "notched_slider",
      -- table cells already have padding 4 (map_generator_frequency_table)
      top_margin = -4,
      bottom_margin = 4,
      width = 100
    },

    map_generator_13_notch_slider =
    {
      type = "slider_style",
      parent = "map_generator_notched_slider",
      width = 108
    },

    -- a slider with the same width as map_generator_13_notch_slider, so tables align proerly
    map_generator_notched_slider_wide =
    {
      type = "slider_style",
      parent = "map_generator_notched_slider",
      left_margin = 4,
      right_margin = 4
    },

    other_settings_slider =
    {
      type = "slider_style",
      parent = "slider",
      minimal_width = 250
    },

    scroll_pane =
    {
      type = "scroll_pane_style",
      vertically_squashable = "on",
      horizontally_squashable = "on",
      vertical_flow_style = { type = "vertical_flow_style" },
      horizontal_scrollbar_style = { type = "horizontal_scrollbar_style" },
      vertical_scrollbar_style = { type = "vertical_scrollbar_style" },
      graphical_set = outer_frame_light(),
      background_graphical_set = {},
      extra_padding_when_activated = 4
    },

    naked_scroll_pane =
    {
      type = "scroll_pane_style",
      extra_padding_when_activated = 0,
      graphical_set = {}
    },

    scroll_pane_in_shallow_frame =
    {
      type = "scroll_pane_style",
      graphical_set =
      {
        base = {position = {85, 0}, corner_size = 8, draw_type = "outer"},
        shadow = default_inner_shadow
      },
      dont_force_clipping_rect_for_contents = true
    },

    trains_widget_table =
    {
      type = "table_style",
      horizontal_spacing = 0,
      vertical_spacing = 0,
      column_widths = {minimal_width = 12 + train_gui_minimap_size + 12},
      wide_as_column_count = true,
      minimal_height = ((12 + train_gui_minimap_size + 12 + 28 + 12) * 2),
    },

    trains_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "deep_scroll_pane",
      vertically_stretchable = "stretch_and_expand",
      padding = 0,
      background_graphical_set = deep_slot_background_tiling(12 + train_gui_minimap_size + 12, 12 + train_gui_minimap_size + 12 + 28 + 12)
    },

    trains_scroll_pane_with_side_margin =
    {
      type = "scroll_pane_style",
      parent = "trains_scroll_pane",
      left_margin = 8,
      right_margin = 8,
      bottom_margin = 4
    },

    stations_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "deep_scroll_pane",
      padding = 0,
      vertically_stretchable = "stretch_and_expand",
      minimal_height = 12 + train_gui_minimap_size + 12,
      width = (12 + train_gui_minimap_size + 12) * 4,
      background_graphical_set = deep_slot_background_tiling(12 + train_gui_minimap_size + 12 + 12 + train_gui_minimap_size + 12, 12 + train_gui_minimap_size + 12)
    },

    stations_scroll_pane_small_screen =
    {
      type = "scroll_pane_style",
      parent = "stations_scroll_pane",
      width = (12 + train_gui_minimap_size + 12) * 2,
    },

    blurry_scroll_pane =
    {
      type = "scroll_pane_style",
      graphical_set =
      {
        base = {},
        shadow = default_inner_shadow
      },
      vertical_scrollbar_style =
      {
        type = "vertical_scrollbar_style",
        background_graphical_set = {position = {0, 72}, corner_size = 8, opacity = 0.7, blend_mode = "multiplicative-with-alpha"}
      },
      extra_padding_when_activated = -4,
      padding = 8
    },

    tab_scroll_pane =
    {
      type = "scroll_pane_style",
      graphical_set = inner_frame_tab_pane(),
      extra_left_margin_when_activated = 8,
      extra_right_margin_when_activated = -4
    },

    map_preview_scroll_pane = -- does not paint top edge
    {
      type = "scroll_pane_style",
      graphical_set =
      {
        base =
        {
          draw_type = "outer",
          right = {x=26, y=8, width=8, height=1},
          right_bottom = {x=26, y=9, width=8, height=8},
          bottom = {x=25, y=9, width=1, height=8},
          left_bottom = {x=17, y=9, width=8, height=8},
          left = {x=17, y=8, width=8, height=1},
          center = {x=25, y=8, width=1, height=1}
        }
      }
    },

    tab_shallow_scroll_pane =
    {
      type = "scroll_pane_style",
      top_margin = 0,
      bottom_margin = -4,
      padding = 12,
      top_padding = 0,
      extra_padding_when_activated = 0,
      extra_top_padding_when_activated = 12,
      extra_top_margin_when_activated = 4,
      extra_right_padding_when_activated = -12,
      graphical_set =
      {
        base =
        {
          draw_type = "outer",
          top = {x=93, y=0, width=1, height=8},
          center = {x=93, y=8, width=1, height=1}
        },
        shadow =
        {
          top = {position = {191, 128}, size = {1, 8}},
          center = {position = {191, 136}, size = {1, 1}},
          tint = hard_shadow_color,
          scale = 0.5,
          draw_type = "inner"
        }
      }
    },

    horizontally_limited_equipment_grid_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "deep_scroll_pane",
      maximal_width = slot_table_width
    },

    camera =
    {
      type = "camera_style",
      graphical_set = {}
    },

    minimap =
    {
      type = "minimap_style",
      minimal_height = 256,
      minimal_width = 256,
      graphical_set = {}
    },

    image =
    {
      type = "image_style",
      graphical_set = {},
      stretch_image_to_widget_size = false
    },

    small_text_image =
    {
      type = "image_style",
      stretch_image_to_widget_size = true,
      --Height of normal font text
      height = 20,
      width = 20
    },

    map_info_image =
    {
      type = "image_style",
      -- we only show shadow on the top, to solve the problem of it not being casted from the subheader panel above
      graphical_set =
      {
        shadow =
        {
          top =
          {
            position = {191, 128},
            size = {1, 8},
            tint = hard_shadow_color,
          }
        }
      }
    },

    new_game_subfooter =
    {
      type = "frame_style",
      minimal_height = 200,
      padding = 12,
      graphical_set =
      {
        base =
        {
          top = {position = {76, 0}, size = {1, 8}},
          center = {position = {76, 8}, size = {1, 1}},
          draw_type = "inner"
        },
        shadow = top_shadow
      },
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        horizontal_spacing = 16
      }
    },

    new_game_info_image =
    {
      type = "image_style",
      parent = "map_info_image",
      stretch_image_to_widget_size = true,
      natural_size = {1024, 576}
      --left_margin = -8,
      --right_margin = -8
    },

    tips_and_tricks_subfooter =
    {
      type = "frame_style",
      minimal_height = 180,
      padding = 16,
      graphical_set =
      {
        base =
        {
          position = {17, 0},
          corner_size = 8,
          center = {position = {76, 8}, size = {1, 1}},
          top = {},
          left_top = {},
          right_top = {},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 12
      },
    },

    text_holding_scroll_pane =
    {
      type = "scroll_pane_style",
      always_draw_borders = true,
      graphical_set =
      {
        base =
        {
          position = {85, 0},
          corner_size = 8,
          center = {position = {42, 8}, width = 1, height = 1},
          draw_type = "outer"
        },
        shadow = default_inner_shadow
      },
      left_padding = 4,
      right_padding = 4
    },

    tips_and_tricks_image =
    {
      type = "image_style",
      horizontally_stretchable = "on",
      horizontally_squashable = "on",
      stretch_image_to_widget_size = true,
      top_margin = -4,
      bottom_margin = -4
    },

    tips_and_tricks_simulation =
    {
      type = "empty_widget_style",
      horizontally_stretchable = "on",
      horizontally_squashable = "on",
      bottom_margin = -4
    },

    tabbed_pane_frame =
    {
      type = "frame_style",
      left_padding = 4,
      right_padding = 4,
      top_padding = 8,
      bottom_padding = 4,
      graphical_set = tabbed_pane_graphical_set
    },

    deep_frame_in_tabbed_pane =
    {
      --Adjust deep frame in shallow frame for the 'tabbed_pane_frame'.
      type = "frame_style",
      parent = "deep_frame_in_shallow_frame",
      padding = 0,
      left_margin = 12 - 4,
      right_margin = 12 - 4,
      top_margin = 8 - 8,
      bottom_margin = 8 - 4,
    },

    tips_and_tricks_info_frame =
    {
      type = "frame_style",
      parent = "inside_deep_frame",
      natural_size = {1408 , 704 + 36 + 180} -- image height + subheader height + subfooter height
    },

    tips_and_tricks_info_frame_small_screen =
    {
      type = "frame_style",
      parent = "tips_and_tricks_info_frame",
      natural_size = {904 , 452 + 36 + 180}
    },

    tabbed_pane =
    {
      type = "tabbed_pane_style",
      top_margin = 12,
      vertical_spacing = 0,
      padding = 0,
      tab_content_frame =
      {
        type = "frame_style",
        parent = "tabbed_pane_frame"
      },
      tab_container =
      {
        type = "table_style",
        left_padding = 12,
        right_padding = 12,
        horizontal_spacing = 0,
        vertical_spacing = 0
      }
    },

    tabbed_pane_with_extra_padding =
    {
      type = "tabbed_pane_style",
      tab_content_frame =
      {
        type = "frame_style",
        parent = "tabbed_pane_frame",
        left_padding = 12,
        right_padding = 12,
        bottom_padding = 8
      }
    },

    tabbed_pane_with_no_side_padding =
    {
      type = "tabbed_pane_style",
      tab_content_frame =
      {
        type = "frame_style",
        top_padding = 8,
        bottom_padding = 0,
        left_padding = 0,
        right_padding = 0,
        graphical_set =
        {
          base =
          {
            -- same as tabbed_pane_graphical_set - but without bottom
            top = {position = {76, 0}, size = {1, 8}},
            center = {position = {76, 8}, size = {1, 1}}
          },
          shadow = top_shadow
        }
      }
    },

    quick_panel_tabbed_pane =
    {
      type = "tabbed_pane_style",
      parent = "tabbed_pane",
      tab_content_frame =
      {
        type = "frame_style",
        parent = "tabbed_pane_frame",
        left_padding = 12,
        right_padding = 12,
        bottom_padding = 0
      }
    },

    -- tabs styled like a main frame - used in character gui
    -- shadows are a crazy composition: main window has all without top, left frame and right tabbed frame (=under the tabs) have top,
    -- tabs and frame fillers around the tabs (frame_tabbed_pane_corner, frame_tabbed_pane_frame_header) have the rest.
    frame_tabbed_pane =
    {
      type = "tabbed_pane_style",
      top_margin = 0,
      vertically_squashable = "on",
      tab_content_frame =
      {
        type = "frame_style",
        parent = "frame_without_left_side",
        vertically_squashable = "on",
        graphical_set =
        {
          base =
          {
            right_top = {position = {9, 0}, size = {8, 8}},
            right = {position = {9, 8}, size = {8, 1}},
            right_bottom = {position = {9, 9}, size = {8, 8}},
            top = {position = {8, 0}, size = {1, 8}},
            bottom = {position = {8, 9}, size = {1, 8}},
            center = {position = {8, 8}, size = {1, 1}}
          },
          shadow = top_shadow
        }
      },
      tab_container =
      {
        type = "table_style",
        horizontally_stretchable = "on",
        left_padding = 0,
        right_padding = 0,
        horizontal_spacing = 0,
        vertical_spacing = 0
      }
    },

    frame_tab =
    {
      type = "tab_style",
      parent = "tab",
      height = 32,
      top_padding = 6,
      bottom_padding = 6,
      selected_graphical_set =
      {
        base = {position = {448, 103}, corner_size = 8},
        shadow = tab_glow(default_shadow_color, 0.5)
      }
    },

    -- left top conrner for a tabs in character gui that connects to the inventory frame
    frame_tabbed_pane_corner =
    {
      type = "frame_style",
      width = 2*4,
      vertically_stretchable = "on",
      bottom_margin = -4,
      graphical_set =
      {
        base =
        {
          top = {position = {8, 0}, size = {1, 8}},
          right_top = {position = {9, 0}, size = {8, 8}},
          right = {position = {9, 8}, size = {8, 1}},
          right_bottom = {position = {17, 9}, size = {8, 8}},
          bottom = {position = {8, 8}, size = {1, 1}},
          center = {position = {8, 8}, size = {1, 1}}
        },
        shadow = top_right_shadow
      }
    },

    -- right top conrner for a tabs in character gui that contains the frame header filler and buttons
    frame_tabbed_pane_frame_header =
    {
      type = "frame_style",
      horizontally_stretchable = "on",
      vertically_stretchable = "on",
      bottom_margin = -4,
      left_padding = 0,
      bottom_padding = 4,
      graphical_set =
      {
        base =
        {
          left_top = {position = {0, 0}, size = {8, 8}},
          top = {position = {8, 0}, size = {1, 8}},
          right_top = {position = {9, 0}, size = {8, 8}},
          right = {position = {9, 8}, size = {8, 1}},
          right_bottom = {position = {9, 8}, size = {8, 1}},
          bottom = {position = {8, 8}, size = {1, 1}},
          left_bottom = {position = {26, 9}, size = {8, 8}},
          left = {position = {0, 8}, size = {8, 1}},
          center = {position = {8, 8}, size = {1, 1}}
        },
        shadow = top_left_shadow_with_top_corner
      },
      header_flow_style =
      {
        type = "horizontal_flow_style",
        horizontal_spacing = 8
      },
      header_filler_style =
      {
        type = "empty_widget_style",
        parent = "draggable_space_header",
        horizontally_stretchable = "on",
        height = 24,
        left_margin = 0,
      },
    },

    character_gui_left_side =
    {
      type = "frame_style",
      right_padding = 4,
      graphical_set =
      {
        base =
        {
          left_top = {position = {0, 0}, size = {8, 8}},
          left = {position = {0, 8}, size = {8, 1}},
          left_bottom = {position = {0, 9}, size = {8, 8}},
          top = {position = {8, 0}, size = {1, 8}},
          bottom = {position = {8, 9}, size = {1, 8}},
          center = {position = {8, 8}, size = {1, 1}}
        },
        shadow = top_shadow_with_left_corner
      }
    },

    -- character gui right side
    frame_without_left_side =
    {
      type = "frame_style",
      graphical_set =
      {
        base =
        {
          right_top = {position = {9, 0}, size = {8, 8}},
          right = {position = {9, 8}, size = {8, 1}},
          right_bottom = {position = {9, 9}, size = {8, 8}},
          top = {position = {8, 0}, size = {1, 8}},
          bottom = {position = {8, 9}, size = {1, 8}},
          center = {position = {8, 8}, size = {1, 1}}
        },
        shadow = shadow_without_left
      }
    },

    -- character gui right side
    frame_without_left_and_right_side =
    {
      type = "frame_style",
      right_padding = 4,
      graphical_set =
      {
        base =
        {
          top = {position = {8, 0}, size = {1, 8}},
          bottom = {position = {8, 9}, size = {1, 8}},
          center = {position = {8, 8}, size = {1, 1}}
        },
        shadow = shadow_without_left_and_right
      }
    },

    empty_widget =
    {
      type = "empty_widget_style",
      graphical_set = {},
      ignored_by_search = true
    },

    entity_button_base =
    {
      type = "empty_widget_style",
      size = {220, (28 * 3) + (4 * 2)}
    },

    undo_camera =
    {
      type = "empty_widget_style",
      natural_size = {1920/2, 1080/2}
    },

    tooltip_camera =
    {
      type = "empty_widget_style",
      natural_size = {512, 512},
      top_margin = 4,
      bottom_margin = 4
    },

    entity_variation_button =
    {
      type = "button_style",
      size = 100,
      left_padding = 2,
      right_padding = 5,
      top_padding = 2,
      bottom_padding = 5
    },

    tile_variation_button =
    {
      type = "button_style",
      size = 100,
      padding = 2
    },

    glow =
    {
      type = "glow_style",
      image_set = default_glow()
    },

    research_queue_active_glow_dark =
    {
      type = "glow_style",
      image_set =
      {
        glow =
        {
          position = {333, 17},
          corner_size = 8,
          draw_type = "outer"
        }
      }
    },

    research_queue_active_glow_light =
    {
      type = "glow_style",
      image_set =
      {
        glow =
        {
          position = {316, 17},
          corner_size = 8,
          draw_type = "outer"
        }
      }
    },

    research_queue_active_glow_outer =
    {
      type = "glow_style",
      image_set =
      {
        glow =
        {
          position = {200, 128},
          corner_size = 8,
          tint = {2, 255, 2},
          scale = 0.5,
          draw_type = "outer",
          top_outer_border_shift = -4,
          left_outer_border_shift = -4,
          right_outer_border_shift = 4,
          bottom_outer_border_shift = 4
        }
      }
    },

    draggable_space =
    {
      type = "empty_widget_style",
      graphical_set =
      {
        base =
        {
          top = {position = {192, 8}, size = {8, 7}},
          top_tiling = true,
          center = {position = {200, 8}, size = {8, 8}},
          center_tiling_horizontal = true,
          bottom = {position = {208, 8}, size = {8, 8}},
          bottom_tiling = true
        },
        shadow = default_glow(default_dirt_color_filler, 0.5)
      }
    },

    draggable_space_header =
    {
      type = "empty_widget_style",
      parent = "draggable_space",
      left_margin = 4
    },

    draggable_space_in_shortcut_list =
    {
      type = "empty_widget_style",
      parent = "draggable_space",
      width = 20
    },

    draggable_space_in_train_schedule =
    {
      type = "empty_widget_style",
      parent = "draggable_space",
      natural_width = 60,
      right_margin = -4,
      -- semi-hack redefining the graphical set to put shadow in to glow layer to be on top of the neighbour inset
      graphical_set =
      {
        base =
        {
          top = {position = {192, 8}, size = {8, 7}},
          top_tiling = true,
          center = {position = {200, 8}, size = {8, 8}},
          center_tiling_horizontal = true,
          bottom = {position = {208, 8}, size = {8, 8}},
          bottom_tiling = true
        },
        glow = default_glow(default_dirt_color_filler, 0.5)
      }
    },

    draggable_space_in_temporary_train_station =
    {
      type = "empty_widget_style",
      parent = "draggable_space_in_train_schedule",
      graphical_set =
      {
        base =
        {
          top = {position = {446, 78}, size = {8, 7}},
          top_tiling = true,
          center = {position = {454, 78}, size = {8, 8}},
          center_tiling_horizontal = true,
          bottom = {position = {462, 78}, size = {8, 8}},
          bottom_tiling = true
        },
        shadow = default_glow(default_dirt_color_filler, 0.5)
      }
    },

    fulfilled_draggable_space_in_train_schedule =
    {
      type = "empty_widget_style",
      parent = "draggable_space_in_train_schedule",
      graphical_set =
      {
        base =
        {
          top = {position = {412, 78}, size = {8, 7}},
          top_tiling = true,
          center = {position = {420, 78}, size = {8, 8}},
          center_tiling_horizontal = true,
          bottom = {position = {428, 78}, size = {8, 8}},
          bottom_tiling = true
        },
        glow = default_glow(default_dirt_color_filler, 0.5)
      }
    },

    train_schedule_fulfilled_delete_button =
    {
      type = "button_style",
      parent = "train_schedule_delete_button",
      invert_colors_of_picture_when_hovered_or_toggled = false,
      default_graphical_set =
      {
        base = {position = {412, 86}, corner_size = 8},
        shadow = {position = {429, 86}, corner_size = 8, draw_type = "outer"}
      }
    },

    train_schedule_temporary_station_delete_button =
    {
      type = "button_style",
      parent = "train_schedule_delete_button",
      invert_colors_of_picture_when_hovered_or_toggled = false,
      default_graphical_set =
      {
        base = {position = {446, 86}, corner_size = 8},
        shadow = {position = {463, 86}, corner_size = 8, draw_type = "outer"}
      }
    },

    graphics_settings_table =
    {
      type = "table_style",
      parent = "bordered_table",
      minimal_width = 364
    },

    slot_group_frame =
    {
      type = "frame_style",
      parent = "bordered_frame",
      left_padding = 0,
      top_padding = 2,
      bottom_padding = 2
    },

    inside_shallow_frame_packed =
    {
      type = "frame_style",
      parent = "inside_shallow_frame",
      padding = 0,
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        horizontal_spacing = 0
      },
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 0
      }
    },

    other_settings_gui_textbox =
    {
      type = "textbox_style",
      width = 120,
      horizontal_align = "center"
    },

    other_settings_gui_button =
    {
      type = "button_style",
      parent = "button",
      width = 120
    },

    packed_vertical_flow =
    {
      type = "vertical_flow_style",
      vertical_spacing = 0
    },

    padded_vertical_flow =
    {
      type = "vertical_flow_style",
      padding = 4
    },

    packed_horizontal_flow =
    {
      type = "horizontal_flow_style",
      horizontal_spacing = 0
    },

    compact_horizontal_flow =
    {
      type = "horizontal_flow_style",
      horizontal_spacing = 2
    },

    technology_card_frame =
    {
      type = "frame_style",
      graphical_set =
      {
        base = {position = {34, 0}, corner_size = 8},
        shadow = default_inner_shadow
      },
      padding = 0
    },

    research_progress_inner_frame_inactive =
    {
      type = "frame_style",
      graphical_set =
      {
        base = {position = {34, 0}, corner_size = 8}
      }
    },

    research_progress_inner_frame_active =
    {
      type = "frame_style",
      graphical_set =
      {
        base = {position = {68, 0}, corner_size = 8}
      }
    },

    dark_button =
    {
      type = "button_style",
      default_graphical_set =
      {
        base = {position = {68, 0}, corner_size = 8},
        shadow = {position = {395, 86}, corner_size = 8, draw_type = "outer"}
      }
    },

    squashable_label =
    {
      type = "label_style",
      horizontally_squashable = "on"
    },

    black_label =
    {
      type = "label_style",
      font_color = {0, 0, 0}
    },

    black_squashable_label =
    {
      type = "label_style",
      parent = "black_label",
      horizontally_squashable = "on"
    },

    black_label_with_left_padding =
    {
      type = "label_style",
      font_color = {0, 0, 0},
      left_padding = 4
    },

    black_squashable_label_with_left_padding =
    {
      type = "label_style",
      parent = "black_label_with_left_padding",
      horizontally_squashable = "on"
    },

    label_with_left_padding =
    {
      type = "label_style",
      left_padding = 4
    },

    squashable_label_with_left_padding =
    {
      type = "label_style",
      parent = "label_with_left_padding",
      horizontally_squashable = "on"
    },

    color_picker_label =
    {
      type = "label_style",
      maximal_width = 24
    },

    train_schedule_delete_button =
    {
      type = "button_style",
      parent = "dark_button",
      padding = 0,
      width = 16,
      --size = {16, 28},
      invert_colors_of_picture_when_hovered_or_toggled = true,
      left_click_sound = "__core__/sound/gui-tool-button.ogg"
    },

    train_schedule_collapse_button =
    {
      type = "button_style",
      parent = "train_schedule_delete_button",
      size = 28
    },

    mod_thumbnail_image =
    {
      type = "image_style",
      graphical_set =
      {
        base = {position = {85, 0}, corner_size = 8, draw_type = "outer"},
        shadow = default_inner_shadow
      },
      size = 144,
      stretch_image_to_widget_size = true
    },

    mod_explore_thumbnail_image =
    {
      type = "image_style",
      graphical_set =
      {
        base = {position = {76, 8}, size = {1, 1}},
        shadow = default_glow(hard_shadow_color),
      },
      size = 72,
      stretch_image_to_widget_size = true
    },

    mod_attribute_image =
    {
      type = "image_style",
      size = 16,
      left_margin = 8,
      stretch_image_to_widget_size = true,
      invert_colors_of_picture_when_hovered_or_toggled = true
    },

    achievement_warning_image =
    {
      type = "image_style",
      width = 28,
      left_padding = 2,
      right_padding = 2,
      height = 24,
      stretch_image_to_widget_size = true
    },

    mod_updates_status_image =
    {
      type = "image_style",
      size = {16, 16},
      stretch_image_to_widget_size = true
    },

    install_mod_status_image =
    {
      type = "image_style",
      size = {16, 16},
      stretch_image_to_widget_size = true,
      invert_colors_of_picture_when_hovered_or_toggled = true
    },

    train_schedule_condition_time_selection_button =
    {
      type = "button_style",
      width = 84,
      left_click_sound = "__core__/sound/gui-menu-small.ogg"
    },

    shortcut_bar_expand_button =
    {
      type = "button_style",
      parent = "frame_button",
      width = 8,
      height = 16,
      left_click_sound = "__core__/sound/gui-shortcut-expand.ogg",
      left_padding = -2,
      right_padding = -2,
      invert_colors_of_picture_when_hovered_or_toggled = true,
      selected_graphical_set =
      {
        base = {position = {272, 169}, corner_size = 8},
        shadow = {position = {440, 24}, corner_size = 8, draw_type = "outer"}
      },
      selected_hovered_graphical_set =
      {
        base = {position = {369, 17}, corner_size = 8},
        shadow = {position = {440, 24}, corner_size = 8, draw_type = "outer"}
      }
    },

    shortcut_selection_row =
    {
      type = "frame_style",
      graphical_set = {position = {208, 17}, corner_size = 8},
      use_header_filler = false,
      padding = 0,
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        vertical_align = "center"
      }
    },

    info_label =
    {
      type = "label_style",
      font = "default",
      font_color = {128, 206, 240},
      single_line = false
    },

    --style to use on all input shortcuts
    control_input_shortcut_label =
    {
      type = "label_style",
      font = "default-semibold",
      font_color = {128, 206, 240}
    },

    bonus_card_frame =
    {
      type = "frame_style",
      padding = 4,
      minimal_width = 192,
      minimal_height = 112,
      graphical_set =
      {
        base = {position = {68, 0}, corner_size = 8},
        shadow = default_shadow
      },
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        parent = "two_module_spacing_vertical_flow"
      }
    },

    empty_bonus_card_frame =
    {
      type = "frame_style",
      parent = "bonus_card_frame",
      graphical_set =
      {
        base = {position = {282, 17}, corner_size = 8}
      }
    },

    label_under_widget =
    {
      type = "label_style",
      height = 40,
      single_line = false,
      top_margin = -4,
      bottom_margin = 4
    },

    subheader_frame_with_text_on_the_right =
    {
      type = "frame_style",
      parent = "subheader_frame",
      right_padding = 12
    },

    main_progressbar_frame =
    {
      type = "frame_style",
      use_header_filler = false,
      width = 400
    },

    wide_activity_bar =
    {
      type = "activity_bar_style",
      bar_width = 24
    },

    entity_frame_filler =
    {
      type = "empty_widget_style",
      top_margin = -8,
      graphical_set =
      {
        position = {256, 136},
        corner_size = 16,
        overall_tiling_vertical_size = 24,
        overall_tiling_vertical_spacing = 16,
        overall_tiling_vertical_padding = 8
      },
      horizontally_stretchable = "on",
      vertically_stretchable = "on"
    },

    splitter_settings_table =
    {
      type = "table_style",
      parent = "bordered_table",
      vertical_spacing = 20,
      horizontal_spacing = 16,
      cell_padding = 0
    },

    entity_button_frame =
    {
      type = "frame_style",
      parent = "deep_frame_in_shallow_frame",
      height = entity_button_height,
      width = entity_button_width
    },

    train_with_minimap_frame =
    {
      type = "frame_style",
      padding = 8,
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        vertical_spacing = 12
      },
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        horizontal_spacing = 12
      },
      graphical_set =
      {
        base = {position = {68, 0}, corner_size = 8},
        shadow = default_shadow,
      },
    },

    choose_chat_icon_button =
    {
      type = "button_style",
      size = 28,
      padding = 4,
      right_margin = -6,
      top_margin = -3,
      default_graphical_set = {},
      hovered_graphical_set =
      {
        base =
        {
          left_top = {position = {34, 17}, size = 8},
          left = {position = {34, 25}, size = {8, 1}},
          left_bottom = {position = {34, 26}, size = 8},
          center = {position = {42, 25}, size = 1},
          top = {position = {42, 17}, size = {1, 8}},
          bottom = {position = {42, 26}, size = {1, 8}},
          right_top = {position = {384, 48}, size = 8},
          right = {position = {384, 56}, size = {8, 1}},
          right_bottom = {position = {384, 57}, size = {8, 8}}
        }
      },
      clicked_graphical_set =
      {
        left_top = {position = {51, 17}, size = 8},
        left = {position = {51, 25}, size = {8, 1}},
        left_bottom = {position = {51, 26}, size = 8},
        center = {position = {59, 25}, size = 1},
        top = {position = {59, 17}, size = {1, 8}},
        bottom = {position = {59, 26}, size = {1, 8}},
        right_top = {position = {392, 48}, size = 8},
        right = {position = {392, 56}, size = {8, 1}},
        right_bottom = {position = {392, 57}, size = {8, 8}}
      }
    },

    choose_chat_icon_in_textbox_button =
    {
      type = "button_style",
      size = 28,
      padding = 4,
      right_margin = -6,
      bottom_margin = -4,
      invert_colors_of_picture_when_hovered_or_toggled = true,
      default_graphical_set = {},
      hovered_graphical_set =
      {
        base =
        {
          left_top = {position = {34, 17}, size = 8},
          left = {position = {34, 25}, size = {8, 1}},
          left_bottom = {position = {34, 26}, size = 8},
          center = {position = {42, 25}, size = 1},
          top = {position = {42, 17}, size = {1, 8}},
          bottom = {position = {42, 26}, size = {1, 8}},
          right_top = {position = {43, 17}, size = 8},
          right = {position = {384, 56}, size = {8, 1}},
          right_bottom = {position = {384, 57}, size = {8, 8}}
        }
      },
      clicked_graphical_set =
      {
        left_top = {position = {51, 17}, size = 8},
        left = {position = {51, 25}, size = {8, 1}},
        left_bottom = {position = {51, 26}, size = 8},
        center = {position = {59, 25}, size = 1},
        top = {position = {59, 17}, size = {1, 8}},
        bottom = {position = {59, 26}, size = {1, 8}},
        right_top = {position = {60, 17}, size = 8},
        right = {position = {392, 56}, size = {8, 1}},
        right_bottom = {position = {392, 57}, size = {8, 8}}
      }
    },

    lab_technology_frame =
    {
      type = "frame_style",
      parent = "shallow_frame_in_shallow_frame",
      left_padding = 12,
      top_margin = 4,
      bottom_margin = 4,
      vertically_stretchable = "off",
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        vertical_align = "center",
        horizontal_spacing = 12
      }
    },

    lab_technology_frame_empty =
    {
      type = "frame_style",
      parent = "deep_frame_in_shallow_frame",
      left_padding = 12,
      top_margin = 4,
      bottom_margin = 4,
      vertically_stretchable = "off",
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        vertical_align = "center",
        horizontal_spacing = 12
      }
    },

    lab_progress_and_slot_divider =
    {
      type = "line_style",
      left_margin = -4,
      right_margin = -12,
      top_margin = -4,
      bottom_margin = -4,
      border =
      {
        border_width = 8,
        vertical_line = {position = {77, 8}, size = {8, 1}},
        top_end = {position = {77, 0}, size = 8},
        bottom_end = {position = {77, 9}, size = 8}
      }
    },

    lab_progress_and_slot_divider_empty =
    {
      type = "line_style",
      parent = "lab_progress_and_slot_divider",
      border =
      {
        border_width = 8,
        vertical_line = {position = {42, 8}, size = {8, 1}},
        top_end = {position = {42, 0}, size = 8},
        bottom_end = {position = {42, 9}, size = 8}
      }
    },

    factoriopedia_contents_scroll_pane =
    {
      parent = "entity_frame_scroll_pane",
      type = "scroll_pane_style",
      width = 434,
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        width = slot_table_width,
        parent = "two_module_spacing_vertical_flow"
      }
    },

    decider_combinator_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "deep_scroll_pane",
      vertically_stretchable = "stretch_and_expand",
      scrollbars_go_outside = false,
      width = 400 + 12,
      padding = 4,
      minimal_height = 4 + 48 + 4 + 36 + 4,
      vertical_flow_style =
      {
        type = "vertical_flow_style",
        horizontal_align = "right"
      }
    },

    decider_combinator_conditions_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "decider_combinator_scroll_pane",
      background_graphical_set = deep_slot_background_tiling(nil, 48, {16, 60, 286}, nil, nil, 4)
    },

    decider_combinator_outputs_scroll_pane =
    {
      type = "scroll_pane_style",
      parent = "decider_combinator_scroll_pane",
      background_graphical_set = deep_slot_background_tiling(nil, 48, nil, nil, nil, 4)
    },

    decider_combinator_frame =
    {
      type = "frame_style",
      parent = "shallow_frame",
      padding = 0,
      height = 48,
      horizontal_flow_style =
      {
        type = "horizontal_flow_style",
        parent = "player_input_horizontal_flow"
      }
    },

    decider_combinator_condition_frame =
    {
      type = "frame_style",
      parent = "decider_combinator_frame",
      width = 292
    },

    decider_combinator_fulfilled_condition_frame =
    {
      type = "frame_style",
      parent = "decider_combinator_condition_frame",
      graphical_set =
      {
        base = {position = {412, 86}, corner_size = 8},
        shadow = default_shadow
      }
    },

    decider_combinator_signal_select_button =
    {
      type = "button_style",
      parent = "slot_button_in_shallow_frame",
      default_graphical_set =
      {
        base = {border = 4, position = {2, 738}, size = 76},
        shadow =
        {
          position = {378, 103},
          corner_size = 16,
          top_outer_border_shift = 4,
          bottom_outer_border_shift = -4,
          left_outer_border_shift = 4,
          right_outer_border_shift = -4,
          draw_type = "outer"
        }
      },
      hovered_graphical_set =
      {
        base = {border = 4, position = {82, 738}, size = 76},
        shadow =
        {
          position = {378, 103},
          corner_size = 16,
          top_outer_border_shift = 4,
          bottom_outer_border_shift = -4,
          left_outer_border_shift = 4,
          right_outer_border_shift = -4,
          draw_type = "outer"
        },
        glow = offset_by_2_rounded_corners_glow(default_glow_color)
      },
      clicked_graphical_set =
      {
        base = {border = 4, position = {162, 736}, size = 76},
        shadow =
        {
          position = {378, 103},
          corner_size = 16,
          top_outer_border_shift = 4,
          bottom_outer_border_shift = -4,
          left_outer_border_shift = 4,
          right_outer_border_shift = -4,
          draw_type = "outer"
        }
      }
    },

    decider_combinator_fulfilled_signal_select_button =
    {
      type = "button_style",
      parent = "slot_button_in_shallow_frame",
      default_graphical_set =
      {
        base = {border = 4, position = {2, 738}, size = 76},
        shadow =
        {
          position = {412, 103},
          corner_size = 16,
          top_outer_border_shift = 4,
          bottom_outer_border_shift = -4,
          left_outer_border_shift = 4,
          right_outer_border_shift = -4,
          draw_type = "outer"
        }
      },
      hovered_graphical_set =
      {
        base = {border = 4, position = {82, 738}, size = 76},
        shadow =
        {
          position = {412, 103},
          corner_size = 16,
          top_outer_border_shift = 4,
          bottom_outer_border_shift = -4,
          left_outer_border_shift = 4,
          right_outer_border_shift = -4,
          draw_type = "outer"
        },
        glow = offset_by_2_rounded_corners_glow(default_glow_color)
      },
      clicked_graphical_set =
      {
        base = {border = 4, position = {162, 736}, size = 76},
        shadow =
        {
          position = {412, 103},
          corner_size = 16,
          top_outer_border_shift = 4,
          bottom_outer_border_shift = -4,
          left_outer_border_shift = 4,
          right_outer_border_shift = -4,
          draw_type = "outer"
        }
      }
    }
  }
})

local get_tree_view_tile = function(name, x, y, width, height)
  if width == nil then width = 48 end
  if height == nil then height = 48 end

  return
  {
      type = "sprite",
      name = name,
      filename = "__base__/graphics/tree_view_tileset.png",
      priority = "extra-high",
      x = x,
      y = y,
      width = width,
      height = height,
      flags = {"no-crop", "trilinear-filtering"},
      scale = 0.5
  }
end

data:extend(
  {
    --normal tileset (top row)
    get_tree_view_tile("tree_view_tileset-square_l_d-normal", 5, 5),
    get_tree_view_tile("tree_view_tileset-square_l-normal", 58, 5),
    get_tree_view_tile("tree_view_tileset-square_d-normal", 111, 5),
    get_tree_view_tile("tree_view_tileset-square_no_lines-normal", 164, 5),

    -- yellow tileset (3rd row)
    get_tree_view_tile("tree_view_tileset-square_l_d-yellow", 5, 111),
    get_tree_view_tile("tree_view_tileset-square_l-yellow", 58, 111),
    get_tree_view_tile("tree_view_tileset-square_d-yellow", 111, 111),
    get_tree_view_tile("tree_view_tileset-square_no_lines-yellow", 164, 111),

    -- green tileset (bottom row)
    get_tree_view_tile("tree_view_tileset-square_l_d-green", 5, 169),
    get_tree_view_tile("tree_view_tileset-square_l-green", 58, 169),
    get_tree_view_tile("tree_view_tileset-square_d-green", 111, 169),
    get_tree_view_tile("tree_view_tileset-square_no_lines-green", 164, 169),

    -- lines tileset (second row)
    get_tree_view_tile("tree_view_tileset-empty", 5, 58),
    get_tree_view_tile("tree_view_tileset-u_d_r_line", 58, 58),
    get_tree_view_tile("tree_view_tileset-u_r_line", 111, 58),
    get_tree_view_tile("tree_view_tileset-vertical_line", 164, 58),
    get_tree_view_tile("quest_gui_empty_status", 5, 58),

    -- must be 1px tall to look good with trilinear filtering
    get_tree_view_tile("tree_view_tileset-stretchy_bit", 164, 58, 48, 1),

    {
      type = "sprite",
      name = "coal-dark-background",
      filename = "__base__/graphics/icons/mip/coal-dark-background.png",
      width = 64,
      height = 64,
      scale = 0.5
    }
  }
)
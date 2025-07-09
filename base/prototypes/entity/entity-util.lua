local math2d = require("math2d")
local util = require("util")

local sqrt2 = 1.4142135623730951
local default_crater_radius = 3.5

-- only rotates by 45°, but that is all that is necessary.
-- size is the circumscribed square length, intersect is where along the square's edge the diagonal bounding box should touch.
local function rotbb(x, y, size, intersect)
  local dist = size / 2 * sqrt2
  local y_ratio = intersect / size
  local x_ratio = 1 - y_ratio
  local x_dist = x_ratio * dist
  local y_dist = y_ratio * dist
  local cx = x + size / 2
  local cy = y + size / 2
  return {{cx - x_dist, cy - y_dist}, {cx + x_dist, cy + y_dist}, 1/8}
end

local function scale_bounding_box(bb, scale)
  local orientation = bb[3] or 0
  return
  {
    {scale*bb[1][1], scale*bb[1][2]},
    {scale*bb[2][1], scale*bb[2][2]},
    orientation
  }
end

local function cliff_sprite_variations(sprite_params, name, column_offset, row_offset, variation_count, is_lower)
  local sprite_size_multiplier = sprite_params.sprite_size_multiplier or 1
  local frame_width = 256 * sprite_size_multiplier
  local shadow_frame_width = name == "entrance" and (256 * sprite_size_multiplier) or (320 * sprite_size_multiplier)
  local shadow_shift = name == "entrance" and {0, 0} or {0.5, 0}
  local frame_height = 256 * sprite_size_multiplier
  local cliff_suffix = (sprite_params.suffix and (sprite_params.suffix .. "-") or "")
  local subfolder = (sprite_params.subfolder and (sprite_params.subfolder .. "/") or "")
  local filepath = sprite_params.mod_name .. "/graphics/terrain/cliffs/" .. subfolder .. "cliff-" .. cliff_suffix .. name
  local pictures = {}
  for i=0,(variation_count-1) do
    table.insert(pictures,
    {
      layers =
      {
        {
          filename = filepath .. (is_lower and "-lower.png" or ".png"),
          width = frame_width,
          height = frame_height,
          x = (column_offset + i) * frame_width,
          y = row_offset * frame_height,
          scale = sprite_params.scale * 0.5
        },
        ((not is_lower) and
        {
          filename = filepath .. "-shadow.png",
          width = shadow_frame_width,
          height = frame_height,
          x = (column_offset + i) * shadow_frame_width,
          y = row_offset * frame_height,
          draw_as_shadow = true,
          scale = sprite_params.scale * 0.5,
          shift = shadow_shift
        }
        or nil)
      }
    })
  end
  return pictures
end

local function cliff_orientation(sprite_params, name, column_offset, row_offset, variation_count, collision_bounding_box)
  local result =
  {
    pictures = cliff_sprite_variations(sprite_params, name, column_offset, row_offset, variation_count, false),
    collision_bounding_box = scale_bounding_box(collision_bounding_box, sprite_params.scale),
  }

  if sprite_params.has_lower_layer then
    result.pictures_lower = cliff_sprite_variations(sprite_params, name, column_offset, row_offset, variation_count, true)
  end

  return result
end

function create_cliff_data_specification(sprite_params, args)
  local svc = args.variation_count or 8 -- side variation count
  local evc = args.entrance_variation_count or 2
  return
  {
    north_to_south = cliff_orientation(sprite_params, "sides"   , 0, 3, svc, {{-1.0, -2.0}, {1.0,  2.0}}),
    west_to_east   = cliff_orientation(sprite_params, "sides"   , 0, 2, svc, {{-2.0, -1.5}, {2.0,  1.5}}),
    east_to_west   = cliff_orientation(sprite_params, "sides"   , 0, 0, svc, {{-2.0, -0.5}, {2.0,  0.5}}),
    south_to_north = cliff_orientation(sprite_params, "sides"   , 0, 1, svc, {{-1.0, -2.0}, {1.0,  2.0}}),
    west_to_north  = cliff_orientation(sprite_params, "outer"   , 0, 3, svc, rotbb(-3.5, -3, 4.5, 3)),
    north_to_east  = cliff_orientation(sprite_params, "outer"   , 0, 0, svc, rotbb(-1, -3, 4.5, 1.5)),
    east_to_south  = cliff_orientation(sprite_params, "outer"   , 0, 1, svc, rotbb(-1, -0.5, 3.5, 2.5)),
    south_to_west  = cliff_orientation(sprite_params, "outer"   , 0, 2, svc, rotbb(-2.5, -0.5, 3.5, 1)),
    west_to_south  = cliff_orientation(sprite_params, "inner"   , 0, 0, svc, rotbb(-3.5, -1.5, 4.5, 1.5)),
    north_to_west  = cliff_orientation(sprite_params, "inner"   , 0, 1, svc, rotbb(-2.5, -3, 3.5, 2.5)),
    east_to_north  = cliff_orientation(sprite_params, "inner"   , 0, 2, svc, rotbb(-1, -3, 3.5, 1)),
    south_to_east  = cliff_orientation(sprite_params, "inner"   , 0, 3, svc, rotbb(-1, -1.5, 4.5, 3)),
    west_to_none   = cliff_orientation(sprite_params, "entrance", 2, 0, evc, rotbb(-3, -1.5, 3, 2)),
    none_to_east   = cliff_orientation(sprite_params, "entrance", 0, 0, evc, rotbb(0, -1.5, 3, 1)),
    east_to_none   = cliff_orientation(sprite_params, "entrance", 2, 2, evc, rotbb(0, -0.5, 2.5, 2)),
    none_to_west   = cliff_orientation(sprite_params, "entrance", 0, 2, evc, rotbb(-2.5, -0.5, 2.51, 0.5)),
    north_to_none  = cliff_orientation(sprite_params, "entrance", 2, 3, evc, rotbb(-1, -2.5, 3, 1)),
    none_to_south  = cliff_orientation(sprite_params, "entrance", 0, 3, evc, rotbb(-1, -0.5, 3, 2.5)),
    south_to_none  = cliff_orientation(sprite_params, "entrance", 2, 1, evc, rotbb(-2, -0.5, 3, 0.5)),
    none_to_north  = cliff_orientation(sprite_params, "entrance", 0, 1, evc, rotbb(-2, -2.5, 3, 2)),
  }
end

local function crater_orientation(sprite_params, name, column_offset, row_offset, variation_count, radius, thickness, piece, orientation_offset)
  -- https://www.omnicalculator.com/math/octagon
  local function pie_bb(inradius, thickness, orientation)
    local projected_vector = math2d.vector.from_orientation(orientation)
    projected_vector.x = projected_vector.x * math2d.projection_constant
    local height = 0.7
    local height2 = 1.1
    local height3 = 0.9
    local width = 1.4
    local width_2 = 1.4
    local width_3 = 1.25
    local sq = 1.4142135623730950488
    local diag = 0.5

    -- ["Orientation"] = {Width, Height,x offset, y offset}
--[[    local variant_parameters = {
      ["N"]={1.2,0.75,0,.66},
      ["NE"]={1,0.6,-0.53,0.53},
      ["E"]={1.2,0.75,0,0.2},
      ["SE"]={1.05,0.6,-0.66-.2,0.33+.2},
      ["S"]={1.2,0.75,0,.66},
      ["SW"]={1.05,0.6,0.66+.2,0.33+.2},
      ["W"]={1.2,0.75,0,0.2},
      ["NW"]={1,0.6,0.6,0.6 },
    }]]
    variant_parameters = {
      ["N"]={width,height,0,0.7*(height)},
      ["S"]={width,height,0,0.7*(height)},

      ["E"]={width_2,height2,-.10,-0.307},
      ["W"]={width_2,height2,.10,0.806},



      ["NE"]={width,height3,diag/2,diag/2},
      ["SE"]={1.3,0.9,-0.1,0.1},

      ["SW"]={width,height3,0,0},
      ["NW"]={width,height3,diag/2,diag/2},
    }




    local width_multiplier = variant_parameters[name][1]
    local height_multiplier = variant_parameters[name][2]
    local x_offset = variant_parameters[name][3]
    local y_offset = -variant_parameters[name][4]

    local temporaryheight = thickness * 0.5
    local halfheight = thickness * 0.5 * height_multiplier

    local halfwidth = 0.4142135623730950488 * (inradius + temporaryheight) * math2d.vector.length(projected_vector) * width_multiplier

    return {{x_offset - halfwidth, y_offset - halfheight}, {x_offset + halfwidth, y_offset + halfheight}, math2d.vector.to_orientation(projected_vector)}
  end

  local collision_bounding_box = pie_bb(radius, thickness, piece / 8 + orientation_offset)
  local shift = math2d.vector.projected(math2d.vector.from_orientation(piece / 8 + orientation_offset, -radius))
  shift = { shift.x , shift.y } -- need array for util.sprite_load

  -- local prefix = (sprite_params.prefix and (sprite_params.prefix .. "-") or "")
  -- local suffix = (sprite_params.suffix and (sprite_params.suffix .. "-") or "")
  local subfolder = (sprite_params.subfolder and (sprite_params.subfolder .. "/") or "")
  local filepath = sprite_params.mod_name .. "/graphics/terrain/craters/" .. subfolder .. (sprite_params.prefix or "")
  local filepath_shadow = filepath .. "-shadow"
  local filepath_lower = filepath .. "-lower"

  filepath        = filepath        .. "-upper-" .. name
  filepath_shadow = filepath_shadow .. "-" .. name
  filepath_lower  = filepath_lower  .. "-" .. name

  local result =
  {
    pictures =
    {
      layers =
      {
        util.sprite_load(filepath, { variation_count = variation_count, scale = sprite_params.scale * 0.5, shift = shift, multiply_shift = 0.5 }),
        util.sprite_load(filepath_shadow, { variation_count = variation_count, scale = sprite_params.scale * 0.5, shift = shift, multiply_shift = 0.5, draw_as_shadow = true })
      }
    },

    collision_bounding_box = scale_bounding_box(collision_bounding_box, sprite_params.scale),
    render_layer = "object"
  }

  if sprite_params.has_lower_layer then
    result.pictures_lower = util.sprite_load(filepath_lower, { variation_count = variation_count, scale = sprite_params.scale * 0.5, shift = shift, multiply_shift = 0.5 })
  end

  return result
end

function create_crater_data_specification(sprite_params, args)
  local radius = args.crater_radius or default_crater_radius
  local thickness = args.crater_edge_thickness or 2
  local orientation_offset = args.crater_segment_orientation_offset or 0

  local dummy = crater_orientation(sprite_params, "N", 0, 3, 1, radius, thickness, 7, 0)
  return
  {
    -- Since removing a cliff also causes neighboring cliffs to be removed,
    -- we'll think of it (for purposes of fill volume) as filling two sections centered on the ends of this segment.
    -- That way you can't "cheat" by filling every other cliff segment -- the numbers should work out the same.
    west_to_east   = crater_orientation(sprite_params, "N",  0, 0, 4, radius, thickness, 0, orientation_offset),
    west_to_south  = crater_orientation(sprite_params, "NE", 0, 0, 4, radius, thickness, 1, orientation_offset),
    north_to_south = crater_orientation(sprite_params, "E",  0, 0, 4, radius, thickness, 2, orientation_offset),
    north_to_west  = crater_orientation(sprite_params, "SE", 0, 0, 4, radius, thickness, 3, orientation_offset),
    east_to_west   = crater_orientation(sprite_params, "S",  0, 0, 4, radius, thickness, 4, orientation_offset),
    east_to_north  = crater_orientation(sprite_params, "SW", 0, 0, 4, radius, thickness, 5, orientation_offset),
    south_to_north = crater_orientation(sprite_params, "W",  0, 0, 4, radius, thickness, 6, orientation_offset),
    south_to_east  = crater_orientation(sprite_params, "NW", 0, 0, 4, radius, thickness, 7, orientation_offset),

    west_to_north  = dummy,
    north_to_east  = dummy,
    east_to_south  = dummy,
    south_to_west  = dummy,
    west_to_none   = dummy,
    none_to_east   = dummy,
    north_to_none  = dummy,
    none_to_south  = dummy,
    east_to_none   = dummy,
    none_to_west   = dummy,
    south_to_none  = dummy,
    none_to_north  = dummy,
  }
end

function create_crater_placement_specification(radius, orientation_offset)--,segment_probability)
  local segments = {}
  for i = 0, 7 do
    table.insert(segments,
                 {
                   orientation = i / 8,
                   offset = math2d.vector.projected(math2d.vector.from_orientation(i / 8 + orientation_offset, radius))
                 })
  end

  return
  {
    minimum_segments_to_place = 3,
    --segment_probability,
    segment_probability = 0.9,
    segments = segments
  }
end

function scaled_cliff(args, create_data_specification_func)
  local mod_name               = args.mod_name or "__base__"
  local name                   = args.name or "cliff"
  local map_color              = args.map_color or {r=144, g=119, b=87}
  local subfolder              = args.subfolder or nil
  local suffix                 = args.suffix or nil
  local prefix                 = args.prefix or nil
  local scale                  = args.scale or 1.0
  local collision_mask         = args.collision_mask or nil
  local has_lower_layer        = args.has_lower_layer or false
  local sprite_size_multiplier = args.sprite_size_multiplier or 1
  local create_data_specification = create_data_specification_func or create_cliff_data_specification

  local sprite_params =
  {
    mod_name = mod_name,
    subfolder = subfolder,
    prefix = prefix,
    suffix = suffix,
    has_lower_layer = has_lower_layer,
    scale = scale,
    sprite_size_multiplier = sprite_size_multiplier
  }

  local grid_offset
  if scale == 1 then
    grid_offset = {0, 0.5}
  else
    grid_offset = {0.5, 0.5} -- Works well for the 2x2 cliffs
  end

  if name ~= "cliff" then
    deconstruction_alternative = "cliff"
  end

  return
  {
    type = "cliff",
    name = name,
    icon = mod_name .. "/graphics/icons/cliff" .. (suffix and ("-" .. suffix) or "") ..'.png',

    subgroup = "cliffs",
    flags = args.flags or {"placeable-neutral"},
    -- generic collision box is intentionally small so you can place trees nearby in map editor
    -- cliffs are auto-placed with centers at (0, 0.5) offset from the grid;
    -- using a collision box with even width and odd height makes them place properly in the editor.
    collision_box = scale_bounding_box({{-0.99, -0.49}, {0.99, 0.49}}, scale),
    selection_box = scale_bounding_box({{-1.5, -1.5}, {1.5, 1.5}}, scale),
    collision_mask = collision_mask,
    order = "b[decorative]-l[rock]-b[big]",
    deconstruction_alternative = deconstruction_alternative,
    selectable_in_game = false,
    map_color = map_color,
    grid_size = {4 * scale, 4 * scale},
    grid_offset = grid_offset,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg",volume = 0.8},
    impact_category = "stone",
    cliff_explosive = "cliff-explosives",
    orientations = create_data_specification(sprite_params, args),
    place_as_crater = args.place_as_crater,
    factoriopedia_simulation = args.factoriopedia_simulation,
  }
end

function scaled_cliff_crater(args)
  local result = scaled_cliff(args, create_crater_data_specification)
  result.place_as_crater = create_crater_placement_specification(args.crater_radius or default_crater_radius,
                                                                 args.crater_segment_orientation_offset or 0)
  result.icon = args.icon or result.icon
  result.autoplace = args.autoplace
  return result
end

selection_priorities = -- 0-255, with 255 being on top of everything else
{
  not_specified = 0, -- explicitly use default for that prototype type; same result as if not specifying priority at all
  editor_only = 20, -- entities not selectable by normal player (e.g. corpses, projectiles), but by editor in entity mode
  flying_robot = 35,
  resource = 40,
  ground_entity = 45, -- belts, rails, other 'walkable' entities
  default = 50, -- machines, vehicles, trees & rocks, etc.
  elevated_rail = 55,
  elevated_train = 56,
}

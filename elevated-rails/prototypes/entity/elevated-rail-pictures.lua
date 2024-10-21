local util = require("util")

local ground_rail_render_layers =
{
  stone_path_lower = "rail-stone-path-lower",
  stone_path = "rail-stone-path",
  tie = "rail-tie",
  screw = "rail-screw",
  metal = "rail-metal"
}
local elevated_rail_render_layers =
{
  stone_path_lower = "elevated-rail-stone-path-lower",
  stone_path = "elevated-rail-stone-path",
  tie = "elevated-rail-tie",
  screw = "elevated-rail-screw",
  metal = "elevated-rail-metal"
}
local ramp_render_layers =
{
  stone_path_lower = "rail-stone-path-lower", -- used for shadow layer, render layer should not matter
  stone_path = "rail-screw", -- ramp train tracks; rail-screw so it is above soft decoratives
  tie = "object", -- ramp concrete base and steel structure
  screw = "rail-screw", -- unused
  metal = "object", -- unused
  front_end = "rail-metal",
  back_end = "elevated-rail-screw"
}
local ramp_top_render_layers =
{
  stone_path_lower = "rail-stone-path-lower",
  stone_path = "elevated-rail-stone-path",
  tie = "object", -- ramp concrete base and steel structure
  screw = "elevated-rail-screw", -- unused
  metal = "elevated-higher-object" -- unused
}

local rail_segment_visualisation_endings =
{
  filename = "__base__/graphics/entity/rails/rail/rail-segment-visualisations-endings.png",
  priority = "extra-high",
  flags = { "low-object" },
  width = 64,
  height = 64,
  scale = 0.5,
  direction_count = 16,
  frame_count = 6,
  usage = "rail"
}

local function elevated_rail_endings()
  return
  {
    sheets =
    {
      util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail/elevated-rail-ending", {
          priority = "high",
          flags = { "low-object" },
          scale = 0.5,
          usage = "elevated-rail"
      }),
      util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail/elevated-rail-ending-shadow", {
        priority = "high",
        flags = { "low-object" },
        scale = 0.5,
        draw_as_shadow = true,
        usage = "elevated-rail"
      }),
    }
  }
end

local function ground_rail_endings()
  return
  {
    sheets =
    {
      {
        filename = "__base__/graphics/entity/rails/rail/rail-endings-background.png",
        priority = "high",
        flags = { "low-object" },
        width = 256,
        height = 256,
        scale = 0.5,
        usage = "rail"
      },
      {
        filename = "__base__/graphics/entity/rails/rail/rail-endings-foreground.png",
        priority = "high",
        flags = { "trilinear-filtering" },
        width = 256,
        height = 256,
        scale = 0.5,
        usage = "rail"
      }
    }
  }
end

local function make_new_rail_pictures(keys, elems, max_variations)
  local function make_sprite_definition(filename, elem, key, variation_count, is_reflection)
    return
    {
      filename = filename,
      priority = elem.priority or "extra-high",
      flags = (not is_reflection) and (elem.mipmap and { "trilinear-filtering" } or { "low-object" }) or nil,
      draw_as_shadow = elem.draw_as_shadow,
      width = key[3][1],
      height = key[3][2],
      x = key[2][1],
      y = key[2][2],
      scale = 0.5;
      shift = util.by_pixel(key[4][1], key[4][2]),
      variation_count = (not is_reflection) and variation_count or nil,
      usage = "elevated-rail"
    }
  end

  local res = {}
  for _ , key in ipairs(keys) do
    local part = {}
    local variation_count = key[5] or 1
    if max_variations then
      variation_count = math.min(variation_count, max_variations)
    end
    if (variation_count > 0) then
      for _ , elem in ipairs(elems) do
        local layers = nil
        local variations = variation_count
        local is_reflection = elem[1] == "water_reflection"
        if (elem[1] == "segment_visualisation_middle") then
          variations = nil
        end
        if (type(elem[2]) == "table") then
          layers = { layers = {} }
          for _, subelem in ipairs(elem[2]) do
            table.insert(layers.layers, make_sprite_definition(subelem[1], subelem, key, variations, is_reflection))
          end
        else
          layers = make_sprite_definition(elem[2], elem, key, variations, is_reflection)
        end

        if (elem[1] ~= nil) then
          part[elem[1]] = layers
        else
          part = layers
        end
      end
    end

    res[key[1]] = part
  end
  return res
end

function new_rail_pictures(rail_type)
  local keys
  local NOT_USED_POSITION = {0, 0}
  local NOT_USED_SIZE = {1, 1}
  local NOT_USED_SHIFT = {0, 0}
  if rail_type == "straight" then
    keys =
    {
      {"north",     { 0,  256 }, {256, 256}, {0,0}, 8},
      {"northeast", { 0, 2048 }, {384, 384}, {0,0}, 3},
      {"east",      { 0,    0 }, {256, 256}, {0,0}, 8},
      {"southeast", { 0,  896 }, {384, 384}, {0,0}, 3},
      {"south",     NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"southwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"west",      NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"northwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0}
    }
  elseif rail_type == "half-diagonal" then
    keys =
    {
      {"north",     { 0, 1280 }, {384, 384}, {0,0}, 3},
      {"northeast", { 0, 1664 }, {384, 384}, {0,0}, 3},
      {"east",      { 0, 2432 }, {384, 384}, {0,0}, 3},
      {"southeast", { 0,  512 }, {384, 384}, {0,0}, 3},
      {"south",     NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"southwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"west",      NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"northwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0}
    }
  elseif rail_type == "curved-a" then
    keys =
    {
      {"north",     { 2048,  3 * 512 }, {512, 512}, {0,0}, 4},-- piece 04
      {"northeast", { 2048, 12 * 512 }, {512, 512}, {0,0}, 4},-- piece 13
      {"east",      { 2048,  7 * 512 }, {512, 512}, {0,0}, 4},-- piece 08
      {"southeast", { 2048,  0 * 512 }, {512, 512}, {0,0}, 4},-- piece 01
      {"south",     { 2048, 11 * 512 }, {512, 512}, {0,0}, 4},-- piece 12
      {"southwest", { 2048,  4 * 512 }, {512, 512}, {0,0}, 4},-- piece 05
      {"west",      { 2048, 15 * 512 }, {512, 512}, {0,0}, 4},-- piece 16
      {"northwest", { 2048,  8 * 512 }, {512, 512}, {0,0}, 4},-- piece 09
    }
  elseif rail_type == "curved-b" then
    keys =
    {
      {"north",     { 2048,  2 * 512 }, {512, 512}, {0,0}, 4},-- piece 03
      {"northeast", { 2048, 13 * 512 }, {512, 512}, {0,0}, 4},-- piece 14
      {"east",      { 2048,  6 * 512 }, {512, 512}, {0,0}, 4},-- piece 07
      {"southeast", { 2048,  1 * 512 }, {512, 512}, {0,0}, 4},-- piece 02
      {"south",     { 2048, 10 * 512 }, {512, 512}, {0,0}, 4},-- piece 11
      {"southwest", { 2048,  5 * 512 }, {512, 512}, {0,0}, 4},-- piece 06
      {"west",      { 2048, 14 * 512 }, {512, 512}, {0,0}, 4},-- piece 15
      {"northwest", { 2048,  9 * 512 }, {512, 512}, {0,0}, 4},-- piece 10
    }
  end
  local elems =
  {
    { "metals",                       "__base__/graphics/entity/rails/rail/rail-metals.png",             mipmap = true },
    { "backplates",                   "__base__/graphics/entity/rails/rail/rail-backplates.png",         mipmap = true },
    { "ties",                         "__base__/graphics/entity/rails/rail/rail-ties.png"                              },
    { "stone_path",                   "__base__/graphics/entity/rails/rail/rail-stone-path-inside.png"                 },
    { "stone_path_background",        "__base__/graphics/entity/rails/rail/rail-stone-path.png"                        },
    { "segment_visualisation_middle", "__base__/graphics/entity/rails/rail/rail-segment-visualisations-middle.png"     },
  }

  local res = make_new_rail_pictures(keys, elems)
  res["rail_endings"] = ground_rail_endings()
  res["render_layers"] = ground_rail_render_layers
  res["segment_visualisation_endings"] = rail_segment_visualisation_endings
  return res
end

function new_rail_remnants_pictures(rail_type)
  local keys
  local NOT_USED_POSITION = {0, 0}
  local NOT_USED_SIZE = {1, 1}
  local NOT_USED_SHIFT = {0, 0}
  if rail_type == "straight" then
    keys =
    {
      {"north",     { 0,  256 }, {256, 256}, {0,0}, 8},
      {"northeast", { 0, 2048 }, {384, 384}, {0,0}, 3},
      {"east",      { 0,    0 }, {256, 256}, {0,0}, 8},
      {"southeast", { 0,  896 }, {384, 384}, {0,0}, 3},
      {"south",     NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"southwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"west",      NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"northwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0}
    }
  elseif rail_type == "half-diagonal" then
    keys =
    {
      {"north",     { 0, 1280 }, {384, 384}, {0,0}, 3},
      {"northeast", { 0, 1664 }, {384, 384}, {0,0}, 3},
      {"east",      { 0, 2432 }, {384, 384}, {0,0}, 3},
      {"southeast", { 0,  512 }, {384, 384}, {0,0}, 3},
      {"south",     NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"southwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"west",      NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"northwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0}
    }
  elseif rail_type == "curved-a" then
    keys =
    {
      {"north",     { 2048,  3 * 512 }, {512, 512}, {0,0}, 4},-- piece 04
      {"northeast", { 2048, 12 * 512 }, {512, 512}, {0,0}, 4},-- piece 13
      {"east",      { 2048,  7 * 512 }, {512, 512}, {0,0}, 4},-- piece 08
      {"southeast", { 2048,  0 * 512 }, {512, 512}, {0,0}, 4},-- piece 01
      {"south",     { 2048, 11 * 512 }, {512, 512}, {0,0}, 4},-- piece 12
      {"southwest", { 2048,  4 * 512 }, {512, 512}, {0,0}, 4},-- piece 05
      {"west",      { 2048, 15 * 512 }, {512, 512}, {0,0}, 4},-- piece 16
      {"northwest", { 2048,  8 * 512 }, {512, 512}, {0,0}, 4},-- piece 09
    }
  elseif rail_type == "curved-b" then
    keys =
    {
      {"north",     { 2048,  2 * 512 }, {512, 512}, {0,0}, 4},-- piece 03
      {"northeast", { 2048, 13 * 512 }, {512, 512}, {0,0}, 4},-- piece 14
      {"east",      { 2048,  6 * 512 }, {512, 512}, {0,0}, 4},-- piece 07
      {"southeast", { 2048,  1 * 512 }, {512, 512}, {0,0}, 4},-- piece 02
      {"south",     { 2048, 10 * 512 }, {512, 512}, {0,0}, 4},-- piece 11
      {"southwest", { 2048,  5 * 512 }, {512, 512}, {0,0}, 4},-- piece 06
      {"west",      { 2048, 14 * 512 }, {512, 512}, {0,0}, 4},-- piece 15
      {"northwest", { 2048,  9 * 512 }, {512, 512}, {0,0}, 4},-- piece 10
    }
  end
  local elems =
  {
    { "metals",                "__base__/graphics/entity/rails/rail/remnants/rail-remnants-metals.png",             mipmap = true },
    { "backplates",            "__base__/graphics/entity/rails/rail/remnants/rail-remnants-backplates.png",         mipmap = true },
    { "ties",                  "__base__/graphics/entity/rails/rail/remnants/rail-remnants-ties.png"                              },
    { "stone_path",            "__base__/graphics/entity/rails/rail/remnants/rail-remnants-stone-path-inside.png"                 },
    { "stone_path_background", "__base__/graphics/entity/rails/rail/remnants/rail-remnants-stone-path.png"                        }
  }

  local res = make_new_rail_pictures(keys, elems)
  res["rail_endings"] = ground_rail_endings()
  res["render_layers"] = ground_rail_render_layers
  return res
end

function elevated_rail_pictures(rail_type)
  local keys
  local NOT_USED_POSITION = {0, 0}
  local NOT_USED_SIZE = {1, 1}
  local NOT_USED_SHIFT = {0, 0}
  local frame_x = 768
  local frame_y = 768
  local frame_shift = {0, 0}
  if rail_type == "straight" then
    keys =
    {
      {"north",     { 0, 1 * frame_y }, {frame_x, frame_y}, frame_shift, 1},
      {"northeast", { 0, 6 * frame_y }, {frame_x, frame_y}, frame_shift, 1},
      {"east",      { 0, 0 * frame_y }, {frame_x, frame_y}, frame_shift, 1},
      {"southeast", { 0, 3 * frame_y }, {frame_x, frame_y}, frame_shift, 1},
      {"south",     NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"southwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"west",      NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"northwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0}
    }
  elseif rail_type == "half-diagonal" then
    keys =
    {
      {"north",     { 0, 4 * frame_y }, {frame_x, frame_y}, frame_shift, 1},
      {"northeast", { 0, 5 * frame_y }, {frame_x, frame_y}, frame_shift, 1},
      {"east",      { 0, 7 * frame_y }, {frame_x, frame_y}, frame_shift, 1},
      {"southeast", { 0, 2 * frame_y }, {frame_x, frame_y}, frame_shift, 1},
      {"south",     NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"southwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"west",      NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
      {"northwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0}
    }
  elseif rail_type == "curved-a" then
    keys =
    {
      {"north",     { (1 + 1) * frame_x, 1 * frame_y }, {frame_x, frame_y}, frame_shift, 1},-- piece 04 = 37
      {"northeast", { (1 + 0) * frame_x, 6 * frame_y }, {frame_x, frame_y}, frame_shift, 1},-- piece 13 = 46
      {"east",      { (1 + 1) * frame_x, 3 * frame_y }, {frame_x, frame_y}, frame_shift, 1},-- piece 08 = 41
      {"southeast", { (1 + 0) * frame_x, 0 * frame_y }, {frame_x, frame_y}, frame_shift, 1},-- piece 01 = 34
      {"south",     { (1 + 1) * frame_x, 5 * frame_y }, {frame_x, frame_y}, frame_shift, 1},-- piece 12 = 45
      {"southwest", { (1 + 0) * frame_x, 2 * frame_y }, {frame_x, frame_y}, frame_shift, 1},-- piece 05 = 38
      {"west",      { (1 + 1) * frame_x, 7 * frame_y }, {frame_x, frame_y}, frame_shift, 1},-- piece 16 = 49
      {"northwest", { (1 + 0) * frame_x, 4 * frame_y }, {frame_x, frame_y}, frame_shift, 1},-- piece 09 = 42
    }
  elseif rail_type == "curved-b" then
    keys =
    {
      {"north",     { (1 + 0) * frame_x, 1 * frame_y }, {frame_x, frame_y}, frame_shift, 1},-- piece 03 = 36
      {"northeast", { (1 + 1) * frame_x, 6 * frame_y }, {frame_x, frame_y}, frame_shift, 1},-- piece 14 = 47
      {"east",      { (1 + 0) * frame_x, 3 * frame_y }, {frame_x, frame_y}, frame_shift, 1},-- piece 07 = 40
      {"southeast", { (1 + 1) * frame_x, 0 * frame_y }, {frame_x, frame_y}, frame_shift, 1},-- piece 02 = 35
      {"south",     { (1 + 0) * frame_x, 5 * frame_y }, {frame_x, frame_y}, frame_shift, 1},-- piece 11 = 44
      {"southwest", { (1 + 1) * frame_x, 2 * frame_y }, {frame_x, frame_y}, frame_shift, 1},-- piece 06 = 39
      {"west",      { (1 + 0) * frame_x, 7 * frame_y }, {frame_x, frame_y}, frame_shift, 1},-- piece 15 = 48
      {"northwest", { (1 + 1) * frame_x, 4 * frame_y }, {frame_x, frame_y}, frame_shift, 1},-- piece 10 = 43
    }
  end
  local elems =
  {
    { "metals",                "__elevated-rails__/graphics/entity/elevated-rail/elevated-rail-metals.png",             mipmap = true },
    { "backplates",            "__elevated-rails__/graphics/entity/elevated-rail/elevated-rail-backplates.png",         mipmap = true },
    { "stone_path",            "__elevated-rails__/graphics/entity/elevated-rail/elevated-rail-base-top.png"                          },
    { "stone_path_background",
      {
        { "__elevated-rails__/graphics/entity/elevated-rail/elevated-rail-base.png" },
        { "__elevated-rails__/graphics/entity/elevated-rail/elevated-rail-base-shadow.png",  draw_as_shadow = true }
      }
    },

    { "segment_visualisation_middle", "__elevated-rails__/graphics/entity/elevated-rail/elevated-rail-segment-visualisations.png" },
    { "water_reflection",             "__elevated-rails__/graphics/entity/elevated-rail/elevated-rail-base-reflection.png"        }
  }

  local res = make_new_rail_pictures(keys, elems)
  res["rail_endings"] = elevated_rail_endings()
  res["render_layers"] = elevated_rail_render_layers
  res["segment_visualisation_endings"] = rail_segment_visualisation_endings
  return shift_rail_gfx(res, {0, -3})
end

local function rail_fences_keys(rail_type)
  local keys = nil
  local frame_w = 768
  local frame_h = 768
  if rail_type == "straight" then
    keys =
    {
      {"north",     { 0, frame_h * 1 }, {frame_w, frame_h}, {0,0}, 1},
      {"northeast", { 0, frame_h * 6 }, {frame_w, frame_h}, {0,0}, 1},
      {"east",      { 0, frame_h * 0 }, {frame_w, frame_h}, {0,0}, 1},
      {"southeast", { 0, frame_h * 3 }, {frame_w, frame_h}, {0,0}, 1},
      {"south",     nil, nil, nil, 0},
      {"southwest", nil, nil, nil, 0},
      {"west",      nil, nil, nil, 0},
      {"northwest", nil, nil, nil, 0}
    }
  elseif rail_type == "half-diagonal" then
    keys =
    {
      {"north",     { 0, frame_h * 4 }, {frame_w, frame_h}, {0,0}, 2},
      {"northeast", { 0, frame_h * 5 }, {frame_w, frame_h}, {0,0}, 2},
      {"east",      { 0, frame_h * 7 }, {frame_w, frame_h}, {0,0}, 2},
      {"southeast", { 0, frame_h * 2 }, {frame_w, frame_h}, {0,0}, 2},
      {"south",     nil, nil, nil, 0},
      {"southwest", nil, nil, nil, 0},
      {"west",      nil, nil, nil, 0},
      {"northwest", nil, nil, nil, 0}
    }
  elseif rail_type == "curved-a" then
    keys =
    {
      {"north",     { frame_w * 2, 1 * frame_h }, {frame_w, frame_h}, {0,0}, 2}, -- piece 04
      {"northeast", { frame_w * 2, 6 * frame_h }, {frame_w, frame_h}, {0,0}, 2}, -- piece 13
      {"east",      { frame_w * 2, 3 * frame_h }, {frame_w, frame_h}, {0,0}, 2}, -- piece 08
      {"southeast", { frame_w * 2, 0 * frame_h }, {frame_w, frame_h}, {0,0}, 2}, -- piece 01
      {"south",     { frame_w * 2, 5 * frame_h }, {frame_w, frame_h}, {0,0}, 2}, -- piece 12
      {"southwest", { frame_w * 2, 2 * frame_h }, {frame_w, frame_h}, {0,0}, 2}, -- piece 05
      {"west",      { frame_w * 2, 7 * frame_h }, {frame_w, frame_h}, {0,0}, 2}, -- piece 16
      {"northwest", { frame_w * 2, 4 * frame_h }, {frame_w, frame_h}, {0,0}, 2}, -- piece 09
    }
  elseif rail_type == "curved-b" then
    keys =
    {
      {"north",     { frame_w * 4, 1 * frame_h }, {frame_w, frame_h}, {0,0}, 2}, -- piece 03
      {"northeast", { frame_w * 4, 6 * frame_h }, {frame_w, frame_h}, {0,0}, 2}, -- piece 14
      {"east",      { frame_w * 4, 3 * frame_h }, {frame_w, frame_h}, {0,0}, 2}, -- piece 07
      {"southeast", { frame_w * 4, 0 * frame_h }, {frame_w, frame_h}, {0,0}, 2}, -- piece 02
      {"south",     { frame_w * 4, 5 * frame_h }, {frame_w, frame_h}, {0,0}, 2}, -- piece 11
      {"southwest", { frame_w * 4, 2 * frame_h }, {frame_w, frame_h}, {0,0}, 2}, -- piece 06
      {"west",      { frame_w * 4, 7 * frame_h }, {frame_w, frame_h}, {0,0}, 2}, -- piece 15
      {"northwest", { frame_w * 4, 4 * frame_h }, {frame_w, frame_h}, {0,0}, 2}, -- piece 10
    }
  end
  return keys
end

local function elevated_rail_fence_single_layer(rail_type, name, skip_shadow)
  local keys = rail_fences_keys(rail_type)
  local layers = {
                   { "__elevated-rails__/graphics/entity/elevated-rail/" .. name .. ".png" },
                   { "__elevated-rails__/graphics/entity/elevated-rail/" .. name .. "-shadow.png",  draw_as_shadow = true }
                 }
  if skip_shadow then
    layers[2] = nil
  end
  local res = make_new_rail_pictures(keys, {{ nil, layers }})
  --res.segmented = (rail_type ~= "straight")
  return res
end

local function elevated_rail_fence_single_side(rail_type, side)
  return
  {
    fence = elevated_rail_fence_single_layer(rail_type, "elevated-rail-fence-" .. side),
    ends =
    {
      elevated_rail_fence_single_layer(rail_type, "elevated-rail-fence-" .. side .. "-end-01"),
      elevated_rail_fence_single_layer(rail_type, "elevated-rail-fence-" .. side .. "-end-02"),
      elevated_rail_fence_single_layer(rail_type, "elevated-rail-fence-" .. side .. "-end-03"),
      elevated_rail_fence_single_layer(rail_type, "elevated-rail-fence-" .. side .. "-end-04"),
    },

    fence_upper = elevated_rail_fence_single_layer(rail_type, "elevated-rail-fence-" .. side .. "-upper", true),
    ends_upper =
    {
      elevated_rail_fence_single_layer(rail_type, "elevated-rail-fence-" .. side .. "-end-01-upper", true),
      elevated_rail_fence_single_layer(rail_type, "elevated-rail-fence-" .. side .. "-end-02-upper", true),
      elevated_rail_fence_single_layer(rail_type, "elevated-rail-fence-" .. side .. "-end-03-upper", true),
      elevated_rail_fence_single_layer(rail_type, "elevated-rail-fence-" .. side .. "-end-04-upper", true),
    }
  }
end

function elevated_rail_fences_pictures(rail_type)
  local pictures =
  {
    side_A = elevated_rail_fence_single_side(rail_type, "A"),
    side_B = elevated_rail_fence_single_side(rail_type, "B"),
    segment_count = (rail_type ~= "straight") and 4 or 2
  }
  return shift_fence_gfx(pictures, {0, -3})
end

function rails_ramp_fences_pictures()
  local side_A_fence_full =
  {
    ["north"] = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-A", { scale = 0.5, frame_index = 0, dice_y = 2 }),
    ["east"]  = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-A", { scale = 0.5, frame_index = 3 }),
    ["south"] = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-A", { scale = 0.5, frame_index = 2, dice_y = 2 }),
    ["west"]  = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-A", { scale = 0.5, frame_index = 1 }),
  }

  local side_A_fence_end =
  {
    ["north"] = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-A-end", { scale = 0.5, frame_index = 0, dice_y = 2 }),
    ["east"]  = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-A-end", { scale = 0.5, frame_index = 3 }),
    ["south"] = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-A-end", { scale = 0.5, frame_index = 2, dice_y = 2 }),
    ["west"]  = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-A-end", { scale = 0.5, frame_index = 1 }),
  }

  local side_B_fence_full =
  {
    ["north"] = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-B", { scale = 0.5, frame_index = 0, dice_y = 2 }),
    ["east"]  = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-B", { scale = 0.5, frame_index = 3 }),
    ["south"] = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-B", { scale = 0.5, frame_index = 2, dice_y = 2 }),
    ["west"]  = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-B", { scale = 0.5, frame_index = 1 }),
  }

  local side_B_fence_end =
  {
    ["north"] = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-B-end", { scale = 0.5, frame_index = 0, dice_y = 2 }),
    ["east"]  = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-B-end", { scale = 0.5, frame_index = 3 }),
    ["south"] = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-B-end", { scale = 0.5, frame_index = 2, dice_y = 2 }),
    ["west"]  = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-B-end", { scale = 0.5, frame_index = 1 }),
  }

  return
  {
    segment_count = 2,
    side_A =
    {
      fence = side_A_fence_full,
      ends =
      {
        side_A_fence_full,
        side_A_fence_full,
        side_A_fence_end,
        side_A_fence_end
      }
    },
    side_B =
    {
      fence = side_B_fence_full,

      ends =
      {
        side_B_fence_full,
        side_B_fence_full,
        side_B_fence_end,
        side_B_fence_end
      }
    },

    back_fence_render_layer = "lower-object-above-shadow",
    front_fence_render_layer = "object",
    back_fence_render_layer_secondary = "elevated-lower-object",
    front_fence_render_layer_secondary = "elevated-higher-object",
  }
end

function rails_ramp_pictures()
  local rail_ramp_def         = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp", { priority = "extra-high", flags = { "low-object" }, scale = 0.5 })
  local rail_ramp_shadowmask_def = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-mask", { priority = "extra-high", flags = { "low-object" }, scale = 0.5, draw_as_shadow = true })
  local rail_ramp_base_def    = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-base", { priority = "extra-high", scale = 0.5 })
  local rail_ramp_shadow_def  = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-shadow", { priority = "extra-high", flags = { "low-object" }, scale = 0.5, draw_as_shadow = true })
  local rail_ramp_reflection  = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-reflection", { priority = "extra-high", scale = 0.5 })
  local rail_ramp_underwater  = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-underwater", { priority = "extra-high", scale = 0.5 })

  local function rail_ramp_pictures(x_frame, y_frame, dice_y)
    local function make_simple_image(def)
      local ret = util.table.deepcopy(def)
      ret.x = x_frame * def.width
      ret.y = y_frame * def.height
      ret.usage = "rail"
      ret.dice_y = dice_y
      return ret
    end

    return
    {
      backplates = nil,
      ties = make_simple_image(rail_ramp_base_def),
      metals = nil,
      stone_path = make_simple_image(rail_ramp_def),
      stone_path_background = make_simple_image(rail_ramp_shadow_def),
      water_reflection = make_simple_image(rail_ramp_reflection),
      underwater_structure = make_simple_image(rail_ramp_underwater),
      shadow_subtract_mask = make_simple_image(rail_ramp_def),
      shadow_mask = make_simple_image(rail_ramp_shadowmask_def),
    }
  end

  local res = {}
  local dice_y = 3
  res["north"]     = rail_ramp_pictures(0, 0, dice_y)
  res["northeast"] = {}
  res["east"]      = rail_ramp_pictures(1, 1)
  res["southeast"] = {}
  res["south"]     = rail_ramp_pictures(0, 1, dice_y)
  res["southwest"] = {}
  res["west"]      = rail_ramp_pictures(1, 0)
  res["northwest"] = {}

  -- Genuine hack by boskid @ 9.09.2022. Proper solution would be to change RailPictureSet::drawEnding to use
  --  location.getElevatedPosition but dealing with the shadow shifts... maybe when posila will be in a good mood.
  local temp = {}
  temp["back_rail_endings"] = elevated_rail_endings();
  shift_rail_gfx(temp, {0, -3})
  res["back_rail_endings"] = temp["back_rail_endings"]
  -- End of a genuine hack

  res["front_rail_endings"] = ground_rail_endings()

  local function get_segment_visualisation_sprite(x, y, dice_y)
    -- this should be baked into rail_ramp_pictures() but the ramp-segment-visualisations-middle.png
    -- was not yet reworked to have the same layout as rest of the ramp graphics since this file comes from the
    -- original development-only ramp sprite pack
    return
    {
      filename = "__elevated-rails__/graphics/entity/elevated-rail-ramp/ramp-segment-visualisations-middle.png",
      priority = "extra-high",
      flags = { "low-object" },
      width = 1536,
      height = 1536,
      x = 1536*x,
      y = 1536*y,
      dice_y = dice_y,
      scale = 0.5,
      usage = "rail"
    }
  end
  res.north.segment_visualisation_middle = get_segment_visualisation_sprite(0, 0, 3)
  res.east.segment_visualisation_middle  = get_segment_visualisation_sprite(1, 0)
  res.south.segment_visualisation_middle = get_segment_visualisation_sprite(2, 0, 2)
  res.west.segment_visualisation_middle  = get_segment_visualisation_sprite(3, 0)
  res["render_layers"] = ramp_render_layers
  res["secondary_render_layers"] = ramp_top_render_layers
  res["slice_origin"] = { east = { -9, -1.75 }, west = { 9, -1.75 }, north = { -10, -8 } }
  res["fog_mask"] =
  {
    east = { rect = {{-8, -30}, {30, -1.75}}, falloff = 1 },
    west = { rect = {{-30, -30}, {8, -1.75}}, falloff = 1 },
    north = { rect = {{-30, -30}, {30, 4.5}}, falloff = 3 },
    south = { rect = {{-30, -4.5}, {30, 30}}, falloff = 3 }
  }
  res["segment_visualisation_endings"] = rail_segment_visualisation_endings
  return res
end

function shift_rail_gfx(rail_graphics, shift)
  for k, tab in pairs(rail_graphics) do
    if (k ~= "segment_visualisation_endings") and (type(tab) == "table") then
      if tab.filename ~= nil then
        if tab.draw_as_shadow then
          tab.shift = util.add_shift(tab.shift, {3.87, 2.75 - 3}) -- { -shift[2] - 0.5, shift[1] })
        elseif k == "water_reflection" then
          tab.shift = util.add_shift(tab.shift, {0, -shift[2]})
        else
          tab.shift = util.add_shift(tab.shift, shift)
        end
      else
        shift_rail_gfx(tab, shift)
      end
    end
  end
  return rail_graphics
end

function shift_fence_gfx(fence_graphics, shift)
  shift_rail_gfx(fence_graphics.side_A.fence, shift)
  shift_rail_gfx(fence_graphics.side_B.fence, shift)
  shift_rail_gfx(fence_graphics.side_A.fence_upper, shift)
  shift_rail_gfx(fence_graphics.side_B.fence_upper, shift)
  for i = 1, 4 do
    shift_rail_gfx(fence_graphics.side_A.ends[i], shift)
    shift_rail_gfx(fence_graphics.side_B.ends[i], shift)
    shift_rail_gfx(fence_graphics.side_A.ends_upper[i], shift)
    shift_rail_gfx(fence_graphics.side_B.ends_upper[i], shift)
  end
  return fence_graphics
end

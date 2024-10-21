local base_decorative_sprite_priority = "extra-high"

local render_layer = {
  "zero",
  "zero",
  "zero",
  "zero",
  "ground-layer-1", --5
  "ground-layer-2", --6
  "ground-layer-3", --7
  "ground-layer-4", --8
  "ground-layer-5"
}

local function spritesheet_variations(count, line_length, base)
  local variations = {}
  for i = 1, count do
    local new = table.deepcopy(base)
    new.x = ((i-1) % line_length) * base.width
    new.y = math.floor((i-1) / line_length) * base.height
    table.insert(variations, new)
  end
  return variations
end

function get_decal_pictures(file_path, size_class, image_size, amount, tint, tint_as_overlay, scale)
  local pictures  = {}
  tint_as_overlay = tint_as_overlay or false
  tint = tint or {1, 1, 1}
  for i = 1, amount do
    table.insert(pictures,
                 {
                   filename = file_path .. size_class .. string.format("%02i", i) .. ".png",
                   priority = base_decorative_sprite_priority,
                   width = image_size,
                   height = image_size,
                   scale = 0.5 * (scale or 1),
                   tint_as_overlay = tint_as_overlay,
                   tint = tint
                 })
  end
  return pictures
end

data:extend
{
  {
    name = "space-platform-decorative-tiny",
    type = "optimized-decorative",
    order = "b[decorative]-b[space-platform-decal]-f[tiny]",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    minimal_separation = 0.05,
    target_count = 500,
    render_layer = render_layer[5],
    pictures = spritesheet_variations(30, 10, {
      filename = "__space-age__/graphics/decorative/space-platform-decorative/space-platform-decorative-tiny.png",
      width = 37,
      height = 37,
      scale = 0.5
    })
  },

  {
    name = "space-platform-decorative-1x1",
    type = "optimized-decorative",
    order = "b[decorative]-b[space-platform-decal]-e[1x1]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    minimal_separation = 0.19,
    target_count = 100,
    render_layer = render_layer[7],
    pictures = spritesheet_variations(51, 10, {
      filename = "__space-age__/graphics/decorative/space-platform-decorative/space-platform-decorative-1x1.png",
      width = 74,
      height = 74,
      scale = 0.5
    })
  },

  {
    name = "space-platform-decorative-2x2",
    type = "optimized-decorative",
    order = "b[decorative]-b[space-platform-decal]-d[2x2]",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    minimal_separation = 0.5,
    target_count = 40,
    render_layer = render_layer[6],
    pictures = spritesheet_variations(30, 10, {
      filename = "__space-age__/graphics/decorative/space-platform-decorative/space-platform-decorative-2x2.png",
      width = 150,
      height = 150,
      scale = 0.5
    })
  },

  {
    name = "space-platform-decorative-4x4",
    type = "optimized-decorative",
    order = "b[decorative]-b[space-platform-decal]-c[4x4]",
    collision_box = {{-1.9, -1.9}, {1.9, 1.9}},
    minimal_separation = 3.0,
    target_count = 4,
    render_layer = render_layer[5],
    pictures = spritesheet_variations(7, 4, {
      filename = "__space-age__/graphics/decorative/space-platform-decorative/space-platform-decorative-4x4.png",
      width = 300,
      height = 300,
      scale = 0.5
    })

  },
  {
    name = "space-platform-decorative-pipes-1x1",
    type = "optimized-decorative",
    order = "b[decorative]-b[space-platform-decal]-b[pipe-1x2]",
    collision_box = {{-0.25, -0.25}, {0.25, 0.25}},
    minimal_separation = 0.2,
    target_count = 100,
    render_layer = render_layer[8],
    pictures =  spritesheet_variations(24, 12, {
      filename = "__space-age__/graphics/decorative/space-platform-decorative/space-platform-decorative-pipes-1x1.png",
      width = 64,
      height = 64,
      scale = 0.5
    })
  },
  {
    name = "space-platform-decorative-pipes-1x2",
    type = "optimized-decorative",
    order = "b[decorative]-b[space-platform-decal]-b[pipe-1x2]",
    collision_box = {{-0.45, -0.9}, {0.45, 0.9}},
    minimal_separation = 0.5,
    target_count = 50,
    render_layer = render_layer[8],
    pictures =  spritesheet_variations(9, 9, {
      filename = "__space-age__/graphics/decorative/space-platform-decorative/space-platform-decorative-pipes-1x2.png",
      width = 64,
      height = 128,
      scale = 0.5
    })
  },
  {
    name = "space-platform-decorative-pipes-2x1",
    type = "optimized-decorative",
    order = "b[decorative]-b[space-platform-decal]-q[pipe-2x1]",
    collision_box = {{-0.9, -0.45}, {0.9, 0.45}},
    minimal_separation = 0.5,
    target_count = 50,
    render_layer = render_layer[8],
    pictures = spritesheet_variations(7, 7, {
      filename = "__space-age__/graphics/decorative/space-platform-decorative/space-platform-decorative-pipes-2x1.png",
      width = 128,
      height = 64,
      scale = 0.5
    })
  },

}


--[[
-- FOR DEBUGGING PURPOSES

for k, v in pairs(data.raw["optimized-decorative"]) do
  data:extend
  {
    {
      type = "explosion",
      name = v.name .. "-explosion",
      icon = "__core__/graphics/icons/category/decorative-editor.png",
      icon_size = 128,
      flags = {"not-on-map"},
      subgroup = "decorative-explosions",
      order = "a-s-a",
      height = 0,
      animations = util.empty_sprite(),--explosion_animations.small_explosion(),
      light = { intensity = 1, size = 20 },
      smoke = "smoke-fast",
      smoke_count = 2,
      smoke_slow_down_factor = 1,
      sound = nil, --explosion_sounds.small(0.75),
      created_effect = { type = "direct", action_delivery = { type = "instant", target_effects = v.trigger_effect } }
    }
  }
end
--]]

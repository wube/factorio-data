
local function rocket_silo_crafting_pictures()
  return
  {
    render_layer = "object",
    always_draw = true,
    secondary_draw_order = 127,
    --constant_speed = true,
    animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/crafting.png",
      frame_count = 64,
      line_length = 6,
      width = 208,
      height = 210,
      animation_speed = 0.65,
      scale = 0.5,
      shift = util.by_pixel( 83.0, 82.0)
    },
    name = "crafting"
  }
end

local function rocket_silo_light_pictures()
  return
  {
    fadeout = true,
    render_layer = "object",
    secondary_draw_order = 127,
    --constant_speed = true,
    animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/crafting-light.png",
      priority = "extra-high",
      width = 208,
      height = 212,
      draw_as_glow = true,
      blend_mode = "additive",
      frame_count = 64,
      shift = util.by_pixel( 80.0, 82.0),
      line_length = 6,
      animation_speed = 0.65,
      scale = 0.5
    }
  }
end

local function rocket_silo_filter_pictures()
  return
  {
    render_layer = "higher-object-above",
    always_draw = true,
    animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/filter.png",
      frame_count = 32,
      line_length = 6,
      width = 82,
      height = 78,
      animation_speed = 0.65,
      scale = 0.5,
      shift = util.by_pixel( -92.5, -69.0)
    }
  }
end

local function rocket_silo_engine_pictures()
  return
  {
    render_layer = "object",
    always_draw = true,
    secondary_draw_order = 30,
    --constant_speed = true,
    animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/engine.png",
      priority = "extra-high",
      width = 206,
      height = 152,
      frame_count = 32,
      shift = util.by_pixel( -89.0, -104.0),
      line_length = 6,
      animation_speed = 0.65,
      scale = 0.5

    }
  }
end

local function rocket_silo_steam_1()
  return
  {
    fadeout = true,
    constant_speed = true,
    render_layer = "higher-object-above",
    animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/steam-1.png",
      frame_count = 64,
      line_length = 8,
      width = 136,
      height = 178,
      animation_speed = 0.3,
      shift = util.by_pixel( 3.0, 93.0),
      tint = {0.7, 0.7, 0.7, 0.5},
      scale = 0.5,
      allow_forced_downscale = true
    }
  }
end

local function rocket_silo_steam_2()
  return
  {
    fadeout = true,
    constant_speed = true,
    render_layer = "higher-object-above",
    animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/steam-2.png",
      frame_count = 64,
      line_length = 8,
      width = 118,
      height =  164,
      animation_speed = 0.3,
      shift = util.by_pixel(146.0, 71.0),
      tint = {0.7, 0.7, 0.7, 0.5},
      scale = 0.5,
      allow_forced_downscale = true
    }
  }
end

return
{
  graphics_set =
  {
    working_visualisations =
    {
      rocket_silo_crafting_pictures(),
      rocket_silo_light_pictures(),
      rocket_silo_engine_pictures(),
      rocket_silo_filter_pictures(),
      rocket_silo_steam_1(),
      rocket_silo_steam_2()
    }
  }
}

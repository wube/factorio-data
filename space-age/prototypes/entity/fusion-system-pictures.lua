require ("util")

local function reactor_pictures()
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/fusion-reactor/fusion-reactor-main",
      {
        priority = "high",
        scale = 0.5
      }),
      util.sprite_load("__space-age__/graphics/entity/fusion-reactor/fusion-reactor-shadow",
      {
        priority = "high",
        draw_as_shadow = true,
        scale = 0.5
      }),
    }
  }
end

local function reactor_glow_pictures()
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/fusion-reactor/fusion-reactor-glow",
      {
        priority = "high",
        blend_mode = "additive",
        draw_as_glow = true,
        scale = 0.5
      })
    }
  }
end

local function reactor_connection_pictures(num, plasma_uv_shift)

  local shadow = nil
  if num < 7 then
    shadow = util.sprite_load("__space-age__/graphics/entity/fusion-reactor/fusion-reactor-connection-" .. num .. "-shadow",
    {
      priority = "high",
      draw_as_shadow = true,
      scale = 0.5,
      frame_count = 5
    })
  end
  return
  {
    pictures =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/fusion-reactor/fusion-reactor-connection-" .. num,
        {
          priority = "high",
          scale = 0.5,
          frame_count = 5
        }),
        shadow
      },
    },
    working_light_pictures =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/fusion-reactor/fusion-reactor-connection-" .. num .. "-glow",
        {
          priority = "high",
          blend_mode = "additive",
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 5
        }),
      }
    },
    fusion_effect_uv_map =
    {
      filename = "__space-age__/graphics/entity/fusion-reactor/fusion-reactor-connection-" .. num .. "-plasma-UV.png",
      width = 64,
      height = 64,
      shift = plasma_uv_shift,
      priority = "extra-high",
      scale = 0.5
    },
  }
end


local function generator_pictures(direction)

  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/fusion-generator/".. direction .. "/fusion-generator-" .. direction,
      {
        priority = "high",
        frame_count = 6,
        scale = 0.5,
      }),
      util.sprite_load("__space-age__/graphics/entity/fusion-generator/".. direction .. "/fusion-generator-" .. direction .. "-shadow",
      {
        priority = "high",
        draw_as_shadow = true,
        frame_count = 1,
        repeat_count = 6,
        scale = 0.5
      })
    }
  }
end

local function generator_pictures_input(direction, fluid_input)
  local fluid_input_string = ""
  if fluid_input ~= 0 then
    fluid_input_string = "-input-".. fluid_input
  end
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/fusion-generator/".. direction .. "/fusion-generator-" .. direction .. fluid_input_string,
      {
        priority = "high",
        scale = 0.5,
      }),
      util.sprite_load("__space-age__/graphics/entity/fusion-generator/".. direction .. "/fusion-generator-" .. direction .. fluid_input_string .. "-shadow",
      {
        priority = "high",
        draw_as_shadow = true,
        scale = 0.5
      })
    }
  }
end

local function generator_working_light(direction, fluid_input)
  fluid_input = fluid_input or 0
  local fluid_input_string = ""
  if fluid_input ~= 0 then
    fluid_input_string = "-input-".. fluid_input
  end
  local sprite = util.sprite_load("__space-age__/graphics/entity/fusion-generator/".. direction .. "/fusion-generator-" .. direction .. fluid_input_string .. "-glow",
  {
    priority = "high",
    blend_mode = "additive",
    draw_as_glow = true,
    scale = 0.5
  })
  if fluid_input == 0 then
    sprite.frame_count = 6
  end
  return
  {
    layers =
    {
      sprite
    }
  }
end

local function generator_uv_map(direction, shift, fluid_input)
  fluid_input = fluid_input or 0
  local fluid_input_string = ""
  if fluid_input ~= 0 then
    fluid_input_string = "-input-".. fluid_input
  end
  shift = shift or {0, 0}
  return util.sprite_load("__space-age__/graphics/entity/fusion-generator/".. direction .. "/fusion-generator-" .. direction .. fluid_input_string .."-uv",
                          {
                            priority = "extra-high",
                            scale = 0.5,
                            shift = shift,
                            dice = 2
                          })
end

return
{
  reactor_graphics_set =
  {
    use_fuel_glow_color = false,
    default_fuel_glow_color = {1,0,0.4,1},
    fusion_effect_uv_map =
    {
      filename = "__space-age__/graphics/entity/fusion-reactor/plasma-UV.png",
      width = 384,
      height = 384,
      shift = {0,0},
      dice_x = 2,
      dice_y = 5,
      priority = "extra-high",
      scale = 0.5
    },
    structure = reactor_pictures(),
    working_light_pictures = reactor_glow_pictures(),
    connections_graphics =
    {
      reactor_connection_pictures(1, { -1.5, -3 }),
      reactor_connection_pictures(2, {  1.5, -3 }),
      reactor_connection_pictures(3, {  2.5, -2.5 }),
      reactor_connection_pictures(4, {  2.5,  0.5 }),
      reactor_connection_pictures(5, {  1.5,  2 }),
      reactor_connection_pictures(6, { -1.5,  2 }),
      reactor_connection_pictures(7, { -2.5,  0.5 }),
      reactor_connection_pictures(8, { -2.5, -2   })
    },
    direction_to_connections_graphics =
    {
      north = { 1, 2, 3, 4, 5, 6, 7, 8 },
      east = { 3, 4, 5, 6, 7, 8, 1, 2 }
    },
    plasma_category = "fusion-reactor-plasma"
  },
  generator_graphics_set =
  {
    glow_color = {1,0,0.4,1},
    north_graphics_set =
    {
      animation = generator_pictures("north"),
      working_light = generator_working_light("north"),
      fusion_effect_uv_map = generator_uv_map("north", {0, 0.5}),
      fluid_input_graphics = {
        {
          sprite = generator_pictures_input("north", 1),
          working_light = generator_working_light("north",1),
          fusion_effect_uv_map = generator_uv_map("north", {-1,2},1),
        },
        {
          sprite = generator_pictures_input("north",2),
          working_light = generator_working_light("north",2),
          fusion_effect_uv_map = generator_uv_map("north", {1,2},2)
        },
        {},{},{},{},{}
      }
    },
    east_graphics_set =
    {
      animation = generator_pictures("east"),
      working_light = generator_working_light("east"),
      fusion_effect_uv_map = generator_uv_map("east", {-1,-0}),
      fluid_input_graphics = {
        {
          sprite = generator_pictures_input("east",1),
          working_light = generator_working_light("east",1),
          fusion_effect_uv_map = generator_uv_map("east", {-2,-1},1),
        },
        {
          sprite = generator_pictures_input("east",2),
          working_light = generator_working_light("east",2),
          fusion_effect_uv_map = generator_uv_map("east", {-2,0.5},2)
        },
        {},{},{},{},{}
      }
    },
    south_graphics_set =
    {
      animation = generator_pictures("south"),
      working_light = generator_working_light("south"),
      fusion_effect_uv_map = generator_uv_map("south", {0,-1}),
      fluid_input_graphics = {
        {
          sprite = generator_pictures_input("south",1),
          working_light = generator_working_light("south",1),
          fusion_effect_uv_map = generator_uv_map("south", {1,-2.5},1),
        },
        {
          sprite = generator_pictures_input("south",2),
          working_light = generator_working_light("south",2),
          fusion_effect_uv_map = generator_uv_map("south", {-1,-2.5},2),
        },
        {},{},{},{},{}
      }
    },
    west_graphics_set =
    {
      animation = generator_pictures("west"),
      working_light = generator_working_light("west"),
      fusion_effect_uv_map = generator_uv_map("west", {1,0}),
      fluid_input_graphics = {
        {
          sprite = generator_pictures_input("west",1),
          working_light = generator_working_light("west",1),
          fusion_effect_uv_map = generator_uv_map("west", {2,1},1),
        },
        {
          sprite = generator_pictures_input("west",2),
          working_light = generator_working_light("west",2),
          fusion_effect_uv_map = generator_uv_map("west", {2,-1},2),
        },
        {},{},{},{},{}
      }
    },
    --light = {intensity = 1.0, size = 7, shift = {0, 0}, color = {r = 1, g = 0.5, b = 0}}
  }
}

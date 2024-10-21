local recycler_animation_speed = 4

local function recycler_direction(key)
  return
  {
    layers =
    {
      util.sprite_load("__quality__/graphics/entity/recycler/recycler-"..key,
      {
        priority = "high",
        frame_count = 64,
        animation_speed = recycler_animation_speed,
        scale = 0.5
      }),
      util.sprite_load("__quality__/graphics/entity/recycler/recycler-"..key.."-shadow",
      {
        draw_as_shadow = true,
        priority = "high",
        frame_count = 64,
        animation_speed = recycler_animation_speed,
        scale = 0.5
      })
    }
  }
end

local function recycler_direction_frozen(key)
  return util.sprite_load("__quality__/graphics/entity/recycler/recycler-"..key.."-frozen",
  {
    priority = "high",
    scale = 0.5
  })
end

local function recycler_lights(key)
  return util.sprite_load("__quality__/graphics/entity/recycler/recycler-"..key.."-lights",
  {
    draw_as_glow = true,
    priority = "high",
    frame_count = 64,
    blend_mode = "additive",
    animation_speed = recycler_animation_speed,
    scale = 0.5
  })
end


local function recycler_smoke()
  return {
    apply_recipe_tint = "tertiary",
    fadeout = true,
    constant_speed = true,
    north_position = util.by_pixel_hr(35, -169-7),
    east_position = util.by_pixel_hr(97, -46-7),
    south_position = util.by_pixel_hr(-32, 18-7),
    west_position = util.by_pixel_hr(-86, -95-7),
    render_layer = "wires",
    animation =
    {
      filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
      frame_count = 47,
      line_length = 16,
      width = 90,
      height = 188,
      animation_speed = 0.5,
      shift = util.by_pixel(-2, -40),
      scale = 0.5
    }
  },
  {
    apply_recipe_tint = "quaternary",
    fadeout = true,
    constant_speed = true,
    north_position = util.by_pixel_hr(35, -169-7),
    east_position = util.by_pixel_hr(97, -46-7),
    south_position = util.by_pixel_hr(-32, 18-7),
    west_position = util.by_pixel_hr(-86, -95-7),
    render_layer = "wires",
    animation =
    {
      filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
      frame_count = 47,
      line_length = 16,
      width = 40,
      height = 84,
      animation_speed = 0.5,
      shift = util.by_pixel(0, -14),
      scale = 0.5
    }
  }
end

local function recycler_flipped_smoke()
  return {
    apply_recipe_tint = "tertiary",
    fadeout = true,
    constant_speed = true,
    north_position = util.by_pixel_hr(-36, -169-7),
    east_position = util.by_pixel_hr(102, -94-7),
    south_position = util.by_pixel_hr(31, 18-7),
    west_position = util.by_pixel_hr(-88, -48-7),
    render_layer = "wires",
    animation =
    {
      filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
      frame_count = 47,
      line_length = 16,
      width = 90,
      height = 188,
      animation_speed = 0.5,
      shift = util.by_pixel(-2, -40),
      scale = 0.5
    }
  },
  {
    apply_recipe_tint = "quaternary",
    fadeout = true,
    constant_speed = true,
    north_position = util.by_pixel_hr(-36, -169-7),
    east_position = util.by_pixel_hr(102, -94-7),
    south_position = util.by_pixel_hr(31, 18-7),
    west_position = util.by_pixel_hr(-88, -48-7),
    render_layer = "wires",
    animation =
    {
      filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
      frame_count = 47,
      line_length = 16,
      width = 40,
      height = 84,
      animation_speed = 0.5,
      shift = util.by_pixel(0, -14),
      scale = 0.5
    }
  }
end

return {
    graphics_set =
    {
      animation =
      {
        north = recycler_direction('N'),
        east  = recycler_direction('E'),
        south = recycler_direction('S'),
        west  = recycler_direction('W')
      },
      working_visualisations =
      {
        {
          north_animation = recycler_lights('N'),
          east_animation  = recycler_lights('E'),
          south_animation = recycler_lights('S'),
          west_animation  = recycler_lights('W')
        },
        recycler_smoke()
      },
      frozen_patch =
      {
        north = recycler_direction_frozen('N'),
        east  = recycler_direction_frozen('E'),
        south = recycler_direction_frozen('S'),
        west  = recycler_direction_frozen('W')
      }
    },
    graphics_set_flipped =
    {
      animation =
      {
        north = recycler_direction('flipped-N'),
        east  = recycler_direction('flipped-E'),
        south = recycler_direction('flipped-S'),
        west  = recycler_direction('flipped-W')
      },
      working_visualisations =
      {
        {
          north_animation = recycler_lights('flipped-N'),
          east_animation  = recycler_lights('flipped-E'),
          south_animation = recycler_lights('flipped-S'),
          west_animation  = recycler_lights('flipped-W')
        },
        recycler_flipped_smoke()
      },
      frozen_patch =
      {
        north = recycler_direction_frozen('flipped-N'),
        east  = recycler_direction_frozen('flipped-E'),
        south = recycler_direction_frozen('flipped-S'),
        west  = recycler_direction_frozen('flipped-W')
      }
    }
  }
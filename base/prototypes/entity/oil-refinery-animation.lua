require ("__base__.prototypes.entity.pipecovers")
local animation_speed = 0.75

local function refinery_direction(direction, anim_amount)
  local layers =
  {
    util.sprite_load("__base__/graphics/entity/oil-refinery/" .. direction .. "/oil-refinery-shadow-" .. direction,
    {
      draw_as_shadow = true,
      scale = 0.5,
      frame_count = 1,
      animation_speed = animation_speed,
      repeat_count = 60,
    }),
    util.sprite_load("__base__/graphics/entity/oil-refinery/" .. direction .. "/oil-refinery-" .. direction,
    {
      scale = 0.5,
      frame_count = 1,
      animation_speed = animation_speed,
      repeat_count = 60,
    }),
    util.sprite_load("__base__/graphics/entity/oil-refinery/" .. direction .. "/oil-refinery-anim-" .. direction .. "-1",
    {
      scale = 0.5,
      animation_speed = animation_speed,
      frame_count = 40,
      frame_sequence =
      {
        1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
        21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,
        20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1
      }
    })
  }
  for i = 2, anim_amount, 1 do
    layers[2 + i] = util.sprite_load("__base__/graphics/entity/oil-refinery/" .. direction .. "/oil-refinery-anim-" .. direction .. "-".. i,
    {
      scale = 0.5,
      animation_speed = animation_speed,
      frame_count = 20,
      repeat_count = 3,
    })
  end

  return
  {
    layers = layers
  }
end


local function smoke(direction)
  return
    util.sprite_load("__base__/graphics/entity/oil-refinery/" .. direction .. "/oil-refinery-smoke-" .. direction,
    {
      scale = 0.5,
      animation_speed = animation_speed,
      frame_count = 20,
      repeat_count = 3,
      allow_reducing_frames = true,
    })
end

local function lights(direction)
  return
    util.sprite_load("__base__/graphics/entity/oil-refinery/" .. direction .. "/oil-refinery-lights-" .. direction,
    {
      blend_mode = "additive",
      draw_as_glow = true,
      scale = 0.5,
      frame_count = 1,
      animation_speed = animation_speed,
      repeat_count = 60,
    })
end

local function fluid(direction, anim_amount)
  local layers = {}
  for i = 1, anim_amount, 1 do
    layers[i] = util.sprite_load("__base__/graphics/entity/oil-refinery/" .. direction .. "/oil-refinery-fluid-" .. direction .. "-" .. i,
    {
      scale = 0.5,
      animation_speed = animation_speed,
      tint_as_overlay = true,
      frame_count = 20,
      repeat_count = 3,
      allow_reducing_frames = true,
    })
  end
  return
  {
    layers = layers
  }
    
end

return
{
    animation =
    {
      north =  refinery_direction("north", 6),
      east =  refinery_direction("east", 6),
      south =  refinery_direction("south", 5),
      west =  refinery_direction("west", 7),
    },
    working_visualisations =
    {
      {
        always_draw = true,
        fadeout = true,
        apply_recipe_tint = "primary",
        north_animation = fluid("north", 6),
        east_animation = fluid("east", 5),
        south_animation = fluid("south", 5),
        west_animation = fluid("west", 7),
      },
      --[[{
        always_draw = true,
        fadeout = true,
        apply_recipe_tint = "secondary",
        north_animation = fluid("north", 2),
        east_animation = fluid("east", 2),
        south_animation = fluid("south", 2),
        west_animation = fluid("west", 2),
      },]]--
      {
        fadeout = true,
        constant_speed = true,
        north_animation = smoke("north"),
        east_animation = smoke("east"),
        south_animation = smoke("south"),
        west_animation = smoke("west"),
      },
      {
        effect = "flicker",
        fadeout = true,
        north_animation = lights("north"),
        east_animation = lights("east"),
        south_animation = lights("south"),
        west_animation = lights("west"),
      },
      {
        fadeout = true,
        constant_speed = true,
        north_position = util.by_pixel(-47, -105.0),
        east_position = util.by_pixel(14.0, -126.5),
        south_position = util.by_pixel(45.5, -83),
        west_position = util.by_pixel(-15.5, -61.5),
        animation = util.sprite_load("__base__/graphics/entity/oil-refinery/oil-refinery-fire-smoke",
        {
          scale = 0.5,
          animation_speed = animation_speed,
          frame_count = 20,
          allow_reducing_frames = true,
        })
      },
      {
        fadeout = true,
        constant_speed = true,
        north_position = util.by_pixel(-47, -105.0),
        east_position = util.by_pixel(14.0, -126.5),
        south_position = util.by_pixel(45.5, -83),
        west_position = util.by_pixel(-15.5, -61.5),
        animation = util.sprite_load("__base__/graphics/entity/oil-refinery/oil-refinery-fire-light",
        {
          scale = 0.5,
          blend_mode = "additive",
          draw_as_glow = true,
          animation_speed = animation_speed,
          frame_count = 20,
          allow_reducing_frames = true,
        })
      }
    }
}
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local smoke_offset_x = -1
local smoke_offset_y = -100

-- extra graphics added in space-age
local cargo_pod_catalogue =
{
  -- POD
  {
    index = procession_graphic_catalogue_types.pod_base_shadowed,
    sprite = util.sprite_load("__space-age__/graphics/entity/cargo-pod/pod-static-attached",
      {
        priority = "medium",
        scale = 0.5,
      })
  },
  -- IMPOSTOR
  {
    index = procession_graphic_catalogue_types.impostor_opening_base,
    sprite = util.sprite_load("__space-age__/graphics/entity/cargo-pod/rocket-opening-base",
    {
      scale = 0.5,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    })
  },
  {
    index = procession_graphic_catalogue_types.impostor_opening_back,
    animation = util.sprite_load("__space-age__/graphics/entity/cargo-pod/rocket-opening-back",
    {
      scale = 0.5,
      frame_count = 20,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    })
  },
  {
    index = procession_graphic_catalogue_types.impostor_opening_front,
    animation = util.sprite_load("__space-age__/graphics/entity/cargo-pod/rocket-opening-front",
    {
      scale = 0.5,
      frame_count = 20,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    })
  },
  {
    index = procession_graphic_catalogue_types.impostor_bb_emission_back,
    animation = util.sprite_load("__space-age__/graphics/entity/cargo-pod/rocket-backblast-back",
    {
      scale = 0.5,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
      draw_as_glow = true,
      blend_mode = "additive",
      shift = util.by_pixel(0, -16)
    })
  },
  {
    index = procession_graphic_catalogue_types.impostor_bb_emission_front,
    animation = util.sprite_load("__space-age__/graphics/entity/cargo-pod/rocket-backblast-front",
    {
      scale = 0.5,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
      draw_as_glow = true,
      blend_mode = "additive",
      shift = util.by_pixel(0, -16)
    })
  },
  {
    index = procession_graphic_catalogue_types.impostor_emission_2,
    sprite =
    util.sprite_load("__base__/graphics/entity/rocket-silo/rocket-static-emission",
        {
          scale = 0.5,
          priority = "no-atlas",
          flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
          draw_as_glow = true,
          blend_mode = "additive",
          shift = util.by_pixel(0, -16)
        })
  },
  {
    index = procession_graphic_catalogue_types.impostor_emission_1,
    sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/03-rocket-over-glare.png",
      blend_mode = "additive",
      draw_as_glow = true,
      width = 481,
      height = 481,
      shift = util.by_pixel(-2, -2+282-65),
      flags = { "linear-magnification", "linear-minification" }
    }
  },
  {
    index = procession_graphic_catalogue_types.impostor_emission_3,
    animation =
    util.sprite_load("__base__/graphics/entity/rocket-silo/rocket-jet",
    {
      priority = "medium",
      blend_mode = "additive",
      draw_as_glow = true,
      frame_count = 8,
      animation_speed = 0.5,
      scale = 0.5,
      shift = util.by_pixel(0, -16)
    })
  },
  {
    index = procession_graphic_catalogue_types.impostor_smoke_1,
    animation =
    { -- smoke top 1
      filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
      priority = "medium",
      tint = {0.8, 0.8, 1, 0.8 },
      width = 80,
      height = 286,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5/2*1.3,
      shift = util.by_pixel(smoke_offset_x-66, smoke_offset_y+238)
    }
  },
  {
    index = procession_graphic_catalogue_types.impostor_smoke_2,
    animation =
    { -- smoke top 2
      filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
      priority = "medium",
      tint = {0.8, 0.8, 1, 0.8 },
      width = 80,
      height = 286,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5/2*1.3,
      shift = util.by_pixel(smoke_offset_x+17, smoke_offset_y+271)
    }
  },
  {
    index = procession_graphic_catalogue_types.impostor_smoke_3,
    animation =
    { -- smoke top 3
      filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
      priority = "medium",
      tint = {0.8, 0.8, 1, 0.8 },
      width = 80,
      height = 286,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5/2*1.3,
      shift = util.by_pixel(smoke_offset_x+48, smoke_offset_y+258)
    }
  },
  {
    index = procession_graphic_catalogue_types.impostor_smoke_4,
    animation =
    { -- smoke bottom 1
      filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
      priority = "medium",
      tint = {0.8, 0.8, 1, 0.8 },
      width = 80,
      height = 286,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5/2*1.3,
      shift = util.by_pixel(smoke_offset_x-69, smoke_offset_y+211)
    }
  },
  {
    index = procession_graphic_catalogue_types.impostor_smoke_5,
    animation =
    { -- smoke bottom 2
      filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
      priority = "medium",
      tint = {0.8, 0.8, 1, 0.8 },
      width = 80,
      height = 286,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5/2*1.3,
      shift = util.by_pixel(smoke_offset_x+62, smoke_offset_y+213)
    }
  }
}
return cargo_pod_catalogue

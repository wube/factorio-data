local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")
return
{
  -- CLOUDS
  {
    index = procession_graphic_catalogue.planet_cloudscape,
    type = "sprite",
    sprite = {
      filename = "__space-age__/graphics/procession/clouds/aquilo-cloudscape.png",
      width = 960,
      height = 960,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    }
  },
  {
    index = procession_graphic_catalogue.planet_cloudscape_mask,
    type = "sprite",
    sprite = {
      filename = "__space-age__/graphics/procession/clouds/mask-cloudscape.png",
      width = 960,
      height = 960,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    }
  },

  {
    index = procession_graphic_catalogue.planet_cloudscape_lvl0,
    type = "sprite",
    sprite = {
      filename = "__space-age__/graphics/procession/clouds/aquilo-cloudscape-layered-0.png",
      width = 2000,
      height = 1500,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    }
  },
  {
    index = procession_graphic_catalogue.planet_cloudscape_lvl0_mask,
    type = "sprite",
    sprite = {
      filename = "__space-age__/graphics/procession/clouds/mask-cloudscape-layered-0.png",
      width = 2000,
      height = 1500,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    }
  },

  {
    index = procession_graphic_catalogue.planet_cloudscape_lvl1,
    type = "sprite",
    sprite = {
      filename = "__space-age__/graphics/procession/clouds/aquilo-cloudscape-layered-1.png",
      width = 1600,
      height = 1200,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    }
  },
  {
    index = procession_graphic_catalogue.planet_cloudscape_lvl1_mask,
    type = "sprite",
    sprite = {
      filename = "__space-age__/graphics/procession/clouds/mask-cloudscape-layered-1.png",
      width = 1600,
      height = 1200,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    }
  },


  {
    index = procession_graphic_catalogue.planet_cloudscape_lvl2,
    type = "sprite",
    sprite = {
      filename = "__space-age__/graphics/procession/clouds/aquilo-cloudscape-layered-2.png",
      width = 1400,
      height = 1050,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    }
  },
  {
    index = procession_graphic_catalogue.planet_cloudscape_lvl2_mask,
    type = "sprite",
    sprite = {
      filename = "__space-age__/graphics/procession/clouds/mask-cloudscape-layered-2.png",
      width = 1400,
      height = 1050,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    }
  },

  {
    index = procession_graphic_catalogue.planet_cloudscape_lvl3,
    type = "sprite",
    sprite = {
      filename = "__space-age__/graphics/procession/clouds/aquilo-cloudscape-layered-3.png",
      width = 1200,
      height = 900,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    }
  },
  {
    index = procession_graphic_catalogue.planet_cloudscape_lvl3_mask,
    type = "sprite",
    sprite = {
      filename = "__space-age__/graphics/procession/clouds/mask-cloudscape-layered-3.png",
      width = 1200,
      height = 900,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    }
  },

  --SPACE
  {
    index = procession_graphic_catalogue.planet_stars_background,
    type = "sprite",
    sprite = {
      filename = "__space-age__/graphics/procession/space-rear-star.png",
      width = 1024,
      height = 1024,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    }
  },
  {
    index = procession_graphic_catalogue.planet_tint,
    type = "sprite",
    sprite = {
      filename = "__space-age__/graphics/procession/clouds/aquilo-sky-tint.png",
      width = 16,
      height = 16,
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    }
  },

-- Hatches
{
  index = procession_graphic_catalogue.hatch_emission_bay,
  sprite = util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/shared-cargo-bay-pod-emission",{
    priority = "medium",
    draw_as_glow = true,
    blend_mode = "additive",
    scale = 0.5,
    shift = util.by_pixel(10.24, 48)   --32 x ({-0.32, -1.5})
   }) 
},
{
  index = procession_graphic_catalogue.hatch_emission_out_1,
  sprite = util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/platform-lower-hatch-pod-emission-A",
  {
    priority = "medium",
    draw_as_glow = true,
    blend_mode = "additive",
    scale = 0.5,
    shift = util.by_pixel(56, -16) --32 x ({-1.75, 0} + {0, 0.5})
  })
},
{
  index = procession_graphic_catalogue.hatch_emission_out_2,
  sprite = util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/platform-lower-hatch-pod-emission-B",
  {
    priority = "medium",
    draw_as_glow = true,
    blend_mode = "additive",
    scale = 0.5,
    shift = util.by_pixel(16, -32) --32 x ({-0.5, 0.5} + {0, 0.5})
  })
},
{
  index = procession_graphic_catalogue.hatch_emission_out_3,
  sprite = util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/platform-lower-hatch-pod-emission-C",
  {
    priority = "medium",
    draw_as_glow = true,
    blend_mode = "additive",
    scale = 0.5,
    shift = util.by_pixel(64, -48) --32 x ({-2, 1} + {0, 0.5})
  })
},
{
  index = procession_graphic_catalogue.hatch_emission_in_1,
  sprite = util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/platform-upper-hatch-pod-emission-A",
  {
    priority = "medium",
    draw_as_glow = true,
    blend_mode = "additive",     
    scale = 0.5,
    shift = util.by_pixel(-16, 96) --32 x ({0.5, -3.5} + {0, 0.5})
  })
},
{
  index = procession_graphic_catalogue.hatch_emission_in_2,
  sprite = util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/platform-upper-hatch-pod-emission-B",
  {
    priority = "medium",
    draw_as_glow = true,
    blend_mode = "additive",     
    scale = 0.5,
    shift = util.by_pixel(-64, 96) --32 x ({2, -3.5} + {0, 0.5})
  })
},
{
  index = procession_graphic_catalogue.hatch_emission_in_3,
  sprite = util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/platform-upper-hatch-pod-emission-C",
  {
    priority = "medium",
    draw_as_glow = true,
    blend_mode = "additive",     
    scale = 0.5,
    shift = util.by_pixel(-40, 64) --32 x ({1.25, -2.5} + {0, 0.5})
  })
},
{
  index = procession_graphic_catalogue.planet_hatch_emission_in_1,
  sprite = util.sprite_load("__base__/graphics/entity/cargo-hubs/hatches/planet-lower-hatch-pod-emission-A",
  {
    priority = "medium",
    draw_as_glow = true,
    blend_mode = "additive",     
    scale = 0.5,
    shift = util.by_pixel(-16, 96) --32 x ({0.5, -3.5} + {0, 0.5})
  })
},
{
  index = procession_graphic_catalogue.planet_hatch_emission_in_2,
  sprite = util.sprite_load("__base__/graphics/entity/cargo-hubs/hatches/planet-lower-hatch-pod-emission-B",
  {
    priority = "medium",
    draw_as_glow = true,
    blend_mode = "additive",     
    scale = 0.5,
    shift = util.by_pixel(-64, 96) --32 x ({2, -3.5} + {0, 0.5})
  })
},
{
  index = procession_graphic_catalogue.planet_hatch_emission_in_3,
  sprite = util.sprite_load("__base__/graphics/entity/cargo-hubs/hatches/planet-lower-hatch-pod-emission-C",
  {
    priority = "medium",
    draw_as_glow = true,
    blend_mode = "additive",     
    scale = 0.5,
    shift = util.by_pixel(-40, 64) --32 x ({1.25, -2.5} + {0, 0.5})
  })
}
}
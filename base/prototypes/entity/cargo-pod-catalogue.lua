local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local cargo_pod_catalogue =
{
  -- POD
  {
    index = procession_graphic_catalogue_types.pod_base,
    sprite = util.sprite_load("__base__/graphics/entity/cargo-pod/pod-static-detached",
      {
        priority = "medium",
        scale = 0.5,
      })
  },
  {
    index = procession_graphic_catalogue_types.pod_base_emission,
    type = "sprite",
    sprite = util.sprite_load("__base__/graphics/entity/cargo-pod/pod-static-emission",
      {
        priority = "medium",
        scale = 0.5,
        blend_mode = "additive"
      })
  },
  {
    index = procession_graphic_catalogue_types.pod_open,
    sprite = util.sprite_load("__base__/graphics/entity/cargo-pod/pod-static-open",
      {
        priority = "medium",
        scale = 0.5,
      })
  },
  {
    index = procession_graphic_catalogue_types.pod_open_emission,
    sprite = util.sprite_load("__base__/graphics/entity/cargo-pod/pod-static-open-emission",
      {
        priority = "medium",
        blend_mode = "additive",
        scale = 0.5,
      })
  },
  {
    index = procession_graphic_catalogue_types.pod_shadow,
    sprite = util.sprite_load("__base__/graphics/entity/cargo-pod/pod-static-shadow",
      {
        priority = "medium",
        scale = 0.5,
      })
  },
  -- POD Animated
  {
    index = procession_graphic_catalogue_types.pod_anim_opening,
    animation = util.sprite_load("__base__/graphics/entity/cargo-pod/pod-opening",
      {
        priority = "medium",
        scale = 0.5,
        frame_count = 34
      })
  },
  {
    index = procession_graphic_catalogue_types.pod_anim_opening_emission,
    animation = util.sprite_load("__base__/graphics/entity/cargo-pod/pod-opening-emission",
      {
        priority = "medium",
        scale = 0.5,
        blend_mode = "additive",
        frame_count = 34
      })
  },
  {
    index = procession_graphic_catalogue_types.pod_anim_landing,
    animation = util.sprite_load("__base__/graphics/entity/cargo-pod/pod-landing",
      {
        priority = "medium",
        scale = 0.5,
        frame_count = 13
      })
  },
  {
    index = procession_graphic_catalogue_types.pod_anim_landing_emission,
    animation = util.sprite_load("__base__/graphics/entity/cargo-pod/pod-open-landing-emission",
      {
        priority = "medium",
        scale = 0.5,
        blend_mode = "additive",
        frame_count = 13
      })
  },
  {
    index = procession_graphic_catalogue_types.pod_anim_rotation_closed,
    animation = util.sprite_load("__base__/graphics/entity/cargo-pod/pod-closed-rotation",
       {
         priority = "medium",
         scale = 0.5,
         frame_count = 59
       })
   },
   {
    index = procession_graphic_catalogue_types.pod_anim_rotation_closed_emission,
    animation = util.sprite_load("__base__/graphics/entity/cargo-pod/pod-closed-rotation-emission",
       {
         priority = "medium",
         scale = 0.5,
         blend_mode = "additive",
         frame_count = 59
       })
   },
   {
    index = procession_graphic_catalogue_types.pod_anim_rotation_open,
    animation = util.sprite_load("__base__/graphics/entity/cargo-pod/pod-open-rotation",
       {
         priority = "medium",
         scale = 0.5,
         frame_count = 60
       })
   },
   {
    index = procession_graphic_catalogue_types.pod_anim_rotation_open_emission,
    animation = util.sprite_load("__base__/graphics/entity/cargo-pod/pod-open-rotation-emission",
       {
         priority = "medium",
         scale = 0.5,
         blend_mode = "additive",
         frame_count = 60
       })
   },
  -- POD Thrusters
  {
    index = procession_graphic_catalogue_types.thruster_flames_loop,
    type = "sprite",
    animation = util.sprite_load("__base__/graphics/entity/cargo-pod/pod-thruster-loop",
    {
      animation_speed = 0.5,
      scale = 0.25,
      frame_count = 10,
      draw_as_glow = true,
      shift = util.by_pixel(0, 64),
      blend_mode = "additive",
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    })
  },
  {
    index = procession_graphic_catalogue_types.thruster_flames_start,
    type = "sprite",
    animation = util.sprite_load("__base__/graphics/entity/cargo-pod/pod-thruster-ignition",
    {
      animation_speed = 0.5,
      scale = 0.25,
      frame_count = 10,
      draw_as_glow = true,
      shift = util.by_pixel(0, 64),
      blend_mode = "additive",
      priority = "no-atlas",
      flags = { "group=effect-texture", "linear-minification", "linear-magnification" },
    })
  },
  {
    index = procession_graphic_catalogue_types.reentry_flames,
    animation = util.sprite_load("__base__/graphics/entity/cargo-pod/pod-open-reentry-flame",
    {
      priority = "medium",
      scale = 0.5,
      animation_speed = 0.5,
      draw_as_glow = true,
      blend_mode = "additive",
      frame_count = 30
    })
  }
}
return cargo_pod_catalogue

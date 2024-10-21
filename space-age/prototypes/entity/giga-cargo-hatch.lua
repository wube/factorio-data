local sounds = require ("__base__.prototypes.entity.sounds")

local function placeholder_platform_upper_hatch_animation_back()
  return
  {
    layers =
    {
    util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/platform-upper-hatch-back",
      {
        scale = 0.5,
        shift = {0, -0.5},
        run_mode = "forward",
        frame_count = 20
      }),
    util.sprite_load("__base__/graphics/entity/cargo-hubs/hatches/shared-upper-hatch-shadow",
      {
        scale = 0.5,
        shift = {4,-0.5}, --util.by_pixel(128, 0)
        run_mode = "forward",
        draw_as_shadow = true,
        frame_count = 20
      }),
    util.sprite_load("__base__/graphics/entity/cargo-hubs/hatches/shared-upper-back-hatch-emission",
      {
        scale = 0.5,
        shift = {0, -0.5},
        run_mode = "forward",
        draw_as_glow = true,
        blend_mode = "additive",
        frame_count = 20
      }),
    util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/platform-upper-front-hatch-emission",
      {
        scale = 0.5,
        shift = {0, -0.5},
        run_mode = "forward",
        draw_as_glow = true,
        blend_mode = "additive",
        frame_count = 3,
        frame_sequence = {1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3}
      })
    }

  }
end
local function placeholder_platform_upper_hatch_animation_front()
  return
  {
    layers =
    {
    util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/platform-upper-hatch-front",
      {
        scale = 0.5,
        shift = {0, -0.5},
        run_mode = "forward",
        frame_count = 20
      }),
    }
  }
end

local function placeholder_lower_upper_hatch_animation_back()
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/platform-lower-hatch-front-r",
      {
        scale = 0.5,
        shift = {0, -1},
        run_mode = "forward",
        frame_count = 20
      }),
      util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/platform-lower-hatch-emission",
      {
        scale = 0.5,
        shift = {0, -1},
        run_mode = "forward",
        draw_as_glow = true,
        blend_mode = "additive",
        frame_count = 3,
        frame_sequence = {1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3}
      })
    }
  }
end
local function placeholder_lower_upper_hatch_animation_front()
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/platform-lower-hatch-front",
        {
          scale = 0.5,
          shift = {0, -1},
          run_mode = "forward",
          frame_count = 20
        })
    }
  }
end

function platform_upper_giga_hatch(covered)
  return
  {
    hatch_graphics_back = placeholder_platform_upper_hatch_animation_back(),
    hatch_render_layer_back = "above-inserters",
    hatch_graphics_front = placeholder_platform_upper_hatch_animation_front(),
    hatch_render_layer_front = "above-inserters",
    covered_hatches = covered,
    opening_sound = sounds.upper_giga_hatch_opening_sound,
    closing_sound = sounds.upper_giga_hatch_closing_sound,
  }
end

function platform_lower_giga_hatch(covered)
  return
  {
    hatch_graphics_back = placeholder_lower_upper_hatch_animation_back(),
    hatch_render_layer_back = "cargo-hatch",
    hatch_graphics_front = placeholder_lower_upper_hatch_animation_front(),
    hatch_render_layer_front = "cargo-hatch",
    covered_hatches = covered,
    opening_sound = sounds.lower_giga_hatch_opening_sound,
    closing_sound = sounds.lower_giga_hatch_closing_sound,
  }
end

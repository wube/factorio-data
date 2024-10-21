local sounds = require("__base__.prototypes.entity.sounds")
local particle_animations = require("__space-age__/prototypes/particle-animations")

particle_animations.get_railgun_shell_particle = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/railgun-shell-particle/railgun-shell.png",
      width = 42,
      height = 40,
      shift = util.by_pixel( 1.0, -1.5),
      line_length = 12,
      frame_count = 12,
      variation_count = 4,
      animation_speed = 1,
      scale = 0.5
    }
  }
end

particle_animations.get_old_tungsten_ore_particle_pictures = function(options)
  return
  {
    {
      filename = "__space-age__/graphics/particle/tungsten-ore-particle/tungsten-ore-particle-1.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__space-age__/graphics/particle/tungsten-ore-particle/tungsten-ore-particle-2.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__space-age__/graphics/particle/tungsten-ore-particle/tungsten-ore-particle-3.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__space-age__/graphics/particle/tungsten-ore-particle/tungsten-ore-particle-4.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    }
  }
end

particle_animations.get_old_calcite_particle_pictures = function(options)
  return
  {
    {
      filename = "__space-age__/graphics/particle/calcite-particle/calcite-particle-1.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__space-age__/graphics/particle/calcite-particle/calcite-particle-2.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__space-age__/graphics/particle/calcite-particle/calcite-particle-3.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__space-age__/graphics/particle/calcite-particle/calcite-particle-4.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    }
  }
end

particle_animations.get_old_holmium_ore_particle_pictures = function(options)
  return
  {
    {
      filename = "__space-age__/graphics/particle/holmium-ore-particle/holmium-ore-particle-1.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__space-age__/graphics/particle/holmium-ore-particle/holmium-ore-particle-2.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__space-age__/graphics/particle/holmium-ore-particle/holmium-ore-particle-3.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__space-age__/graphics/particle/holmium-ore-particle/holmium-ore-particle-4.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    }
  }
end

local default_smoke_trigger_effect = function()
  return
  {
    type = "create-trivial-smoke",
    smoke_name = "smoke-explosion-particle",
    starting_frame_deviation = 5,
    offset_deviation = {{-0.06, -0.06}, {0.06, 0.06}},
    speed_from_center = 0.007
  }
end

local tiny_smoke_trigger_effect = function()
  return
  {
    type = "create-trivial-smoke",
    smoke_name = "smoke-explosion-particle-tiny",
    starting_frame_deviation = 0,
    offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
    speed_from_center = nil
  }
end

local small_smoke_trigger_effect = function()
  return
  {
    type = "create-trivial-smoke",
    smoke_name = "smoke-explosion-particle-small",
    starting_frame_deviation = 0,
    offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
    speed_from_center = nil
  }
end

local small_lower_smoke_trigger_effect = function()
  return
  {
    type = "create-trivial-smoke",
    smoke_name = "smoke-explosion-lower-particle-small",
    starting_frame_deviation = 0,
    offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
    speed_from_center = nil
  }
end

local small_dust_smoke_trigger_effect = function()
  return
  {
    type = "create-trivial-smoke",
    smoke_name = "smoke-explosion-particle-stone-small",
    starting_frame_deviation = 0,
    offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
    speed_from_center = nil
  }
end

local eruption_smoke_trigger_effect = function()
  return
  {
    type = "create-trivial-smoke",
    smoke_name = "vulcanus-smoke-explosion-particle-small",
    --repeat_count = 2,
    starting_frame_deviation = 0,
    offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
    speed_from_center = nil
  }
end

local particle_counter = 0

local default_ended_in_lava_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "vulcanus-blood-particle-lower-layer-small",
      --apply_tile_tint = "secondary",
      offset_deviation = { { -0.05, -0.05 }, { 0.05, 0.05 } },
      initial_height = 0,
      initial_height_deviation = 0.02,
      initial_vertical_speed = 0.05,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.06,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 2,
      tail_length_deviation = 1,
      tail_width = 3,
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 6,
      probability = 0.03,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "vulcanus-blood-particle-lower-layer-small",
      --apply_tile_tint = "primary",
      offsets =
      {
        { 0, 0 },
        { 0.01563, -0.09375 },
        { 0.0625, 0.09375 },
        { -0.1094, 0.0625 }
      },
      offset_deviation = { { -0.2969, -0.1992 }, { 0.2969, 0.1992 } },
      initial_height = 0,
      initial_height_deviation = 0.02,
      initial_vertical_speed = 0.053,
      initial_vertical_speed_deviation = 0.005,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.006,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 9,
      tail_length_deviation = 0.5,
      tail_width = 4
    },
    {
      type = "play-sound",
      sound = sounds.small_splash,
      probability = 0.01
    }
  }
end

local default_ended_in_water_trigger_effect = function()
  return
  {

    {
      type = "create-particle",
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tintable-water-particle",
      apply_tile_tint = "secondary",
      offset_deviation = { { -0.05, -0.05 }, { 0.05, 0.05 } },
      initial_height = 0,
      initial_height_deviation = 0.02,
      initial_vertical_speed = 0.05,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.006,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 2,
      tail_length_deviation = 1,
      tail_width = 3
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 6,
      probability = 0.03,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tintable-water-particle",
      apply_tile_tint = "primary",
      offsets =
      {
        { 0, 0 },
        { 0.01563, -0.09375 },
        { 0.0625, 0.09375 },
        { -0.1094, 0.0625 }
      },
      offset_deviation = { { -0.2969, -0.1992 }, { 0.2969, 0.1992 } },
      initial_height = 0,
      initial_height_deviation = 0.02,
      initial_vertical_speed = 0.053,
      initial_vertical_speed_deviation = 0.005,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.006,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 9,
      tail_length_deviation = 0,
      tail_width = 1
    },
    {
      type = "play-sound",
      sound = sounds.small_splash
    }
  }

end

local particle_ended_in_water_trigger_effect = function()
  return
  {
    type = "create-particle",
    repeat_count = 5,
    repeat_count_deviation = 4,
    probability = 0.2,
    affects_target = false,
    show_in_tooltip = false,
    particle_name = "tintable-water-particle",
    apply_tile_tint = "secondary",
    offsets = { { 0, 0 } },
    offset_deviation = { { -0.2969, -0.2969 }, { 0.2969, 0.2969 } },
    tile_collision_mask = nil,
    initial_height = 0.1,
    initial_height_deviation = 0.5,
    initial_vertical_speed = 0.06,
    initial_vertical_speed_deviation = 0.069,
    speed_from_center = 0.02,
    speed_from_center_deviation = 0.05,
    frame_speed = 1,
    frame_speed_deviation = 0,
    tail_length = 9,
    tail_length_deviation = 8,
    tail_width = 1
  }
end

local make_particle = function(params)

  if not params then error("No params given to make_particle function") end
  local name = params.name or error("No name given")

  local ended_in_water_trigger_effect = params.ended_in_water_trigger_effect or default_ended_in_water_trigger_effect()
  if params.ended_in_water_trigger_effect == false then
    ended_in_water_trigger_effect = nil
  end

  local particle =
  {

    type = "optimized-particle",
    name = name,

    life_time = params.life_time or (60 * 15),
    fade_away_duration = params.fade_away_duration,

    render_layer = params.render_layer or "projectile",
    render_layer_when_on_ground = params.render_layer_when_on_ground or "corpse",

    regular_trigger_effect_frequency = params.regular_trigger_effect_frequency or 2,
    regular_trigger_effect = params.regular_trigger_effect,
    ended_in_water_trigger_effect = ended_in_water_trigger_effect,

    pictures = params.pictures,
    shadows = params.shadows,
    draw_shadow_when_on_ground = params.draw_shadow_when_on_ground,

    movement_modifier_when_on_ground = params.movement_modifier_when_on_ground,
    movement_modifier = params.movement_modifier,
    vertical_acceleration = params.vertical_acceleration,

    mining_particle_frame_speed = params.mining_particle_frame_speed,

  }

  return particle

end


local particles =
{

  make_particle
  {
    name = "turbo-splitter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.454, 0.804, 0.298, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },
  make_particle
  {
    name = "turbo-splitter-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.454, 0.804, 0.298, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "turbo-underground-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.497, 0.827, 0.310, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "turbo-underground-belt-metal-particle-medium-green",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.4235, 0.827, 0.310, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },
  make_particle
  {
    name = "turbo-transport-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.2, 0.816, 0.24, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "turbo-transport-belt-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {0.859, 0.766, 0.680, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },
  make_particle
  {
    name = "turbo-transport-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.2, 0.816, 0.24, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tungsten-ore-particle",
    life_time = 180,
    pictures = particle_animations.get_old_tungsten_ore_particle_pictures(),
    shadows = particle_animations.get_old_stone_particle_shadow_pictures()
  },
  make_particle
  {
    name = "calcite-particle",
    life_time = 180,
    pictures = particle_animations.get_old_calcite_particle_pictures(),
    shadows = particle_animations.get_old_stone_particle_shadow_pictures()
  },
  make_particle
  {
    name = "scrap-particle",
    life_time = 180,
    pictures = particle_animations.get_old_holmium_ore_particle_pictures(),
    shadows = particle_animations.get_old_stone_particle_shadow_pictures()
  },

  make_particle
  {
    name = "foundry-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.606, 0.408, 0.512, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "foundry-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.5, 0.5, 0.5, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "foundry-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.65, 0.40, 0.35, 1}}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "electromagnetic-plant-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.225, 0.329, 0.511, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electromagnetic-plant-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.5, 0.5, 0.5, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "electromagnetic-plant-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.225, 0.329, 0.511, 1}}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "cryogenic-plant-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.275, 0.429, 0.411, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "cryogenic-plant-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.5, 0.5, 0.5, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "cryogenic-plant-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.275, 0.429, 0.411, 1}}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },
  make_particle
  {
    name = "biolab-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.6, 0.6, 0.6, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "biolab-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.6, 0.6, 0.6, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "biolab-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.6, 0.6, 0.6, 1}}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },
  make_particle
  {
    name = "fusion-reactor-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.34, 0.40, 0.411, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fusion-reactor-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.5, 0.5, 0.5, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "fusion-reactor-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.34, 0.40, 0.411, 1}}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "heating-tower-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.50, 0.43, 0.47, 1}}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "heating-tower-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.50, 0.43, 0.47, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "railgun-shell-particle",
    pictures = particle_animations.get_railgun_shell_particle({}),
    shadows = particle_animations.get_railgun_shell_particle({ tint = shadowtint(), shift = util.by_pixel (2.5,-0.25)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    movement_modifier_when_on_ground = 0.85,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  --asteroid-chunk-particle
  make_particle
  {
    name = "carbonic-asteroid-chunk-particle-small",
    pictures = particle_animations.get_carbonic_asteroid_particle_small_pictures(),
    shadows = particle_animations.get_carbonic_asteroid_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },
  make_particle
  {
    name = "metallic-asteroid-chunk-particle-small",
    life_time = 25,
    pictures = particle_animations.get_metallic_asteroid_particle_small_pictures(),
    shadows = particle_animations.get_metallic_asteroid_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },
  make_particle
  {
    name = "oxide-asteroid-chunk-particle-small",
    life_time = 25,
    pictures = particle_animations.get_oxide_asteroid_particle_small_pictures(),
    shadows = particle_animations.get_oxide_asteroid_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },
  make_particle
  {
    name = "promethium-asteroid-chunk-particle-small",
    life_time = 25,
    pictures = particle_animations.get_promethium_asteroid_particle_small_pictures(),
    shadows = particle_animations.get_promethium_asteroid_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },
  --
  make_particle
  {
    name = "carbonic-asteroid-chunk-particle-medium",
    pictures = particle_animations.get_carbonic_asteroid_particle_medium_pictures(),
    shadows = particle_animations.get_carbonic_asteroid_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
  },
  make_particle
  {
    name = "metallic-asteroid-chunk-particle-medium",
    life_time = 45,
    pictures = particle_animations.get_metallic_asteroid_particle_medium_pictures(),
    shadows = particle_animations.get_metallic_asteroid_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },
  make_particle
  {
    name = "oxide-asteroid-chunk-particle-medium",
    life_time = 45,
    pictures = particle_animations.get_oxide_asteroid_particle_medium_pictures(),
    shadows = particle_animations.get_oxide_asteroid_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },
  make_particle
  {
    name = "promethium-asteroid-chunk-particle-medium",
    life_time = 45,
    pictures = particle_animations.get_promethium_asteroid_particle_medium_pictures ({}),
    shadows = particle_animations.get_promethium_asteroid_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  --top-asteroid-particle
  -------------------------------------------------------------------------------
  make_particle
  {
    name = "carbonic-asteroid-particle-top-small",
    life_time = 82,
    pictures = particle_animations.get_carbonic_asteroid_particle_top_small_pictures(),
    shadows = particle_animations.get_carbonic_asteroid_particle_top_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "air-object",
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },
  make_particle
  {
    name = "carbonic-asteroid-particle-top-big",
    life_time = 78,
    pictures = particle_animations.get_carbonic_asteroid_particle_top_big_pictures(),
    shadows = particle_animations.get_carbonic_asteroid_particle_top_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "air-object",
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },
  make_particle
  {
    name = "carbonic-asteroid-particle-top-huge",
    life_time = 64,
    pictures = particle_animations.get_carbonic_asteroid_particle_top_big_pictures({scale = 1}),
    shadows = particle_animations.get_carbonic_asteroid_particle_top_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "air-object",
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },
  make_particle
  {
    name = "metallic-asteroid-particle-top-small",
    life_time = 82,
    pictures = particle_animations.get_metallic_asteroid_particle_top_small_pictures(),
    shadows = particle_animations.get_metallic_asteroid_particle_top_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "air-object",
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "metallic-asteroid-particle-top-big",
    life_time = 78,
    pictures = particle_animations.get_metallic_asteroid_particle_top_big_pictures(),
    shadows = particle_animations.get_metallic_asteroid_particle_top_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "air-object",
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "metallic-asteroid-particle-top-huge",
    life_time = 64,
    pictures = particle_animations.get_metallic_asteroid_particle_top_big_pictures({scale = 1}),
    shadows = particle_animations.get_metallic_asteroid_particle_top_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "air-object",
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "oxide-asteroid-particle-top-small",
    life_time = 82,
    pictures = particle_animations.get_oxide_asteroid_particle_top_small_pictures(),
    shadows = particle_animations.get_oxide_asteroid_particle_top_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "air-object",
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "oxide-asteroid-particle-top-big",
    life_time = 78,
    pictures = particle_animations.get_oxide_asteroid_particle_top_big_pictures(),
    shadows = particle_animations.get_oxide_asteroid_particle_top_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "air-object",
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "oxide-asteroid-particle-top-huge",
    life_time = 64,
    pictures = particle_animations.get_oxide_asteroid_particle_top_big_pictures({scale = 1}),
    shadows = particle_animations.get_oxide_asteroid_particle_top_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "air-object",
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "promethium-asteroid-particle-top-small",
    life_time = 82,
    pictures = particle_animations.get_promethium_asteroid_particle_top_small_pictures({ }),
    shadows = particle_animations.get_promethium_asteroid_particle_top_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "air-object",
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "promethium-asteroid-particle-top-big",
    life_time = 78,
    pictures = particle_animations.get_promethium_asteroid_particle_top_big_pictures({}),
    shadows = particle_animations.get_promethium_asteroid_particle_top_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "air-object",
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "promethium-asteroid-particle-top-huge",
    life_time = 64,
    pictures = particle_animations.get_promethium_asteroid_particle_top_big_pictures({scale = 1}),
    shadows = particle_animations.get_promethium_asteroid_particle_top_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "air-object",
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },
  --small-asteroid-particle
  -------------------------------------------------------------------------------
  make_particle
  {
    name = "carbonic-asteroid-particle-small",
    life_time = 120,
    pictures = particle_animations.get_carbonic_asteroid_particle_small_pictures(),
    shadows = particle_animations.get_carbonic_asteroid_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "metallic-asteroid-particle-small",
    life_time = 120,
    pictures = particle_animations.get_metallic_asteroid_particle_small_pictures(),
    shadows = particle_animations.get_metallic_asteroid_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "oxide-asteroid-particle-small",
    life_time = 120,
    pictures = particle_animations.get_oxide_asteroid_particle_small_pictures(),
    shadows = particle_animations.get_oxide_asteroid_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "promethium-asteroid-particle-small",
    life_time = 120,
    pictures = particle_animations.get_promethium_asteroid_particle_small_pictures ({}),
    shadows = particle_animations.get_promethium_asteroid_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  --medium-asteroid-particle
  -------------------------------------------------------------------------------
  make_particle
  {
    name = "carbonic-asteroid-particle-medium",
    life_time = 200,
    pictures = particle_animations.get_carbonic_asteroid_particle_medium_pictures(),
    shadows = particle_animations.get_carbonic_asteroid_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1

  },
  make_particle
  {
    name = "metallic-asteroid-particle-medium",
    life_time = 200,
    pictures = particle_animations.get_metallic_asteroid_particle_medium_pictures(),
    shadows = particle_animations.get_metallic_asteroid_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },
  make_particle
  {
    name = "oxide-asteroid-particle-medium",
    life_time = 200,
    pictures = particle_animations.get_oxide_asteroid_particle_medium_pictures(),
    shadows = particle_animations.get_oxide_asteroid_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },
  make_particle
  {
    name = "promethium-asteroid-particle-medium",
    life_time = 200,
    pictures = particle_animations.get_promethium_asteroid_particle_medium_pictures ({}),
    shadows = particle_animations.get_promethium_asteroid_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  --big-asteroid-particle
  -------------------------------------------------------------------------------
  make_particle
  {
    name = "carbonic-asteroid-particle-big",
    life_time = 160,
    pictures = particle_animations.get_carbonic_asteroid_particle_big_pictures(),
    shadows = particle_animations.get_carbonic_asteroid_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "metallic-asteroid-particle-big",
    life_time = 160,
    pictures = particle_animations.get_metallic_asteroid_particle_big_pictures(),
    shadows = particle_animations.get_metallic_asteroid_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "oxide-asteroid-particle-big",
    life_time = 160,
    pictures = particle_animations.get_oxide_asteroid_particle_big_pictures(),
    shadows = particle_animations.get_oxide_asteroid_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "promethium-asteroid-particle-big",
    life_time = 160,
    pictures = particle_animations.get_promethium_asteroid_particle_big_pictures ({}),
    shadows = particle_animations.get_promethium_asteroid_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "fulgora-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.75, 0.4, 0.35, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "fulgora-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.75, 0.4, 0.35, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "fulgora-stone-particle-big",
    pictures = particle_animations.get_stone_particle_big_pictures ({ tint = {0.75, 0.4, 0.35, 1}}),
    shadows = particle_animations.get_stone_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  ---vulcanus-stone-particles

  make_particle
  {
    name = "vulcanus-stone-particle-small",
    life_time = 150,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.28, 0.28, 0.28, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_lava_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    render_layer = "object"
  },

  make_particle
  {
    name = "vulcanus-stone-particle-medium",
    life_time = 150,
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.28, 0.28, 0.28, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_lava_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    render_layer = "object"
  },

  make_particle
  {
    name = "vulcanus-stone-particle-big",
    life_time = 150,
    pictures = particle_animations.get_stone_particle_big_pictures ({ tint = {0.28, 0.28, 0.28, 1}}),
    shadows = particle_animations.get_stone_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_lava_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    render_layer = "object"
  },
  make_particle
  {
    name = "vulcanus-stone-particle-smoke-small",
    life_time = 200,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.15, 0.15, 0.15, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = eruption_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_lava_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    render_layer = "object",
  },

  make_particle
  {
    name = "vulcanus-stone-particle-smoke-medium",
    life_time = 200,
    pictures = particle_animations.get_stone_particle_medium_pictures({ tint ={0.08, 0.08, 0.08, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = eruption_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_lava_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    render_layer = "object",
  },

  make_particle
  {
    name = "vulcanus-stone-particle-smoke-big",
    life_time = 200,
    pictures = particle_animations.get_stone_particle_big_pictures ({ tint ={0.08, 0.08, 0.08, 1}}),
    shadows = particle_animations.get_stone_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = eruption_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_lava_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    render_layer = "object",
  },
  
  make_particle
  {
    name = "vulcanus-lava-particle-long-life-small",
    life_time = 300,
    pictures = particle_animations.get_lava_particle_small_pictures({ tint ={0.08, 0.08, 0.08, 1}}),
    shadows = particle_animations.get_lava_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_lava_trigger_effect(),
    movement_modifier_when_on_ground = 0,
    render_layer_when_on_ground = "lower-object-above-shadow",
    render_layer = "elevated-object"
  },

  make_particle
  {
    name = "vulcanus-lava-particle-long-life-big",
    life_time = 200,
    pictures = particle_animations.get_lava_particle_big_pictures({ tint ={0.08, 0.08, 0.08, 1}}),
    shadows = particle_animations.get_lava_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_lava_trigger_effect(),
    movement_modifier_when_on_ground = 0,
    render_layer_when_on_ground = "lower-object-above-shadow",
    render_layer = "elevated-higher-object"
  },

  make_particle
  {
      name = "demolisher-skin-particle-small", 
      life_time = 300,
      pictures = particle_animations.get_demolisher_skin_particles_small(),
      shadows = particle_animations.get_demolisher_skin_particles_small({ tint = shadowtint(), shift = util.by_pixel(1, 0)}),
      ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
      render_layer_when_on_ground = "lower-object-above-shadow"
  },
  make_particle
  {
      name = "demolisher-skin-particle-medium", 
      life_time = 250,
      pictures = particle_animations.get_demolisher_skin_particles_medium(),
      shadows = particle_animations.get_demolisher_skin_particles_medium({ tint = shadowtint(), shift = util.by_pixel(1, 0)}),
      ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
      render_layer_when_on_ground = "lower-object-above-shadow"
  },
  make_particle
  {
      name = "demolisher-skin-particle-big",  
      life_time = 200,
      pictures = particle_animations.get_demolisher_skin_particles_big(),
      shadows = particle_animations.get_demolisher_skin_particles_big({ tint = shadowtint(), shift = util.by_pixel(1, 0)}),
      ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
      render_layer_when_on_ground = "lower-object-above-shadow"
  },
  make_particle
  {
      name = "demolisher-shell-particle-small", 
      life_time = 70,
      pictures = particle_animations.get_demolisher_shell_particles_small(),
      shadows = particle_animations.get_demolisher_shell_particles_small({ tint = shadowtint(), shift = util.by_pixel(1, 0)}),
      ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
      render_layer_when_on_ground = "lower-object-above-shadow"
  },
  make_particle
  {
      name = "demolisher-shell-particle-big",  
      life_time = 60,
      pictures = particle_animations.get_demolisher_shell_particles_big(),
      shadows = particle_animations.get_demolisher_shell_particles_big({ tint = shadowtint(), shift = util.by_pixel(1, 0)}),
      ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
      render_layer_when_on_ground = "lower-object-above-shadow"
  }

}

data:extend(particles)


local blood_particles = {
  "blood-particle-small",
  "blood-particle",
  "blood-particle-lower-layer",
  "blood-particle-carpet",
  "blood-particle-lower-layer-small",
  "blood-particle-carpet-small"
}

for _, particle_name in ipairs(blood_particles) do
  local new_particle = table.deepcopy(data.raw["optimized-particle"][particle_name])
  local scale = new_particle.pictures.sheet.scale
  local shift = new_particle.pictures.sheet.shift
  new_particle.name = "gleba-" .. particle_name
  new_particle.pictures =
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/gleba-blood-particle/gleba-blood-particle.png",
      line_length = 12,
      width = 32,
      height = 24,
      frame_count = 12,
      variation_count = 7,
      scale = scale,
      shift = shift
    }
  }
  data:extend({new_particle})
end

local lava_particles = {
  "blood-particle-small",
  "blood-particle",
  "blood-particle-lower-layer",
  "blood-particle-carpet",
  "blood-particle-lower-layer-small",
  "blood-particle-carpet-small"
}

-- Create and add lava particles based on blood particles
local lava_particles = {}

for _, particle_name in ipairs(blood_particles) do
  local new_particle = table.deepcopy(data.raw["optimized-particle"][particle_name])
  local scale = new_particle.pictures.sheet.scale
  local shift = new_particle.pictures.sheet.shift
  new_particle.name = "vulcanus-" .. particle_name
  new_particle.pictures =
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/lava-particle/vulcanus-lava-particle.png",
      line_length = 12,
      width = 32,
      height = 24,
      frame_count = 12,
      variation_count = 7,
      scale = scale,
      shift = shift,
      -- render_layer = "object"
    }
  }
  table.insert(lava_particles, new_particle)
end

data:extend(lava_particles)

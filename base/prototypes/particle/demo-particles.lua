local particle_animations = require("prototypes/particle/demo-particle-animations")
local sounds = require("prototypes.entity.demo-sounds")

local default_smoke_trigger_effect = function()
  return
  {
    type = "create-trivial-smoke",
    smoke_name = "smoke-explosion-particle",
    starting_frame_deviation = 5,
    starting_frame_speed_deviation = 5,
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
    starting_frame_speed_deviation = 0,
    offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
    speed_from_center = nil,
  }
end

local small_smoke_trigger_effect = function()
  return
  {
    type = "create-trivial-smoke",
    smoke_name = "smoke-explosion-particle-small",
    starting_frame_deviation = 0,
    starting_frame_speed_deviation = 0,
    offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
    speed_from_center = nil,
  }
end

local small_lower_smoke_trigger_effect = function()
  return
  {
    type = "create-trivial-smoke",
    smoke_name = "smoke-explosion-lower-particle-small",
    starting_frame_deviation = 0,
    starting_frame_speed_deviation = 0,
    offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
    speed_from_center = nil,
  }
end

local small_dust_smoke_trigger_effect = function()
  return
  {
    type = "create-trivial-smoke",
    smoke_name = "smoke-explosion-particle-stone-small",
    starting_frame_deviation = 0,
    starting_frame_speed_deviation = 0,
    offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
    speed_from_center = nil,
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
      particle_name = "deep-water-particle",
      offset_deviation = { { -0.05, -0.05 }, { 0.05, 0.05 } },
      tile_collision_mask = nil,
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
      particle_name = "water-particle",
      offsets =
      {
        { 0, 0 },
        { 0.01563, -0.09375 },
        { 0.0625, 0.09375 },
        { -0.1094, 0.0625 }
      },
      offset_deviation = { { -0.2969, -0.1992 }, { 0.2969, 0.1992 } },
      tile_collision_mask = nil,
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
      sound = sounds.small_splash,
    },
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
    particle_name = "deep-water-particle",
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

    life_time = params.life_time or 60 * 15,
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

function bloodtint()
return {r = 172, g = 51, b = 204}
end

function shadowtint()
return {r = 0, g = 0, b = 0}
end

function bloodparticlescale()
  return 0.5
end

function watertint()
  return {r = 0.1, g = 0.6, b = 0.85}
end

function waterparticlescale()
  return 1
end

local particles =
{
  make_particle
  {
    name = "iron-ore-particle",
    life_time = 180,
    pictures = particle_animations.get_iron_particle_pictures(),
    shadows = particle_animations.get_iron_particle_shadow_pictures()
  },
  make_particle
  {
    name = "copper-ore-particle",
    life_time = 180,
    pictures = particle_animations.get_copper_particle_pictures(),
    shadows = particle_animations.get_copper_particle_shadow_pictures()
  },

  make_particle
  {
    name = "guts-entrails-particle-small-medium",
    pictures = particle_animations.get_guts_and_entrails_particle_small_medium_pictures({}),
    shadows = particle_animations.get_guts_and_entrails_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "guts-entrails-particle-big",
    pictures = particle_animations.get_guts_and_entrails_particle_big_pictures({}),
    shadows = particle_animations.get_guts_and_entrails_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "cable-and-electronics-particle-small-medium",
    pictures = particle_animations.get_cable_and_electronic_particle_small_medium_pictures({}),
    shadows = particle_animations.get_cable_and_electronic_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-particle-big",
    pictures = particle_animations.get_stone_particle_big_pictures({}),
    shadows = particle_animations.get_stone_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-particle",
    life_time = 180,
    pictures = particle_animations.get_old_stone_particle_pictures(),
    shadows = particle_animations.get_old_stone_particle_shadow_pictures()
  },
  make_particle
  {
    name = "coal-particle",
    life_time = 180,
    pictures = particle_animations.get_coal_particle_pictures(),
    shadows = particle_animations.get_coal_particle_shadow_pictures()
  },

  make_particle
  {
    name = "glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures({}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "vegetation-character-particle-small-medium",
    life_time = 20,
    pictures = particle_animations.get_vegetation_particle_character_pictures ({ tint = { r = 1.000, g = 0.976, b = 0.306, a = 1.000 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-3-vegetation-character-particle-small-medium",
    life_time = 20,
    pictures = particle_animations.get_vegetation_particle_character_pictures ({ tint = { r = 0.867, g = 0.845, b = 0.265, a = 1.000 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-3-vegetation-vehicle-particle-small-medium",
    life_time = 30,
    pictures = particle_animations.get_vegetation_particle_character_pictures ({ tint = { r = 0.867, g = 0.845, b = 0.265, a = 1.000 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "vegetation-vehicle-particle-small-medium",
    life_time = 35,
    pictures = particle_animations.get_vegetation_particle_vehicle_pictures ({ tint = { r = 1.000, g = 0.976, b = 0.306, a = 1.000 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow",
  },

  make_particle
  {
    name = "brown-hairy-grass-vegetation-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = { r = 0.722, g = 0.354, b = 0.192, a = 1.000 }}),
    shadows = particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow",
  },

  make_particle
  {
    name = "brown-hairy-grass-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.369, g = 0.174, b = 0.088, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "green-hairy-grass-vegetation-particle-small-medium",
    render_layer_when_on_ground = "lower-object-above-shadow",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = { r = 0.891, g = 0.898, b = 0.282, a = 1.000 }}),
    shadows = particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95
  },

  make_particle
  {
    name = "green-hairy-grass-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.283, g = 0.341, b = 0.079, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "green-carpet-grass-vegetation-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = { r = 0.891, g = 0.898, b = 0.282, a = 1.000 }}),
    shadows =particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow",
  },

  make_particle
  {
    name = "green-carpet-grass-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.283, g = 0.341, b = 0.079, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "green-small-grass-vegetation-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = { r = 0.773, g = 0.933, b = 0.216, a = 1.000 }}),
    shadows =particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow",
  },

  make_particle
  {
    name = "green-small-grass-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.283, g = 0.341, b = 0.079, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "brown-carpet-grass-vegetation-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = { r = 0.886, g = 0.549, b = 0.400, a = 1.000 }}),
    shadows =particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-carpet-grass-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.424, g = 0.208, b = 0.113, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "green-asterisk-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = { r = 0.479, g = 0.627, b = 0.221, a = 1.000 }}),
    shadows = particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "green-asterisk-grass-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = { r = 0.479, g = 0.627, b = 0.221, a = 1.000 }}),
    shadows =particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow",
  },

  make_particle
  {
    name = "green-asterisk-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.312, g = 0.408, b = 0.144, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "brown-asterisk-mini-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = { r = 0.788, g = 0.736, b = 0.158, a = 1.000 }}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-asterisk-mini-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.373, g = 0.231, b = 0.125, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "green-asterisk-mini-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = { r = 0.443, g = 0.733, b = 0.354, a = 1.000 }}),
    shadows = particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "green-asterisk-mini-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.373, g = 0.231, b = 0.125, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "brown-asterisk-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = { r = 1.000, g = 0.830, b = 0.647, a = 1.000 }}),
    shadows = particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-asterisk-vegetation-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = { r = 1.000, g = 0.830, b = 0.647, a = 1.000 }}),
    shadows = particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-asterisk-grass-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = { r = 0.788, g = 0.736, b = 0.158, a = 1.000 }}),
    shadows = particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-asterisk-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.373, g = 0.231, b = 0.125, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "red-asterisk-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = { r = 0.588, g = 0.443, b = 0.272, a = 1.000 }}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow",
  },

  make_particle
  {
    name = "deep-water-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures ({ tint = { r = 0.230, g = 0.341, b = 0.337, a = 0.314 }}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0
  },

  make_particle
  {
    name = "red-asterisk-grass-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = { r = 0.718, g = 0.541, b = 0.332, a = 1.000 }}),
    shadows =particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-asterisk-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.424, g = 0.322, b = 0.196, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "green-pita-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = { r = 0.769, g = 0.894, b = 0.589, a = 1.000 }}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "green-croton-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = { r = 0.788, g = 0.760, b = 0.303, a = 1.000 }}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow",
  },

  make_particle
  {
    name = "green-croton-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.396, g = 0.290, b = 0.188, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95
  },

  make_particle
  {
    name = "red-croton-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = { r = 0.890, g = 0.410, b = 0.262, a = 1.000 }}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow",
  },

  make_particle
  {
    name = "red-croton-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.286, g = 0.230, b = 0.131, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95
  },

  make_particle
  {
    name = "green-pita-mini-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = { r = 0.769, g = 0.894, b = 0.589, a = 1.000 }}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-fluff-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = { r = 0.373, g = 0.231, b = 0.125, a = 1.000 }}),
    shadows = particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-fluff-dry-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = { r = 0.373, g = 0.231, b = 0.125, a = 1.000 }}),
    shadows = particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-fluff-dry-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.373, g = 0.231, b = 0.125, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "red-pita-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = { r = 0.780, g = 0.390, b = 0.217, a = 1.000 }}),
    shadows = particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "green-desert-bush-vegetation-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = { r = 0.758, g = 0.769, b = 0.464, a = 1.000 }}),
    shadows =particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "green-bush-mini-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = { r = 0.604, g = 0.730, b = 0.243, a = 1.000 }}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-bush-vegetation-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = { r = 0.655, g = 0.441, b = 0.211, a = 1.000 }}),
    shadows =particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow",
  },

  make_particle
  {
    name = "white-desert-bush-vegetation-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = { r = 0.651, g = 0.539, b = 0.419, a = 1.000 }}),
    shadows =particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "garballo-mini-dry-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = { r = 0.631, g = 0.517, b = 0.243, a = 1.000 }}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "garballo-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = { r = 0.392, g = 0.459, b = 0.086, a = 1.000 }}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "lichen-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = { r = 0.412, g = 0.424, b = 0.188, a = 1.000 }}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "wooden-chest-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({tint = {r = 1.000, g = 0.804, b = 0.463, a = 1.000}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wooden-chest-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures ({tint = {r = 0.855, g = 0.687, b = 0.396, a = 1.000}}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "transport-belt-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures ({tint = {r = 0.416, g = 0.378, b = 0.341, a = 1.000}}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "transport-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.898, g = 0.659, b = 0.031, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "transport-belt-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {r = 0.715, g = 0.715, b = 0.715, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-transport-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.886, g = 0.090, b = 0.024, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-transport-belt-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-transport-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.024, g = 0.596, b = 0.816, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-transport-belt-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "transport-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.898, g = 0.659, b = 0.031, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-transport-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.886, g = 0.090, b = 0.024, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-transport-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.024, g = 0.596, b = 0.816, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-electric-pole-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({tint = {r = 0.694, g = 0.486, b = 0.289, a = 1.000}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-electric-pole-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({tint = {r = 0.610, g = 0.427, b = 0.258, a = 1.000}}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "programmable-speaker-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({tint = {r = 0.595, g = 0.525, b = 0.445, a = 1.000}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "programmable-speaker-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({tint = {r = 0.895, g = 0.786, b = 0.659, a = 1.000}}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "rail-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({tint = {r = 0.843, g = 0.701, b = 0.378, a = 1.000}}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "rail-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({tint = {r = 0.815, g = 0.815, b = 0.815, a = 1.000}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rock-damage-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.776, g = 0.612, b = 0.466, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rock-damage-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.776, g = 0.612, b = 0.466, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rock-damage-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.776, g = 0.612, b = 0.466, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.749, g = 0.749, b = 0.749, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "sand-1-dust-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.933, g = 0.717, b = 0.436, a = 1.000 }}),  --({ tint = { r = 0.443, g = 0.333, b = 0.189, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    fade_away_duration = 40,
    render_layer = "lower-object",
  },

  make_particle
  {
    name = "sand-1-dust-vehicle-particle",
    life_time = 20,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.443, g = 0.333, b = 0.189, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "sand-1-dust-tank-front-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.443, g = 0.333, b = 0.189, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

  make_particle
  {
    name = "sand-2-dust-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.824, g = 0.594, b = 0.323, a = 1.000 }}),  --({ tint = { r = 0.427, g = 0.306, b = 0.163, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    fade_away_duration = 40,
    render_layer = "lower-object",
  },

  make_particle
  {
    name = "sand-2-dust-vehicle-particle",
    life_time = 20,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.427, g = 0.306, b = 0.163, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

  make_particle
  {
    name = "sand-2-dust-tank-front-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 1.000, g = 0.730, b = 0.412, a = 1.000 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
  },

  make_particle
  {
    name = "sand-3-dust-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.867, g = 0.658, b = 0.360, a = 1.000 }}),    --({ tint = { r = 0.427, g = 0.316, b = 0.158, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
    fade_away_duration = 40
  },

  make_particle
  {
    name = "sand-3-dust-vehicle-particle",
    life_time = 20,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.427, g = 0.316, b = 0.158, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

  make_particle
  {
    name = "sand-3-dust-tank-front-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.427, g = 0.316, b = 0.158, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

  make_particle
  {
    name = "red-desert-0-dust-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.776, g = 0.530, b = 0.265, a = 1.000 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    fade_away_duration = 40,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

  make_particle
  {
    name = "brown-dust-vehicle-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.616, g = 0.409, b = 0.208, a = 1.000 }}), --({ tint = { r = 0.329, g = 0.225, b = 0.112, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    fade_away_duration = 30,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

  make_particle
  {
    name = "red-desert-0-dust-vehicle-particle",
    life_time = 20,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.616, g = 0.409, b = 0.208, a = 1.000 }}), --({ tint = { r = 0.329, g = 0.225, b = 0.112, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "red-desert-0-dust-tank-front-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.329, g = 0.225, b = 0.112, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

  make_particle
  {
    name = "red-desert-1-dust-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.863, g = 0.589, b = 0.294, a = 1.000 }}),   --({ tint = { r = 0.373, g = 0.254, b = 0.127, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    fade_away_duration = 40,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "red-desert-1-dust-tank-front-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.373, g = 0.254, b = 0.127, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "red-desert-1-dust-vehicle-particle",
    life_time = 20,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.373, g = 0.254, b = 0.127, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "red-desert-2-dust-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.878, g = 0.613, b = 0.327, a = 1.000 }}),    --({ tint = { r = 0.380, g = 0.260, b = 0.130, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    fade_away_duration = 40,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "red-desert-2-dust-vehicle-particle",
    life_time = 20,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.380, g = 0.260, b = 0.130, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "red-desert-2-dust-tank-front-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.380, g = 0.260, b = 0.130, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "red-desert-3-dust-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.788, g = 0.590, b = 0.334, a = 1.000 }}),     --({ tint = { r = 0.392, g = 0.280, b = 0.134, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    fade_away_duration = 40,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "red-desert-3-dust-vehicle-particle",
    life_time = 20,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.392, g = 0.280, b = 0.134, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "red-desert-3-dust-tank-front-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.392, g = 0.280, b = 0.134, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "dirt-1-dust-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.957, g = 0.712, b = 0.394, a = 1.000 }}),     --({ tint = { r = 0.408, g = 0.307, b = 0.176, a = 0.502 }}), --({ tint = { r = 0.424, g = 0.319, b = 0.183, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    fade_away_duration = 40,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

    make_particle
  {
    name = "dirt-1-dust-vehicle-particle",
    life_time = 20,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.424, g = 0.319, b = 0.183, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

    make_particle
  {
    name = "dirt-1-dust-tank-front-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.424, g = 0.319, b = 0.183, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

  make_particle
  {
    name = "dirt-2-dust-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.867, g = 0.624, b = 0.364, a = 1.000 }}),    --({ tint = { r = 0.392, g = 0.277, b = 0.154, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    fade_away_duration = 40,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

    make_particle
  {
    name = "dirt-2-dust-vehicle-particle",
    life_time = 20,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.392, g = 0.277, b = 0.154, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

    make_particle
  {
    name = "dirt-2-dust-tank-front-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.392, g = 0.277, b = 0.154, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

    make_particle
  {
    name = "dirt-3-dust-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 1.000, g = 0.706, b = 0.420, a = 1.000 }}),  --({ tint = { r = 0.396, g = 0.273, b = 0.152, a = 0.502 }}),   --({ tint = { r = 0.671, g = 0.462, b = 0.258, a = 1.000 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    fade_away_duration = 40,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

    make_particle
  {
    name = "dirt-3-dust-vehicle-particle",
    life_time = 20,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.396, g = 0.273, b = 0.152, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

    make_particle
  {
    name = "dirt-3-dust-tank-front-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.396, g = 0.273, b = 0.152, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
  },

  make_particle
  {
    name = "dirt-4-dust-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.894, g = 0.603, b = 0.319, a = 1.000 }}),  --({ tint = { r = 0.329, g = 0.222, b = 0.118, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
    fade_away_duration = 40
  },

  make_particle
  {
    name = "dirt-4-dust-vehicle-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 20,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.329, g = 0.222, b = 0.118, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
  },

  make_particle
  {
    name = "dirt-4-dust-tank-front-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.329, g = 0.222, b = 0.118, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
  },

  make_particle
  {
    name = "dirt-5-dust-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.812, g = 0.544, b = 0.306, a = 1.000 }}),   --({ tint = { r = 0.329, g = 0.221, b = 0.124, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
    fade_away_duration = 40
  },

  make_particle
  {
    name = "dirt-5-dust-vehicle-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 20,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.329, g = 0.221, b = 0.124, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
  },

  make_particle
  {
    name = "dirt-5-dust-tank-front-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.329, g = 0.221, b = 0.124, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
  },

  make_particle
  {
    name = "dirt-6-dust-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.800, g = 0.536, b = 0.301, a = 1.000 }}), --({ tint = { r = 0.286, g = 0.192, b = 0.108, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
    fade_away_duration = 40
  },

  make_particle
  {
    name = "dirt-6-dust-vehicle-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 20,
    life_time_deviation = 5,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.835, g = 0.560, b = 0.314, a = 1.000 }}), --({ tint = { r = 0.286, g = 0.192, b = 0.108, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
    fade_away_duration = 40
  },

  make_particle
  {
    name = "dirt-6-dust-tank-front-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 5,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.286, g = 0.192, b = 0.108, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
  },

  make_particle
  {
    name = "dirt-7-dust-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.749, g = 0.502, b = 0.282, a = 1.000 }}),    --({ tint = { r = 0.294, g = 0.197, b = 0.111, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
    fade_away_duration = 40
  },

  make_particle
  {
    name = "dirt-7-dust-vehicle-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 20,
    life_time_deviation = 5,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.294, g = 0.197, b = 0.111, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
  },

  make_particle
  {
    name = "dirt-7-dust-tank-front-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 5,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.294, g = 0.197, b = 0.111, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
  },

  make_particle
  {
    name = "dry-dirt-dust-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.722, g = 0.483, b = 0.272, a = 1.000 }}),  --({ tint = { r = 0.337, g = 0.226, b = 0.127, a = 1.000 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
    fade_away_duration = 40
  },

  make_particle
  {
    name = "dry-dirt-dust-vehicle-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 20,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.337, g = 0.226, b = 0.127, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
  },

  make_particle
  {
    name = "dry-dirt-dust-tank-front-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.337, g = 0.226, b = 0.127, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
  },

  make_particle
  {
    name = "landfill-dust-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.549, g = 0.393, b = 0.254, a = 1.000 }}),  
    shadows = nil,
    ended_in_water_trigger_effect = nil,
    fade_away_duration = 30,
  },

  make_particle
  {
    name = "landfill-dust-vehicle-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 20,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.235, g = 0.168, b = 0.109, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
  },

  make_particle
  {
    name = "landfill-dust-tank-front-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.235, g = 0.168, b = 0.109, a = 0.502 }}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

  make_particle
  {
    name = "nuclear-ground-dust-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.294, g = 0.237, b = 0.186, a = 1.000 }}), 
    shadows = nil,
    ended_in_water_trigger_effect = nil,
    fade_away_duration = 30,
  },

  make_particle
  {
    name = "nuclear-ground-dust-vehicle-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 20,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.157, g = 0.125, b = 0.097, a = 0.502 }}), 
    shadows = nil,
    ended_in_water_trigger_effect = nil,
  },

  make_particle
  {
    name = "nuclear-ground-dust-tank-front-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = { r = 0.157, g = 0.125, b = 0.097, a = 0.502 }}), 
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object",
  },

  make_particle
  {
    name = "deep-water-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures ({ tint = { r = 0.226, g = 0.341, b = 0.337, a = 0.314 }}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0
  },

  make_particle
  {
    name = "deep-water-lower-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures ({ tint = { r = 0.226, g = 0.341, b = 0.337, a = 0.314 }}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "deep-green-water-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures ({ tint = { r = 0.173, g = 0.243, b = 0.116, a = 0.196 }}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0
  },

  make_particle
  {
    name = "deep-green-water-lower-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures ({ tint = { r = 0.145, g = 0.224, b = 0.082, a = 0.196 }}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "deep-green-water-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures ({tint = { r = 0.145, g = 0.220, b = 0.082, a = 0.196 }}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "water-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures ({ tint = { r = 0.272, g = 0.406, b = 0.402, a = 0.314 }}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
  },

 make_particle
  {
    name = "water-lower-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures ({ tint = { r = 0.272, g = 0.406, b = 0.402, a = 0.314 }}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "green-water-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures ({ tint = { r = 0.278, g = 0.396, b = 0.272, a = 0.314 }}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
  },

  make_particle
  {
    name = "green-water-lower-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures ({ tint = { r = 0.278, g = 0.396, b = 0.272, a = 0.314 }}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "shallow-water-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures ({ tint = { r = 0.194, g = 0.360, b = 0.396, a = 0.314 }}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
  },

  make_particle
  {
    name = "shallow-water-lower-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures ({ tint = { r = 0.194, g = 0.360, b = 0.396, a = 0.314 }}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object-above-shadow"
  },

    make_particle
  {
    name = "shallow-water-vehicle-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 180,
    render_layer = "lower-object",
    pictures = particle_animations.get_blood_particle_pictures ({ tint = { r = 0.072, g = 0.278, b = 0.322, a = 0.314 }}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
  },

  make_particle
  {
    name = "shallow-water-2-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures ({ tint = { r = 0.174, g = 0.341, b = 0.376, a = 0.314 }}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
  },

  make_particle
  {
    name = "shallow-water-2-lower-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures ({ tint = { r = 0.174, g = 0.341, b = 0.376, a = 0.314 }}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object-above-shadow"
  },

    make_particle
  {
    name = "shallow-water-2-vehicle-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 180,
    render_layer = "lower-object",
    pictures = particle_animations.get_blood_particle_pictures ({ tint = { r = 0.072, g = 0.278, b = 0.322, a = 0.314 }}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
  },

  make_particle
  {
    name = "dirt-1-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.766, b = 0.490, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-1-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.827, g = 0.634, b = 0.406, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-1-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.827, g = 0.634, b = 0.406, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-1-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.766, b = 0.490, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

    make_particle
  {
    name = "dirt-1-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.827, g = 0.634, b = 0.406, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-1-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.766, b = 0.490, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-1-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.766, b = 0.490, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-2-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.766, b = 0.490, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-2-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.718, g = 0.502, b = 0.286, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-2-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.718, g = 0.502, b = 0.286, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-2-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.766, b = 0.490, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-2-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.718, g = 0.502, b = 0.286, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-2-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.766, b = 0.490, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-2-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.766, b = 0.490, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-3-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.994, g = 0.743, b = 0.448, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-3-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.667, g = 0.463, b = 0.259, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-3-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.667, g = 0.463, b = 0.259, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-3-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.994, g = 0.743, b = 0.448, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-3-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.667, g = 0.463, b = 0.259, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-3-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.994, g = 0.743, b = 0.448, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-3-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.994, g = 0.743, b = 0.448, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-4-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.691, b = 0.416, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-4-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.604, g = 0.420, b = 0.251, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-4-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.604, g = 0.420, b = 0.251, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-4-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.691, b = 0.416, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-4-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.604, g = 0.420, b = 0.251, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-4-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.691, b = 0.416, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-4-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.691, b = 0.416, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "landfill-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.749, g = 0.517, b = 0.311, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "landfill-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.604, g = 0.420, b = 0.251, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "landfill-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.604, g = 0.420, b = 0.251, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "landfill-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.749, g = 0.517, b = 0.311, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "landfill-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.604, g = 0.420, b = 0.251, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "landfill-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.749, g = 0.517, b = 0.311, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "landfill-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.749, g = 0.517, b = 0.311, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "nuclear-ground-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.439, g = 0.349, b = 0.269, a = 1.000 }}), 
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-ground-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.439, g = 0.349, b = 0.269, a = 1.000 }}), 
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "nuclear-ground-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.439, g = 0.349, b = 0.269, a = 1.000 }}), 
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "nuclear-ground-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.439, g = 0.349, b = 0.269, a = 1.000 }}), 
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-ground-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.439, g = 0.349, b = 0.269, a = 1.000 }}), 
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "nuclear-ground-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.439, g = 0.349, b = 0.269, a = 1.000 }}), 
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-ground-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.439, g = 0.349, b = 0.269, a = 1.000 }}), 
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-5-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.691, b = 0.416, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-5-stone-character-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.600, g = 0.416, b = 0.251, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-5-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.600, g = 0.416, b = 0.251, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-5-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.691, b = 0.416, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-5-stone-character-particle-small",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.600, g = 0.416, b = 0.251, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-5-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.600, g = 0.416, b = 0.251, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-5-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.691, b = 0.416, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-5-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.691, b = 0.416, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-6-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.690, b = 0.439, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-6-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.686, g = 0.475, b = 0.302, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-6-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.686, g = 0.475, b = 0.302, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-6-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.690, b = 0.439, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-6-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.686, g = 0.475, b = 0.302, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-6-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.690, b = 0.439, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-6-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.690, b = 0.439, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-7-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.808, g = 0.545, b = 0.310, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-7-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.769, g = 0.518, b = 0.295, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-7-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.769, g = 0.518, b = 0.295, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-7-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.808, g = 0.545, b = 0.310, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-7-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.769, g = 0.518, b = 0.295, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-7-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.808, g = 0.545, b = 0.310, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-7-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.769, g = 0.518, b = 0.295, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dry-dirt-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.660, b = 0.384, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dry-dirt-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.635, g = 0.419, b = 0.244, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dry-dirt-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.635, g = 0.419, b = 0.244, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dry-dirt-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.660, b = 0.384, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dry-dirt-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.635, g = 0.419, b = 0.244, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dry-dirt-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.660, b = 0.384, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dry-dirt-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.660, b = 0.384, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-1-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.899, g = 0.604, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

make_particle
  {
    name = "grass-1-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.899, g = 0.604, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-1-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.899, g = 0.604, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-1-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.899, g = 0.604, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-1-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.899, g = 0.604, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-1-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.899, g = 0.604, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-1-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.899, g = 0.604, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-2-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.827, g = 0.524, b = 0.198, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-2-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.663, g = 0.458, b = 0.166, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-2-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.663, g = 0.458, b = 0.166, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-2-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.827, g = 0.524, b = 0.198, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-2-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.663, g = 0.458, b = 0.166, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-2-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.827, g = 0.524, b = 0.198, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-2-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.827, g = 0.524, b = 0.198, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-3-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.863, g = 0.496, b = 0.352, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-3-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.863, g = 0.496, b = 0.352, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-3-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.863, g = 0.496, b = 0.352, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-3-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.863, g = 0.496, b = 0.352, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-3-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.863, g = 0.496, b = 0.352, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-3-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.863, g = 0.496, b = 0.352, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-3-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.863, g = 0.496, b = 0.352, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-4-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.722, g = 0.537, b = 0.340, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-4-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.722, g = 0.537, b = 0.340, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-4-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.722, g = 0.537, b = 0.340, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-4-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.722, g = 0.537, b = 0.340, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-4-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.722, g = 0.537, b = 0.340, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-4-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.722, g = 0.537, b = 0.340, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

    make_particle
  {
    name = "grass-4-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.722, g = 0.537, b = 0.340, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-0-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.661, b = 0.329, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-0-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.661, b = 0.329, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-0-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.661, b = 0.329, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-0-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.661, b = 0.329, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-0-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.661, b = 0.329, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-0-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.661, b = 0.329, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-0-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.661, b = 0.329, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-1-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-1-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-1-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-1-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-1-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow",
  },

  make_particle
  {
    name = "red-desert-1-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-1-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-2-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-2-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-2-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-2-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-2-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-2-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-2-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-2-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-3-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-3-stone-character-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-3-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-3-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-3-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-3-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-3-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({ tint = { r = 1.000, g = 0.725, b = 0.400, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-1-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-1-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-1-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-1-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-1-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-1-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-1-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-2-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-2-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-2-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-2-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-2-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-2-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-3-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-3-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-3-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-3-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-3-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-3-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.799, b = 0.538, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "concrete-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.829, g = 0.829, b = 0.835, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "concrete-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.829, g = 0.829, b = 0.835, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "concrete-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.829, g = 0.829, b = 0.835, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "concrete-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.829, g = 0.829, b = 0.835, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow",
  },

  make_particle
  {
    name = "hazard-concrete-left-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({ tint = { r = 0.829, g = 0.829, b = 0.835, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-left-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.873, b = 0.431, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-left-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.372, g = 0.420, b = 0.411, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-left-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.873, b = 0.431, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-right-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({ tint = { r = 0.829, g = 0.829, b = 0.835, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-right-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.873, b = 0.431, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-right-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.372, g = 0.420, b = 0.411, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-right-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 1.000, g = 0.873, b = 0.431, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-concrete-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.829, g = 0.829, b = 0.835, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-concrete-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.829, g = 0.829, b = 0.835, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-concrete-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.829, g = 0.829, b = 0.835, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-left-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 1.000, g = 0.873, b = 0.431, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-left-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.873, b = 0.431, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-left-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.372, g = 0.420, b = 0.411, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-right-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.400, g = 0.443, b = 0.443, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-right-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 1.000, g = 0.873, b = 0.431, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-right-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.372, g = 0.420, b = 0.411, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-path-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.890, g = 0.772, b = 0.632, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-path-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.890, g = 0.772, b = 0.632, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-path-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.678, g = 0.702, b = 0.669, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-path-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.678, g = 0.702, b = 0.669, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow",
  },

  make_particle
  {
    name = "tutorial-grid-stone-path-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.801, g = 0.808, b = 0.795, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tutorial-grid-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.801, g = 0.808, b = 0.795, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tutorial-grid-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.801, g = 0.808, b = 0.795, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tutorial-grid-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.801, g = 0.808, b = 0.795, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tutorial-grid-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.801, g = 0.808, b = 0.795, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow",
  },

  make_particle
  {
    name = "lab-tile-2-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.482, g = 0.482, b = 0.482, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-2-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.482, g = 0.482, b = 0.482, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-2-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.482, g = 0.482, b = 0.482, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-2-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.482, g = 0.482, b = 0.482, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "lab-tile-1-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.231, g = 0.231, b = 0.231, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-1-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.231, g = 0.231, b = 0.231, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-1-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.231, g = 0.231, b = 0.231, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-1-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.231, g = 0.231, b = 0.231, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "lab-tile-white-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-white-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-white-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-white-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-white-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow",
  },

  make_particle
  {
    name = "huge-rock-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "huge-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "huge-rock-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "huge-rock-stone-particle-big",
    pictures = particle_animations.get_stone_particle_big_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "big-rock-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "big-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "big-rock-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "big-rock-stone-particle-big",
    pictures = particle_animations.get_stone_particle_big_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "green-pita-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.286, g = 0.230, b = 0.131, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "green-pita-mini-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.286, g = 0.230, b = 0.131, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-pita-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.431, g = 0.305, b = 0.228, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "brown-fluff-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.373, g = 0.231, b = 0.125, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    movement_modifier = 0.95
  },

  make_particle
  {
    name = "green-desert-bush-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.340, g = 0.345, b = 0.208, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    movement_modifier = 0.95,
  },

  make_particle
  {
    name = "red-desert-bush-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.345, g = 0.208, b = 0.078, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "white-desert-bush-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.286, g = 0.230, b = 0.131, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    movement_modifier = 0.8,
  },

  make_particle
  {
    name = "garballo-mini-dry-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.533, g = 0.334, b = 0.119, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    movement_modifier = 0.8,
  },

  make_particle
  {
    name = "garballo-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = { r = 0.427, g = 0.275, b = 0.051, a = 1.000 }}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    movement_modifier = 0.8,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lichen-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.702, g = 0.467, b = 0.459, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
  },

  make_particle
  {
    name = "medium-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "medium-rock-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-rock-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tiny-rock-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-sand-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-sand-rock-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "medium-sand-rock-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "medium-sand-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = { r = 0.686, g = 0.480, b = 0.296, a = 1.000 }}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wooden-particle",
    life_time = 180,
    mining_particle_frame_speed = 1,
    pictures = particle_animations.get_wooden_particle_pictures(),
    shadows = particle_animations.get_wooden_particle_shadow_pictures()
  },
  make_particle
  {
    name = "shell-particle",
    life_time = 600,
    pictures = particle_animations.get_shell_particle_pictures(),
    shadows = particle_animations.get_shell_particle_shadow_pictures(),
    ended_in_water_trigger_effect = particle_ended_in_water_trigger_effect(),
  },

  make_particle
  {
    name = "iron-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.962, g = 0.899, b = 0.857, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "iron-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.962, g = 0.899, b = 0.857, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steel-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.616, g = 0.553, b = 0.663, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steel-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.616, g = 0.553, b = 0.663, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "compilatron-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "compilatron-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.843, g = 0.843, b = 0.843, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "compilatron-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.782, g = 0.782, b = 0.782, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "underground-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.855, g = 0.710, b = 0.362, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "underground-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.844, g = 0.844, b = 0.844, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "underground-belt-metal-particle-medium-yellow",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.855, g = 0.710, b = 0.362, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

 make_particle
  {
    name = "fast-underground-belt-metal-particle-medium-red",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.890, g = 0.275, b = 0.282, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

 make_particle
  {
    name = "express-underground-belt-metal-particle-medium-blue",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.310, g = 0.682, b = 0.827, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-underground-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.701, g = 0.366, b = 0.366, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-underground-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.625, g = 0.598, b = 0.557, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-underground-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.310, g = 0.682, b = 0.827, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-underground-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.676, g = 0.602, b = 0.531, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "splitter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.766, g = 0.635, b = 0.541, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "splitter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 1.000, g = 0.863, b = 0.474, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "splitter-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.764, g = 0.764, b = 0.764, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "splitter-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.827, g = 0.655, b = 0.357, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "splitter-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-splitter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.701, g = 0.366, b = 0.366, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-splitter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.729, g = 0.275, b = 0.267, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "fast-splitter-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.672, g = 0.672, b = 0.672, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-splitter-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.729, g = 0.275, b = 0.267, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "fast-splitter-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-splitter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.832, g = 0.654, b = 0.592, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-splitter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.298, g = 0.671, b = 0.804, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "express-splitter-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.764, g = 0.764, b = 0.764, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-splitter-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.298, g = 0.671, b = 0.804, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "express-splitter-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "burner-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.883, g = 0.786, b = 0.735, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "burner-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.635, g = 0.635, b = 0.635, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "burner-inserter-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({ tint = {r = 0.706, g = 0.706, b = 0.706, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.508, g = 0.423, b = 0.337, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.749, g = 0.491, b = 0.224, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "long-handed-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.727, g = 0.601, b = 0.545, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "long-handed-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.797, g = 0.324, b = 0.324, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "fast-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.500, g = 0.500, b = 0.500, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.308, g = 0.447, b = 0.535, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "filter-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.648, g = 0.648, b = 0.648, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "filter-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.571, g = 0.419, b = 0.594, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "stack-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.508, g = 0.508, b = 0.508, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stack-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.762, g = 0.937, b = 0.495, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "stack-filter-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.590, g = 0.502, b = 0.401, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stack-filter-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.731, g = 0.731, b = 0.731, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "small-electric-pole-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.906, g = 0.906, b = 0.906, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "medium-electric-pole-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.583, g = 0.424, b = 0.269, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "medium-electric-pole-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.910, g = 0.651, b = 0.398, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "big-electric-pole-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.353, g = 0.498, b = 0.553, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "big-electric-pole-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.353, g = 0.498, b = 0.553, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "substation-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.797, g = 0.797, b = 0.797, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "substation-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.639, g = 0.639, b = 0.639, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "substation-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.651, g = 0.533, b = 0.514, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "substation-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.345, g = 0.420, b = 0.490, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "pipe-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pipe-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.810, g = 0.739, b = 0.651, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pipe-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.648, g = 0.555, b = 0.447, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "pipe-to-ground-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.810, g = 0.739, b = 0.651, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pipe-to-ground-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.648, g = 0.555, b = 0.447, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "pump-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pump-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.720, g = 0.626, b = 0.569, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pump-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.720, g = 0.720, b = 0.720, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "pump-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.539, g = 0.458, b = 0.367, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "train-stop-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "train-stop-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.852, g = 0.852, b = 0.852, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect =  nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "train-stop-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.544, g = 0.476, b = 0.443, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "train-stop-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.616, g = 0.616, b = 0.616, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "rail-signal-glass-particle-small-red",
    pictures = particle_animations.get_glass_particle_small_pictures ({tint = {r = 0.645, g = 0.000, b = 0.000, a = 1.000}}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-signal-glass-particle-small-green",
    pictures = particle_animations.get_glass_particle_small_pictures ({tint = {r = 0.141, g = 0.642, b = 0.000, a = 1.000}}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-signal-glass-particle-small-yellow",
    pictures = particle_animations.get_glass_particle_small_pictures ({tint = {r = 0.619, g = 0.642, b = 0.000, a = 1.000}}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-signal-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-signal-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.787, g = 0.787, b = 0.787, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-signal-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.558, g = 0.558, b = 0.558, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "rail-chain-signal-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures ({}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-chain-signal-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.566, g = 0.390, b = 0.390, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-chain-signal-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.725, g = 0.725, b = 0.725, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "locomotive-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.811, g = 0.811, b = 0.811, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "locomotive-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.701, g = 0.598, b = 0.556, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "locomotive-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.515, g = 0.515, b = 0.515, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "locomotive-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {r = 0.631, g = 0.582, b = 0.536, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "cargo-wagon-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.549, g = 0.447, b = 0.322, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "cargo-wagon-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.549, g = 0.447, b = 0.322, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "cargo-wagon-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.491, g = 0.460, b = 0.419, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "fluid-wagon-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures  ({tint = {r = 0.780, g = 0.769, b = 0.753, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fluid-wagon-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.633, g = 0.534, b = 0.459, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "fluid-wagon-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.561, g = 0.561, b = 0.541, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "fluid-wagon-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.459, g = 0.427, b = 0.396, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "artillery-wagon-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.547, g = 0.547, b = 0.547, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "artillery-wagon-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.594, g = 0.594, b = 0.594, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "artillery-wagon-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.408, g = 0.408, b = 0.341, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "artillery-wagon-metal-particle-big-yellow",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.706, g = 0.608, b = 0.024, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "artillery-wagon-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "car-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.699, g = 0.542, b = 0.365, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "car-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.821, g = 0.821, b = 0.821, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "car-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.519, g = 0.519, b = 0.519, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "tank-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.695, g = 0.695, b = 0.695, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tank-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.769, g = 0.630, b = 0.619, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "tank-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.510, g = 0.510, b = 0.510, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "logistic-robot-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.469, g = 0.469, b = 0.469, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "logistic-robot-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.753, g = 0.727, b = 0.687, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "construction-robot-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.847, g = 0.788, b = 0.655, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "construction-robot-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.846, g = 0.788, b = 0.657, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "roboport-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.892, g = 0.807, b = 0.591, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "roboport-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.456, g = 0.622, b = 0.776, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "roboport-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.699, g = 0.699, b = 0.699, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "lamp-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lamp-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.840, g = 0.840, b = 0.840, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "arithmetic-combinator-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.480, g = 0.539, b = 0.606, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "arithmetic-combinator-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.704, g = 0.735, b = 0.772, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "arithmetic-combinator-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.515, g = 0.531, b = 0.552, a = 1.000}}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "decider-combinator-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.627, g = 0.627, b = 0.627, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "decider-combinator-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.819, g = 0.652, b = 0.306, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "decider-combinator-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.624, g = 0.624, b = 0.624, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "constant-combinator-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.614, g = 0.510, b = 0.392, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "constant-combinator-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.721, g = 0.352, b = 0.352, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "constant-combinator-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.399, g = 0.294, b = 0.294, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "power-switch-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.429, g = 0.562, b = 0.678, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "power-switch-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.528, g = 0.528, b = 0.528, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "programmable-speaker-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.599, g = 0.589, b = 0.488, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "boiler-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.787, g = 0.723, b = 0.556, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "boiler-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.553, g = 0.581, b = 0.428, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "boiler-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.577, g = 0.577, b = 0.577, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "steam-engine-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.871, g = 0.746, b = 0.514, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steam-engine-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.888, g = 0.878, b = 0.788, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "steam-engine-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.798, g = 0.786, b = 0.695, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "steam-engine-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {r = 0.715, g = 0.715, b = 0.715, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steam-turbine-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.747, g = 0.596, b = 0.387, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steam-turbine-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.933, g = 0.875, b = 0.635, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "steam-turbine-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.503, g = 0.479, b = 0.377, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "steam-turbine-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {r = 0.715, g = 0.715, b = 0.715, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "solar-panel-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({tint = {r = 0.583, g = 0.887, b = 1.000, a = 1.000}}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "solar-panel-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.709, g = 0.709, b = 0.709, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect =  nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "solar-panel-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.709, g = 0.709, b = 0.709, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "accumulator-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.643, g = 0.698, b = 0.780, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "accumulator-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.643, g = 0.698, b = 0.780, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect (),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "accumulator-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.663, g = 0.663, b = 0.663, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "nuclear-reactor-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({tint = {r = 0.621, g = 1.000, b = 0.570, a = 1.000}}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-reactor-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.898, g = 0.902, b = 0.780, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-reactor-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.705, g = 0.705, b = 0.705, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-reactor-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.898, g = 0.902, b = 0.780, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-reactor-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "spidertron-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({ tint = { r = 1.000, g = 0.094, b = 0.000, a = 1.000 }}), 
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "spidertron-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({ tint = { r = 0.902, g = 0.871, b = 0.855, a = 1.000 }}), 
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "spidertron-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({ tint = { r = 0.654, g = 0.626, b = 0.654, a = 1.000 }}), 
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "spidertron-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({ tint = { r = 0.800, g = 0.614, b = 0.489, a = 1.000 }}),  
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "spidertron-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({ tint = { r = 0.824, g = 0.783, b = 0.839, a = 1.000 }}), 
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "spidertron-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "heat-exchanger-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.743, g = 0.663, b = 0.543, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "heat-exchanger-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.946, g = 1.000, b = 0.895, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "heat-exchanger-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.614, g = 0.644, b = 0.585, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "heat-pipe-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.702, g = 0.702, b = 0.702, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "heat-pipe-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.788, g = 0.586, b = 0.464, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "burner-mining-drill-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "burner-mining-drill-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.667, g = 0.525, b = 0.403, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "burner-mining-drill-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.558, g = 0.558, b = 0.558, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "electric-mining-drill-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({ tint = { r = 0.824, g = 0.783, b = 0.839, a = 1.000 }}), 
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electric-mining-drill-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({ tint = { r = 1.000, g = 0.755, b = 0.369, a = 1.000 }}), 
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electric-mining-drill-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = { r = 0.737, g = 0.812, b = 0.812, a = 1.000 }}), 
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },
  
  make_particle
  {
    name = "electric-mining-drill-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}), -- #dbc3adff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
  },

  make_particle
  {
    name = "burner-mining-drill-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "offshore-pump-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({tint = {r = 1.000, g = 1.000, b = 1.000, a = 1.000}}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "offshore-pump-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({ tint = { r = 0.776, g = 0.600, b = 0.224, a = 1.000 }}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "offshore-pump-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({ tint = { r = 0.600, g = 0.545, b = 0.518, a = 1.000 }}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "offshore-pump-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({ tint = { r = 0.502, g = 0.455, b = 0.435, a = 1.000 }}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "offshore-pump-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pumpjack-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.715, g = 0.586, b = 0.454, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pumpjack-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.380, g = 0.576, b = 0.353, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "pumpjack-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.380, g = 0.576, b = 0.353, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pumpjack-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-furnace-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({tint = {r = 0.614, g = 0.614, b = 0.614, a = 1.000}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "explosion-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures  ({tint = {r = 0.706, g = 0.606, b = 0.509, a = 1.000}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "explosion-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures  ({tint = {r = 0.706, g = 0.606, b = 0.509, a = 1.000}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "explosion-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({tint = {r = 0.706, g = 0.606, b = 0.509, a = 1.000}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-furnace-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({tint = {r = 1.000, g = 0.815, b = 0.000, a = 1.000}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-furnace-stone-particle-big",
    pictures = particle_animations.get_stone_particle_big_pictures({tint = {r = 0.583, g = 0.583, b = 0.583, a = 1.000}}),
    shadows = particle_animations.get_stone_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steel-furnace-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.365, g = 0.365, b = 0.365, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steel-furnace-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.938, g = 0.860, b = 0.680, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "steel-furnace-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({ tint = {r = 0.509, g = 0.509, b = 0.509, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
  },

  make_particle
  {
    name = "electric-furnace-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.396, g = 0.251, b = 0.063, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electric-furnace-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.431, g = 0.490, b = 0.463, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "electric-furnace-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.447, g = 0.490, b = 0.545, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "assembling-machine-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-1-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-1-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.350, g = 0.369, b = 0.332, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-1-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.349, g = 0.369, b = 0.333, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "assembling-machine-2-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.992, g = 0.825, b = 0.637, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-2-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.376, g = 0.463, b = 0.580, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-2-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.376, g = 0.463, b = 0.580, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "assembling-machine-3-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.880, g = 0.733, b = 0.569, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-3-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({ tint = {r = 0.533, g = 0.580, b = 0.384, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-3-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = {r = 0.533, g = 0.580, b = 0.384, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "oil-refinery-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.388, g = 0.380, b = 0.306, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "oil-refinery-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.658, g = 0.659, b = 0.586, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "oil-refinery-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.651, g = 0.620, b = 0.506, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "oil-refinery-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.388, g = 0.380, b = 0.306, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "oil-refinery-metal-particle-big-tint",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.455, g = 0.349, b = 0.204, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "chemical-plant-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "chemical-plant-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.617, g = 0.617, b = 0.617, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "chemical-plant-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.675, g = 0.522, b = 0.204, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "chemical-plant-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.675, g = 0.522, b = 0.204, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "chemical-plant-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {r = 0.715, g = 0.715, b = 0.715, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "centrifuge-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.582, g = 0.582, b = 0.582, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "centrifuge-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({ tint = {r = 0.761, g = 0.757, b = 0.671, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "centrifuge-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = {r = 0.761, g = 0.757, b = 0.671, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "centrifuge-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({ tint = {r = 0.631, g = 0.514, b = 0.086, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "centrifuge-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {r = 0.715, g = 0.715, b = 0.715, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.612, g = 0.612, b = 0.612, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.828, g = 0.821, b = 0.742, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "lab-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.828, g = 0.821, b = 0.742, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {r = 0.715, g = 0.715, b = 0.715, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "beacon-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({ tint = { r = 0.678, g = 0.447, b = 0.314, a = 1.000 }}), 
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "beacon-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({ tint = { r = 0.761, g = 0.699, b = 0.612, a = 1.000 }}),  
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "beacon-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({ tint = { r = 0.859, g = 0.808, b = 0.741, a = 1.000 }}), 
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "damaged-assembling-machine-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-assembling-machine-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.866, g = 0.601, b = 0.504, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-assembling-machine-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.866, g = 0.730, b = 0.403, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-assembling-machine-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.485, g = 0.485, b = 0.485, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "damaged-assembling-machine-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.835, g = 0.835, b = 0.835, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "damaged-assembling-machine-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.835, g = 0.835, b = 0.835, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "repaired-assembling-machine-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-assembling-machine-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.866, g = 0.601, b = 0.504, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-assembling-machine-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.866, g = 0.730, b = 0.403, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-assembling-machine-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.485, g = 0.485, b = 0.485, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "repaired-assembling-machine-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.835, g = 0.835, b = 0.835, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "chest-capsule-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 1.000, g = 0.871, b = 0.424, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "chest-capsule-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 1.000, g = 0.871, b = 0.424, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "chest-capsule-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.667, g = 0.667, b = 0.667, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "electricity-generator-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electricity-generator-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 1.000, g = 0.871, b = 0.424, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electricity-generator-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 1.000, g = 0.871, b = 0.424, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electricity-generator-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.485, g = 0.485, b = 0.485, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "electricity-generator-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.835, g = 0.835, b = 0.835, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "damaged-lab-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-lab-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.980, g = 0.897, b = 0.354, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-lab-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.980, g = 0.897, b = 0.354, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-lab-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.562, g = 0.562, b = 0.562, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-lab-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.485, g = 0.485, b = 0.485, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-lab-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures ({}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-lab-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.980, g = 0.897, b = 0.354, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-lab-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.980, g = 0.897, b = 0.354, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-lab-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.485, g = 0.485, b = 0.485, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-lab-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.562, g = 0.562, b = 0.562, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wall-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({tint = {r = 0.753, g = 0.718, b = 0.580, a = 1.000}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wall-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({tint = {r = 0.753, g = 0.719, b = 0.582, a = 1.000}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wall-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({tint = {r = 0.667, g = 0.636, b = 0.515, a = 1.000}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect (),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "gate-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.806, g = 0.734, b = 0.301, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "gate-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({tint = {r = 0.667, g = 0.636, b = 0.515, a = 1.000}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "gate-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.735, g = 0.735, b = 0.735, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "gate-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.496, g = 0.496, b = 0.496, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "gun-turret-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({ tint = {r = 0.490, g = 0.447, b = 0.416, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "gun-turret-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures  ({ tint = {r = 0.800, g = 0.753, b = 0.694, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    ender_layer = "object"
  },

  make_particle
  {
    name = "gun-turret-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = {r = 0.541, g = 0.494, b = 0.459, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "laser-turret-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({ tint = {r = 0.490, g = 0.447, b = 0.416, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "laser-turret-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({ tint = {r = 0.800, g = 0.753, b = 0.694, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "laser-turret-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = {r = 0.541, g = 0.494, b = 0.459, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "flame-thrower-turret-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({ tint = {r = 0.490, g = 0.447, b = 0.416, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "flame-thrower-turret-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({ tint = {r = 0.800, g = 0.753, b = 0.694, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "flame-thrower-turret-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = {r = 0.541, g = 0.494, b = 0.459, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "artillery-turret-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.905, g = 0.878, b = 0.320, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "artillery-turret-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.315, g = 0.315, b = 0.315, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "artillery-turret-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.712, g = 0.712, b = 0.712, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "radar-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.806, g = 0.703, b = 0.401, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "radar-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.835, g = 0.859, b = 0.682, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "radar-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({ tint = {r = 0.835, g = 0.859, b = 0.682, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "radar-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.834, g = 0.860, b = 0.682, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "rocket-silo-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.861, g = 0.670, b = 0.450, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "rocket-silo-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.828, g = 0.622, b = 0.539, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "rocket-silo-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.344, g = 0.344, b = 0.344, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "rocket-silo-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {r = 0.715, g = 0.715, b = 0.715, a = 1.000}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "defender-robot-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.793, g = 0.611, b = 0.449, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "defender-robot-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.772, g = 0.772, b = 0.772, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "distractor-robot-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.793, g = 0.611, b = 0.449, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "distractor-robot-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures  ({tint = {r = 0.599, g = 0.475, b = 0.403, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "destroyer-robot-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.793, g = 0.611, b = 0.449, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "destroyer-robot-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "compilatron-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.552, g = 0.452, b = 0.371, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "compilatron-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.944, g = 0.936, b = 0.895, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
  },

  make_particle
  {
    name = "metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "active-provider-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.634, g = 0.537, b = 0.657, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "active-provider-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.564, g = 0.564, b = 0.564, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect (),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "passive-provider-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.813, g = 0.424, b = 0.424, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "passive-provider-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.631, g = 0.631, b = 0.631, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer= "object"
  },

  make_particle
  {
    name = "storage-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.924, g = 0.874, b = 0.556, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "storage-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.793, g = 0.793, b = 0.793, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "buffer-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.455, g = 0.649, b = 0.404, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "buffer-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.809, g = 0.809, b = 0.809, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "requester-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.569, g = 0.816, b = 0.973, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "requester-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.726, g = 0.726, b = 0.726, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "storage-tank-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.800, g = 0.709, b = 0.624, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "storage-tank-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({ tint = {r = 0.500, g = 0.458, b = 0.420, a = 1.000}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "blood-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures({tint = bloodtint()}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    draw_shadow_when_on_ground = false,
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "higher-object-under"
  },

  make_particle
  {
    name = "blood-particle-lower-layer",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures({tint = bloodtint()}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    draw_shadow_when_on_ground = false,
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "blood-particle-carpet",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures({tint = bloodtint()}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    draw_shadow_when_on_ground = false,
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "projectile",
    render_layer_when_on_ground = "ground-patch-higher2"
  },

  make_particle
  {
    name = "spark-particle",
    life_time = 20,
    pictures = particle_animations.get_sparks_particle_pictures(),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "air-object"
  },

  make_particle
  {
    name = "pole-spark-particle",
    life_time = 20,
    pictures = particle_animations.get_pole_sparks_particle_pictures(),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "air-object"
  },

  make_particle
  {
    name = "spark-particle-debris",
    life_time = 20,
    pictures = particle_animations.get_sparks_debris_pictures(),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "air-object"
  },

  {
    type = "particle-source",
    name = "blood-fountain",
    subgroup = "particles",
    particle = "blood-particle",
    time_to_live = 10,
    time_to_live_deviation = 5,
    time_before_start = 0,
    time_before_start_deviation = 3,
    height = 0.4,
    height_deviation = 0.1,
    vertical_speed = 0.05,
    vertical_speed_deviation = 0.03,
    horizontal_speed = 0.025,
    horizontal_speed_deviation = 0.025
  },

  {
    type = "particle-source",
    name = "blood-fountain-big",
    subgroup = "particles",
    particle = "blood-particle",
    time_to_live = 30,
    time_to_live_deviation = 5,
    time_before_start = 0,
    time_before_start_deviation = 10,
    height = 0.4,
    height_deviation = 0.1,
    vertical_speed = 0.15,
    vertical_speed_deviation = 0.05,
    horizontal_speed = 0.04,
    horizontal_speed_deviation = 0.04
  },

  {
    type = "particle-source",
    name = "blood-fountain-hit-spray",
    subgroup = "particles",
    particle = "blood-particle",
    icon = "__core__/graphics/icons/mip/trash.png",
    icon_size = 32,
    time_to_live = 10,
    time_to_live_deviation = 5,
    time_before_start = 0,
    time_before_start_deviation = 0,
    height = 0.3,
    height_deviation = 0.1,
    vertical_speed = 0.02,
    vertical_speed_deviation = 0.08,
    horizontal_speed = 0.07,
    horizontal_speed_deviation = 0.04
  },

  make_particle
  {
    name = "old-leaf-particle",
    life_time = 180,
    pictures = particle_animations.get_leaf_particle_pictures(),
    shadows = particle_animations.get_leaf_particle_pictures{shift = util.by_pixel(1.5, -1), tint = shadowtint()},
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.9,
  },

  make_particle
  {
    name = "leaf-particle",
    life_time = 180,
    pictures = particle_animations.get_new_leaf_particle_pictures(),
    shadows = particle_animations.get_new_leaf_particle_pictures{shift = util.by_pixel(1.5, -1), tint = shadowtint()},
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.9
  },

  make_particle
  {
    name = "branch-particle",
    life_time = 1200,
    pictures = particle_animations.get_branch_particle_pictures(),
    shadows = particle_animations.get_branch_particle_shadow_pictures(),
    ended_in_water_trigger_effect = false,
    animation_speed = 0.1
  },

  make_particle
  {
    name = "shallow-water-droplet-particle",
    life_time = 60,
    pictures = particle_animations.get_blood_particle_pictures{tint = watertint()},
    shadows = particle_animations.get_blood_particle_pictures{shift = util.by_pixel(1.5, -1), tint = shadowtint()},
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "explosion-remnants-particle",
    pictures = particle_animations.get_explosion_remnants_pictures(),
    shadows = particle_animations.get_explosion_remnants_shadow_pictures(),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "poison-capsule-metal-particle",
    pictures = particle_animations.get_metal_particle_small_pictures({}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect =
    {
      type = "create-trivial-smoke",
      smoke_name = "poison-capsule-particle-smoke",
      starting_frame_deviation = 0,
      starting_frame_speed_deviation = 0,
      offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
      speed_from_center = nil,
    },
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
  },
  
  make_particle
  {
    name = "slowdown-capsule-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures ({ tint = { r = 0.878, g = 0.632, b = 0.155, a = 0.694 }}),         
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    render_layer_when_on_ground = "lower-object-above-shadow",
    draw_shadow_when_on_ground = true,
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0
  },
  
  make_particle
  {
    name = "slowdown-capsule-particle-big",
    life_time = 180,
    pictures = particle_animations.get_slowdown_particle_pictures ({ tint = { r = 0.878, g = 0.632, b = 0.155, a = 0.694 }}),       
    shadows = particle_animations.get_slowdown_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    render_layer_when_on_ground = "lower-object-above-shadow",
    draw_shadow_when_on_ground = true,
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0
  },

  make_particle
  {
    name = "artillery-shell-particle",
    pictures = particle_animations.get_artillery_shell_particle({}),
    shadows = particle_animations.get_artillery_shell_particle({ tint = shadowtint(), shift = util.by_pixel (2.5,-0.25)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    movement_modifier_when_on_ground = 0.85,
    render_layer_when_on_ground = "lower-object-above-shadow",
  }
}

data:extend(particles)
